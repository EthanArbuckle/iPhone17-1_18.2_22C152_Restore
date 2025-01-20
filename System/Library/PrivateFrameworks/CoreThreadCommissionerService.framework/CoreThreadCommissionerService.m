BOOL sub_100003200(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  int v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      v4 = 0;
      v5 = 0;
      v6 = 0;
      while (1)
      {
        v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          v6 = 0;
          v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        v12 = PBReaderReadString();
        v13 = 8;
LABEL_21:
        v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    v12 = PBReaderReadString();
    v13 = 16;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100003A48(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 12) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_30:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10000409C(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      char v18 = 0;
      unsigned int v19 = 0;
      uint64_t v20 = 0;
      *(unsigned char *)(a1 + 28) |= 2u;
      while (1)
      {
        unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
        v20 |= (unint64_t)(v22 & 0x7F) << v18;
        if ((v22 & 0x80) == 0) {
          goto LABEL_44;
        }
        v18 += 7;
        BOOL v9 = v19++ >= 9;
        if (v9)
        {
          LODWORD(v20) = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v20) = 0;
      }
LABEL_46:
      *(_DWORD *)(a1 + 24) = v20;
    }
    else if (v12 == 2)
    {
      v23 = objc_alloc_init(AWDHeaderInfoS);
      objc_storeStrong((id *)(a1 + 16), v23);
      if (!PBReaderPlaceMark() || !sub_100003200((uint64_t)v23, a2))
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if (v12 == 1)
    {
      char v13 = 0;
      unsigned int v14 = 0;
      uint64_t v15 = 0;
      *(unsigned char *)(a1 + 28) |= 1u;
      while (1)
      {
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0) {
          goto LABEL_40;
        }
        v13 += 7;
        BOOL v9 = v14++ >= 9;
        if (v9)
        {
          uint64_t v15 = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v15 = 0;
      }
LABEL_42:
      *(void *)(a1 + 8) = v15;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100004BA4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_45;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_47:
        *(void *)(a1 + 8) = v14;
        goto LABEL_57;
      case 2u:
        char v18 = objc_alloc_init(AWDHeaderInfoS);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (PBReaderPlaceMark() && sub_100003200((uint64_t)v18, a2))
        {
          PBReaderRecallMark();

LABEL_57:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
        while (2)
        {
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if (v23 < 0)
            {
              v19 += 7;
              BOOL v9 = v20++ >= 9;
              if (v9)
              {
                LODWORD(v21) = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v21) = 0;
        }
LABEL_51:
        uint64_t v28 = 28;
        goto LABEL_56;
      case 4u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        while (2)
        {
          unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v21 |= (unint64_t)(v27 & 0x7F) << v24;
            if (v27 < 0)
            {
              v24 += 7;
              BOOL v9 = v25++ >= 9;
              if (v9)
              {
                LODWORD(v21) = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v21) = 0;
        }
LABEL_55:
        uint64_t v28 = 24;
LABEL_56:
        *(_DWORD *)(a1 + v28) = v21;
        goto LABEL_57;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_57;
    }
  }
}

uint64_t sub_100005758(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      char v18 = objc_alloc_init(AWDCtcsReadWriteStabilityS);
      objc_storeStrong((id *)(a1 + 24), v18);
      if (!PBReaderPlaceMark() || (sub_100003A48((uint64_t)v18, a2) & 1) == 0)
      {
LABEL_41:

        return 0;
      }
    }
    else
    {
      if (v12 != 2)
      {
        if (v12 == 1)
        {
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_36;
            }
            v13 += 7;
            BOOL v9 = v14++ >= 9;
            if (v9)
            {
              uint64_t v15 = 0;
              goto LABEL_38;
            }
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
          if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v15 = 0;
          }
LABEL_38:
          *(void *)(a1 + 8) = v15;
        }
        else
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
        }
        continue;
      }
      char v18 = objc_alloc_init(AWDHeaderInfoS);
      objc_storeStrong((id *)(a1 + 16), v18);
      if (!PBReaderPlaceMark() || !sub_100003200((uint64_t)v18, a2)) {
        goto LABEL_41;
      }
    }
    PBReaderRecallMark();
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100005F08(int a1)
{
  uint64_t v1 = dword_10007D178;
  dword_10007D178 = a1;
  return v1;
}

uint64_t sub_100005F20(char a1)
{
  return (dword_10007D178 >> a1) & 1;
}

void sub_100005F34(const __CFString *a1, const void *a2)
{
}

void sub_100005F40(const __CFString *a1, const void *a2, char *cStr)
{
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFPreferencesSetAppValue(a1, a2, v5);
  if (v5)
  {
    CFRelease(v5);
  }
}

CFPropertyListRef sub_100005FBC(const __CFString *a1)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(a1, @"com.apple.threadradiodData");
  if (!result)
  {
    return CFPreferencesCopyAppValue(a1, @"/System/Library/PrivateFrameworks/CoreThreadRadio.framework/com.apple.threadradiodData.plist");
  }
  return result;
}

CFPropertyListRef sub_100006014(const __CFString *a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(a1, v3);
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

BOOL sub_100006068()
{
  return CFPreferencesAppSynchronize(@"com.apple.threadradiodData") != 0;
}

CFStringRef sub_100006090(char *cStr)
{
  CFStringRef result = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (result)
  {
    CFStringRef v2 = result;
    int v3 = CFPreferencesAppSynchronize(result);
    CFRelease(v2);
    return (const __CFString *)(v3 != 0);
  }
  return result;
}

void sub_1000060E0(char *cStr, char *__s)
{
  if (__s && strlen(__s) >= 0x65)
  {
    CFPropertyListRef v4 = sub_1000090D4(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 67109634;
      *(_DWORD *)v11 = 100;
      *(_WORD *)&v11[4] = 2080;
      *(void *)&v11[6] = cStr;
      __int16 v12 = 2080;
      char v13 = __s;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Error: Input string value length is greater than %d. For key =>  %s . string value is => \"%s\"", (uint8_t *)&v10, 0x1Cu);
    }
  }
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v6 = CFStringCreateWithCString(0, __s, 0x8000100u);
  CFStringRef v7 = v6;
  if (v5 && v6)
  {
    CFPreferencesSetAppValue(v5, v6, @"com.apple.threadradiodData");
    if (!CFPreferencesAppSynchronize(@"com.apple.threadradiodData"))
    {
      char v8 = sub_1000090D4(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        *(void *)v11 = cStr;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to Sync key: \"%s\"", (uint8_t *)&v10, 0xCu);
      }
    }
LABEL_15:
    CFRelease(v5);
    goto LABEL_16;
  }
  BOOL v9 = sub_1000090D4(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to save saveStringValue due to null input.", (uint8_t *)&v10, 2u);
  }

  if (v5) {
    goto LABEL_15;
  }
LABEL_16:
  if (v7) {
    CFRelease(v7);
  }
}

void sub_1000062D4(char *cStr)
{
  CFStringRef v2 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFPreferencesSetAppValue(v2, 0, @"com.apple.threadradiodData");
  if (!CFPreferencesAppSynchronize(@"com.apple.threadradiodData"))
  {
    int v3 = sub_1000090D4(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      CFStringRef v5 = cStr;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Failed to Sync key: \"%s\"", (uint8_t *)&v4, 0xCu);
    }
  }
  if (v2) {
    CFRelease(v2);
  }
}

BOOL sub_1000063C8(char *cStr, double a2)
{
  double valuePtr = a2;
  CFStringRef v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFStringRef v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "BOOL saveDoubleValue(const char *, double)";
    __int16 v12 = 1024;
    int v13 = 134;
    __int16 v14 = 2080;
    uint64_t v15 = cStr;
    __int16 v16 = 2112;
    CFNumberRef v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: - key = %s, v = %@", buf, 0x26u);
  }

  CFPreferencesSetAppValue(v3, v4, @"com.apple.threadradiodData");
  int v6 = CFPreferencesAppSynchronize(@"com.apple.threadradiodData");
  if (v6)
  {
    if (!v3) {
      goto LABEL_11;
    }
LABEL_10:
    CFRelease(v3);
    goto LABEL_11;
  }
  CFStringRef v7 = sub_1000090D4(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "BOOL saveDoubleValue(const char *, double)";
    __int16 v12 = 1024;
    int v13 = 139;
    __int16 v14 = 2080;
    uint64_t v15 = cStr;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: Failed to Sync key: \"%s\"", buf, 0x1Cu);
  }

  if (v3)
  {
    CFPreferencesSetAppValue(v3, 0, @"com.apple.threadradiodData");
    goto LABEL_10;
  }
LABEL_11:
  if (v4) {
    CFRelease(v4);
  }
  return v6 != 0;
}

void sub_1000065BC(char *cStr, int a2)
{
  int valuePtr = a2;
  CFStringRef v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFStringRef v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v9 = cStr;
    __int16 v10 = 2112;
    CFNumberRef v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "saveIntValue - key = %s, v = %@", buf, 0x16u);
  }

  CFPreferencesSetAppValue(v3, v4, @"com.apple.threadradiodData");
  if (!CFPreferencesAppSynchronize(@"com.apple.threadradiodData"))
  {
    int v6 = sub_1000090D4(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v9 = cStr;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Failed to Sync key: \"%s\"", buf, 0xCu);
    }
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    CFRelease(v4);
  }
}

void sub_100006738(char *cStr, uint64_t a2, char *a3)
{
  uint64_t valuePtr = a2;
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  CFStringRef v7 = sub_1000090D4(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    CFNumberRef v11 = cStr;
    __int16 v12 = 2112;
    CFNumberRef v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = valuePtr;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "saveLLIntValue - key = %s, v = %@, val = 0x%llx", buf, 0x20u);
  }

  sub_100005F40(v5, v6, a3);
  if ((sub_100006090(a3) & 1) == 0)
  {
    char v8 = sub_1000090D4(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      CFNumberRef v11 = cStr;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to Sync key: \"%s\"", buf, 0xCu);
    }
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
}

void sub_1000068C8(char *cStr, char *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  sub_100005F40(v4, 0, a2);
  if ((sub_100006090(a2) & 1) == 0)
  {
    CFStringRef v5 = sub_1000090D4(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      CFStringRef v7 = cStr;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Failed to Sync key: \"%s\"", (uint8_t *)&v6, 0xCu);
    }
  }
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t sub_1000069B8(char *cStr)
{
  CFStringRef v2 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  unsigned int valuePtr = 0;
  CFPropertyListRef v3 = sub_100005FBC(v2);
  CFStringRef v4 = sub_1000090D4(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v9 = cStr;
    __int16 v10 = 2112;
    CFPropertyListRef v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "getIntValue - key = %s, v = %@", buf, 0x16u);
  }

  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue((CFNumberRef)v3, kCFNumberIntType, &valuePtr);
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }
  return valuePtr;
}

uint64_t sub_100006AE0(char *cStr, const char *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  uint64_t valuePtr = 0;
  CFNumberRef v5 = (const __CFNumber *)sub_100006014(v4, a2);
  CFNumberRef v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID()) {
      CFNumberGetValue(v6, kCFNumberLongLongType, &valuePtr);
    }
  }
  char v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v12 = cStr;
    __int16 v13 = 2112;
    CFNumberRef v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = valuePtr;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "getLLIntValue - key = %s, v = %@, value = 0x%llx", buf, 0x20u);
  }

  if (v4) {
    CFRelease(v4);
  }
  if (v6) {
    CFRelease(v6);
  }
  return valuePtr;
}

double sub_100006C20(char *cStr)
{
  CFStringRef v2 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  double valuePtr = 0.0;
  CFNumberRef v3 = (const __CFNumber *)sub_100005FBC(v2);
  CFNumberRef v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue(v4, kCFNumberDoubleType, &valuePtr);
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  CFNumberRef v6 = sub_1000090D4(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "double getDoubleValue(const char *)";
    __int16 v11 = 1024;
    int v12 = 277;
    __int16 v13 = 2080;
    CFNumberRef v14 = cStr;
    __int16 v15 = 2048;
    double v16 = valuePtr;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d:  - key = %s, v = %f", buf, 0x26u);
  }

  return valuePtr;
}

long long *sub_100006D70(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v2 = &xmmword_10007D548;
  xmmword_10007D548 = 0u;
  unk_10007D558 = 0u;
  xmmword_10007D568 = 0u;
  unk_10007D578 = 0u;
  xmmword_10007D588 = 0u;
  unk_10007D598 = 0u;
  dword_10007D5A8 = 0;
  CFStringRef v3 = (const __CFString *)sub_100005FBC(v1);
  CFStringRef v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 != CFStringGetTypeID()))
  {
    CFStringRef v2 = 0;
    if (!v1) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!CFStringGetCString(v4, (char *)&xmmword_10007D548, 100, 0x8000100u)) {
    CFStringRef v2 = 0;
  }
  if (v1) {
LABEL_8:
  }
    CFRelease(v1);
LABEL_9:
  if (v4) {
    CFRelease(v4);
  }
  return v2;
}

void sub_100006E34(char *cStr, char *a2, int a3)
{
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v6 = (const __CFString *)sub_100005FBC(v5);
  CFStringRef v7 = v6;
  if (v6)
  {
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFStringGetTypeID())
    {
      CFStringGetCString(v7, a2, a3, 0x8000100u);
      BOOL v9 = sub_1000090D4(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        __int16 v11 = a2;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "getStringValueLocal: Read String: %s", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v7) {
    CFRelease(v7);
  }
}

uint64_t sub_100006F5C()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"Thread:StateMachine:Wed:Enabled", @"com.apple.threadradiodData", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    return AppBooleanValue != 0;
  }
  CFStringRef v1 = sub_1000090D4(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_1000544C0();
  }

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"Thread:StateMachine:Wed:Enabled", @"/System/Library/PrivateFrameworks/CoreThreadRadio.framework/com.apple.threadradiodData.plist", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    return AppBooleanValue != 0;
  }
  CFStringRef v3 = sub_1000090D4(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10005443C();
  }

  return 1;
}

BOOL sub_100007030()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableAudioNoThreadFeature", @"com.apple.threadradiodData", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v1 = AppBooleanValue;
  }
  else
  {
    CFStringRef v2 = sub_1000090D4(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000545EC();
    }

    Boolean keyExistsAndHasValidFormat = 0;
    int v1 = CFPreferencesGetAppBooleanValue(@"EnableAudioNoThreadFeature", @"/System/Library/PrivateFrameworks/CoreThreadRadio.framework/com.apple.threadradiodData.plist", &keyExistsAndHasValidFormat);
    CFStringRef v3 = sub_1000090D4(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100054544();
    }
  }
  return v1 != 0;
}

BOOL sub_100007108()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableThreadAlwaysOnFeature", @"com.apple.threadradiodData", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v1 = AppBooleanValue;
  }
  else
  {
    CFStringRef v2 = sub_1000090D4(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100054718();
    }

    Boolean keyExistsAndHasValidFormat = 0;
    int v1 = CFPreferencesGetAppBooleanValue(@"EnableThreadAlwaysOnFeature", @"/System/Library/PrivateFrameworks/CoreThreadRadio.framework/com.apple.threadradiodData.plist", &keyExistsAndHasValidFormat);
    CFStringRef v3 = sub_1000090D4(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100054670();
    }
  }
  return v1 != 0;
}

BOOL sub_1000071E0()
{
  v0 = sub_1000090D4(1);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    CFStringRef v7 = "clearThreadConfiguration";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Entered in %s", (uint8_t *)&v6, 0xCu);
  }

  CFStringRef v1 = CFStringCreateWithCString(0, "TC", 0x8000100u);
  CFStringRef v2 = CFStringCreateWithCString(0, "com.apple.threadradiodData", 0x8000100u);
  CFPreferencesSetAppValue(v1, 0, v2);
  int v3 = CFPreferencesAppSynchronize(@"com.apple.threadradiodData");
  if (!v3)
  {
    CFStringRef v4 = sub_1000090D4(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Failed to Sync \"Thread Credentials\" ", (uint8_t *)&v6, 2u);
    }
  }
  if (v1) {
    CFRelease(v1);
  }
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

void sub_100007358(int a1, uint64_t a2, const char *a3, unsigned __int8 *a4, const char *a5, int a6)
{
  __int16 valuePtr = a1;
  uint64_t v23 = a2;
  int v22 = a6;
  sub_10000A244(a4, 16, __b, 0x24uLL, 0);
  int v12 = sub_1000090D4(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = a2;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = a3;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = __b;
    *(_WORD *)&buf[38] = 2080;
    *(void *)&buf[40] = a5;
    __int16 v31 = 1024;
    int v32 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Saving TC as follows - PANID: %d, XPANID: %llu, NWName: %s, key: %s, PSKc: %s, ch = %d", buf, 0x36u);
  }

  *(_OWORD *)buf = *(_OWORD *)&off_100074830;
  *(_OWORD *)&buf[16] = *(_OWORD *)&off_100074840;
  *(_OWORD *)&buf[32] = *(_OWORD *)&off_100074850;
  values[0] = CFNumberCreate(0, kCFNumberShortType, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberLongLongType, &v23);
  values[2] = (void *)CFStringCreateWithCString(0, a3, 0x8000100u);
  values[3] = CFDataCreate(0, a4, 16);
  values[4] = (void *)CFStringCreateWithCString(0, a5, 0x8000100u);
  values[5] = CFNumberCreate(0, kCFNumberIntType, &v22);
  CFDictionaryRef v13 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buf, (const void **)values, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v14 = sub_1000090D4(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)unsigned int v25 = 138412546;
    CFDictionaryRef v26 = v13;
    __int16 v27 = 2112;
    CFDictionaryRef v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Saving TC Dict (%@): %@", v25, 0x16u);
  }

  if (v13)
  {
    CFStringRef v15 = CFStringCreateWithCString(0, "TC", 0x8000100u);
    CFStringRef v16 = CFStringCreateWithCString(0, "com.apple.threadradiodData", 0x8000100u);
    CFStringRef v17 = v16;
    if (v15 && v16)
    {
      CFPreferencesSetAppValue(v15, v13, v16);
      if (!CFPreferencesAppSynchronize(@"com.apple.threadradiodData"))
      {
        char v18 = sub_1000090D4(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)unsigned int v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Failed to Sync \"Thread Credentials\"", v25, 2u);
        }
      }
      CFRelease(v13);
    }
    else
    {
      char v19 = sub_1000090D4(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Failed to save \"Thread Credentials\"", v25, 2u);
      }

      if (!v15) {
        goto LABEL_17;
      }
    }
    CFRelease(v15);
LABEL_17:
    if (v17) {
      CFRelease(v17);
    }
  }
  for (uint64_t i = 0; i != 6; ++i)
  {
    uint64_t v21 = values[i];
    if (v21)
    {
      CFRelease(v21);
      if (values[i]) {
        CFRelease(*(CFTypeRef *)&buf[i * 8]);
      }
    }
  }
}

void sub_100007708(const char *a1, const char *a2, const char *a3, const char *a4, const char *a5, int a6)
{
  int valuePtr = a6;
  int v12 = sub_1000090D4(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = a3;
    *(_WORD *)uint64_t v23 = 2080;
    *(void *)&v23[2] = a4;
    *(_WORD *)&v23[10] = 2080;
    *(void *)&v23[12] = a5;
    __int16 v24 = 1024;
    int v25 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Saving TC as follows - PANID: %s, XPANID: %s, NWName: %s, key: %s, PSKc: %s, ch = %d", buf, 0x3Au);
  }

  *(_OWORD *)buf = *(_OWORD *)&off_100074830;
  *(_OWORD *)&buf[16] = *(_OWORD *)&off_100074840;
  *(_OWORD *)uint64_t v23 = *(_OWORD *)&off_100074850;
  values[0] = (void *)CFStringCreateWithCString(0, a1, 0x8000100u);
  values[1] = (void *)CFStringCreateWithCString(0, a2, 0x8000100u);
  values[2] = (void *)CFStringCreateWithCString(0, a3, 0x8000100u);
  values[3] = (void *)CFStringCreateWithCString(0, a4, 0x8000100u);
  values[4] = (void *)CFStringCreateWithCString(0, a5, 0x8000100u);
  values[5] = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryRef v13 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buf, (const void **)values, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v14 = sub_1000090D4(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)char v19 = 138412290;
    CFDictionaryRef v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Saving TC Dict: %@", v19, 0xCu);
  }

  if (v13)
  {
    CFPreferencesSetAppValue(@"TC", v13, @"com.apple.threadradiodData");
    if (!CFPreferencesAppSynchronize(@"com.apple.threadradiodData"))
    {
      CFStringRef v15 = sub_1000090D4(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)char v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Failed to Sync \"Thread Credentials\"", v19, 2u);
      }
    }
    CFRelease(v13);
  }
  for (uint64_t i = 0; i != 48; ++i)
  {
    CFStringRef v17 = values[i];
    if (v17)
    {
      CFRelease(v17);
      if (values[i]) {
        CFRelease(*(CFTypeRef *)&buf[i * 8]);
      }
    }
  }
}

void sub_1000079E8(const __CFDictionary *a1, const char *a2, char *a3, int a4)
{
  value = 0;
  CFStringRef v7 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFDictionaryGetValueIfPresent(a1, v7, (const void **)&value);
  if (value)
  {
    CFTypeID v8 = CFGetTypeID(value);
    if (v8 == CFStringGetTypeID())
    {
      CFStringGetCString((CFStringRef)value, a3, a4, 0x8000100u);
      BOOL v9 = sub_1000090D4(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        int v12 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Read String: %s", buf, 0xCu);
      }
    }
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_100007B08(const __CFDictionary *a1, const char *a2, unsigned __int16 a3)
{
  unsigned __int16 valuePtr = a3;
  CFTypeRef cf = 0;
  CFStringRef v4 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFDictionaryGetValueIfPresent(a1, v4, &cf);
  if (cf)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberShortType, &valuePtr);
      int v6 = sub_1000090D4(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v10 = valuePtr;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Read value: %d", buf, 8u);
      }
    }
  }
  if (v4) {
    CFRelease(v4);
  }
}

void sub_100007C18(const __CFDictionary *a1, const char *a2, uint64_t a3)
{
  CFTypeRef cf = 0;
  uint64_t valuePtr = a3;
  CFStringRef v4 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFDictionaryGetValueIfPresent(a1, v4, &cf);
  if (cf)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberLongLongType, &valuePtr);
      int v6 = sub_1000090D4(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v10 = valuePtr;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Read long long value: %llu", buf, 0xCu);
      }
    }
  }
  if (v4) {
    CFRelease(v4);
  }
}

void sub_100007D24(const __CFDictionary *a1, const char *a2, UInt8 *a3, unsigned int a4)
{
  value = 0;
  CFStringRef v7 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFDictionaryGetValueIfPresent(a1, v7, (const void **)&value);
  if (value)
  {
    CFTypeID v8 = CFGetTypeID(value);
    if (v8 == CFDataGetTypeID())
    {
      uint64_t v9 = a4;
      v18.location = 0;
      v18.length = a4;
      CFDataGetBytes((CFDataRef)value, v18, a3);
      __chkstk_darwin();
      __int16 v11 = (char *)&v14 - v10;
      sub_10000A244(a3, v9, (char *)&v14 - v10, v12, 0);
      CFDictionaryRef v13 = sub_1000090D4(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        CFStringRef v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Read Data value: %s", buf, 0xCu);
      }
    }
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_100007E98(uint64_t a1@<X8>)
{
  CFStringRef v2 = CFStringCreateWithCString(0, "TC", 0x8000100u);
  CFStringRef v3 = CFStringCreateWithCString(0, "com.apple.threadradiodData", 0x8000100u);
  CFDictionaryRef v4 = (const __CFDictionary *)CFPreferencesCopyAppValue(v2, v3);
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1 + 304) = 0;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  CFTypeID v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    CFDictionaryRef v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Read TC Dict: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      sub_1000079E8(v4, "networkName", (char *)(a1 + 16), 256);
      sub_1000079E8(v4, "PSKc", (char *)(a1 + 288), 16);
      sub_100007B08(v4, "channel", *(_WORD *)(a1 + 304));
      sub_100007B08(v4, "panid", *(_WORD *)a1);
      sub_100007C18(v4, "xpanid", *(void *)(a1 + 8));
      sub_100007D24(v4, "masterKey", (UInt8 *)(a1 + 272), 0x10u);
    }
    CFRelease(v4);
  }
}

BOOL sub_100008080(uint64_t a1, uint64_t a2, std::string *a3)
{
  memset(&v23, 0, sizeof(v23));
  int v6 = *(char *)(a1 + 23);
  if (v6 >= 0) {
    int v7 = (const std::string::value_type *)a1;
  }
  else {
    int v7 = *(const std::string::value_type **)a1;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a1 + 8);
  }
  std::string::append(&v23, v7, v8);
  int v9 = *(char *)(a2 + 23);
  if (v9 >= 0) {
    uint64_t v10 = (const std::string::value_type *)a2;
  }
  else {
    uint64_t v10 = *(const std::string::value_type **)a2;
  }
  if (v9 >= 0) {
    std::string::size_type v11 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v11 = *(void *)(a2 + 8);
  }
  std::string::append(&v23, v10, v11);
  unint64_t v12 = sub_1000090D4(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (*(char *)(a2 + 23) >= 0) {
      CFDictionaryRef v13 = (void *)a2;
    }
    else {
      CFDictionaryRef v13 = *(void **)a2;
    }
    if (*(char *)(a1 + 23) >= 0) {
      uint64_t v14 = (std::string *)a1;
    }
    else {
      uint64_t v14 = *(std::string **)a1;
    }
    CFStringRef v15 = &v23;
    if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      CFStringRef v15 = (std::string *)v23.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315906;
    int v25 = "getCommissionerPassPhrase";
    __int16 v26 = 2080;
    __int16 v27 = v13;
    __int16 v28 = 2080;
    v29 = v14;
    __int16 v30 = 2080;
    __int16 v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s : parameters - XPANID: %s, NWName: %s and key : %s", buf, 0x2Au);
  }

  if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    CFStringRef v16 = &v23;
  }
  else {
    CFStringRef v16 = (std::string *)v23.__r_.__value_.__r.__words[0];
  }
  CFStringRef v17 = sub_100006D70((char *)v16);
  if (v17)
  {
    CFRange v18 = sub_1000090D4(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      char v19 = &v23;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        char v19 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315650;
      int v25 = "getCommissionerPassPhrase";
      __int16 v26 = 2080;
      __int16 v27 = v17;
      __int16 v28 = 2080;
      v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s : Value found %s, key is %s ", buf, 0x20u);
    }

    std::string::append(a3, (const std::string::value_type *)v17);
  }
  else
  {
    CFDictionaryRef v20 = sub_1000090D4(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = &v23;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v21 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315394;
      int v25 = "getCommissionerPassPhrase";
      __int16 v26 = 2080;
      __int16 v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s : Value not found, key is %s ", buf, 0x16u);
    }
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  return v17 != 0;
}

void sub_100008320(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008354(const std::string::value_type *a1, const std::string::value_type *a2, char *a3)
{
  memset(&v8, 0, sizeof(v8));
  std::string::append(&v8, a2);
  std::string::append(&v8, a1);
  CFTypeID v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = &v8;
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      int v6 = (std::string *)v8.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "saveCommissionPassPhrasesAsString";
    __int16 v11 = 2080;
    unint64_t v12 = v6;
    __int16 v13 = 2080;
    uint64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s : Saving Credentials string as follows key: %s, PassPhrase : %s", buf, 0x20u);
  }

  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v7 = &v8;
  }
  else {
    int v7 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  sub_1000060E0((char *)v7, a3);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_100008478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
}

BOOL sub_1000084A0()
{
  CFArrayRef v13 = CFPreferencesCopyKeyList(@"com.apple.threadradiodData", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  v0 = sub_1000090D4(1);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v19 = "removekeyEntryFromPlist";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s: Copied KeyList", buf, 0xCu);
  }

  if (v13)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFArrayRef v1 = v13;
    id v2 = [(__CFArray *)v1 countByEnumeratingWithState:&v14 objects:v22 count:16];
    CFStringRef v3 = v1;
    if (v2)
    {
      unsigned __int8 v4 = 0;
      uint64_t v5 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v1);
          }
          int v7 = *(__CFString **)(*((void *)&v14 + 1) + 8 * i);
          if ([(__CFString *)v7 containsString:@"MyHome"])
          {
            CFPreferencesSetAppValue(v7, 0, @"com.apple.threadradiodData");
            std::string v8 = sub_1000090D4(1);
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              int v9 = (const char *)[(__CFString *)v7 UTF8String];
              *(_DWORD *)buf = 136315394;
              char v19 = "removekeyEntryFromPlist";
              __int16 v20 = 2080;
              uint64_t v21 = v9;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: Deleted key =>  %s", buf, 0x16u);
            }
          }
          else if (v4)
          {
            unsigned __int8 v4 = 1;
          }
          else
          {
            unsigned __int8 v4 = [(__CFString *)v7 isEqualToString:@"TC"];
          }
        }
        id v2 = [(__CFArray *)v1 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v2);

      if ((v4 & 1) == 0)
      {
LABEL_22:
        uint64_t v10 = sub_1000090D4(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          char v19 = "removekeyEntryFromPlist";
          __int16 v11 = "%s: function end. ";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
          goto LABEL_27;
        }
        goto LABEL_27;
      }
      CFPreferencesSetAppValue(@"TC", 0, @"com.apple.threadradiodData");
      CFStringRef v3 = sub_1000090D4(1);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        char v19 = "removekeyEntryFromPlist";
        __int16 v20 = 2080;
        uint64_t v21 = "TC";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: Deleted key =>  %s", buf, 0x16u);
      }
    }

    goto LABEL_22;
  }
  uint64_t v10 = sub_1000090D4(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v19 = "removekeyEntryFromPlist";
    __int16 v11 = "%s: Couldn't copy plist in NSArray object";
    goto LABEL_26;
  }
LABEL_27:

  return v13 != 0;
}

void sub_100008844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008894(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000088DC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

uint64_t sub_1000088FC()
{
  *(void *)int v7 = 0x1500000001;
  size_t v5 = 16;
  gettimeofday(&v4, &v3);
  int v0 = sysctl(v7, 2u, &v6, &v5, 0, 0);
  if (v6) {
    BOOL v1 = v0 == -1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return -1;
  }
  else {
    return v4.tv_sec - v6;
  }
}

uint64_t sub_10000899C()
{
  return gettimeofday((timeval *)&qword_10007D5B0, &unk_10007D5C0);
}

__darwin_time_t sub_1000089B0()
{
  gettimeofday(&v3, &v2);
  if (v3.tv_sec) {
    BOOL v0 = qword_10007D5B0 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0) {
    return -1;
  }
  else {
    return v3.tv_sec - qword_10007D5B0;
  }
}

void sub_100008A48(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  qword_10007D5D0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_100008BD8(id a1)
{
  uint64_t v11 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  qword_10007D5E0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_100009074(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CTCSXPCServiceProtocol];
  uint64_t v2 = (void *)qword_10007D5E8;
  qword_10007D5E8 = v1;

  uint64_t v3 = qword_10007D5E8;

  +[XPCInterface CTCSSetExpectedClassesForXPCBrokerInterface:v3];
}

id sub_1000090D4(int a1)
{
  if (qword_10007D608 != -1) {
    dispatch_once(&qword_10007D608, &stru_1000748E0);
  }
  uint64_t v2 = (void *)qword_10007D5F8[a1];

  return v2;
}

void sub_100009138(id a1)
{
  os_log_t v1 = os_log_create("com.apple.ThreadNetwork", "THClient");
  uint64_t v2 = (void *)qword_10007D5F8[0];
  qword_10007D5F8[0] = (uint64_t)v1;

  qword_10007D600 = (uint64_t)os_log_create("com.apple.ThreadNetwork", "THServer");

  _objc_release_x1();
}

uint64_t start()
{
  BOOL v0 = sub_1000090D4(1);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Enter Main", buf, 2u);
  }

  uint64_t v2 = objc_alloc_init(CTCSXPCService);
  if (!v2) {
    sub_10005479C();
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_1000090D4(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "In Main", v8, 2u);
  }

  [(CTCSXPCService *)v3 run];
  CFRunLoopRun();

  uint64_t v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Exit Main", v7, 2u);
  }

  return 1;
}

void sub_100009364(id a1)
{
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswer();
  if (v1)
  {
    CFBooleanRef v2 = v1;
    int Value = CFBooleanGetValue(v1);
    byte_10007D610 = Value != 0;
    uint64_t v4 = sub_1000090D4(1);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (Value)
    {
      if (v5)
      {
        int v9 = 136315650;
        uint64_t v10 = "-[CTCSUtils ctcsCheckIfUIBuild]_block_invoke";
        __int16 v11 = 2112;
        CFBooleanRef v12 = v2;
        __int16 v13 = 1024;
        int v14 = byte_10007D610;
        uint64_t v6 = "%s : UI Build is installed, uiBuildRef : %@, uiBuild %d";
        uint64_t v7 = v4;
        uint32_t v8 = 28;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v9, v8);
      }
    }
    else if (v5)
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CTCSUtils ctcsCheckIfUIBuild]_block_invoke";
      uint64_t v6 = "%s : NON UI Build is installed";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
      goto LABEL_7;
    }

    CFRelease(v2);
  }
}

void sub_100009AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009AD4(uint64_t a1)
{
  CFBooleanRef v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  BOOL v5 = sub_1000090D4(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 105;
    __int16 v10 = 2048;
    double v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Self heal thread network timer triggered : Timer Triggered timestamp :%f", (uint8_t *)&v6, 0x1Cu);
  }

  if (v4 > 1657720000.0 && sub_1000063C8("SelfHealTimeStamp", v4)) {
    [*(id *)(a1 + 32) selfHealThreadNetworkTimerHandler];
  }
}

void sub_100009BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009F44(id a1, NSError *a2)
{
  CFBooleanRef v2 = a2;
  if (v2)
  {
    double v3 = sub_1000090D4(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000549E8();
    }
  }
  else
  {
    double v3 = sub_1000090D4(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315394;
      BOOL v5 = "-[ThreadNetworkManagerSelfHealHandler cleanUpThreadKeychainEntries]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 159;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:  Cleaned up the keychain database successfully.", (uint8_t *)&v4, 0x12u);
    }
  }
}

void sub_10000A03C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned char *sub_10000A0D4(unsigned char *result, uint64_t a2, uint64_t a3)
{
    *result++ = *(unsigned char *)(a2 - 1 + a3);
  return result;
}

uint64_t sub_10000A0F0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a3) {
    return 0;
  }
  unint64_t v3 = 0;
  int v4 = (unsigned __int8 *)(a3 + a2 - 1);
  do
  {
    int v5 = *v4--;
    uint64_t v6 = *(unsigned __int8 *)(a1 + v3++) - v5;
  }
  while (v3 < a3 && !v6);
  return v6;
}

char *sub_10000A12C(char *result, unint64_t a2)
{
  if (a2 >= 2)
  {
    unint64_t v2 = a2 >> 1;
    unint64_t v3 = &result[a2 - 1];
    do
    {
      char v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_10000A15C(unsigned char *a1, uint64_t a2, unsigned char *a3)
{
  char v3 = *a3;
  if (*a3) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && a2 != 0)
  {
    uint64_t v6 = a3;
    uint64_t v7 = a2;
    __int16 v8 = a1;
    uint64_t v9 = 0;
    while (1)
    {
      __int16 v10 = v6 + 1;
      __darwin_ct_rune_t v11 = __tolower(v3);
      if ((v11 - 48) < 0xA || (v11 - 97) <= 5)
      {
        if ((v11 - 48) >= 0xA) {
          char v13 = v11 + 9;
        }
        else {
          char v13 = v11;
        }
        *__int16 v8 = 16 * v13;
        uint64_t v9 = (v9 + 1);
        __darwin_ct_rune_t v14 = (char)*v10;
        if (!*v10) {
          return v9;
        }
        --v7;
        __int16 v10 = v6 + 2;
        __darwin_ct_rune_t v15 = __tolower(v14);
        unsigned int v16 = v15 - 48;
        if ((v15 - 48) < 0xA || (v15 - 97) <= 5)
        {
          if (v16 >= 0xA) {
            LOBYTE(v16) = v15 - 87;
          }
          *v8++ |= v16;
        }
      }
      char v3 = *v10;
      if (*v10) {
        BOOL v18 = v7 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      uint64_t v6 = v10;
      if (v18) {
        return v9;
      }
    }
  }
  return 0;
}

uint64_t sub_10000A244(unsigned __int8 *a1, uint64_t a2, char *__b, unint64_t a4, int a5)
{
  uint64_t v6 = 0;
  if (a2 && a4 >= 3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = a2 - 1;
    do
    {
      unsigned int v9 = *a1++;
      --a5;
      *__b = a0123456789abcd[(unint64_t)v9 >> 4];
      __int16 v10 = __b + 2;
      __b[1] = a0123456789abcd[v9 & 0xF];
      v7 -= 2;
      if (v8-- == 0) {
        break;
      }
      __b += 2;
    }
    while (v7 + a4 > 2);
    uint64_t v6 = -(int)v7;
    a4 += v7;
    __b = v10;
  }
  if (a5 >= 1 && a4 >= 3)
  {
    if ((a4 - 3) >> 1 >= (a5 - 1)) {
      unint64_t v12 = (a5 - 1);
    }
    else {
      unint64_t v12 = (a4 - 3) >> 1;
    }
    memset(__b, 48, 2 * v12 + 2);
    __b += 2 * v12 + 2;
    uint64_t v6 = (v6 + 2 * v12 + 2);
  }
  *__b = 0;
  return v6;
}

unint64_t sub_10000A320(const char *a1)
{
  unsigned int v1 = *a1 - 70;
  if (v1 < 0x34 && ((0x8410100084101uLL >> v1) & 1) != 0) {
    return (0xFFEFEFFFFFEFEuLL >> v1) & 1;
  }
  else {
    return strtol(a1, 0, 0) != 0;
  }
}

uint64_t sub_10000A384(const char *a1)
{
  unsigned int v1 = strdup(a1);
  unint64_t v2 = strtok(v1, ",");
  if (v2)
  {
    char v3 = v2;
    LODWORD(v4) = 0;
    do
    {
      int v5 = strchr(v3, 45);
      if (v5)
      {
        *int v5 = 0;
        uint64_t v6 = v5 + 1;
        int v7 = atoi(v3);
        int v8 = atoi(v6);
        int v9 = 0;
        if (v7 <= v8) {
          int v10 = v8;
        }
        else {
          int v10 = v7;
        }
        if (v7 >= v8) {
          unsigned int v11 = v8;
        }
        else {
          unsigned int v11 = v7;
        }
        unsigned int v12 = v10 - v11;
        unsigned int v13 = (v10 - v11 + 4) & 0xFFFFFFFC;
        uint32x4_t v14 = (uint32x4_t)vdupq_n_s32(v12);
        int8x16_t v15 = (int8x16_t)v4;
        int32x4_t v16 = vaddq_s32(vdupq_n_s32(v11), (int32x4_t)xmmword_100068DD0);
        v17.i64[0] = 0x100000001;
        v17.i64[1] = 0x100000001;
        v18.i64[0] = 0x400000004;
        v18.i64[1] = 0x400000004;
        do
        {
          int8x16_t v19 = v15;
          int8x16_t v15 = vorrq_s8(v15, (int8x16_t)vshlq_u32(v17, (uint32x4_t)v16));
          v9 += 4;
          int32x4_t v16 = vaddq_s32(v16, v18);
        }
        while (v13 != v9);
        int8x16_t v20 = vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v9 - 4), (int8x16_t)xmmword_100068DD0), v14), v19, v15);
        int8x8_t v21 = vorr_s8(*(int8x8_t *)v20.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL));
        uint64_t v4 = (v21.i32[0] | v21.i32[1]);
      }
      else
      {
        uint64_t v4 = (1 << strtol(v3, 0, 0)) | v4;
      }
      char v3 = strtok(0, ",");
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  free(v1);
  return v4;
}

uint64_t sub_10000A4E4(const char *a1, uint64_t a2)
{
  uint64_t result = strtol(a1, 0, 0);
  if (!result)
  {
    if (strcasestr(a1, "all"))
    {
      if (strcasestr(a1, "-all")) {
        a2 = 0;
      }
      else {
        a2 = 0xFFFFFFFFLL;
      }
    }
    if (strcasestr(a1, "emerg"))
    {
      if (strcasestr(a1, "-emerg")) {
        a2 = a2 & 0xFFFFFFFE;
      }
      else {
        a2 = a2 | 1;
      }
    }
    if (strcasestr(a1, "alert"))
    {
      if (strcasestr(a1, "-alert")) {
        a2 = a2 & 0xFFFFFFFD;
      }
      else {
        a2 = a2 | 2;
      }
    }
    if (strcasestr(a1, "crit"))
    {
      if (strcasestr(a1, "-crit")) {
        a2 = a2 & 0xFFFFFFFB;
      }
      else {
        a2 = a2 | 4;
      }
    }
    if (strcasestr(a1, "err"))
    {
      if (strcasestr(a1, "-err")) {
        a2 = a2 & 0xFFFFFFF7;
      }
      else {
        a2 = a2 | 8;
      }
    }
    if (strcasestr(a1, "warn"))
    {
      if (strcasestr(a1, "-warn")) {
        a2 = a2 & 0xFFFFFFEF;
      }
      else {
        a2 = a2 | 0x10;
      }
    }
    if (strcasestr(a1, "notice"))
    {
      if (strcasestr(a1, "-notice")) {
        a2 = a2 & 0xFFFFFFDF;
      }
      else {
        a2 = a2 | 0x20;
      }
    }
    if (strcasestr(a1, "info"))
    {
      if (strcasestr(a1, "-info")) {
        a2 = a2 & 0xFFFFFFBF;
      }
      else {
        a2 = a2 | 0x40;
      }
    }
    if (strcasestr(a1, "debug"))
    {
      if (strcasestr(a1, "-debug")) {
        return a2 & 0xFFFFFF7F;
      }
      else {
        return a2 | 0x80;
      }
    }
    else
    {
      return a2;
    }
  }
  return result;
}

BOOL sub_10000A6F0(unsigned __int8 *a1, uint64_t a2)
{
  do
  {
    uint64_t v2 = a2;
    if (a2-- == 0) {
      break;
    }
  }
  while (!*a1++);
  return v2 != 0;
}

BOOL sub_10000A710(unsigned __int8 *a1, uint64_t a2)
{
  do
  {
    uint64_t v2 = a2;
    if (!a2) {
      break;
    }
    --a2;
    int v3 = *a1++;
  }
  while ((_DefaultRuneLocale.__runetype[v3] & 0x10000) != 0);
  return v2 == 0;
}

uint64_t sub_10000A740(char *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v3 = a2 - 1;
  do
  {
    int v4 = *a1;
    if (*a1 < 0) {
      __uint32_t v5 = __maskrune(*a1, 0x8000uLL);
    }
    else {
      __uint32_t v5 = _DefaultRuneLocale.__runetype[*a1] & 0x8000;
    }
    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = (v4 - 48) >= 0xA;
    }
    uint64_t result = !v6;
    BOOL v6 = v3-- != 0;
    char v8 = v6;
    if (result != 1) {
      break;
    }
    ++a1;
  }
  while ((v8 & 1) != 0);
  return result;
}

void sub_10000A934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000AB24()
{
  if (qword_10007D628 != -1) {
    dispatch_once(&qword_10007D628, &stru_1000749E0);
  }
  BOOL v0 = (void *)qword_10007D620;

  return v0;
}

void sub_10000AC9C(void *a1)
{
}

void sub_10000ACA4(uint64_t a1)
{
  unsigned int v1 = [*(id *)(a1 + 32) listener];
  [v1 resume];

  uint64_t v2 = sub_1000090D4(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    int v4 = "-[CTCSXPCService run]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Server: %s - CTCS XPC Service resume done", (uint8_t *)&v3, 0xCu);
  }
}

void sub_10000AD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B17C(id a1)
{
  unsigned int v1 = sub_1000090D4(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100054A7C(v1);
  }
}

void sub_10000B1C4(id a1)
{
  unsigned int v1 = sub_1000090D4(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100054B00(v1);
  }
}

void sub_10000B20C(id a1)
{
  int v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("CTCS Service XPC Listener Queue", v3);
  uint64_t v2 = (void *)qword_10007D620;
  qword_10007D620 = (uint64_t)v1;
}

void sub_10000B274(void *a1, int a2)
{
  block = a1;
  if (qword_10007D630 != -1) {
    dispatch_once(&qword_10007D630, &stru_100074A00);
  }
  if (dispatch_get_specific(off_10007D1E0))
  {
    block[2]();
  }
  else
  {
    int v3 = sub_10000AB24();
    int v4 = v3;
    if (a2) {
      dispatch_sync(v3, block);
    }
    else {
      dispatch_async(v3, block);
    }
  }
}

void sub_10000B32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B340(void *a1)
{
}

void sub_10000B348(id a1)
{
  dispatch_queue_t v1 = sub_10000AB24();
  dispatch_queue_set_specific(v1, off_10007D1E0, off_10007D1E0, 0);
}

void sub_10000B59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BDD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000BFF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C1BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C6D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_10000C7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C9D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CAB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000CEA4(uint64_t a1)
{
  id v2 = +[NSError storeError:4 description:@"Invalid parameter sent for delete operation to server..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000CF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CF28(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000CF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CFAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) awdPostStabilityMetrics:2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000D014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D294(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve all records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D31C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5) {
    [*(id *)(a1 + 32) awdPostStabilityMetrics:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000D398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10000D5C0(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve all records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D648(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5) {
    [*(id *)(a1 + 32) awdPostStabilityMetrics:3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000D6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000DA4C(uint64_t a1)
{
  id v2 = +[NSError storeError:4 description:@"Invalid parameter sent to server..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000DAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DAD4(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000DB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DB5C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000DC94;
    v12[3] = &unk_100074AF0;
    uint64_t v11 = *(void *)(a1 + 48);
    v12[4] = *(void *)(a1 + 56);
    id v13 = v9;
    id v14 = *(id *)(a1 + 64);
    [v13 storeThreadNetworkCredentialActiveDataSet:v10 network:v7 credentialsDataSet:v11 waitForSync:0 completion:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_10000DC68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DC94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) awdPostStabilityMetrics:6];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000DD78;
    v8[3] = &unk_100074AC8;
    id v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    [v7 retrieveThirdPartyInfo:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000DD60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136316162;
    uint64_t v10 = "-[CTCSXPCService ctcsServerStoreThreadNetworkCredentialActiveDataSet:credentialsDataSet:completion:]_block_invoke_5";
    __int16 v11 = 1024;
    int v12 = 567;
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    __int16 v15 = 2048;
    uint64_t v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d:  numThirdPartyBRs : %lu numPrefNwByThirdPartyBRs : %lu numPrefNwByAppleBRs : %lu \n", (uint8_t *)&v9, 0x30u);
  }

  if (!a4)
  {
    [*(id *)(a1 + 32) awdPostNumThirdPartyBRs:a2];
    [*(id *)(a1 + 32) awdPostPreferrdNwInfo:a3 numPrefNwsByAppleBRs:0];
  }
}

void sub_10000E810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v76 - 224), 8);

  _Block_object_dispose((const void *)(v76 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E92C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E93C(uint64_t a1)
{
}

void sub_10000E944(uint64_t a1)
{
  id v2 = +[NSError storeError:21 description:@"Failed to get current network connection"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E9CC(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve Preferred Network record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EA54(uint64_t a1)
{
  id v2 = +[NSError storeError:26 description:@"Error : Unable to get bundle identifier"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EADC(uint64_t a1)
{
  id v2 = sub_1000090D4(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100055108();
  }

  id v3 = +[NSError storeError:22 description:@"Error : Application record not found"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EB74(uint64_t a1)
{
  id v2 = +[NSError storeError:23 description:@"Error : Missing Application Localized Name"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EBFC(uint64_t a1)
{
  id v2 = +[NSError storeError:25 description:@"Error : Unable to format Application UI Alert Message"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EC84(uint64_t a1)
{
  id v2 = +[NSError storeError:24 description:@"Error : Missing Application UI Alert Usage Description"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000ECF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000ED0C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7) {
    [*(id *)(a1 + 32) awdPostStabilityMetrics:4];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store ...\n", v18, 2u);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    goto LABEL_9;
  }
  int v9 = sub_1000090D4(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100055184(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  if (([*(id *)(a1 + 32) takeUserPermission:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) userDescription:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)] & 1) == 0)
  {
    __int16 v17 = +[NSError storeError:15 description:@"User denied the access"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000EE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v72 - 224), 8);
  _Block_object_dispose((const void *)(v72 - 176), 8);

  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void sub_10000F938(uint64_t a1)
{
  id v2 = +[NSError storeError:21 description:@"Failed to get current network connection"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F9C0(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve Preferred Network record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FA48(uint64_t a1)
{
  id v2 = +[NSError storeError:26 description:@"Error : Unable to get bundle identifier"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FAD0(uint64_t a1)
{
  id v2 = sub_1000090D4(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000551BC();
  }

  id v3 = +[NSError storeError:22 description:@"Error : Application record not found"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FB68(uint64_t a1)
{
  id v2 = +[NSError storeError:23 description:@"Error : Missing Application Localized Name"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FBF0(uint64_t a1)
{
  id v2 = +[NSError storeError:25 description:@"Error : Unable to format Application UI Alert Message"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FC78(uint64_t a1)
{
  id v2 = +[NSError storeError:24 description:@"Error : Missing Application UI Alert Usage Description"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FD00(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7) {
    [*(id *)(a1 + 32) awdPostStabilityMetrics:5];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store ...\n", buf, 2u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    int v9 = sub_1000090D4(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Server: Check for User Permission ...\n", v11, 2u);
    }

    if ([*(id *)(a1 + 32) takeUserPermission:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) userDescription:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v10 = +[NSError storeError:15 description:@"User denied the access"];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000FEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001016C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000101AC(uint64_t a1)
{
  id v2 = sub_1000090D4(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100055238();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001020C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100010220(uint64_t a1, int a2)
{
  int v4 = sub_1000090D4(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[CTCSXPCService ctcsIsPreferredNetworkForActiveOperationalDataset:completion:]_block_invoke_2";
    __int16 v8 = 1024;
    int v9 = 842;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Server: %s:%d: Got response from Store isPreferred: %d", (uint8_t *)&v6, 0x18u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000104D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010518(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001052C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  __int16 v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store, error : %@\n", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0);
}

void sub_100010630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100010860(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve Preferred Network record internally ; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000108D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000108E8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  __int16 v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store ...\n", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000109C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100010BE8(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve Preferred Network record internally ; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010C70(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  __int16 v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store ...\n", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100010F70(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve Preferred Network record internally ; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010FF8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  __int16 v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store ...\n", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000110D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000113C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_10001142C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve Preferred Network record internally ; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000114A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000114B4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  __int16 v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store ...\n", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001158C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001175C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10001178C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000117FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100011810(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000119AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_100011C34(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011CBC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7) {
    [*(id *)(a1 + 32) awdPostStabilityMetrics:4];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  __int16 v8 = sub_1000090D4(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Server: Got response from Store ...\n", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100012070(uint64_t a1)
{
  id v2 = +[NSError storeError:4 description:@"Invalid parameter sent to server..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000120E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000120F8(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001216C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100012180(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000123AC(uint64_t a1)
{
  id v2 = +[NSError storeError:4 description:@"Invalid parameter sent to server..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012434(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000124A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000124BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001275C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10001279C(uint64_t a1)
{
  id v2 = +[NSError storeError:27 description:@"Not An Internal Install"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012824(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000128AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Block_object_dispose((const void *)(v16 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100012BB8(uint64_t a1)
{
  id v2 = +[NSError storeError:27 description:@"Not An Internal Install"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012C40(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve all records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012CC8(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100013000(uint64_t a1)
{
  id v2 = +[NSError storeError:27 description:@"Not An Internal Install"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013084(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000130F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10001338C(uint64_t a1)
{
  id v2 = +[NSError storeError:27 description:@"Not An Internal Install"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000133FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013410(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013494(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000136E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100013718(uint64_t a1)
{
  id v2 = +[NSError storeError:27 description:@"Not An Internal Install"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001379C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001380C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013820(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100013BC8(uint64_t a1)
{
  id v2 = +[NSError storeError:27 description:@"Not An Internal Install"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013C4C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013CD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100013FAC(uint64_t a1)
{
  id v2 = +[NSError storeError:27 description:@"Not An Internal Install"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001401C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014030(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Backing store is nil..."];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000140A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000140B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014164(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100014180(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_1000142FC(uint64_t result)
{
  *(_WORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_WORD *)(*(void *)(result + 32) + 8);
  return result;
}

uint64_t sub_100014388(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 8) = *(_WORD *)(result + 40);
  return result;
}

id sub_100014A6C(void *a1)
{
  if (a1)
  {
    dispatch_queue_t v1 = [a1 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v2 = sub_10001CCA0(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000151BC();
    }

    dispatch_queue_t v1 = 0;
  }

  return v1;
}

void sub_100014FC4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : %d : Unable to decode dataSet", v2, v3, v4, v5, v6);
}

void sub_100015040()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode THThreadNetworkCredentialsDataSet!", v2, v3, v4, v5, v6);
}

void sub_1000150BC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[THFrozenThreadNetwork(Keychain) keyChainItemRepresentationForFrozenThreadNetworkAddOperation]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Error: unable to form add operation due to missing data", (uint8_t *)&v1, 0xCu);
}

void sub_100015140()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : %d : Can not create frozen thread network keychain item with insufficient information ", v2, v3, v4, v5, v6);
}

void sub_1000151BC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode data field!", v2, v3, v4, v5, v6);
}

uint64_t spinel_packed_uint_decode(char *a1, int a2, _DWORD *a3)
{
  LODWORD(v3) = 0;
  int v4 = 0;
  unsigned int v5 = 0;
  while (1)
  {
    uint64_t v6 = 0xFFFFFFFFLL;
    if (!a2 || v5 > 0x1F) {
      break;
    }
    char v7 = *a1++;
    v4 |= (v7 & 0x7F) << v5;
    v5 += 7;
    uint64_t v3 = (int)v3 + 1;
    --a2;
    if ((v7 & 0x80) == 0)
    {
      if (a3 && (int)v3 >= 1) {
        *a3 = v4;
      }
      return v3;
    }
  }
  return v6;
}

uint64_t spinel_packed_uint_size(unsigned int a1)
{
  if (a1 >> 28) {
    int v1 = 5;
  }
  else {
    int v1 = 4;
  }
  if (a1 >= 0x200000) {
    int v2 = v1;
  }
  else {
    int v2 = 3;
  }
  if (a1 >= 0x4000) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 2;
  }
  if (a1 >= 0x80) {
    return v3;
  }
  else {
    return 1;
  }
}

uint64_t spinel_packed_uint_encode(unsigned char *a1, int a2, unsigned int a3)
{
  if (a3 >> 28) {
    int v3 = 5;
  }
  else {
    int v3 = 4;
  }
  if (a3 >= 0x200000) {
    int v4 = v3;
  }
  else {
    int v4 = 3;
  }
  if (a3 >= 0x4000) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 2;
  }
  if (a3 >= 0x80) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 1;
  }
  if ((int)v6 <= a2)
  {
    int v7 = v6 - 1;
    if (v6 != 1)
    {
      do
      {
        *a1++ = a3 | 0x80;
        a3 >>= 7;
        --v7;
      }
      while (v7);
    }
    *a1 = a3 & 0x7F;
  }
  return v6;
}

unsigned __int8 *spinel_next_packed_datatype(unsigned __int8 *result)
{
  int v1 = result;
  int v2 = 0;
  do
  {
    int v4 = (char)*++result;
    int v3 = v4;
    if (v4 == 41)
    {
      --v2;
      uint64_t v6 = v1 + 2;
      if (!v2) {
        uint64_t result = v6;
      }
    }
    else if (v3 == 40)
    {
      int v5 = 40;
      ++v2;
      goto LABEL_9;
    }
    if (v2 < 1) {
      return result;
    }
    int v5 = *result;
LABEL_9:
    int v1 = result;
  }
  while (v5);
  return result;
}

uint64_t spinel_datatype_unpack_in_place(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = (uint64_t **)&a9;
  return sub_100015444(1, a1, a2, a3, &v10, a6, a7, a8);
}

uint64_t sub_100015444(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t ***a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 >> 15)
  {
LABEL_147:
    v77 = __error();
    int v78 = 22;
    goto LABEL_148;
  }
  uint64_t v9 = (unsigned __int8 *)a4;
  uint64_t v10 = a3;
  uint64_t v13 = 0;
LABEL_3:
  int v14 = *v9;
  if (!*v9 || v14 == 41) {
    return v13;
  }
  int v14 = (char)v14;
  if ((char)v14 <= 82)
  {
    switch(v14)
    {
      case 'C':
        goto LABEL_27;
      case 'D':
        goto LABEL_32;
      case 'E':
        if (v10 <= 7) {
          goto LABEL_151;
        }
        uint64_t v15 = (*a5)++;
        uint64_t v16 = *v15;
        if (a1)
        {
          if (v16) {
            *uint64_t v16 = *(void *)a2;
          }
        }
        else if (v16)
        {
          *uint64_t v16 = a2;
        }
        uint64_t v13 = (v13 + 8);
        a2 += 8;
        uint64_t v10 = (v10 - 8);
        goto LABEL_135;
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
        goto LABEL_147;
      case 'L':
        goto LABEL_45;
      default:
        if (v14 == 46) {
          goto LABEL_135;
        }
        if (v14 != 54) {
          goto LABEL_147;
        }
        if (v10 <= 0xF) {
          goto LABEL_151;
        }
        std::string v23 = (*a5)++;
        __int16 v24 = *v23;
        if (a1)
        {
          if (v24) {
            *(_OWORD *)__int16 v24 = *(_OWORD *)a2;
          }
        }
        else if (v24)
        {
          *__int16 v24 = a2;
        }
        uint64_t v13 = (v13 + 16);
        a2 += 16;
        uint64_t v10 = (v10 - 16);
        break;
    }
    goto LABEL_135;
  }
  switch(v14)
  {
    case 'b':
      __int16 v17 = (*a5)++;
      if (!v10) {
        goto LABEL_151;
      }
      uint64_t v18 = *v17;
      if (!v18) {
        goto LABEL_31;
      }
      char v19 = *(unsigned char *)a2 != 0;
      goto LABEL_30;
    case 'c':
LABEL_27:
      int v25 = (*a5)++;
      if (!v10) {
        goto LABEL_151;
      }
      uint64_t v18 = *v25;
      if (!v18) {
        goto LABEL_31;
      }
      char v19 = *(unsigned char *)a2;
LABEL_30:
      *(unsigned char *)uint64_t v18 = v19;
LABEL_31:
      uint64_t v13 = (v13 + 1);
      ++a2;
      uint64_t v10 = (v10 - 1);
      goto LABEL_135;
    case 'd':
LABEL_32:
      int v26 = 0;
      unsigned __int16 v82 = 0;
      __int16 v27 = (*a5)++;
      __int16 v28 = *v27;
      *a5 = v27 + 2;
      v29 = v27[1];
      __int16 v30 = v9;
      __int16 v31 = v9;
      do
      {
        int v33 = (char)*++v31;
        int v32 = v33;
        if (v33 == 41)
        {
          if (!--v26) {
            __int16 v31 = v30 + 2;
          }
        }
        else if (v32 == 40)
        {
          int v34 = 40;
          ++v26;
          goto LABEL_40;
        }
        if (v26 < 1) {
          break;
        }
        int v34 = *v31;
LABEL_40:
        __int16 v30 = v31;
      }
      while (v34);
      if (*v9 != 100 && (!*v31 || *v31 == 41))
      {
        int v35 = 0;
        unsigned __int16 v82 = v10;
        unsigned __int16 v36 = v10;
        v37 = (const void *)a2;
        goto LABEL_53;
      }
      int v40 = spinel_datatype_unpack(a2, v10, (uint64_t)"S", a4, (uint64_t)a5, a6, a7, a8, (uint64_t)&v82);
      if (v40 < 1) {
        return v13;
      }
      unsigned __int16 v36 = v82;
      if (v82 >= 0x514u) {
        return v13;
      }
      int v35 = v40;
      v37 = (const void *)(a2 + v40);
LABEL_53:
      if ((int)v10 < v35 + v36)
      {
        int v80 = 84;
        goto LABEL_154;
      }
      int v41 = v36;
      if (!a1)
      {
        if (v28) {
          *__int16 v28 = (uint64_t)v37;
        }
        if (v29) {
LABEL_74:
        }
          *(_DWORD *)v29 = v41;
        unsigned __int16 v52 = v36 + v35;
        uint64_t v13 = v13 + v52;
        a2 += v52;
        uint64_t v10 = v10 - v52;
LABEL_135:
        int v74 = 0;
        while (1)
        {
          int v75 = (char)v9[1];
          if (v75 == 41) {
            break;
          }
          if (v75 != 40)
          {
            ++v9;
LABEL_143:
            if (v74 < 1) {
              goto LABEL_3;
            }
            int v76 = *v9;
            goto LABEL_145;
          }
          int v76 = 40;
          ++v74;
          ++v9;
LABEL_145:
          if (!v76) {
            goto LABEL_3;
          }
        }
        if (--v74) {
          ++v9;
        }
        else {
          v9 += 2;
        }
        goto LABEL_143;
      }
      if (v29 && *(_DWORD *)v29 >= v36)
      {
        memcpy(v28, v37, v36);
        int v41 = v82;
        unsigned __int16 v36 = v82;
        goto LABEL_74;
      }
      int v80 = 22;
LABEL_154:
      *__error() = v80;
      return 0xFFFFFFFFLL;
    case 'e':
      if (v10 <= 5) {
        goto LABEL_151;
      }
      v58 = (*a5)++;
      v59 = *v58;
      if (a1)
      {
        if (v59)
        {
          int v60 = *(_DWORD *)a2;
          *((_WORD *)v59 + 2) = *(_WORD *)(a2 + 4);
          *(_DWORD *)v59 = v60;
        }
      }
      else if (v59)
      {
        uint64_t *v59 = a2;
      }
      uint64_t v13 = (v13 + 6);
      a2 += 6;
      uint64_t v10 = (v10 - 6);
      goto LABEL_135;
    case 'f':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
      goto LABEL_147;
    case 'i':
      v61 = (*a5)++;
      v62 = *v61;
      int v63 = spinel_packed_uint_decode((char *)a2, v10, *v61);
      if (v62 && *(_DWORD *)v62 >= 0x1FFFFFu)
      {
        v77 = __error();
        int v78 = 34;
        goto LABEL_148;
      }
      if (v63 < 1 || (int)v10 < v63) {
        return v13;
      }
      uint64_t v13 = (v63 + v13);
      a2 += v63;
      uint64_t v10 = (v10 - v63);
      goto LABEL_135;
    case 'l':
LABEL_45:
      v38 = (*a5)++;
      BOOL v21 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v21) {
        goto LABEL_151;
      }
      v39 = *v38;
      if (v39) {
        *(_DWORD *)v39 = *(_DWORD *)a2;
      }
      uint64_t v13 = (v13 + 4);
      a2 += 4;
      goto LABEL_135;
    case 's':
LABEL_16:
      int8x16_t v20 = (*a5)++;
      BOOL v21 = v10 >= 2;
      uint64_t v10 = (v10 - 2);
      if (!v21) {
        goto LABEL_151;
      }
      int v22 = *v20;
      if (v22) {
        *(_WORD *)int v22 = *(_WORD *)a2;
      }
      uint64_t v13 = (v13 + 2);
      a2 += 2;
      goto LABEL_135;
    case 't':
LABEL_58:
      int v42 = 0;
      unsigned __int16 v81 = 0;
      v43 = v9;
      v44 = v9;
      break;
    default:
      switch(v14)
      {
        case 'S':
          goto LABEL_16;
        case 'T':
          goto LABEL_58;
        case 'U':
          if (!v10) {
            goto LABEL_151;
          }
          size_t v65 = strnlen((const char *)a2, v10) + 1;
          if (v65 > v10) {
            goto LABEL_151;
          }
          char v66 = *(unsigned char *)a2;
          if (!*(unsigned char *)a2) {
            goto LABEL_125;
          }
          v67 = (char *)a2;
          break;
        case 'V':
        case 'W':
          goto LABEL_147;
        case 'X':
          goto LABEL_91;
        default:
          if (v14 != 120) {
            goto LABEL_147;
          }
LABEL_91:
          v56 = (*a5)++;
          BOOL v21 = v10 >= 8;
          uint64_t v10 = (v10 - 8);
          if (!v21) {
            goto LABEL_151;
          }
          v57 = *v56;
          if (v57) {
            uint64_t *v57 = *(void *)a2;
          }
          uint64_t v13 = (v13 + 8);
          a2 += 8;
          goto LABEL_135;
      }
      while (1)
      {
        ++v67;
        if (v66 < 0)
        {
          if ((v66 & 0x40) == 0) {
            goto LABEL_147;
          }
          if ((v66 & 0x20) != 0)
          {
            if ((v66 & 0x10) != 0)
            {
              if ((v66 & 8) != 0) {
                goto LABEL_147;
              }
              unsigned int v68 = 3;
            }
            else
            {
              unsigned int v68 = 2;
            }
          }
          else
          {
            unsigned int v68 = 1;
          }
          v69 = &v67[v68];
          while ((_BYTE)v68)
          {
            LOBYTE(v68) = v68 - 1;
            char v70 = *v67++;
            if ((v70 & 0xC0) != 0x80) {
              goto LABEL_147;
            }
          }
          v67 = v69;
        }
        char v66 = *v67;
        if (!*v67)
        {
LABEL_125:
          v71 = (*a5)++;
          uint64_t v72 = *v71;
          if (a1)
          {
            v73 = (size_t *)(*a5)++;
            if (v72)
            {
              if (*v73 < v65)
              {
                v77 = __error();
                int v78 = 12;
                goto LABEL_148;
              }
              memcpy(v72, (const void *)a2, v65);
            }
          }
          else if (v72)
          {
            uint64_t *v72 = a2;
          }
          uint64_t v13 = (v13 + v65);
          a2 += v65;
          uint64_t v10 = (v10 - v65);
          goto LABEL_135;
        }
      }
  }
  while (1)
  {
    int v46 = (char)*++v44;
    int v45 = v46;
    if (v46 == 41) {
      break;
    }
    if (v45 != 40) {
      goto LABEL_64;
    }
    int v47 = 40;
    ++v42;
LABEL_66:
    v43 = v44;
    if (!v47)
    {
LABEL_67:
      if (*v9 == 116 || (int v48 = *v44) != 0 && v48 != 41)
      {
        int v53 = spinel_datatype_unpack(a2, v10, (uint64_t)"S", a4, (uint64_t)a5, a6, a7, a8, (uint64_t)&v81);
        if (v53 < 1) {
          return v13;
        }
        unsigned __int16 v50 = v81;
        if (v81 >= 0x514u) {
          return v13;
        }
        int v49 = v53;
        uint64_t v51 = a2 + v53;
      }
      else
      {
        int v49 = 0;
        unsigned __int16 v81 = v10;
        unsigned __int16 v50 = v10;
        uint64_t v51 = a2;
      }
      if ((int)v10 >= v49 + v50)
      {
        int v54 = sub_100015444(0, v51, v50, v9 + 2, a5);
        if ((v54 & 0x80000000) == 0)
        {
          unsigned __int16 v55 = v49 + v81;
          if (!v49) {
            unsigned __int16 v55 = v54;
          }
          uint64_t v13 = v13 + v55;
          a2 += v55;
          uint64_t v10 = v10 - v55;
          goto LABEL_135;
        }
      }
LABEL_151:
      v77 = __error();
      int v78 = 84;
LABEL_148:
      int *v77 = v78;
      return 0xFFFFFFFFLL;
    }
  }
  if (!--v42) {
    v44 = v43 + 2;
  }
LABEL_64:
  if (v42 < 1) {
    goto LABEL_67;
  }
  int v47 = *v44;
  goto LABEL_66;
}

uint64_t spinel_datatype_unpack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = &a9;
  return sub_100015444(0, a1, a2, a3, &v10);
}

uint64_t spinel_datatype_vunpack_in_place(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[0] = a4;
  v9[1] = a4;
  return sub_100015444(1, a1, a2, a3, v9, a6, a7, a8);
}

uint64_t spinel_datatype_vunpack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[0] = a4;
  v9[1] = a4;
  return sub_100015444(0, a1, a2, a3, v9, a6, a7, a8);
}

uint64_t spinel_datatype_pack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = &a9;
  return sub_100015C88(a1, a2, a3, &v10);
}

uint64_t sub_100015C88(unsigned char *a1, unsigned int a2, unsigned __int8 *a3, unsigned int **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 0x8000) {
    goto LABEL_97;
  }
  uint64_t v10 = a1;
  uint64_t v11 = 0;
  if (a1) {
    uint64_t v12 = a2;
  }
  else {
    uint64_t v12 = 0;
  }
LABEL_5:
  int v13 = *a3;
  if (!*a3 || v13 == 41) {
    return v11;
  }
  if ((char)v13 <= 82)
  {
    switch((char)v13)
    {
      case 'C':
        goto LABEL_24;
      case 'D':
        goto LABEL_27;
      case 'E':
        int v14 = *a4;
        *a4 += 2;
        uint64_t v11 = (v11 + 8);
        BOOL v15 = v12 >= 8;
        uint64_t v12 = (v12 - 8);
        if (!v15) {
          goto LABEL_83;
        }
        uint64_t v16 = *(unsigned int **)v14;
        goto LABEL_78;
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
        goto LABEL_97;
      case 'L':
        goto LABEL_46;
      default:
        if ((char)v13 == 46) {
          goto LABEL_84;
        }
        if ((char)v13 != 54) {
          goto LABEL_97;
        }
        char v19 = *a4;
        *a4 += 2;
        uint64_t v11 = (v11 + 16);
        BOOL v15 = v12 >= 0x10;
        uint64_t v12 = (v12 - 16);
        if (!v15) {
          goto LABEL_83;
        }
        *(_OWORD *)uint64_t v10 = *(_OWORD *)*(void *)v19;
        v10 += 16;
        break;
    }
    goto LABEL_84;
  }
  switch((char)v13)
  {
    case 'b':
      __int16 v17 = *a4;
      *a4 += 2;
      uint64_t v11 = (v11 + 1);
      if (!v12) {
        goto LABEL_84;
      }
      LOBYTE(v17) = *v17 != 0;
      goto LABEL_26;
    case 'c':
LABEL_24:
      __int16 v17 = *a4;
      *a4 += 2;
      uint64_t v11 = (v11 + 1);
      if (!v12) {
        goto LABEL_84;
      }
      LODWORD(v17) = *v17;
LABEL_26:
      *v10++ = (_BYTE)v17;
      uint64_t v12 = (v12 - 1);
      goto LABEL_84;
    case 'd':
LABEL_27:
      int v20 = 0;
      BOOL v21 = *a4;
      *a4 += 2;
      int v22 = *(const void **)v21;
      *a4 = v21 + 4;
      size_t v23 = v21[2];
      __int16 v24 = a3;
      int v25 = a3;
      do
      {
        int v27 = (char)*++v25;
        int v26 = v27;
        if (v27 == 41)
        {
          if (!--v20) {
            int v25 = v24 + 2;
          }
        }
        else if (v26 == 40)
        {
          int v28 = 40;
          ++v20;
          goto LABEL_35;
        }
        if (v20 < 1) {
          break;
        }
        int v28 = *v25;
LABEL_35:
        __int16 v24 = v25;
      }
      while (v28);
      if (*a3 != 100 && ((int v29 = 0, !*v25) || *v25 == 41)
        || (int v29 = spinel_datatype_pack((uint64_t)v10, v12, (uint64_t)"S", (uint64_t)a4, a5, a6, a7, a8, v23), v29 >= 1))
      {
        uint64_t v11 = (v29 + v23 + v11);
        BOOL v15 = v12 >= v29 + (int)v23;
        uint64_t v12 = (v12 - (v29 + v23));
        if (v15)
        {
          __int16 v30 = &v10[v29];
          if (v10 && v22) {
            memcpy(&v10[v29], v22, v23);
          }
          uint64_t v10 = &v30[v23];
        }
        else
        {
LABEL_83:
          uint64_t v12 = 0;
        }
        goto LABEL_84;
      }
LABEL_97:
      *__error() = 22;
      return 0xFFFFFFFFLL;
    case 'e':
      v44 = *a4;
      *a4 += 2;
      uint64_t v11 = (v11 + 6);
      BOOL v15 = v12 >= 6;
      uint64_t v12 = (v12 - 6);
      if (!v15) {
        goto LABEL_83;
      }
      int v45 = *(int **)v44;
      int v46 = *v45;
      *((_WORD *)v10 + 2) = *((_WORD *)v45 + 2);
      *(_DWORD *)uint64_t v10 = v46;
      v10 += 6;
      goto LABEL_84;
    case 'f':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
      goto LABEL_97;
    case 'i':
      int v47 = *a4;
      *a4 += 2;
      if (*v47 > 0x1FFFFE) {
        goto LABEL_97;
      }
      int v48 = spinel_packed_uint_encode(v10, v12, *v47);
      uint64_t v11 = (v48 + v11);
      BOOL v49 = (int)v12 < v48;
      if ((int)v12 >= v48) {
        uint64_t v12 = (v12 - v48);
      }
      else {
        uint64_t v12 = 0;
      }
      if (v49) {
        uint64_t v50 = 0;
      }
      else {
        uint64_t v50 = v48;
      }
      v10 += v50;
      goto LABEL_84;
    case 'l':
LABEL_46:
      __int16 v31 = *a4;
      *a4 += 2;
      uint64_t v11 = (v11 + 4);
      BOOL v15 = v12 >= 4;
      uint64_t v12 = (v12 - 4);
      if (!v15) {
        goto LABEL_83;
      }
      *(_DWORD *)uint64_t v10 = *v31;
      v10 += 4;
      goto LABEL_84;
    case 's':
LABEL_16:
      uint64_t v18 = *a4;
      *a4 += 2;
      uint64_t v11 = (v11 + 2);
      BOOL v15 = v12 >= 2;
      uint64_t v12 = (v12 - 2);
      if (!v15) {
        goto LABEL_83;
      }
      *(_WORD *)uint64_t v10 = *v18;
      v10 += 2;
      goto LABEL_84;
    case 't':
LABEL_49:
      int v32 = 0;
      int v33 = a3;
      int v34 = a3;
      break;
    default:
      switch((char)v13)
      {
        case 'S':
          goto LABEL_16;
        case 'T':
          goto LABEL_49;
        case 'U':
          uint64_t v51 = (const char **)*a4;
          *a4 += 2;
          unsigned __int16 v52 = *v51;
          if (*v51)
          {
            size_t v53 = strlen(*v51) + 1;
          }
          else
          {
            unsigned __int16 v52 = "";
            size_t v53 = 1;
          }
          uint64_t v11 = (v11 + v53);
          if (v53 > v12) {
            goto LABEL_83;
          }
          memcpy(v10, v52, v53);
          v10 += v53;
          uint64_t v12 = (v12 - v53);
          goto LABEL_84;
        case 'V':
        case 'W':
          goto LABEL_97;
        case 'X':
          goto LABEL_76;
        default:
          if ((char)v13 != 120) {
            goto LABEL_97;
          }
LABEL_76:
          uint64_t v16 = *a4;
          *a4 += 2;
          uint64_t v11 = (v11 + 8);
          BOOL v15 = v12 >= 8;
          uint64_t v12 = (v12 - 8);
          if (!v15) {
            goto LABEL_83;
          }
LABEL_78:
          *(void *)uint64_t v10 = *(void *)v16;
          v10 += 8;
          break;
      }
      goto LABEL_84;
  }
  while (1)
  {
    int v36 = (char)*++v34;
    int v35 = v36;
    if (v36 == 41) {
      break;
    }
    if (v35 != 40) {
      goto LABEL_55;
    }
    int v37 = 40;
    ++v32;
LABEL_56:
    int v33 = v34;
    if (!v37)
    {
LABEL_57:
      if (a3[1] != 40) {
        goto LABEL_97;
      }
      v58 = *a4;
      uint64_t v39 = sub_100015C88(0, 0, a3 + 2, &v58);
      if (*a3 == 116 || (int v40 = 0, v37) && v37 != 41)
      {
        int v40 = spinel_datatype_pack((uint64_t)v10, v12, (uint64_t)"S", (uint64_t)a4, a5, a6, a7, a8, v39);
        if (v40 <= 0) {
          goto LABEL_97;
        }
      }
      uint64_t v11 = (v40 + v39 + v11);
      if (v40 + (int)v39 > (int)v12) {
        goto LABEL_83;
      }
      int v41 = &v10[v40];
      uint64_t v42 = (v12 - v40);
      int v43 = sub_100015C88(v41, v42, a3 + 2, a4);
      uint64_t v10 = &v41[v43];
      uint64_t v12 = (v42 - v43);
LABEL_84:
      int v54 = 0;
      while (2)
      {
        int v55 = (char)a3[1];
        if (v55 == 41)
        {
          if (--v54) {
            ++a3;
          }
          else {
            a3 += 2;
          }
        }
        else
        {
          if (v55 == 40)
          {
            int v56 = 40;
            ++v54;
            ++a3;
            goto LABEL_94;
          }
          ++a3;
        }
        if (v54 < 1) {
          goto LABEL_5;
        }
        int v56 = *a3;
LABEL_94:
        if (!v56) {
          goto LABEL_5;
        }
        continue;
      }
    }
  }
  --v32;
  v38 = v33 + 2;
  if (!v32) {
    int v34 = v38;
  }
LABEL_55:
  int v37 = *v34;
  if (v32 < 1) {
    goto LABEL_57;
  }
  goto LABEL_56;
}

uint64_t spinel_datatype_vpack(unsigned char *a1, unsigned int a2, unsigned __int8 *a3, unsigned int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[0] = a4;
  v9[1] = a4;
  return sub_100015C88(a1, a2, a3, v9, a5, a6, a7, a8);
}

const char *spinel_command_to_cstr(unsigned int a1)
{
  if (a1 > 0x17) {
    return "UNKNOWN";
  }
  else {
    return off_100074CB0[a1];
  }
}

const char *spinel_prop_key_to_cstr(int a1)
{
  uint64_t result = "UNKNOWN";
  if (a1 <= 4863)
  {
    if (a1 <= 1279)
    {
      if (a1 > 255)
      {
        int v3 = "15_4_PIB_PHY_CHANNELS_SUPPORTED";
        int v4 = "15_4_PIB_MAC_PROMISCUOUS_MODE";
        int v5 = "15_4_PIB_MAC_SECURITY_ENABLED";
        if (a1 != 1117) {
          int v5 = "UNKNOWN";
        }
        if (a1 != 1105) {
          int v4 = v5;
        }
        if (a1 != 1025) {
          int v3 = v4;
        }
        uint64_t v6 = "UART_BITRATE";
        int v7 = "UART_XON_XOFF";
        if (a1 != 257) {
          int v7 = "UNKNOWN";
        }
        if (a1 != 256) {
          uint64_t v6 = v7;
        }
        if (a1 <= 1024) {
          return v6;
        }
        else {
          return v3;
        }
      }
      else
      {
        switch(a1)
        {
          case 0:
            uint64_t result = "LAST_STATUS";
            break;
          case 1:
            uint64_t result = "PROTOCOL_VERSION";
            break;
          case 2:
            uint64_t result = "NCP_VERSION";
            break;
          case 3:
            uint64_t result = "INTERFACE_TYPE";
            break;
          case 4:
            uint64_t result = "VENDOR_ID";
            break;
          case 5:
            uint64_t result = "CAPS";
            break;
          case 6:
            uint64_t result = "INTERFACE_COUNT";
            break;
          case 7:
            uint64_t result = "POWER_STATE";
            break;
          case 8:
            uint64_t result = "HWADDR";
            break;
          case 9:
            uint64_t result = "LOCK";
            break;
          case 10:
            uint64_t result = "HBO_MEM_MAX";
            break;
          case 11:
            uint64_t result = "HBO_BLOCK_MAX";
            break;
          case 12:
            uint64_t result = "HOST_POWER_STATE";
            break;
          case 13:
            uint64_t result = "MCU_POWER_STATE";
            break;
          case 32:
            uint64_t result = "PHY_ENABLED";
            break;
          case 33:
            uint64_t result = "PHY_CHAN";
            break;
          case 34:
            uint64_t result = "PHY_CHAN_SUPPORTED";
            break;
          case 35:
            uint64_t result = "PHY_FREQ";
            break;
          case 36:
            uint64_t result = "PHY_CCA_THRESHOLD";
            break;
          case 37:
            uint64_t result = "PHY_TX_POWER";
            break;
          case 38:
            uint64_t result = "PHY_RSSI";
            break;
          case 39:
            uint64_t result = "PHY_RX_SENSITIVITY";
            break;
          case 40:
            uint64_t result = "PHY_PCAP_ENABLED";
            break;
          case 41:
            uint64_t result = "PHY_CHAN_PREFERRED";
            break;
          case 48:
            uint64_t result = "MAC_SCAN_STATE";
            break;
          case 49:
            uint64_t result = "MAC_SCAN_MASK";
            break;
          case 50:
            uint64_t result = "MAC_SCAN_PERIOD";
            break;
          case 51:
            uint64_t result = "MAC_SCAN_BEACON";
            break;
          case 52:
            uint64_t result = "MAC_15_4_LADDR";
            break;
          case 53:
            uint64_t result = "MAC_15_4_SADDR";
            break;
          case 54:
            uint64_t result = "MAC_15_4_PANID";
            break;
          case 55:
            uint64_t result = "MAC_RAW_STREAM_ENABLED";
            break;
          case 56:
            uint64_t result = "MAC_PROMISCUOUS_MODE";
            break;
          case 57:
            uint64_t result = "MAC_ENERGY_SCAN_RESULT";
            break;
          case 58:
            uint64_t result = "MAC_DATA_POLL_PERIOD";
            break;
          case 64:
            uint64_t result = "NET_SAVED";
            break;
          case 65:
            uint64_t result = "NET_IF_UP";
            break;
          case 66:
            uint64_t result = "NET_STACK_UP";
            break;
          case 67:
            uint64_t result = "NET_ROLE";
            break;
          case 68:
            uint64_t result = "NET_NETWORK_NAME";
            break;
          case 69:
            uint64_t result = "NET_XPANID";
            break;
          case 70:
            uint64_t result = "NET_NETWORK_KEY";
            break;
          case 71:
            uint64_t result = "NET_KEY_SEQUENCE_COUNTER";
            break;
          case 72:
            uint64_t result = "NET_PARTITION_ID";
            break;
          case 73:
            uint64_t result = "NET_REQUIRE_JOIN_EXISTING";
            break;
          case 74:
            uint64_t result = "NET_KEY_SWITCH_GUARDTIME";
            break;
          case 75:
            uint64_t result = "NET_PSKC";
            break;
          case 80:
            uint64_t result = "THREAD_LEADER_ADDR";
            break;
          case 81:
            uint64_t result = "THREAD_PARENT";
            break;
          case 82:
            uint64_t result = "THREAD_CHILD_TABLE";
            break;
          case 83:
            uint64_t result = "THREAD_LEADER_RID";
            break;
          case 84:
            uint64_t result = "THREAD_LEADER_WEIGHT";
            break;
          case 85:
            uint64_t result = "THREAD_LOCAL_LEADER_WEIGHT";
            break;
          case 86:
            uint64_t result = "THREAD_NETWORK_DATA";
            break;
          case 87:
            uint64_t result = "THREAD_NETWORK_DATA_VERSION";
            break;
          case 88:
            uint64_t result = "THREAD_STABLE_NETWORK_DATA";
            break;
          case 89:
            uint64_t result = "THREAD_STABLE_NETWORK_DATA_VERSION";
            break;
          case 90:
            uint64_t result = "THREAD_ON_MESH_NETS";
            break;
          case 91:
            uint64_t result = "THREAD_OFF_MESH_ROUTES";
            break;
          case 92:
            uint64_t result = "THREAD_ASSISTING_PORTS";
            break;
          case 93:
            uint64_t result = "THREAD_ALLOW_LOCAL_NET_DATA_CHANGE";
            break;
          case 94:
            uint64_t result = "THREAD_MODE";
            break;
          case 96:
            uint64_t result = "IPV6_LL_ADDR";
            break;
          case 97:
            uint64_t result = "IPV6_ML_ADDR";
            break;
          case 98:
            uint64_t result = "IPV6_ML_PREFIX";
            break;
          case 99:
            uint64_t result = "IPV6_ADDRESS_TABLE";
            break;
          case 100:
            uint64_t result = "IPV6_ROUTE_TABLE";
            break;
          case 101:
            uint64_t result = "IPV6_ICMP_PING_OFFLOAD";
            break;
          case 102:
            uint64_t result = "IPV6_MULTICAST_ADDRESS_TABLE";
            break;
          case 103:
            uint64_t result = "IPV6_ICMP_PING_OFFLOAD_MODE";
            break;
          case 112:
            uint64_t result = "STREAM_DEBUG";
            break;
          case 113:
            uint64_t result = "STREAM_RAW";
            break;
          case 114:
            uint64_t result = "STREAM_NET";
            break;
          case 115:
            uint64_t result = "STREAM_NET_INSECURE";
            break;
          case 116:
            uint64_t result = "STREAM_LOG";
            break;
          case 117:
            uint64_t result = "STREAM_PCAP";
            break;
          case 128:
            uint64_t result = "MESHCOP_JOINER_STATE";
            break;
          case 129:
            uint64_t result = "MESHCOP_JOINER_COMMISSIONING";
            break;
          case 130:
            uint64_t result = "MESHCOP_COMMISSIONER_STATE";
            break;
          case 131:
            uint64_t result = "MESHCOP_COMMISSIONER_JOINERS";
            break;
          case 132:
            uint64_t result = "MESHCOP_COMMISSIONER_PROVISIONING_URL";
            break;
          case 133:
            uint64_t result = "MESHCOP_COMMISSIONER_SESSION_ID";
            break;
          case 143:
            uint64_t result = "MESHCOP_JOINER_SCAN_RETRIES";
            break;
          case 160:
            uint64_t result = "SERVER_ALLOW_LOCAL_DATA_CHANGE";
            break;
          case 161:
            uint64_t result = "SERVER_SERVICES";
            break;
          case 162:
            uint64_t result = "SERVER_LEADER_SERVICES";
            break;
          default:
            return result;
        }
      }
    }
    else if (a1 <= 1679)
    {
      if (a1 <= 1379)
      {
        switch(a1)
        {
          case 1280:
            uint64_t result = "CNTR_RESET";
            break;
          case 1281:
            uint64_t result = "CNTR_TX_PKT_TOTAL";
            break;
          case 1282:
            uint64_t result = "CNTR_TX_PKT_ACK_REQ";
            break;
          case 1283:
            uint64_t result = "CNTR_TX_PKT_ACKED";
            break;
          case 1284:
            uint64_t result = "CNTR_TX_PKT_NO_ACK_REQ";
            break;
          case 1285:
            uint64_t result = "CNTR_TX_PKT_DATA";
            break;
          case 1286:
            uint64_t result = "CNTR_TX_PKT_DATA_POLL";
            break;
          case 1287:
            uint64_t result = "CNTR_TX_PKT_BEACON";
            break;
          case 1288:
            uint64_t result = "CNTR_TX_PKT_BEACON_REQ";
            break;
          case 1289:
            uint64_t result = "CNTR_TX_PKT_OTHER";
            break;
          case 1290:
            uint64_t result = "CNTR_TX_PKT_RETRY";
            break;
          case 1291:
            uint64_t result = "CNTR_TX_ERR_CCA";
            break;
          case 1292:
            uint64_t result = "CNTR_TX_PKT_UNICAST";
            break;
          case 1293:
            uint64_t result = "CNTR_TX_PKT_BROADCAST";
            break;
          case 1294:
            uint64_t result = "CNTR_TX_ERR_ABORT";
            break;
          default:
            return result;
        }
      }
      else
      {
        switch(a1)
        {
          case 1380:
            uint64_t result = "CNTR_RX_PKT_TOTAL";
            break;
          case 1381:
            uint64_t result = "CNTR_RX_PKT_DATA";
            break;
          case 1382:
            uint64_t result = "CNTR_RX_PKT_DATA_POLL";
            break;
          case 1383:
            uint64_t result = "CNTR_RX_PKT_BEACON";
            break;
          case 1384:
            uint64_t result = "CNTR_RX_PKT_BEACON_REQ";
            break;
          case 1385:
            uint64_t result = "CNTR_RX_PKT_OTHER";
            break;
          case 1386:
            uint64_t result = "CNTR_RX_PKT_FILT_WL";
            break;
          case 1387:
            uint64_t result = "CNTR_RX_PKT_FILT_DA";
            break;
          case 1388:
            uint64_t result = "CNTR_RX_ERR_EMPTY";
            break;
          case 1389:
            uint64_t result = "CNTR_RX_ERR_UKWN_NBR";
            break;
          case 1390:
            uint64_t result = "CNTR_RX_ERR_NVLD_SADDR";
            break;
          case 1391:
            uint64_t result = "CNTR_RX_ERR_SECURITY";
            break;
          case 1392:
            uint64_t result = "CNTR_RX_ERR_BAD_FCS";
            break;
          case 1393:
            uint64_t result = "CNTR_RX_ERR_OTHER";
            break;
          case 1394:
            uint64_t result = "CNTR_RX_PKT_DUP";
            break;
          case 1395:
            uint64_t result = "CNTR_RX_PKT_UNICAST";
            break;
          case 1396:
            uint64_t result = "CNTR_RX_PKT_BROADCAST";
            break;
          default:
            switch(a1)
            {
              case 1580:
                uint64_t result = "CNTR_TX_SPINEL_TOTAL";
                break;
              case 1581:
                uint64_t result = "CNTR_RX_SPINEL_TOTAL";
                break;
              case 1582:
                uint64_t result = "CNTR_RX_SPINEL_ERR";
                break;
              case 1583:
                uint64_t result = "CNTR_RX_SPINEL_OUT_OF_ORDER_TID";
                break;
              case 1584:
                uint64_t result = "CNTR_IP_TX_SUCCESS";
                break;
              case 1585:
                uint64_t result = "CNTR_IP_RX_SUCCESS";
                break;
              case 1586:
                uint64_t result = "CNTR_IP_TX_FAILURE";
                break;
              case 1587:
                uint64_t result = "CNTR_IP_RX_FAILURE";
                break;
              default:
                switch(a1)
                {
                  case 1480:
                    uint64_t result = "CNTR_TX_IP_SEC_TOTAL";
                    break;
                  case 1481:
                    uint64_t result = "CNTR_TX_IP_INSEC_TOTAL";
                    break;
                  case 1482:
                    uint64_t result = "CNTR_TX_IP_DROPPED";
                    break;
                  case 1483:
                    uint64_t result = "CNTR_RX_IP_SEC_TOTAL";
                    break;
                  case 1484:
                    uint64_t result = "CNTR_RX_IP_INSEC_TOTAL";
                    break;
                  case 1485:
                    uint64_t result = "CNTR_RX_IP_DROPPED";
                    break;
                  default:
                    return result;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 4608:
          uint64_t result = "JAM_DETECT_ENABLE";
          break;
        case 4609:
          uint64_t result = "JAM_DETECTED";
          break;
        case 4610:
          uint64_t result = "JAM_DETECT_RSSI_THRESHOLD";
          break;
        case 4611:
          uint64_t result = "JAM_DETECT_WINDOW";
          break;
        case 4612:
          uint64_t result = "JAM_DETECT_BUSY";
          break;
        case 4613:
          uint64_t result = "JAM_DETECT_HISTORY_BITMAP";
          break;
        case 4614:
          uint64_t result = "CHANNEL_MONITOR_SAMPLE_INTERVAL";
          break;
        case 4615:
          uint64_t result = "CHANNEL_MONITOR_RSSI_THRESHOLD";
          break;
        case 4616:
          uint64_t result = "CHANNEL_MONITOR_SAMPLE_WINDOW";
          break;
        case 4617:
          uint64_t result = "CHANNEL_MONITOR_SAMPLE_COUNT";
          break;
        case 4618:
          uint64_t result = "CHANNEL_MONITOR_CHANNEL_OCCUPANCY";
          break;
        case 4619:
          uint64_t result = "RADIO_CAPS";
          break;
        case 4620:
          uint64_t result = "RADIO_COEX_METRICS";
          break;
        case 4621:
          uint64_t result = "RADIO_COEX_ENABLE";
          break;
        case 4622:
          uint64_t result = "CHUTIL_MONITOR_SAMPLE_INTERVAL";
          break;
        case 4623:
          uint64_t result = "CHUTIL_MONITOR_CCA_FAILURE_THRESHOLD";
          break;
        case 4624:
          uint64_t result = "CHUTIL_MONITOR_NOACK_FAILURE_THRESHOLD";
          break;
        case 4625:
          uint64_t result = "CHUTIL_MONITOR_RX_GRANT_THRESHOLD";
          break;
        case 4626:
          uint64_t result = "CHUTIL_MONITOR_ENABLED";
          break;
        case 4627:
          uint64_t result = "CHANUTIL_MONITOR_STATE";
          break;
        case 4628:
          uint64_t result = "TPC_MODE";
          break;
        case 4629:
          uint64_t result = "TPC_LINK_METRICS_PROBE_INTERVAL";
          break;
        case 4630:
          uint64_t result = "TPC_WEIGHT_FACTOR";
          break;
        case 4631:
          uint64_t result = "TPC_SET_POINT_ROUTER";
          break;
        case 4632:
          uint64_t result = "TPC_SET_POINT_END_DEVICE";
          break;
        case 4633:
          uint64_t result = "TPC_PROPOTIONAL_GAIN";
          break;
        case 4634:
          uint64_t result = "TPC_INTEGRAL_GAIN";
          break;
        case 4635:
          uint64_t result = "TPC_ERROR_GAIN_CODEWORD0";
          break;
        case 4636:
          uint64_t result = "TPC_ERROR_GAIN_CODEWORD1";
          break;
        case 4637:
          uint64_t result = "TPC_ERROR_GAIN_CODEWORD2";
          break;
        case 4638:
          uint64_t result = "TPC_ERROR_GAIN_CODEWORD3";
          break;
        case 4639:
          uint64_t result = "TPC_STEP_UP_ACK_LOST";
          break;
        case 4640:
        case 4641:
        case 4642:
        case 4643:
        case 4644:
          return result;
        case 4645:
          uint64_t result = "TPC_FRAME_TX_POWER_HISTOGRAM";
          break;
        case 4646:
          uint64_t result = "TPC_NEIGHBOR_TX_POWER_HISTOGRAM";
          break;
        case 4647:
          uint64_t result = "TPC_NEIGHBOR_ENERGY_SAVINGS_FACTOR_HISTOGRAM";
          break;
        default:
          switch(a1)
          {
            case 4096:
              uint64_t result = "GPIO_CONFIG";
              break;
            case 4097:
              return result;
            case 4098:
              uint64_t result = "GPIO_STATE";
              break;
            case 4099:
              uint64_t result = "GPIO_STATE_SET";
              break;
            case 4100:
              uint64_t result = "GPIO_STATE_CLEAR";
              break;
            case 4101:
              uint64_t result = "TRNG_32";
              break;
            case 4102:
              uint64_t result = "TRNG_128";
              break;
            case 4103:
              uint64_t result = "TRNG_RAW_32";
              break;
            case 4104:
              uint64_t result = "UNSOL_UPDATE_FILTER";
              break;
            case 4105:
              uint64_t result = "UNSOL_UPDATE_LIST";
              break;
            default:
              switch(a1)
              {
                case 1680:
                  uint64_t result = "MSG_BUFFER_COUNTERS";
                  break;
                case 1681:
                  uint64_t result = "CNTR_ALL_MAC_COUNTERS";
                  break;
                case 1682:
                  uint64_t result = "CNTR_MLE_COUNTERS";
                  break;
                case 1683:
                  uint64_t result = "CNTR_ALL_IP_COUNTERS";
                  break;
                case 1684:
                  uint64_t result = "CNTR_MAC_RETRY_HISTOGRAM";
                  break;
                default:
                  return result;
              }
              break;
          }
          break;
      }
    }
  }
  else if (a1 > 15295)
  {
    if (a1 > 15583)
    {
      if (a1 <= 2000000)
      {
        switch(a1)
        {
          case 15616:
            uint64_t result = "VENDOR_NCP_BUFFER_THRESH_LVLS";
            break;
          case 15617:
            uint64_t result = "VENDOR_NCP_BUFFER_STATUS";
            break;
          case 15618:
            uint64_t result = "VENDOR_NCP_LOGS_DROPPED_COUNTER";
            break;
          case 15619:
            uint64_t result = "VENDOR_NCP_LOGS_DROPPED_FILTER_COUNTER_THRESHOLD";
            break;
          case 15620:
            uint64_t result = "VENDOR_NCP_LOGS_DROPPED_FILTER_TIMER_PERIOD";
            break;
          default:
            JUMPOUT(0);
        }
      }
      else
      {
        switch(a1)
        {
          case 2000001:
            uint64_t result = "VENDOR_RSSI_OFFSET";
            break;
          case 2000002:
            uint64_t result = "VENDOR_MAC_PKT_SIZE_HISTOGRAM";
            break;
          case 2000003:
            uint64_t result = "VENDOR_LQI_HISTOGRAM";
            break;
          case 2000004:
            uint64_t result = "VENDOR_LINK_LOSS_COUNTER";
            break;
          case 2000005:
            uint64_t result = "VENDOR_NEIGHBOR_RSSI_HISTOGRAM";
            break;
          case 2000006:
            uint64_t result = "VENDOR_JOINER_RSSI_HISTOGRAM";
            break;
          case 2000007:
            uint64_t result = "VENDOR_MLE_ADV_TX_NUM";
            break;
          case 2000008:
            uint64_t result = "VENDOR_CONNECTED_NEIGHBORS_HISTOGRAM";
            break;
          case 2000009:
            uint64_t result = "VENDOR_MAC_ERROR_HISTOGRAM";
            break;
          case 2000014:
            uint64_t result = "NETWORKDIAGNOSTICS_GET";
            break;
          case 2000015:
            uint64_t result = "NETWORKDIAGNOSTICS_GET_RESPONSE";
            break;
          case 2000016:
            uint64_t result = "VENDOR_MIN_MAC_INTERFRAME_DELAY";
            break;
          case 2000017:
            uint64_t result = "VENDOR_TX_APPLICATION_PKT_COUNTER";
            break;
          default:
            return result;
        }
      }
    }
    else if (a1 <= 15423)
    {
      if (a1 <= 15359)
      {
        if (a1 == 15296)
        {
          return "NEST_STREAM_MFG";
        }
        else
        {
          __int16 v8 = "NEST_LEGACY_LAST_NODE_JOINED";
          if (a1 != 15298) {
            __int16 v8 = "UNKNOWN";
          }
          if (a1 == 15297) {
            return "NEST_LEGACY_ULA_PREFIX";
          }
          else {
            return v8;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case 15360:
            uint64_t result = "VENDOR_COEX_RX_REQUEST_MODE";
            break;
          case 15361:
            uint64_t result = "VENDOR_COEX_TX_REQUEST_MODE";
            break;
          case 15362:
            uint64_t result = "VENDOR_COEX_ENABLED";
            break;
          case 15363:
            uint64_t result = "VENDOR_COEX_COUNTERS";
            break;
          case 15364:
            uint64_t result = "COEX_GRANT_TIMEOUT";
            break;
          case 15365:
            uint64_t result = "COEX_RX_THROTTLE_MAX_ATTEMPTS_NONE";
            break;
          case 15366:
            uint64_t result = "COEX_RX_THROTTLE_MAX_ATTEMPTS_TX_ONLY";
            break;
          case 15367:
            uint64_t result = "COEX_RX_THROTTLE_MAX_ATTEMPTS_RX_ONLY";
            break;
          case 15368:
            uint64_t result = "COEX_RX_THROTTLE_TIMEOUT";
            break;
          case 15369:
            uint64_t result = "COEX_VENDOR_HISTOGRAMS";
            break;
          case 15370:
            uint64_t result = "COEX_REQUEST_AHEAD_CSL_TX";
            break;
          case 15371:
            uint64_t result = "COEX_REQUEST_AHEAD_CSL_TX_MIN";
            break;
          default:
            return result;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 15424:
          uint64_t result = "VENDOR_PMU_WAKE_FACTORY_TEST_START";
          break;
        case 15425:
          uint64_t result = "VENDOR_PMU_WAKE_FACTORY_TEST_RESULT";
          break;
        case 15426:
          uint64_t result = "VENDOR_UART_DISABLE_START";
          break;
        case 15440:
          uint64_t result = "VENDOR_FEM_ENABLED";
          break;
        case 15456:
          uint64_t result = "VENDOR_CSMA_MIN_BE";
          break;
        case 15457:
          uint64_t result = "VENDOR_CSMA_MAX_BE";
          break;
        case 15458:
          uint64_t result = "VENDOR_CSMA_MAX_BACKOFFS";
          break;
        case 15459:
          uint64_t result = "VENDOR_CSMA_SLIDING_WINDOW_ENABLED";
          break;
        case 15460:
          uint64_t result = "CSMA_CCA_ENERGY_DETECTED_HISTOGRAM";
          break;
        case 15461:
          uint64_t result = "CSMA_BACKOFF_HISTOGRAM";
          break;
        case 15462:
          uint64_t result = "VENDOR_CSMA_CCA_IDLE_ATTEMPTS";
          break;
        case 15472:
          uint64_t result = "VENDOR_IFS_MODE";
          break;
        case 15473:
          uint64_t result = "IFS_MIN_SIFS";
          break;
        case 15474:
          uint64_t result = "IFS_MIN_LIFS";
          break;
        case 15475:
          uint64_t result = "IFS_MIN_RETX_SIFS";
          break;
        case 15476:
          uint64_t result = "IFS_MIN_RETX_LIFS";
          break;
        case 15477:
          uint64_t result = "IFS_ACKTURNAROUND_TIME";
          break;
        case 15478:
          uint64_t result = "IFS_ACK_TX_MODE";
          break;
        case 15479:
          uint64_t result = "IFS_ACK_TURNAROUND_TIME_PER_NEIGHBOR_ENABLE";
          break;
        case 15480:
          uint64_t result = "IFS_ACK_DATA_PER_NEIGHBOR";
          break;
        case 15488:
          uint64_t result = "VENDOR_VERSION";
          break;
        case 15489:
          uint64_t result = "VENDOR_RADIO_COUNTERS";
          break;
        case 15490:
          uint64_t result = "VENDOR_RADIO_STATS";
          break;
        case 15491:
          uint64_t result = "VENDOR_ASSERT";
          break;
        case 15492:
          uint64_t result = "VENDOR_HARD_FAULT";
          break;
        case 15493:
          uint64_t result = "VENDOR_STACK_OVERFLOW";
          break;
        case 15494:
          uint64_t result = "VENDOR_ASSIGNED_HW_MAC";
          break;
        case 15496:
          uint64_t result = "VENDOR_LOGGING_TEST";
          break;
        case 15497:
          uint64_t result = "FILTER_UNSOL_NOTIF";
          break;
        case 15498:
          uint64_t result = "FAULT_INFO";
          break;
        case 15499:
          uint64_t result = "DEEP_SLEEP_FILTER_LIST";
          break;
        case 15500:
          uint64_t result = "DEEP_SLEEP_LOG_LEVEL";
          break;
        case 15501:
          uint64_t result = "DEEP_SLEEP_REGION_LOG_LEVELS";
          break;
        case 15502:
          uint64_t result = "LAST_HOST_WAKE_REASON";
          break;
        case 15505:
          uint64_t result = "CNTR_STAT_ALL_RESET";
          break;
        case 15506:
          uint64_t result = "NCP_STATE_DUMP";
          break;
        case 15507:
          uint64_t result = "DEVICE_ID";
          break;
        case 15509:
          uint64_t result = "CSL_TX_SCHED_FRAME_REQUEST_AHEAD";
          break;
        case 15510:
          uint64_t result = "SETTINGS_VALIDATE";
          break;
        case 15520:
          uint64_t result = "VENDOR_POWER_LIMI_TABLE";
          break;
        case 15522:
          uint64_t result = "VENDOR_POWER_LIMIT_ACTIVE_ID";
          break;
        case 15523:
          uint64_t result = "VENDOR_POWER_LIMIT_TABLE_VERSION";
          break;
        case 15524:
          uint64_t result = "SPINEL_PROP_VENDOR_POWER_LIMIT_TABLE_POWER_TEST";
          break;
        case 15525:
          uint64_t result = "VENDOR_POWER_LIMIT_ACTIVE_TABLE";
          break;
        case 15526:
          uint64_t result = "VENDOR_POWER_MAPPING_TABLE";
          break;
        case 15527:
          uint64_t result = "VENDOR_POWER_MAPPING_TABLE_VERSION";
          break;
        case 15528:
          uint64_t result = "VENDOR_POWER_MAPPING_DEFAULT";
          break;
        case 15529:
          uint64_t result = "VENDOR_POWER_MAPPING_TABLE_POWER_TEST";
          break;
        case 15530:
          uint64_t result = "VENDOR_RADIO_CURRENT_POWER_INFO";
          break;
        case 15531:
          uint64_t result = "VENDOR_POWER_MAPPING_TABLE_FLASH_CLEAR";
          break;
        case 15532:
          uint64_t result = "VENDOR_POWER_MAPPING_TABLE_FLASH_DATA";
          break;
        case 15533:
          uint64_t result = "VENDOR_POWER_MAPPING_TABLE_FLASH_DATA_VALID";
          break;
        default:
          return result;
      }
    }
  }
  else if (a1 > 6143)
  {
    switch(a1)
    {
      case 6400:
        uint64_t result = "CHANNEL_MANAGER_NEW_CHANNEL";
        break;
      case 6401:
        uint64_t result = "CHANNEL_MANAGER_DELAY";
        break;
      case 6402:
        uint64_t result = "CHANNEL_MANAGER_SUPPORTED_CHANNELS";
        break;
      case 6403:
        uint64_t result = "CHANNEL_MANAGER_FAVORED_CHANNELS";
        break;
      case 6404:
        uint64_t result = "CHANNEL_MANAGER_CHANNEL_SELECT";
        break;
      case 6405:
        uint64_t result = "CHANNEL_MANAGER_AUTO_SELECT_ENABLED";
        break;
      case 6406:
        uint64_t result = "CHANNEL_MANAGER_AUTO_SELECT_INTERVAL";
        break;
      case 6407:
        uint64_t result = "THREAD_NETWORK_TIME";
        break;
      case 6408:
        uint64_t result = "TIME_SYNC_PERIOD";
        break;
      case 6409:
        uint64_t result = "TIME_SYNC_XTAL_THRESHOLD";
        break;
      case 6410:
        uint64_t result = "CHILD_SUPERVISION_INTERVAL";
        break;
      case 6411:
        uint64_t result = "CHILD_SUPERVISION_CHECK_TIMEOUT";
        break;
      case 6412:
        uint64_t result = "RCP_VERSION";
        break;
      case 6413:
        uint64_t result = "PARENT_RESPONSE_INFO";
        break;
      case 6414:
        uint64_t result = "SLAAC_ENABLED";
        break;
      case 6415:
      case 6416:
      case 6417:
      case 6418:
      case 6419:
      case 6420:
      case 6421:
      case 6422:
      case 6423:
      case 6424:
      case 6425:
      case 6426:
      case 6427:
        return result;
      case 6428:
        uint64_t result = "MAC_CSL_DEBUGGING";
        break;
      default:
        switch(a1)
        {
          case 6144:
            uint64_t result = "MESHCOP_COMMISSIONER_ANNOUNCE_BEGIN";
            break;
          case 6145:
            uint64_t result = "MESHCOP_COMMISSIONER_ENERGY_SCAN";
            break;
          case 6146:
            uint64_t result = "MESHCOP_COMMISSIONER_ENERGY_SCAN_RESULT";
            break;
          case 6147:
            uint64_t result = "MESHCOP_COMMISSIONER_PAN_ID_QUERY";
            break;
          case 6148:
            uint64_t result = "MESHCOP_COMMISSIONER_PAN_ID_CONFLICT_RESULT";
            break;
          case 6149:
            uint64_t result = "MESHCOP_COMMISSIONER_MGMT_GET";
            break;
          case 6150:
            uint64_t result = "MESHCOP_COMMISSIONER_MGMT_SET";
            break;
          case 6151:
            uint64_t result = "MESHCOP_COMMISSIONER_GENERATE_PSKC";
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 5376:
        uint64_t result = "THREAD_CHILD_TIMEOUT";
        break;
      case 5377:
        uint64_t result = "THREAD_RLOC16";
        break;
      case 5378:
        uint64_t result = "THREAD_ROUTER_UPGRADE_THRESHOLD";
        break;
      case 5379:
        uint64_t result = "THREAD_CONTEXT_REUSE_DELAY";
        break;
      case 5380:
        uint64_t result = "THREAD_NETWORK_ID_TIMEOUT";
        break;
      case 5381:
        uint64_t result = "THREAD_ACTIVE_ROUTER_IDS";
        break;
      case 5382:
        uint64_t result = "THREAD_RLOC16_DEBUG_PASSTHRU";
        break;
      case 5383:
        uint64_t result = "THREAD_ROUTER_ROLE_ENABLED";
        break;
      case 5384:
        uint64_t result = "THREAD_ROUTER_DOWNGRADE_THRESHOLD";
        break;
      case 5385:
        uint64_t result = "THREAD_ROUTER_SELECTION_JITTER";
        break;
      case 5386:
        uint64_t result = "THREAD_PREFERRED_ROUTER_ID";
        break;
      case 5387:
        uint64_t result = "THREAD_NEIGHBOR_TABLE";
        break;
      case 5388:
        uint64_t result = "THREAD_CHILD_COUNT_MAX";
        break;
      case 5389:
        uint64_t result = "THREAD_LEADER_NETWORK_DATA";
        break;
      case 5390:
        uint64_t result = "THREAD_STABLE_LEADER_NETWORK_DATA";
        break;
      case 5391:
        uint64_t result = "THREAD_JOINERS";
        break;
      case 5392:
        uint64_t result = "THREAD_COMMISSIONER_ENABLED";
        break;
      case 5393:
        uint64_t result = "THREAD_TMF_PROXY_ENABLED";
        break;
      case 5394:
        uint64_t result = "THREAD_TMF_PROXY_STREAM";
        break;
      case 5395:
        uint64_t result = "THREAD_DISCOVERY_SCAN_JOINER_FLAG";
        break;
      case 5396:
        uint64_t result = "THREAD_DISCOVERY_SCAN_ENABLE_FILTERING";
        break;
      case 5397:
        uint64_t result = "THREAD_DISCOVERY_SCAN_PANID";
        break;
      case 5398:
        uint64_t result = "THREAD_STEERING_DATA";
        break;
      case 5399:
        uint64_t result = "THREAD_ROUTER_TABLE";
        break;
      case 5400:
        uint64_t result = "THREAD_ACTIVE_DATASET";
        break;
      case 5401:
        uint64_t result = "THREAD_PENDING_DATASET";
        break;
      case 5402:
        uint64_t result = "THREAD_MGMT_SET_ACTIVE_DATASET";
        break;
      case 5403:
        uint64_t result = "THREAD_MGMT_SET_PENDING_DATASET";
        break;
      case 5404:
        uint64_t result = "DATASET_ACTIVE_TIMESTAMP";
        break;
      case 5405:
        uint64_t result = "DATASET_PENDING_TIMESTAMP";
        break;
      case 5406:
        uint64_t result = "DATASET_DELAY_TIMER";
        break;
      case 5407:
        uint64_t result = "DATASET_SECURITY_POLICY";
        break;
      case 5408:
        uint64_t result = "DATASET_RAW_TLVS";
        break;
      case 5409:
        uint64_t result = "THREAD_CHILD_TABLE_ADDRESSES";
        break;
      case 5410:
        uint64_t result = "THREAD_NEIGHBOR_TABLE_ERROR_RATES";
        break;
      case 5411:
        uint64_t result = "THREAD_ADDRESS_CACHE_TABLE";
        break;
      case 5412:
        uint64_t result = "THREAD_UDP_FORWARD_STREAM";
        break;
      case 5413:
        uint64_t result = "THREAD_MGMT_GET_ACTIVE_DATASET";
        break;
      case 5414:
        uint64_t result = "THREAD_MGMT_GET_PENDING_DATASET";
        break;
      case 5415:
        uint64_t result = "DATASET_DEST_ADDRESS";
        break;
      case 5416:
        uint64_t result = "THREAD_NEW_DATASET";
        break;
      case 5417:
        uint64_t result = "SPINEL_PROP_THREAD_CSL_PERIOD";
        break;
      case 5418:
        uint64_t result = "SPINEL_PROP_THREAD_CSL_TIMEOUT";
        break;
      case 5419:
        uint64_t result = "SPINEL_PROP_THREAD_CSL_CHANNEL";
        break;
      case 5420:
        uint64_t result = "SPINEL_PROP_THREAD_DOMAIN_NAME";
        break;
      case 5421:
        uint64_t result = "THREAD_LINK_METRICS_QUERY";
        break;
      case 5422:
        uint64_t result = "THREAD_LINK_METRICS_QUERY_RESULT";
        break;
      case 5423:
        uint64_t result = "LINK_METRICS_PROBE";
        break;
      case 5424:
        uint64_t result = "THREAD_LINK_METRICS_MGMT_ENH_ACK";
        break;
      case 5425:
        uint64_t result = "THREAD_LINK_METRICS_MGMT_ENH_ACK_IE";
        break;
      case 5426:
        uint64_t result = "SPINEL_PROP_THREAD_LINK_METRICS_MGMT_FORWARD";
        break;
      case 5427:
        uint64_t result = "SPINEL_PROP_THREAD_LINK_METRICS_MGMT_RESPONSE";
        break;
      case 5428:
        uint64_t result = "THREAD_MLR_REQUEST";
        break;
      case 5429:
        uint64_t result = "THREAD_MLR_RESPONSE";
        break;
      case 5430:
        uint64_t result = "THREAD_DUA_ID";
        break;
      case 5431:
        uint64_t result = "THREAD_BACKBONE_ROUTER_PRIMARY";
        break;
      case 5432:
        uint64_t result = "THREAD_BACKBONE_ROUTER_LOCAL_STATE";
        break;
      case 5433:
        uint64_t result = "THREAD_BACKBONE_ROUTER_LOCAL_CONFIG";
        break;
      case 5434:
        uint64_t result = "THREAD_BACKBONE_ROUTER_REGISTER";
        break;
      case 5435:
        uint64_t result = "THREAD_BACKBONE_ROUTER_REGISTRATION_JITTER";
        break;
      case 5436:
        uint64_t result = "THREAD_BACKBONE_ROUTER_MULTICAST_LISTENER_EVENT";
        break;
      case 5437:
        uint64_t result = "THREAD_ACTIVE_DATASET_TLVS";
        break;
      default:
        switch(a1)
        {
          case 4864:
            uint64_t result = "MAC_ALLOWLIST";
            break;
          case 4865:
            uint64_t result = "MAC_ALLOWLIST_ENABLED";
            break;
          case 4866:
            uint64_t result = "MAC_EXTENDED_ADDR";
            break;
          case 4867:
            uint64_t result = "MAC_SRC_MATCH_ENABLED";
            break;
          case 4868:
            uint64_t result = "MAC_SRC_MATCH_SHORT_ADDRESSES";
            break;
          case 4869:
            uint64_t result = "MAC_SRC_MATCH_EXTENDED_ADDRESSES";
            break;
          case 4870:
            uint64_t result = "MAC_DENYLIST";
            break;
          case 4871:
            uint64_t result = "MAC_DENYLIST_ENABLED";
            break;
          case 4872:
            uint64_t result = "MAC_FIXED_RSS";
            break;
          case 4873:
            uint64_t result = "MAC_CCA_FAILURE_RATE";
            break;
          case 4874:
            uint64_t result = "MAC_MAX_RETRY_NUMBER_DIRECT";
            break;
          case 4875:
            uint64_t result = "MAC_MAX_RETRY_NUMBER_INDIRECT";
            break;
          default:
            return result;
        }
        break;
    }
  }
  return result;
}

const char *spinel_net_role_to_cstr(unsigned int a1)
{
  if (a1 > 3) {
    return "NET_ROLE_UNKNONW";
  }
  else {
    return off_100074D70[(char)a1];
  }
}

const char *spinel_mcu_power_state_to_cstr(unsigned int a1)
{
  if (a1 > 2) {
    return "MCU_POWER_STATE_UNKNOWN";
  }
  else {
    return off_100074D90[(char)a1];
  }
}

const char *spinel_status_to_cstr(int a1)
{
  uint64_t result = "UNKNOWN";
  if (a1 > 103)
  {
    if (a1 > 15359)
    {
      int v3 = "SPINEL_STATUS_TRANSMIT_NOT_GRANTED";
      int v4 = "SPINEL_STATUS_LOG_DROPPED";
      if (a1 != 2000002) {
        int v4 = "UNKNOWN";
      }
      if (a1 == 2000001) {
        int v5 = "SPINEL_STATUS_IPV6_MSG_ALLOC_FAILURE";
      }
      else {
        int v5 = v4;
      }
      if (a1 != 2000000) {
        int v3 = v5;
      }
      uint64_t v6 = "NCP_BUFFER_THRESH_HIGH";
      int v7 = "NCP_BUFFER_THRESH_LOW";
      if (a1 != 15393) {
        int v7 = "UNKNOWN";
      }
      if (a1 != 15392) {
        uint64_t v6 = v7;
      }
      if (a1 == 15360) {
        __int16 v8 = "VENDOR_POWER_MAP_INVALID";
      }
      else {
        __int16 v8 = v6;
      }
      if (a1 <= 1999999) {
        return v8;
      }
      else {
        return v3;
      }
    }
    else
    {
      switch(a1)
      {
        case 'h':
          uint64_t result = "JOIN_FAILURE";
          break;
        case 'i':
          uint64_t result = "JOIN_SECURITY";
          break;
        case 'j':
          uint64_t result = "JOIN_NO_PEERS";
          break;
        case 'k':
          uint64_t result = "JOIN_INCOMPATIBLE";
          break;
        case 'l':
          uint64_t result = "JOIN_RSP_TIMEOUT";
          break;
        case 'm':
          uint64_t result = "JOIN_SUCCESS";
          break;
        case 'p':
          uint64_t result = "RESET_POWER_ON";
          break;
        case 'q':
          uint64_t result = "RESET_EXTERNAL";
          break;
        case 'r':
          uint64_t result = "RESET_SOFTWARE";
          break;
        case 's':
          uint64_t result = "RESET_FAULT";
          break;
        case 't':
          uint64_t result = "RESET_CRASH";
          break;
        case 'u':
          uint64_t result = "RESET_ASSERT";
          break;
        case 'v':
          uint64_t result = "RESET_OTHER";
          break;
        case 'w':
          uint64_t result = "RESET_UNKNOWN";
          break;
        case 'x':
          uint64_t result = "RESET_WATCHDOG";
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        uint64_t result = "OK";
        break;
      case 1:
        uint64_t result = "FAILURE";
        break;
      case 2:
        uint64_t result = "UNIMPLEMENTED";
        break;
      case 3:
        uint64_t result = "INVALID_ARGUMENT";
        break;
      case 4:
        uint64_t result = "INVALID_STATE";
        break;
      case 5:
        uint64_t result = "INVALID_COMMAND";
        break;
      case 6:
        uint64_t result = "INVALID_INTERFACE";
        break;
      case 7:
        uint64_t result = "INTERNAL_ERROR";
        break;
      case 8:
        uint64_t result = "SECURITY_ERROR";
        break;
      case 9:
        uint64_t result = "PARSE_ERROR";
        break;
      case 10:
        uint64_t result = "IN_PROGRESS";
        break;
      case 11:
        uint64_t result = "NOMEM";
        break;
      case 12:
        uint64_t result = "BUSY";
        break;
      case 13:
        uint64_t result = "PROP_NOT_FOUND";
        break;
      case 14:
        uint64_t result = "DROPPED";
        break;
      case 15:
        uint64_t result = "EMPTY";
        break;
      case 16:
        uint64_t result = "CMD_TOO_BIG";
        break;
      case 17:
        uint64_t result = "NO_ACK";
        break;
      case 18:
        uint64_t result = "CCA_FAILURE";
        break;
      case 19:
        uint64_t result = "ALREADY";
        break;
      case 20:
        uint64_t result = "ITEM_NOT_FOUND";
        break;
      case 21:
        uint64_t result = "INVALID_COMMAND_FOR_PROP";
        break;
      case 22:
        uint64_t result = "UNKNOWN_NEIGHBOR";
        break;
      case 23:
        uint64_t result = "NOT_CAPABLE";
        break;
      case 24:
        uint64_t result = "RESPONSE_TIMEOUT";
        break;
      default:
        return result;
    }
  }
  return result;
}

const char *spinel_capability_to_cstr(int a1)
{
  uint64_t result = "UNKNOWN";
  if (a1 > 511)
  {
    if (a1 > 1023)
    {
      if (a1 > 15295)
      {
        if (a1 == 15298) {
          int v3 = "NEST_TRANSMIT_HOOK";
        }
        else {
          int v3 = "UNKNOWN";
        }
        if (a1 == 15297) {
          int v4 = "NEST_LEGACY_NET_WAKE";
        }
        else {
          int v4 = v3;
        }
        if (a1 == 15296) {
          return "NEST_LEGACY_INTERFACE";
        }
        else {
          return v4;
        }
      }
      else
      {
        switch(a1)
        {
          case 1024:
            uint64_t result = "THREAD_COMMISSIONER";
            break;
          case 1025:
            uint64_t result = "THREAD_TMF_PROXY";
            break;
          case 1026:
            uint64_t result = "THREAD_UDP_FORWARD";
            break;
          case 1027:
            uint64_t result = "THREAD_JOINER";
            break;
          case 1028:
            uint64_t result = "THREAD_BORDER_ROUTER";
            break;
          case 1029:
            uint64_t result = "THREAD_SERVICE";
            break;
          case 1030:
            uint64_t result = "THREAD_CSL_RECEIVER";
            break;
          case 1031:
            uint64_t result = "THREAD_LINK_METRICS";
            break;
          default:
            return result;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 512:
          uint64_t result = "MAC_WHITELIST";
          break;
        case 513:
          uint64_t result = "MAC_RAW";
          break;
        case 514:
          uint64_t result = "OOB_STEERING_DATA";
          break;
        case 515:
          uint64_t result = "CHANNEL_MONITOR";
          break;
        case 516:
          uint64_t result = "ERROR_RATE_TRACKING";
          break;
        case 517:
          uint64_t result = "CHANNEL_MANAGER";
          break;
        case 518:
          uint64_t result = "OPENTHREAD_LOG_METADATA";
          break;
        case 519:
          uint64_t result = "TIME_SYNC";
          break;
        case 520:
          uint64_t result = "CHILD_SUPERVISION";
          break;
        case 521:
          uint64_t result = "POSIX_APP";
          break;
        case 522:
          uint64_t result = "SLAAC";
          break;
        case 523:
          uint64_t result = "RADIO_COEX";
          break;
        case 524:
          uint64_t result = "MAC_RETRY_HISTOGRAM";
          break;
        case 525:
        case 526:
        case 528:
          return result;
        case 527:
          uint64_t result = "DUA";
          break;
        case 529:
          uint64_t result = "TRANSMIT_POWER_CONTROL";
          break;
        default:
          if (a1 == 638) {
            uint64_t result = "CHANNEL_UTILIZATION_MONITOR";
          }
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        uint64_t result = "LOCK";
        break;
      case 2:
        uint64_t result = "NET_SAVE";
        break;
      case 3:
        uint64_t result = "HBO";
        break;
      case 4:
        uint64_t result = "POWER_SAVE";
        break;
      case 5:
        uint64_t result = "COUNTERS";
        break;
      case 6:
        uint64_t result = "JAM_DETECT";
        break;
      case 7:
        uint64_t result = "PEEK_POKE";
        break;
      case 8:
        uint64_t result = "WRITABLE_RAW_STREAM";
        break;
      case 9:
        uint64_t result = "GPIO";
        break;
      case 10:
        uint64_t result = "TRNG";
        break;
      case 11:
        uint64_t result = "CMD_MULTI";
        break;
      case 12:
        uint64_t result = "UNSOL_UPDATE_FILTER";
        break;
      case 13:
        uint64_t result = "MCU_POWER_STATE";
        break;
      case 14:
        uint64_t result = "PCAP";
        break;
      case 16:
        uint64_t result = "802_15_4_2003";
        break;
      case 17:
        uint64_t result = "802_15_4_2006";
        break;
      case 18:
        uint64_t result = "802_15_4_2011";
        break;
      case 21:
        uint64_t result = "802_15_4_PIB";
        break;
      case 24:
        uint64_t result = "802_15_4_2450MHZ_OQPSK";
        break;
      case 25:
        uint64_t result = "802_15_4_915MHZ_OQPSK";
        break;
      case 26:
        uint64_t result = "802_15_4_868MHZ_OQPSK";
        break;
      case 27:
        uint64_t result = "802_15_4_915MHZ_BPSK";
        break;
      case 28:
        uint64_t result = "802_15_4_868MHZ_BPSK";
        break;
      case 29:
        uint64_t result = "802_15_4_915MHZ_ASK";
        break;
      case 30:
        uint64_t result = "802_15_4_868MHZ_ASK";
        break;
      case 32:
        uint64_t result = "CONFIG_FTD";
        break;
      case 33:
        uint64_t result = "CONFIG_MTD";
        break;
      case 34:
        uint64_t result = "CONFIG_RADIO";
        break;
      case 48:
        uint64_t result = "ROLE_ROUTER";
        break;
      case 49:
        uint64_t result = "ROLE_SLEEPY";
        break;
      case 52:
        uint64_t result = "NET_THREAD_1_0";
        break;
      case 53:
        uint64_t result = "NET_THREAD_1_1";
        break;
      case 54:
        uint64_t result = "NET_THREAD_1_2";
        break;
      default:
        return result;
    }
  }
  return result;
}

const char *spinel_link_metrics_status_to_cstr(char a1)
{
  if ((a1 + 2) > 6u) {
    return "UNKNOWN";
  }
  else {
    return off_100074DA8[(char)(a1 + 2)];
  }
}

id sub_10001A178(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v2 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v1 options:0];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id sub_10001A680(void *a1)
{
  if (a1)
  {
    a1 = [a1 base64EncodedStringWithOptions:0];
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_10001C50C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_10001C538(void *a1, NSObject *a2)
{
  int v4 = [a1 network];
  int v5 = [v4 networkName];
  uint64_t v6 = [a1 network];
  int v7 = [v6 extendedPANID];
  int v9 = 138412546;
  uint64_t v10 = v5;
  sub_10001C52C();
  uint64_t v11 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to calculate UUID (name=%@; xpanid=%@)!",
    (uint8_t *)&v9,
    0x16u);
}

void sub_10001C620(void *a1)
{
  id v2 = [a1 network];
  int v3 = [v2 networkName];
  int v4 = [a1 network];
  int v5 = [v4 extendedPANID];
  uint64_t v6 = [a1 borderAgent];
  int v7 = [v6 discriminatorId];
  uint64_t v8 = [a1 keychainAccessGroup];
  sub_10001C52C();
  sub_10001C50C((void *)&_mh_execute_header, v9, v10, "Failed to calculate UUID (name=%@; xpanid=%@; discriminatorId=%@; keychainAccessGroup=%@)!",
    v11,
    v12,
    v13,
    v14,
    2u);
}

void sub_10001C748()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : %d:  Failed to decode Keychain item (unable to form THThreadNetwork)!", v2, v3, v4, v5, v6);
}

void sub_10001C7C4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode Keychain item (unable to form THThreadNetworkBorderAgent)!", v2, v3, v4, v5, v6);
}

void sub_10001C840(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decode keychainAccessGroup!", v1, 2u);
}

void sub_10001C884(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 uniqueIdentifier];
  int v6 = 138412546;
  int v7 = v5;
  sub_10001C52C();
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Warning: decoded record with identifier %@ but does not match expected %@!", (uint8_t *)&v6, 0x16u);
}

void sub_10001C930()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode Keychain item (credentialsDataSet could not be deserialized)! Using empty credential template.", v2, v3, v4, v5, v6);
}

void sub_10001C9AC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to decode Keychain item (credentialsDataSet could not be deserialized)!", v2, v3, v4, v5, v6);
}

void sub_10001CA28(os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "+[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:]";
  __int16 v3 = 1024;
  int v4 = 187;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:%d, Failed to decode Keychain item - Ba Discriminator Id  (baDiscriminatorId=%@)!", (uint8_t *)&v1, 0x1Cu);
}

void sub_10001CAC8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d Failed to decode Keychain item (credentials could not be deserialized)! Using empty credential template.", v2, v3, v4, v5, v6);
}

void sub_10001CB44(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: unable to form add operation due to missing data", v1, 2u);
}

void sub_10001CB88(void *a1)
{
  uint64_t v2 = [a1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [a1 network];
  uint64_t v5 = [v4 extendedPANID];
  uint8_t v6 = [a1 borderAgent];
  int v7 = [v6 discriminatorId];
  sub_10001C52C();
  sub_10001C50C((void *)&_mh_execute_header, v8, v9, "Illegal attempt to form keychain item with insufficient information (name=%@; xpanid=%@; discriminatorId=%@; uuid=%@)!",
    v10,
    v11,
    v12,
    v13,
    2u);
}

id sub_10001CCA0(int a1)
{
  if (qword_10007D648 != -1) {
    dispatch_once(&qword_10007D648, &stru_100074DF8);
  }
  uint64_t v2 = (void *)qword_10007D638[a1];

  return v2;
}

void sub_10001CD04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.thread", "unspecified");
  uint64_t v2 = (void *)qword_10007D638[0];
  qword_10007D638[0] = (uint64_t)v1;

  qword_10007D640 = (uint64_t)os_log_create("com.apple.thread", "store");

  _objc_release_x1();
}

void sub_10001CDC8(id a1)
{
  qword_10007D650 = objc_alloc_init(THThreadNetworkCredentialsKeychainBackingStore);

  _objc_release_x1();
}

void sub_10001D24C(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) networkName];
    uint64_t v5 = [*(id *)(a1 + 32) extendedPANID];
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch credentials for network (name=%@, xpanid=%@)", buf, 0x16u);
  }
  uint8_t v6 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForFetchOperationForNetwork:*(void *)(a1 + 32)];
  int v7 = *(void **)(a1 + 40);
  id v10 = 0;
  uint64_t v8 = [v7 _doFetchRecords:v6 error:&v10];
  id v9 = v10;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001D464(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch all credentials", buf, 2u);
  }

  uint64_t v4 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForFetchAllOperation];
  uint64_t v5 = *(void **)(a1 + 32);
  id v12 = 0;
  uint8_t v6 = [v5 _doFetchRecords:v4 error:&v12];
  id v7 = v12;
  uint64_t v8 = sub_10001CCA0(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "fetched all credentials", v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v9 = sub_10001CCA0(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "fetched all credentials, and completion block is done", v10, 2u);
  }
}

void sub_10001D6C0(void *a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch credential with UUID %@", buf, 0xCu);
  }

  uint64_t v5 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForFetchOneOperationForUniqueIdentifier:a1[4]];
  uint8_t v6 = (void *)a1[5];
  id v11 = 0;
  id v7 = [v6 _doFetchRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[6];
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

void sub_10001DAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DB1C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a2 == 0;
  uint64_t v4 = sub_10001CCA0(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known state is Likely good", buf, 2u);
    }

    dispatch_group_t v7 = dispatch_group_create();
    *(void *)buf = 0;
    uint64_t v42 = buf;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001E244;
    v37[3] = &unk_100074E90;
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v39 = buf;
    uint64_t v40 = v8;
    uint8_t v6 = v7;
    v38 = v6;
    uint64_t v9 = objc_retainBlock(v37);
    dispatch_group_enter(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E454;
    block[3] = &unk_100074EB8;
    uint64_t v36 = *(void *)(a1 + 72);
    id v10 = *(NSObject **)(a1 + 32);
    id v34 = *(id *)(a1 + 40);
    id v35 = *(id *)(a1 + 64);
    dispatch_group_notify(v6, v10, block);
    int v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    __int16 v30 = sub_10001E6B8;
    __int16 v31 = &unk_100074EE0;
    id v11 = v9;
    id v32 = v11;
    uint64_t v12 = _SecItemAddAndNotifyOnSync();
    uint64_t v13 = sub_10001CCA0(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = "error";
      int v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      *(_DWORD *)int v45 = 136315650;
      if (!v12) {
        uint64_t v14 = "success";
      }
      __int16 v47 = 1024;
      int v48 = 286;
      __int16 v49 = 2080;
      uint64_t v50 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync return value : %s...", v45, 0x1Cu);
    }

    if (v12)
    {
      BOOL v15 = sub_10001CCA0(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v45 = 136315394;
        int v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 292;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync returned error", v45, 0x12u);
      }

      if (v12 != -25299) {
        goto LABEL_21;
      }
      uint64_t v16 = sub_10001CCA0(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v45 = 136315138;
        int v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", v45, 0xCu);
      }

      CFDictionaryRef v17 = [*(id *)(a1 + 40) keyChainQueryForUpdateOperation];
      CFDictionaryRef v18 = [*(id *)(a1 + 40) keyChainItemRepresentationForUpdateOperation];
      uint64_t v12 = SecItemUpdate(v17, v18);
      if (v12)
      {
        char v19 = sub_10001CCA0(1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v45 = 136315394;
          int v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 300;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s:%d SecItemUpdate returned error", v45, 0x12u);
        }

LABEL_21:
        int v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v45 = 136315394;
          int v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
          __int16 v47 = 1024;
          int v48 = 305;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d Returning error", v45, 0x12u);
        }

        [*(id *)(a1 + 56) errorout:v12 completion:*(void *)(a1 + 64)];
        goto LABEL_31;
      }

      int v25 = sub_10001CCA0(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v45 = 136315394;
        int v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 310;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s:%d Credential exists, updated successfully..", v45, 0x12u);
      }

      __int16 v24 = [*(id *)(a1 + 40) computedUniqueIdentifier];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      dispatch_time_t v21 = dispatch_time(0, 1000000000 * *(unsigned __int16 *)(a1 + 80));
      int v22 = *(NSObject **)(a1 + 32);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10001E7A4;
      v26[3] = &unk_100074F08;
      int v27 = v11;
      dispatch_after(v21, v22, v26);
      size_t v23 = sub_10001CCA0(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v45 = 136315394;
        int v46 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 330;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Scheduled !....... ", v45, 0x12u);
      }

      __int16 v24 = v27;
    }

LABEL_31:
    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known is Not good", buf, 2u);
  }

  uint8_t v6 = +[NSError storeError:7 description:@"CKKS response for known state is Not good"];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_32:
}

void sub_10001E1FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10001E244(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned __int8 *)&v4, 1u);
  BOOL v5 = v4 == 0;
  uint8_t v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 227;
    __int16 v16 = 1024;
    LODWORD(v17) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d nowFinished : %d", (uint8_t *)&v12, 0x18u);
  }

  if (v5)
  {
    if (v3)
    {
      dispatch_group_t v7 = sub_10001CCA0(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 235;
        __int16 v16 = 2112;
        id v17 = v3;
        uint64_t v8 = "%s:%d Credential sync error, ErrorInfo : %@ ";
        uint64_t v9 = v7;
        uint32_t v10 = 28;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      dispatch_group_t v7 = sub_10001CCA0(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v12 = 136315650;
        uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 233;
        __int16 v16 = 1024;
        LODWORD(v17) = v11;
        uint64_t v8 = "%s:%d Credential sync Complete, syncDone : %d";
        uint64_t v9 = v7;
        uint32_t v10 = 24;
        goto LABEL_9;
      }
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_10001E454(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = sub_10001CCA0(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      OSStatus v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 255;
      __int16 v14 = 1024;
      OSStatus v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Inside group notify block, sync is done, syncDone : %d", (uint8_t *)&v10, 0x18u);
    }

    CFDictionaryRef v4 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    CFDictionaryRef v4 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForDeleteOperationForUniqueIdentifier:v5];

    OSStatus v6 = SecItemDelete(v4);
    dispatch_group_t v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 264;
      __int16 v14 = 1024;
      OSStatus v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d sync not done, let's delete the local record, Got on deletion : (err=%d)", (uint8_t *)&v10, 0x18u);
    }

    uint64_t v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Error, Sync failure ", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = +[NSError storeError:6 description:@"Error, iCloud Sync failure"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_10001E6B8(uint64_t a1, int a2, uint64_t a3)
{
  OSStatus v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Inside Sync completion, didSync : %d, ErrorInfo : %@ ", (uint8_t *)&v8, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001E7A4(uint64_t a1)
{
  uint64_t v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    BOOL v5 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecordAndSync:completion:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 325;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Fired !!! ", (uint8_t *)&v4, 0x12u);
  }

  OSStatus v3 = +[NSError storeError:8 description:@"Error, Credentials sync timed out"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001E994(uint64_t a1)
{
  uint64_t v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    OSStatus v3 = [*(id *)(a1 + 32) network];
    int v4 = [v3 networkName];
    BOOL v5 = [*(id *)(a1 + 32) network];
    __int16 v6 = [v5 extendedPANID];
    int v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v16 = 138412802;
    id v17 = v4;
    __int16 v18 = 2112;
    char v19 = v6;
    __int16 v20 = 2112;
    dispatch_time_t v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Request to store credential (networkName=%@, xpanid=%@, uuid=%@", (uint8_t *)&v16, 0x20u);
  }
  CFDictionaryRef v8 = [*(id *)(a1 + 32) keyChainItemRepresentationForAddOperation];
  CFDictionaryRef v9 = v8;
  if (!v8)
  {
    __int16 v10 = +[NSError storeError:4 description:@"Bad network parameter"];
    int v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_7:
    v11();

    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v12 = SecItemAdd(v8, 0);
    if (v12 == -25299)
    {
      uint64_t v13 = sub_10001CCA0(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore storeRecord:waitForSync:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", (uint8_t *)&v16, 0xCu);
      }

      CFDictionaryRef v14 = [*(id *)(a1 + 32) keyChainQueryForUpdateOperation];
      CFDictionaryRef v15 = [*(id *)(a1 + 32) keyChainItemRepresentationForUpdateOperation];
      uint64_t v12 = SecItemUpdate(v14, v15);
    }
    if (v12)
    {
      [*(id *)(a1 + 40) errorout:v12 completion:*(void *)(a1 + 48)];
      goto LABEL_14;
    }
    __int16 v10 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    int v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  [*(id *)(a1 + 40) storeRecordAndSync:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
LABEL_14:
}

void sub_10001ECF0(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(const char **)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE credential with identifier %@", (uint8_t *)&v12, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForDeleteOperationForUniqueIdentifier:*(void *)(a1 + 32)];
  OSStatus v6 = SecItemDelete(v5);
  int v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteRecordWithUniqueIdentifier:completion:]_block_invoke";
    __int16 v14 = 1024;
    OSStatus v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    CFDictionaryRef v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    CFDictionaryRef v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B5CC();
    }

    __int16 v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    int v11 = +[NSError storeError:2 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10001FAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001FAD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001FAE0(uint64_t a1)
{
}

void sub_10001FAE8(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  CFDictionaryRef v8 = a1 + 6;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    id v10 = [*(id *)(*(void *)(*v8 + 8) + 40) count];
    int v11 = sub_10001CCA0(1);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!v10)
    {
      if (v12) {
        sub_10003B9E0();
      }

      goto LABEL_5;
    }
    char v44 = a1;
    if (v12) {
      sub_10003BB0C((uint64_t)(a1 + 6));
    }
    id v45 = v7;
    id v46 = v6;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v13 = *(id *)(*(void *)(*v8 + 8) + 40);
    id v14 = [v13 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v13);
          }
          char v19 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          __int16 v20 = [v19 keychainAccessGroup];
          if ([v20 isEqualToString:@"0000000000"])
          {
          }
          else
          {
            dispatch_time_t v21 = [v19 keychainAccessGroup];
            uint64_t v22 = [v21 isEqualToString:@"com.apple.thread.network"] ^ 1;

            v16 += v22;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v15);
    }

    size_t v23 = +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation];
    id v6 = v46;
    if (v23)
    {
      __int16 v24 = (void *)v44[4];
      id v52 = 0;
      int v25 = [v24 _doFetchPreferredNetworks:v23 error:&v52];
      id v26 = v52;
      int v27 = sub_10001CCA0(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [v25 count];
        *(_DWORD *)buf = 136315650;
        v59 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveThirdPartyInfo:]_block_invoke";
        __int16 v60 = 1024;
        int v61 = 640;
        __int16 v62 = 2048;
        id v63 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s : %d - Preferred Networks in Database = %lu", buf, 0x1Cu);
      }

      if ([v25 count])
      {
        id v43 = v26;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v42 = v25;
        id v29 = v25;
        id v30 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (!v30) {
          goto LABEL_47;
        }
        id v31 = v30;
        uint64_t v47 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = *(void *)v49;
        while (1)
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v49 != v33) {
              objc_enumerationMutation(v29);
            }
            id v35 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
            if (v35)
            {
              uint64_t v36 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) userInfo];
              if ([v36 isEqualToString:@"0000000000"])
              {

LABEL_36:
                ++v32;
                continue;
              }
              int v37 = [v35 userInfo];
              unsigned __int8 v38 = [v37 isEqualToString:@"com.apple.thread.network"];

              if (v38) {
                goto LABEL_36;
              }
              ++v47;
            }
          }
          id v31 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (!v31)
          {
LABEL_47:

            int v41 = +[NSError storeError:0 description:@"Success: Found the thirdParty information"];
            (*(void (**)(void))(v44[5] + 16))();
            id v7 = v45;
            id v6 = v46;
            id v26 = v43;
            int v25 = v42;
            goto LABEL_48;
          }
        }
      }
      uint64_t v40 = sub_10001CCA0(1);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_10003BA90();
      }

      int v41 = +[NSError storeError:9 description:@"Failed to find any  preferred network"];
      (*(void (**)(void))(v44[5] + 16))();
LABEL_48:
    }
    else
    {
      uint64_t v39 = sub_10001CCA0(1);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_10003BA14();
      }

      id v26 = +[NSError storeError:3 description:@"Failed to create query to retrieve preferred network"];
      (*(void (**)(void))(v44[5] + 16))();
    }

    goto LABEL_50;
  }
  uint64_t v9 = sub_10001CCA0(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10003BB94((uint64_t)(a1 + 7));
  }

LABEL_5:
  (*(void (**)(void))(a1[5] + 16))();
LABEL_50:
}

void sub_100020180(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [*(id *)(a1 + 32) networkName];
    CFDictionaryRef v5 = [*(id *)(a1 + 32) extendedPANID];
    *(_DWORD *)buf = 136315906;
    BOOL v12 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveAllActiveDataSetRecordsForNetwork:completion:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 680;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    __int16 v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s : %d - Request to fetch active dataset records for network (name=%@, xpanid=%@)", buf, 0x26u);
  }
  id v6 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  id v10 = 0;
  CFDictionaryRef v8 = [v7 _doFetchActiveDataSetRecords:v6 error:&v10];
  id v9 = v10;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000203B8(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch all active dataset records", buf, 2u);
  }

  int v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchAllActiveDataSetRecordsOperation];
  CFDictionaryRef v5 = *(void **)(a1 + 32);
  id v8 = 0;
  id v6 = [v5 _doFetchActiveDataSetRecords:v4 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100020584(void *a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with UUID %@", buf, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:a1[4]];
  id v6 = (void *)a1[5];
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[6];
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

void sub_1000207A8(void *a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with xpanid %@", buf, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:a1[4]];
  id v6 = (void *)a1[5];
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[6];
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

void sub_1000209CC(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with xpanid %@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 40) checkWiFiStatus])
  {
    CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:*(void *)(a1 + 32)];
    id v6 = *(void **)(a1 + 40);
    id v16 = 0;
    id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v16];
    id v8 = v16;
    uint64_t v9 = [v7 anyObject];
    id v10 = v9;
    if (v8 || !v9)
    {
      int v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v11 = *(void **)(a1 + 40);
      BOOL v12 = [v9 network];
      uint64_t v13 = [v12 extendedPANID];
      LODWORD(v11) = [v11 checkIfXpanIDMatchToMDNSScan:v13];

      if (!v11)
      {
        __int16 v15 = +[NSError storeError:20 description:@"Thread network credentials does not match with any of the active thread networks around"];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_12;
      }
      int v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v14();
LABEL_12:

    goto LABEL_13;
  }
  id v10 = +[NSError storeError:19 description:@"Error : Device is not connected to the network"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
}

void sub_100020CE0(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with borderAgent %@", buf, 0xCu);
  }
  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:*(void *)(a1 + 32)];
  id v6 = *(void **)(a1 + 40);
  id v11 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

void sub_100020F14(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with borderAgent %@", buf, 0xCu);
  }
  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:*(void *)(a1 + 32)];
  id v6 = *(void **)(a1 + 40);
  id v25 = 0;
  id v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v25];
  id v8 = v25;
  if (!v8)
  {
    char v19 = v7;
    __int16 v20 = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(a1 + 40);
          __int16 v15 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v13), "credentialsDataSet", v19, v20, (void)v21);
          id v16 = [v15 dataSetArray];
          LODWORD(v14) = [v14 areValidDataSetTLVs:v16];

          if (v14)
          {
            __int16 v17 = sub_10001CCA0(1);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = [*(id *)(a1 + 32) discriminatorId];
              *(_DWORD *)buf = 138412290;
              id v28 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Return the record for borderAgent ID %@", buf, 0xCu);
            }
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

            id v8 = 0;
            goto LABEL_16;
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v8 = +[NSError storeError:28 description:@"Error: Does Not Have DataSet TLVs"];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
    id v7 = v19;
    uint64_t v2 = v20;
  }
}

void sub_100021CD0(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    long long v23 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAcces"
          "sGroup:activeFlag:completion:]_block_invoke";
    __int16 v24 = 1024;
    int v25 = 910;
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    __int16 v28 = 1024;
    int v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d: Request to fetch active dataset record with Client Keychain Access Group %@, active flag :%d", buf, 0x22u);
  }

  id v6 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  id v21 = 0;
  id v8 = [v7 _doFetchActiveDataSetRecords:v6 error:&v21];
  id v9 = v21;
  if (v8
    && (![v8 count]
     || !*(unsigned char *)(a1 + 56)
     || ([*(id *)(a1 + 40) getActiveRecords:v8],
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         v8,
         (id v8 = (void *)v10) != 0))
    && [v8 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = sub_10001CCA0(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003BD38(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    char v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:0 userInfo:0];
    uint64_t v20 = +[NSError storeError:3 underlyingError:v19 description:@"Failed to retrieve all active border router records"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v9 = (id)v20;
  }
}

void sub_100022010(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    long long v23 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAcces"
          "sGroup:activeFlag:compleiton:]_block_invoke";
    __int16 v24 = 1024;
    int v25 = 947;
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    __int16 v28 = 1024;
    int v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d: Request to fetch active dataset record with Client Keychain Access Group %@, active flag :%d", buf, 0x22u);
  }

  id v6 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:*(void *)(a1 + 32)];
  id v7 = *(void **)(a1 + 40);
  id v21 = 0;
  id v8 = [v7 _doFetchActiveDataSetRecords:v6 error:&v21];
  id v9 = v21;
  if (v8
    && (![v8 count]
     || !*(unsigned char *)(a1 + 56)
     || ([*(id *)(a1 + 40) getActiveRecords:v8],
         uint64_t v10 = objc_claimAutoreleasedReturnValue(),
         v8,
         (id v8 = (void *)v10) != 0))
    && [v8 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = sub_10001CCA0(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003BD38(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    char v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:0 userInfo:0];
    uint64_t v20 = +[NSError storeError:3 underlyingError:v19 description:@"Failed to retrieve all active border router records"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v9 = (id)v20;
  }
}

void sub_100022338(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(const char **)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE credential with identifier %@", (uint8_t *)&v12, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifier:*(void *)(a1 + 32)];
  OSStatus v6 = SecItemDelete(v5);
  id v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordWithUniqueIdentifier:completion:]_block_invoke";
    __int16 v14 = 1024;
    OSStatus v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    id v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003BDB0();
    }

    uint64_t v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:2 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100022624(uint64_t a1)
{
  OSStatus v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgent:completion:]_block_invoke";
    __int16 v14 = 2112;
    OSStatus v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Request to DELETE credential with Ba %@", (uint8_t *)&v12, 0x16u);
  }
  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:*(void *)(a1 + 32)];
  OSStatus v6 = SecItemDelete(v5);
  id v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgent:completion:]_block_invoke";
    __int16 v14 = 1024;
    LODWORD(v15) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    id v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003BE18();
    }

    uint64_t v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:2 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100022A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022A9C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a2 == 0;
  uint64_t v4 = sub_10001CCA0(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known state is Likely good", buf, 2u);
    }

    dispatch_group_t v7 = dispatch_group_create();
    *(void *)buf = 0;
    char v44 = buf;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000231F0;
    v38[3] = &unk_100074FD0;
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 72);
    int v41 = buf;
    uint64_t v42 = v9;
    v38[4] = *(void *)(a1 + 32);
    id v39 = v8;
    OSStatus v6 = v7;
    uint64_t v40 = v6;
    uint64_t v10 = objc_retainBlock(v38);
    dispatch_group_enter(v6);
    id v11 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023430;
    block[3] = &unk_100074EB8;
    uint64_t v37 = *(void *)(a1 + 72);
    id v35 = *(id *)(a1 + 40);
    id v36 = *(id *)(a1 + 64);
    dispatch_group_notify(v6, v11, block);
    int v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    id v31 = sub_100023694;
    uint64_t v32 = &unk_100074EE0;
    int v12 = v10;
    id v33 = v12;
    uint64_t v13 = _SecItemAddAndNotifyOnSync();
    __int16 v14 = sub_10001CCA0(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      OSStatus v15 = "error";
      long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      *(_DWORD *)uint64_t v47 = 136315650;
      if (!v13) {
        OSStatus v15 = "success";
      }
      __int16 v49 = 1024;
      int v50 = 1154;
      __int16 v51 = 2080;
      id v52 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync return value : %s...", v47, 0x1Cu);
    }

    if (v13)
    {
      uint64_t v16 = sub_10001CCA0(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v47 = 136315394;
        long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 1160;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:%d _SecItemAddAndNotifyOnSync returned error", v47, 0x12u);
      }

      if (v13 != -25299) {
        goto LABEL_21;
      }
      uint64_t v17 = sub_10001CCA0(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v47 = 136315138;
        long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", v47, 0xCu);
      }

      CFDictionaryRef v18 = [*(id *)(a1 + 40) keyChainQueryForActiveDataSetRecordUpdateOperation];
      CFDictionaryRef v19 = [*(id *)(a1 + 40) keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
      uint64_t v13 = SecItemUpdate(v18, v19);
      if (v13)
      {
        uint64_t v20 = sub_10001CCA0(1);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v47 = 136315394;
          long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
          __int16 v49 = 1024;
          int v50 = 1168;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d SecItemUpdate returned error", v47, 0x12u);
        }

LABEL_21:
        id v21 = sub_10001CCA0(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v47 = 136315394;
          long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
          __int16 v49 = 1024;
          int v50 = 1173;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s:%d Returning error", v47, 0x12u);
        }

        [*(id *)(a1 + 32) errorout:v13 completion:*(void *)(a1 + 64)];
        goto LABEL_31;
      }

      __int16 v26 = sub_10001CCA0(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v47 = 136315394;
        long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 1178;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s:%d Credential exists, updated successfully..", v47, 0x12u);
      }

      int v25 = [*(id *)(a1 + 40) computedUniqueIdentifier];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      dispatch_time_t v22 = dispatch_time(0, 1000000000 * *(unsigned __int16 *)(a1 + 80));
      long long v23 = *(NSObject **)(a1 + 48);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100023780;
      v27[3] = &unk_100074F08;
      __int16 v28 = v12;
      dispatch_after(v22, v23, v27);
      __int16 v24 = sub_10001CCA0(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v47 = 136315394;
        long long v48 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
        __int16 v49 = 1024;
        int v50 = 1198;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Scheduled !....... ", v47, 0x12u);
      }

      int v25 = v28;
    }

LABEL_31:
    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known is Not good", buf, 2u);
  }

  OSStatus v6 = +[NSError storeError:7 description:@"CKKS response for known state is Not good"];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_32:
}

void sub_1000231A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000231F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (unsigned __int8 *)&v4, 1u);
  BOOL v5 = v4 == 0;
  OSStatus v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 1091;
    __int16 v16 = 1024;
    LODWORD(v17) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d nowFinished : %d", (uint8_t *)&v12, 0x18u);
  }

  if (v5)
  {
    if (v3)
    {
      dispatch_group_t v7 = sub_10001CCA0(1);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
        goto LABEL_14;
      }
      int v12 = 136315650;
      uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1103;
      __int16 v16 = 2112;
      id v17 = v3;
      id v8 = "%s:%d Credential sync error, ErrorInfo : %@ ";
      uint64_t v9 = v7;
      uint32_t v10 = 28;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      if (_os_feature_enabled_impl()
        && ([*(id *)(a1 + 32) markAsPreferred:*(void *)(a1 + 40)] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
      dispatch_group_t v7 = sub_10001CCA0(1);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v12 = 136315650;
      uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1101;
      __int16 v16 = 1024;
      LODWORD(v17) = v11;
      id v8 = "%s:%d Credential sync Complete, syncDone : %d";
      uint64_t v9 = v7;
      uint32_t v10 = 24;
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    goto LABEL_13;
  }
LABEL_14:
}

void sub_100023430(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = sub_10001CCA0(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      OSStatus v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 1123;
      __int16 v14 = 1024;
      OSStatus v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Inside group notify block, sync is done, syncDone : %d", (uint8_t *)&v10, 0x18u);
    }

    CFDictionaryRef v4 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) borderAgent];
    CFDictionaryRef v4 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:v5];

    OSStatus v6 = SecItemDelete(v4);
    dispatch_group_t v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 1132;
      __int16 v14 = 1024;
      OSStatus v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d sync not done, let's delete the local record, Got on deletion : (err=%d)", (uint8_t *)&v10, 0x18u);
    }

    id v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Error, Sync failure ", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = +[NSError storeError:6 description:@"Error, iCloud Sync failure"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100023694(uint64_t a1, int a2, uint64_t a3)
{
  OSStatus v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Inside Sync completion, didSync : %d, ErrorInfo : %@ ", (uint8_t *)&v8, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100023780(uint64_t a1)
{
  uint64_t v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    BOOL v5 = "-[THThreadNetworkCredentialsKeychainBackingStore storeActiveDataSetRecordAndSync:completion:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1193;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Timer Fired !!! ", (uint8_t *)&v4, 0x12u);
  }

  OSStatus v3 = +[NSError storeError:8 description:@"Error, Credentials sync timed out"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100023C70(uint64_t a1)
{
  uint64_t v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    OSStatus v3 = [*(id *)(a1 + 32) network];
    int v4 = [v3 networkName];
    BOOL v5 = [*(id *)(a1 + 32) network];
    __int16 v6 = [v5 extendedPANID];
    int v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v48 = 136316162;
    __int16 v49 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkWithNewDatasetRecord:completion:]_block_invoke";
    __int16 v50 = 1024;
    int v51 = 1255;
    __int16 v52 = 2112;
    long long v53 = v4;
    __int16 v54 = 2112;
    long long v55 = v6;
    __int16 v56 = 2112;
    v57 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:%d: :Request to update preferred credentials with (networkName=%@, xpanid=%@, uuid = %@", (uint8_t *)&v48, 0x30u);
  }
  int v8 = *(void **)(a1 + 32);
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = [v8 credentialsDataSet];
  if (!v9) {
    goto LABEL_10;
  }
  __int16 v10 = (void *)v9;
  int v11 = [*(id *)(a1 + 32) credentialsDataSet];
  uint64_t v12 = [v11 dataSetArray];
  if (!v12)
  {

    goto LABEL_10;
  }
  uint64_t v13 = (void *)v12;
  __int16 v14 = [*(id *)(a1 + 32) credentialsDataSet];
  OSStatus v15 = [v14 dataSetArray];
  id v16 = [v15 length];

  if (!v16)
  {
LABEL_10:
    uint64_t v27 = sub_10001CCA0(1);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10003BF84();
    }

    CFStringRef v25 = @"record parameter is invalid";
    uint64_t v26 = 4;
    goto LABEL_13;
  }
  id v17 = [*(id *)(a1 + 32) credentials];
  [v17 setIsActiveDevice:1];

  id v18 = objc_alloc((Class)THThreadNetworkCredentialsDataSet);
  CFDictionaryRef v19 = [*(id *)(a1 + 32) credentialsDataSet];
  uint64_t v20 = [v19 dataSetArray];
  id v21 = [*(id *)(a1 + 32) credentials];
  dispatch_time_t v22 = [v21 userInfo];
  id v23 = [v18 initWithDataSetArray:v20 userInfo:v22];
  __int16 v24 = [*(id *)(a1 + 32) credentials];
  [v24 setCredentialsDataSet:v23];

  if (![*(id *)(a1 + 40) isFrozenRecord:*(void *)(a1 + 32)])
  {
    CFDictionaryRef v29 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordAddOperation];
    __int16 v28 = v29;
    if (v29)
    {
      OSStatus v30 = SecItemAdd(v29, 0);
      OSStatus v31 = v30;
      if (v30 == -25299)
      {
        uint64_t v32 = sub_10001CCA0(1);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10003C0F8();
        }

        CFDictionaryRef v33 = [*(id *)(a1 + 32) keyChainQueryForActiveDataSetRecordUpdateOperation];
        CFDictionaryRef v34 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
        OSStatus v31 = SecItemUpdate(v33, v34);
      }
      if (v31)
      {
        id v35 = sub_10001CCA0(1);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          int v48 = 136315650;
          __int16 v49 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkWithNewDatasetRecord:completion:]_block_invoke";
          __int16 v50 = 1024;
          int v51 = 1301;
          __int16 v52 = 1024;
          LODWORD(v53) = v31;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s:%d Error while adding/updating the record : (err=%d)", (uint8_t *)&v48, 0x18u);
        }

        CFDictionaryRef v36 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v31 userInfo:0];
        uint64_t v37 = +[NSError storeError:2 underlyingError:v36 description:@"Error while adding/updating the record"];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_24;
      }
      if ([*(id *)(a1 + 40) updatePreferredNetworkEntry:*(void *)(a1 + 32)])
      {
        uint64_t v41 = *(void *)(a1 + 48);
        CFDictionaryRef v36 = [*(id *)(a1 + 32) computedUniqueIdentifier];
        uint64_t v40 = *(void (**)(void))(v41 + 16);
        goto LABEL_29;
      }
      uint64_t v42 = sub_10001CCA0(1);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10003C07C();
      }

      if (v30 != -25299)
      {
        id v43 = [*(id *)(a1 + 32) network];
        char v44 = [*(id *)(a1 + 32) borderAgent];
        CFDictionaryRef v36 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:v43 borderAgent:v44];

        OSStatus v45 = SecItemDelete(v36);
        char v46 = sub_10001CCA0(1);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_10003C000();
        }

        if (v45)
        {
          uint64_t v37 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v45 userInfo:0];
          uint64_t v47 = +[NSError storeError:2 underlyingError:v37 description:@"Error while adding/updating the record"];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_24:
LABEL_30:

          goto LABEL_14;
        }
      }
      CFStringRef v38 = @"No preferred network found";
      uint64_t v39 = 10;
    }
    else
    {
      CFStringRef v38 = @"Bad network parameter";
      uint64_t v39 = 4;
    }
    CFDictionaryRef v36 = +[NSError storeError:v39 description:v38];
    uint64_t v40 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_29:
    v40();
    goto LABEL_30;
  }
  CFStringRef v25 = @"Can not store frozen credentials";
  uint64_t v26 = 31;
LABEL_13:
  __int16 v28 = +[NSError storeError:v26 description:v25];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

void sub_100024394(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [v2 dataSetArray];
  if (!v3) {
    goto LABEL_7;
  }
  int v4 = (void *)v3;
  BOOL v5 = [*(id *)(a1 + 32) dataSetArray];
  if (![v5 length])
  {

LABEL_7:
    id v9 = 0;
    goto LABEL_8;
  }
  __int16 v6 = *(void **)(a1 + 40);
  int v7 = [*(id *)(a1 + 32) dataSetArray];
  id v12 = 0;
  unsigned __int8 v8 = [v6 areValidDataSetTLVs:v7 creds:&v12];
  id v9 = v12;

  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
LABEL_8:
  __int16 v10 = sub_10001CCA0(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "-[THThreadNetworkCredentialsKeychainBackingStore validateAODInternally:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Error, dataset is not valid ", buf, 0xCu);
  }

  int v11 = +[NSError storeError:37 description:@"Unable parse the Active Operational Dataset"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_11:
}

void sub_10002460C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = [v2 dataSetArray];
  if (!v3) {
    goto LABEL_7;
  }
  int v4 = (void *)v3;
  BOOL v5 = [*(id *)(a1 + 32) dataSetArray];
  if (![v5 length])
  {

LABEL_7:
    id v9 = 0;
    goto LABEL_8;
  }
  __int16 v6 = *(void **)(a1 + 40);
  int v7 = [*(id *)(a1 + 32) dataSetArray];
  id v15 = 0;
  unsigned __int8 v8 = [v6 areValidDataSetTLVs:v7 creds:&v15];
  id v9 = v15;

  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000247F8;
    v13[3] = &unk_100075048;
    __int16 v10 = *(void **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    [v10 storeThreadCredentialActiveDataSetRecord:v9 waitForSync:0 completion:v13];
    int v11 = v14;
    goto LABEL_11;
  }
LABEL_8:
  id v12 = sub_10001CCA0(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[THThreadNetworkCredentialsKeychainBackingStore storeCachedAODasPreferredNetwork:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Error, dataset is not valid ", buf, 0xCu);
  }

  int v11 = +[NSError storeError:10 description:@"No preferred network found"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_11:
}

uint64_t sub_1000247F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000248F4(uint64_t a1)
{
  uint64_t v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) network];
    int v4 = [v3 networkName];
    BOOL v5 = [*(id *)(a1 + 32) network];
    __int16 v6 = [v5 extendedPANID];
    int v7 = [*(id *)(a1 + 32) computedUniqueIdentifier];
    unsigned __int8 v8 = [*(id *)(a1 + 32) keychainAccessGroup];
    *(_DWORD *)buf = 136316418;
    v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:completi"
          "on:]_block_invoke";
    __int16 v94 = 1024;
    int v95 = 1387;
    __int16 v96 = 2112;
    v97 = v4;
    __int16 v98 = 2112;
    v99 = v6;
    __int16 v100 = 2112;
    v101 = v7;
    __int16 v102 = 2112;
    v103 = v8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:%d:Request to store credential (networkName=%@, xpanid=%@, uuid = %@, keychainaccessgroup : %@", buf, 0x3Au);
  }
  id v9 = *(void **)(a1 + 32);
  if (!v9) {
    goto LABEL_10;
  }
  uint64_t v10 = [v9 credentialsDataSet];
  if (!v10) {
    goto LABEL_10;
  }
  int v11 = (void *)v10;
  id v12 = [*(id *)(a1 + 32) credentialsDataSet];
  uint64_t v13 = [v12 dataSetArray];
  if (!v13)
  {

    goto LABEL_10;
  }
  id v14 = (void *)v13;
  id v15 = [*(id *)(a1 + 32) credentialsDataSet];
  id v16 = [v15 dataSetArray];
  id v17 = [v16 length];

  if (!v17)
  {
LABEL_10:
    __int16 v28 = sub_10001CCA0(1);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10003C174();
    }

    CFStringRef v26 = @"record parameter is invalid";
    uint64_t v27 = 4;
    goto LABEL_13;
  }
  id v18 = [*(id *)(a1 + 32) credentials];
  [v18 setIsActiveDevice:1];

  id v19 = objc_alloc((Class)THThreadNetworkCredentialsDataSet);
  uint64_t v20 = [*(id *)(a1 + 32) credentialsDataSet];
  id v21 = [v20 dataSetArray];
  dispatch_time_t v22 = [*(id *)(a1 + 32) credentials];
  id v23 = [v22 userInfo];
  id v24 = [v19 initWithDataSetArray:v21 userInfo:v23];
  CFStringRef v25 = [*(id *)(a1 + 32) credentials];
  [v25 setCredentialsDataSet:v24];

  if ([*(id *)(a1 + 40) isFrozenRecord:*(void *)(a1 + 32)])
  {
    CFStringRef v26 = @"Can not store frozen credentials";
    uint64_t v27 = 31;
LABEL_13:
    CFDictionaryRef v29 = +[NSError storeError:v27 description:v26];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_14;
  }
  OSStatus v30 = [*(id *)(a1 + 32) keychainAccessGroup];
  unsigned int v31 = [v30 isEqualToString:@"0000000000"];

  if (v31)
  {
    uint64_t v32 = sub_10001CCA0(1);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      CFDictionaryRef v33 = [*(id *)(a1 + 32) network];
      CFDictionaryRef v34 = [v33 networkName];
      id v35 = [*(id *)(a1 + 32) network];
      CFDictionaryRef v36 = [v35 extendedPANID];
      uint64_t v37 = [*(id *)(a1 + 32) computedUniqueIdentifier];
      CFStringRef v38 = [*(id *)(a1 + 32) keychainAccessGroup];
      *(_DWORD *)buf = 136316418;
      v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comple"
            "tion:]_block_invoke";
      __int16 v94 = 1024;
      int v95 = 1410;
      __int16 v96 = 2112;
      v97 = v34;
      __int16 v98 = 2112;
      v99 = v36;
      __int16 v100 = 2112;
      v101 = v37;
      __int16 v102 = 2112;
      v103 = v38;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s:%d:Request to store INTERNAL credential (networkName=%@, xpanid=%@, uuid = %@, keychainaccessgroup : %@", buf, 0x3Au);
    }
    uint64_t v39 = [*(id *)(a1 + 40) getRecordForPreferredNetwork:0 anyDsFormat:0];
    CFDictionaryRef v29 = v39;
    if (!v39) {
      goto LABEL_49;
    }
    uint64_t v40 = [v39 credentialsDataSet];
    if (v40)
    {
      uint64_t v41 = (void *)v40;
      uint64_t v42 = [*(id *)(a1 + 32) credentialsDataSet];
      if (v42)
      {
        id v43 = (void *)v42;
        char v44 = [v29 credentialsDataSet];
        OSStatus v45 = [v44 dataSetArray];
        if ([v45 length])
        {
          char v46 = [*(id *)(a1 + 32) credentialsDataSet];
          uint64_t v47 = [v46 dataSetArray];
          if ([v47 length])
          {
            v88 = [v29 credentialsDataSet];
            int v48 = [v88 dataSetArray];
            __int16 v49 = [*(id *)(a1 + 32) credentialsDataSet];
            [v49 dataSetArray];
            __int16 v50 = v86 = v46;
            unsigned int v90 = [v48 isEqualToData:v50];

            if (v90)
            {
              int v51 = sub_10001CCA0(1);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1422;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s:%d: Record matches with preferred network", buf, 0x12u);
              }

              __int16 v52 = sub_10001CCA0(1);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1424;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s:%d: prefRecord =======>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:v29];
              long long v53 = sub_10001CCA0(1);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1427;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s:%d: Incoming record =====>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:*(void *)(a1 + 32)];
              uint64_t v54 = *(void *)(a1 + 48);
              long long v55 = [v29 uniqueIdentifier];
              __int16 v56 = *(void (**)(void))(v54 + 16);
              goto LABEL_55;
            }
            goto LABEL_34;
          }
        }
      }
    }
LABEL_34:
    uint64_t v57 = [v29 credentialsDataSet];
    if (v57)
    {
      v58 = (void *)v57;
      uint64_t v59 = [*(id *)(a1 + 32) credentialsDataSet];
      if (v59)
      {
        __int16 v60 = (void *)v59;
        int v61 = [v29 credentialsDataSet];
        __int16 v62 = [v61 dataSetArray];
        if ([v62 length])
        {
          id v63 = [*(id *)(a1 + 32) credentialsDataSet];
          v64 = [v63 dataSetArray];
          if ([v64 length])
          {
            v89 = [v29 credentialsDataSet];
            size_t v65 = [v89 dataSetArray];
            char v66 = [*(id *)(a1 + 32) credentialsDataSet];
            [v66 dataSetArray];
            v67 = v87 = v63;
            unsigned __int8 v91 = [v65 isEqualToData:v67];

            if ((v91 & 1) == 0)
            {
              unsigned int v68 = sub_10001CCA0(1);
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
                sub_10003C1F0();
              }

              v69 = sub_10001CCA0(1);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1441;
                _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%s:%d: prefRecord =======>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:v29];
              char v70 = sub_10001CCA0(1);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForS"
                      "ync:completion:]_block_invoke";
                __int16 v94 = 1024;
                int v95 = 1444;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s:%d: Incoming record =====>", buf, 0x12u);
              }

              [*(id *)(a1 + 40) thDumpActiveDatasetRecord:*(void *)(a1 + 32)];
            }
            goto LABEL_49;
          }
        }
      }
    }
LABEL_49:
  }
  CFDictionaryRef v71 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordAddOperation];
  CFDictionaryRef v29 = v71;
  if (!v71)
  {
    CFStringRef v72 = @"Bad network parameter";
    uint64_t v73 = 4;
    goto LABEL_54;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 40) storeActiveDataSetRecordAndSync:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  uint64_t v74 = SecItemAdd(v71, 0);
  if (v74 == -25299)
  {
    int v75 = sub_10001CCA0(1);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comple"
            "tion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%s: Credential exists. Will update instead.", buf, 0xCu);
    }

    CFDictionaryRef v76 = [*(id *)(a1 + 32) keyChainQueryForActiveDataSetRecordUpdateOperation];
    CFDictionaryRef v77 = [*(id *)(a1 + 32) keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
    uint64_t v74 = SecItemUpdate(v76, v77);
  }
  if (!v74)
  {
    if (!_os_feature_enabled_impl()
      || ([*(id *)(a1 + 40) markAsPreferred:*(void *)(a1 + 32)] & 1) != 0)
    {
      long long v55 = [*(id *)(a1 + 32) computedUniqueIdentifier];
      __int16 v56 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_55;
    }
    v79 = *(void **)(a1 + 32);
    if (v79)
    {
      int v80 = [v79 network];
      unsigned __int16 v81 = [*(id *)(a1 + 32) borderAgent];
      CFDictionaryRef v82 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:v80 borderAgent:v81];

      OSStatus v83 = SecItemDelete(v82);
      v84 = sub_10001CCA0(1);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comp"
              "letion:]_block_invoke";
        __int16 v94 = 1024;
        int v95 = 1501;
        __int16 v96 = 1024;
        LODWORD(v97) = v83;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%s:%d Preferred network storing failed, deleted the local record : (err=%d)", buf, 0x18u);
      }
    }
    v85 = sub_10001CCA0(1);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:comple"
            "tion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%s: Error, Preferred network storing failure ", buf, 0xCu);
    }

    CFStringRef v72 = @"No preferred network found";
    uint64_t v73 = 10;
LABEL_54:
    long long v55 = +[NSError storeError:v73 description:v72];
    __int16 v56 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_55:
    v56();

    goto LABEL_14;
  }
  int v78 = sub_10001CCA0(1);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v93 = "-[THThreadNetworkCredentialsKeychainBackingStore storeThreadCredentialActiveDataSetRecord:waitForSync:completi"
          "on:]_block_invoke";
    __int16 v94 = 1024;
    int v95 = 1482;
    __int16 v96 = 1024;
    LODWORD(v97) = v74;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%s:%d Error while adding/updating the record : (err=%d)", buf, 0x18u);
  }

  [*(id *)(a1 + 40) errorout:v74 completion:*(void *)(a1 + 48)];
LABEL_14:
}

void sub_100025640(void *a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with UUID %@", buf, 0xCu);
  }

  BOOL v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:a1[4] clientKeychainAccessGroup:a1[5]];
  __int16 v6 = (void *)a1[6];
  id v11 = 0;
  int v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = a1[7];
  uint64_t v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

void sub_10002588C(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to fetch active dataset record with borderAgent %@", buf, 0xCu);
  }
  BOOL v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup:*(void *)(a1 + 32) clientKeychainAccessGroup:*(void *)(a1 + 40)];
  __int16 v6 = *(void **)(a1 + 48);
  id v11 = 0;
  int v7 = [v6 _doFetchActiveDataSetRecords:v5 error:&v11];
  id v8 = v11;
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = [v7 anyObject];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
}

void sub_100025ADC(void *a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (const char *)a1[4];
    int v12 = 138412290;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE credential with identifier %@", (uint8_t *)&v12, 0xCu);
  }

  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:a1[4] clientKeychainAccessGroup:a1[5]];
  OSStatus v6 = SecItemDelete(v5);
  int v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAcce"
          "ssGroup:keychainAccessGroup:completion:]_block_invoke";
    __int16 v14 = 1024;
    OSStatus v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    uint64_t v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003BDB0();
    }

    uint64_t v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:13 underlyingError:v10 description:v8];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_100025DEC(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) discriminatorId];
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAcce"
          "ssGroup:keychainAccessGroup:completion:]_block_invoke";
    __int16 v14 = 2112;
    OSStatus v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Request to DELETE credential with Ba %@", (uint8_t *)&v12, 0x16u);
  }
  CFDictionaryRef v5 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup:*(void *)(a1 + 32) clientKeychainAccessGroup:*(void *)(a1 + 40)];
  OSStatus v6 = SecItemDelete(v5);
  int v7 = sub_10001CCA0(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[THThreadNetworkCredentialsKeychainBackingStore deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAcce"
          "ssGroup:keychainAccessGroup:completion:]_block_invoke";
    __int16 v14 = 1024;
    LODWORD(v15) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: GOT: (err=%d)", (uint8_t *)&v12, 0x12u);
  }

  if (v6)
  {
    id v8 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    uint64_t v9 = sub_10001CCA0(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003C26C();
    }

    uint64_t v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
    id v11 = +[NSError storeError:12 underlyingError:v10 description:v8];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100026440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100026478(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

void sub_100026884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000268BC(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

void sub_1000269D0(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) networkName];
    int v10 = 136315394;
    id v11 = "-[THThreadNetworkCredentialsKeychainBackingStore validateRecordWithMdnsScan:borderAgentID:completion:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Request to validate network with MDNS %@", (uint8_t *)&v10, 0x16u);
  }
  if (([*(id *)(a1 + 40) checkWiFiStatus] & 1) == 0)
  {
    CFStringRef v7 = @"Error : Device is not connected to the network";
    uint64_t v8 = 19;
LABEL_10:
    uint64_t v9 = +[NSError storeError:v8 description:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    goto LABEL_11;
  }
  if (([*(id *)(a1 + 40) checkIfNetworkMatchToMDNSScan:*(void *)(a1 + 32) borderAgentID:*(void *)(a1 + 48)] & 1) == 0)
  {
    CFStringRef v7 = @"Thread network credentials does not match with any of the active thread networks around";
    uint64_t v8 = 20;
    goto LABEL_10;
  }
  CFDictionaryRef v5 = sub_10001CCA0(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    OSStatus v6 = [*(id *)(a1 + 32) networkName];
    int v10 = 136315394;
    id v11 = "-[THThreadNetworkCredentialsKeychainBackingStore validateRecordWithMdnsScan:borderAgentID:completion:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Valid Thread network credentials, network name :  %@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_11:
}

void sub_100026C78(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 1724;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Request to check if there are any records for the preferred network exists", buf, 0x12u);
  }

  uint64_t v4 = [*(id *)(a1 + 32) getPreferredNetwork:0];
  CFDictionaryRef v5 = v4;
  if (!v4)
  {
    id v17 = sub_10001CCA0(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
      __int16 v40 = 1024;
      int v41 = 1729;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: No Preferred Network..", buf, 0x12u);
    }
    goto LABEL_11;
  }
  uint64_t v6 = [v4 credentialsDataSetRecord];
  if (v6)
  {
    CFStringRef v7 = (void *)v6;
    uint64_t v8 = [v5 credentialsDataSetRecord];
    uint64_t v9 = [v8 credentialsDataSet];
    uint64_t v10 = [v9 dataSetArray];
    if (v10)
    {
      id v11 = (void *)v10;
      __int16 v12 = [v5 credentialsDataSetRecord];
      uint64_t v13 = [v12 credentialsDataSet];
      [v13 dataSetArray];
      uint64_t v14 = a1;
      v16 = OSStatus v15 = v2;
      id v36 = [v16 length];

      uint64_t v2 = v15;
      a1 = v14;

      if (v36)
      {
        id v17 = sub_10001CCA0(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = [v5 credentialsDataSetRecord];
          id v19 = [v18 network];
          uint64_t v20 = [v19 networkName];
          id v21 = [v5 credentialsDataSetRecord];
          dispatch_time_t v22 = [v21 credentialsDataSet];
          id v23 = [v22 dataSetArray];
          *(_DWORD *)buf = 136315906;
          uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
          __int16 v40 = 1024;
          int v41 = 1739;
          __int16 v42 = 2112;
          id v43 = v20;
          __int16 v44 = 2112;
          OSStatus v45 = v23;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: This preferred network entry has record associated with it, returning the same preferred network : %@, dataset : %@", buf, 0x26u);
        }
LABEL_11:

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  id v24 = sub_10001CCA0(1);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    CFStringRef v25 = [v5 network];
    CFStringRef v26 = [v25 networkName];
    uint64_t v27 = [v5 network];
    __int16 v28 = [v27 extendedPANID];
    *(_DWORD *)buf = 136315906;
    uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 1744;
    __int16 v42 = 2112;
    id v43 = v26;
    __int16 v44 = 2112;
    OSStatus v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s : %d - Request to check how many active dataset records are present for preferred network (name=%@, xpanid=%@)", buf, 0x26u);
  }
  CFDictionaryRef v29 = [v5 network];
  OSStatus v30 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:v29];

  unsigned int v31 = *(void **)(a1 + 32);
  id v37 = 0;
  uint64_t v32 = [v31 _doFetchActiveDataSetRecords:v30 error:&v37];
  id v33 = v37;
  CFDictionaryRef v34 = sub_10001CCA0(1);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    id v35 = [v32 count];
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfRecordForPreferredNetworkIsPresentWithCompletion:]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 1750;
    __int16 v42 = 2048;
    id v43 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s:%d: Preferred Network present and the matching Active dataset records size is: %lu", buf, 0x1Cu);
  }

  [v32 count];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_18:
}

void sub_100027A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

int64_t sub_100027AE8(id a1, id a2, id a3)
{
  id v4 = a3;
  CFDictionaryRef v5 = [a2 lastModificationDate];
  uint64_t v6 = [v4 lastModificationDate];

  id v7 = [v5 compare:v6];
  if (v7 == (id)1) {
    int64_t v8 = -1;
  }
  else {
    int64_t v8 = (int64_t)v7;
  }
  if (v7 == (id)-1) {
    return 1;
  }
  else {
    return v8;
  }
}

void sub_100027B64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) network];
    CFDictionaryRef v5 = [v4 networkName];
    int v6 = 136315650;
    id v7 = "-[THThreadNetworkCredentialsKeychainBackingStore getRecordForPreferredNetwork:anyDsFormat:skipScan:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 1841;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s : %d : Updating preferred network with record : name : %@", (uint8_t *)&v6, 0x1Cu);
  }
  [WeakRetained updateRecordToPreferredNetworkEntry:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) credentialsDataSetRecord:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void sub_100027D50(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to fetch Preferred Network Active Dataset Record with Any format", (uint8_t *)&v14, 2u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:1];
  CFDictionaryRef v5 = sub_10001CCA0(1);
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      __int16 v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      id v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      OSStatus v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkOfAnyDSFormatWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1863;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003C5C8();
    }

    uint64_t v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10002805C(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    OSStatus v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithCompletion:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 1873;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v14, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:0];
  CFDictionaryRef v5 = sub_10001CCA0(1);
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      __int16 v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      id v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      OSStatus v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1884;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003C644();
    }

    uint64_t v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10002838C(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    OSStatus v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 1894;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v14, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:1 anyDsFormat:0];
  CFDictionaryRef v5 = sub_10001CCA0(1);
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      __int16 v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      id v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      OSStatus v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkInternallyWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1905;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003C6C0();
    }

    uint64_t v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000286BC(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    OSStatus v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithNoScanWithCompletion:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 1915;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v14, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:0 skipScan:1];
  CFDictionaryRef v5 = sub_10001CCA0(1);
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 network];
      __int16 v8 = [v7 networkName];
      int v9 = [v4 network];
      __int16 v10 = [v9 extendedPANID];
      id v11 = [v4 borderAgent];
      __int16 v12 = [v11 discriminatorId];
      int v14 = 136316162;
      OSStatus v15 = "-[THThreadNetworkCredentialsKeychainBackingStore retrievePreferredNetworkWithNoScanWithCompletion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1926;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v14, 0x30u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003C73C();
    }

    uint64_t v13 = +[NSError storeError:9 description:@"No preferred network found"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100028C14(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v28 = 136315394;
    CFDictionaryRef v29 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveOrGeneratePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 1973;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to fetch Preferred Network Active Dataset Record", (uint8_t *)&v28, 0x12u);
  }

  id v4 = [*(id *)(a1 + 32) getRecordForPreferredNetwork:0 anyDsFormat:0];
  CFDictionaryRef v5 = sub_10001CCA0(1);
  int v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003CA14();
    }

    uint64_t v13 = +[NSError storeError:9 description:@"No preferred network found"];
    int v14 = [*(id *)(a1 + 32) generateCredentials];
    id v4 = v14;
    if (!v14)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_27:

      goto LABEL_28;
    }
    CFDictionaryRef v15 = [v14 keyChainItemRepresentationForActiveDataSetRecordAddOperation];
    CFDictionaryRef v16 = v15;
    if (v15)
    {
      OSStatus v17 = SecItemAdd(v15, 0);
      if (v17 == -25299)
      {
        __int16 v18 = sub_10001CCA0(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10003C998();
        }

        CFDictionaryRef v19 = [v4 keyChainQueryForActiveDataSetRecordUpdateOperation];
        CFDictionaryRef v20 = [v4 keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
        OSStatus v17 = SecItemUpdate(v19, v20);
      }
      if (v17)
      {
        id v21 = sub_10001CCA0(1);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 136315650;
          CFDictionaryRef v29 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveOrGeneratePreferredNetworkInternallyWithComplet"
                "ion:]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 2010;
          __int16 v32 = 1024;
          LODWORD(v33) = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s:%d Error while adding/updating the record : (err=%d)", (uint8_t *)&v28, 0x18u);
        }

        __int16 v22 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v17 userInfo:0];
        id v23 = +[NSError storeError:2 underlyingError:v22 description:@"Error while adding/updating the record"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_25;
      }
      CFStringRef v25 = *(void **)(a1 + 32);
      CFStringRef v26 = [v4 borderAgent];
      __int16 v22 = [v25 getActiveDataSetRecord:v26];

      if (([*(id *)(a1 + 32) storePreferredNetworkWithRecord:v22] & 1) == 0)
      {
        id v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:0 userInfo:0];
        uint64_t v27 = +[NSError storeError:2 underlyingError:v23 description:@"Error while adding preferred network entry"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_25:
        goto LABEL_26;
      }
      id v24 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      __int16 v22 = +[NSError storeError:4 description:@"Bad network parameter"];
      id v24 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v24();
LABEL_26:

    goto LABEL_27;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 network];
    __int16 v8 = [v7 networkName];
    int v9 = [v4 network];
    __int16 v10 = [v9 extendedPANID];
    id v11 = [v4 borderAgent];
    __int16 v12 = [v11 discriminatorId];
    int v28 = 136316162;
    CFDictionaryRef v29 = "-[THThreadNetworkCredentialsKeychainBackingStore retrieveOrGeneratePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 2029;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : %d - Returning record (name=%@, xpanid=%@, baid=%@)", (uint8_t *)&v28, 0x30u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:
}

void sub_1000292A4(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v29 = 136315394;
    __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:ipV"
          "4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 2040;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to add Preferred Network", (uint8_t *)&v29, 0x12u);
  }

  v42[0] = 0;
  v42[1] = 0;
  v41[0] = 0;
  v41[1] = 0;
  id v4 = +[NSUUID UUID];
  [v4 getUUIDBytes:v42];

  CFDictionaryRef v5 = +[NSUUID UUID];
  [v5 getUUIDBytes:v41];

  uint64_t v6 = (uint64_t)*(id *)(a1 + 32);
  uint64_t v7 = (uint64_t)*(id *)(a1 + 40);
  sub_100029884();
  __int16 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  sub_100029968();
  int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __int16 v10 = sub_10001CCA0(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    int v29 = 136316418;
    __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:ipV"
          "4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 2054;
    __int16 v33 = 2112;
    uint64_t v34 = v11;
    __int16 v35 = 2112;
    uint64_t v36 = v12;
    __int16 v37 = 2112;
    CFStringRef v38 = v8;
    __int16 v39 = 2112;
    __int16 v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d:Entered with signatures ipv4 : %@, ipv6 : %@, ssid : %@, pwd : %@", (uint8_t *)&v29, 0x3Au);
  }

  uint64_t v13 = *(__CFString **)(a1 + 48);
  if (!v13) {
    uint64_t v13 = &stru_100075A30;
  }
  int v14 = v13;

  CFDictionaryRef v15 = *(__CFString **)(a1 + 56);
  if (!v15) {
    CFDictionaryRef v15 = &stru_100075A30;
  }
  CFDictionaryRef v16 = v15;

  if (!(v6 | v7))
  {
    uint64_t v6 = +[NSData dataWithBytes:v42 length:16];
    uint64_t v17 = 16;
LABEL_15:
    uint64_t v7 = +[NSData dataWithBytes:v41 length:v17];
    goto LABEL_16;
  }
  if (!v7)
  {
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  if (!v6)
  {
    uint64_t v6 = +[NSData dataWithBytes:v42 length:0];
  }
LABEL_16:
  __int16 v18 = sub_10001CCA0(1);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v29 = 136316418;
    __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:ipV"
          "4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 2071;
    __int16 v33 = 2112;
    uint64_t v34 = v6;
    __int16 v35 = 2112;
    uint64_t v36 = v7;
    __int16 v37 = 2112;
    CFStringRef v38 = v14;
    __int16 v39 = 2112;
    __int16 v40 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d:Random signatures ipv4 : %@, ipv6 : %@, ssid : %@, pwd : %@", (uint8_t *)&v29, 0x3Au);
  }

  id v19 = [objc_alloc((Class)THNetworkSignature) initWithSignatures:v6 ipv6NwSignature:v7 wifSSID:v14 wifiPassword:v16];
  CFDictionaryRef v20 = sub_10001CCA0(1);
  id v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = [v19 ipv4NwSignature];
      id v23 = [v19 ipv6NwSignature];
      int v29 = 136315906;
      __int16 v30 = "-[THThreadNetworkCredentialsKeychainBackingStore addPreferredNetworkWithCompletionInternally:borderAgentID:i"
            "pV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:]_block_invoke";
      __int16 v31 = 1024;
      int v32 = 2083;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v22;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s:%d:Calculated signatures ipv4 : %@, ipv6 : %@", (uint8_t *)&v29, 0x26u);
    }
    id v24 = *(void **)(a1 + 64);
    if (v24)
    {
      CFStringRef v25 = [v24 discriminatorId];

      if (v25)
      {
        CFStringRef v25 = [*(id *)(a1 + 72) getActiveDataSetRecord:*(void *)(a1 + 64)];
      }
    }
    else
    {
      CFStringRef v25 = 0;
    }
    id v26 = [objc_alloc((Class)THPreferredThreadNetwork) initWithThreadNetwork:*(void *)(a1 + 80) networkSignature:v19 credentialsDataSetRecord:v25 creationDate:0 lastModificationDate:0 userInfo:@"0000000000"];
    if (v26)
    {
      if (*(void *)(a1 + 48) || *(void *)(a1 + 56))
      {
        if ([*(id *)(a1 + 72) storePreferred:v26])
        {
LABEL_32:
          (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_38:

          goto LABEL_39;
        }
        uint64_t v27 = sub_10001CCA0(1);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10003CC14();
        }
      }
      else
      {
        if ([*(id *)(a1 + 72) DBGstorePreferred:v26]) {
          goto LABEL_32;
        }
        uint64_t v27 = sub_10001CCA0(1);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_10003CB98();
        }
      }
    }
    else
    {
      uint64_t v27 = sub_10001CCA0(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10003CB1C();
      }
    }

    int v28 = +[NSError storeError:35 description:@"Unable to add preferred network"];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();

    goto LABEL_38;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10003CA90();
  }

  CFStringRef v25 = +[NSError storeError:35 description:@"Unable to add preferred network"];
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_39:
}

id sub_100029884()
{
  BOOL v0 = +[NSMutableString stringWithCapacity:0];
  uint32_t v1 = arc4random();
  uint64_t v2 = +[NSString stringWithFormat:@"%s%d", "ThSSID", v1 + ((v1 / 0x7FFFFFFF) | ((v1 / 0x7FFFFFFF) << 31)) + 1];
  [v0 appendString:v2];

  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003CC90();
  }

  return v0;
}

id sub_100029968()
{
  BOOL v0 = +[NSMutableString stringWithCapacity:0];
  uint32_t v1 = arc4random();
  uint64_t v2 = +[NSString stringWithFormat:@"%s%d", "ThPWD", v1 + ((v1 / 0x7FFFFFFF) | ((v1 / 0x7FFFFFFF) << 31)) + 1];
  [v0 appendString:v2];

  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003CCF8();
  }

  return v0;
}

void sub_100029B6C(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v31 = 136315394;
    int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComple"
          "tion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = 2130;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to delete Preferred Network for network signature", (uint8_t *)&v31, 0x12u);
  }

  v40[0] = 0;
  v40[1] = 0;
  v39[0] = 0;
  v39[1] = 0;
  id v4 = +[NSUUID UUID];
  [v4 getUUIDBytes:v40];

  CFDictionaryRef v5 = +[NSUUID UUID];
  [v5 getUUIDBytes:v39];

  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  __int16 v8 = sub_10001CCA0(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(__CFString **)(a1 + 48);
    int v31 = 136316162;
    int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComple"
          "tion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = 2141;
    *(_WORD *)&v34[4] = 2112;
    *(void *)&v34[6] = v9;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    CFStringRef v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d:Entered with signatures ipv4 : %@, ipv6 : %@, ssid : %@", (uint8_t *)&v31, 0x30u);
  }

  uint64_t v12 = *(__CFString **)(a1 + 48);
  if (!v12) {
    uint64_t v12 = &stru_100075A30;
  }
  uint64_t v13 = v12;
  if (v7)
  {
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v7 = +[NSData dataWithBytes:v39 length:0];
    if (v6) {
      goto LABEL_9;
    }
  }
  id v6 = +[NSData dataWithBytes:v40 length:0];
LABEL_9:
  id v14 = [objc_alloc((Class)THNetworkSignature) initWithSignatures:v6 ipv6NwSignature:v7 wifSSID:v13 wifiPassword:&stru_100075A30];
  CFDictionaryRef v15 = sub_10001CCA0(1);
  CFDictionaryRef v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136316162;
      int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComp"
            "letion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
      __int16 v33 = 1024;
      *(_DWORD *)uint64_t v34 = 2159;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v6;
      __int16 v35 = 2112;
      id v36 = v7;
      __int16 v37 = 2112;
      CFStringRef v38 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s:%d:Error : Random signatures ipv4 : %@, ipv6 : %@, ssid : %@", (uint8_t *)&v31, 0x30u);
    }

    CFDictionaryRef v20 = +[NSError storeError:35 description:@"Unable to add preferred network"];
    int v28 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_28;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v14 ipv4NwSignature];
    __int16 v18 = [v14 ipv6NwSignature];
    int v31 = 136315906;
    int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComple"
          "tion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = 2166;
    *(_WORD *)&v34[4] = 2112;
    *(void *)&v34[6] = v17;
    __int16 v35 = 2112;
    id v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d:Calculated signatures ipv4 : %@, ipv6 : %@", (uint8_t *)&v31, 0x26u);
  }
  CFDictionaryRef v19 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecordForNetworkSignature:v14];
  CFDictionaryRef v20 = v19;
  if (v19)
  {
    OSStatus v21 = SecItemDelete(v19);
    __int16 v22 = sub_10001CCA0(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v14 wifiSSID];
      int v31 = 136315650;
      int v32 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkForNetworkSignatureInternallyWithComp"
            "letion:ipv6NwSignature:wifiSSID:completion:]_block_invoke";
      __int16 v33 = 2112;
      *(void *)uint64_t v34 = v23;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network for network signature : %@, Deletion result :(err=%d)", (uint8_t *)&v31, 0x1Cu);
    }
    if (v21)
    {
      id v24 = (__CFString *)SecCopyErrorMessageString(v21, 0);
      CFStringRef v25 = sub_10001CCA0(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10003CDDC();
      }

      id v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v21 userInfo:0];
      uint64_t v27 = +[NSError storeError:11 underlyingError:v26 description:v24];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      goto LABEL_29;
    }
    int v28 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_28:
    v28();
    goto LABEL_29;
  }
  int v29 = sub_10001CCA0(1);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10003CD60();
  }

  __int16 v30 = +[NSError storeError:16 description:@"Failed to create query to delete preferred network for networksignature"];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_29:
}

void sub_10002A1D4(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE Preferred Network", buf, 2u);
  }

  id v4 = &AWDPostMetric_ptr;
  CFDictionaryRef v5 = +[THPreferredThreadNetwork keyChainQueryForFetchPreferredNetworkRecordsOperation];
  if (!v5)
  {
    uint64_t v34 = sub_10001CCA0(1);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10003CE44();
    }

    id v8 = +[NSError storeError:16 description:@"Failed to create query to fetch preferred networks"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_43;
  }
  id v6 = *(void **)(a1 + 32);
  id v51 = 0;
  id v7 = [v6 _doFetchPreferredNetworks:v5 error:&v51];
  id v8 = v51;
  uint64_t v9 = sub_10001CCA0(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10003D068(v7);
  }

  if (![v7 count])
  {
    __int16 v35 = sub_10001CCA0(1);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10003CEC0();
    }

    goto LABEL_30;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (!v10) {
    goto LABEL_23;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v48;
  __int16 v42 = v5;
  id v43 = v2;
  id v41 = v8;
  __int16 v44 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v48 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      CFDictionaryRef v15 = objc_msgSend(v14, "credentialsDataSetRecord", v41, v42, v43);

      if (v15)
      {
        id v16 = objc_alloc((Class)THFrozenThreadNetwork);
        uint64_t v17 = [v14 credentialsDataSetRecord];
        __int16 v18 = [v17 credentialsDataSet];
        id v19 = [v16 initWithCredentialsDataSet:v18 creationDate:0 lastModificationDate:0];

        [*(id *)(a1 + 32) storeFrozenThreadNetwork:v19];
      }
      CFDictionaryRef v20 = [v4[203] keyChainQueryForDeletePreferredNetworkRecord:v14];
      CFDictionaryRef v21 = v20;
      if (!v20)
      {
        id v36 = sub_10001CCA0(1);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10003CF3C();
        }

        int v31 = +[NSError storeError:16 description:@"Failed to create query to delete preferred networks"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_41;
      }
      OSStatus v22 = SecItemDelete(v20);
      id v23 = sub_10001CCA0(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v14 network];
        [v24 networkName];
        CFDictionaryRef v46 = v21;
        id v25 = v11;
        uint64_t v26 = v12;
        uint64_t v27 = a1;
        v29 = int v28 = v4;
        *(_DWORD *)buf = 136315650;
        long long v53 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkWithCompletion:]_block_invoke";
        __int16 v54 = 2112;
        long long v55 = v29;
        __int16 v56 = 1024;
        OSStatus v57 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network : %@, Deletion result :(err=%d)", buf, 0x1Cu);

        id v4 = v28;
        a1 = v27;
        uint64_t v12 = v26;
        id v11 = v25;
        CFDictionaryRef v21 = v46;
      }
      if (v22)
      {
        int v31 = (void *)SecCopyErrorMessageString(v22, 0);
        __int16 v37 = sub_10001CCA0(1);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10003CDDC();
        }

        CFStringRef v38 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v22 userInfo:0];
        __int16 v39 = +[NSError storeError:11 underlyingError:v38 description:v31];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_40:
LABEL_41:
        CFDictionaryRef v5 = v42;
        uint64_t v2 = v43;
        id v8 = v41;

        id v7 = v44;
        goto LABEL_42;
      }
      __int16 v30 = [v14 network];
      int v31 = +[THThreadNetworkCredentialsActiveDataSetRecord keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:v30];

      OSStatus v32 = SecItemDelete((CFDictionaryRef)v31);
      __int16 v33 = sub_10001CCA0(1);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v53 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkWithCompletion:]_block_invoke";
        __int16 v54 = 1024;
        LODWORD(v55) = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s: GOT: (err=%d)", buf, 0x12u);
      }

      if (v32)
      {
        __int16 v40 = sub_10001CCA0(1);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_10003CFB8(v14);
        }

        CFStringRef v38 = +[NSError storeError:32 description:@"Failed to delete credentials records for frozen preferred network"];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_40;
      }
    }
    id v11 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    CFDictionaryRef v5 = v42;
    uint64_t v2 = v43;
    id v8 = v41;
    id v7 = v44;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_23:

LABEL_30:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_42:

LABEL_43:
}

void sub_10002A8EC(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to DELETE Preferred Network Entry", (uint8_t *)&v16, 2u);
  }

  CFDictionaryRef v4 = +[THPreferredThreadNetwork keyChainQueryForDeletePreferredNetworkRecord:*(void *)(a1 + 32)];
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    OSStatus v6 = SecItemDelete(v4);
    id v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) network];
      uint64_t v9 = [v8 networkName];
      int v16 = 136315650;
      uint64_t v17 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredNetworkEntryWithCompletion:completion:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 1024;
      OSStatus v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Preferred Network : %@, Deletion result :(err=%d)", (uint8_t *)&v16, 0x1Cu);
    }
    if (v6)
    {
      id v10 = (__CFString *)SecCopyErrorMessageString(v6, 0);
      id v11 = sub_10001CCA0(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10003CDDC();
      }

      uint64_t v12 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
      uint64_t v13 = +[NSError storeError:11 underlyingError:v12 description:v10];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v14 = sub_10001CCA0(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003D0F4();
    }

    CFDictionaryRef v15 = +[NSError storeError:16 description:@"Failed to create query to delete preferred network entry"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10002AC54(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    id v25 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredAndFrozenThreadNetworksWithCompletion:]_block_invoke";
    __int16 v26 = 1024;
    int v27 = 2311;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Request to DELETE all preferred and frozen networks", (uint8_t *)&v24, 0x12u);
  }

  CFDictionaryRef v4 = +[THPreferredThreadNetwork keyChainQueryForDeleteAllPreferredNetworks];
  CFDictionaryRef v5 = v4;
  if (!v4)
  {
    uint64_t v17 = sub_10001CCA0(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003D170();
    }

    id v10 = +[NSError storeError:16 description:@"Failed to create query to fetch preferred networks"];
    int v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_25;
  }
  OSStatus v6 = SecItemDelete(v4);
  if (v6)
  {
    OSStatus v7 = v6;
    if (v6 != -25300)
    {
      id v10 = (void *)SecCopyErrorMessageString(v6, 0);
      __int16 v18 = sub_10001CCA0(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003D1EC();
      }

      id v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v7 userInfo:0];
      __int16 v20 = +[NSError storeError:32 underlyingError:v19 description:v10];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    id v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003D458();
    }
  }
  CFDictionaryRef v9 = +[THFrozenThreadNetwork keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation];
  id v10 = v9;
  if (!v9)
  {
    OSStatus v21 = sub_10001CCA0(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003D268();
    }

    id v19 = +[NSError storeError:34 description:@"Failed to create query to fetch frozen thread networks"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_36;
  }
  OSStatus v11 = SecItemDelete(v9);
  if (v11)
  {
    OSStatus v12 = v11;
    if (v11 == -25300)
    {
      uint64_t v13 = sub_10001CCA0(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003D3DC();
      }

      goto LABEL_15;
    }
    id v19 = (void *)SecCopyErrorMessageString(v11, 0);
    OSStatus v22 = sub_10001CCA0(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003D2E4();
    }

    __int16 v20 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v12 userInfo:0];
    id v23 = +[NSError storeError:33 underlyingError:v20 description:v19];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    goto LABEL_35;
  }
LABEL_15:
  if (([*(id *)(a1 + 32) deleteAllRecordsForKeychainAccessGroup:@"0000000000"] & 1) == 0)
  {
    id v14 = sub_10001CCA0(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003D360();
    }
  }
  CFDictionaryRef v15 = sub_10001CCA0(1);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    id v25 = "-[THThreadNetworkCredentialsKeychainBackingStore deletePreferredAndFrozenThreadNetworksWithCompletion:]_block_invoke";
    __int16 v26 = 1024;
    int v27 = 2378;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s:%d: Deleted all preferred and frozen networks !", (uint8_t *)&v24, 0x12u);
  }

  int v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_25:
  v16();
LABEL_37:
}

void sub_10002B17C(uint64_t a1)
{
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    CFDictionaryRef v5 = "-[THThreadNetworkCredentialsKeychainBackingStore updatePreferredNetworkInternallyWithCompletion:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 2387;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d:Request to update Preferred Network", (uint8_t *)&v4, 0x12u);
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) updatePreferredNetwork]);
}

id sub_10002C504(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10002C5C4(uint64_t a1)
{
  uint64_t v386 = 0;
  long long v384 = 0u;
  long long v385 = 0u;
  long long v383 = 0u;
  uint64_t v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003E7BC();
  }

  CFDictionaryRef v4 = +[THThreadNetworkCredentialsStoreRecord keyChainQueryForDeleteAllCredentialsRecord];
  CFDictionaryRef v267 = v4;
  if (!v4)
  {
    v234 = sub_10001CCA0(1);
    if (os_log_type_enabled(v234, OS_LOG_TYPE_ERROR)) {
      sub_10003E1D4();
    }

    v235 = +[NSError storeError:36 description:@"Failed to create query to delete all com.apple.thread.network records"];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_270;
  }
  v266 = v2;
  OSStatus v5 = SecItemDelete(v4);
  __int16 v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003E740();
  }

  if (v5)
  {
    int v7 = sub_10001CCA0(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003E6C4();
    }
  }
  id v341 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = &AWDPostMetric_ptr;
  id v299 = objc_alloc_init((Class)NSMutableArray);
  id v344 = objc_alloc_init((Class)NSMutableArray);
  id v291 = objc_alloc_init((Class)NSMutableArray);
  id v343 = objc_alloc_init((Class)NSMutableDictionary);
  id v342 = objc_alloc_init((Class)NSMutableArray);
  CFDictionaryRef v9 = [*(id *)(a1 + 32) getNumberOfPrefEntriesForTheCount:200];
  id v10 = sub_10001CCA0(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
    __int16 v394 = 1024;
    int v395 = 2712;
    __int16 v396 = 2048;
    id v397 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d: Before 1st Pass, size of preferred networks (prefNwRecords) : %lu", buf, 0x1Cu);
  }

  id v11 = [v9 count];
  *((void *)&v384 + 1) = v11;
  uint64_t v386 = 0;
  uint64_t v345 = a1;
  if (v9 && [v9 count])
  {
    long long v381 = 0u;
    long long v382 = 0u;
    long long v379 = 0u;
    long long v380 = 0u;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v379 objects:v411 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v380;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v380 != v14) {
            objc_enumerationMutation(obj);
          }
          int v16 = *(void **)(*((void *)&v379 + 1) + 8 * i);
          uint64_t v17 = [*(id *)(v345 + 32) getTheKeyFromPreferredNetworkEntry:v16];
          __int16 v18 = sub_10001CCA0(1);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = [v16 network];
            __int16 v20 = [v19 networkName];
            OSStatus v21 = [v16 network];
            OSStatus v22 = [v21 extendedPANID];
            *(_DWORD *)buf = 136316162;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2732;
            __int16 v396 = 2112;
            id v397 = v20;
            __int16 v398 = 2112;
            id v399 = v22;
            __int16 v400 = 2112;
            CFStringRef v401 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d: item : (name : %@ | xpanid : %@), key : %@", buf, 0x30u);
          }
          id v23 = [v341 objectForKeyedSubscript:v17];
          if (v23)
          {
            int v24 = [v16 lastModificationDate];
            id v25 = [v23 lastModificationDate];
            id v26 = [v24 compare:v25];

            if (v26 == (id)1)
            {
              [v341 setObject:v16 forKey:v17];
              int v27 = v344;
              int v28 = v23;
            }
            else
            {
              int v27 = v344;
              int v28 = v16;
            }
            [v27 addObject:v28];
          }
          else
          {
            [v341 setObject:v16 forKey:v17];
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v379 objects:v411 count:16];
      }
      while (v13);
    }

    int v29 = sub_10001CCA0(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [v344 count];
      *(_DWORD *)buf = 136315650;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2756;
      __int16 v396 = 2048;
      id v397 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s:%d: End of 1st pass, size of cleanUpPreferredList : %lu ", buf, 0x1Cu);
    }

    int v31 = [v341 allValues];
    OSStatus v32 = +[NSMutableArray arrayWithArray:v31];

    __int16 v33 = sub_10001CCA0(1);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = [v32 count];
      *(_DWORD *)buf = 136315650;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2759;
      __int16 v396 = 2048;
      id v397 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s:%d: Before 2nd pass, size of keepPreferredList : %lu ", buf, 0x1Cu);
    }

    [v341 removeAllObjects];
    long long v377 = 0u;
    long long v378 = 0u;
    long long v375 = 0u;
    long long v376 = 0u;
    id v35 = v32;
    id v292 = v35;
    id obja = [v35 countByEnumeratingWithState:&v375 objects:v410 count:16];
    if (obja)
    {
      uint64_t v316 = *(void *)v376;
      uint64_t v272 = 136316418;
      do
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(void *)v376 != v316) {
            objc_enumerationMutation(v292);
          }
          __int16 v37 = *(void **)(*((void *)&v375 + 1) + 8 * (void)j);
          CFStringRef v38 = [v37 networkSignature];
          __int16 v39 = [v38 wifiPassword];
          if ([v39 isEqualToString:@"ApplePreferredNetworkRecordLabel"])
          {
          }
          else
          {
            __int16 v40 = [v37 networkSignature];
            id v41 = [v40 wifiPassword];
            id v42 = [v41 length];

            if (v42)
            {
              [v344 addObject:v37];
              [v299 addObject:v37];
              [*(id *)(v345 + 32) dumpPreferredNetwork:v37];
              id v43 = sub_10001CCA0(1);
              if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                goto LABEL_74;
              }
              v324 = [v37 networkSignature];
              __int16 v44 = [v324 ipv4NwSignature];
              OSStatus v45 = [v37 networkSignature];
              CFDictionaryRef v46 = [v45 ipv6NwSignature];
              long long v47 = [v37 networkSignature];
              long long v48 = [v47 wifiSSID];
              CFStringRef v49 = &stru_100075A30;
              if (v48)
              {
                v271 = [v37 networkSignature];
                CFStringRef v49 = [v271 wifiSSID];
                v270 = (__CFString *)v49;
              }
              long long v50 = [v37 networkSignature];
              id v51 = [v50 wifiPassword];
              *(_DWORD *)buf = 136316418;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2811;
              __int16 v396 = 2112;
              id v397 = v44;
              __int16 v398 = 2112;
              id v399 = v46;
              __int16 v400 = 2112;
              CFStringRef v401 = v49;
              __int16 v402 = 2112;
              id v403 = v51;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s:%d Label is not equal to constant - ApplePreferredNetworkRecordLabel : ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x3Au);

              if (!v48) {
                goto LABEL_68;
              }

              __int16 v52 = v271;
              goto LABEL_67;
            }
          }
          long long v53 = sub_10001CCA0(1);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            __int16 v54 = [v37 network];
            v325 = [v54 networkName];
            long long v55 = [v37 network];
            __int16 v56 = [v55 extendedPANID];
            OSStatus v57 = [v37 networkSignature];
            v58 = [v57 wifiSSID];
            id v307 = v54;
            v300 = v55;
            if (v58)
            {
              v280 = [v37 networkSignature];
              CFStringRef v59 = [v280 wifiSSID];
              v275 = (__CFString *)v59;
            }
            else
            {
              CFStringRef v59 = &stru_100075A30;
            }
            __int16 v60 = [v37 credentialsDataSetRecord];
            int v61 = [v37 networkSignature];
            __int16 v62 = [v61 wifiPassword];
            if (v62)
            {
              v285 = [v37 networkSignature];
              v277 = [v285 wifiPassword];
              CFStringRef v63 = v277;
            }
            else
            {
              CFStringRef v63 = @"EMPTY LABEL";
            }
            *(_DWORD *)buf = 136316674;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2790;
            __int16 v396 = 2112;
            id v397 = v325;
            __int16 v398 = 2112;
            id v399 = v56;
            __int16 v400 = 2112;
            CFStringRef v401 = v59;
            __int16 v402 = 2048;
            id v403 = v60;
            __int16 v404 = 2112;
            CFStringRef v405 = v63;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s:%d: No network signature modification is needed for this item : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, pwd = %@", buf, 0x44u);
            if (v62)
            {
            }
            if (v58)
            {
            }
          }

          v64 = [v37 credentialsDataSetRecord];

          if (v64)
          {
            size_t v65 = [v37 credentialsDataSetRecord];
            [v342 addObject:v65];

            id v43 = sub_10001CCA0(1);
            if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
              goto LABEL_74;
            }
            char v66 = [v37 network];
            v326 = [v66 networkName];
            v67 = [v37 network];
            unsigned int v68 = [v67 extendedPANID];
            v69 = [v37 networkSignature];
            char v70 = [v69 wifiSSID];
            id v308 = v66;
            if (v70)
            {
              v274 = [v37 networkSignature];
              CFStringRef v71 = [v274 wifiSSID];
              v273 = (__CFString *)v71;
            }
            else
            {
              CFStringRef v71 = &stru_100075A30;
            }
            CFDictionaryRef v76 = [v37 credentialsDataSetRecord];
            CFDictionaryRef v77 = [v37 networkSignature];
            int v78 = [v77 wifiPassword];
            *(_DWORD *)buf = 136316674;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2801;
            __int16 v396 = 2112;
            id v397 = v326;
            __int16 v398 = 2112;
            id v399 = v68;
            __int16 v400 = 2112;
            CFStringRef v401 = v71;
            __int16 v402 = 2048;
            id v403 = v76;
            __int16 v404 = 2112;
            CFStringRef v405 = v78;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s:%d: adding item to finalPreferredBARecordList - item : (name : %@ | xpanid : %@), ssid : %@, DS Record = %p, pwd = %@", buf, 0x44u);

            if (v70)
            {
            }
            int v75 = v308;
            goto LABEL_73;
          }
          [v299 addObject:v37];
          id v43 = sub_10001CCA0(1);
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          v324 = [v37 networkSignature];
          __int16 v44 = [v324 ipv4NwSignature];
          OSStatus v45 = [v37 networkSignature];
          CFDictionaryRef v46 = [v45 ipv6NwSignature];
          long long v47 = [v37 networkSignature];
          long long v48 = [v47 wifiSSID];
          CFStringRef v72 = &stru_100075A30;
          if (v48)
          {
            v269 = [v37 networkSignature];
            CFStringRef v72 = [v269 wifiSSID];
            v268 = (void *)v72;
          }
          uint64_t v73 = [v37 networkSignature];
          uint64_t v74 = [v73 wifiPassword];
          *(_DWORD *)buf = 136316418;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 2796;
          __int16 v396 = 2112;
          id v397 = v44;
          __int16 v398 = 2112;
          id v399 = v46;
          __int16 v400 = 2112;
          CFStringRef v401 = v72;
          __int16 v402 = 2112;
          id v403 = v74;
          _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s:%d DS Record is nil but Label is equal to constant - ApplePreferredNetworkRecordLabel or it is empty : ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x3Au);

          if (v48)
          {

            __int16 v52 = v269;
LABEL_67:
          }
LABEL_68:

          int v75 = v324;
LABEL_73:

LABEL_74:
        }
        id v35 = v292;
        id obja = [v292 countByEnumeratingWithState:&v375 objects:v410 count:16];
      }
      while (obja);
    }

    [v35 removeAllObjects];
    v79 = sub_10001CCA0(1);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      id v80 = [v299 count];
      id v81 = [v344 count];
      *(_DWORD *)buf = 136315906;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2819;
      __int16 v396 = 2048;
      id v397 = v80;
      __int16 v398 = 2048;
      id v399 = v81;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "%s:%d: End of 2nd pass, size of keepPreferredListForModification : %lu, size of cleanUpPreferredList : %lu ", buf, 0x26u);
    }

    CFDictionaryRef v82 = sub_10001CCA0(1);
    a1 = v345;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      id v83 = [v299 count];
      id v84 = [v342 count];
      *(_DWORD *)buf = 136315906;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2820;
      __int16 v396 = 2048;
      id v397 = v83;
      __int16 v398 = 2048;
      id v399 = v84;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "%s:%d: End of 2nd pass, size of keepPreferredListForModification : %lu , size of finalPreferredBARecordList : %lu", buf, 0x26u);
    }

    v85 = sub_10001CCA0(1);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2822;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s:%d: Before 3rd pass starts", buf, 0x12u);
    }

    long long v373 = 0u;
    long long v374 = 0u;
    long long v371 = 0u;
    long long v372 = 0u;
    id v309 = v299;
    id v327 = [v309 countByEnumeratingWithState:&v371 objects:v409 count:16];
    if (v327)
    {
      uint64_t v317 = *(void *)v372;
      do
      {
        v86 = 0;
        do
        {
          if (*(void *)v372 != v317) {
            objc_enumerationMutation(v309);
          }
          v87 = *(void **)(*((void *)&v371 + 1) + 8 * (void)v86);
          v88 = [v87 credentialsDataSetRecord];

          if (v88)
          {
            v89 = [v87 credentialsDataSetRecord];
LABEL_90:
            v92 = [v87 networkSignature];
            v93 = [v92 wifiPassword];
            if ([v93 isEqualToString:@"ApplePreferredNetworkRecordLabel"])
            {

              goto LABEL_97;
            }
            __int16 v94 = [v87 networkSignature];
            [v94 wifiPassword];
            int v95 = objb = v89;
            id v96 = [v95 length];

            v89 = objb;
            if (v96)
            {
              id v97 = objc_alloc((Class)THNetworkSignature);
              __int16 v98 = [v87 networkSignature];
              v99 = [v98 ipv4NwSignature];
              __int16 v100 = [v87 networkSignature];
              v101 = [v100 ipv6NwSignature];
              __int16 v102 = [v87 networkSignature];
              v103 = [v102 wifiPassword];
              id v104 = [v97 initWithSignatures:v99 ipv6NwSignature:v101 wifSSID:v103 wifiPassword:@"ApplePreferredNetworkRecordLabel"];

              a1 = v345;
              v89 = objb;

              if (!v104)
              {
                v105 = sub_10001CCA0(1);
                if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                {
                  v127 = [v87 network];
                  v128 = [v127 networkName];
                  v129 = [v87 network];
                  v130 = [v129 extendedPANID];
                  *(_DWORD *)buf = 136315906;
                  v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                  __int16 v394 = 1024;
                  int v395 = 2849;
                  __int16 v396 = 2112;
                  id v397 = v128;
                  __int16 v398 = 2112;
                  id v399 = v130;
                  _os_log_error_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, "%s:%d:Error : initializing copy of nw signature for item : (name : %@ | xpanid : %@)", buf, 0x26u);
                }
                [v344 removeObject:v87];
                goto LABEL_106;
              }
            }
            else
            {
LABEL_97:
              id v104 = [v87 networkSignature];
            }
            id v106 = objc_alloc((Class)THPreferredThreadNetwork);
            v107 = [v87 network];
            v108 = [v87 creationDate];
            v109 = [v87 userInfo];
            id v110 = [v106 initWithThreadNetwork:v107 networkSignature:v104 credentialsDataSetRecord:v89 creationDate:v108 lastModificationDate:0 userInfo:v109];

            if (v110)
            {
              v111 = [v110 credentialsDataSetRecord];
              [v342 addObject:v111];

              [v291 addObject:v110];
              v112 = sub_10001CCA0(1);
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                v115 = [v110 network];
                v116 = [v115 networkName];
                v117 = [v110 network];
                v118 = [v117 extendedPANID];
                *(_DWORD *)buf = 136315906;
                v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                __int16 v394 = 1024;
                int v395 = 2864;
                __int16 v396 = 2112;
                id v397 = v116;
                __int16 v398 = 2112;
                id v399 = v118;
                _os_log_error_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%s:%d: 3rd pass, updated Signature & adding to Final/ToBeUpdated Preferred List - item : (name : %@ | xpanid : %@)", buf, 0x26u);

                a1 = v345;
              }
            }
            else
            {
              v113 = sub_10001CCA0(1);
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                v119 = [v87 network];
                v120 = [v119 networkName];
                v121 = [v87 network];
                v122 = [v121 extendedPANID];
                *(_DWORD *)buf = 136315906;
                v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                __int16 v394 = 1024;
                int v395 = 2867;
                __int16 v396 = 2112;
                id v397 = v120;
                __int16 v398 = 2112;
                id v399 = v122;
                _os_log_error_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "%s:%d: Failed to create instance of updated preferred network for item : (name : %@ | xpanid : %@)", buf, 0x26u);

                a1 = v345;
              }

              [v344 removeObject:v87];
            }

LABEL_106:
            goto LABEL_107;
          }
          unsigned int v90 = *(void **)(a1 + 32);
          unsigned __int8 v91 = [v87 network];
          v89 = [v90 getOneRecordForNetwork:v91];

          if (v89) {
            goto LABEL_90;
          }
          v114 = sub_10001CCA0(1);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            v123 = [v87 network];
            v124 = [v123 networkName];
            v125 = [v87 network];
            v126 = [v125 extendedPANID];
            *(_DWORD *)buf = 136315906;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2830;
            __int16 v396 = 2112;
            id v397 = v124;
            __int16 v398 = 2112;
            id v399 = v126;
            _os_log_error_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "%s:%d: Failed to get ds record for item : (name : %@ | xpanid : %@)", buf, 0x26u);
          }
          [v344 addObject:v87];
LABEL_107:
          v86 = (char *)v86 + 1;
        }
        while (v327 != v86);
        id v131 = [v309 countByEnumeratingWithState:&v371 objects:v409 count:16];
        id v327 = v131;
      }
      while (v131);
    }

    v132 = sub_10001CCA0(1);
    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
      sub_10003E604(v291, v344);
    }

    v133 = sub_10001CCA0(1);
    if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
    {
      id v134 = [v342 count];
      id v135 = [v291 count];
      *(_DWORD *)buf = 136315906;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2873;
      __int16 v396 = 2048;
      id v397 = v134;
      __int16 v398 = 2048;
      id v399 = v135;
      _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_INFO, "%s:%d: End of 3rd pass, size of finalPreferredBARecordList : %lu, toBeUpdatedPreferredList : %lu ", buf, 0x26u);
    }

    [v309 removeAllObjects];
    v136 = sub_10001CCA0(1);
    if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
      sub_10003E578(v291);
    }

    long long v369 = 0u;
    long long v370 = 0u;
    long long v367 = 0u;
    long long v368 = 0u;
    id v137 = v291;
    id v138 = [v137 countByEnumeratingWithState:&v367 objects:v408 count:16];
    if (v138)
    {
      id v139 = v138;
      uint64_t v140 = *(void *)v368;
      id v278 = v137;
      do
      {
        v141 = 0;
        do
        {
          if (*(void *)v368 != v140) {
            objc_enumerationMutation(v137);
          }
          v142 = *(void **)(*((void *)&v367 + 1) + 8 * (void)v141);
          int v366 = 0;
          [*(id *)(a1 + 32) dumpPreferredNetwork:v142];
          if (v142
            && [*(id *)(a1 + 32) storePreferredEntryAndCheckForDup:v142 isDuplicate:&v366])
          {
            int v143 = v366;
            v144 = sub_10001CCA0(1);
            BOOL v145 = os_log_type_enabled(v144, OS_LOG_TYPE_ERROR);
            if (v143 == 1)
            {
              if (v145)
              {
                v303 = [v142 network];
                obje = [v303 networkName];
                v295 = [v142 network];
                v330 = [v295 extendedPANID];
                v288 = [v142 networkSignature];
                v320 = [v288 ipv4NwSignature];
                v282 = [v142 networkSignature];
                id v312 = [v282 ipv6NwSignature];
                v159 = [v142 networkSignature];
                v160 = [v159 wifiSSID];
                CFStringRef v161 = &stru_100075A30;
                if (v160)
                {
                  uint64_t v272 = [v142 networkSignature];
                  CFStringRef v161 = [(id)v272 wifiSSID];
                  v270 = (__CFString *)v161;
                }
                v162 = [v142 networkSignature];
                v163 = [v162 wifiPassword];
                *(_DWORD *)buf = 136316930;
                v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                __int16 v394 = 1024;
                int v395 = 2892;
                __int16 v396 = 2112;
                id v397 = obje;
                __int16 v398 = 2112;
                id v399 = v330;
                __int16 v400 = 2112;
                CFStringRef v401 = v320;
                __int16 v402 = 2112;
                id v403 = v312;
                __int16 v404 = 2112;
                CFStringRef v405 = v161;
                __int16 v406 = 2112;
                v407 = v163;
                _os_log_error_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_ERROR, "%s:%d Updated the preferred Network : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

                if (v160)
                {
                }
                a1 = v345;
                id v137 = v278;
              }

              v144 = [*(id *)(a1 + 32) checkIfPrefItemPresentInTheCleanupList:v142 cleanupList:v344];
              if (v144)
              {
                v146 = sub_10001CCA0(1);
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                {
                  v304 = [v142 network];
                  objf = [v304 networkName];
                  v296 = [v142 network];
                  v331 = [v296 extendedPANID];
                  v289 = [v142 networkSignature];
                  v321 = [v289 ipv4NwSignature];
                  v283 = [v142 networkSignature];
                  id v313 = [v283 ipv6NwSignature];
                  v164 = [v142 networkSignature];
                  v165 = [v164 wifiSSID];
                  CFStringRef v166 = &stru_100075A30;
                  if (v165)
                  {
                    v268 = [v142 networkSignature];
                    CFStringRef v166 = [v268 wifiSSID];
                    v265 = (__CFString *)v166;
                  }
                  v167 = [v142 networkSignature];
                  v168 = [v167 wifiPassword];
                  *(_DWORD *)buf = 136316930;
                  v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
                  __int16 v394 = 1024;
                  int v395 = 2896;
                  __int16 v396 = 2112;
                  id v397 = objf;
                  __int16 v398 = 2112;
                  id v399 = v331;
                  __int16 v400 = 2112;
                  CFStringRef v401 = v321;
                  __int16 v402 = 2112;
                  id v403 = v313;
                  __int16 v404 = 2112;
                  CFStringRef v405 = v166;
                  __int16 v406 = 2112;
                  v407 = v168;
                  _os_log_error_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "%s:%d Removing from  cleanUpPreferredList : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

                  if (v165)
                  {
                  }
                  a1 = v345;
                  id v137 = v278;
                }

                [v344 removeObject:v144];
              }
            }
            else if (v145)
            {
              id v310 = [v142 network];
              objc = [v310 networkName];
              v301 = [v142 network];
              v328 = [v301 extendedPANID];
              v293 = [v142 networkSignature];
              v318 = [v293 ipv4NwSignature];
              v286 = [v142 networkSignature];
              v148 = [v286 ipv6NwSignature];
              v149 = [v142 networkSignature];
              v150 = [v149 wifiSSID];
              CFStringRef v151 = &stru_100075A30;
              if (v150)
              {
                v271 = [v142 networkSignature];
                CFStringRef v151 = [v271 wifiSSID];
                v269 = (void *)v151;
              }
              v152 = [v142 networkSignature];
              v153 = [v152 wifiPassword];
              *(_DWORD *)buf = 136316930;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2901;
              __int16 v396 = 2112;
              id v397 = objc;
              __int16 v398 = 2112;
              id v399 = v328;
              __int16 v400 = 2112;
              CFStringRef v401 = v318;
              __int16 v402 = 2112;
              id v403 = v148;
              __int16 v404 = 2112;
              CFStringRef v405 = v151;
              __int16 v406 = 2112;
              v407 = v153;
              _os_log_error_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_ERROR, "%s:%d Stored a new entry for preferred Network : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

              if (v150)
              {
              }
              a1 = v345;
              id v137 = v278;
            }
          }
          else
          {
            v147 = sub_10001CCA0(1);
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            {
              v302 = [v142 network];
              objd = [v302 networkName];
              v294 = [v142 network];
              v329 = [v294 extendedPANID];
              v287 = [v142 networkSignature];
              v319 = [v287 ipv4NwSignature];
              v281 = [v142 networkSignature];
              id v311 = [v281 ipv6NwSignature];
              v154 = [v142 networkSignature];
              v155 = [v154 wifiSSID];
              CFStringRef v156 = &stru_100075A30;
              if (v155)
              {
                v274 = [v142 networkSignature];
                CFStringRef v156 = [v274 wifiSSID];
                v273 = (__CFString *)v156;
              }
              v157 = [v142 networkSignature];
              v158 = [v157 wifiPassword];
              *(_DWORD *)buf = 136316930;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2906;
              __int16 v396 = 2112;
              id v397 = objd;
              __int16 v398 = 2112;
              id v399 = v329;
              __int16 v400 = 2112;
              CFStringRef v401 = v319;
              __int16 v402 = 2112;
              id v403 = v311;
              __int16 v404 = 2112;
              CFStringRef v405 = v156;
              __int16 v406 = 2112;
              v407 = v158;
              _os_log_error_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "%s:%d Failed to store preferred network  : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

              if (v155)
              {
              }
              a1 = v345;
              id v137 = v278;
            }

            v144 = [*(id *)(a1 + 32) getTheKeyFromPreferredNetworkEntry:v142];
            [v343 setObject:v142 forKey:v144];
          }

          v141 = (char *)v141 + 1;
        }
        while (v139 != v141);
        id v169 = [v137 countByEnumeratingWithState:&v367 objects:v408 count:16];
        id v139 = v169;
      }
      while (v169);
    }

    [v137 removeAllObjects];
    v170 = sub_10001CCA0(1);
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR)) {
      sub_10003E4EC(v344);
    }

    long long v364 = 0u;
    long long v365 = 0u;
    long long v362 = 0u;
    long long v363 = 0u;
    id v171 = v344;
    id v172 = [v171 countByEnumeratingWithState:&v362 objects:v391 count:16];
    if (v172)
    {
      id v173 = v172;
      uint64_t v174 = *(void *)v363;
      id objg = v171;
      do
      {
        v175 = 0;
        do
        {
          if (*(void *)v363 != v174) {
            objc_enumerationMutation(v171);
          }
          v176 = *(void **)(*((void *)&v362 + 1) + 8 * (void)v175);
          v177 = [*(id *)(a1 + 32) getTheKeyFromPreferredNetworkEntry:v176];
          v178 = [v343 objectForKeyedSubscript:v177];

          if (v178)
          {
            v179 = sub_10001CCA0(1);
            if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
            {
              v181 = [v176 network];
              v182 = [v181 networkName];
              v183 = [v176 network];
              v184 = [v183 extendedPANID];
              *(_DWORD *)buf = 136315906;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2927;
              __int16 v396 = 2112;
              id v397 = v182;
              __int16 v398 = 2112;
              id v399 = v184;
              _os_log_error_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_ERROR, "%s:%d: Do not touch the preferred network entry : (name : %@ | xpanid : %@)", buf, 0x26u);

              a1 = v345;
              id v171 = objg;
            }

            [*(id *)(a1 + 32) dumpPreferredNetwork:v176];
          }
          else if (([*(id *)(a1 + 32) deletePreferredNetworkEntryWithoutRecords:v176] & 1) == 0)
          {
            v180 = sub_10001CCA0(1);
            if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
            {
              v290 = [v176 network];
              v322 = [v290 networkName];
              v284 = [v176 network];
              id v314 = [v284 extendedPANID];
              v279 = [v176 networkSignature];
              v305 = [v279 ipv4NwSignature];
              v276 = [v176 networkSignature];
              v297 = [v276 ipv6NwSignature];
              v185 = [v176 networkSignature];
              v186 = [v185 wifiSSID];
              CFStringRef v187 = &stru_100075A30;
              if (v186)
              {
                v274 = [v176 networkSignature];
                CFStringRef v187 = [v274 wifiSSID];
                v273 = (__CFString *)v187;
              }
              v188 = [v176 networkSignature];
              v189 = [v188 wifiPassword];
              *(_DWORD *)buf = 136316930;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2934;
              __int16 v396 = 2112;
              id v397 = v322;
              __int16 v398 = 2112;
              id v399 = v314;
              __int16 v400 = 2112;
              CFStringRef v401 = v305;
              __int16 v402 = 2112;
              id v403 = v297;
              __int16 v404 = 2112;
              CFStringRef v405 = v187;
              __int16 v406 = 2112;
              v407 = v189;
              _os_log_error_impl((void *)&_mh_execute_header, v180, OS_LOG_TYPE_ERROR, "%s:%d Failed to delete the previous preferred network entry : (name : %@ | xpanid : %@), ipv4 signature : %@, ipv6 signature : %@ , ssid : %@, pwd : %@", buf, 0x4Eu);

              if (v186)
              {
              }
              a1 = v345;
              id v171 = objg;
            }
          }
          v175 = (char *)v175 + 1;
        }
        while (v173 != v175);
        id v190 = [v171 countByEnumeratingWithState:&v362 objects:v391 count:16];
        id v173 = v190;
      }
      while (v190);
    }

    [v343 removeAllObjects];
    [v171 removeAllObjects];
    v191 = [*(id *)(a1 + 32) getNumberOfPrefEntriesForTheCount:200];
    v192 = sub_10001CCA0(1);
    if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
    {
      id v193 = [v191 count];
      *(_DWORD *)buf = 136315650;
      v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
      __int16 v394 = 1024;
      int v395 = 2942;
      __int16 v396 = 2048;
      id v397 = v193;
      _os_log_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_INFO, "%s:%d: End of 3rd Pass, size of preferred networks (prefNwFinalRecords) : %lu", buf, 0x1Cu);
    }

    id v194 = [v191 count];
    id v11 = (id)*((void *)&v384 + 1);
    *((void *)&v385 + 1) = v194;
    *(void *)&long long v385 = *((void *)&v384 + 1) - (void)v194;

    id v8 = &AWDPostMetric_ptr;
  }
  else
  {
    id v292 = v9;
    v195 = sub_10001CCA0(1);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR)) {
      sub_10003E470();
    }

    long long v385 = 0uLL;
  }

  v196 = [*(id *)(a1 + 32) getNumberOfRecordsForKeychainAccessGroup:@"0000000000" count:400];
  v197 = sub_10001CCA0(1);
  if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR)) {
    sub_10003E3E4(v196);
  }

  v315 = (char *)[v196 count];
  *(void *)&long long v383 = v315;
  v306 = v196;
  if (!v196)
  {
    long long v348 = 0u;
    long long v349 = 0u;
    long long v346 = 0u;
    long long v347 = 0u;
    id v220 = v342;
    id v236 = [v220 countByEnumeratingWithState:&v346 objects:v387 count:16];
    if (!v236) {
      goto LABEL_265;
    }
    id v237 = v236;
    id v298 = v11;
    uint64_t v238 = *(void *)v347;
    while (1)
    {
      v239 = 0;
      do
      {
        if (*(void *)v347 != v238) {
          objc_enumerationMutation(v220);
        }
        v240 = *(void **)(*((void *)&v346 + 1) + 8 * (void)v239);
        if (v240
          && [*(id *)(v345 + 32) updateRecord:*(void *)(*((void *)&v346 + 1) + 8 * (void)v239)])
        {
          v241 = sub_10001CCA0(1);
          if (!os_log_type_enabled(v241, OS_LOG_TYPE_ERROR)) {
            goto LABEL_239;
          }
          v242 = [v240 network];
          v243 = [v242 networkName];
          v244 = [v240 network];
          v245 = [v244 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3019;
          __int16 v396 = 2112;
          id v397 = v243;
          __int16 v398 = 2112;
          id v399 = v245;
          v246 = v241;
          v247 = "%s:%d: Updated BA Record for item : (name : %@ | xpanid : %@)";
        }
        else
        {
          v241 = sub_10001CCA0(1);
          if (!os_log_type_enabled(v241, OS_LOG_TYPE_ERROR)) {
            goto LABEL_239;
          }
          v242 = [v240 network];
          v243 = [v242 networkName];
          v244 = [v240 network];
          v245 = [v244 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3021;
          __int16 v396 = 2112;
          id v397 = v243;
          __int16 v398 = 2112;
          id v399 = v245;
          v246 = v241;
          v247 = "%s:%d: Failed to create instance of BA Record for item : (name : %@ | xpanid : %@)";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_ERROR, v247, buf, 0x26u);

LABEL_239:
        v239 = (char *)v239 + 1;
      }
      while (v237 != v239);
      id v248 = [v220 countByEnumeratingWithState:&v346 objects:v387 count:16];
      id v237 = v248;
      if (!v248)
      {
LABEL_264:
        a1 = v345;
        id v11 = v298;
        goto LABEL_265;
      }
    }
  }
  if ((unint64_t)[v196 count] <= 0x18F)
  {
    id v298 = v11;
    v198 = [v8[186] arrayWithArray:v342];
    long long v358 = 0u;
    long long v359 = 0u;
    long long v360 = 0u;
    long long v361 = 0u;
    id v199 = v196;
    id v200 = [v199 countByEnumeratingWithState:&v358 objects:v390 count:16];
    if (!v200) {
      goto LABEL_208;
    }
    id v201 = v200;
    uint64_t v202 = *(void *)v359;
    while (1)
    {
      for (k = 0; k != v201; k = (char *)k + 1)
      {
        if (*(void *)v359 != v202) {
          objc_enumerationMutation(v199);
        }
        v204 = *(void **)(*((void *)&v358 + 1) + 8 * (void)k);
        if (v204)
        {
          if ([*(id *)(v345 + 32) checkIfActiveDatasetRecordIsPresentInTheGivenList:v342 Missinglist:v198 record:*(void *)(*((void *)&v358 + 1) + 8 * (void)k)])
          {
            v205 = sub_10001CCA0(1);
            if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR))
            {
              v332 = [v204 network];
              v206 = [v332 networkName];
              v323 = [v204 network];
              v207 = [v323 extendedPANID];
              v208 = [v204 borderAgent];
              v209 = [v208 discriminatorId];
              *(_DWORD *)buf = 136316162;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2984;
              __int16 v396 = 2112;
              id v397 = v206;
              __int16 v398 = 2112;
              id v399 = v207;
              __int16 v400 = 2112;
              CFStringRef v401 = v209;
              v210 = v205;
              v211 = "%s:%d: Not deleting the ba record (name : %@ | xpanid : %@ | baID : %@), this belongs to Preferred BARecord List.";
              goto LABEL_203;
            }
LABEL_205:

            continue;
          }
          v212 = *(void **)(v345 + 32);
          v213 = [v204 network];
          v214 = [v204 borderAgent];
          v215 = [v212 deleteActiveDataSetRecordForNetworkAndBorderAgentId:v213 borderAgent:v214];

          if (v215)
          {
            v205 = sub_10001CCA0(1);
            if (!os_log_type_enabled(v205, OS_LOG_TYPE_ERROR)) {
              goto LABEL_205;
            }
            v332 = [v204 network];
            v206 = [v332 networkName];
            v323 = [v204 network];
            v216 = [v323 extendedPANID];
            v217 = [v204 borderAgent];
            v218 = [v217 discriminatorId];
            *(_DWORD *)buf = 136316162;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2976;
            __int16 v396 = 2112;
            id v397 = v206;
            __int16 v398 = 2112;
            id v399 = v216;
            __int16 v400 = 2112;
            CFStringRef v401 = v218;
            _os_log_error_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_ERROR, "%s:%d: Failed to delete border agent record (name : %@ | xpanid : %@ | baID : %@)", buf, 0x30u);
          }
          else
          {
            [*(id *)(v345 + 32) thDumpActiveDatasetRecord:v204];
            v205 = sub_10001CCA0(1);
            if (!os_log_type_enabled(v205, OS_LOG_TYPE_ERROR)) {
              goto LABEL_205;
            }
            v332 = [v204 network];
            v206 = [v332 networkName];
            v323 = [v204 network];
            v207 = [v323 extendedPANID];
            v208 = [v204 borderAgent];
            v209 = [v208 discriminatorId];
            *(_DWORD *)buf = 136316162;
            v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
            __int16 v394 = 1024;
            int v395 = 2979;
            __int16 v396 = 2112;
            id v397 = v206;
            __int16 v398 = 2112;
            id v399 = v207;
            __int16 v400 = 2112;
            CFStringRef v401 = v209;
            v210 = v205;
            v211 = "%s:%d: Deleted the ba record (name : %@ | xpanid : %@ | baID : %@), this doesn't belong to Preferred BARecord List.";
LABEL_203:
            _os_log_error_impl((void *)&_mh_execute_header, v210, OS_LOG_TYPE_ERROR, v211, buf, 0x30u);
          }
          goto LABEL_205;
        }
      }
      id v201 = [v199 countByEnumeratingWithState:&v358 objects:v390 count:16];
      if (!v201)
      {
LABEL_208:

        v219 = sub_10001CCA0(1);
        if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR)) {
          sub_10003E2DC(v198);
        }

        long long v356 = 0u;
        long long v357 = 0u;
        long long v354 = 0u;
        long long v355 = 0u;
        id v220 = v198;
        id v221 = [v220 countByEnumeratingWithState:&v354 objects:v389 count:16];
        if (!v221)
        {
LABEL_225:

          goto LABEL_264;
        }
        id v222 = v221;
        uint64_t v223 = *(void *)v355;
        while (2)
        {
          uint64_t v224 = 0;
LABEL_213:
          if (*(void *)v355 != v223) {
            objc_enumerationMutation(v220);
          }
          v225 = *(void **)(*((void *)&v354 + 1) + 8 * v224);
          if (v225
            && [*(id *)(v345 + 32) updateRecord:*(void *)(*((void *)&v354 + 1) + 8 * v224)])
          {
            v226 = sub_10001CCA0(1);
            if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
            {
              v227 = [v225 network];
              v228 = [v227 networkName];
              v229 = [v225 network];
              v230 = [v229 extendedPANID];
              *(_DWORD *)buf = 136315906;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2993;
              __int16 v396 = 2112;
              id v397 = v228;
              __int16 v398 = 2112;
              id v399 = v230;
              v231 = v226;
              v232 = "%s:%d: Updated Missing BA Record for item : (name : %@ | xpanid : %@)";
              goto LABEL_223;
            }
          }
          else
          {
            v226 = sub_10001CCA0(1);
            if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
            {
              v227 = [v225 network];
              v228 = [v227 networkName];
              v229 = [v225 network];
              v230 = [v229 extendedPANID];
              *(_DWORD *)buf = 136315906;
              v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
              __int16 v394 = 1024;
              int v395 = 2995;
              __int16 v396 = 2112;
              id v397 = v228;
              __int16 v398 = 2112;
              id v399 = v230;
              v231 = v226;
              v232 = "%s:%d: Failed to create instance of Missing BA Record for item : (name : %@ | xpanid : %@)";
LABEL_223:
              _os_log_error_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_ERROR, v232, buf, 0x26u);
            }
          }

          if (v222 == (id)++v224)
          {
            id v233 = [v220 countByEnumeratingWithState:&v354 objects:v389 count:16];
            id v222 = v233;
            if (!v233) {
              goto LABEL_225;
            }
            continue;
          }
          goto LABEL_213;
        }
      }
    }
  }
  if (([*(id *)(a1 + 32) deleteAllRecordsForKeychainAccessGroup:@"0000000000"] & 1) == 0)
  {
    v249 = sub_10001CCA0(1);
    if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR)) {
      sub_10003E368();
    }
  }
  long long v352 = 0u;
  long long v353 = 0u;
  long long v350 = 0u;
  long long v351 = 0u;
  id v220 = v342;
  id v250 = [v220 countByEnumeratingWithState:&v350 objects:v388 count:16];
  if (v250)
  {
    id v251 = v250;
    id v298 = v11;
    uint64_t v252 = *(void *)v351;
    while (1)
    {
      v253 = 0;
      do
      {
        if (*(void *)v351 != v252) {
          objc_enumerationMutation(v220);
        }
        v254 = *(void **)(*((void *)&v350 + 1) + 8 * (void)v253);
        if (v254
          && [*(id *)(v345 + 32) updateRecord:*(void *)(*((void *)&v350 + 1) + 8 * (void)v253)])
        {
          v255 = sub_10001CCA0(1);
          if (!os_log_type_enabled(v255, OS_LOG_TYPE_ERROR)) {
            goto LABEL_259;
          }
          v256 = [v254 network];
          v257 = [v256 networkName];
          v258 = [v254 network];
          v259 = [v258 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3009;
          __int16 v396 = 2112;
          id v397 = v257;
          __int16 v398 = 2112;
          id v399 = v259;
          v260 = v255;
          v261 = "%s:%d: Updated BA Record for item : (name : %@ | xpanid : %@)";
        }
        else
        {
          v255 = sub_10001CCA0(1);
          if (!os_log_type_enabled(v255, OS_LOG_TYPE_ERROR)) {
            goto LABEL_259;
          }
          v256 = [v254 network];
          v257 = [v256 networkName];
          v258 = [v254 network];
          v259 = [v258 extendedPANID];
          *(_DWORD *)buf = 136315906;
          v393 = "-[THThreadNetworkCredentialsKeychainBackingStore cleanThreadKeychainDatabase:]_block_invoke";
          __int16 v394 = 1024;
          int v395 = 3011;
          __int16 v396 = 2112;
          id v397 = v257;
          __int16 v398 = 2112;
          id v399 = v259;
          v260 = v255;
          v261 = "%s:%d: Failed to create instance of BA Record for item : (name : %@ | xpanid : %@)";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_ERROR, v261, buf, 0x26u);

LABEL_259:
        v253 = (char *)v253 + 1;
      }
      while (v251 != v253);
      id v262 = [v220 countByEnumeratingWithState:&v350 objects:v388 count:16];
      id v251 = v262;
      if (!v262) {
        goto LABEL_264;
      }
    }
  }
LABEL_265:

  v263 = [*(id *)(a1 + 32) getNumberOfRecordsForKeychainAccessGroup:@"0000000000" count:400];

  v264 = sub_10001CCA0(1);
  if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR)) {
    sub_10003E250(v263);
  }

  *(void *)&long long v384 = [v263 count];
  *((void *)&v383 + 1) = &v315[-v384];
  if (v11) {
    [*(id *)(a1 + 32) sendCAMetricsForCleanUpRecordInfo:&v383];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  uint64_t v2 = v266;
  v235 = v341;
LABEL_270:
}

void sub_10002FEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10002FEC4(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stopScan];
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

int64_t sub_100030AF4(id a1, id a2, id a3)
{
  id v4 = a3;
  OSStatus v5 = [a2 creationDate];
  __int16 v6 = [v4 creationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100030F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100030FA8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

void sub_100031548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100031584(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stopScan];
}

int64_t sub_10003364C(id a1, id a2, id a3)
{
  id v4 = a3;
  OSStatus v5 = [a2 creationDate];
  __int16 v6 = [v4 creationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

int64_t sub_10003709C(id a1, id a2, id a3)
{
  id v4 = a3;
  OSStatus v5 = [a2 lastModificationDate];
  __int16 v6 = [v4 lastModificationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

int64_t sub_100037460(id a1, id a2, id a3)
{
  id v4 = a3;
  OSStatus v5 = [a2 lastModificationDate];
  __int16 v6 = [v4 lastModificationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_10003A020()
{
  BOOL v0 = sub_10003AD04();
  uint32_t v1 = sub_10001CCA0(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = [v0 substringToIndex:16];
    int v5 = 138412546;
    __int16 v6 = v2;
    __int16 v7 = 2112;
    id v8 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Generated new BAID: %@, full string: %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t v3 = [v0 substringToIndex:16];

  return v3;
}

uint64_t sub_10003A128(int a1, int a2)
{
  return arc4random() % (a2 - a1 + 1) + a1;
}

id sub_10003A910()
{
  BOOL v0 = sub_10003AD04();
  uint32_t v1 = sub_10001CCA0(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = [v0 substringToIndex:16];
    int v5 = 138412546;
    __int16 v6 = v2;
    __int16 v7 = 2112;
    id v8 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Generated new XPANID: %@, full string: %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t v3 = [v0 substringToIndex:16];

  return v3;
}

id sub_10003AA18()
{
  BOOL v0 = +[NSMutableData dataWithLength:16];
  id v1 = [v0 length];
  id v2 = v0;
  if (SecRandomCopyBytes(kSecRandomDefault, (size_t)v1, [v2 mutableBytes]))
  {
    id v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100042134();
    }

    __assert_rtn("generateNewNetworkKeyAsByteArray", "THThreadNetworkCredentialsKeychainBackingStore.m", 5723, "false");
  }
  id v3 = objc_alloc((Class)NSData);
  id v4 = v2;
  id v5 = objc_msgSend(v3, "initWithBytes:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  __int16 v6 = sub_10001CCA0(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Generated the new Network Key :: \"%@\" ", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

id sub_10003ABB4()
{
  BOOL v0 = +[NSMutableString stringWithCapacity:0];
  uint32_t v1 = arc4random();
  id v2 = +[NSString stringWithFormat:@"%s%d", "MyHome", v1 + ((v1 / 0x7FFFFFFF) | ((v1 / 0x7FFFFFFF) << 31)) + 1];
  [v0 appendString:v2];

  id v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v6 = v0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Generated new Network Name: %@", buf, 0xCu);
  }

  return v0;
}

uint64_t sub_10003ACE8(void *a1, size_t a2)
{
  return 1;
}

id sub_10003AD04()
{
  v6[0] = 0;
  v6[1] = 0;
  BOOL v0 = +[NSUUID UUID];
  [v0 getUUIDBytes:v6];

  uint32_t v1 = +[NSData dataWithBytes:v6 length:16];
  sub_10000A244((unsigned __int8 *)v6, 16, __b, 0x24uLL, 0);
  id v2 = +[NSString stringWithUTF8String:__b];
  id v3 = sub_10001CCA0(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100042168();
  }

  return v2;
}

id sub_10003AE18()
{
  v6[0] = 0;
  v6[1] = 0;
  BOOL v0 = +[NSUUID UUID];
  [v0 getUUIDBytes:v6];

  uint32_t v1 = +[NSData dataWithBytes:v6 length:16];
  id v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Generated new uuid_temp: %@", (uint8_t *)&v4, 0xCu);
  }

  return v1;
}

unint64_t sub_10003AF10()
{
  BOOL v0 = sub_10003AE18();
  unint64_t v3 = 0;
  [v0 getBytes:&v3 length:8];
  unint64_t v3 = bswap64(v3);
  NSLog(@"Generated new XPANID Temp: %@, XPANID: 0x%016llx", v0, v3);
  unint64_t v1 = v3;

  return v1;
}

id sub_10003AF78()
{
  BOOL v0 = sub_10003AD04();
  unint64_t v1 = sub_10001CCA0(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    int v4 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Generated new CC \"%@\" ", (uint8_t *)&v3, 0xCu);
  }

  return v0;
}

id sub_10003B03C()
{
  BOOL v0 = sub_10003AD04();
  unint64_t v1 = sub_10001CCA0(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    int v4 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Generated new Master Key \"%@\" ", (uint8_t *)&v3, 0xCu);
  }

  return v0;
}

id sub_10003B100(unsigned __int8 *a1, unsigned int a2)
{
  if (a1)
  {
    int v3 = a1;
    int v4 = +[NSMutableString stringWithCapacity:2 * a2];
    if (a2)
    {
      uint64_t v5 = a2;
      do
      {
        unsigned int v6 = *v3++;
        __int16 v7 = +[NSString stringWithFormat:@"%02lx", v6];
        [v4 appendString:v7];

        --v5;
      }
      while (v5);
    }
    id v8 = +[NSString stringWithString:v4];
  }
  else
  {
    id v8 = +[NSString string];
  }

  return v8;
}

id sub_10003B1E8(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = +[NSMutableString stringWithCapacity:a1];
  if (v1 >= 1)
  {
    do
    {
      [v2 appendFormat:@"%C", objc_msgSend(@"ABCDEFGHJKLMNPRSTUVWXY0123456789", "characterAtIndex:", arc4random()% (unint64_t)objc_msgSend(@"ABCDEFGHJKLMNPRSTUVWXY0123456789", "length"))];
      --v1;
    }
    while (v1);
  }

  return v2;
}

void sub_10003B2A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_10003B2C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10003B2DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10003B330(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void sub_10003B348(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_10003B3CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_10003B40C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

uint64_t sub_10003B468()
{
  return v0;
}

void sub_10003B474(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10003B494()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Failed retrieving thread credential: %@", v2, v3, v4, v5, v6);
}

void sub_10003B4FC()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Retrieved credentials but did not get an array!? %@", v2, v3, v4, v5, v6);
}

void sub_10003B564()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Failed persisting thread credential: %@", v2, v3, v4, v5, v6);
}

void sub_10003B5CC()
{
  sub_10003B3F8();
  sub_100008894((void *)&_mh_execute_header, v0, v1, "%s: Failed deleting thread credentials: %@", v2, v3, v4, v5, 2u);
}

void sub_10003B640()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Failed retrieving thread active data set record: %@", v2, v3, v4, v5, v6);
}

void sub_10003B6A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B718()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Failed retrieving Preferred Network: %@", v2, v3, v4, v5, v6);
}

void sub_10003B780()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Preferred Network not found in the keychain database", v2, v3, v4, v5, v6);
}

void sub_10003B7FC()
{
  v2[0] = 136315650;
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B330((void *)&_mh_execute_header, v0, v1, "%s:%d:Retrieved Preferred Network but did not get an array!? %@", (uint8_t *)v2);
}

void sub_10003B87C()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Failed retrieving Frozen thread Network: %@", v2, v3, v4, v5, v6);
}

void sub_10003B8E4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Frozen thread Network not found in the keychain database", v2, v3, v4, v5, v6);
}

void sub_10003B960()
{
  v2[0] = 136315650;
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B330((void *)&_mh_execute_header, v0, v1, "%s:%d:Retrieved Frozen thread network but did not get an array!? %@", (uint8_t *)v2);
}

void sub_10003B9E0()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "No dataset credentials found.\n", v2, v3, v4, v5, v6);
}

void sub_10003BA14()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003BA90()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Networks in Database ", v2, v3, v4, v5, v6);
}

void sub_10003BB0C(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  sub_10003B474((void *)&_mh_execute_header, v1, v2, "Credentials: %d records:\n", v3, v4, v5, v6, 0);
}

void sub_10003BB94(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) description];
  [v1 UTF8String];
  sub_10003B2DC((void *)&_mh_execute_header, v2, v3, "Error: failed to retrieve (%s)\n", v4, v5, v6, v7, 2u);
}

void sub_10003BC40()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to allocate baFinder", v2, v3, v4, v5, v6);
}

void sub_10003BCBC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to allocate recordList", v2, v3, v4, v5, v6);
}

void sub_10003BD38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003BDB0()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Failed deleting thread active dataset record: %@", v2, v3, v4, v5, v6);
}

void sub_10003BE18()
{
  sub_10003B3F8();
  sub_100008894((void *)&_mh_execute_header, v0, v1, "%s: Failed deleting thread credentials: %@", v2, v3, v4, v5, 2u);
}

void sub_10003BE8C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create black list record to verify", v2, v3, v4, v5, v6);
}

void sub_10003BF08()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch frozen thread networks", v2, v3, v4, v5, v6);
}

void sub_10003BF84()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

void sub_10003C000()
{
  sub_10000A0C4();
  sub_10003B3BC();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s:%d Delete the local record result (error=%d)", v2, v3, v4, v5, 2u);
}

void sub_10003C07C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Updating Preferred network entry failed, deleting the local record", v2, v3, v4, v5, v6);
}

void sub_10003C0F8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Credential exists. Will update instead.", v2, v3, v4, v5, v6);
}

void sub_10003C174()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

void sub_10003C1F0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Returning error : Incoming record doesn't match with the Preferred network =====>", v2, v3, v4, v5, v6);
}

void sub_10003C26C()
{
  sub_10003B3F8();
  sub_100008894((void *)&_mh_execute_header, v0, v1, "%s: Failed deleting thread credentials: %@", v2, v3, v4, v5, 2u);
}

void sub_10003C2E0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

void sub_10003C35C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to dispatch scan", v2, v3, v4, v5, v6);
}

void sub_10003C3D8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

void sub_10003C454()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to dispatch scan", v2, v3, v4, v5, v6);
}

void sub_10003C4D0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to find preferred network", v2, v3, v4, v5, v6);
}

void sub_10003C54C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to convert record Set to Array", v2, v3, v4, v5, v6);
}

void sub_10003C5C8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void sub_10003C644()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void sub_10003C6C0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void sub_10003C73C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void sub_10003C7B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C830(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C8A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C920(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C998()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Credential exists. Will update instead.", v2, v3, v4, v5, v6);
}

void sub_10003CA14()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to get the preferred network record", v2, v3, v4, v5, v6);
}

void sub_10003CA90()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B44C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x26u);
}

void sub_10003CB1C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d:failed to add Preferred Network", v2, v3, v4, v5, v6);
}

void sub_10003CB98()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d:failed to add old format Preferred Network", v2, v3, v4, v5, v6);
}

void sub_10003CC14()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d:failed to add new format Preferred Network", v2, v3, v4, v5, v6);
}

void sub_10003CC90()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Generated new SSID: %@", v2, v3, v4, v5, v6);
}

void sub_10003CCF8()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Generated new pwd: %@", v2, v3, v4, v5, v6);
}

void sub_10003CD60()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred network for networksignature", v2, v3, v4, v5, v6);
}

void sub_10003CDDC()
{
  sub_10003B324();
  sub_10003B2C0((void *)&_mh_execute_header, v0, v1, "Failed deleting Preferred Network: %@", v2, v3, v4, v5, v6);
}

void sub_10003CE44()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003CEC0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Networks in Database for deletion ", v2, v3, v4, v5, v6);
}

void sub_10003CF3C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003CFB8(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed deleting thread credentials for delete preferred network : %@", v5, v6, v7, v8, 2u);
}

void sub_10003D068(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s : %d - Preferred Networks in Database for deletion = %lu", v3, v4, v5, v6, 2u);
}

void sub_10003D0F4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003D170()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003D1EC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting All preferred network entries", v2, v3, v4, v5, v6);
}

void sub_10003D268()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch frozen thread networks", v2, v3, v4, v5, v6);
}

void sub_10003D2E4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting All frozen thread network entries", v2, v3, v4, v5, v6);
}

void sub_10003D360()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting all records for Apple team ID - 0000000000 Failed", v2, v3, v4, v5, v6);
}

void sub_10003D3DC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Frozen Networks in the Database for deletion ", v2, v3, v4, v5, v6);
}

void sub_10003D458()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Networks in Database for deletion ", v2, v3, v4, v5, v6);
}

void sub_10003D4D4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Could not fetched Active dataset record", v2, v3, v4, v5, v6);
}

void sub_10003D550()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch records", v2, v3, v4, v5, v6);
}

void sub_10003D5CC()
{
  sub_10000A0C4();
  sub_10003B44C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
}

void sub_10003D664()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete records", v2, v3, v4, v5, v6);
}

void sub_10003D6E0()
{
  sub_10000A0C4();
  sub_10003B3BC();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s:%d: Deleting all records for com.apple.thread.dataset, Deletion result :(err=%d)", v2, v3, v4, v5, 2u);
}

void sub_10003D75C(void *a1, void *a2, NSObject *a3)
{
  uint64_t v17 = [a1 network];
  uint64_t v5 = [v17 networkName];
  int v16 = [a1 network];
  uint8_t v6 = [v16 extendedPANID];
  uint64_t v7 = [a1 borderAgent];
  uint64_t v8 = [v7 discriminatorId];
  uint64_t v9 = [a2 network];
  uint64_t v10 = [v9 networkName];
  id v11 = [a2 network];
  id v12 = [v11 extendedPANID];
  id v13 = [a2 borderAgent];
  uint64_t v14 = [v13 discriminatorId];
  *(_DWORD *)buf = 136316930;
  id v19 = "-[THThreadNetworkCredentialsKeychainBackingStore checkIfActiveDatasetRecordIsPresentInTheGivenList:Missinglist:record:]";
  __int16 v20 = 1024;
  int v21 = 2463;
  __int16 v22 = 2112;
  id v23 = v5;
  __int16 v24 = 2112;
  id v25 = v6;
  __int16 v26 = 2112;
  int v27 = v8;
  __int16 v28 = 2112;
  int v29 = v10;
  __int16 v30 = 2112;
  int v31 = v12;
  __int16 v32 = 2112;
  __int16 v33 = v14;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s:%d: record (name : %@ | xpanid : %@ | baID : %@) is matching with listItem record (name : %@ | xpanid : %@ | baID : %@)", buf, 0x4Eu);
}

void sub_10003D934()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "\t-----------------\n", v2, v3, v4, v5, v6);
}

void sub_10003D968(void *a1)
{
  uint64_t v1 = [a1 lastModificationDate];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v2, v3, "\t\t  - Last modified on: \t%@\n", v4, v5, v6, v7, v8);
}

void sub_10003D9EC(void *a1)
{
  uint64_t v1 = [a1 creationDate];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v2, v3, "\t\t  - Created on: \t%@\n", v4, v5, v6, v7, v8);
}

void sub_10003DA70(void *a1)
{
  uint64_t v1 = [a1 keychainAccessGroup];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v2, v3, "\t\t  - Access Group: \t%@\n", v4, v5, v6, v7, v8);
}

void sub_10003DAF4(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 userInfo];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - User Info: \t%@\n", v5, v6, v7, v8, v9);
}

void sub_10003DB90(void *a1)
{
  uint64_t v1 = [a1 credentialsDataSet];
  uint64_t v2 = [v1 dataSetArray];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - DataSet Credentials: %@\n", v5, v6, v7, v8, v9);
}

void sub_10003DC2C(void *a1)
{
  uint64_t v1 = [a1 credentials];
  [v1 channel];
  sub_10003B474((void *)&_mh_execute_header, v2, v3, "\t\t  - Network Channel: \t%u\n", v4, v5, v6, v7, 0);
}

void sub_10003DCB8(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 passPhrase];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - Passphrase: \t%@\n", v5, v6, v7, v8, v9);
}

void sub_10003DD54(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 PSKc];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - PSKc: \t\t%@\n", v5, v6, v7, v8, v9);
}

void sub_10003DDF0(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 masterKey];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - Master Key: \t%@\n", v5, v6, v7, v8, v9);
}

void sub_10003DE8C(void *a1)
{
  uint64_t v1 = [a1 credentials];
  uint64_t v2 = [v1 PANID];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - Network PANID: \t%@\n", v5, v6, v7, v8, v9);
}

void sub_10003DF28(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 extendedPANID];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - Network XPANID: \t%@\n", v5, v6, v7, v8, v9);
}

void sub_10003DFC4(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - Network Name: \t%@\n", v5, v6, v7, v8, v9);
}

void sub_10003E060(void *a1)
{
  uint64_t v1 = [a1 borderAgent];
  uint64_t v2 = [v1 discriminatorId];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - Border Agent Discriminator ID : %@\n", v5, v6, v7, v8, v9);
}

void sub_10003E0FC(void *a1)
{
  uint64_t v1 = [a1 uniqueIdentifier];
  id v2 = [v1 UUIDString];
  [v2 UTF8String];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "\t\t  - UUID: \t\t%s\n", v5, v6, v7, v8, v9);
}

void sub_10003E1A0()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "\t==== Credentials ====\n", v2, v3, v4, v5, v6);
}

void sub_10003E1D4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete all com.apple.thread.network records", v2, v3, v4, v5, v6);
}

void sub_10003E250(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s:%d: After BA record cleanup, BA records count in DB: %lu ", v3, v4, v5, v6, 2u);
}

void sub_10003E2DC(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s:%d: After BA record cleanup, Missing BA records count in DB: %lu ", v3, v4, v5, v6, 2u);
}

void sub_10003E368()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed deleting all records for com.apple.thread.dataset Failed", v2, v3, v4, v5, v6);
}

void sub_10003E3E4(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s:%d: Before BA record cleanup, BA records count in DB: %lu ", v3, v4, v5, v6, 2u);
}

void sub_10003E470()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Network in the Database ", v2, v3, v4, v5, v6);
}

void sub_10003E4EC(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s:%d: deleting items from cleanUpPreferredList,  size of cleanUpPreferredList : %lu ", v3, v4, v5, v6, 2u);
}

void sub_10003E578(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s:%d: updating records from toBeUpdatedPreferredList,  size of toBeUpdatedPreferredList : %lu ", v3, v4, v5, v6, 2u);
}

void sub_10003E604(void *a1, void *a2)
{
  [a1 count];
  [a2 count];
  sub_10000A0C4();
  sub_10003B43C();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x26u);
}

void sub_10003E6C4()
{
  sub_10000A0C4();
  sub_10003B3BC();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to delete all records for com.apple.thread.network, Deletion result :(err=%d)", v2, v3, v4, v5, 2u);
}

void sub_10003E740()
{
  sub_10000A0C4();
  sub_10003B3BC();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s:%d: Deleting all records for com.apple.thread.network, Deletion result :(err=%d)", v2, v3, v4, v5, 2u);
}

void sub_10003E7BC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Request to Clean the Thread keychain database", v2, v3, v4, v5, v6);
}

void sub_10003E838()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003E8B4(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d: No Preferred Networks for Network Name : %@ ", v5, v6, v7, v8, 2u);
}

void sub_10003E964()
{
  v2[0] = 136315650;
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B330((void *)&_mh_execute_header, v0, v1, "%s : %d :  Found networks : %lu", (uint8_t *)v2);
}

void sub_10003E9E4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Finding Thread network Broder Routers around", v2, v3, v4, v5, v6);
}

void sub_10003EA60(void *a1, void *a2)
{
  uint64_t v3 = [a1 networkName];
  uint8_t v9 = [a2 networkName];
  sub_10003B43C();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

void sub_10003EB2C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d : Current device WiFi info is empty and Preferred Network WiFi info is available, no need to update !", v2, v3, v4, v5, v6);
}

void sub_10003EBA8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d : Preferred Network WiFi info is empty, updating it !", v2, v3, v4, v5, v6);
}

void sub_10003EC24()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to convert Set to Array", v2, v3, v4, v5, v6);
}

void sub_10003ECA0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

void sub_10003ED1C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to dispatch scan", v2, v3, v4, v5, v6);
}

void sub_10003ED98()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, semaphore wait timed out ", v2, v3, v4, v5, v6);
}

void sub_10003EE14()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error, Failed to start the dispatch scan", v2, v3, v4, v5, v6);
}

void sub_10003EE90()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003EF0C(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed deleting thread credentials for preferred network : %@", v5, v6, v7, v8, 2u);
}

void sub_10003EFBC(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "Failed deleting Preferred Network %@", v5, v6, v7, v8, v9);
}

void sub_10003F058()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003F0D4(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s : %d: Failed deleting Preferred Network %@", v5, v6, v7, v8, 2u);
}

void sub_10003F184()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

void sub_10003F200()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: network signature is nil... ", v2, v3, v4, v5, v6);
}

void sub_10003F27C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Preferred Network is empty ", v2, v3, v4, v5, v6);
}

void sub_10003F2F8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Preferred Network records empty ", v2, v3, v4, v5, v6);
}

void sub_10003F374()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Not dumping more than ten Preferred Network records  ", v2, v3, v4, v5, v6);
}

void sub_10003F3F0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Preferred Network records empty ", v2, v3, v4, v5, v6);
}

void sub_10003F46C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Not dumping more than ten Preferred Network records  ", v2, v3, v4, v5, v6);
}

void sub_10003F4E8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Not dumping more than ten Frozen Thread Network records  ", v2, v3, v4, v5, v6);
}

void sub_10003F564()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to convert Set to Array", v2, v3, v4, v5, v6);
}

void sub_10003F5E0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete frozen preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003F65C(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s : %d - Matching Networks in Database with mDNS Browse, number of records to match are :  %lu", v3, v4, v5, v6, 2u);
}

void sub_10003F6E8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks for a given Label as ssid", v2, v3, v4, v5, v6);
}

void sub_10003F764()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks for a given network signature", v2, v3, v4, v5, v6);
}

void sub_10003F7E0(void *a1)
{
  uint64_t v1 = [a1 wifiSSID];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v2, v3, "%s:%d: Failed to create query to fetch preferred networks for a given ssid : %@", v4, v5, v6, v7, 2u);
}

void sub_10003F878()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks for a given network signature", v2, v3, v4, v5, v6);
}

void sub_10003F8F4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003F970()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Network in the Database ", v2, v3, v4, v5, v6);
}

void sub_10003F9EC(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s : %d - Total Preferred Networks in the Database = %lu", v3, v4, v5, v6, 2u);
}

void sub_10003FA78()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void sub_10003FAF4()
{
  sub_10000A0C4();
  sub_10003B3BC();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Network in the Database for count : %d", v2, v3, v4, v5, 2u);
}

void sub_10003FB70(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B43C();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x22u);
}

void sub_10003FC1C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Could not get Network Signature", v2, v3, v4, v5, v6);
}

void sub_10003FC98(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s : %d - Matching Networks in Database for Network = %lu", v3, v4, v5, v6, 2u);
}

void sub_10003FD24()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Could not get Network Signature", v2, v3, v4, v5, v6);
}

void sub_10003FDA0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Could not find preferred network for SSID or signature", v2, v3, v4, v5, v6);
}

void sub_10003FE1C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred Network in the Database ", v2, v3, v4, v5, v6);
}

void sub_10003FE98(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s : %d - Total Preferred Networks in the Database = %lu", v3, v4, v5, v6, 2u);
}

void sub_10003FF24()
{
  sub_10003B45C();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10003B468() network];
  uint64_t v4 = [v3 extendedPANID];
  sub_10000A0C4();
  sub_10003B37C();
  sub_10003B3CC((void *)&_mh_execute_header, v5, v6, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) keychainAddDict is NULL", v7, v8, v9, v10, 2u);
}

void sub_10003FFFC()
{
  sub_10003B42C();
  uint64_t v2 = [v1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [v0 network];
  uint64_t v5 = [v4 extendedPANID];
  sub_10000A0C4();
  sub_10003B398();
  sub_10003B40C((void *)&_mh_execute_header, v6, v7, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) with error = %d", v8, v9, v10, v11, 2u);
}

void sub_1000400D8()
{
  sub_10003B45C();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10003B468() network];
  uint64_t v4 = [v3 extendedPANID];
  sub_10000A0C4();
  sub_10003B37C();
  sub_10003B3CC((void *)&_mh_execute_header, v5, v6, "%s:%d:Failed to store Preferred Network (networkName=%@, xpanid=%@) keychainAddDict is NULL", v7, v8, v9, v10, 2u);
}

void sub_1000401B0()
{
  sub_10003B42C();
  uint64_t v2 = [v1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [v0 network];
  uint64_t v5 = [v4 extendedPANID];
  sub_10000A0C4();
  sub_10003B398();
  sub_10003B40C((void *)&_mh_execute_header, v6, v7, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) with error = %d", v8, v9, v10, v11, 2u);
}

void sub_10004028C(void *a1)
{
  id v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d: Preferred network (name : %@) already exists. Updating the existing entry", v5, v6, v7, v8, 2u);
}

void sub_10004033C()
{
  sub_10003B45C();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10003B468() network];
  uint64_t v4 = [v3 extendedPANID];
  sub_10000A0C4();
  sub_10003B37C();
  sub_10003B3CC((void *)&_mh_execute_header, v5, v6, "%s:%d:Failed to store Preferred Network (networkName=%@, xpanid=%@) keychainAddDict is NULL", v7, v8, v9, v10, 2u);
}

void sub_100040414()
{
  sub_10003B42C();
  uint64_t v2 = [v1 network];
  uint64_t v3 = [v2 networkName];
  uint64_t v4 = [v0 network];
  uint64_t v5 = [v4 extendedPANID];
  sub_10000A0C4();
  sub_10003B398();
  sub_10003B40C((void *)&_mh_execute_header, v6, v7, "%s:%d:#mOS:Failed to store Preferred Network (networkName=%@, xpanid=%@) with error = %d", v8, v9, v10, v11, 2u);
}

void sub_1000404F0()
{
  sub_10000A0C4();
  sub_10003B3BC();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s:%d SecItemUpdate returned error while updating preferred network entry err=%d", v2, v3, v4, v5, 2u);
}

void sub_10004056C(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d: Preferred network (name : %@) already exists. Updating the existing entry", v5, v6, v7, v8, 2u);
}

void sub_10004061C(void *a1)
{
  uint64_t v1 = [a1 credentialsDataSet];
  uint64_t v2 = [v1 dataSetArray];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d:Failed to store frozen thread network %@", v5, v6, v7, v8, 2u);
}

void sub_1000406CC(void *a1)
{
  uint64_t v1 = [a1 credentialsDataSet];
  uint64_t v2 = [v1 dataSetArray];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d:Failed to store frozen thread network to keychain : %@", v5, v6, v7, v8, 2u);
}

void sub_10004077C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: frozen thread network credential already exists.", v2, v3, v4, v5, v6);
}

void sub_1000407F8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Error : ipv4 and ipv6 network signatures are invalid", v2, v3, v4, v5, v6);
}

void sub_100040874()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Error : Device is **not** on ethernet, **not** on WiFi, returning nil", v2, v3, v4, v5, v6);
}

void sub_1000408F0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to fetch preferred networks", v2, v3, v4, v5, v6);
}

void sub_10004096C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Unable to convert Set to Array", v2, v3, v4, v5, v6);
}

void sub_1000409E8(void *a1)
{
  [a1 count];
  sub_10000A0C4();
  sub_10003B310();
  sub_10003B2A0((void *)&_mh_execute_header, v1, v2, "%s : %d - Preferred Networks in Database = %lu", v3, v4, v5, v6, 2u);
}

void sub_100040A74()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: No Preferred network exist", v2, v3, v4, v5, v6);
}

void sub_100040AF0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create query to delete preferred networks", v2, v3, v4, v5, v6);
}

void sub_100040B6C(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10003B324();
  sub_10003B2DC((void *)&_mh_execute_header, v3, v4, "Failed deleting Preferred Network entry : %@", v5, v6, v7, v8, v9);
}

void sub_100040C08()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

void sub_100040C84()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

void sub_100040D00()
{
  sub_10003B45C();
  uint64_t v2 = [v1 network];
  [v2 networkName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10003B468() network];
  uint64_t v4 = [v3 extendedPANID];
  sub_10000A0C4();
  sub_10003B37C();
  sub_10003B3CC((void *)&_mh_execute_header, v5, v6, "%s:%d: Failed to delete the previous preferred network entry : (name : %@ | xpanid : %@)", v7, v8, v9, v10, 2u);
}

void sub_100040DD8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

void sub_100040E54()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Record parameter is invalid ", v2, v3, v4, v5, v6);
}

void sub_100040ED0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

void sub_100040F4C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

void sub_100040FC8(void *a1, void *a2, NSObject *a3)
{
  uint8_t v6 = [a1 network];
  uint64_t v7 = [v6 networkName];
  uint64_t v8 = [a1 network];
  uint64_t v9 = [v8 extendedPANID];
  uint64_t v10 = [a2 network];
  uint64_t v11 = [v10 networkName];
  id v12 = [a2 network];
  id v13 = [v12 extendedPANID];
  *(_DWORD *)CFDictionaryRef v15 = 136316418;
  sub_10000A0C4();
  *(_DWORD *)&v15[7] = 4706;
  v15[9] = 2112;
  int v16 = v7;
  __int16 v17 = 2112;
  __int16 v18 = v9;
  __int16 v19 = 2112;
  __int16 v20 = v11;
  __int16 v21 = 2112;
  uint64_t v22 = v14;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s:%d:Preferred network entry (name : %@, xpanid : %@), record netowrk (name : %@, xpanid : %@) and datasets are matching. No need to update", (uint8_t *)v15, 0x3Au);
}

void sub_100041138()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

void sub_1000411B4(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed to delete the previous record : (name : %@)", v5, v6, v7, v8, 2u);
}

void sub_100041264(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 networkName];
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B2A0((void *)&_mh_execute_header, v3, v4, "%s:%d: Failed to delete the previous preferred network entry : (name : %@)", v5, v6, v7, v8, 2u);
}

void sub_100041314()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to create instance of updated preferred network ", v2, v3, v4, v5, v6);
}

void sub_100041390()
{
  v2[0] = 136315650;
  sub_10000A0C4();
  sub_10003B2FC();
  sub_10003B330((void *)&_mh_execute_header, v0, v1, "%s:%d Failed deleting thread credentials: %@", (uint8_t *)v2);
}

void sub_100041410()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d:Failed to update record to preferred network entry.", v2, v3, v4, v5, v6);
}

void sub_10004148C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d:record parameter is passed nil, returning", v2, v3, v4, v5, v6);
}

void sub_100041508()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "#MOS creds could not be parsed", v2, v3, v4, v5, v6);
}

void sub_10004153C()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "#MOS network could not be parsed", v2, v3, v4, v5, v6);
}

void sub_100041570()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "#MOS credDataset could not be allocated", v2, v3, v4, v5, v6);
}

void sub_1000415A4()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "#MOS borderAgent could not be allocated", v2, v3, v4, v5, v6);
}

void sub_1000415D8()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "#MOS Credentials record could not be parsed", v2, v3, v4, v5, v6);
}

void sub_10004160C()
{
  sub_10003B324();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, v6);
}

void sub_100041684()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Parsed dataset tlvs successfully", v2, v3, v4, v5, v6);
}

void sub_100041700()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Can not parse dataset tlvs", v2, v3, v4, v5, v6);
}

void sub_10004177C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Not a dataset tlv", v2, v3, v4, v5, v6);
}

void sub_1000417F8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

void sub_100041874()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded Channel mask, mask entry format is invalid, Line : %d", v2, v3, v4, v5, v6);
}

void sub_1000418F0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded entry length is not matching,  Line : %d", v2, v3, v4, v5, v6);
}

void sub_10004196C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded Channel page is neither zero nor 2,  Line : %d", v2, v3, v4, v5, v6);
}

void sub_1000419E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041A60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041AE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041B64()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded channel Len : %d", v2, v3, v4, v5, v6);
}

void sub_100041BE0()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100041C5C()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid extended pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100041CD8()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pskc length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100041D54()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid network key length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100041DD0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid rotation time, Line : %d", v2, v3, v4, v5, v6);
}

void sub_100041E4C()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Security Policy length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100041EC8()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Mesh local prefix length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100041F44()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

void sub_100041FC0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Dataset is invalid", v2, v3, v4, v5, v6);
}

void sub_10004203C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Device is on Ethernet", v2, v3, v4, v5, v6);
}

void sub_1000420B8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d Generation Error : Device is **not** on ethernet and **not** on WiFi", v2, v3, v4, v5, v6);
}

void sub_100042134()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "Failed to generated new Network Key, unexpected error.. asserting.. ", v2, v3, v4, v5, v6);
}

void sub_100042168()
{
  sub_10003B324();
  sub_10003B44C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void sub_100043590(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 network];
  uint64_t v5 = [v4 networkName];
  uint8_t v6 = [a1 network];
  uint64_t v7 = [v6 extendedPANID];
  uint64_t v8 = [a1 keychainAccessGroup];
  int v9 = 138412802;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to calculate UUID (name=%@; xpanid=%@; keychainAccessGroup=%@)!",
    (uint8_t *)&v9,
    0x20u);
}

void sub_100043698()
{
  sub_100014150();
  int v2 = 144;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d:Failed to decode Keychain item (unable to form THThreadNetwork)!", v1, 0x12u);
}

void sub_100043720(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 uniqueIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Warning: decoded record with identifier %@ but does not match expected %@!", (uint8_t *)&v6, 0x16u);
}

void sub_1000437D0()
{
  sub_100014150();
  int v2 = 134;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d: Failed to decode Keychain item (credentials could not be deserialized)! Using empty credential template.", v1, 0x12u);
}

void sub_100043858(void *a1, uint64_t a2, NSObject *a3)
{
  int v6 = [a1 network];
  uint64_t v7 = [v6 networkName];
  __int16 v8 = [a1 network];
  uint64_t v9 = [v8 extendedPANID];
  int v10 = 138412802;
  __int16 v11 = v7;
  __int16 v12 = 2112;
  __int16 v13 = v9;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Illegal attempt to form keychain item with insufficient information (name=%@; xpanid=%@; uuid=%@)!",
    (uint8_t *)&v10,
    0x20u);
}

void sub_1000467C8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decode THThreadNetwork!", v1, 2u);
}

void sub_10004680C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decode THNetworkSignature!", v1, 2u);
}

void sub_100046850()
{
  sub_10000A0C4();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d : credentials dataset record is empty in preferred network entry.", v2, v3, v4, v5, 2u);
}

void sub_1000468D0()
{
  v1[0] = 136315650;
  sub_10000A0C4();
  sub_10003B2FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %d : wifiPwd is empty inside the preferred network entry for network name : %@.", (uint8_t *)v1, 0x1Cu);
}

void sub_100046958()
{
  v1[0] = 136315650;
  sub_10000A0C4();
  sub_10003B2FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %d : wifissid is empty inside the preferred network entry for network name : %@.", (uint8_t *)v1, 0x1Cu);
}

void sub_1000469E0()
{
  sub_10000A0C4();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : %d : Unable to decode name or xpanid or network signature", v2, v3, v4, v5, 2u);
}

void sub_100046A60(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[THPreferredThreadNetwork(Keychain) DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Error: unable to form add operation due to missing data", (uint8_t *)&v1, 0xCu);
}

void sub_100046AE4()
{
  sub_10000A0C4();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : %d : Can not form preferred netowk keychain item with insufficient information ", v2, v3, v4, v5, 2u);
}

void sub_100046B64(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[THPreferredThreadNetwork(Keychain) keyChainItemRepresentationForpreferredNetworkAddOperation]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : Error: unable to form add operation due to missing data", (uint8_t *)&v1, 0xCu);
}

void sub_100046BE8()
{
  sub_10000A0C4();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : %d : Can not form preferred netowk keychain item with insufficient information ", v2, v3, v4, v5, 2u);
}

void sub_100046D60(uint64_t a1)
{
  uint64_t v5 = (id *)*(id *)(a1 + 32);
  uint64_t v2 = objc_opt_new();
  id v3 = v5[1];
  v5[1] = (id)v2;

  id v4 = v5[1];
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 32)];
    [v5[1] start];
  }
}

void sub_100046F30(uint64_t a1)
{
  uint64_t v5 = (id *)*(id *)(a1 + 32);
  uint64_t v2 = objc_opt_new();
  id v3 = v5[1];
  v5[1] = (id)v2;

  id v4 = v5[1];
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 32)];
    [v5[1] start];
  }
}

void sub_100047084(uint64_t a1)
{
  uint64_t v5 = (id *)*(id *)(a1 + 32);
  uint64_t v2 = objc_opt_new();
  id v3 = v5[1];
  v5[1] = (id)v2;

  id v4 = v5[1];
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 32)];
    [v5[1] start];
  }
}

void sub_10004718C(uint64_t a1)
{
  uint64_t v1 = *(id *)(a1 + 32);
  uint64_t v2 = (void *)v1[1];
  int v6 = v1;
  if (v2)
  {
    v1[1] = 0;

    uint64_t v1 = v6;
  }
  id v3 = (void *)v1[8];
  if (v3)
  {
    v1[8] = 0;

    uint64_t v1 = v6;
  }
  id v4 = (void *)v1[5];
  if (v4)
  {
    v1[5] = 0;

    uint64_t v1 = v6;
  }
  uint64_t v5 = (void *)v1[6];
  if (v5)
  {
    v1[6] = 0;

    uint64_t v1 = v6;
  }
}

void sub_1000487C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_1000487F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_10004882C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100048838()
{
  v1[0] = 136315394;
  sub_10003B3F8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s : No IP address is available for the server : %@, continue to next BR", (uint8_t *)v1, 0x16u);
}

void sub_1000488B8()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d No text record data available for the server : %@, continue to next network, retry flag is on!", v2, v3, v4, v5, 2u);
}

void sub_100048934()
{
  *(_DWORD *)uint64_t v3 = 136315650;
  sub_1000487E0();
  *(_DWORD *)&v3[7] = 236;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s : %d: state bit map indicates thread n/w is DOWN :0x%x", (uint8_t *)v3, 0x18u);
}

void sub_1000489C8()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d network name nsstring conversion failure for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

void sub_100048A44(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 extendedPANID];
  sub_10000A0C4();
  sub_100048810();
  sub_1000487F0((void *)&_mh_execute_header, v3, v4, "%s : %d: Old format Xpanid to find :%@ does match with mdns record xpanid :%@", v5, v6, v7, v8, 2u);
}

void sub_100048AF8(void *a1)
{
  uint64_t v1 = [a1 network];
  uint64_t v2 = [v1 extendedPANID];
  sub_10000A0C4();
  sub_100048810();
  sub_1000487F0((void *)&_mh_execute_header, v3, v4, "%s : %d: New format Xpanid to find :%@ does match with mdns record xpanid :%@", v5, v6, v7, v8, 2u);
}

void sub_100048BAC(void *a1, NSObject *a2)
{
  [a1 length];
  *(_DWORD *)uint64_t v4 = 136315650;
  sub_10000A0C4();
  *(_DWORD *)&v4[7] = 255;
  v4[9] = 2048;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:%d Continuing... XpanID length mismatch !!! xpan id length : %lu", (uint8_t *)v4, 0x1Cu);
}

void sub_100048C54()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d can not parse dictionary data for server : %@", v2, v3, v4, v5, 2u);
}

void sub_100048CD0()
{
  v1[0] = 136315394;
  sub_10003B3F8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s : No IP address is available for the server : %@, continue to next BR", (uint8_t *)v1, 0x16u);
}

void sub_100048D50()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d No text record data available for the server : %@, continue to next network, retry flag is on!", v2, v3, v4, v5, 2u);
}

void sub_100048DCC()
{
  *(_DWORD *)uint64_t v3 = 136315650;
  sub_1000487E0();
  *(_DWORD *)&v3[7] = 446;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s : %d: state bit map indicates thread n/w is DOWN :0x%x", (uint8_t *)v3, 0x18u);
}

void sub_100048E60()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d xpanid and baid nsstring conversion failure, server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

void sub_100048EDC()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d hex string conversion to nsdata failure for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

void sub_100048F58()
{
  sub_10004882C(__stack_chk_guard);
  int v2 = 136315906;
  sub_1000487E0();
  sub_1000487A8();
  sub_1000088DC((void *)&_mh_execute_header, v0, v1, "%s : %d: BaID to find :%@ does not match with mdns record BaID :%@", v2);
}

void sub_100048FD4()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d xpanid nsstring conversion failure, server : %@", v2, v3, v4, v5, 2u);
}

void sub_100049050()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d hex string conversion to nsdata failure for server : %@", v2, v3, v4, v5, 2u);
}

void sub_1000490CC()
{
  sub_10004882C(__stack_chk_guard);
  int v2 = 136315906;
  sub_1000487E0();
  sub_1000487A8();
  sub_1000088DC((void *)&_mh_execute_header, v0, v1, "%s : %d: Xpanid to find :%@ does not match with mdns record xpanid :%@", v2);
}

void sub_100049148()
{
  sub_10004882C(__stack_chk_guard);
  int v2 = 136315906;
  sub_1000487E0();
  sub_1000487A8();
  sub_1000088DC((void *)&_mh_execute_header, v0, v1, "%s : %d: BaID to find :%@ does not match with mdns record BaID :%@", v2);
}

void sub_1000491C4()
{
  sub_10004882C(__stack_chk_guard);
  int v2 = 136315906;
  sub_1000487E0();
  sub_1000487A8();
  sub_1000088DC((void *)&_mh_execute_header, v0, v1, "%s : %d: Xpanid to find :%@ does not match with mdns record xpanid :%@", v2);
}

void sub_100049240()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d network name nsstring conversion failure for server : %@, continue to next network", v2, v3, v4, v5, 2u);
}

void sub_1000492BC()
{
  sub_10004882C(__stack_chk_guard);
  int v2 = 136315906;
  sub_1000487E0();
  sub_1000487A8();
  sub_1000088DC((void *)&_mh_execute_header, v0, v1, "%s : %d: Network to find :%@ does not match with mdns record :%@", v2);
}

void sub_100049338(void *a1, void *a2)
{
  [a1 length];
  [a2 length];
  sub_10000A0C4();
  sub_1000487F0((void *)&_mh_execute_header, v3, v4, "%s:%d Continuing... BorderAgent ID and XpanID length mismatch !!! xpan id length : %lu, border agent id length : %lu", v5, v6, v7, v8, 2u);
}

void sub_1000493F0()
{
  sub_10000A0C4();
  sub_10003B2FC();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s : %d can not parse dictionary data for server : %@", v2, v3, v4, v5, 2u);
}

void sub_100049654(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000496C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004981C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100049890(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  sub_10004990C(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10004990C(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v1 count]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    id v9 = [v3 copy];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_100049B8C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve all records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100049C00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  sub_10004990C(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100049DC4(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100049E38(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100049FC0(uint64_t a1)
{
  id v2 = +[NSError storeError:4 description:@"Failed to delete record; unable to calculate UUID"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004A1F8(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004A26C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004A3C4(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004A434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004A58C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004A5FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004A754(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004A7C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  sub_10004990C(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004A970(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve all records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004A9E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  sub_10004990C(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004ABA8(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004AC1C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004AD60(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004AF24(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004AF98(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B14C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B1C0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B374(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B3E8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B59C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B610(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B7D8(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B84C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  sub_10004990C(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BA24(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BA98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  sub_10004990C(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004BC9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004BCB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BE6C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BEE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    uint64_t v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000525A4();
    }
  }
}

void sub_10004C118(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C18C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    uint64_t v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10005269C();
    }
  }
}

void sub_10004C3C4(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C438(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    uint64_t v8 = sub_10001CCA0(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100052794();
    }
  }
}

void sub_10004C670(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C6E4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C8F8(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004C96C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004CB94(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004CC04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004CD8C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004CDFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004CF54(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004CFC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004D100(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve records; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004D170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004D2AC(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete all records locally; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004D31C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004D474(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004D4E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004D798(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004D80C(uint64_t a1)
{
  id v2 = +[NSError storeError:29 description:@"Failed to store record; Invalid Dataset"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004D880(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004DB28(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004DBA0(uint64_t a1)
{
  id v2 = +[NSError storeError:29 description:@"Failed to store record; Invalid Dataset"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004DC18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004DE0C(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004DE80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004DFEC(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E060(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E228(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to retrieve record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E29C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E464(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004E4D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E640(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to delete active dataset record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004E6B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E8D4(uint64_t a1)
{
  id v2 = +[NSError storeError:18 description:@"Failed to run mdns check; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E94C(uint64_t a1)
{
  id v2 = +[NSError storeError:18 description:@"Failed to run mdns check; Unable to parse the Active Operational Data Set"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E9C4(uint64_t a1, int a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a3;
    id v7 = [v4 network];
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  }
  else
  {
    id v6 = *(void (**)(uint64_t, void, void))(v3 + 16);
    id v7 = a3;
    v6(v3, 0, 0);
  }
}

uint64_t sub_10004EC8C(uint64_t a1)
{
  id v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000529B8();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004ECEC(uint64_t a1)
{
  id v2 = sub_10001CCA0(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100052A34();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004ED4C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (a3) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 credentialsDataSet];
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [v6 credentialsDataSet];
  uint64_t v10 = [v9 dataSetArray];

  if (!v10) {
    goto LABEL_9;
  }
  long long v11 = *(void **)(a1 + 32);
  long long v12 = [v6 credentialsDataSet];
  long long v13 = [v12 dataSetArray];
  LODWORD(v11) = [v11 isEqualToData:v13];

  if (v11)
  {
    long long v14 = sub_10001CCA0(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      __int16 v18 = "-[THThreadNetworkCredentialsStoreLocalClient checkIsPreferredNetworkForActiveOperationalDataset:completion:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 879;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s : %d: Given dataset matches with Preferred Network", (uint8_t *)&v17, 0x12u);
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
LABEL_9:
    int v16 = sub_10001CCA0(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100052AB0();
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v15();
}

uint64_t sub_10004EFC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004F104(uint64_t a1)
{
  id v2 = +[NSError storeError:1 description:@"Failed to store record; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004F174(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004F2CC(uint64_t a1)
{
  id v2 = +[NSError storeError:18 description:@"Failed to run mdns check; Backing store is nil"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10004F340(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005244C(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_1000524AC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void sub_100052528()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void sub_1000525A4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Completion handler is nil, avoiding completion call", v2, v3, v4, v5, v6);
}

void sub_100052620()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void sub_10005269C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Completion handler is nil, avoiding completion call", v2, v3, v4, v5, v6);
}

void sub_100052718()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void sub_100052794()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Completion handler is nil, avoiding completion call", v2, v3, v4, v5, v6);
}

void sub_100052810()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void sub_10005288C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void sub_100052908()
{
  sub_10003B3EC();
  sub_100014180((void *)&_mh_execute_header, v0, v1, "creds are NULL #MOS !!", v2, v3, v4, v5, v6);
}

void sub_10005293C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Feature is unsupported", v2, v3, v4, v5, v6);
}

void sub_1000529B8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Invalid parameter passed", v2, v3, v4, v5, v6);
}

void sub_100052A34()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Backing store is nil", v2, v3, v4, v5, v6);
}

void sub_100052AB0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : %d: Given dataset does not match with Preferred Network", v2, v3, v4, v5, v6);
}

void sub_100052B2C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS creds NILL : Line : %d", v2, v3, v4, v5, v6);
}

void sub_100052BA8()
{
  sub_100052440();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

void sub_100052C20(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1055;
  sub_10005244C((void *)&_mh_execute_header, (int)a2, a3, "#MOS : break !! : %d", a1);
}

void sub_100052C60(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 999;
  sub_10005244C((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded master key Line : %d", a1);
}

void sub_100052CA0(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1018;
  sub_10005244C((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded pan id Line : %d", a1);
}

void sub_100052CE0(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1038;
  sub_10005244C((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded channel Line : %d", a1);
}

void sub_100052D20(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1048;
  sub_10005244C((void *)&_mh_execute_header, (int)a2, a3, "#MOS : ==> Decoded pskc Line : %d", a1);
}

void sub_100052D60()
{
  sub_100052440();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "#MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

void sub_100052DD8(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 950;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#MOS : data_len : %d, Line : %d", (uint8_t *)v2, 0xEu);
}

void sub_100052E60()
{
  sub_100052440();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

void sub_100052ED8(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 1232;
  sub_10005244C((void *)&_mh_execute_header, (int)a2, a3, "#MOS : break !! : %d", a1);
}

void sub_100052F18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100052F90()
{
  sub_100052468();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s: #MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

void sub_10005300C()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : data_len : %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100053088()
{
  sub_100052440();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

void sub_100053100()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Failed to parse dataset tlvs", v2, v3, v4, v5, v6);
}

void sub_10005317C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

void sub_1000531F8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded Channel mask, mask entry format is invalid, Line : %d", v2, v3, v4, v5, v6);
}

void sub_100053274()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded entry length is not matching,  Line : %d", v2, v3, v4, v5, v6);
}

void sub_1000532F0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded Channel page is neither zero nor 2,  Line : %d", v2, v3, v4, v5, v6);
}

void sub_10005336C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000533E4()
{
  sub_100052498();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel is not in the range : %d", v2, v3, v4, v5, 2u);
}

void sub_100053458()
{
  sub_100052484();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel Page is not Zero : %d", v2, v3, v4, v5, 2u);
}

void sub_1000534D0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded channel Len : %d", v2, v3, v4, v5, v6);
}

void sub_10005354C()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_1000535C8()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid extended pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100053644()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pskc length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_1000536C0()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid network key length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_10005373C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid rotation time, Line : %d", v2, v3, v4, v5, v6);
}

void sub_1000537B8()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Security Policy length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100053834()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Mesh local prefix length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_1000538B0()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

void sub_10005392C()
{
  sub_100052468();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s: #MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

void sub_1000539A8()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : data_len : %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100053A24()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS creds NILL : Line : %d", v2, v3, v4, v5, v6);
}

void sub_100053AA0()
{
  sub_100052440();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "#MOS creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, 3u);
}

void sub_100053B18()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: %d: Failed to parse dataset tlvs", v2, v3, v4, v5, v6);
}

void sub_100053B94()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

void sub_100053C10()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded Channel mask, mask entry format is invalid, Line : %d", v2, v3, v4, v5, v6);
}

void sub_100053C8C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded entry length is not matching,  Line : %d", v2, v3, v4, v5, v6);
}

void sub_100053D08()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded Channel page is neither zero nor 2,  Line : %d", v2, v3, v4, v5, v6);
}

void sub_100053D84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053DFC()
{
  sub_100052498();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel is not in the range : %d", v2, v3, v4, v5, 2u);
}

void sub_100053E70()
{
  sub_100052484();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel Page is not Zero : %d", v2, v3, v4, v5, 2u);
}

void sub_100053EE8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded channel Len : %d", v2, v3, v4, v5, v6);
}

void sub_100053F64()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100053FE0()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid extended pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_10005405C()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pskc length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_1000540D8()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid network key length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_100054154()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid rotation time, Line : %d", v2, v3, v4, v5, v6);
}

void sub_1000541D0()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Security Policy length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_10005424C()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Mesh local prefix length %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_1000542C8()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

void sub_100054344()
{
  sub_100052468();
  sub_1000487C4((void *)&_mh_execute_header, v0, v1, "%s: #MOS : dump: %{sensitive}s, Line : %d", v2, v3, v4, v5, 3u);
}

void sub_1000543C0()
{
  sub_10003B364();
  sub_10003B348((void *)&_mh_execute_header, v0, v1, "%s: #MOS : data_len : %d, Line : %d", v2, v3, v4, v5, 2u);
}

void sub_10005443C()
{
  sub_1000088B0();
  sub_100008894((void *)&_mh_execute_header, v0, v1, "%s: [%s]:KEY_NOT_FOUND in Frameworks", v2, v3, v4, v5, 2u);
}

void sub_1000544C0()
{
  sub_1000088B0();
  sub_100008894((void *)&_mh_execute_header, v0, v1, "%s: [%s]:KEY_NOT_FOUND in Preferences", v2, v3, v4, v5, 2u);
}

void sub_100054544()
{
  *(_DWORD *)uint64_t v2 = 136315906;
  *(void *)&v2[4] = "getBoolValue_isAudioNoThreadFeatureEnabled";
  *(_WORD *)&v2[12] = 2080;
  *(void *)&v2[14] = "EnableAudioNoThreadFeature";
  sub_1000088C0();
  sub_1000088DC((void *)&_mh_execute_header, v0, v1, "%s: [%s]:Fallback to Frameworks, keyPresent = %s, int Value = %d", *(const char **)v2, *(const char **)&v2[8], *(const char **)&v2[16], v3);
}

void sub_1000545EC()
{
  sub_1000088B0();
  sub_100008894((void *)&_mh_execute_header, v0, v1, "%s: [%s]:KEY_NOT_FOUND in Preferences", v2, v3, v4, v5, 2u);
}

void sub_100054670()
{
  *(_DWORD *)uint64_t v2 = 136315906;
  *(void *)&v2[4] = "getBoolValue_isThreadAlwaysOnFeatureEnabled";
  *(_WORD *)&v2[12] = 2080;
  *(void *)&v2[14] = "EnableAudioNoThreadFeature";
  sub_1000088C0();
  sub_1000088DC((void *)&_mh_execute_header, v0, v1, "%s: [%s]:Fallback to Frameworks, keyPresent = %s, int Value = %d", *(const char **)v2, *(const char **)&v2[8], *(const char **)&v2[16], v3);
}

void sub_100054718()
{
  sub_1000088B0();
  sub_100008894((void *)&_mh_execute_header, v0, v1, "%s: [%s]:KEY_NOT_FOUND in Preferences", v2, v3, v4, v5, 2u);
}

void sub_10005479C()
{
  __assert_rtn("main", "CTCSService.m", 101, "m != nil");
}

void sub_1000547C8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to create tdm queue, unexpected scenario, asserting...", (uint8_t *)&v1, 0xCu);
}

void sub_10005484C()
{
  v1[0] = 136315394;
  sub_10000A0C4();
  *(_DWORD *)((char *)&v1[3] + 2) = 98;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d Failed to create self heal thread network timer , unexpected scenario, asserting...", (uint8_t *)v1, 0x12u);
}

void sub_1000548D8()
{
  v1[0] = 136315394;
  sub_10000A0C4();
  *(_DWORD *)((char *)&v1[3] + 2) = 128;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d: keychain store is nil", (uint8_t *)v1, 0x12u);
}

void sub_100054964(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[ThreadNetworkManagerSelfHealHandler cleanUpThreadKeychainEntries]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : keychain is nil, exit now", (uint8_t *)&v1, 0xCu);
}

void sub_1000549E8()
{
  *(_DWORD *)uint64_t v2 = 136315650;
  sub_10000A0C4();
  *(_DWORD *)&v2[7] = 161;
  v2[9] = 2112;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s:%d:  Failed to cleanup the keychain database, error = %@.", (uint8_t *)v2, 0x1Cu);
}

void sub_100054A7C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[CTCSXPCService listener:shouldAcceptNewConnection:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Server: %s - Connection interrupted", (uint8_t *)&v1, 0xCu);
}

void sub_100054B00(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[CTCSXPCService listener:shouldAcceptNewConnection:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Server: %s - XPC Connection invalidated", (uint8_t *)&v1, 0xCu);
}

void sub_100054B84()
{
  __assert_rtn("-[CTCSXPCService checkFF]", "CTCSXPCService.mm", 278, "utilsObj != nil");
}

void sub_100054BB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054BE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100054C20()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error: current connection is nil", v2, v3, v4, v5, v6);
}

void sub_100054C9C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error: team ID(keychain accessgroup) is nil", v2, v3, v4, v5, v6);
}

void sub_100054D18()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error: current connection is nil", v2, v3, v4, v5, v6);
}

void sub_100054D94()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error: Missing Private Entitlements", v2, v3, v4, v5, v6);
}

void sub_100054E10()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error: team ID(keychain accessgroup) is nil", v2, v3, v4, v5, v6);
}

void sub_100054E8C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Invalid appId", v2, v3, v4, v5, v6);
}

void sub_100054F08()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Internal installation", v2, v3, v4, v5, v6);
}

void sub_100054F84()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: applicationRecord is nil", v2, v3, v4, v5, v6);
}

void sub_100055000(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[CTCSXPCService checkEntitlements:connection:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Server: %s - Entitlement Check is successful for the key : %@", (uint8_t *)&v2, 0x16u);
}

void sub_10005508C()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: Error: current connection is nil", v2, v3, v4, v5, v6);
}

void sub_100055108()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: applicationRecord is nil", v2, v3, v4, v5, v6);
}

void sub_100055184(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000551BC()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "%s:%d: applicationRecord is nil", v2, v3, v4, v5, v6);
}

void sub_100055238()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, "Server: %s:%d: Invalid parameter", v2, v3, v4, v5, v6);
}

void sub_1000552B4()
{
  sub_100014150();
  sub_100014164((void *)&_mh_execute_header, v0, v1, " %s:%d Thread is not supported on this device..", v2, v3, v4, v5, v6);
}

uint64_t AWDPostMetric()
{
  return _AWDPostMetric();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return _WiFiCopyCurrentNetworkInfoEx();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SecItemAddAndNotifyOnSync()
{
  return __SecItemAddAndNotifyOnSync();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint64_t nw_path_copy_interface()
{
  return _nw_path_copy_interface();
}

uint64_t nw_path_create_default_evaluator()
{
  return _nw_path_create_default_evaluator();
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

uint64_t nw_path_get_ipv4_network_signature()
{
  return _nw_path_get_ipv4_network_signature();
}

uint64_t nw_path_get_ipv6_network_signature()
{
  return _nw_path_get_ipv6_network_signature();
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return _nw_path_has_ipv4(path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return _nw_path_has_ipv6(path);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return _strtok(__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return _xpc_copy_code_signing_identity_for_token();
}

id objc_msgSend_BackingStoreDS(void *a1, const char *a2, ...)
{
  return [a1 BackingStoreDS];
}

id objc_msgSend_BackingStoreDSInternally(void *a1, const char *a2, ...)
{
  return [a1 BackingStoreDSInternally];
}

id objc_msgSend_CTCSCreateXPCTransportInterface(void *a1, const char *a2, ...)
{
  return [a1 CTCSCreateXPCTransportInterface];
}

id objc_msgSend_CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords(void *a1, const char *a2, ...)
{
  return [a1 CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords];
}

id objc_msgSend_DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation(void *a1, const char *a2, ...)
{
  return [a1 DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation];
}

id objc_msgSend_DEBUGkeyChainQueryForpreferredNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 DEBUGkeyChainQueryForpreferredNetworkUpdateOperation];
}

id objc_msgSend_PANID(void *a1, const char *a2, ...)
{
  return [a1 PANID];
}

id objc_msgSend_PSKc(void *a1, const char *a2, ...)
{
  return [a1 PSKc];
}

id objc_msgSend_TXTRecordData(void *a1, const char *a2, ...)
{
  return [a1 TXTRecordData];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_addresses(void *a1, const char *a2, ...)
{
  return [a1 addresses];
}

id objc_msgSend_agentChanged(void *a1, const char *a2, ...)
{
  return [a1 agentChanged];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_baFinderSemaphore(void *a1, const char *a2, ...)
{
  return [a1 baFinderSemaphore];
}

id objc_msgSend_backingStore(void *a1, const char *a2, ...)
{
  return [a1 backingStore];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderAgent(void *a1, const char *a2, ...)
{
  return [a1 borderAgent];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_checkFF(void *a1, const char *a2, ...)
{
  return [a1 checkFF];
}

id objc_msgSend_checkWiFiStatus(void *a1, const char *a2, ...)
{
  return [a1 checkWiFiStatus];
}

id objc_msgSend_cleanUpThreadKeychainEntries(void *a1, const char *a2, ...)
{
  return [a1 cleanUpThreadKeychainEntries];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_computedUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 computedUniqueIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_credentials(void *a1, const char *a2, ...)
{
  return [a1 credentials];
}

id objc_msgSend_credentialsDataSet(void *a1, const char *a2, ...)
{
  return [a1 credentialsDataSet];
}

id objc_msgSend_credentialsDataSetRecord(void *a1, const char *a2, ...)
{
  return [a1 credentialsDataSetRecord];
}

id objc_msgSend_ctcsUtilIsThreadCommissioningEnabled(void *a1, const char *a2, ...)
{
  return [a1 ctcsUtilIsThreadCommissioningEnabled];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_dataSetArray(void *a1, const char *a2, ...)
{
  return [a1 dataSetArray];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultBackingStore(void *a1, const char *a2, ...)
{
  return [a1 defaultBackingStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_discriminatorId(void *a1, const char *a2, ...)
{
  return [a1 discriminatorId];
}

id objc_msgSend_extendedPANID(void *a1, const char *a2, ...)
{
  return [a1 extendedPANID];
}

id objc_msgSend_findNWs(void *a1, const char *a2, ...)
{
  return [a1 findNWs];
}

id objc_msgSend_generateCredentials(void *a1, const char *a2, ...)
{
  return [a1 generateCredentials];
}

id objc_msgSend_getAllPrefEntries(void *a1, const char *a2, ...)
{
  return [a1 getAllPrefEntries];
}

id objc_msgSend_getClientKeychainAccessGroup(void *a1, const char *a2, ...)
{
  return [a1 getClientKeychainAccessGroup];
}

id objc_msgSend_getNetworkPath(void *a1, const char *a2, ...)
{
  return [a1 getNetworkPath];
}

id objc_msgSend_getNetworkSignature(void *a1, const char *a2, ...)
{
  return [a1 getNetworkSignature];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hostName(void *a1, const char *a2, ...)
{
  return [a1 hostName];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initSelfHealThreadNetworkTimer(void *a1, const char *a2, ...)
{
  return [a1 initSelfHealThreadNetworkTimer];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_ipv4NwSignature(void *a1, const char *a2, ...)
{
  return [a1 ipv4NwSignature];
}

id objc_msgSend_ipv6NwSignature(void *a1, const char *a2, ...)
{
  return [a1 ipv6NwSignature];
}

id objc_msgSend_isActiveDevice(void *a1, const char *a2, ...)
{
  return [a1 isActiveDevice];
}

id objc_msgSend_isEthernetNetwork(void *a1, const char *a2, ...)
{
  return [a1 isEthernetNetwork];
}

id objc_msgSend_isWiFiNetwork(void *a1, const char *a2, ...)
{
  return [a1 isWiFiNetwork];
}

id objc_msgSend_keyChainItemRepresentationForActiveDataSetRecordAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForActiveDataSetRecordAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForActiveDataSetRecordUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
}

id objc_msgSend_keyChainItemRepresentationForAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForFrozenThreadNetworkAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForFrozenThreadNetworkAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForUpdateOperation];
}

id objc_msgSend_keyChainItemRepresentationForpreferredNetworkAddOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForpreferredNetworkAddOperation];
}

id objc_msgSend_keyChainItemRepresentationForpreferredNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainItemRepresentationForpreferredNetworkUpdateOperation];
}

id objc_msgSend_keyChainQueryForActiveDataSetRecordUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForActiveDataSetRecordUpdateOperation];
}

id objc_msgSend_keyChainQueryForDeleteAllCredentialsRecord(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForDeleteAllCredentialsRecord];
}

id objc_msgSend_keyChainQueryForDeleteAllPreferredNetworks(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForDeleteAllPreferredNetworks];
}

id objc_msgSend_keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForDeleteFrozenThreadNetworkRecordsOperation];
}

id objc_msgSend_keyChainQueryForFetchAllActiveDataSetRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFetchAllActiveDataSetRecordsOperation];
}

id objc_msgSend_keyChainQueryForFetchAllOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFetchAllOperation];
}

id objc_msgSend_keyChainQueryForFetchPreferredNetworkRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFetchPreferredNetworkRecordsOperation];
}

id objc_msgSend_keyChainQueryForFrozenThreadNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForFrozenThreadNetworkUpdateOperation];
}

id objc_msgSend_keyChainQueryForUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForUpdateOperation];
}

id objc_msgSend_keyChainQueryForpreferredNetworkUpdateOperation(void *a1, const char *a2, ...)
{
  return [a1 keyChainQueryForpreferredNetworkUpdateOperation];
}

id objc_msgSend_keychainAccessGroup(void *a1, const char *a2, ...)
{
  return [a1 keychainAccessGroup];
}

id objc_msgSend_lastModificationDate(void *a1, const char *a2, ...)
{
  return [a1 lastModificationDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_masterKey(void *a1, const char *a2, ...)
{
  return [a1 masterKey];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_network(void *a1, const char *a2, ...)
{
  return [a1 network];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_networkSignature(void *a1, const char *a2, ...)
{
  return [a1 networkSignature];
}

id objc_msgSend_passPhrase(void *a1, const char *a2, ...)
{
  return [a1 passPhrase];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_preferredRecord(void *a1, const char *a2, ...)
{
  return [a1 preferredRecord];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sCntrsStability(void *a1, const char *a2, ...)
{
  return [a1 sCntrsStability];
}

id objc_msgSend_selfHealThreadNetworkTimerHandler(void *a1, const char *a2, ...)
{
  return [a1 selfHealThreadNetworkTimerHandler];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return [a1 stopScan];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_updatePreferredNetwork(void *a1, const char *a2, ...)
{
  return [a1 updatePreferredNetwork];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wifiPassword(void *a1, const char *a2, ...)
{
  return [a1 wifiPassword];
}

id objc_msgSend_wifiSSID(void *a1, const char *a2, ...)
{
  return [a1 wifiSSID];
}