uint64_t sub_100004774(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t result;

  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
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
      v9 = v5++ >= 9;
      if (v9)
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
      break;
    }
    if ((v6 >> 3) == 1)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      *(unsigned char *)(a1 + 12) |= 1u;
      while (1)
      {
        v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        v9 = v13++ >= 9;
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
      result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100004D10(uint64_t a1, uint64_t a2)
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
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + 8) = v14 != 0;
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

uint64_t sub_1000053B8(uint64_t a1, uint64_t a2)
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

uint64_t sub_100005914(uint64_t a1, uint64_t a2)
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
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + 8) = v14 != 0;
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

uint64_t sub_100005F6C(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 2)
    {
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      *(unsigned char *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
        v19 |= (unint64_t)(v21 & 0x7F) << v17;
        if ((v21 & 0x80) == 0) {
          goto LABEL_40;
        }
        v17 += 7;
        BOOL v9 = v18++ >= 9;
        if (v9)
        {
          LODWORD(v19) = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v19) = 0;
      }
LABEL_42:
      *(_DWORD *)(a1 + 8) = v19;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 16) |= 2u;
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
          goto LABEL_36;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_38:
      *(unsigned char *)(a1 + 12) = v14 != 0;
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

BOOL sub_100006584(uint64_t a1)
{
  return a1 != 0;
}

BOOL sub_100006590(int a1)
{
  return a1 != 0;
}

uint64_t sub_10000659C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return dword_10002EF40[a1 - 1];
  }
}

uint64_t sub_1000065C0(int a1)
{
  if ((a1 - 1) > 9) {
    return 0;
  }
  else {
    return qword_10002EF60[a1 - 1];
  }
}

uint64_t sub_1000065E4(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t sub_1000065FC(int a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t sub_100006614(uint64_t result)
{
  if ((unint64_t)(result - 1) < 3) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t sub_100006624(uint64_t result)
{
  if ((unint64_t)(result - 1) < 8) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t sub_100006634(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return dword_10002EFB0[a1 - 1];
  }
}

BOOL sub_100006708(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
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
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t sub_100006A68(uint64_t a1, uint64_t a2)
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
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + 8) = v14 != 0;
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

uint64_t sub_100007120(uint64_t a1, uint64_t a2)
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

uint64_t sub_1000077CC(uint64_t a1, uint64_t a2)
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
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + 8) = v14 != 0;
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

uint64_t sub_100007ED4(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 2)
    {
      char v17 = objc_alloc_init(NCCameraStateChangedRequest);
      objc_storeStrong((id *)(a1 + 8), v17);
      if (!PBReaderPlaceMark() || (sub_10001802C((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
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
          goto LABEL_32;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_34;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_34:
      *(_DWORD *)(a1 + 16) = v14;
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

uint64_t sub_1000087BC(uint64_t a1, uint64_t a2)
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

uint64_t sub_100008D18(uint64_t a1, uint64_t a2)
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
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      *(unsigned char *)(a1 + 12) |= 1u;
      unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v13 <= 0xFFFFFFFFFFFFFFFBLL && v13 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 4;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        int v14 = 0;
      }
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

uint64_t sub_1000092AC(uint64_t a1, uint64_t a2)
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
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      *(unsigned char *)(a1 + 12) |= 1u;
      unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v13 <= 0xFFFFFFFFFFFFFFFBLL && v13 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 4;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        int v14 = 0;
      }
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

uint64_t sub_100009840(uint64_t a1, uint64_t a2)
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
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + 8) = v14 != 0;
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

uint64_t sub_100009FF0(uint64_t a1, uint64_t a2)
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
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    unint64_t v13 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      char v16 = 0;
      unsigned int v17 = 0;
      uint64_t v18 = 0;
      *(unsigned char *)(a1 + 28) |= 2u;
      while (1)
      {
        uint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v20 = v19 + 1;
        if (v19 == -1 || v20 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20;
        v18 |= (unint64_t)(v21 & 0x7F) << v16;
        if ((v21 & 0x80) == 0) {
          goto LABEL_34;
        }
        v16 += 7;
        BOOL v10 = v17++ >= 9;
        if (v10)
        {
          uint64_t v18 = 0;
          goto LABEL_36;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v18 = 0;
      }
LABEL_36:
      *(unsigned char *)(a1 + 24) = v18 != 0;
    }
    else if (v13 == 2)
    {
      *(unsigned char *)(a1 + 28) |= 1u;
      unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        uint64_t v23 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 8;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        uint64_t v23 = 0;
      }
      *(void *)(a1 + 8) = v23;
    }
    else if (v13 == 1)
    {
      uint64_t v14 = PBReaderReadData();
      unint64_t v15 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v14;
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

uint64_t sub_10000AAE8(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000B17C(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000B8B4(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000BE64(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 2)
    {
      unsigned int v17 = objc_alloc_init(NCCameraStateChangedRequest);
      objc_storeStrong((id *)(a1 + 8), v17);
      if (!PBReaderPlaceMark() || (sub_10001802C((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
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
          goto LABEL_32;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0;
          goto LABEL_34;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_34:
      *(unsigned char *)(a1 + 16) = v14 != 0;
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

void sub_10000D104(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  unsigned int v5 = objc_alloc_init(NCOpenCameraResponse);
  [(NCOpenCameraResponse *)v5 setOpenState:2];
  unint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 setPbResponse:v5];

  unint64_t v7 = [*(id *)(a1 + 32) response];
  [v7 setFireAndForget:1];

  char v8 = [*(id *)(a1 + 32) response];
  [v8 send];
}

void sub_10000D1D0(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) actionQ];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D278;
  v4[3] = &unk_1000305C0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void sub_10000D278(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _fetchCurrentCameraStateIncludingSupportedCaptureModes:1];
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending open state response.", buf, 2u);
  }

  char v4 = objc_alloc_init(NCOpenCameraResponse);
  [(NCOpenCameraResponse *)v4 setOpenState:0];
  [(NCOpenCameraResponse *)v4 setInternalState:v2];
  id v5 = [*(id *)(a1 + 40) response];
  [v5 setPbResponse:v4];

  unint64_t v6 = [*(id *)(a1 + 40) response];
  [v6 setFireAndForget:1];

  unint64_t v7 = [*(id *)(a1 + 40) response];
  [v7 send];

  char v8 = [*(id *)(*(void *)(a1 + 32) + 8) connectedDevice];
  if (!v8 || (BOOL v9 = v8, [v8 operatingSystemVersion], v9, v10 <= 2)) {
    [*(id *)(a1 + 32) _sendCurrentCameraState];
  }
}

void sub_10000D3C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) actionQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D48C;
  block[3] = &unk_1000305E8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v6;
  uint64_t v11 = *(void *)(a1 + 40);
  id v7 = v4;
  dispatch_async(v5, block);
}

void sub_10000D48C(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = sub_10001C470();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100024218(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 40) _sendOpenStateChange:2 withInternalState:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
      int v13 = 134217984;
      CFAbsoluteTime v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Success opening com.apple.camera (in %.2fs)", (uint8_t *)&v13, 0xCu);
    }
  }
}

void sub_10000D730(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_10000D784(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_10000D998(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = objc_alloc_init(NCPressShutterResponse);
  [(NCPressShutterResponse *)v7 setSuccess:a2];
  id v4 = [*(id *)(a1 + 32) response];
  [v4 setPbResponse:v7];

  id v5 = [*(id *)(a1 + 32) response];
  [v5 setFireAndForget:1];

  uint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 send];
}

void sub_10000DA40(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_10000DCC8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = objc_alloc_init(NCBeginBurstCaptureResponse);
  [(NCBeginBurstCaptureResponse *)v7 setSuccess:a2];
  id v4 = [*(id *)(a1 + 32) response];
  [v4 setPbResponse:v7];

  id v5 = [*(id *)(a1 + 32) response];
  [v5 setFireAndForget:1];

  uint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 send];
}

void sub_10000DD70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000DDE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E034(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = objc_alloc_init(NCEndBurstCaptureResponse);
  [(NCEndBurstCaptureResponse *)v7 setSuccess:a2];
  [(NCEndBurstCaptureResponse *)v7 setNumberOfPhotos:*(unsigned int *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) response];
  [v4 setPbResponse:v7];

  id v5 = [*(id *)(a1 + 32) response];
  [v5 setFireAndForget:1];

  uint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 send];
}

void sub_10000E0E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000E15C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E25C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_10000E528(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(NCSetCaptureDeviceResponse);
  [(NCSetCaptureDeviceResponse *)v4 setSuccess:a2];
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) _fetchCurrentCameraStateIncludingSupportedCaptureModes:0];
    [(NCSetCaptureDeviceResponse *)v4 setInternalState:v5];
  }
  uint64_t v6 = [*(id *)(a1 + 40) response];
  [v6 setPbResponse:v4];

  uint64_t v7 = [*(id *)(a1 + 40) response];
  [v7 setFireAndForget:1];

  uint64_t v8 = [*(id *)(a1 + 40) response];
  [v8 send];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) connectedDevice];
  if (!v9 || (uint64_t v10 = v9, [v9 operatingSystemVersion], v10, v11 <= 3)) {
    [*(id *)(a1 + 32) _sendCurrentCameraState];
  }
}

void sub_10000E634(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000E6A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E930(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(NCSetCaptureModeResponse);
  [(NCSetCaptureModeResponse *)v4 setSuccess:a2];
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) _fetchCurrentCameraStateIncludingSupportedCaptureModes:0];
    [(NCSetCaptureModeResponse *)v4 setInternalState:v5];
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) connectedDevice];
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 operatingSystemVersion];

    if (v17 > 3) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  uint64_t v8 = [(NCSetCaptureModeResponse *)v4 internalState];
  if (!v8)
  {
    uint64_t v8 = [*(id *)(a1 + 32) _fetchCurrentCameraStateIncludingSupportedCaptureModes:0];
  }
  -[NCSetCaptureModeResponse setCaptureMode:](v4, "setCaptureMode:", [v8 captureMode]);

LABEL_10:
  uint64_t v9 = [*(id *)(a1 + 40) response];
  [v9 setPbResponse:v4];

  uint64_t v10 = [*(id *)(a1 + 40) response];
  [v10 setFireAndForget:1];

  uint64_t v11 = [*(id *)(a1 + 40) response];
  [v11 send];

  CFAbsoluteTime v12 = [*(id *)(*(void *)(a1 + 32) + 8) connectedDevice];
  if (v12)
  {
    int v13 = v12;
    [v12 operatingSystemVersion];

    if (v14 > 3) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_sendCurrentCameraState", v14, v15, v16, v17, v18, v19);
LABEL_15:
}

void sub_10000EAB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000EB2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EDA8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = objc_alloc_init(NCStartCaptureResponse);
  [(NCStartCaptureResponse *)v7 setSuccess:a2];
  id v4 = [*(id *)(a1 + 32) response];
  [v4 setPbResponse:v7];

  id v5 = [*(id *)(a1 + 32) response];
  [v5 setFireAndForget:1];

  uint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 send];
}

void sub_10000EE50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000EEC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F108(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = objc_alloc_init(NCPauseCaptureResponse);
  [(NCPauseCaptureResponse *)v7 setSuccess:a2];
  id v4 = [*(id *)(a1 + 32) response];
  [v4 setPbResponse:v7];

  id v5 = [*(id *)(a1 + 32) response];
  [v5 setFireAndForget:1];

  uint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 send];
}

void sub_10000F1B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F224(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F468(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = objc_alloc_init(NCResumeCaptureResponse);
  [(NCResumeCaptureResponse *)v7 setSuccess:a2];
  id v4 = [*(id *)(a1 + 32) response];
  [v4 setPbResponse:v7];

  id v5 = [*(id *)(a1 + 32) response];
  [v5 setFireAndForget:1];

  uint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 send];
}

void sub_10000F510(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F584(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F7C8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = objc_alloc_init(NCStopCaptureResponse);
  [(NCStopCaptureResponse *)v7 setSuccess:a2];
  id v4 = [*(id *)(a1 + 32) response];
  [v4 setPbResponse:v7];

  id v5 = [*(id *)(a1 + 32) response];
  [v5 setFireAndForget:1];

  uint64_t v6 = [*(id *)(a1 + 32) response];
  [v6 send];
}

void sub_10000F870(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F8E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FA74(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_10000FD2C(uint64_t a1, int a2, float a3)
{
  if (a2)
  {
    id v5 = objc_alloc_init(NCSetZoomResponse);
    *(float *)&double v6 = a3;
    [(NCSetZoomResponse *)v5 setZoomAmount:v6];
    uint64_t v7 = [*(id *)(a1 + 32) response];
    [v7 setPbResponse:v5];
  }
  uint64_t v8 = [*(id *)(a1 + 32) response];
  [v8 setFireAndForget:1];

  id v9 = [*(id *)(a1 + 32) response];
  [v9 send];
}

void sub_10000FDE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

uint64_t sub_10000FE60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000100D8(uint64_t a1, int a2, float a3)
{
  if (a2)
  {
    id v5 = objc_alloc_init(NCSetZoomMagnificationResponse);
    *(float *)&double v6 = a3;
    [(NCSetZoomMagnificationResponse *)v5 setZoomMagnificationAmount:v6];
    uint64_t v7 = [*(id *)(a1 + 32) response];
    [v7 setPbResponse:v5];
  }
  uint64_t v8 = [*(id *)(a1 + 32) response];
  [v8 setFireAndForget:1];

  id v9 = [*(id *)(a1 + 32) response];
  [v9 send];
}

void sub_100010194(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001C470();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }

  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

uint64_t sub_10001020C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000103EC(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = objc_alloc_init(NCSetFlashModeResponse);
    [(NCSetFlashModeResponse *)v5 setFlashMode:a3];
    double v6 = [*(id *)(a1 + 32) response];
    [v6 setPbResponse:v5];
  }
  uint64_t v7 = [*(id *)(a1 + 32) response];
  [v7 setFireAndForget:1];

  id v8 = [*(id *)(a1 + 32) response];
  [v8 send];
}

void sub_1000104A0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_1000106C0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = objc_alloc_init(NCSetHDRModeResponse);
    [(NCSetHDRModeResponse *)v5 setHdrMode:a3];
    double v6 = [*(id *)(a1 + 32) response];
    [v6 setPbResponse:v5];
  }
  uint64_t v7 = [*(id *)(a1 + 32) response];
  [v7 setFireAndForget:1];

  id v8 = [*(id *)(a1 + 32) response];
  [v8 send];
}

void sub_100010774(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_100010994(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = objc_alloc_init(NCSetIrisModeResponse);
    [(NCSetIrisModeResponse *)v5 setIrisMode:a3];
    double v6 = [*(id *)(a1 + 32) response];
    [v6 setPbResponse:v5];
  }
  uint64_t v7 = [*(id *)(a1 + 32) response];
  [v7 setFireAndForget:1];

  id v8 = [*(id *)(a1 + 32) response];
  [v8 send];
}

void sub_100010A48(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_100010C68(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = objc_alloc_init(NCSetSharedLibraryModeResponse);
    [(NCSetSharedLibraryModeResponse *)v5 setSharedLibraryMode:a3];
    double v6 = [*(id *)(a1 + 32) response];
    [v6 setPbResponse:v5];
  }
  uint64_t v7 = [*(id *)(a1 + 32) response];
  [v7 setFireAndForget:1];

  id v8 = [*(id *)(a1 + 32) response];
  [v8 send];
}

void sub_100010D1C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_100010EE8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

id sub_100010F3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCurrentCameraState];
}

void sub_1000110BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id sub_1000122EC(uint64_t a1)
{
  uint64_t v2 = sub_10001C470();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    id v5 = "-[NCCompanionCamera xpc_captureDeviceDidChange]_block_invoke";
    __int16 v6 = 2080;
    uint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/companioncamerad/NCCompanionCamera.m";
    __int16 v8 = 1024;
    int v9 = 966;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v4, 0x1Cu);
  }

  return [*(id *)(a1 + 32) _sendCurrentCameraState];
}

void sub_1000127BC(uint64_t a1)
{
  uint64_t v2 = sub_10001C470();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  int v4 = *(void **)(a1 + 40);
  if (v4[8] == 1)
  {
    id v5 = [v4 makeRequest:10];
    [v5 setPbRequest:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 8) sendRequest:v5];
  }
  else
  {
    id v5 = sub_10001C470();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000242AC();
    }
  }
}

void sub_100012AA8(uint64_t a1, void *a2)
{
  if ([a2 acknowledge])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(void *)(v3 + 64))
    {
      *(void *)(v3 + 64) = 1;
      int v4 = sub_10001C470();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote side is active. Poking Camera.", v6, 2u);
      }

      id v5 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxyWithErrorHandler:&stru_1000308F8];
      objc_msgSend(v5, "xpc_setPreviewEndpoint:", @"proxy");
    }
  }
}

void sub_100012B60(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_100012CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012CE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012CF8(uint64_t a1)
{
}

void sub_100012D00(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_100012D54(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, unsigned int a6, void *a7, unsigned int a8, float a9, float a10, float a11, float a12, void *a13, uint64_t a14, unsigned __int8 a15, unsigned __int8 a16, unsigned __int8 a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,unsigned __int8 a27,unsigned __int8 a28,unsigned __int8 a29,uint64_t a30,unsigned __int8 a31)
{
  uint64_t v40 = a25;
  uint64_t v39 = a26;
  id v126 = a2;
  v127 = a4;
  id v130 = a7;
  id v41 = a13;
  id v42 = a18;
  v43 = sub_10001C470();
  v132 = v41;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    log = v43;
    BOOL v44 = sub_100006584(a3);
    if (v44)
    {
      uint64_t v45 = a14;
      if (v44)
      {
        v46 = @"Front";
      }
      else
      {
        v46 = +[NSString stringWithFormat:@"(unknown: %i)", v44];
      }
    }
    else
    {
      v46 = @"Back";
      uint64_t v45 = a14;
    }
    v124 = v46;
    CFStringRef v47 = v127;
    if (!*(unsigned char *)(a1 + 48)) {
      CFStringRef v47 = @"not-included";
    }
    CFStringRef v118 = v47;
    uint64_t v48 = sub_10000659C(a5);
    if v48 < 0xB && ((0x7ABu >> v48))
    {
      v49 = *(&off_100030A58 + (int)v48);
    }
    else
    {
      v49 = +[NSString stringWithFormat:@"(unknown: %i)", v48];
    }
    id v125 = v49;
    uint64_t v50 = sub_100006634(v45);
    if (v50 >= 5)
    {
      v51 = +[NSString stringWithFormat:@"(unknown: %i)", v50];
    }
    else
    {
      v51 = *(&off_100030AB0 + (int)v50);
    }
    id v52 = v51;
    uint64_t v53 = sub_1000065E4(a19);
    if (v53 >= 3)
    {
      v54 = +[NSString stringWithFormat:@"(unknown: %i)", v53];
    }
    else
    {
      v54 = *(&off_100030AF8 + (int)v53);
    }
    id v122 = v54;
    uint64_t v55 = sub_1000065E4(a20);
    if (v55 >= 3)
    {
      v56 = +[NSString stringWithFormat:@"(unknown: %i)", v55];
    }
    else
    {
      v56 = *(&off_100030B10 + (int)v55);
    }
    id v121 = v56;
    uint64_t v57 = sub_100006614(a21);
    if (v57 >= 4)
    {
      v58 = +[NSString stringWithFormat:@"(unknown: %i)", v57];
    }
    else
    {
      v58 = *(&off_100030AD8 + (int)v57);
    }
    id v120 = v58;
    uint64_t v59 = sub_1000065E4(a22);
    if (v59 >= 3)
    {
      v60 = +[NSString stringWithFormat:@"(unknown: %i)", v59];
    }
    else
    {
      v60 = *(&off_100030B10 + (int)v59);
    }
    id v61 = v60;
    uint64_t v62 = sub_1000065E4(a23);
    if (v62 >= 3)
    {
      v63 = +[NSString stringWithFormat:@"(unknown: %i)", v62];
    }
    else
    {
      v63 = *(&off_100030AF8 + (int)v62);
    }
    id v117 = v63;
    uint64_t v64 = sub_1000065E4(a24);
    if (v64 >= 3)
    {
      v65 = +[NSString stringWithFormat:@"(unknown: %i)", v64];
    }
    else
    {
      v65 = *(&off_100030B10 + (int)v64);
    }
    id v116 = v65;
    BOOL v66 = sub_100006584(a25);
    v123 = v52;
    if (v66)
    {
      if (v66)
      {
        v67 = @"OnOff";
      }
      else
      {
        v67 = +[NSString stringWithFormat:@"(unknown: %i)", v66];
      }
    }
    else
    {
      v67 = @"None";
    }
    v115 = v67;
    BOOL v68 = sub_100006584(a26);
    if (v68)
    {
      id v69 = v130;
      if (v68)
      {
        v70 = @"On";
      }
      else
      {
        v70 = +[NSString stringWithFormat:@"(unknown: %i)", v68];
      }
    }
    else
    {
      id v69 = v130;
      v70 = @"Off";
    }
    v114 = v70;
    uint64_t v71 = sub_100006624(a30);
    if (v71 >= 9)
    {
      v72 = +[NSString stringWithFormat:@"(unknown: %i)", v71];
    }
    else
    {
      v72 = *(&off_100030B28 + (int)v71);
    }
    *(_DWORD *)buf = 138418434;
    id v156 = v126;
    __int16 v157 = 2112;
    v158 = v124;
    __int16 v159 = 2112;
    CFStringRef v160 = v118;
    __int16 v161 = 2112;
    id v162 = v125;
    __int16 v163 = 1024;
    unsigned int v164 = a6;
    __int16 v165 = 2112;
    id v166 = v69;
    __int16 v167 = 1024;
    unsigned int v168 = a8;
    __int16 v169 = 2112;
    v170 = v132;
    __int16 v171 = 2112;
    id v172 = v52;
    __int16 v173 = 1024;
    int v174 = a15;
    __int16 v175 = 1024;
    int v176 = a16;
    __int16 v177 = 2048;
    double v178 = a9;
    __int16 v179 = 2112;
    id v180 = v122;
    __int16 v181 = 2112;
    id v182 = v121;
    __int16 v183 = 2112;
    id v184 = v120;
    __int16 v185 = 2112;
    id v186 = v61;
    __int16 v187 = 2112;
    id v188 = v117;
    __int16 v189 = 2112;
    id v190 = v116;
    __int16 v191 = 2112;
    v192 = v115;
    __int16 v193 = 2112;
    v194 = v114;
    __int16 v195 = 1024;
    int v196 = a27;
    __int16 v197 = 1024;
    int v198 = a28;
    __int16 v199 = 1024;
    int v200 = a29;
    __int16 v201 = 2112;
    id v113 = v72;
    id v202 = v113;
    __int16 v203 = 1024;
    int v204 = a31;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "supportedCaptureDevice:%@ captureDevice:%@ supportedCaptureModes:%@ captureMode:%@ capturing:%d captureStartDate:%@ capturingPaused:%d capturePauseDate:%@ orientation:%@ toggleCameraDeviceSupport:%d zoomSupport:%d zoomAmount:%f flashSupport:%@ flashMode:%@ hdrSupport:%@ hdrMode:%@ irisSupport:%@ irisMode:%@ sharedLibrarySupport:%@ sharedLibraryMode:%@ supportsMomentCapture:%d burstSupport:%d showingLivePreview:%d shallowDepthOfFieldStatus:%@, spatial:%d", buf, 0xDCu);

    v43 = log;
    uint64_t v39 = a26;
    uint64_t v40 = a25;
  }

  v73 = objc_alloc_init(NCCameraStateChangedRequest);
  uint64_t v74 = *(void *)(*(void *)(a1 + 40) + 8);
  v75 = *(void **)(v74 + 40);
  *(void *)(v74 + 40) = v73;

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v76 = v126;
  id v77 = [v76 countByEnumeratingWithState:&v147 objects:v154 count:16];
  if (v77)
  {
    id v78 = v77;
    uint64_t v79 = *(void *)v148;
    do
    {
      for (i = 0; i != v78; i = (char *)i + 1)
      {
        if (*(void *)v148 != v79) {
          objc_enumerationMutation(v76);
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addSupportedCaptureDevice:", sub_100006584((uint64_t)objc_msgSend(*(id *)(*((void *)&v147 + 1) + 8 * i), "integerValue")));
      }
      id v78 = [v76 countByEnumeratingWithState:&v147 objects:v154 count:16];
    }
    while (v78);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCaptureDevice:sub_100006584(a3)];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v81 = v127;
  id v82 = [(__CFString *)v81 countByEnumeratingWithState:&v143 objects:v153 count:16];
  if (v82)
  {
    id v83 = v82;
    uint64_t v84 = *(void *)v144;
    do
    {
      for (j = 0; j != v83; j = (char *)j + 1)
      {
        if (*(void *)v144 != v84) {
          objc_enumerationMutation(v81);
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addSupportedCaptureMode:", sub_10000659C((uint64_t)objc_msgSend(*(id *)(*((void *)&v143 + 1) + 8 * (void)j), "integerValue")));
      }
      id v83 = [(__CFString *)v81 countByEnumeratingWithState:&v143 objects:v153 count:16];
    }
    while (v83);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCaptureMode:sub_10000659C(a5)];
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  v86 = v81;
  id v87 = [(__CFString *)v86 countByEnumeratingWithState:&v139 objects:v152 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v140;
    do
    {
      for (k = 0; k != v88; k = (char *)k + 1)
      {
        if (*(void *)v140 != v89) {
          objc_enumerationMutation(v86);
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addSupportedCaptureMode:", sub_10000659C((uint64_t)objc_msgSend(*(id *)(*((void *)&v139 + 1) + 8 * (void)k), "integerValue")));
      }
      id v88 = [(__CFString *)v86 countByEnumeratingWithState:&v139 objects:v152 count:16];
    }
    while (v88);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCaptureMode:sub_10000659C(a5)];
  if ((unint64_t)(a14 - 1) <= 3) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setOrientation:sub_100006634(a14)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCapturing:a6];
  v91 = v130;
  if (v130)
  {
    [v130 timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setCaptureStartDate:");
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCapturingPaused:a8];
  if (v132)
  {
    [v132 timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setCapturePauseDate:");
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setToggleCameraDeviceSupport:a15];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setZoomSupport:a16];
  if (a16)
  {
    *(float *)&double v92 = a9;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setZoomAmount:v92];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setZoomMagnificationSupport:a17];
  if (a17)
  {
    uint64_t v94 = v39;
    *(float *)&double v93 = a10;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMinimumZoomMagnification:v93];
    *(float *)&double v95 = a11;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMaximumZoomMagnification:v95];
    *(float *)&double v96 = a12;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCurrentZoomMagnification:v96];
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v97 = v42;
    id v98 = v42;
    id v99 = [v98 countByEnumeratingWithState:&v135 objects:v151 count:16];
    if (v99)
    {
      id v100 = v99;
      uint64_t v101 = *(void *)v136;
      do
      {
        for (m = 0; m != v100; m = (char *)m + 1)
        {
          if (*(void *)v136 != v101) {
            objc_enumerationMutation(v98);
          }
          v103 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          [*(id *)(*((void *)&v135 + 1) + 8 * (void)m) floatValue];
          objc_msgSend(v103, "addSignificantZoomMagnifications:");
        }
        id v100 = [v98 countByEnumeratingWithState:&v135 objects:v151 count:16];
      }
      while (v100);
    }

    id v42 = v97;
    uint64_t v39 = v94;
    uint64_t v40 = a25;
    v91 = v130;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setFlashSupport:sub_1000065E4(a19)];
  if (a19) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setFlashMode:sub_1000065E4(a20)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHdrSupport:sub_100006614(a21)];
  if (a21) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHdrMode:sub_1000065E4(a22)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIrisSupport:sub_1000065E4(a23)];
  if (a23)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIrisMode:sub_1000065E4(a24)];
    v104 = [*(id *)(*(void *)(a1 + 32) + 8) connectedDevice];
    if (!v104 || (v105 = v104, [v104 operatingSystemVersion], v105, v134 <= 4))
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) irisMode] == 2) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIrisMode:1];
      }
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSharedLibrarySupport:sub_100006584(v40)];
  if (v40) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSharedLibraryMode:sub_100006584(v39)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSupportsMomentCapture:a27];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setBurstSupport:a28];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setShowingLivePreview:a29];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setShallowDepthOfFieldStatus:sub_100006624(a30)];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIsSpatialCapture:a31];
  v106 = [*(id *)(*(void *)(a1 + 32) + 8) connectedDevice];
  if (v106)
  {
    v107 = v106;
    [v106 operatingSystemVersion];

    v108 = v132;
    if (v133 > 3) {
      goto LABEL_107;
    }
  }
  else
  {
    v108 = v132;
  }
  unsigned __int8 v109 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) showingLivePreview];
  v110 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if ((v109 & 1) == 0)
  {
    uint64_t v112 = 2;
LABEL_106:
    [v110 setCaptureMode:v112];
    goto LABEL_107;
  }
  if ([v110 capturing])
  {
    unsigned int v111 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) captureMode];
    v110 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v111 == 1)
    {
      uint64_t v112 = 4;
    }
    else
    {
      if ([v110 captureMode] != 5) {
        goto LABEL_107;
      }
      v110 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v112 = 6;
    }
    goto LABEL_106;
  }
LABEL_107:
}

void sub_100013E4C(uint64_t a1)
{
  uint64_t v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CCCameraConnectionProtocol];
  uint64_t v3 = objc_opt_class();
  int v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:"xpc_ensureSwitchedToOneOfSupportedCaptureModes:reply:" argumentIndex:0 ofReply:0];

  uint64_t v5 = objc_opt_class();
  int v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:"xpc_fetchCurrentStateIncludingSupportedCaptureModes:reply:" argumentIndex:0 ofReply:1];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CCCameraServerProtocol];
  [*(id *)(*(void *)(a1 + 32) + 40) setExportedInterface:v7];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setExportedObject:");
  [*(id *)(*(void *)(a1 + 32) + 40) setRemoteObjectInterface:v2];
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000142D8;
  v22[3] = &unk_100030990;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  [*(id *)(*(void *)(a1 + 32) + 40) setInvalidationHandler:v22];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001433C;
  v19[3] = &unk_100030990;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  [*(id *)(*(void *)(a1 + 32) + 40) setInterruptionHandler:v19];
  [*(id *)(*(void *)(a1 + 32) + 40) resume];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000143A0;
  v18[3] = &unk_1000308D8;
  v18[4] = *(void *)(a1 + 32);
  __int16 v8 = objc_retainBlock(v18);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 64);
  if (v10)
  {
    if (v10 == 1)
    {
      uint64_t v11 = [*(id *)(v9 + 40) remoteObjectProxyWithErrorHandler:&stru_1000309B0];
      [v11 xpc_setPreviewEndpoint:@"proxy"];
      uint64_t v12 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v12 + 24))
      {
        uint64_t v13 = *(void *)(v12 + 16);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100014488;
        v16[3] = &unk_1000309D8;
        v16[4] = v12;
        uint64_t v17 = v8;
        [v11 xpc_ensureSwitchedToOneOfSupportedCaptureModes:v13 reply:v16];
        *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
      }
      else
      {
        ((void (*)(void *))v8[2])(v8);
      }
    }
    else
    {
      uint64_t v11 = sub_10001C470();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1000242AC();
      }
    }
  }
  else
  {
    uint64_t v14 = sub_10001C470();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remote camera state is unknown.", buf, 2u);
    }

    ((void (*)(void *))v8[2])(v8);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void sub_100014280(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 112));
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1000142D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained connectionDidTearDown:v2];
}

void sub_10001433C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained connectionDidTearDown:v2];
}

void sub_1000143A0(uint64_t a1)
{
  id v2 = sub_10001C470();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Sending open state change.", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) _fetchCurrentCameraStateIncludingSupportedCaptureModes:1];
  [*(id *)(a1 + 32) _sendOpenStateChange:0 withInternalState:v3];
}

void sub_100014434(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_10001C470();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000241B0();
  }
}

void sub_100014488(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) actionQ];
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
}

void sub_10001463C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v2 == *(void **)(v3 + 40))
    {
      *(void *)(v3 + 40) = 0;

      int v4 = sub_10001C470();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Companion camera closed, sending open state change", v7, 2u);
      }

      [*(id *)(a1 + 40) _sendOpenStateChange:2 withInternalState:0];
    }
  }
  NSLog(@"Releasing connection transaction");
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = 0;
}

void *sub_10001475C(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_10003B730)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_10001489C;
    v5[4] = &unk_100030A38;
    v5[5] = v5;
    long long v6 = off_100030A20;
    uint64_t v7 = 0;
    qword_10003B730 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)qword_10003B730;
    if (qword_10003B730)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_10003B730;
LABEL_5:
  uint64_t result = dlsym(v2, "AudioServicesPlaySystemSound");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10003B728 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001489C()
{
  uint64_t result = _sl_dlopen();
  qword_10003B730 = result;
  return result;
}

void sub_100014910(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100014938(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_100014AE8(uint64_t a1, uint64_t a2)
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
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      *(unsigned char *)(a1 + 12) |= 1u;
      unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v13 <= 0xFFFFFFFFFFFFFFFBLL && v13 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 4;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        int v14 = 0;
      }
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v14;
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

uint64_t start()
{
  v1 = objc_alloc_init(NCCompanionCamera);
  id v2 = +[NSRunLoop mainRunLoop];
  [v2 run];

  return 0;
}

uint64_t sub_10001521C(uint64_t a1, uint64_t a2)
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
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v14;
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

uint64_t sub_10001802C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (2)
    {
      if (!*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
      {
        char v4 = 0;
        unsigned int v5 = 0;
        unint64_t v6 = 0;
        while (1)
        {
          uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v8 = v7 + 1;
          if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
          v6 |= (unint64_t)(v9 & 0x7F) << v4;
          if ((v9 & 0x80) == 0) {
            goto LABEL_11;
          }
          v4 += 7;
          BOOL v10 = v5++ >= 9;
          if (v10)
          {
            unint64_t v6 = 0;
            uint64_t v11 = OBJC_IVAR___PBDataReader__error;
            int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
            goto LABEL_13;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
        uint64_t v11 = OBJC_IVAR___PBDataReader__error;
        int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          unint64_t v6 = 0;
        }
LABEL_13:
        int v13 = v6 & 7;
        if (!v12 && v13 != 4)
        {
          switch((v6 >> 3))
          {
            case 1u:
              char v15 = 0;
              unsigned int v16 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x2000u;
              while (1)
              {
                uint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v19 = v18 + 1;
                if (v18 == -1 || v19 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                  break;
                }
                char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19;
                v17 |= (unint64_t)(v20 & 0x7F) << v15;
                if ((v20 & 0x80) == 0) {
                  goto LABEL_222;
                }
                v15 += 7;
                BOOL v10 = v16++ >= 9;
                if (v10)
                {
                  LODWORD(v17) = 0;
                  goto LABEL_224;
                }
              }
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_222:
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_224:
              uint64_t v153 = 140;
              goto LABEL_293;
            case 3u:
              *(_DWORD *)(a1 + 172) |= 0x20000u;
              unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                int v22 = 0;
              }
              uint64_t v169 = 156;
              goto LABEL_336;
            case 4u:
              char v23 = 0;
              unsigned int v24 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x40u;
              while (2)
              {
                uint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v26 = v25 + 1;
                if (v25 == -1 || v26 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26;
                  v17 |= (unint64_t)(v27 & 0x7F) << v23;
                  if (v27 < 0)
                  {
                    v23 += 7;
                    BOOL v10 = v24++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_228;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_228:
              uint64_t v153 = 112;
              goto LABEL_293;
            case 5u:
              char v28 = 0;
              unsigned int v29 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x20u;
              while (2)
              {
                uint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v31 = v30 + 1;
                if (v30 == -1 || v31 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v32 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v31;
                  v17 |= (unint64_t)(v32 & 0x7F) << v28;
                  if (v32 < 0)
                  {
                    v28 += 7;
                    BOOL v10 = v29++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_232;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_232:
              uint64_t v153 = 108;
              goto LABEL_293;
            case 6u:
              char v33 = 0;
              unsigned int v34 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x100u;
              while (2)
              {
                uint64_t v35 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v36 = v35 + 1;
                if (v35 == -1 || v36 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v37 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v35);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v36;
                  v17 |= (unint64_t)(v37 & 0x7F) << v33;
                  if (v37 < 0)
                  {
                    v33 += 7;
                    BOOL v10 = v34++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_236;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_236:
              uint64_t v153 = 120;
              goto LABEL_293;
            case 7u:
              char v38 = 0;
              unsigned int v39 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x80u;
              while (2)
              {
                uint64_t v40 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v41 = v40 + 1;
                if (v40 == -1 || v41 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v42 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v40);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v41;
                  v17 |= (unint64_t)(v42 & 0x7F) << v38;
                  if (v42 < 0)
                  {
                    v38 += 7;
                    BOOL v10 = v39++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_240;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_240:
              uint64_t v153 = 116;
              goto LABEL_293;
            case 8u:
              char v43 = 0;
              unsigned int v44 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x400u;
              while (2)
              {
                uint64_t v45 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v46 = v45 + 1;
                if (v45 == -1 || v46 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v47 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v45);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v46;
                  v17 |= (unint64_t)(v47 & 0x7F) << v43;
                  if (v47 < 0)
                  {
                    v43 += 7;
                    BOOL v10 = v44++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_244;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_244:
              uint64_t v153 = 128;
              goto LABEL_293;
            case 9u:
              char v48 = 0;
              unsigned int v49 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x200u;
              while (2)
              {
                uint64_t v50 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v51 = v50 + 1;
                if (v50 == -1 || v51 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v52 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v50);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v51;
                  v17 |= (unint64_t)(v52 & 0x7F) << v48;
                  if (v52 < 0)
                  {
                    v48 += 7;
                    BOOL v10 = v49++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_248;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_248:
              uint64_t v153 = 124;
              goto LABEL_293;
            case 0xAu:
              char v53 = 0;
              unsigned int v54 = 0;
              uint64_t v55 = 0;
              *(_DWORD *)(a1 + 172) |= 0x40000u;
              while (2)
              {
                uint64_t v56 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v57 = v56 + 1;
                if (v56 == -1 || v57 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v58 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v56);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v57;
                  v55 |= (unint64_t)(v58 & 0x7F) << v53;
                  if (v58 < 0)
                  {
                    v53 += 7;
                    BOOL v10 = v54++ >= 9;
                    if (v10)
                    {
                      uint64_t v55 = 0;
                      goto LABEL_252;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v55 = 0;
              }
LABEL_252:
              BOOL v154 = v55 != 0;
              uint64_t v155 = 160;
              goto LABEL_306;
            case 0xBu:
              char v59 = 0;
              unsigned int v60 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 8u;
              while (2)
              {
                uint64_t v61 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v62 = v61 + 1;
                if (v61 == -1 || v62 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v63 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v61);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v62;
                  v17 |= (unint64_t)(v63 & 0x7F) << v59;
                  if (v63 < 0)
                  {
                    v59 += 7;
                    BOOL v10 = v60++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_256;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_256:
              uint64_t v153 = 100;
              goto LABEL_293;
            case 0xCu:
              char v64 = 0;
              unsigned int v65 = 0;
              uint64_t v66 = 0;
              *(_DWORD *)(a1 + 172) |= 0x1000000u;
              while (2)
              {
                uint64_t v67 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v68 = v67 + 1;
                if (v67 == -1 || v68 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v69 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v67);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v68;
                  v66 |= (unint64_t)(v69 & 0x7F) << v64;
                  if (v69 < 0)
                  {
                    v64 += 7;
                    BOOL v10 = v65++ >= 9;
                    if (v10)
                    {
                      uint64_t v66 = 0;
                      goto LABEL_260;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v66 = 0;
              }
LABEL_260:
              BOOL v154 = v66 != 0;
              uint64_t v155 = 166;
              goto LABEL_306;
            case 0xDu:
              char v70 = 0;
              unsigned int v71 = 0;
              uint64_t v72 = 0;
              *(_DWORD *)(a1 + 172) |= 0x4000000u;
              while (2)
              {
                uint64_t v73 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v74 = v73 + 1;
                if (v73 == -1 || v74 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v75 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v73);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v74;
                  v72 |= (unint64_t)(v75 & 0x7F) << v70;
                  if (v75 < 0)
                  {
                    v70 += 7;
                    BOOL v10 = v71++ >= 9;
                    if (v10)
                    {
                      uint64_t v72 = 0;
                      goto LABEL_264;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v72 = 0;
              }
LABEL_264:
              BOOL v154 = v72 != 0;
              uint64_t v155 = 168;
              goto LABEL_306;
            case 0xEu:
              if (v13 != 2)
              {
                char v156 = 0;
                unsigned int v157 = 0;
                uint64_t v158 = 0;
                while (1)
                {
                  uint64_t v159 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v160 = v159 + 1;
                  if (v159 == -1 || v160 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                    goto LABEL_321;
                  }
                  char v161 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v159);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v160;
                  v158 |= (unint64_t)(v161 & 0x7F) << v156;
                  if (v161 < 0)
                  {
                    v156 += 7;
                    BOOL v10 = v157++ >= 9;
                    if (!v10) {
                      continue;
                    }
                  }
                  goto LABEL_322;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length)
                   && !*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
              {
                char v76 = 0;
                unsigned int v77 = 0;
                uint64_t v78 = 0;
                while (1)
                {
                  uint64_t v79 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v80 = v79 + 1;
                  if (v79 == -1 || v80 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                    break;
                  }
                  char v81 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v79);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v80;
                  v78 |= (unint64_t)(v81 & 0x7F) << v76;
                  if (v81 < 0)
                  {
                    v76 += 7;
                    BOOL v10 = v77++ >= 9;
                    if (!v10) {
                      continue;
                    }
                  }
                  goto LABEL_112;
                }
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_112:
                PBRepeatedInt32Add();
              }
              goto LABEL_200;
            case 0xFu:
              char v82 = 0;
              unsigned int v83 = 0;
              uint64_t v84 = 0;
              *(_DWORD *)(a1 + 172) |= 0x80000u;
              while (2)
              {
                uint64_t v85 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v86 = v85 + 1;
                if (v85 == -1 || v86 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v87 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v85);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v86;
                  v84 |= (unint64_t)(v87 & 0x7F) << v82;
                  if (v87 < 0)
                  {
                    v82 += 7;
                    BOOL v10 = v83++ >= 9;
                    if (v10)
                    {
                      uint64_t v84 = 0;
                      goto LABEL_268;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v84 = 0;
              }
LABEL_268:
              BOOL v154 = v84 != 0;
              uint64_t v155 = 161;
              goto LABEL_306;
            case 0x10u:
              *(_DWORD *)(a1 + 172) |= 2u;
              unint64_t v88 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v88 <= 0xFFFFFFFFFFFFFFF7 && v88 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                uint64_t v89 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v88);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v88 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                uint64_t v89 = 0;
              }
              uint64_t v170 = 88;
              goto LABEL_339;
            case 0x11u:
              char v90 = 0;
              unsigned int v91 = 0;
              uint64_t v92 = 0;
              *(_DWORD *)(a1 + 172) |= 0x400000u;
              while (2)
              {
                uint64_t v93 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v94 = v93 + 1;
                if (v93 == -1 || v94 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v95 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v93);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v94;
                  v92 |= (unint64_t)(v95 & 0x7F) << v90;
                  if (v95 < 0)
                  {
                    v90 += 7;
                    BOOL v10 = v91++ >= 9;
                    if (v10)
                    {
                      uint64_t v92 = 0;
                      goto LABEL_272;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v92 = 0;
              }
LABEL_272:
              BOOL v154 = v92 != 0;
              uint64_t v155 = 164;
              goto LABEL_306;
            case 0x12u:
              char v96 = 0;
              unsigned int v97 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x4000u;
              while (2)
              {
                uint64_t v98 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v99 = v98 + 1;
                if (v98 == -1 || v99 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v100 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v98);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v99;
                  v17 |= (unint64_t)(v100 & 0x7F) << v96;
                  if (v100 < 0)
                  {
                    v96 += 7;
                    BOOL v10 = v97++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_276;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_276:
              uint64_t v153 = 144;
              goto LABEL_293;
            case 0x13u:
              char v101 = 0;
              unsigned int v102 = 0;
              uint64_t v103 = 0;
              *(_DWORD *)(a1 + 172) |= 0x800000u;
              while (2)
              {
                uint64_t v104 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v105 = v104 + 1;
                if (v104 == -1 || v105 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v106 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v104);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v105;
                  v103 |= (unint64_t)(v106 & 0x7F) << v101;
                  if (v106 < 0)
                  {
                    v101 += 7;
                    BOOL v10 = v102++ >= 9;
                    if (v10)
                    {
                      uint64_t v103 = 0;
                      goto LABEL_280;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v103 = 0;
              }
LABEL_280:
              BOOL v154 = v103 != 0;
              uint64_t v155 = 165;
              goto LABEL_306;
            case 0x14u:
              if (v13 != 2)
              {
                char v162 = 0;
                unsigned int v163 = 0;
                uint64_t v164 = 0;
                while (1)
                {
                  uint64_t v165 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v166 = v165 + 1;
                  if (v165 == -1 || v166 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                    break;
                  }
                  char v167 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v165);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v166;
                  v164 |= (unint64_t)(v167 & 0x7F) << v162;
                  if (v167 < 0)
                  {
                    v162 += 7;
                    BOOL v10 = v163++ >= 9;
                    if (!v10) {
                      continue;
                    }
                  }
                  goto LABEL_322;
                }
LABEL_321:
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_322:
                PBRepeatedInt32Add();
                goto LABEL_342;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length)
                   && !*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
              {
                char v107 = 0;
                unsigned int v108 = 0;
                uint64_t v109 = 0;
                while (1)
                {
                  uint64_t v110 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v111 = v110 + 1;
                  if (v110 == -1 || v111 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                    break;
                  }
                  char v112 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v110);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v111;
                  v109 |= (unint64_t)(v112 & 0x7F) << v107;
                  if (v112 < 0)
                  {
                    v107 += 7;
                    BOOL v10 = v108++ >= 9;
                    if (!v10) {
                      continue;
                    }
                  }
                  goto LABEL_156;
                }
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_156:
                PBRepeatedInt32Add();
              }
              goto LABEL_200;
            case 0x15u:
              char v113 = 0;
              unsigned int v114 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 4u;
              while (2)
              {
                uint64_t v115 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v116 = v115 + 1;
                if (v115 == -1 || v116 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v117 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v115);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v116;
                  v17 |= (unint64_t)(v117 & 0x7F) << v113;
                  if (v117 < 0)
                  {
                    v113 += 7;
                    BOOL v10 = v114++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_284;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_284:
              uint64_t v153 = 96;
              goto LABEL_293;
            case 0x16u:
              char v118 = 0;
              unsigned int v119 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x10000u;
              while (2)
              {
                uint64_t v120 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v121 = v120 + 1;
                if (v120 == -1 || v121 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v122 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v120);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v121;
                  v17 |= (unint64_t)(v122 & 0x7F) << v118;
                  if (v122 < 0)
                  {
                    v118 += 7;
                    BOOL v10 = v119++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_288;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_288:
              uint64_t v153 = 152;
              goto LABEL_293;
            case 0x17u:
              char v123 = 0;
              unsigned int v124 = 0;
              uint64_t v17 = 0;
              *(_DWORD *)(a1 + 172) |= 0x8000u;
              while (2)
              {
                uint64_t v125 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v126 = v125 + 1;
                if (v125 == -1 || v126 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v127 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v125);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v126;
                  v17 |= (unint64_t)(v127 & 0x7F) << v123;
                  if (v127 < 0)
                  {
                    v123 += 7;
                    BOOL v10 = v124++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_292;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_292:
              uint64_t v153 = 148;
LABEL_293:
              *(_DWORD *)(a1 + v153) = v17;
              goto LABEL_342;
            case 0x18u:
              char v128 = 0;
              unsigned int v129 = 0;
              uint64_t v130 = 0;
              *(_DWORD *)(a1 + 172) |= 0x2000000u;
              while (2)
              {
                uint64_t v131 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v132 = v131 + 1;
                if (v131 == -1 || v132 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v133 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v131);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v132;
                  v130 |= (unint64_t)(v133 & 0x7F) << v128;
                  if (v133 < 0)
                  {
                    v128 += 7;
                    BOOL v10 = v129++ >= 9;
                    if (v10)
                    {
                      uint64_t v130 = 0;
                      goto LABEL_297;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v130 = 0;
              }
LABEL_297:
              BOOL v154 = v130 != 0;
              uint64_t v155 = 167;
              goto LABEL_306;
            case 0x19u:
              *(_DWORD *)(a1 + 172) |= 0x1000u;
              unint64_t v134 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v134 <= 0xFFFFFFFFFFFFFFFBLL && v134 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v134);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v134 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                int v22 = 0;
              }
              uint64_t v169 = 136;
              goto LABEL_336;
            case 0x1Au:
              *(_DWORD *)(a1 + 172) |= 0x800u;
              unint64_t v135 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v135 <= 0xFFFFFFFFFFFFFFFBLL && v135 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v135);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v135 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                int v22 = 0;
              }
              uint64_t v169 = 132;
              goto LABEL_336;
            case 0x1Bu:
              if (v13 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (1)
                {
                  long long v136 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v137 = *v136;
                  unint64_t v138 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
                  if (*v136 >= v138 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                    break;
                  }
                  if (v137 > 0xFFFFFFFFFFFFFFFBLL || v137 + 4 > v138) {
                    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                  }
                  else {
                    *long long v136 = v137 + 4;
                  }
                  PBRepeatedFloatAdd();
                }
LABEL_200:
                PBReaderRecallMark();
              }
              else
              {
                unint64_t v168 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                if (v168 <= 0xFFFFFFFFFFFFFFFBLL && v168 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v168 + 4;
                }
                else {
                  *(unsigned char *)(a2 + v11) = 1;
                }
                PBRepeatedFloatAdd();
              }
LABEL_342:
              if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
              }
              continue;
            case 0x1Cu:
              *(_DWORD *)(a1 + 172) |= 0x10u;
              unint64_t v139 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v139 <= 0xFFFFFFFFFFFFFFFBLL && v139 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v139);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v139 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                int v22 = 0;
              }
              uint64_t v169 = 104;
LABEL_336:
              *(_DWORD *)(a1 + v169) = v22;
              goto LABEL_342;
            case 0x1Du:
              char v140 = 0;
              unsigned int v141 = 0;
              uint64_t v142 = 0;
              *(_DWORD *)(a1 + 172) |= 0x200000u;
              while (2)
              {
                uint64_t v143 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v144 = v143 + 1;
                if (v143 == -1 || v144 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v145 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v143);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v144;
                  v142 |= (unint64_t)(v145 & 0x7F) << v140;
                  if (v145 < 0)
                  {
                    v140 += 7;
                    BOOL v10 = v141++ >= 9;
                    if (v10)
                    {
                      uint64_t v142 = 0;
                      goto LABEL_301;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v142 = 0;
              }
LABEL_301:
              BOOL v154 = v142 != 0;
              uint64_t v155 = 163;
              goto LABEL_306;
            case 0x1Eu:
              *(_DWORD *)(a1 + 172) |= 1u;
              unint64_t v146 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v146 <= 0xFFFFFFFFFFFFFFF7 && v146 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                uint64_t v89 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v146);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v146 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                uint64_t v89 = 0;
              }
              uint64_t v170 = 80;
LABEL_339:
              *(void *)(a1 + v170) = v89;
              goto LABEL_342;
            case 0x1Fu:
              char v147 = 0;
              unsigned int v148 = 0;
              uint64_t v149 = 0;
              *(_DWORD *)(a1 + 172) |= 0x100000u;
              while (2)
              {
                uint64_t v150 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v151 = v150 + 1;
                if (v150 == -1 || v151 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v152 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v150);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v151;
                  v149 |= (unint64_t)(v152 & 0x7F) << v147;
                  if (v152 < 0)
                  {
                    v147 += 7;
                    BOOL v10 = v148++ >= 9;
                    if (v10)
                    {
                      uint64_t v149 = 0;
                      goto LABEL_305;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v149 = 0;
              }
LABEL_305:
              BOOL v154 = v149 != 0;
              uint64_t v155 = 162;
LABEL_306:
              *(unsigned char *)(a1 + v155) = v154;
              goto LABEL_342;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_342;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10001BC10(uint64_t a1, uint64_t a2)
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
      uint64_t v18 = objc_alloc_init(NCCameraStateChangedRequest);
      objc_storeStrong((id *)(a1 + 16), v18);
      if (!PBReaderPlaceMark() || (sub_10001802C((uint64_t)v18, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if (v12 == 2)
    {
      char v19 = 0;
      unsigned int v20 = 0;
      uint64_t v21 = 0;
      *(unsigned char *)(a1 + 28) |= 2u;
      while (1)
      {
        unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v22 == -1 || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
        v21 |= (unint64_t)(v23 & 0x7F) << v19;
        if ((v23 & 0x80) == 0) {
          goto LABEL_44;
        }
        v19 += 7;
        BOOL v9 = v20++ >= 9;
        if (v9)
        {
          uint64_t v21 = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v21 = 0;
      }
LABEL_46:
      *(unsigned char *)(a1 + 24) = v21 != 0;
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
          LODWORD(v15) = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v15) = 0;
      }
LABEL_42:
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v15;
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

id sub_10001C3D8()
{
  if (qword_10003B740 != -1) {
    dispatch_once(&qword_10003B740, &stru_100030D18);
  }
  v0 = (void *)qword_10003B738;
  return v0;
}

void sub_10001C42C(id a1)
{
  qword_10003B738 = (uint64_t)os_log_create("com.apple.NanoCamera", "app");
  _objc_release_x1();
}

id sub_10001C470()
{
  if (qword_10003B750 != -1) {
    dispatch_once(&qword_10003B750, &stru_100030D38);
  }
  v0 = (void *)qword_10003B748;
  return v0;
}

void sub_10001C4C4(id a1)
{
  qword_10003B748 = (uint64_t)os_log_create("com.apple.NanoCamera", "control");
  _objc_release_x1();
}

id sub_10001C508()
{
  if (qword_10003B760 != -1) {
    dispatch_once(&qword_10003B760, &stru_100030D58);
  }
  v0 = (void *)qword_10003B758;
  return v0;
}

void sub_10001C55C(id a1)
{
  qword_10003B758 = (uint64_t)os_log_create("com.apple.NanoCamera", "preview");
  _objc_release_x1();
}

void *sub_10001CBB8(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkConnectedDevice];
  uint64_t result = *(void **)(a1 + 32);
  if (!result[9])
  {
    return [result _notifyDidChangeConnectedState];
  }
  return result;
}

void sub_10001D33C(uint64_t a1)
{
  unsigned __int16 v29 = (unsigned __int16)[*(id *)(a1 + 32) messageID];
  unsigned __int8 v30 = [*(id *)(a1 + 32) priority];
  id v2 = [*(id *)(a1 + 32) data];
  uint64_t v3 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[v2 length] + 3);

  [v3 appendBytes:&v29 length:3];
  char v4 = [*(id *)(a1 + 32) data];
  id v5 = [v4 length];

  if (v5)
  {
    unint64_t v6 = [*(id *)(a1 + 32) data];
    [v3 appendData:v6];
  }
  id v7 = [*(id *)(a1 + 32) priority];
  uint64_t v8 = 300;
  if (v7 == (id)1) {
    uint64_t v8 = 200;
  }
  if (v7 == (id)2) {
    uint64_t v9 = 100;
  }
  else {
    uint64_t v9 = v8;
  }
  int v10 = +[NSMutableDictionary dictionary];
  [*(id *)(a1 + 32) sendTimeout];
  if (v11 > 0.0)
  {
    [*(id *)(a1 + 32) sendTimeout];
    unint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v10 setObject:v12 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
  }
  char v13 = [*(id *)(a1 + 32) responseHandler];

  if (v13) {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
  }
  if ([*(id *)(a1 + 32) doNotCompress]) {
    [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionCompressPayloadKey];
  }
  if ([*(id *)(a1 + 32) fireAndForget]) {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  }
  if ([*(id *)(a1 + 32) queueOnly1])
  {
    unsigned int v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%hu", [*(id *)(a1 + 32) messageID]);
    [v10 setObject:v14 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
  }
  uint64_t v15 = *(void **)(*(void *)(a1 + 40) + 16);
  unint64_t v16 = [v15 accounts];
  char v17 = [v16 anyObject];
  uint64_t v18 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v27 = 0;
  id v28 = 0;
  [v15 sendData:v3 fromAccount:v17 toDestinations:v18 priority:v9 options:v10 identifier:&v28 error:&v27];
  id v19 = v28;
  id v20 = v27;

  [*(id *)(a1 + 32) setMessageCenter:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setIdsIdentifier:v19];
  uint64_t v21 = sub_10001C470();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = [*(id *)(a1 + 32) messageID];
    id v23 = [v3 length];
    *(_DWORD *)buf = 67109634;
    unsigned int v32 = v22;
    __int16 v33 = 2048;
    id v34 = v23;
    __int16 v35 = 2112;
    id v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sent request ID %hu of size %tu. IDS Identifier %@", buf, 0x1Cu);
  }

  if (v19)
  {
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:*(void *)(a1 + 32) forKeyedSubscript:v19];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
      [v26 messageCenter:*(void *)(a1 + 40) didResolveIDSIdentifierForRequest:*(void *)(a1 + 32)];
    }
  }
  if (v20) {
    [*(id *)(a1 + 40) _handleError:v20 forRequest:*(void *)(a1 + 32)];
  }
  else {
    [*(id *)(a1 + 32) startReplyTimer];
  }
}

void sub_10001D910(id *a1)
{
  id v2 = [a1[4] request];
  unsigned __int16 v28 = (unsigned __int16)[v2 messageID];

  uint64_t v3 = [a1[4] data];
  char v4 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[v3 length] + 2);

  [v4 appendBytes:&v28 length:2];
  id v5 = [a1[4] data];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = [a1[4] data];
    [v4 appendData:v7];
  }
  id v8 = [a1[4] priority];
  uint64_t v9 = 300;
  if (v8 == (id)1) {
    uint64_t v9 = 200;
  }
  if (v8 == (id)2) {
    uint64_t v10 = 100;
  }
  else {
    uint64_t v10 = v9;
  }
  double v11 = +[NSMutableDictionary dictionary];
  [a1[4] sendTimeout];
  if (v12 > 0.0)
  {
    [a1[4] sendTimeout];
    char v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v13 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  }
  unsigned int v14 = [a1[5] idsIdentifier];
  [v11 setObject:v14 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];

  if ([a1[4] doNotCompress]) {
    [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionCompressPayloadKey];
  }
  if ([a1[4] fireAndForget]) {
    [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  }
  uint64_t v15 = (void *)*((void *)a1[6] + 2);
  unint64_t v16 = [v15 accounts];
  char v17 = [v16 anyObject];
  uint64_t v18 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v26 = 0;
  id v27 = 0;
  [v15 sendData:v4 fromAccount:v17 toDestinations:v18 priority:v10 options:v11 identifier:&v27 error:&v26];
  id v19 = v27;
  id v20 = v26;

  [a1[4] setIdsIdentifier:v19];
  uint64_t v21 = sub_10001C470();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = [a1[4] request];
    unsigned int v23 = [v22 messageID];
    id v24 = [v4 length];
    char v25 = [a1[5] idsIdentifier];
    *(_DWORD *)buf = 67109890;
    unsigned int v30 = v23;
    __int16 v31 = 2048;
    id v32 = v24;
    __int16 v33 = 2112;
    id v34 = v25;
    __int16 v35 = 2112;
    id v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sent response ID %hu of size %tu to %@. IDS Identifier %@", buf, 0x26u);
  }
  if (v19) {
    [*((id *)a1[6] + 5) setObject:a1[5] forKeyedSubscript:v19];
  }
  if (v20) {
    [a1[6] _handleError:v20 forResponse:a1[4]];
  }
}

double sub_10001E5AC()
{
  if (qword_10003B768 != -1) {
    dispatch_once(&qword_10003B768, &stru_100030E20);
  }
  return *(double *)&qword_10003B770 * (double)mach_absolute_time();
}

void sub_10001E694(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [*(id *)(a1 + 40) idsIdentifier];
  [v1 removeObjectForKey:v2];
}

id sub_10001E794(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "allValues", 0);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) invalidateReplyTimer];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
}

void sub_10001ED6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _replyTimerDidTimeout];
}

void sub_10001EF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001EF78(uint64_t a1, void *a2)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained messageCenter];
  uint64_t v5 = objc_msgSend(v4, "_pbMappingForMessageID:", objc_msgSend(WeakRetained, "messageID"));
  id v6 = (objc_class *)[v5 responseClass];

  if (!v6)
  {
    long long v9 = [WeakRetained messageCenter];
    NSLog(@"%@: Unmapped PB request/response pairing for messageID: %hu", v9, [WeakRetained messageID]);

    long long v10 = [WeakRetained errorHandler];

    if (!v10) {
      goto LABEL_11;
    }
    id v7 = [WeakRetained errorHandler];
    long long v11 = +[NSError errorWithDomain:@"NMSErrorDomain" code:5 userInfo:0];
    v7[2](v7, v11);
    goto LABEL_9;
  }
  id v7 = (void (**)(id, void))[[v6 alloc] initWithData:v14];
  if (v7)
  {
    uint64_t v8 = WeakRetained[2];
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v7);
    }
    goto LABEL_10;
  }
  double v12 = [WeakRetained errorHandler];

  if (v12)
  {
    long long v11 = [WeakRetained errorHandler];
    char v13 = +[NSError errorWithDomain:@"NMSErrorDomain" code:4 userInfo:0];
    ((void (**)(void, void *))v11)[2](v11, v13);

LABEL_9:
  }
LABEL_10:

LABEL_11:
}

void sub_10001FAA0(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_10003B770 = (double)v1 / (double)v2 * 0.000000001;
}

uint64_t sub_10001FDAC(uint64_t a1, uint64_t a2)
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
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v14;
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

uint64_t sub_100020494(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 2)
    {
      char v17 = objc_alloc_init(NCCameraStateChangedRequest);
      objc_storeStrong((id *)(a1 + 8), v17);
      if (!PBReaderPlaceMark() || (sub_10001802C((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
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
          goto LABEL_32;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_34;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_34:
      *(_DWORD *)(a1 + 16) = v14;
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

uint64_t sub_100020D78(uint64_t a1, uint64_t a2)
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
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v14;
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

uint64_t sub_10002140C(uint64_t a1, uint64_t a2)
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
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v14;
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

uint64_t sub_100021C94(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v3 = 0;
    unsigned int v4 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v6 == -1 || v6 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v7 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v6);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v6 + 1;
      v5 |= (unint64_t)(v7 & 0x7F) << v3;
      if ((v7 & 0x80) == 0) {
        goto LABEL_11;
      }
      v3 += 7;
      BOOL v8 = v4++ >= 9;
      if (v8)
      {
        unint64_t v5 = 0;
        int v9 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v9 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v5 = 0;
    }
LABEL_13:
    int v10 = v5 & 7;
    if (v9 || v10 == 4) {
      break;
    }
    if ((v5 >> 3) == 1)
    {
      if (v10 == 2)
      {
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length)
             && !*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
        {
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0;
          while (1)
          {
            unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if (v17 < 0)
            {
              v13 += 7;
              BOOL v8 = v14++ >= 9;
              if (!v8) {
                continue;
              }
            }
            goto LABEL_30;
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
          PBRepeatedInt32Add();
        }
        PBReaderRecallMark();
      }
      else
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
          v20 |= (unint64_t)(v22 & 0x7F) << v18;
          if (v22 < 0)
          {
            v18 += 7;
            BOOL v8 = v19++ >= 9;
            if (!v8) {
              continue;
            }
          }
          goto LABEL_42;
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_42:
        PBRepeatedInt32Add();
      }
    }
    else if ((PBReaderSkipValueWithTag() & 1) == 0)
    {
      return 0;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_1000224A4(uint64_t a1, uint64_t a2)
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
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = v14 != 0;
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

uint64_t sub_100022B58(uint64_t a1, uint64_t a2)
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
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v14;
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

uint64_t sub_1000230E4(uint64_t a1, uint64_t a2)
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
          uint64_t v14 = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0;
      }
LABEL_30:
      *(unsigned char *)(a1 + _Block_object_dispose(&a9, 8) = v14 != 0;
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

uint64_t sub_100023748(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v3 = 0;
    unsigned int v4 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v7 = v6 + 1;
      if (v6 == -1 || v7 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v6);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7;
      v5 |= (unint64_t)(v8 & 0x7F) << v3;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v3 += 7;
      if (v4++ >= 9)
      {
        unint64_t v5 = 0;
        uint64_t v10 = OBJC_IVAR___PBDataReader__error;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    uint64_t v10 = OBJC_IVAR___PBDataReader__error;
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v5 = 0;
    }
LABEL_13:
    int v12 = v5 & 7;
    if (v11 || v12 == 4) {
      break;
    }
    if ((v5 >> 3) == 1)
    {
      if (v12 == 2)
      {
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (1)
        {
          unint64_t v15 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v16 = *v15;
          unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
          if (*v15 >= v17 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            break;
          }
          if (v16 > 0xFFFFFFFFFFFFFFFBLL || v16 + 4 > v17) {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else {
            *unint64_t v15 = v16 + 4;
          }
          PBRepeatedFloatAdd();
        }
        PBReaderRecallMark();
      }
      else
      {
        unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v18 <= 0xFFFFFFFFFFFFFFFBLL && v18 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 4;
        }
        else {
          *(unsigned char *)(a2 + v10) = 1;
        }
        PBRepeatedFloatAdd();
      }
    }
    else if ((PBReaderSkipValueWithTag() & 1) == 0)
    {
      return 0;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100023DA4(uint64_t a1, uint64_t a2)
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
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      *(unsigned char *)(a1 + 12) |= 1u;
      unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v13 <= 0xFFFFFFFFFFFFFFFBLL && v13 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 4;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        int v14 = 0;
      }
      *(_DWORD *)(a1 + _Block_object_dispose(&a9, 8) = v14;
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

void sub_1000241B0()
{
  sub_10001492C();
  sub_100014910((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_100024218(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100024288()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_1000242AC(v0);
}

void sub_1000242AC()
{
  sub_100014954();
  sub_100014938((void *)&_mh_execute_header, v0, v1, "Remote camera is not active, ignoring send message.", v2, v3, v4, v5, v6);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterPlaceMark()
{
  return _PBDataWriterPlaceMark();
}

uint64_t PBDataWriterRecallMark()
{
  return _PBDataWriterRecallMark();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PBRepeatedFloatAdd()
{
  return _PBRepeatedFloatAdd();
}

uint64_t PBRepeatedFloatClear()
{
  return _PBRepeatedFloatClear();
}

uint64_t PBRepeatedFloatCopy()
{
  return _PBRepeatedFloatCopy();
}

uint64_t PBRepeatedFloatHash()
{
  return _PBRepeatedFloatHash();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return _PBRepeatedFloatIsEqual();
}

uint64_t PBRepeatedFloatNSArray()
{
  return _PBRepeatedFloatNSArray();
}

uint64_t PBRepeatedInt32Add()
{
  return _PBRepeatedInt32Add();
}

uint64_t PBRepeatedInt32Clear()
{
  return _PBRepeatedInt32Clear();
}

uint64_t PBRepeatedInt32Copy()
{
  return _PBRepeatedInt32Copy();
}

uint64_t PBRepeatedInt32Hash()
{
  return _PBRepeatedInt32Hash();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return _PBRepeatedInt32IsEqual();
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

uint64_t SBSLockDevice()
{
  return _SBSLockDevice();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__checkConnectedDevice(void *a1, const char *a2, ...)
{
  return [a1 _checkConnectedDevice];
}

id objc_msgSend__notifyDidChangeConnectedState(void *a1, const char *a2, ...)
{
  return [a1 _notifyDidChangeConnectedState];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend__replyTimerDidTimeout(void *a1, const char *a2, ...)
{
  return [a1 _replyTimerDidTimeout];
}

id objc_msgSend__sendCurrentCameraState(void *a1, const char *a2, ...)
{
  return [a1 _sendCurrentCameraState];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_acknowledge(void *a1, const char *a2, ...)
{
  return [a1 acknowledge];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionQ(void *a1, const char *a2, ...)
{
  return [a1 actionQ];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return [a1 captureDevice];
}

id objc_msgSend_captureMode(void *a1, const char *a2, ...)
{
  return [a1 captureMode];
}

id objc_msgSend_capturing(void *a1, const char *a2, ...)
{
  return [a1 capturing];
}

id objc_msgSend_clearPoints(void *a1, const char *a2, ...)
{
  return [a1 clearPoints];
}

id objc_msgSend_clearSignificantZoomMagnifications(void *a1, const char *a2, ...)
{
  return [a1 clearSignificantZoomMagnifications];
}

id objc_msgSend_clearSupportedCaptureDevices(void *a1, const char *a2, ...)
{
  return [a1 clearSupportedCaptureDevices];
}

id objc_msgSend_clearSupportedCaptureModes(void *a1, const char *a2, ...)
{
  return [a1 clearSupportedCaptureModes];
}

id objc_msgSend_configureResponse(void *a1, const char *a2, ...)
{
  return [a1 configureResponse];
}

id objc_msgSend_connectedDevice(void *a1, const char *a2, ...)
{
  return [a1 connectedDevice];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_countdown(void *a1, const char *a2, ...)
{
  return [a1 countdown];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didSendHandler(void *a1, const char *a2, ...)
{
  return [a1 didSendHandler];
}

id objc_msgSend_doNotCompress(void *a1, const char *a2, ...)
{
  return [a1 doNotCompress];
}

id objc_msgSend_errorHandler(void *a1, const char *a2, ...)
{
  return [a1 errorHandler];
}

id objc_msgSend_expectsPeerResponse(void *a1, const char *a2, ...)
{
  return [a1 expectsPeerResponse];
}

id objc_msgSend_fireAndForget(void *a1, const char *a2, ...)
{
  return [a1 fireAndForget];
}

id objc_msgSend_flashMode(void *a1, const char *a2, ...)
{
  return [a1 flashMode];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hdrMode(void *a1, const char *a2, ...)
{
  return [a1 hdrMode];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsIdentifier];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalState(void *a1, const char *a2, ...)
{
  return [a1 internalState];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateReplyTimer(void *a1, const char *a2, ...)
{
  return [a1 invalidateReplyTimer];
}

id objc_msgSend_irisMode(void *a1, const char *a2, ...)
{
  return [a1 irisMode];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isSent(void *a1, const char *a2, ...)
{
  return [a1 isSent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_messageCenter(void *a1, const char *a2, ...)
{
  return [a1 messageCenter];
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return [a1 messageID];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersion];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pbRequest(void *a1, const char *a2, ...)
{
  return [a1 pbRequest];
}

id objc_msgSend_points(void *a1, const char *a2, ...)
{
  return [a1 points];
}

id objc_msgSend_pointsCount(void *a1, const char *a2, ...)
{
  return [a1 pointsCount];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_queueOnly1(void *a1, const char *a2, ...)
{
  return [a1 queueOnly1];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestClass(void *a1, const char *a2, ...)
{
  return [a1 requestClass];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseClass(void *a1, const char *a2, ...)
{
  return [a1 responseClass];
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return [a1 responseHandler];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_send(void *a1, const char *a2, ...)
{
  return [a1 send];
}

id objc_msgSend_sendTimeout(void *a1, const char *a2, ...)
{
  return [a1 sendTimeout];
}

id objc_msgSend_sharedLibraryMode(void *a1, const char *a2, ...)
{
  return [a1 sharedLibraryMode];
}

id objc_msgSend_showingLivePreview(void *a1, const char *a2, ...)
{
  return [a1 showingLivePreview];
}

id objc_msgSend_significantZoomMagnificationsCount(void *a1, const char *a2, ...)
{
  return [a1 significantZoomMagnificationsCount];
}

id objc_msgSend_startReplyTimer(void *a1, const char *a2, ...)
{
  return [a1 startReplyTimer];
}

id objc_msgSend_supportedCaptureDevicesCount(void *a1, const char *a2, ...)
{
  return [a1 supportedCaptureDevicesCount];
}

id objc_msgSend_supportedCaptureModesCount(void *a1, const char *a2, ...)
{
  return [a1 supportedCaptureModesCount];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeSinceLastDataReceived(void *a1, const char *a2, ...)
{
  return [a1 timeSinceLastDataReceived];
}

id objc_msgSend_zoomAmount(void *a1, const char *a2, ...)
{
  return [a1 zoomAmount];
}

id objc_msgSend_zoomMagnificationAmount(void *a1, const char *a2, ...)
{
  return [a1 zoomMagnificationAmount];
}