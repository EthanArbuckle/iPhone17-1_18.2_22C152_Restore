@interface NSString(TDStringExtensions)
- (uint64_t)td_stringByStandardizingPath;
@end

@implementation NSString(TDStringExtensions)

- (uint64_t)td_stringByStandardizingPath
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v41 = [a1 length];
  objc_msgSend((id)objc_msgSend(a1, "stringByExpandingTildeInPath"), "getCharacters:range:", &v42, 0, v41);
  __CUITransmutePathSlashes(&v42, &v41);
  uint64_t v2 = v41;
  if (v41 < 2)
  {
    BOOL v4 = 0;
  }
  else if (v43[v41 - 2] == 47)
  {
    while ((unint64_t)v2 > 2)
    {
      int v3 = *((unsigned __int16 *)&v41 + v2-- + 2);
      if (v3 != 47) {
        goto LABEL_5;
      }
    }
    BOOL v4 = 0;
    uint64_t v2 = 1;
  }
  else
  {
LABEL_5:
    BOOL v4 = 0;
    if (v2 >= 2 && v42 == 92) {
      BOOL v4 = v43[0] == 92;
    }
  }
  int HasDotDot = _pathHasDotDot(&v42, v2, v4);
  uint64_t v6 = -2 * v2;
  do
  {
    uint64_t v7 = v2;
    uint64_t v8 = v6;
    if (v4)
    {
      if (v2 <= 4)
      {
        uint64_t v41 = v2;
LABEL_18:
        uint64_t v11 = 3;
        goto LABEL_28;
      }
    }
    else if (v2 < 3)
    {
      uint64_t v41 = v2;
      if (v2 != 2) {
        goto LABEL_101;
      }
      goto LABEL_20;
    }
    v9 = &v43[v2 - 1];
    if (*(v9 - 2) != 47) {
      break;
    }
    int v10 = (unsigned __int16)*(v9 - 1);
    uint64_t v6 = v8 + 4;
    v2 -= 2;
  }
  while (v10 == 46);
  uint64_t v41 = v7;
  if (v4) {
    goto LABEL_18;
  }
LABEL_20:
  if (v43[0] == 47)
  {
    uint64_t v12 = 0;
    while (v43[v12 - 1] == 46)
    {
      uint64_t v13 = v12 + 2;
      int v14 = (unsigned __int16)v44[v12];
      v12 += 2;
      if (v14 != 47) {
        goto LABEL_26;
      }
    }
    uint64_t v13 = v12;
    if (!v12) {
      goto LABEL_27;
    }
LABEL_26:
    v7 -= v13;
    uint64_t v41 = v7;
    __memmove_chk();
  }
LABEL_27:
  uint64_t v11 = 0;
LABEL_28:
  if (v7 >= 3 && v11 < v7 - 2)
  {
    do
    {
      v15 = &v43[v11 - 1];
      if (*v15 == 47 && v15[1] == 46 && v43[v11 + 1] == 47)
      {
        memmove(v15 + 1, v15 + 3, 2 * (v7 - v11) - 6);
        v7 -= 2;
        --v11;
      }
      if (v7 < 3) {
        break;
      }
      ++v11;
    }
    while (v11 < v7 - 2);
    uint64_t v41 = v7;
  }
  if (v7 > 2) {
    int v16 = HasDotDot;
  }
  else {
    int v16 = 0;
  }
  if (v16 == 1)
  {
    v39 = v44;
    uint64_t v17 = v7;
    BOOL v40 = v4;
    do
    {
      if (v4)
      {
        uint64_t v18 = 3;
        if ((unint64_t)v17 >= 4)
        {
          while (v43[v18 - 1] != 47)
          {
            if (v17 == ++v18)
            {
              uint64_t v18 = v17;
              break;
            }
          }
        }
        if (v17 <= v18 + 1) {
          uint64_t v19 = v18 + 1;
        }
        else {
          uint64_t v19 = v17;
        }
        while (1)
        {
          uint64_t v20 = v18 + 1;
          if (v18 + 1 >= v17) {
            break;
          }
          int v21 = (unsigned __int16)v43[v18++];
          if (v21 == 47) {
            goto LABEL_55;
          }
        }
        uint64_t v20 = v19;
      }
      else
      {
        uint64_t v20 = 0;
      }
LABEL_55:
      uint64_t v22 = v17 - 2;
      BOOL v23 = v17 > 2;
      if (v17 < 3 || v20 >= v22)
      {
        uint64_t v25 = v7;
        uint64_t v26 = v17;
        uint64_t v27 = v17;
      }
      else
      {
        v24 = &v43[v20 - 1];
        uint64_t v25 = v7;
        uint64_t v26 = v17;
        uint64_t v27 = v17;
        do
        {
          if ((unint64_t)v27 >= 4
            && v20 < v27 - 4
            && *v24 == 47
            && v43[v20] == 46
            && v43[v20 + 1] == 46
            && v43[v20 + 2] == 47)
          {
            memmove(v24 + 1, v24 + 4, 2 * (v27 - v20) - 8);
            v25 -= 3;
            uint64_t v26 = v25;
            uint64_t v27 = v25;
            uint64_t v28 = v20 - 1;
          }
          else
          {
            uint64_t v28 = v20;
          }
          if (v27 >= 3 && v28 == v27 - 3 && v43[v28 - 1] == 47)
          {
            v29 = &v43[v28 - 1];
            if (v29[1] == 46 && v29[2] == 46)
            {
              uint64_t v25 = v27 - 2;
              uint64_t v26 = v27 - 2;
              v27 -= 2;
            }
          }
          uint64_t v22 = v27 - 2;
          BOOL v23 = v27 > 2;
          if (v27 < 3) {
            break;
          }
          uint64_t v30 = v28 + 1;
          if (v30 >= v22) {
            break;
          }
        }
        while (v20 == v30);
      }
      if (v23)
      {
        BOOL v4 = v40;
        if (v20 < v27)
        {
          do
          {
            uint64_t v7 = v20 + 1;
            if (v20 + 1 >= v22) {
              break;
            }
            uint64_t v31 = 0;
            v32 = &v44[v20];
            size_t v33 = 2 * (v27 - 5 - v20);
            while (*(v32 - 2) != 47)
            {
              ++v32;
              ++v31;
              v33 -= 2;
              if (!(1 - v22 + v20 + v31)) {
                goto LABEL_94;
              }
            }
            uint64_t v34 = v20 + v31 + 1;
            if (v27 >= 4 && v34 < v27 - 4 && *(v32 - 1) == 46 && *v32 == 46 && v32[1] == 47)
            {
              uint64_t v7 = v27 - v31 - 4;
              memmove(&v43[v20], v32 + 2, v33);
              uint64_t v17 = v7;
              goto LABEL_96;
            }
            if (!(v20 + v31 + 4 - v27) && *(&v42 + v27 - 3) == 47 && *(&v42 + v27 - 2) == 46)
            {
              uint64_t v17 = v20 + 1;
              if (*(&v42 + v27 - 1) == 46) {
                goto LABEL_96;
              }
            }
            v20 += v31 + 1;
          }
          while (v34 < v27);
        }
LABEL_94:
        uint64_t v7 = v25;
        uint64_t v17 = v26;
      }
      else
      {
        uint64_t v7 = v25;
        uint64_t v17 = v26;
        BOOL v4 = v40;
      }
LABEL_96:
      char v35 = _pathHasDotDot(&v42, v17, v4);
    }
    while (v17 >= 3 && (v35 & 1) != 0);
    uint64_t v41 = v7;
  }
LABEL_101:
  __CUITransmutePathSlashes(&v42, &v41);
  unint64_t v36 = v41;
  if (v41 >= 2 && v43[v41 - 2] == 47)
  {
    while (v36 > 2)
    {
      int v37 = *((unsigned __int16 *)&v41 + v36-- + 2);
      if (v37 != 47) {
        return objc_msgSend(NSString, "stringWithCharacters:length:", &v42, v36, v39);
      }
    }
    unint64_t v36 = 1;
  }
  return objc_msgSend(NSString, "stringWithCharacters:length:", &v42, v36, v39);
}

@end