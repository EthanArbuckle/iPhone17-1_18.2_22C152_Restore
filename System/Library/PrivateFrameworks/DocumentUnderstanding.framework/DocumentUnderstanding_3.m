void sub_23694B63C(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  char *v13;
  unint64_t v14;
  int *v15;
  int *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t vars8;

  if (*(unsigned __int16 *)(a1 + 8) <= 0x100u)
  {
    v4 = *(unsigned __int16 *)(a2 + 8);
    v5 = *(char **)(a1 + 16);
    v6 = *(unsigned __int16 *)(a1 + 10);
    v7 = &v5[32 * v6];
    v8 = *(void *)(a2 + 16);
    if (v4 > 0x100)
    {
      v14 = sub_23694B994(v5, v7, *(void **)v8, (void *)(v8 + 8));
    }
    else
    {
      v9 = *(unsigned __int16 *)(a2 + 10);
      v10 = v8 + 32 * v9;
      v12 = v6 == 0;
      v11 = 0;
      v12 = v12 || v9 == 0;
      if (!v12)
      {
        do
        {
          if (*(_DWORD *)v5 == *(_DWORD *)v8) {
            v13 = v5 + 32;
          }
          else {
            v13 = v5;
          }
          if (*(_DWORD *)v5 < *(_DWORD *)v8)
          {
            v5 += 32;
          }
          else
          {
            v8 += 32;
            v5 = v13;
          }
          ++v11;
        }
        while (v5 != v7 && v8 != v10);
      }
      v14 = v11 + ((v10 - v8) >> 5) + ((v7 - v5) >> 5);
    }
    sub_23694B76C((void *)a1, v14);
  }
  v15 = *(int **)(a2 + 16);
  if (*(unsigned __int16 *)(a2 + 8) >= 0x101u)
  {
    v19 = *(void **)v15;
    sub_236951D08(v19, (void *)v15 + 1, (uint64_t *)a1);
  }
  else if (*(_WORD *)(a2 + 10))
  {
    v16 = &v15[8 * *(unsigned __int16 *)(a2 + 10)];
    do
    {
      v17 = v15 + 2;
      v18 = *v15;
      v15 += 8;
      sub_23694BA9C((uint64_t *)a1, v18, v17);
    }
    while (v15 != v16);
  }
}

void *sub_23694B76C(void *result, unint64_t a2)
{
  unint64_t v2 = *((unsigned __int16 *)result + 4);
  if (v2 <= 0x100 && v2 < a2)
  {
    v4 = result;
    do
    {
      if ((_WORD)v2) {
        LOWORD(v2) = 4 * v2;
      }
      else {
        LOWORD(v2) = 1;
      }
    }
    while ((unsigned __int16)v2 < a2);
    v5 = (char *)result[2];
    uint64_t v6 = *((unsigned __int16 *)result + 5);
    v7 = (uint64_t *)*result;
    if ((unsigned __int16)v2 < 0x101u)
    {
      size_t v8 = 32 * (unsigned __int16)v2;
      if (v7)
      {
        if (v7[3])
        {
          (*(void (**)(void, void *, size_t))(**(void **)(v7[4] + 32) + 40))(*(void *)(v7[4] + 32), &unk_26E9CE848, v8);
          size_t v8 = 32 * (unsigned __int16)v2;
        }
        result = (void *)sub_236945A60(v7, v8);
      }
      else
      {
        result = operator new[](v8);
      }
      v9 = (uint64_t **)result;
      if (v6) {
        result = memmove(result, v5, 32 * v6);
      }
    }
    else
    {
      if (!v7) {
        operator new();
      }
      if (v7[3]) {
        (*(void (**)(void, void *, uint64_t))(**(void **)(v7[4] + 32) + 40))(*(void *)(v7[4] + 32), &unk_26E9CE928, 24);
      }
      result = (void *)sub_236945764(v7, 0x18uLL, (uint64_t)sub_23695244C);
      v9 = (uint64_t **)result;
      result[1] = 0;
      v10 = result + 1;
      result[2] = 0;
      *result = result + 1;
      if (v6)
      {
        v11 = &v5[32 * v6];
        v12 = v5;
        do
        {
          int v15 = *(_DWORD *)v12;
          long long v13 = *(_OWORD *)(v12 + 8);
          uint64_t v17 = *((void *)v12 + 3);
          long long v16 = v13;
          result = sub_236952454(v9, v10, &v15, &v15);
          v10 = result;
          v12 += 32;
        }
        while (v12 != v11);
      }
    }
    if (*v4) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v5 == 0;
    }
    if (!v14) {
      result = (void *)MEMORY[0x237E07550](v5, 0x1062C802AB6010CLL);
    }
    *((_WORD *)v4 + 4) = v2;
    v4[2] = v9;
    if ((unsigned __int16)v2 >= 0x101u) {
      *((_WORD *)v4 + 5) = 0;
    }
  }
  return result;
}

uint64_t sub_23694B994(char *a1, char *a2, void *a3, void *a4)
{
  uint64_t v4 = 0;
  if (a1 != a2 && a3 != a4)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *((_DWORD *)a3 + 8);
      if (*(_DWORD *)a1 >= v5)
      {
        if (*(_DWORD *)a1 == v5)
        {
          a1 += 32;
          uint64_t v6 = (void *)a3[1];
          if (v6)
          {
            do
            {
              a3 = v6;
              uint64_t v6 = (void *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              v7 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v7);
          }
        }
        else
        {
          size_t v8 = (void *)a3[1];
          if (v8)
          {
            do
            {
              a3 = v8;
              size_t v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              v9 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v9);
          }
        }
      }
      else
      {
        a1 += 32;
      }
      ++v4;
    }
    while (a1 != a2 && a3 != a4);
  }
  if (a3 == a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      v11 = (void *)a3[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (void *)a3[2];
          BOOL v13 = *v12 == (void)a3;
          a3 = v12;
        }
        while (!v13);
      }
      ++v10;
      a3 = v12;
    }
    while (v12 != a4);
  }
  return v4 + ((a2 - a1) >> 5) + v10;
}

void sub_23694BA9C(uint64_t *a1, uint64_t a2, void *a3)
{
  if (!*((unsigned char *)a3 + 9))
  {
    if (*((unsigned char *)a3 + 10)) {
      return;
    }
    uint64_t v11 = *((unsigned __int8 *)a3 + 8);
    if ((v11 - 19) <= 0xFFFFFFED)
    {
      sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v12 = sub_23694710C(v63, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_236947248((uint64_t)&v62, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v63);
    }
    switch(v11)
    {
      case 1:
        sub_2369494F0((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), a3[2], *(double *)a3);
        return;
      case 2:
        sub_236948F84((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), a3[2], *(float *)a3);
        return;
      case 3:
      case 16:
      case 18:
        sub_236947F70((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *a3, a3[2]);
        return;
      case 4:
      case 6:
        sub_236948A28((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *a3, a3[2]);
        return;
      case 5:
      case 15:
      case 17:
        sub_236947A14((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
        return;
      case 7:
      case 13:
        sub_2369484CC((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
        return;
      case 8:
        sub_236949A5C((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(unsigned char *)a3, a3[2]);
        return;
      case 9:
      case 12:
        int v36 = *((unsigned __int8 *)a3 + 8);
        double v37 = *(double *)a3;
        if (*(char *)(*a3 + 23) < 0)
        {
          sub_23692B07C(__p, **(void ***)&v37, *(void *)(*(void *)&v37 + 8));
        }
        else
        {
          long long v38 = **(_OWORD **)&v37;
          uint64_t v61 = *(void *)(*(void *)&v37 + 16);
          *(_OWORD *)__p = v38;
        }
        sub_23694C860(a1, a2, v36, (__n128 *)__p, (uint64_t *)a3[2]);
        if (SHIBYTE(v61) < 0) {
          operator delete(__p[0]);
        }
        return;
      case 10:
      case 11:
        v39 = (uint64_t *)a3[2];
        v40 = sub_23694C980((uint64_t)a1, a2);
        v41 = v40;
        v40[2] = v39;
        if (v42)
        {
          *((unsigned char *)v40 + 8) = *((unsigned char *)a3 + 8);
          *((unsigned char *)v40 + 11) = *((unsigned char *)a3 + 11);
          *((unsigned char *)v40 + 9) = 0;
          char v43 = *((unsigned char *)v40 + 10) & 0xF;
          if ((*((unsigned char *)a3 + 10) & 0x10) == 0)
          {
            *((unsigned char *)v40 + 10) = v43;
            uint64_t v44 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, *a1);
            void *v41 = v44;
LABEL_120:
            (*(void (**)(uint64_t, void))(*(void *)v44 + 64))(v44, *a3);
            goto LABEL_126;
          }
          *((unsigned char *)v40 + 10) = v43 | 0x10;
          uint64_t v59 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 16))(*a3, *a1);
          void *v41 = v59;
          (*(void (**)(uint64_t, void))(*(void *)v59 + 104))(v59, *a3);
        }
        else
        {
          if (*((unsigned __int8 *)v40 + 8) != *((unsigned __int8 *)a3 + 8))
          {
            sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1026);
            v53 = sub_23694710C(v63, "CHECK failed: (extension->type) == (other_extension.type): ");
            sub_236947248((uint64_t)&v62, (const char **)&v53->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v63);
          }
          if (*((unsigned __int8 *)v41 + 11) != *((unsigned __int8 *)a3 + 11))
          {
            sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1027);
            v54 = sub_23694710C(v63, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
            sub_236947248((uint64_t)&v62, (const char **)&v54->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v63);
          }
          if (*((unsigned char *)v41 + 9))
          {
            sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1028);
            v55 = sub_23694710C(v63, "CHECK failed: !extension->is_repeated: ");
            sub_236947248((uint64_t)&v62, (const char **)&v55->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v63);
          }
          v56 = (uint64_t *)*v41;
          double v57 = *(double *)a3;
          if ((*((unsigned char *)a3 + 10) & 0x10) != 0)
          {
            if ((*((unsigned char *)v41 + 10) & 0x10) != 0)
            {
              (*(void (**)(void, double))(*v56 + 104))(*v41, COERCE_DOUBLE(*(void *)&v57));
              goto LABEL_126;
            }
            double v57 = COERCE_DOUBLE((*(uint64_t (**)(void, void))(**(void **)&v57 + 24))(*a3, *v41));
            uint64_t v58 = *v56;
          }
          else
          {
            uint64_t v58 = *v56;
            if ((*((unsigned char *)v41 + 10) & 0x10) != 0)
            {
              uint64_t v44 = (*(uint64_t (**)(void, double))(v58 + 32))(*v41, COERCE_DOUBLE(*(void *)&v57));
              goto LABEL_120;
            }
          }
          (*(void (**)(uint64_t *, double))(v58 + 64))(v56, COERCE_DOUBLE(*(void *)&v57));
        }
LABEL_126:
        *((unsigned char *)v41 + 10) &= 0xF0u;
        return;
      case 14:
        sub_23694A42C((uint64_t)a1, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, a3[2]);
        return;
      default:
        return;
    }
  }
  uint64_t v6 = (uint64_t *)a3[2];
  v7 = sub_23694C980((uint64_t)a1, a2);
  size_t v8 = (uint64_t *)v7;
  v7[2] = v6;
  uint64_t v10 = v9;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = *((unsigned char *)a3 + 8);
    *((unsigned char *)v7 + 11) = *((unsigned char *)a3 + 11);
    *((unsigned char *)v7 + 9) = 1;
  }
  else
  {
    if (*((unsigned __int8 *)v7 + 8) != *((unsigned __int8 *)a3 + 8))
    {
      sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 931);
      BOOL v13 = sub_23694710C(v63, "CHECK failed: (extension->type) == (other_extension.type): ");
      sub_236947248((uint64_t)&v62, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v63);
    }
    if (*((unsigned __int8 *)v8 + 11) != *((unsigned __int8 *)a3 + 11))
    {
      sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 932);
      BOOL v14 = sub_23694710C(v63, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
      sub_236947248((uint64_t)&v62, (const char **)&v14->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v63);
    }
    if (!*((unsigned char *)v8 + 9))
    {
      sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 933);
      int v15 = sub_23694710C(v63, "CHECK failed: extension->is_repeated: ");
      sub_236947248((uint64_t)&v62, (const char **)&v15->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v63);
    }
  }
  uint64_t v16 = *((unsigned __int8 *)a3 + 8);
  if ((v16 - 19) <= 0xFFFFFFED)
  {
    sub_2369470F4((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v17 = sub_23694710C(v63, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_236947248((uint64_t)&v62, (const char **)&v17->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v63);
  }
  switch(v16)
  {
    case 1:
      if (v10)
      {
        uint64_t v26 = *a1;
        if (!v26) {
          operator new();
        }
        if (*(unsigned char *)(v26 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v26 + 32) + 32) + 40))(*(void *)(*(void *)(v26 + 32) + 32), &unk_26E9CE8A8, 16);
        }
        unint64_t v27 = sub_236945764((void *)v26, 0x10uLL, (uint64_t)sub_236951AB0);
        *(void *)unint64_t v27 = 0;
        *(void *)(v27 + 8) = v26;
        *size_t v8 = v27;
      }
      else
      {
        unint64_t v27 = *v8;
      }
      sub_2369595C8((int *)v27, (int *)*a3);
      break;
    case 2:
      if (v10)
      {
        uint64_t v28 = *a1;
        if (!v28) {
          operator new();
        }
        if (*(unsigned char *)(v28 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v28 + 32) + 32) + 40))(*(void *)(*(void *)(v28 + 32) + 32), &unk_26E9CE898, 16);
        }
        unint64_t v29 = sub_236945764((void *)v28, 0x10uLL, (uint64_t)sub_236951AAC);
        *(void *)unint64_t v29 = 0;
        *(void *)(v29 + 8) = v28;
        *size_t v8 = v29;
      }
      else
      {
        unint64_t v29 = *v8;
      }
      sub_236958F6C((int *)v29, (int *)*a3);
      break;
    case 3:
    case 16:
    case 18:
      if (v10)
      {
        uint64_t v20 = *a1;
        if (!v20) {
          operator new();
        }
        if (*(unsigned char *)(v20 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v20 + 32) + 32) + 40))(*(void *)(*(void *)(v20 + 32) + 32), &unk_26E9CE868, 16);
        }
        unint64_t v21 = sub_236945764((void *)v20, 0x10uLL, (uint64_t)sub_236951AA0);
        *(void *)unint64_t v21 = 0;
        *(void *)(v21 + 8) = v20;
        *size_t v8 = v21;
      }
      else
      {
        unint64_t v21 = *v8;
      }
      sub_2369582B4((int *)v21, (int *)*a3);
      break;
    case 4:
    case 6:
      if (v10)
      {
        uint64_t v24 = *a1;
        if (!v24) {
          operator new();
        }
        if (*(unsigned char *)(v24 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v24 + 32) + 32) + 40))(*(void *)(*(void *)(v24 + 32) + 32), &unk_26E9CE888, 16);
        }
        unint64_t v25 = sub_236945764((void *)v24, 0x10uLL, (uint64_t)sub_236951AA8);
        *(void *)unint64_t v25 = 0;
        *(void *)(v25 + 8) = v24;
        *size_t v8 = v25;
      }
      else
      {
        unint64_t v25 = *v8;
      }
      sub_236958910((int *)v25, (int *)*a3);
      break;
    case 5:
    case 14:
    case 15:
    case 17:
      if (v10)
      {
        uint64_t v18 = *a1;
        if (!v18) {
          operator new();
        }
        if (*(unsigned char *)(v18 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v18 + 32) + 32) + 40))(*(void *)(*(void *)(v18 + 32) + 32), &unk_26E9CE858, 16);
        }
        unint64_t v19 = sub_236945764((void *)v18, 0x10uLL, (uint64_t)sub_236951A9C);
        *(void *)unint64_t v19 = 0;
        *(void *)(v19 + 8) = v18;
        *size_t v8 = v19;
      }
      else
      {
        unint64_t v19 = *v8;
      }
      sub_2369575FC((int *)v19, (int *)*a3);
      break;
    case 7:
    case 13:
      if (v10)
      {
        uint64_t v22 = *a1;
        if (!v22) {
          operator new();
        }
        if (*(unsigned char *)(v22 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v22 + 32) + 32) + 40))(*(void *)(*(void *)(v22 + 32) + 32), &unk_26E9CE878, 16);
        }
        unint64_t v23 = sub_236945764((void *)v22, 0x10uLL, (uint64_t)sub_236951AA4);
        *(void *)unint64_t v23 = 0;
        *(void *)(v23 + 8) = v22;
        *size_t v8 = v23;
      }
      else
      {
        unint64_t v23 = *v8;
      }
      sub_236957C58((int *)v23, (int *)*a3);
      break;
    case 8:
      if (v10)
      {
        uint64_t v30 = *a1;
        if (!v30) {
          operator new();
        }
        if (*(unsigned char *)(v30 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v30 + 32) + 32) + 40))(*(void *)(*(void *)(v30 + 32) + 32), &unk_26E9CE8B8, 16);
        }
        unint64_t v31 = sub_236945764((void *)v30, 0x10uLL, (uint64_t)sub_236951AB4);
        *(void *)unint64_t v31 = 0;
        *(void *)(v31 + 8) = v30;
        *size_t v8 = v31;
      }
      else
      {
        unint64_t v31 = *v8;
      }
      sub_236956FA4((int *)v31, (int *)*a3);
      break;
    case 9:
    case 12:
      if (v10)
      {
        uint64_t v32 = *a1;
        if (!v32) {
          operator new();
        }
        if (*(unsigned char *)(v32 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v32 + 32) + 32) + 40))(*(void *)(*(void *)(v32 + 32) + 32), &unk_26E9CE8D8, 24);
        }
        v33 = (void *)sub_236945764((void *)v32, 0x18uLL, (uint64_t)sub_236951AB8);
        v33[2] = 0;
        void *v33 = v32;
        v33[1] = 0;
        *size_t v8 = (uint64_t)v33;
      }
      else
      {
        v33 = (void *)*v8;
      }
      sub_2369418CC((uint64_t)v33, *a3);
      break;
    case 10:
    case 11:
      if (v10)
      {
        uint64_t v34 = *a1;
        if (!*a1) {
          operator new();
        }
        if (*(unsigned char *)(v34 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v34 + 32) + 32) + 40))(*(void *)(*(void *)(v34 + 32) + 32), &unk_26E9CE900, 24);
        }
        v35 = (void *)sub_236945764((void *)v34, 0x18uLL, (uint64_t)sub_236951ABC);
        v35[2] = 0;
        void *v35 = v34;
        v35[1] = 0;
        *size_t v8 = (uint64_t)v35;
      }
      double v45 = *(double *)a3;
      if (*(int *)(*(void *)&v45 + 8) >= 1)
      {
        int v46 = 0;
        do
        {
          uint64_t v47 = sub_236951AF4(*(uint64_t *)&v45, v46);
          uint64_t v48 = v47;
          uint64_t v49 = *v8;
          v50 = *(_DWORD **)(*v8 + 16);
          if (!v50
            || (uint64_t v51 = *(int *)(v49 + 8), (int)v51 >= *v50)
            || (*(_DWORD *)(v49 + 8) = v51 + 1, (uint64_t v52 = *(void *)&v50[2 * v51 + 2]) == 0))
          {
            uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v47 + 32))(v47, *a1);
            sub_236951BD4(*v8, v52);
          }
          (*(void (**)(uint64_t, uint64_t))(*(void *)v52 + 64))(v52, v48);
          ++v46;
        }
        while (v46 < *(_DWORD *)(*(void *)&v45 + 8));
      }
      break;
    default:
      return;
  }
}

void sub_23694C7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
}

__n128 sub_23694C860(uint64_t *a1, uint64_t a2, int a3, __n128 *a4, uint64_t *a5)
{
  uint64_t v6 = sub_23694A988(a1, a2, a3, a5);
  v7 = (__n128 *)v6;
  if (*(char *)(v6 + 23) < 0) {
    operator delete(*(void **)v6);
  }
  __n128 result = *a4;
  v7[1].n128_u64[0] = a4[1].n128_u64[0];
  __n128 *v7 = result;
  a4[1].n128_u8[7] = 0;
  a4->n128_u8[0] = 0;
  return result;
}

uint64_t sub_23694C8B4(uint64_t result, uint64_t a2)
{
  v3 = (unsigned __int8 *)result;
  if (*(void *)result == *(void *)a2)
  {
    __int16 v4 = *(_WORD *)(result + 8);
    *(_WORD *)(result + 8) = *(_WORD *)(a2 + 8);
    *(_WORD *)(a2 + 8) = v4;
    __int16 v5 = *(_WORD *)(result + 10);
    *(_WORD *)(result + 10) = *(_WORD *)(a2 + 10);
    *(_WORD *)(a2 + 10) = v5;
    uint64_t v6 = *(void *)(result + 16);
    *(void *)(result + 16) = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = v6;
  }
  else
  {
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = 0;
    sub_23694B63C((uint64_t)&v7, a2);
    sub_23694B59C((unsigned __int8 *)a2);
    sub_23694B63C(a2, (uint64_t)v3);
    sub_23694B59C(v3);
    sub_23694B63C((uint64_t)v3, (uint64_t)&v7);
    return sub_236947724((uint64_t)&v7);
  }
  return result;
}

void sub_23694C96C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_236947724((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **sub_23694C980(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int16 *)(a1 + 8);
  __int16 v4 = *(uint64_t ***)(a1 + 16);
  if (v3 >= 0x101)
  {
    *((void *)&v14 + 1) = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    LODWORD(v14) = a2;
    return sub_236952390(v4, (int *)&v14, &v14) + 5;
  }
  uint64_t v6 = *(unsigned __int16 *)(a1 + 10);
  uint64_t v7 = &v4[4 * v6];
  if (!*(_WORD *)(a1 + 10))
  {
    if (!*(_WORD *)(a1 + 8)) {
      goto LABEL_18;
    }
    LOWORD(v6) = 0;
LABEL_17:
    *(_WORD *)(a1 + 10) = v6 + 1;
    *(_DWORD *)uint64_t v7 = a2;
    v7[1] = 0;
    __n128 result = v7 + 1;
    v7[2] = 0;
    v7[3] = 0;
    return result;
  }
  unint64_t v8 = *(unsigned __int16 *)(a1 + 10);
  do
  {
    unint64_t v9 = v8 >> 1;
    uint64_t v10 = (int *)&v4[4 * (v8 >> 1)];
    int v12 = *v10;
    uint64_t v11 = (uint64_t **)(v10 + 8);
    v8 += ~(v8 >> 1);
    if (v12 < (int)a2) {
      __int16 v4 = v11;
    }
    else {
      unint64_t v8 = v9;
    }
  }
  while (v8);
  if (v4 != v7)
  {
    if (*(_DWORD *)v4 == a2) {
      return v4 + 1;
    }
    if (v6 < v3)
    {
      memmove(v4 + 4, v4, (char *)v7 - (char *)v4);
      LOWORD(v6) = *(_WORD *)(a1 + 10);
      uint64_t v7 = v4;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v6 < v3) {
    goto LABEL_17;
  }
LABEL_18:
  sub_23694B76C((void *)a1, v6 + 1);
  return (uint64_t **)sub_23694C980(a1, a2);
}

uint64_t sub_23694CACC(uint64_t a1)
{
  v1 = *(void **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
  {
    unint64_t v8 = (unsigned __int8 *)*v1;
    uint64_t v7 = (unsigned __int8 *)(v1 + 1);
    uint64_t v6 = v8;
    if (v8 == v7)
    {
      return 1;
    }
    else
    {
      do
      {
        uint64_t v4 = sub_23694CBA0(v6 + 40);
        if (!v4) {
          break;
        }
        unint64_t v9 = (unsigned __int8 *)*((void *)v6 + 1);
        if (v9)
        {
          do
          {
            uint64_t v10 = v9;
            unint64_t v9 = *(unsigned __int8 **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v10 = (unsigned __int8 *)*((void *)v6 + 2);
            BOOL v11 = *(void *)v10 == (void)v6;
            uint64_t v6 = v10;
          }
          while (!v11);
        }
        uint64_t v6 = v10;
      }
      while (v10 != v7);
    }
  }
  else
  {
    while (1)
    {
      uint64_t v3 = *(void *)(a1 + 16) + 32 * *(unsigned __int16 *)(a1 + 10);
      uint64_t v4 = v1 == (void *)v3;
      if (v1 == (void *)v3) {
        break;
      }
      __int16 v5 = (unsigned __int8 *)(v1 + 1);
      if (!sub_23694CBA0(v5)) {
        break;
      }
      v1 = v5 + 24;
      if (*(unsigned __int16 *)(a1 + 8) > 0x100u) {
        sub_236952684();
      }
    }
  }
  return v4;
}

uint64_t sub_23694CBA0(unsigned __int8 *a1)
{
  uint64_t v2 = a1[8];
  if ((v2 - 19) <= 0xFFFFFFED)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v3 = sub_23694710C(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_236947248((uint64_t)&v9, (const char **)&v3->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v10);
  }
  if (dword_23698F210[v2] != 10) {
    return 1;
  }
  if (a1[9])
  {
    uint64_t v4 = *(void *)a1;
    if (*(int *)(*(void *)a1 + 8) >= 1)
    {
      int v5 = 0;
      while (1)
      {
        uint64_t v6 = sub_236951AF4(v4, v5);
        if (((*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) & 1) == 0) {
          break;
        }
        ++v5;
        uint64_t v4 = *(void *)a1;
        if (v5 >= *(_DWORD *)(*(void *)a1 + 8)) {
          return 1;
        }
      }
      return 0;
    }
    return 1;
  }
  if (a1[10]) {
    return 1;
  }
  uint64_t v7 = **(void **)a1;
  if ((a1[10] & 0x10) != 0) {
    return ((*(uint64_t (**)(void))(v7 + 72))() & 1) != 0;
  }
  uint64_t result = (*(uint64_t (**)(void))(v7 + 48))();
  if (result) {
    return 1;
  }
  return result;
}

void sub_23694CCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23694CD10(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned char *a6)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(*(void *)a4 + 16))(a4, a3, a5);
  if (result)
  {
    uint64_t v10 = *a5;
    if ((v10 - 19) <= 0xFFFFFFED)
    {
      sub_2369470F4((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      BOOL v11 = sub_23694710C(v15, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_236947248((uint64_t)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v15);
    }
    unsigned int v12 = dword_23698F25C[v10];
    *a6 = 0;
    if (a2 == 2 && a5[1])
    {
      if (v12 > 5)
      {
        sub_2369470F4((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 82);
        BOOL v13 = sub_23694710C(v15, "can't reach here.");
        sub_236947248((uint64_t)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)v15);
      }
      else
      {
        uint64_t result = 1;
        if (((1 << v12) & 0x1C) == 0)
        {
          *a6 = 1;
          return result;
        }
      }
    }
    return v12 == a2;
  }
  return result;
}

void sub_23694CE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_23694CE6C(uint64_t *a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, unint64_t *a5, int32x2_t *a6)
{
  unsigned int v9 = a2;
  v16[0] = &unk_26E9CE818;
  v16[1] = a4;
  uint64_t v11 = a2 >> 3;
  unsigned __int8 v15 = 0;
  if (sub_23694CD10((uint64_t)a1, a2 & 7, a2 >> 3, (uint64_t)v16, v14, &v15)) {
    return sub_23694CF4C(a1, v11, v15, (uint64_t)v14, a5, a3, a6);
  }
  if (*a5) {
    BOOL v13 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
  }
  else {
    BOOL v13 = (std::string *)sub_236937EDC(a5);
  }
  return sub_236954948(v9, v13, (char *)a3, a6);
}

unsigned __int8 *sub_23694CF4C(uint64_t *a1, uint64_t a2, int a3, uint64_t a4, unint64_t *a5, unsigned __int8 *a6, int32x2_t *a7)
{
  unint64_t v8 = a6;
  uint64_t v11 = a2;
  unsigned int v12 = a1;
  if (a3)
  {
    switch(*(unsigned char *)a4)
    {
      case 1:
        uint64_t v30 = sub_236949FB8(a1, a2, 1, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_2369547E0(v30, v8, a7);
        break;
      case 2:
        unint64_t v31 = sub_236949FB8(a1, a2, 2, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_236954764(v31, v8, a7);
        break;
      case 3:
        uint64_t v32 = sub_236949FB8(a1, a2, 3, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_236954524((int *)v32, v8, (uint64_t)a7);
        break;
      case 4:
        v33 = sub_236949FB8(a1, a2, 4, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_236954534((int *)v33, v8, (uint64_t)a7);
        break;
      case 5:
        uint64_t v16 = sub_236949FB8(a1, a2, 5, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_236954504((int *)v16, v8, (uint64_t)a7);
        break;
      case 6:
        uint64_t v34 = sub_236949FB8(a1, a2, 6, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_23695466C(v34, v8, a7);
        break;
      case 7:
        v35 = sub_236949FB8(a1, a2, 7, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_236954574(v35, v8, a7);
        break;
      case 8:
        int v36 = sub_236949FB8(a1, a2, 8, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_236954564((int *)v36, v8, (uint64_t)a7);
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        sub_2369470F4((uint64_t)&v89, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/extension_set_inl.h", 79);
        BOOL v13 = sub_23694710C(&v89, "Non-primitive types can't be packed.");
        sub_236947248((uint64_t)&v88, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v89);
        goto LABEL_169;
      case 0xD:
        uint64_t v18 = sub_236949FB8(a1, a2, 13, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_236954514((int *)v18, v8, (uint64_t)a7);
        break;
      case 0xE:
        v89.__r_.__value_.__r.__words[0] = (std::string::size_type)sub_236949FB8(a1, a2, 14, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        *(_OWORD *)&v89.__r_.__value_.__r.__words[1] = *(_OWORD *)(a4 + 8);
        v90 = a5;
        int v91 = v11;
        unint64_t v8 = (unsigned __int8 *)sub_236951DF8((uint64_t)a7, (char *)v8, (uint64_t)&v89);
        goto LABEL_169;
      case 0xF:
        unint64_t v19 = sub_236949FB8(a1, a2, 15, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_2369545F0(v19, v8, a7);
        break;
      case 0x10:
        double v37 = sub_236949FB8(a1, a2, 16, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = (unsigned __int8 *)sub_2369546E8(v37, v8, a7);
        break;
      case 0x11:
        uint64_t v20 = sub_236949FB8(a1, a2, 17, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_236954544((int *)v20, v8, (uint64_t)a7);
        break;
      case 0x12:
        long long v38 = sub_236949FB8(a1, a2, 18, *(unsigned char *)(a4 + 2), *(uint64_t **)(a4 + 24));
        uint64_t result = sub_236954554((int *)v38, v8, (uint64_t)a7);
        break;
      default:
        goto LABEL_169;
    }
  }
  else
  {
    switch(*(unsigned char *)a4)
    {
      case 1:
        unint64_t v8 = a6 + 8;
        double v39 = *(double *)a6;
        if (*(unsigned char *)(a4 + 1)) {
          sub_236949710(a1, a2, 1, *(unsigned __int8 *)(a4 + 2), *(uint64_t **)(a4 + 24), v39);
        }
        else {
          sub_2369494F0((uint64_t)a1, a2, 1, *(void *)(a4 + 24), v39);
        }
        goto LABEL_169;
      case 2:
        unint64_t v8 = a6 + 4;
        float v40 = *(float *)a6;
        if (*(unsigned char *)(a4 + 1)) {
          sub_2369491A4(a1, a2, 2, *(unsigned __int8 *)(a4 + 2), *(uint64_t **)(a4 + 24), v40);
        }
        else {
          sub_236948F84((uint64_t)a1, a2, 2, *(void *)(a4 + 24), v40);
        }
        goto LABEL_169;
      case 3:
        uint64_t v41 = *a6;
        if ((char)*a6 < 0)
        {
          int v67 = v41 + (a6[1] << 7);
          uint64_t v41 = (v67 - 128);
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, (v67 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            uint64_t v41 = v84;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v54 = *(unsigned __int8 *)(a4 + 2);
          v55 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v56 = 3;
          goto LABEL_166;
        }
        uint64_t v79 = *(void *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        int v80 = 3;
        goto LABEL_168;
      case 4:
        uint64_t v42 = *a6;
        if ((char)*a6 < 0)
        {
          int v68 = v42 + (a6[1] << 7);
          uint64_t v42 = (v68 - 128);
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, (v68 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            uint64_t v42 = v85;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v43 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v44 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v45 = 4;
          goto LABEL_147;
        }
        uint64_t v69 = *(void *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        int v70 = 4;
        goto LABEL_149;
      case 5:
        int v21 = *a6;
        if ((char)*a6 < 0)
        {
          int v63 = v21 + (a6[1] << 7);
          int v21 = v63 - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, (v63 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            int v21 = v81;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v26 = *(unsigned __int8 *)(a4 + 2);
          unint64_t v27 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v28 = 5;
          goto LABEL_134;
        }
        uint64_t v65 = *(void *)(a4 + 24);
        a1 = v12;
        a2 = v11;
        int v66 = 5;
        int v82 = v21;
        goto LABEL_137;
      case 6:
        unint64_t v8 = a6 + 8;
        uint64_t v42 = *(void *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v43 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v44 = *(uint64_t **)(a4 + 24);
          int v45 = 6;
LABEL_147:
          sub_236948C40(a1, a2, v45, v43, v42, v44);
        }
        else
        {
          uint64_t v69 = *(void *)(a4 + 24);
          int v70 = 6;
LABEL_149:
          sub_236948A28((uint64_t)a1, a2, v70, v42, v69);
        }
        goto LABEL_169;
      case 7:
        unint64_t v8 = a6 + 4;
        int v25 = *(_DWORD *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v46 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v47 = *(uint64_t **)(a4 + 24);
          int v48 = 7;
          goto LABEL_128;
        }
        uint64_t v71 = *(void *)(a4 + 24);
        int v72 = 7;
        int v73 = *(_DWORD *)a6;
        goto LABEL_130;
      case 8:
        uint64_t v49 = *a6;
        if ((char)*a6 < 0)
        {
          uint64_t v49 = v49 + (a6[1] << 7) - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, v49);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1)) {
          sub_236949C74(v12, v11, 8, *(unsigned __int8 *)(a4 + 2), v49 != 0, *(uint64_t **)(a4 + 24));
        }
        else {
          sub_236949A5C((uint64_t)v12, v11, 8, v49 != 0, *(void *)(a4 + 24));
        }
        goto LABEL_169;
      case 9:
      case 0xC:
        char v14 = *(uint64_t **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v15 = (uint64_t)sub_23694AC30(a1, a2, 9, v14);
        }
        else {
          uint64_t v15 = sub_23694A988(a1, a2, 9, v14);
        }
        uint64_t v58 = (std::string *)v15;
        int v59 = *v8;
        if ((char)*v8 < 0)
        {
          uint64_t v61 = sub_23695441C((uint64_t)v8, *v8);
          if (!v61)
          {
LABEL_113:
            unint64_t v8 = 0;
            goto LABEL_169;
          }
          v60 = (std::string::value_type *)v61;
          int v59 = v62;
        }
        else
        {
          v60 = (std::string::value_type *)(v8 + 1);
        }
        return (unsigned __int8 *)sub_236951D8C((uint64_t)a7, v60, v59, v58);
      case 0xA:
        uint64_t v50 = *(void *)(a4 + 8);
        uint64_t v51 = *(uint64_t **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v52 = sub_23694B278(a1, a2, 10, v50, v51);
        }
        else {
          uint64_t v52 = sub_23694AFE0(a1, a2, 10, v50, v51);
        }
        int v74 = a7[11].i32[0];
        BOOL v75 = __OFSUB__(v74--, 1);
        a7[11].i32[0] = v74;
        if (v74 < 0 != v75) {
          goto LABEL_113;
        }
        ++a7[11].i32[1];
        uint64_t v76 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, int32x2_t *))(*(void *)v52 + 88))(v52, v8, a7);
        a7[11] = vadd_s32(a7[11], (int32x2_t)0xFFFFFFFF00000001);
        __int32 v77 = a7[10].i32[0];
        a7[10].i32[0] = 0;
        if (v77 == ((8 * v11) | 3)) {
          unint64_t v8 = (unsigned __int8 *)v76;
        }
        else {
          unint64_t v8 = 0;
        }
        goto LABEL_169;
      case 0xB:
        uint64_t v22 = *(void *)(a4 + 8);
        unint64_t v23 = *(uint64_t **)(a4 + 24);
        if (*(unsigned char *)(a4 + 1)) {
          uint64_t v24 = sub_23694B278(a1, a2, 11, v22, v23);
        }
        else {
          uint64_t v24 = sub_23694AFE0(a1, a2, 11, v22, v23);
        }
        return (unsigned __int8 *)sub_236954190(a7, v24, v8);
      case 0xD:
        int v25 = *a6;
        if ((char)*a6 < 0)
        {
          int v64 = v25 + (a6[1] << 7);
          int v25 = v64 - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, (v64 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            int v25 = v83;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if (*(unsigned char *)(a4 + 1))
        {
          int v46 = *(unsigned __int8 *)(a4 + 2);
          uint64_t v47 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v48 = 13;
LABEL_128:
          sub_2369486E4(a1, a2, v48, v46, v25, v47);
        }
        else
        {
          uint64_t v71 = *(void *)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v72 = 13;
          int v73 = v25;
LABEL_130:
          sub_2369484CC((uint64_t)a1, a2, v72, v73, v71);
        }
        goto LABEL_169;
      case 0xE:
        unint64_t v53 = *a6;
        if ((char)*a6 < 0)
        {
          int v78 = v53 + (a6[1] << 7);
          unint64_t v53 = (v78 - 128);
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, (v78 - 128));
            if (!v8) {
              goto LABEL_169;
            }
            unint64_t v53 = v86;
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        if ((*(uint64_t (**)(void, unint64_t))(a4 + 8))(*(void *)(a4 + 16), v53))
        {
          if (*(unsigned char *)(a4 + 1)) {
            sub_23694A644(v12, v11, 14, *(unsigned __int8 *)(a4 + 2), v53, *(uint64_t **)(a4 + 24));
          }
          else {
            sub_23694A42C((uint64_t)v12, v11, 14, v53, *(void *)(a4 + 24));
          }
        }
        else
        {
          if (*a5) {
            v87 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else {
            v87 = (std::string *)sub_236937EDC(a5);
          }
          sub_23695427C(v11, v53, v87);
        }
        goto LABEL_169;
      case 0xF:
        unint64_t v8 = a6 + 4;
        int v21 = *(_DWORD *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v26 = *(unsigned __int8 *)(a4 + 2);
          unint64_t v27 = *(uint64_t **)(a4 + 24);
          int v28 = 15;
          goto LABEL_134;
        }
        uint64_t v65 = *(void *)(a4 + 24);
        int v66 = 15;
        goto LABEL_136;
      case 0x10:
        unint64_t v8 = a6 + 8;
        uint64_t v41 = *(void *)a6;
        if (*(unsigned char *)(a4 + 1))
        {
          int v54 = *(unsigned __int8 *)(a4 + 2);
          v55 = *(uint64_t **)(a4 + 24);
          int v56 = 16;
          goto LABEL_166;
        }
        uint64_t v79 = *(void *)(a4 + 24);
        int v80 = 16;
        goto LABEL_168;
      case 0x11:
        LODWORD(v29) = *a6;
        if ((char)*a6 < 0)
        {
          uint64_t v29 = v29 + (a6[1] << 7) - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, v29);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        int v21 = -(v29 & 1) ^ (v29 >> 1);
        if (*(unsigned char *)(a4 + 1))
        {
          int v26 = *(unsigned __int8 *)(a4 + 2);
          unint64_t v27 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v28 = 17;
LABEL_134:
          sub_236947C2C(a1, a2, v28, v26, v21, v27);
        }
        else
        {
          uint64_t v65 = *(void *)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v66 = 17;
LABEL_136:
          int v82 = v21;
LABEL_137:
          sub_236947A14((uint64_t)a1, a2, v66, v82, v65);
        }
        goto LABEL_169;
      case 0x12:
        unint64_t v57 = *a6;
        if ((char)*a6 < 0)
        {
          unint64_t v57 = v57 + (a6[1] << 7) - 128;
          if ((char)a6[1] < 0)
          {
            unint64_t v8 = (unsigned __int8 *)sub_236954390((uint64_t)a6, v57);
            if (!v8) {
              goto LABEL_169;
            }
          }
          else
          {
            unint64_t v8 = a6 + 2;
          }
        }
        else
        {
          unint64_t v8 = a6 + 1;
        }
        uint64_t v41 = -(uint64_t)(v57 & 1) ^ (v57 >> 1);
        if (*(unsigned char *)(a4 + 1))
        {
          int v54 = *(unsigned __int8 *)(a4 + 2);
          v55 = *(uint64_t **)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v56 = 18;
LABEL_166:
          sub_236948188(a1, a2, v56, v54, v41, v55);
        }
        else
        {
          uint64_t v79 = *(void *)(a4 + 24);
          a1 = v12;
          a2 = v11;
          int v80 = 18;
LABEL_168:
          sub_236947F70((uint64_t)a1, a2, v80, v41, v79);
        }
LABEL_169:
        uint64_t result = v8;
        break;
      default:
        goto LABEL_169;
    }
  }
  return result;
}

void sub_23694DBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_23694DC64(uint64_t a1, signed int a2, int a3, char *a4, uint64_t *a5)
{
  uint64_t v7 = *(unsigned int **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
  {
    uint64_t v18 = *((void *)v7 + 1);
    uint64_t v17 = v7 + 2;
    uint64_t v16 = v18;
    if (v18)
    {
      unint64_t v19 = v17;
      do
      {
        int v20 = *(_DWORD *)(v16 + 32);
        BOOL v21 = v20 < a2;
        if (v20 >= a2) {
          uint64_t v22 = (uint64_t *)v16;
        }
        else {
          uint64_t v22 = (uint64_t *)(v16 + 8);
        }
        if (!v21) {
          unint64_t v19 = (void *)v16;
        }
        uint64_t v16 = *v22;
      }
      while (*v22);
      if (v19 != (void *)v17)
      {
        do
        {
          uint64_t v23 = *((unsigned int *)v19 + 8);
          if ((int)v23 >= a3) {
            break;
          }
          a4 = sub_23694DD94((unsigned char *)v19 + 40, v23, a4, a5);
          uint64_t v24 = (unsigned int *)v19[1];
          if (v24)
          {
            do
            {
              int v25 = v24;
              uint64_t v24 = *(unsigned int **)v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              int v25 = (unsigned int *)v19[2];
              BOOL v26 = *(void *)v25 == (void)v19;
              unint64_t v19 = v25;
            }
            while (!v26);
          }
          unint64_t v19 = v25;
        }
        while (v25 != v17);
      }
    }
  }
  else
  {
    unint64_t v8 = *(unsigned __int16 *)(a1 + 10);
    if (*(_WORD *)(a1 + 10))
    {
      unsigned int v9 = &v7[8 * v8];
      do
      {
        unint64_t v10 = v8 >> 1;
        uint64_t v11 = &v7[8 * (v8 >> 1)];
        signed int v13 = *v11;
        unsigned int v12 = v11 + 8;
        v8 += ~(v8 >> 1);
        if (v13 < a2) {
          uint64_t v7 = v12;
        }
        else {
          unint64_t v8 = v10;
        }
      }
      while (v8);
      while (v7 != v9)
      {
        uint64_t v14 = *v7;
        if ((int)v14 >= a3) {
          break;
        }
        a4 = sub_23694DD94((unsigned char *)v7 + 8, v14, a4, a5);
        v7 += 8;
      }
    }
  }
  return a4;
}

char *sub_23694DD94(unsigned char *a1, uint64_t a2, char *a3, uint64_t *a4)
{
  int v5 = a3;
  if (a1[9])
  {
    if (a1[11])
    {
      if (*((_DWORD *)a1 + 3))
      {
        if (*a4 <= (unint64_t)a3) {
          int v5 = sub_236946668((uint64_t)a4, a3);
        }
        unsigned int v8 = (8 * a2) | 2;
        if (v8 > 0x7F)
        {
          char *v5 = (8 * a2) | 0x82;
          unsigned int v32 = (8 * a2) >> 7;
          if (v8 >> 14)
          {
            unsigned int v9 = v5 + 2;
            do
            {
              *(v9 - 1) = v32 | 0x80;
              unsigned int v33 = v32 >> 7;
              ++v9;
              unsigned int v34 = v32 >> 14;
              v32 >>= 7;
            }
            while (v34);
            *(v9 - 1) = v33;
          }
          else
          {
            v5[1] = v32;
            unsigned int v9 = v5 + 2;
          }
        }
        else
        {
          char *v5 = v8;
          unsigned int v9 = v5 + 1;
        }
        unint64_t v35 = *((int *)a1 + 3);
        if (v35 > 0x7F)
        {
          unsigned char *v9 = v35 | 0x80;
          unint64_t v36 = v35 >> 7;
          if (v35 >> 14)
          {
            int v5 = v9 + 2;
            do
            {
              *(v5 - 1) = v36 | 0x80;
              unint64_t v37 = v36 >> 7;
              ++v5;
              unint64_t v38 = v36 >> 14;
              v36 >>= 7;
            }
            while (v38);
            *(v5 - 1) = v37;
          }
          else
          {
            v9[1] = v36;
            int v5 = v9 + 2;
          }
        }
        else
        {
          unsigned char *v9 = v35;
          int v5 = v9 + 1;
        }
        int v39 = a1[8];
        if ((v39 - 19) <= 0xFFFFFFED)
        {
          sub_2369470F4((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
          float v40 = sub_23694710C(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
          sub_236947248((uint64_t)&v431, (const char **)&v40->__r_.__value_.__l.__data_);
          sub_236947250((uint64_t)v432);
        }
        switch(v39)
        {
          case 1:
            int v63 = *(int **)a1;
            if (**(int **)a1 >= 1)
            {
              int v64 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v63 = *(int **)a1;
                }
                *(void *)int v5 = *(void *)sub_236959410(v63, v64);
                v5 += 8;
                ++v64;
                int v63 = *(int **)a1;
              }
              while (v64 < **(_DWORD **)a1);
            }
            break;
          case 2:
            uint64_t v65 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v66 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  uint64_t v65 = *(_DWORD **)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)sub_236958DB4(v65, v66);
                v5 += 4;
                ++v66;
                uint64_t v65 = *(_DWORD **)a1;
              }
              while (v66 < **(_DWORD **)a1);
            }
            break;
          case 3:
            int v67 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v68 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v67 = *(_DWORD **)a1;
                }
                unint64_t v69 = *(void *)sub_2369580FC(v67, v68);
                if (v69 > 0x7F)
                {
                  char *v5 = v69 | 0x80;
                  unint64_t v70 = v69 >> 7;
                  if (v69 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v70 | 0x80;
                      unint64_t v71 = v70 >> 7;
                      ++v5;
                      unint64_t v72 = v70 >> 14;
                      v70 >>= 7;
                    }
                    while (v72);
                    *(v5 - 1) = v71;
                  }
                  else
                  {
                    v5[1] = v70;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v69;
                }
                ++v68;
                int v67 = *(_DWORD **)a1;
              }
              while (v68 < **(_DWORD **)a1);
            }
            break;
          case 4:
            int v73 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v74 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v73 = *(_DWORD **)a1;
                }
                unint64_t v75 = *(void *)sub_236958758(v73, v74);
                if (v75 > 0x7F)
                {
                  char *v5 = v75 | 0x80;
                  unint64_t v76 = v75 >> 7;
                  if (v75 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v76 | 0x80;
                      unint64_t v77 = v76 >> 7;
                      ++v5;
                      unint64_t v78 = v76 >> 14;
                      v76 >>= 7;
                    }
                    while (v78);
                    *(v5 - 1) = v77;
                  }
                  else
                  {
                    v5[1] = v76;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v75;
                }
                ++v74;
                int v73 = *(_DWORD **)a1;
              }
              while (v74 < **(_DWORD **)a1);
            }
            break;
          case 5:
            uint64_t v42 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v43 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  uint64_t v42 = *(_DWORD **)a1;
                }
                unint64_t v44 = *(int *)sub_236957444(v42, v43);
                if (v44 > 0x7F)
                {
                  char *v5 = v44 | 0x80;
                  unint64_t v45 = v44 >> 7;
                  if (v44 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v45 | 0x80;
                      unint64_t v46 = v45 >> 7;
                      ++v5;
                      unint64_t v47 = v45 >> 14;
                      v45 >>= 7;
                    }
                    while (v47);
                    *(v5 - 1) = v46;
                  }
                  else
                  {
                    v5[1] = v45;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v44;
                }
                ++v43;
                uint64_t v42 = *(_DWORD **)a1;
              }
              while (v43 < **(_DWORD **)a1);
            }
            break;
          case 6:
            uint64_t v79 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v80 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  uint64_t v79 = *(_DWORD **)a1;
                }
                *(void *)int v5 = *(void *)sub_236958758(v79, v80);
                v5 += 8;
                ++v80;
                uint64_t v79 = *(_DWORD **)a1;
              }
              while (v80 < **(_DWORD **)a1);
            }
            break;
          case 7:
            int v81 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v82 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v81 = *(_DWORD **)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)sub_236957AA0(v81, v82);
                v5 += 4;
                ++v82;
                int v81 = *(_DWORD **)a1;
              }
              while (v82 < **(_DWORD **)a1);
            }
            break;
          case 8:
            int v83 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v84 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v83 = *(_DWORD **)a1;
                }
                *v5++ = *(unsigned char *)sub_236956DEC(v83, v84++);
                int v83 = *(_DWORD **)a1;
              }
              while (v84 < **(_DWORD **)a1);
            }
            break;
          case 9:
          case 10:
          case 11:
          case 12:
            sub_2369470F4((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1966);
            uint64_t v41 = sub_23694710C(v432, "Non-primitive types can't be packed.");
            sub_236947248((uint64_t)&v431, (const char **)&v41->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v432);
            break;
          case 13:
            int v48 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v49 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v48 = *(_DWORD **)a1;
                }
                unsigned int v50 = *(_DWORD *)sub_236957AA0(v48, v49);
                if (v50 > 0x7F)
                {
                  char *v5 = v50 | 0x80;
                  unsigned int v51 = v50 >> 7;
                  if (v50 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v51 | 0x80;
                      unsigned int v52 = v51 >> 7;
                      ++v5;
                      unsigned int v53 = v51 >> 14;
                      v51 >>= 7;
                    }
                    while (v53);
                    *(v5 - 1) = v52;
                  }
                  else
                  {
                    v5[1] = v51;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v50;
                }
                ++v49;
                int v48 = *(_DWORD **)a1;
              }
              while (v49 < **(_DWORD **)a1);
            }
            break;
          case 14:
            uint64_t v85 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v86 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  uint64_t v85 = *(_DWORD **)a1;
                }
                unint64_t v87 = *(int *)sub_236957444(v85, v86);
                if (v87 > 0x7F)
                {
                  char *v5 = v87 | 0x80;
                  unint64_t v88 = v87 >> 7;
                  if (v87 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v88 | 0x80;
                      unint64_t v89 = v88 >> 7;
                      ++v5;
                      unint64_t v90 = v88 >> 14;
                      v88 >>= 7;
                    }
                    while (v90);
                    *(v5 - 1) = v89;
                  }
                  else
                  {
                    v5[1] = v88;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v87;
                }
                ++v86;
                uint64_t v85 = *(_DWORD **)a1;
              }
              while (v86 < **(_DWORD **)a1);
            }
            break;
          case 15:
            int v54 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v55 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v54 = *(_DWORD **)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)sub_236957444(v54, v55);
                v5 += 4;
                ++v55;
                int v54 = *(_DWORD **)a1;
              }
              while (v55 < **(_DWORD **)a1);
            }
            break;
          case 16:
            int v91 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v92 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v91 = *(_DWORD **)a1;
                }
                *(void *)int v5 = *(void *)sub_2369580FC(v91, v92);
                v5 += 8;
                ++v92;
                int v91 = *(_DWORD **)a1;
              }
              while (v92 < **(_DWORD **)a1);
            }
            break;
          case 17:
            int v56 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v57 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  int v56 = *(_DWORD **)a1;
                }
                uint64_t v58 = (int *)sub_236957444(v56, v57);
                unsigned int v59 = (2 * *v58) ^ (*v58 >> 31);
                if (v59 > 0x7F)
                {
                  char *v5 = v59 | 0x80;
                  unsigned int v60 = v59 >> 7;
                  if (v59 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v60 | 0x80;
                      unsigned int v61 = v60 >> 7;
                      ++v5;
                      unsigned int v62 = v60 >> 14;
                      v60 >>= 7;
                    }
                    while (v62);
                    *(v5 - 1) = v61;
                  }
                  else
                  {
                    v5[1] = v60;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v59;
                }
                ++v57;
                int v56 = *(_DWORD **)a1;
              }
              while (v57 < **(_DWORD **)a1);
            }
            break;
          case 18:
            v93 = *(_DWORD **)a1;
            if (**(int **)a1 >= 1)
            {
              int v94 = 0;
              do
              {
                if (*a4 <= (unint64_t)v5)
                {
                  int v5 = sub_236946668((uint64_t)a4, v5);
                  v93 = *(_DWORD **)a1;
                }
                v95 = (uint64_t *)sub_2369580FC(v93, v94);
                unint64_t v96 = (2 * *v95) ^ (*v95 >> 63);
                if (v96 > 0x7F)
                {
                  char *v5 = v96 | 0x80;
                  unint64_t v97 = v96 >> 7;
                  if (v96 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v97 | 0x80;
                      unint64_t v98 = v97 >> 7;
                      ++v5;
                      unint64_t v99 = v97 >> 14;
                      v97 >>= 7;
                    }
                    while (v99);
                    *(v5 - 1) = v98;
                  }
                  else
                  {
                    v5[1] = v97;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v96;
                }
                ++v94;
                v93 = *(_DWORD **)a1;
              }
              while (v94 < **(_DWORD **)a1);
            }
            break;
          default:
            return v5;
        }
      }
      return v5;
    }
    int v18 = a1[8];
    if ((v18 - 19) <= 0xFFFFFFED)
    {
      sub_2369470F4((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unint64_t v19 = sub_23694710C(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_236947248((uint64_t)&v431, (const char **)&v19->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v432);
    }
    switch(v18)
    {
      case 1:
        int v20 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v21 = 0;
          unsigned int v22 = 8 * a2;
          unsigned int v23 = (8 * a2) | 1;
          char v24 = (8 * a2) | 0x81;
          unsigned int v25 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v26 = v22 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              int v20 = *(_DWORD **)a1;
            }
            uint64_t v27 = *(void *)sub_236959410(v20, v21);
            if (v23 > 0x7F)
            {
              char *v5 = v24;
              if (v23 >= 0x4000)
              {
                int v28 = v5 + 2;
                unsigned int v29 = v25;
                do
                {
                  *((unsigned char *)v28 - 1) = v29 | 0x80;
                  unsigned int v30 = v29 >> 7;
                  int v28 = (void *)((char *)v28 + 1);
                  unsigned int v31 = v29 >> 14;
                  v29 >>= 7;
                }
                while (v31);
                *((unsigned char *)v28 - 1) = v30;
              }
              else
              {
                v5[1] = v26;
                int v28 = v5 + 2;
              }
            }
            else
            {
              char *v5 = v23;
              int v28 = v5 + 1;
            }
            *int v28 = v27;
            int v5 = (char *)(v28 + 1);
            ++v21;
            int v20 = *(_DWORD **)a1;
          }
          while (v21 < **(_DWORD **)a1);
        }
        return v5;
      case 2:
        v100 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v101 = 0;
          unsigned int v102 = (8 * a2) | 5;
          unsigned int v103 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v104 = (8 * a2) >> 7;
          char v105 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v100 = *(_DWORD **)a1;
            }
            int v106 = *(_DWORD *)sub_236958DB4(v100, v101);
            if (v102 > 0x7F)
            {
              char *v5 = v105;
              if (v102 >= 0x4000)
              {
                v107 = v5 + 2;
                unsigned int v108 = v103;
                do
                {
                  *((unsigned char *)v107 - 1) = v108 | 0x80;
                  unsigned int v109 = v108 >> 7;
                  v107 = (_DWORD *)((char *)v107 + 1);
                  unsigned int v110 = v108 >> 14;
                  v108 >>= 7;
                }
                while (v110);
                *((unsigned char *)v107 - 1) = v109;
              }
              else
              {
                v5[1] = v104;
                v107 = v5 + 2;
              }
            }
            else
            {
              char *v5 = v102;
              v107 = v5 + 1;
            }
            _DWORD *v107 = v106;
            int v5 = (char *)(v107 + 1);
            ++v101;
            v100 = *(_DWORD **)a1;
          }
          while (v101 < **(_DWORD **)a1);
        }
        return v5;
      case 3:
        v111 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v112 = 0;
          unsigned int v113 = 8 * a2;
          char v114 = (8 * a2) | 0x80;
          unsigned int v115 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v111 = *(_DWORD **)a1;
            }
            unint64_t v116 = *(void *)sub_2369580FC(v111, v112);
            if (v113 > 0x7F)
            {
              char *v5 = v114;
              if (v113 >= 0x4000)
              {
                v117 = v5 + 2;
                unsigned int v118 = v115;
                do
                {
                  *(v117 - 1) = v118 | 0x80;
                  unsigned int v119 = v118 >> 7;
                  ++v117;
                  unsigned int v120 = v118 >> 14;
                  v118 >>= 7;
                }
                while (v120);
                *(v117 - 1) = v119;
              }
              else
              {
                v5[1] = v113 >> 7;
                v117 = v5 + 2;
              }
            }
            else
            {
              v117 = v5 + 1;
              char *v5 = v113;
            }
            if (v116 > 0x7F)
            {
              unsigned char *v117 = v116 | 0x80;
              unint64_t v121 = v116 >> 7;
              if (v116 >> 14)
              {
                int v5 = v117 + 2;
                do
                {
                  *(v5 - 1) = v121 | 0x80;
                  unint64_t v122 = v121 >> 7;
                  ++v5;
                  unint64_t v123 = v121 >> 14;
                  v121 >>= 7;
                }
                while (v123);
                *(v5 - 1) = v122;
              }
              else
              {
                v117[1] = v121;
                int v5 = v117 + 2;
              }
            }
            else
            {
              unsigned char *v117 = v116;
              int v5 = v117 + 1;
            }
            ++v112;
            v111 = *(_DWORD **)a1;
          }
          while (v112 < **(_DWORD **)a1);
        }
        return v5;
      case 4:
        v124 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v125 = 0;
          unsigned int v126 = 8 * a2;
          char v127 = (8 * a2) | 0x80;
          unsigned int v128 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v124 = *(_DWORD **)a1;
            }
            unint64_t v129 = *(void *)sub_236958758(v124, v125);
            if (v126 > 0x7F)
            {
              char *v5 = v127;
              if (v126 >= 0x4000)
              {
                v130 = v5 + 2;
                unsigned int v131 = v128;
                do
                {
                  *(v130 - 1) = v131 | 0x80;
                  unsigned int v132 = v131 >> 7;
                  ++v130;
                  unsigned int v133 = v131 >> 14;
                  v131 >>= 7;
                }
                while (v133);
                *(v130 - 1) = v132;
              }
              else
              {
                v5[1] = v126 >> 7;
                v130 = v5 + 2;
              }
            }
            else
            {
              v130 = v5 + 1;
              char *v5 = v126;
            }
            if (v129 > 0x7F)
            {
              unsigned char *v130 = v129 | 0x80;
              unint64_t v134 = v129 >> 7;
              if (v129 >> 14)
              {
                int v5 = v130 + 2;
                do
                {
                  *(v5 - 1) = v134 | 0x80;
                  unint64_t v135 = v134 >> 7;
                  ++v5;
                  unint64_t v136 = v134 >> 14;
                  v134 >>= 7;
                }
                while (v136);
                *(v5 - 1) = v135;
              }
              else
              {
                v130[1] = v134;
                int v5 = v130 + 2;
              }
            }
            else
            {
              unsigned char *v130 = v129;
              int v5 = v130 + 1;
            }
            ++v125;
            v124 = *(_DWORD **)a1;
          }
          while (v125 < **(_DWORD **)a1);
        }
        return v5;
      case 5:
        v137 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v138 = 0;
          unsigned int v139 = 8 * a2;
          char v140 = (8 * a2) | 0x80;
          unsigned int v141 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v137 = *(_DWORD **)a1;
            }
            unint64_t v142 = *(int *)sub_236957444(v137, v138);
            if (v139 > 0x7F)
            {
              char *v5 = v140;
              if (v139 >= 0x4000)
              {
                v143 = v5 + 2;
                unsigned int v144 = v141;
                do
                {
                  *(v143 - 1) = v144 | 0x80;
                  unsigned int v145 = v144 >> 7;
                  ++v143;
                  unsigned int v146 = v144 >> 14;
                  v144 >>= 7;
                }
                while (v146);
                *(v143 - 1) = v145;
              }
              else
              {
                v5[1] = v139 >> 7;
                v143 = v5 + 2;
              }
            }
            else
            {
              v143 = v5 + 1;
              char *v5 = v139;
            }
            if (v142 > 0x7F)
            {
              unsigned char *v143 = v142 | 0x80;
              unint64_t v147 = v142 >> 7;
              if (v142 >> 14)
              {
                int v5 = v143 + 2;
                do
                {
                  *(v5 - 1) = v147 | 0x80;
                  unint64_t v148 = v147 >> 7;
                  ++v5;
                  unint64_t v149 = v147 >> 14;
                  v147 >>= 7;
                }
                while (v149);
                *(v5 - 1) = v148;
              }
              else
              {
                v143[1] = v147;
                int v5 = v143 + 2;
              }
            }
            else
            {
              unsigned char *v143 = v142;
              int v5 = v143 + 1;
            }
            ++v138;
            v137 = *(_DWORD **)a1;
          }
          while (v138 < **(_DWORD **)a1);
        }
        return v5;
      case 6:
        v150 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v151 = 0;
          unsigned int v152 = 8 * a2;
          unsigned int v153 = (8 * a2) | 1;
          char v154 = (8 * a2) | 0x81;
          unsigned int v155 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v156 = v152 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v150 = *(_DWORD **)a1;
            }
            uint64_t v157 = *(void *)sub_236958758(v150, v151);
            if (v153 > 0x7F)
            {
              char *v5 = v154;
              if (v153 >= 0x4000)
              {
                v158 = v5 + 2;
                unsigned int v159 = v155;
                do
                {
                  *((unsigned char *)v158 - 1) = v159 | 0x80;
                  unsigned int v160 = v159 >> 7;
                  v158 = (void *)((char *)v158 + 1);
                  unsigned int v161 = v159 >> 14;
                  v159 >>= 7;
                }
                while (v161);
                *((unsigned char *)v158 - 1) = v160;
              }
              else
              {
                v5[1] = v156;
                v158 = v5 + 2;
              }
            }
            else
            {
              char *v5 = v153;
              v158 = v5 + 1;
            }
            void *v158 = v157;
            int v5 = (char *)(v158 + 1);
            ++v151;
            v150 = *(_DWORD **)a1;
          }
          while (v151 < **(_DWORD **)a1);
        }
        return v5;
      case 7:
        v162 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v163 = 0;
          unsigned int v164 = (8 * a2) | 5;
          unsigned int v165 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v166 = (8 * a2) >> 7;
          char v167 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v162 = *(_DWORD **)a1;
            }
            int v168 = *(_DWORD *)sub_236957AA0(v162, v163);
            if (v164 > 0x7F)
            {
              char *v5 = v167;
              if (v164 >= 0x4000)
              {
                v169 = v5 + 2;
                unsigned int v170 = v165;
                do
                {
                  *((unsigned char *)v169 - 1) = v170 | 0x80;
                  unsigned int v171 = v170 >> 7;
                  v169 = (_DWORD *)((char *)v169 + 1);
                  unsigned int v172 = v170 >> 14;
                  v170 >>= 7;
                }
                while (v172);
                *((unsigned char *)v169 - 1) = v171;
              }
              else
              {
                v5[1] = v166;
                v169 = v5 + 2;
              }
            }
            else
            {
              char *v5 = v164;
              v169 = v5 + 1;
            }
            _DWORD *v169 = v168;
            int v5 = (char *)(v169 + 1);
            ++v163;
            v162 = *(_DWORD **)a1;
          }
          while (v163 < **(_DWORD **)a1);
        }
        return v5;
      case 8:
        v173 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v174 = 0;
          unsigned int v175 = 8 * a2;
          char v176 = (8 * a2) | 0x80;
          unsigned int v177 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v173 = *(_DWORD **)a1;
            }
            char v178 = *(unsigned char *)sub_236956DEC(v173, v174);
            if (v175 > 0x7F)
            {
              char *v5 = v176;
              if (v175 >= 0x4000)
              {
                v179 = v5 + 2;
                unsigned int v180 = v177;
                do
                {
                  *(v179 - 1) = v180 | 0x80;
                  unsigned int v181 = v180 >> 7;
                  ++v179;
                  unsigned int v182 = v180 >> 14;
                  v180 >>= 7;
                }
                while (v182);
                *(v179 - 1) = v181;
              }
              else
              {
                v5[1] = v175 >> 7;
                v179 = v5 + 2;
              }
            }
            else
            {
              char *v5 = v175;
              v179 = v5 + 1;
            }
            unsigned char *v179 = v178;
            int v5 = v179 + 1;
            ++v174;
            v173 = *(_DWORD **)a1;
          }
          while (v174 < **(_DWORD **)a1);
        }
        return v5;
      case 9:
        uint64_t v183 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) < 1) {
          return v5;
        }
        int v184 = 0;
        unsigned int v185 = 8 * a2;
        uint64_t v186 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v186 = 5;
        }
        unsigned int v187 = (8 * a2) | 2;
        uint64_t v188 = 1;
        if (v185 >= 0x80) {
          uint64_t v188 = 2;
        }
        if (v185 < 0x200000) {
          uint64_t v186 = 3;
        }
        if (v185 >= 0x4000) {
          uint64_t v189 = v186;
        }
        else {
          uint64_t v189 = v188;
        }
        unsigned int v429 = v185 >> 7;
        while (1)
        {
          if (*a4 <= (unint64_t)v5)
          {
            int v5 = sub_236946668((uint64_t)a4, v5);
            uint64_t v183 = *(void *)a1;
          }
          uint64_t v190 = sub_23694168C(v183, v184);
          if (*(char *)(v190 + 23) < 0)
          {
            int64_t v191 = *(void *)(v190 + 8);
            if (v191 > 127) {
              goto LABEL_326;
            }
          }
          else
          {
            int64_t v191 = *(unsigned __int8 *)(v190 + 23);
          }
          if ((uint64_t)(*a4 + ~(unint64_t)&v5[v189] + 16) >= v191)
          {
            if (v187 > 0x7F)
            {
              char *v5 = (8 * a2) | 0x82;
              if (v187 >= 0x4000)
              {
                v192 = v5 + 2;
                unsigned int v193 = (a2 >> 4) & 0x1FFFFFF;
                do
                {
                  *(v192 - 1) = v193 | 0x80;
                  unsigned int v194 = v193 >> 7;
                  ++v192;
                  unsigned int v195 = v193 >> 14;
                  v193 >>= 7;
                }
                while (v195);
                *(v192 - 1) = v194;
              }
              else
              {
                v5[1] = v429;
                v192 = v5 + 2;
              }
            }
            else
            {
              v192 = v5 + 1;
              char *v5 = v187;
            }
            unsigned char *v192 = v191;
            v196 = v192 + 1;
            if (*(char *)(v190 + 23) >= 0) {
              v197 = (const void *)v190;
            }
            else {
              v197 = *(const void **)v190;
            }
            memcpy(v196, v197, v191);
            int v5 = &v196[v191];
            goto LABEL_324;
          }
LABEL_326:
          int v5 = sub_236946BD8(a4, a2, v190, v5);
LABEL_324:
          ++v184;
          uint64_t v183 = *(void *)a1;
          if (v184 >= *(_DWORD *)(*(void *)a1 + 8)) {
            return v5;
          }
        }
      case 10:
        uint64_t v198 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) >= 1)
        {
          int v199 = 0;
          unsigned int v200 = (8 * a2) | 3;
          char v201 = (8 * a2) | 0x83;
          unsigned int v202 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v203 = (8 * a2) | 4;
          unsigned int v204 = (8 * a2) >> 7;
          char v205 = (8 * a2) | 0x84;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              uint64_t v198 = *(void *)a1;
            }
            uint64_t v206 = sub_236951AF4(v198, v199);
            if (v200 > 0x7F)
            {
              char *v5 = v201;
              if (v200 >= 0x4000)
              {
                v207 = v5 + 2;
                unsigned int v208 = v202;
                do
                {
                  *(v207 - 1) = v208 | 0x80;
                  unsigned int v209 = v208 >> 7;
                  ++v207;
                  unsigned int v210 = v208 >> 14;
                  v208 >>= 7;
                }
                while (v210);
                *(v207 - 1) = v209;
              }
              else
              {
                v5[1] = v204;
                v207 = v5 + 2;
              }
            }
            else
            {
              v207 = v5 + 1;
              char *v5 = v200;
            }
            v211 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t *))(*(void *)v206 + 96))(v206, v207, a4);
            if (*a4 <= (unint64_t)v211) {
              v211 = sub_236946668((uint64_t)a4, v211);
            }
            if (v203 > 0x7F)
            {
              char *v211 = v205;
              if (v203 >= 0x4000)
              {
                int v5 = v211 + 2;
                unsigned int v212 = v202;
                do
                {
                  *(v5 - 1) = v212 | 0x80;
                  unsigned int v213 = v212 >> 7;
                  ++v5;
                  unsigned int v214 = v212 >> 14;
                  v212 >>= 7;
                }
                while (v214);
                *(v5 - 1) = v213;
              }
              else
              {
                v211[1] = v204;
                int v5 = v211 + 2;
              }
            }
            else
            {
              int v5 = v211 + 1;
              char *v211 = v203;
            }
            ++v199;
            uint64_t v198 = *(void *)a1;
          }
          while (v199 < *(_DWORD *)(*(void *)a1 + 8));
        }
        return v5;
      case 11:
        uint64_t v215 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) >= 1)
        {
          int v216 = 0;
          unsigned int v217 = (8 * a2) | 2;
          unsigned int v218 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v219 = (8 * a2) >> 7;
          char v220 = (8 * a2) | 0x82;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              uint64_t v215 = *(void *)a1;
            }
            uint64_t v221 = sub_236951AF4(v215, v216);
            uint64_t v222 = v221;
            if (v217 > 0x7F)
            {
              char *v5 = v220;
              if (v217 >= 0x4000)
              {
                v223 = v5 + 2;
                unsigned int v224 = v218;
                do
                {
                  *(v223 - 1) = v224 | 0x80;
                  unsigned int v225 = v224 >> 7;
                  ++v223;
                  unsigned int v226 = v224 >> 14;
                  v224 >>= 7;
                }
                while (v226);
                *(v223 - 1) = v225;
              }
              else
              {
                v5[1] = v219;
                v223 = v5 + 2;
              }
            }
            else
            {
              v223 = v5 + 1;
              char *v5 = v217;
            }
            unsigned int v227 = (*(uint64_t (**)(uint64_t))(*(void *)v221 + 80))(v221);
            if (v227 > 0x7F)
            {
              unsigned char *v223 = v227 | 0x80;
              unsigned int v229 = v227 >> 7;
              if (v227 >> 14)
              {
                v228 = v223 + 2;
                do
                {
                  *(v228 - 1) = v229 | 0x80;
                  unsigned int v230 = v229 >> 7;
                  ++v228;
                  unsigned int v231 = v229 >> 14;
                  v229 >>= 7;
                }
                while (v231);
                *(v228 - 1) = v230;
              }
              else
              {
                v223[1] = v229;
                v228 = v223 + 2;
              }
            }
            else
            {
              unsigned char *v223 = v227;
              v228 = v223 + 1;
            }
            int v5 = (char *)(*(uint64_t (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v222 + 96))(v222, v228, a4);
            ++v216;
            uint64_t v215 = *(void *)a1;
          }
          while (v216 < *(_DWORD *)(*(void *)a1 + 8));
        }
        return v5;
      case 12:
        uint64_t v232 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) < 1) {
          return v5;
        }
        int v233 = 0;
        unsigned int v234 = 8 * a2;
        uint64_t v235 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v235 = 5;
        }
        unsigned int v236 = (8 * a2) | 2;
        uint64_t v237 = 1;
        if (v234 >= 0x80) {
          uint64_t v237 = 2;
        }
        if (v234 < 0x200000) {
          uint64_t v235 = 3;
        }
        if (v234 >= 0x4000) {
          uint64_t v238 = v235;
        }
        else {
          uint64_t v238 = v237;
        }
        unsigned int v430 = v234 >> 7;
        break;
      case 13:
        v247 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v248 = 0;
          unsigned int v249 = 8 * a2;
          char v250 = (8 * a2) | 0x80;
          unsigned int v251 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v247 = *(_DWORD **)a1;
            }
            unsigned int v252 = *(_DWORD *)sub_236957AA0(v247, v248);
            if (v249 > 0x7F)
            {
              char *v5 = v250;
              if (v249 >= 0x4000)
              {
                v253 = v5 + 2;
                unsigned int v254 = v251;
                do
                {
                  *(v253 - 1) = v254 | 0x80;
                  unsigned int v255 = v254 >> 7;
                  ++v253;
                  unsigned int v256 = v254 >> 14;
                  v254 >>= 7;
                }
                while (v256);
                *(v253 - 1) = v255;
              }
              else
              {
                v5[1] = v249 >> 7;
                v253 = v5 + 2;
              }
            }
            else
            {
              v253 = v5 + 1;
              char *v5 = v249;
            }
            if (v252 > 0x7F)
            {
              unsigned char *v253 = v252 | 0x80;
              unsigned int v257 = v252 >> 7;
              if (v252 >> 14)
              {
                int v5 = v253 + 2;
                do
                {
                  *(v5 - 1) = v257 | 0x80;
                  unsigned int v258 = v257 >> 7;
                  ++v5;
                  unsigned int v259 = v257 >> 14;
                  v257 >>= 7;
                }
                while (v259);
                *(v5 - 1) = v258;
              }
              else
              {
                v253[1] = v257;
                int v5 = v253 + 2;
              }
            }
            else
            {
              unsigned char *v253 = v252;
              int v5 = v253 + 1;
            }
            ++v248;
            v247 = *(_DWORD **)a1;
          }
          while (v248 < **(_DWORD **)a1);
        }
        return v5;
      case 14:
        v260 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v261 = 0;
          unsigned int v262 = 8 * a2;
          char v263 = (8 * a2) | 0x80;
          unsigned int v264 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v260 = *(_DWORD **)a1;
            }
            unint64_t v265 = *(int *)sub_236957444(v260, v261);
            if (v262 > 0x7F)
            {
              char *v5 = v263;
              if (v262 >= 0x4000)
              {
                v266 = v5 + 2;
                unsigned int v267 = v264;
                do
                {
                  *(v266 - 1) = v267 | 0x80;
                  unsigned int v268 = v267 >> 7;
                  ++v266;
                  unsigned int v269 = v267 >> 14;
                  v267 >>= 7;
                }
                while (v269);
                *(v266 - 1) = v268;
              }
              else
              {
                v5[1] = v262 >> 7;
                v266 = v5 + 2;
              }
            }
            else
            {
              v266 = v5 + 1;
              char *v5 = v262;
            }
            if (v265 > 0x7F)
            {
              unsigned char *v266 = v265 | 0x80;
              unint64_t v270 = v265 >> 7;
              if (v265 >> 14)
              {
                int v5 = v266 + 2;
                do
                {
                  *(v5 - 1) = v270 | 0x80;
                  unint64_t v271 = v270 >> 7;
                  ++v5;
                  unint64_t v272 = v270 >> 14;
                  v270 >>= 7;
                }
                while (v272);
                *(v5 - 1) = v271;
              }
              else
              {
                v266[1] = v270;
                int v5 = v266 + 2;
              }
            }
            else
            {
              unsigned char *v266 = v265;
              int v5 = v266 + 1;
            }
            ++v261;
            v260 = *(_DWORD **)a1;
          }
          while (v261 < **(_DWORD **)a1);
        }
        return v5;
      case 15:
        v273 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v274 = 0;
          unsigned int v275 = (8 * a2) | 5;
          unsigned int v276 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v277 = (8 * a2) >> 7;
          char v278 = (8 * a2) | 0x85;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v273 = *(_DWORD **)a1;
            }
            int v279 = *(_DWORD *)sub_236957444(v273, v274);
            if (v275 > 0x7F)
            {
              char *v5 = v278;
              if (v275 >= 0x4000)
              {
                v280 = v5 + 2;
                unsigned int v281 = v276;
                do
                {
                  *((unsigned char *)v280 - 1) = v281 | 0x80;
                  unsigned int v282 = v281 >> 7;
                  v280 = (_DWORD *)((char *)v280 + 1);
                  unsigned int v283 = v281 >> 14;
                  v281 >>= 7;
                }
                while (v283);
                *((unsigned char *)v280 - 1) = v282;
              }
              else
              {
                v5[1] = v277;
                v280 = v5 + 2;
              }
            }
            else
            {
              char *v5 = v275;
              v280 = v5 + 1;
            }
            _DWORD *v280 = v279;
            int v5 = (char *)(v280 + 1);
            ++v274;
            v273 = *(_DWORD **)a1;
          }
          while (v274 < **(_DWORD **)a1);
        }
        return v5;
      case 16:
        v284 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v285 = 0;
          unsigned int v286 = 8 * a2;
          unsigned int v287 = (8 * a2) | 1;
          char v288 = (8 * a2) | 0x81;
          unsigned int v289 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v290 = v286 >> 7;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v284 = *(_DWORD **)a1;
            }
            uint64_t v291 = *(void *)sub_2369580FC(v284, v285);
            if (v287 > 0x7F)
            {
              char *v5 = v288;
              if (v287 >= 0x4000)
              {
                v292 = v5 + 2;
                unsigned int v293 = v289;
                do
                {
                  *((unsigned char *)v292 - 1) = v293 | 0x80;
                  unsigned int v294 = v293 >> 7;
                  v292 = (void *)((char *)v292 + 1);
                  unsigned int v295 = v293 >> 14;
                  v293 >>= 7;
                }
                while (v295);
                *((unsigned char *)v292 - 1) = v294;
              }
              else
              {
                v5[1] = v290;
                v292 = v5 + 2;
              }
            }
            else
            {
              char *v5 = v287;
              v292 = v5 + 1;
            }
            void *v292 = v291;
            int v5 = (char *)(v292 + 1);
            ++v285;
            v284 = *(_DWORD **)a1;
          }
          while (v285 < **(_DWORD **)a1);
        }
        return v5;
      case 17:
        v296 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v297 = 0;
          unsigned int v298 = 8 * a2;
          char v299 = (8 * a2) | 0x80;
          unsigned int v300 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v296 = *(_DWORD **)a1;
            }
            int v301 = *(_DWORD *)sub_236957444(v296, v297);
            if (v298 > 0x7F)
            {
              char *v5 = v299;
              if (v298 >= 0x4000)
              {
                v302 = v5 + 2;
                unsigned int v303 = v300;
                do
                {
                  *(v302 - 1) = v303 | 0x80;
                  unsigned int v304 = v303 >> 7;
                  ++v302;
                  unsigned int v305 = v303 >> 14;
                  v303 >>= 7;
                }
                while (v305);
                *(v302 - 1) = v304;
              }
              else
              {
                v5[1] = v298 >> 7;
                v302 = v5 + 2;
              }
            }
            else
            {
              v302 = v5 + 1;
              char *v5 = v298;
            }
            unsigned int v306 = (2 * v301) ^ (v301 >> 31);
            if (v306 > 0x7F)
            {
              unsigned char *v302 = v306 | 0x80;
              unsigned int v307 = v306 >> 7;
              if (v306 >> 14)
              {
                int v5 = v302 + 2;
                do
                {
                  *(v5 - 1) = v307 | 0x80;
                  unsigned int v308 = v307 >> 7;
                  ++v5;
                  unsigned int v309 = v307 >> 14;
                  v307 >>= 7;
                }
                while (v309);
                *(v5 - 1) = v308;
              }
              else
              {
                v302[1] = v307;
                int v5 = v302 + 2;
              }
            }
            else
            {
              unsigned char *v302 = v306;
              int v5 = v302 + 1;
            }
            ++v297;
            v296 = *(_DWORD **)a1;
          }
          while (v297 < **(_DWORD **)a1);
        }
        return v5;
      case 18:
        v310 = *(_DWORD **)a1;
        if (**(int **)a1 >= 1)
        {
          int v311 = 0;
          unsigned int v312 = 8 * a2;
          char v313 = (8 * a2) | 0x80;
          unsigned int v314 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*a4 <= (unint64_t)v5)
            {
              int v5 = sub_236946668((uint64_t)a4, v5);
              v310 = *(_DWORD **)a1;
            }
            uint64_t v315 = *(void *)sub_2369580FC(v310, v311);
            if (v312 > 0x7F)
            {
              char *v5 = v313;
              if (v312 >= 0x4000)
              {
                v316 = v5 + 2;
                unsigned int v317 = v314;
                do
                {
                  *(v316 - 1) = v317 | 0x80;
                  unsigned int v318 = v317 >> 7;
                  ++v316;
                  unsigned int v319 = v317 >> 14;
                  v317 >>= 7;
                }
                while (v319);
                *(v316 - 1) = v318;
              }
              else
              {
                v5[1] = v312 >> 7;
                v316 = v5 + 2;
              }
            }
            else
            {
              v316 = v5 + 1;
              char *v5 = v312;
            }
            unint64_t v320 = (2 * v315) ^ (v315 >> 63);
            if (v320 > 0x7F)
            {
              unsigned char *v316 = v320 | 0x80;
              unint64_t v321 = v320 >> 7;
              if (v320 >> 14)
              {
                int v5 = v316 + 2;
                do
                {
                  *(v5 - 1) = v321 | 0x80;
                  unint64_t v322 = v321 >> 7;
                  ++v5;
                  unint64_t v323 = v321 >> 14;
                  v321 >>= 7;
                }
                while (v323);
                *(v5 - 1) = v322;
              }
              else
              {
                v316[1] = v321;
                int v5 = v316 + 2;
              }
            }
            else
            {
              unsigned char *v316 = v320;
              int v5 = v316 + 1;
            }
            ++v311;
            v310 = *(_DWORD **)a1;
          }
          while (v311 < **(_DWORD **)a1);
        }
        return v5;
      default:
        return v5;
    }
    while (1)
    {
      if (*a4 <= (unint64_t)v5)
      {
        int v5 = sub_236946668((uint64_t)a4, v5);
        uint64_t v232 = *(void *)a1;
      }
      uint64_t v239 = sub_23694168C(v232, v233);
      if (*(char *)(v239 + 23) < 0)
      {
        int64_t v240 = *(void *)(v239 + 8);
        if (v240 > 127) {
          goto LABEL_399;
        }
      }
      else
      {
        int64_t v240 = *(unsigned __int8 *)(v239 + 23);
      }
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v238] + 16) >= v240)
      {
        if (v236 > 0x7F)
        {
          char *v5 = (8 * a2) | 0x82;
          if (v236 >= 0x4000)
          {
            v241 = v5 + 2;
            unsigned int v242 = (a2 >> 4) & 0x1FFFFFF;
            do
            {
              *(v241 - 1) = v242 | 0x80;
              unsigned int v243 = v242 >> 7;
              ++v241;
              unsigned int v244 = v242 >> 14;
              v242 >>= 7;
            }
            while (v244);
            *(v241 - 1) = v243;
          }
          else
          {
            v5[1] = v430;
            v241 = v5 + 2;
          }
        }
        else
        {
          v241 = v5 + 1;
          char *v5 = v236;
        }
        unsigned char *v241 = v240;
        v245 = v241 + 1;
        if (*(char *)(v239 + 23) >= 0) {
          v246 = (const void *)v239;
        }
        else {
          v246 = *(const void **)v239;
        }
        memcpy(v245, v246, v240);
        int v5 = &v245[v240];
        goto LABEL_397;
      }
LABEL_399:
      int v5 = sub_236946BD8(a4, a2, v239, v5);
LABEL_397:
      ++v233;
      uint64_t v232 = *(void *)a1;
      if (v233 >= *(_DWORD *)(*(void *)a1 + 8)) {
        return v5;
      }
    }
  }
  if (a1[10]) {
    return v5;
  }
  int v10 = a1[8];
  if ((v10 - 19) <= 0xFFFFFFED)
  {
    sub_2369470F4((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    uint64_t v11 = sub_23694710C(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    sub_236947248((uint64_t)&v431, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v432);
  }
  switch(v10)
  {
    case 1:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      uint64_t v12 = *(void *)a1;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 <= 0x7F) {
        goto LABEL_575;
      }
      char *v5 = (8 * a2) | 0x81;
      unsigned int v14 = (8 * a2) >> 7;
      if (!(v13 >> 14)) {
        goto LABEL_602;
      }
      uint64_t v15 = v5 + 2;
      do
      {
        *((unsigned char *)v15 - 1) = v14 | 0x80;
        unsigned int v16 = v14 >> 7;
        uint64_t v15 = (void *)((char *)v15 + 1);
        unsigned int v17 = v14 >> 14;
        v14 >>= 7;
      }
      while (v17);
      goto LABEL_693;
    case 2:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      int v324 = *(_DWORD *)a1;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 <= 0x7F) {
        goto LABEL_571;
      }
      char *v5 = (8 * a2) | 0x85;
      unsigned int v326 = (8 * a2) >> 7;
      if (!(v325 >> 14)) {
        goto LABEL_600;
      }
      v327 = v5 + 2;
      do
      {
        *((unsigned char *)v327 - 1) = v326 | 0x80;
        unsigned int v328 = v326 >> 7;
        v327 = (_DWORD *)((char *)v327 + 1);
        unsigned int v329 = v326 >> 14;
        v326 >>= 7;
      }
      while (v329);
      goto LABEL_689;
    case 3:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      unint64_t v330 = *(void *)a1;
      unsigned int v331 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v331 | 0x80;
        unsigned int v355 = v331 >> 7;
        if (v331 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v355 | 0x80;
            unsigned int v380 = v355 >> 7;
            ++v332;
            unsigned int v381 = v355 >> 14;
            v355 >>= 7;
          }
          while (v381);
          *(v332 - 1) = v380;
        }
        else
        {
          v5[1] = v355;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v331;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v384 = v382 >> 14;
        v382 >>= 7;
      }
      while (v384);
      goto LABEL_718;
    case 4:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      unint64_t v330 = *(void *)a1;
      unsigned int v333 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v333 | 0x80;
        unsigned int v356 = v333 >> 7;
        if (v333 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v356 | 0x80;
            unsigned int v385 = v356 >> 7;
            ++v332;
            unsigned int v386 = v356 >> 14;
            v356 >>= 7;
          }
          while (v386);
          *(v332 - 1) = v385;
        }
        else
        {
          v5[1] = v356;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v333;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v387 = v382 >> 14;
        v382 >>= 7;
      }
      while (v387);
      goto LABEL_718;
    case 5:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      unint64_t v330 = *(int *)a1;
      unsigned int v334 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v334 | 0x80;
        unsigned int v357 = v334 >> 7;
        if (v334 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v357 | 0x80;
            unsigned int v388 = v357 >> 7;
            ++v332;
            unsigned int v389 = v357 >> 14;
            v357 >>= 7;
          }
          while (v389);
          *(v332 - 1) = v388;
        }
        else
        {
          v5[1] = v357;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v334;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F) {
        goto LABEL_684;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14)) {
        goto LABEL_686;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v390 = v382 >> 14;
        v382 >>= 7;
      }
      while (v390);
      goto LABEL_718;
    case 6:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      uint64_t v12 = *(void *)a1;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 <= 0x7F) {
        goto LABEL_575;
      }
      char *v5 = (8 * a2) | 0x81;
      unsigned int v14 = (8 * a2) >> 7;
      if (!(v13 >> 14)) {
        goto LABEL_602;
      }
      uint64_t v15 = v5 + 2;
      do
      {
        *((unsigned char *)v15 - 1) = v14 | 0x80;
        unsigned int v16 = v14 >> 7;
        uint64_t v15 = (void *)((char *)v15 + 1);
        unsigned int v335 = v14 >> 14;
        v14 >>= 7;
      }
      while (v335);
      goto LABEL_693;
    case 7:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      int v324 = *(_DWORD *)a1;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 <= 0x7F) {
        goto LABEL_571;
      }
      char *v5 = (8 * a2) | 0x85;
      unsigned int v326 = (8 * a2) >> 7;
      if (!(v325 >> 14)) {
        goto LABEL_600;
      }
      v327 = v5 + 2;
      do
      {
        *((unsigned char *)v327 - 1) = v326 | 0x80;
        unsigned int v328 = v326 >> 7;
        v327 = (_DWORD *)((char *)v327 + 1);
        unsigned int v336 = v326 >> 14;
        v326 >>= 7;
      }
      while (v336);
      goto LABEL_689;
    case 8:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      LOBYTE(v337) = *a1;
      unsigned int v338 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v338 | 0x80;
        unsigned int v358 = v338 >> 7;
        if (v338 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v358 | 0x80;
            unsigned int v391 = v358 >> 7;
            ++v332;
            unsigned int v392 = v358 >> 14;
            v358 >>= 7;
          }
          while (v392);
          *(v332 - 1) = v391;
        }
        else
        {
          v5[1] = v358;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v338;
        v332 = v5 + 1;
      }
      goto LABEL_677;
    case 9:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      v339 = *(void **)a1;
      if (*(char *)(*(void *)a1 + 23) < 0)
      {
        int64_t v340 = v339[1];
        if (v340 > 127) {
          return sub_236946BD8(a4, a2, (uint64_t)v339, v5);
        }
      }
      else
      {
        int64_t v340 = *(unsigned __int8 *)(*(void *)a1 + 23);
      }
      unsigned int v364 = 8 * a2;
      uint64_t v365 = 1;
      uint64_t v366 = 2;
      uint64_t v367 = 3;
      uint64_t v368 = 4;
      if ((8 * a2) >> 28) {
        uint64_t v368 = 5;
      }
      if (v364 >= 0x200000) {
        uint64_t v367 = v368;
      }
      if (v364 >= 0x4000) {
        uint64_t v366 = v367;
      }
      if (v364 >= 0x80) {
        uint64_t v365 = v366;
      }
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v365] + 16) < v340) {
        return sub_236946BD8(a4, a2, (uint64_t)v339, v5);
      }
      unsigned int v369 = v364 | 2;
      if ((v364 | 2) <= 0x7F) {
        goto LABEL_633;
      }
      char *v5 = v364 | 0x82;
      unsigned int v370 = v364 >> 7;
      if (!(v369 >> 14)) {
        goto LABEL_635;
      }
      v371 = v5 + 2;
      do
      {
        *(v371 - 1) = v370 | 0x80;
        unsigned int v372 = v370 >> 7;
        ++v371;
        unsigned int v373 = v370 >> 14;
        v370 >>= 7;
      }
      while (v373);
      goto LABEL_727;
    case 10:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      uint64_t v341 = *(void *)a1;
      unsigned int v342 = 8 * a2;
      unsigned int v343 = (8 * a2) | 3;
      unsigned int v344 = (8 * a2) >> 7;
      if (v343 > 0x7F)
      {
        char *v5 = (8 * a2) | 0x83;
        if (v343 >> 14)
        {
          v345 = v5 + 2;
          unsigned int v393 = v342 >> 7;
          do
          {
            *(v345 - 1) = v393 | 0x80;
            unsigned int v394 = v393 >> 7;
            ++v345;
            unsigned int v395 = v393 >> 14;
            v393 >>= 7;
          }
          while (v395);
          *(v345 - 1) = v394;
        }
        else
        {
          v5[1] = v344;
          v345 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v343;
        v345 = v5 + 1;
      }
      v332 = (char *)(*(uint64_t (**)(uint64_t, char *, uint64_t *))(*(void *)v341 + 96))(v341, v345, a4);
      if (*a4 <= (unint64_t)v332) {
        v332 = sub_236946668((uint64_t)a4, v332);
      }
      unsigned int v337 = v342 | 4;
      if ((v342 | 4) <= 0x7F) {
        goto LABEL_677;
      }
      char *v332 = v342 | 0x84;
      if (!(v337 >> 14))
      {
        v332[1] = v344;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v344 | 0x80;
        unsigned int v411 = v344 >> 7;
        ++v5;
        unsigned int v412 = v344 >> 14;
        v344 >>= 7;
      }
      while (v412);
      goto LABEL_715;
    case 11:
      if ((a1[10] & 0x10) != 0) {
        return (char *)(*(uint64_t (**)(void, uint64_t, char *, uint64_t *))(**(void **)a1 + 136))(*(void *)a1, a2, v5, a4);
      }
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      uint64_t v346 = *(void *)a1;
      unsigned int v347 = (8 * a2) | 2;
      if (v347 > 0x7F)
      {
        char *v5 = (8 * a2) | 0x82;
        unsigned int v379 = (8 * a2) >> 7;
        if (v347 >> 14)
        {
          v348 = v5 + 2;
          do
          {
            *(v348 - 1) = v379 | 0x80;
            unsigned int v421 = v379 >> 7;
            ++v348;
            unsigned int v422 = v379 >> 14;
            v379 >>= 7;
          }
          while (v422);
          *(v348 - 1) = v421;
        }
        else
        {
          v5[1] = v379;
          v348 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v347;
        v348 = v5 + 1;
      }
      unsigned int v423 = (*(uint64_t (**)(uint64_t))(*(void *)v346 + 80))(v346);
      if (v423 > 0x7F)
      {
        unsigned char *v348 = v423 | 0x80;
        unsigned int v425 = v423 >> 7;
        if (v423 >> 14)
        {
          v424 = v348 + 2;
          do
          {
            *(v424 - 1) = v425 | 0x80;
            unsigned int v426 = v425 >> 7;
            ++v424;
            unsigned int v427 = v425 >> 14;
            v425 >>= 7;
          }
          while (v427);
          *(v424 - 1) = v426;
        }
        else
        {
          v348[1] = v425;
          v424 = v348 + 2;
        }
      }
      else
      {
        unsigned char *v348 = v423;
        v424 = v348 + 1;
      }
      return (char *)(*(uint64_t (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v346 + 96))(v346, v424, a4);
    case 12:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      v339 = *(void **)a1;
      if (*(char *)(*(void *)a1 + 23) < 0)
      {
        int64_t v340 = v339[1];
        if (v340 > 127) {
          return sub_236946BD8(a4, a2, (uint64_t)v339, v5);
        }
      }
      else
      {
        int64_t v340 = *(unsigned __int8 *)(*(void *)a1 + 23);
      }
      unsigned int v374 = 8 * a2;
      uint64_t v375 = 1;
      uint64_t v376 = 2;
      uint64_t v377 = 3;
      uint64_t v378 = 4;
      if ((8 * a2) >> 28) {
        uint64_t v378 = 5;
      }
      if (v374 >= 0x200000) {
        uint64_t v377 = v378;
      }
      if (v374 >= 0x4000) {
        uint64_t v376 = v377;
      }
      if (v374 >= 0x80) {
        uint64_t v375 = v376;
      }
      if ((uint64_t)(*a4 + ~(unint64_t)&v5[v375] + 16) < v340) {
        return sub_236946BD8(a4, a2, (uint64_t)v339, v5);
      }
      unsigned int v369 = v374 | 2;
      if ((v374 | 2) > 0x7F)
      {
        char *v5 = v374 | 0x82;
        unsigned int v370 = v374 >> 7;
        if (v369 >> 14)
        {
          v371 = v5 + 2;
          do
          {
            *(v371 - 1) = v370 | 0x80;
            unsigned int v372 = v370 >> 7;
            ++v371;
            unsigned int v419 = v370 >> 14;
            v370 >>= 7;
          }
          while (v419);
LABEL_727:
          *(v371 - 1) = v372;
        }
        else
        {
LABEL_635:
          v5[1] = v370;
          v371 = v5 + 2;
        }
      }
      else
      {
LABEL_633:
        char *v5 = v369;
        v371 = v5 + 1;
      }
      unsigned char *v371 = v340;
      v420 = v371 + 1;
      if (*((char *)v339 + 23) < 0) {
        v339 = (void *)*v339;
      }
      memcpy(v420, v339, v340);
      return &v420[v340];
    case 13:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      unsigned int v337 = *(_DWORD *)a1;
      unsigned int v349 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v349 | 0x80;
        unsigned int v360 = v349 >> 7;
        if (v349 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v360 | 0x80;
            unsigned int v396 = v360 >> 7;
            ++v332;
            unsigned int v397 = v360 >> 14;
            v360 >>= 7;
          }
          while (v397);
          *(v332 - 1) = v396;
        }
        else
        {
          v5[1] = v360;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v349;
        v332 = v5 + 1;
      }
      if (v337 <= 0x7F)
      {
LABEL_677:
        char *v332 = v337;
        return v332 + 1;
      }
      char *v332 = v337 | 0x80;
      unsigned int v398 = v337 >> 7;
      if (!(v337 >> 14))
      {
        v332[1] = v398;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v398 | 0x80;
        unsigned int v411 = v398 >> 7;
        ++v5;
        unsigned int v413 = v398 >> 14;
        v398 >>= 7;
      }
      while (v413);
LABEL_715:
      *(v5 - 1) = v411;
      return v5;
    case 14:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      unint64_t v330 = *(int *)a1;
      unsigned int v350 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v350 | 0x80;
        unsigned int v361 = v350 >> 7;
        if (v350 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v361 | 0x80;
            unsigned int v399 = v361 >> 7;
            ++v332;
            unsigned int v400 = v361 >> 14;
            v361 >>= 7;
          }
          while (v400);
          *(v332 - 1) = v399;
        }
        else
        {
          v5[1] = v361;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v350;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
      {
LABEL_684:
        char *v332 = v330;
        return v332 + 1;
      }
      char *v332 = v330 | 0x80;
      unint64_t v382 = v330 >> 7;
      if (!(v330 >> 14))
      {
LABEL_686:
        v332[1] = v382;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        unint64_t v383 = v382 >> 7;
        ++v5;
        unint64_t v414 = v382 >> 14;
        v382 >>= 7;
      }
      while (v414);
LABEL_718:
      *(v5 - 1) = v383;
      return v5;
    case 15:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      int v324 = *(_DWORD *)a1;
      unsigned int v325 = (8 * a2) | 5;
      if (v325 > 0x7F)
      {
        char *v5 = (8 * a2) | 0x85;
        unsigned int v326 = (8 * a2) >> 7;
        if (v325 >> 14)
        {
          v327 = v5 + 2;
          do
          {
            *((unsigned char *)v327 - 1) = v326 | 0x80;
            unsigned int v328 = v326 >> 7;
            v327 = (_DWORD *)((char *)v327 + 1);
            unsigned int v401 = v326 >> 14;
            v326 >>= 7;
          }
          while (v401);
LABEL_689:
          *((unsigned char *)v327 - 1) = v328;
        }
        else
        {
LABEL_600:
          v5[1] = v326;
          v327 = v5 + 2;
        }
      }
      else
      {
LABEL_571:
        char *v5 = v325;
        v327 = v5 + 1;
      }
      _DWORD *v327 = v324;
      return (char *)(v327 + 1);
    case 16:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      uint64_t v12 = *(void *)a1;
      unsigned int v13 = (8 * a2) | 1;
      if (v13 > 0x7F)
      {
        char *v5 = (8 * a2) | 0x81;
        unsigned int v14 = (8 * a2) >> 7;
        if (v13 >> 14)
        {
          uint64_t v15 = v5 + 2;
          do
          {
            *((unsigned char *)v15 - 1) = v14 | 0x80;
            unsigned int v16 = v14 >> 7;
            uint64_t v15 = (void *)((char *)v15 + 1);
            unsigned int v402 = v14 >> 14;
            v14 >>= 7;
          }
          while (v402);
LABEL_693:
          *((unsigned char *)v15 - 1) = v16;
        }
        else
        {
LABEL_602:
          v5[1] = v14;
          uint64_t v15 = v5 + 2;
        }
      }
      else
      {
LABEL_575:
        char *v5 = v13;
        uint64_t v15 = v5 + 1;
      }
      *uint64_t v15 = v12;
      return (char *)(v15 + 1);
    case 17:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      int v351 = *(_DWORD *)a1;
      unsigned int v352 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v352 | 0x80;
        unsigned int v362 = v352 >> 7;
        if (v352 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v362 | 0x80;
            unsigned int v403 = v362 >> 7;
            ++v332;
            unsigned int v404 = v362 >> 14;
            v362 >>= 7;
          }
          while (v404);
          *(v332 - 1) = v403;
        }
        else
        {
          v5[1] = v362;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v352;
        v332 = v5 + 1;
      }
      unsigned int v405 = (2 * v351) ^ (v351 >> 31);
      if (v405 <= 0x7F)
      {
        char *v332 = v405;
        return v332 + 1;
      }
      char *v332 = v405 | 0x80;
      unsigned int v406 = v405 >> 7;
      if (!(v405 >> 14))
      {
        v332[1] = v406;
        return v332 + 2;
      }
      int v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v406 | 0x80;
        unsigned int v415 = v406 >> 7;
        ++v5;
        unsigned int v416 = v406 >> 14;
        v406 >>= 7;
      }
      while (v416);
      *(v5 - 1) = v415;
      return v5;
    case 18:
      if (*a4 <= (unint64_t)v5) {
        int v5 = sub_236946668((uint64_t)a4, v5);
      }
      uint64_t v353 = *(void *)a1;
      unsigned int v354 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        char *v5 = v354 | 0x80;
        unsigned int v363 = v354 >> 7;
        if (v354 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v363 | 0x80;
            unsigned int v407 = v363 >> 7;
            ++v332;
            unsigned int v408 = v363 >> 14;
            v363 >>= 7;
          }
          while (v408);
          *(v332 - 1) = v407;
        }
        else
        {
          v5[1] = v363;
          v332 = v5 + 2;
        }
      }
      else
      {
        char *v5 = v354;
        v332 = v5 + 1;
      }
      unint64_t v409 = (2 * v353) ^ (v353 >> 63);
      if (v409 > 0x7F)
      {
        char *v332 = v409 | 0x80;
        unint64_t v410 = v409 >> 7;
        if (v409 >> 14)
        {
          int v5 = v332 + 2;
          do
          {
            *(v5 - 1) = v410 | 0x80;
            unint64_t v417 = v410 >> 7;
            ++v5;
            unint64_t v418 = v410 >> 14;
            v410 >>= 7;
          }
          while (v418);
          *(v5 - 1) = v417;
        }
        else
        {
          v332[1] = v410;
          return v332 + 2;
        }
      }
      else
      {
        char *v332 = v409;
        return v332 + 1;
      }
      return v5;
    default:
      return v5;
  }
}

void sub_236950890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236950998(uint64_t a1)
{
  v1 = *(int **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) < 0x101u)
  {
    if (*(_WORD *)(a1 + 10))
    {
      uint64_t v2 = 0;
      uint64_t v3 = &v1[8 * *(unsigned __int16 *)(a1 + 10)];
      do
      {
        uint64_t v4 = (_DWORD **)(v1 + 2);
        int v5 = *v1;
        v1 += 8;
        v2 += sub_236950A5C(v4, v5);
      }
      while (v1 != v3);
      return v2;
    }
    return 0;
  }
  unsigned int v8 = *(int **)v1;
  uint64_t v6 = v1 + 2;
  uint64_t v7 = v8;
  if (v8 == v6) {
    return 0;
  }
  uint64_t v2 = 0;
  do
  {
    unint64_t v9 = sub_236950A5C((_DWORD **)v7 + 5, v7[8]);
    int v10 = (int *)*((void *)v7 + 1);
    if (v10)
    {
      do
      {
        uint64_t v11 = v10;
        int v10 = *(int **)v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        uint64_t v11 = (int *)*((void *)v7 + 2);
        BOOL v12 = *(void *)v11 == (void)v7;
        uint64_t v7 = v11;
      }
      while (!v12);
    }
    v2 += v9;
    uint64_t v7 = v11;
  }
  while (v11 != v6);
  return v2;
}

unint64_t sub_236950A5C(_DWORD **a1, int a2)
{
  if (*((unsigned char *)a1 + 9))
  {
    int v4 = *((unsigned __int8 *)a1 + 8);
    unsigned __int8 v5 = v4 - 19;
    if (*((unsigned char *)a1 + 11))
    {
      if ((v4 - 19) <= 0xEDu)
      {
        sub_2369470F4((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        uint64_t v6 = sub_23694710C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_236947248((uint64_t)&v101, (const char **)&v6->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)v102);
      }
      switch(v4)
      {
        case 1:
        case 6:
        case 16:
          uint64_t v21 = 8 * **a1;
          goto LABEL_63;
        case 2:
        case 7:
        case 15:
          uint64_t v21 = 4 * **a1;
          goto LABEL_63;
        case 3:
          uint64_t v27 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v28 = 0;
          do
          {
            v21 += (9 * (__clz(*(void *)sub_2369580FC(v27, v28++) | 1) ^ 0x3F) + 73) >> 6;
            uint64_t v27 = *a1;
          }
          while (v28 < **a1);
          goto LABEL_63;
        case 4:
          unsigned int v29 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v30 = 0;
          do
          {
            v21 += (9 * (__clz(*(void *)sub_236958758(v29, v30++) | 1) ^ 0x3F) + 73) >> 6;
            unsigned int v29 = *a1;
          }
          while (v30 < **a1);
          goto LABEL_63;
        case 5:
          unsigned int v31 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v32 = 0;
          do
          {
            unsigned int v33 = (int *)sub_236957444(v31, v32);
            uint64_t v34 = (9 * (__clz(*v33 | 1) ^ 0x1F) + 73) >> 6;
            if (*v33 >= 0) {
              uint64_t v35 = v34;
            }
            else {
              uint64_t v35 = 10;
            }
            v21 += v35;
            ++v32;
            unsigned int v31 = *a1;
          }
          while (v32 < **a1);
          goto LABEL_63;
        case 8:
          uint64_t v21 = **a1;
          goto LABEL_63;
        case 9:
        case 10:
        case 11:
        case 12:
          sub_2369470F4((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1599);
          uint64_t v7 = sub_23694710C(v102, "Non-primitive types can't be packed.");
          sub_236947248((uint64_t)&v101, (const char **)&v7->__r_.__value_.__l.__data_);
          sub_236947250((uint64_t)v102);
          goto LABEL_7;
        case 13:
          unsigned int v22 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v23 = 0;
          do
          {
            v21 += (9 * (__clz(*(_DWORD *)sub_236957AA0(v22, v23++) | 1) ^ 0x1F) + 73) >> 6;
            unsigned int v22 = *a1;
          }
          while (v23 < **a1);
          goto LABEL_63;
        case 14:
          unint64_t v36 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v37 = 0;
          do
          {
            unint64_t v38 = (int *)sub_236957444(v36, v37);
            uint64_t v39 = (9 * (__clz(*v38 | 1) ^ 0x1F) + 73) >> 6;
            if (*v38 >= 0) {
              uint64_t v40 = v39;
            }
            else {
              uint64_t v40 = 10;
            }
            v21 += v40;
            ++v37;
            unint64_t v36 = *a1;
          }
          while (v37 < **a1);
          goto LABEL_63;
        case 17:
          char v24 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v25 = 0;
          do
          {
            unsigned int v26 = (int *)sub_236957444(v24, v25);
            v21 += (9 * (__clz((2 * *v26) ^ (*v26 >> 31) | 1) ^ 0x1F) + 73) >> 6;
            ++v25;
            char v24 = *a1;
          }
          while (v25 < **a1);
          goto LABEL_63;
        case 18:
          uint64_t v41 = *a1;
          if ((int)**a1 < 1) {
            goto LABEL_7;
          }
          uint64_t v21 = 0;
          int v42 = 0;
          do
          {
            int v43 = (uint64_t *)sub_2369580FC(v41, v42);
            v21 += (9 * (__clz((2 * *v43) ^ (*v43 >> 63) | 1) ^ 0x3F) + 73) >> 6;
            ++v42;
            uint64_t v41 = *a1;
          }
          while (v42 < **a1);
LABEL_63:
          *((_DWORD *)a1 + 3) = v21;
          unint64_t v44 = v21 + ((9 * (__clz((8 * a2) | 3) ^ 0x1F) + 73) >> 6) + ((9 * (__clz(v21 | 1) ^ 0x1F) + 73) >> 6);
          if (v21) {
            unint64_t v8 = v44;
          }
          else {
            unint64_t v8 = 0;
          }
          break;
        default:
LABEL_7:
          unint64_t v8 = 0;
          *((_DWORD *)a1 + 3) = 0;
          break;
      }
    }
    else
    {
      if ((v4 - 19) > 0xEDu)
      {
        int v14 = *((unsigned __int8 *)a1 + 8);
      }
      else
      {
        sub_2369470F4((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        unsigned int v13 = sub_23694710C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_236947248((uint64_t)&v101, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)v102);
        int v14 = *((unsigned __int8 *)a1 + 8);
        unsigned __int8 v5 = v14 - 19;
      }
      char v15 = v4 == 10;
      if (v5 <= 0xEDu)
      {
        sub_2369470F4((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        unsigned int v16 = sub_23694710C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        sub_236947248((uint64_t)&v101, (const char **)&v16->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)v102);
      }
      unint64_t v17 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v15;
      switch(v14)
      {
        case 1:
        case 6:
        case 16:
          unsigned int v18 = v17 + 8;
          goto LABEL_27;
        case 2:
        case 7:
        case 15:
          unsigned int v18 = v17 + 4;
LABEL_27:
          unint64_t v8 = v18 * (unint64_t)**a1;
          break;
        case 3:
          unsigned int v50 = *a1;
          int v51 = **a1;
          unint64_t v8 = v17 * (unint64_t)v51;
          if (v51 >= 1)
          {
            int v52 = 0;
            do
            {
              v8 += (9 * (__clz(*(void *)sub_2369580FC(v50, v52++) | 1) ^ 0x3F) + 73) >> 6;
              unsigned int v50 = *a1;
            }
            while (v52 < **a1);
          }
          break;
        case 4:
          unsigned int v53 = *a1;
          int v54 = **a1;
          unint64_t v8 = v17 * (unint64_t)v54;
          if (v54 >= 1)
          {
            int v55 = 0;
            do
            {
              v8 += (9 * (__clz(*(void *)sub_236958758(v53, v55++) | 1) ^ 0x3F) + 73) >> 6;
              unsigned int v53 = *a1;
            }
            while (v55 < **a1);
          }
          break;
        case 5:
          int v56 = *a1;
          int v57 = **a1;
          unint64_t v8 = v17 * (unint64_t)v57;
          if (v57 >= 1)
          {
            int v58 = 0;
            do
            {
              unsigned int v59 = (int *)sub_236957444(v56, v58);
              uint64_t v60 = (9 * (__clz(*v59 | 1) ^ 0x1F) + 73) >> 6;
              if (*v59 >= 0) {
                uint64_t v61 = v60;
              }
              else {
                uint64_t v61 = 10;
              }
              v8 += v61;
              ++v58;
              int v56 = *a1;
            }
            while (v58 < **a1);
          }
          break;
        case 8:
          unint64_t v8 = **a1 + **a1 * (unint64_t)v17;
          break;
        case 9:
          unsigned int v62 = *a1;
          int v63 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v63;
          if (v63 >= 1)
          {
            int v64 = 0;
            do
            {
              uint64_t v65 = sub_23694168C((uint64_t)v62, v64);
              uint64_t v66 = *(unsigned __int8 *)(v65 + 23);
              if ((v66 & 0x80u) != 0) {
                uint64_t v66 = *(void *)(v65 + 8);
              }
              v8 += v66 + ((9 * (__clz(v66 | 1) ^ 0x1F) + 73) >> 6);
              ++v64;
              unsigned int v62 = *a1;
            }
            while (v64 < (*a1)[2]);
          }
          break;
        case 10:
          int v67 = *a1;
          int v68 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v68;
          if (v68 >= 1)
          {
            int v69 = 0;
            do
            {
              uint64_t v70 = sub_236951AF4((uint64_t)v67, v69);
              v8 += (*(uint64_t (**)(uint64_t))(*(void *)v70 + 72))(v70);
              ++v69;
              int v67 = *a1;
            }
            while (v69 < (*a1)[2]);
          }
          break;
        case 11:
          unint64_t v71 = *a1;
          int v72 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v72;
          if (v72 >= 1)
          {
            int v73 = 0;
            do
            {
              uint64_t v74 = sub_236951AF4((uint64_t)v71, v73);
              uint64_t v75 = (*(uint64_t (**)(uint64_t))(*(void *)v74 + 72))(v74);
              v8 += v75 + ((9 * (__clz(v75 | 1) ^ 0x1F) + 73) >> 6);
              ++v73;
              unint64_t v71 = *a1;
            }
            while (v73 < (*a1)[2]);
          }
          break;
        case 12:
          unint64_t v76 = *a1;
          int v77 = (*a1)[2];
          unint64_t v8 = v17 * (unint64_t)v77;
          if (v77 >= 1)
          {
            int v78 = 0;
            do
            {
              uint64_t v79 = sub_23694168C((uint64_t)v76, v78);
              uint64_t v80 = *(unsigned __int8 *)(v79 + 23);
              if ((v80 & 0x80u) != 0) {
                uint64_t v80 = *(void *)(v79 + 8);
              }
              v8 += v80 + ((9 * (__clz(v80 | 1) ^ 0x1F) + 73) >> 6);
              ++v78;
              unint64_t v76 = *a1;
            }
            while (v78 < (*a1)[2]);
          }
          break;
        case 13:
          int v81 = *a1;
          int v82 = **a1;
          unint64_t v8 = v17 * (unint64_t)v82;
          if (v82 >= 1)
          {
            int v83 = 0;
            do
            {
              v8 += (9 * (__clz(*(_DWORD *)sub_236957AA0(v81, v83++) | 1) ^ 0x1F) + 73) >> 6;
              int v81 = *a1;
            }
            while (v83 < **a1);
          }
          break;
        case 14:
          int v84 = *a1;
          int v85 = **a1;
          unint64_t v8 = v17 * (unint64_t)v85;
          if (v85 >= 1)
          {
            int v86 = 0;
            do
            {
              unint64_t v87 = (int *)sub_236957444(v84, v86);
              uint64_t v88 = (9 * (__clz(*v87 | 1) ^ 0x1F) + 73) >> 6;
              if (*v87 >= 0) {
                uint64_t v89 = v88;
              }
              else {
                uint64_t v89 = 10;
              }
              v8 += v89;
              ++v86;
              int v84 = *a1;
            }
            while (v86 < **a1);
          }
          break;
        case 17:
          unint64_t v90 = *a1;
          int v91 = **a1;
          unint64_t v8 = v17 * (unint64_t)v91;
          if (v91 >= 1)
          {
            int v92 = 0;
            do
            {
              v93 = (int *)sub_236957444(v90, v92);
              v8 += (9 * (__clz((2 * *v93) ^ (*v93 >> 31) | 1) ^ 0x1F) + 73) >> 6;
              ++v92;
              unint64_t v90 = *a1;
            }
            while (v92 < **a1);
          }
          break;
        case 18:
          int v94 = *a1;
          int v95 = **a1;
          unint64_t v8 = v17 * (unint64_t)v95;
          if (v95 >= 1)
          {
            int v96 = 0;
            do
            {
              unint64_t v97 = (uint64_t *)sub_2369580FC(v94, v96);
              v8 += (9 * (__clz((2 * *v97) ^ (*v97 >> 63) | 1) ^ 0x3F) + 73) >> 6;
              ++v96;
              int v94 = *a1;
            }
            while (v96 < **a1);
          }
          break;
        default:
          return 0;
      }
    }
  }
  else if (*((unsigned char *)a1 + 10))
  {
    return 0;
  }
  else
  {
    int v9 = *((unsigned __int8 *)a1 + 8);
    unsigned __int8 v10 = v9 - 19;
    if ((v9 - 19) > 0xEDu)
    {
      int v12 = *((unsigned __int8 *)a1 + 8);
    }
    else
    {
      sub_2369470F4((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v11 = sub_23694710C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_236947248((uint64_t)&v101, (const char **)&v11->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v102);
      int v12 = *((unsigned __int8 *)a1 + 8);
      unsigned __int8 v10 = v12 - 19;
    }
    char v19 = v9 == 10;
    if (v10 <= 0xEDu)
    {
      sub_2369470F4((uint64_t)v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      int v20 = sub_23694710C(v102, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_236947248((uint64_t)&v101, (const char **)&v20->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v102);
    }
    unint64_t v8 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v19;
    switch(v12)
    {
      case 1:
      case 6:
      case 16:
        v8 += 8;
        return v8;
      case 2:
      case 7:
      case 15:
        v8 += 4;
        return v8;
      case 3:
      case 4:
        unint64_t v46 = (unint64_t)*a1;
        goto LABEL_138;
      case 5:
      case 14:
        uint64_t v47 = (9 * (__clz(*(_DWORD *)a1 | 1) ^ 0x1F) + 73) >> 6;
        if (*(int *)a1 >= 0) {
          uint64_t v48 = v47;
        }
        else {
          uint64_t v48 = 10;
        }
        v8 += v48;
        return v8;
      case 8:
        return ++v8;
      case 9:
      case 12:
        uint64_t v49 = *((void *)*a1 + 1);
        if (*((char *)*a1 + 23) >= 0) {
          uint64_t v49 = *((unsigned __int8 *)*a1 + 23);
        }
        v8 += v49 + ((9 * (__clz(v49 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 10:
        v8 += (*(uint64_t (**)(void))(*(void *)*a1 + 72))();
        return v8;
      case 11:
        uint64_t v98 = *(void *)*a1;
        if ((*((unsigned char *)a1 + 10) & 0x10) != 0) {
          uint64_t v99 = (*(uint64_t (**)(void))(v98 + 88))();
        }
        else {
          uint64_t v99 = (*(uint64_t (**)(void))(v98 + 72))();
        }
        v8 += v99 + ((9 * (__clz(v99 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 13:
        int v100 = *(_DWORD *)a1;
        goto LABEL_136;
      case 17:
        int v100 = (2 * *(_DWORD *)a1) ^ (*(int *)a1 >> 31);
LABEL_136:
        v8 += (9 * (__clz(v100 | 1) ^ 0x1F) + 73) >> 6;
        break;
      case 18:
        unint64_t v46 = (2 * (void)*a1) ^ ((uint64_t)*a1 >> 63);
LABEL_138:
        v8 += (9 * (__clz(v46 | 1) ^ 0x3F) + 73) >> 6;
        break;
      default:
        return v8;
    }
  }
  return v8;
}

void sub_236951658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_236951770(unsigned __int8 *result)
{
  v1 = result;
  uint64_t v2 = result[8];
  if (result[9])
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      uint64_t v3 = sub_23694710C(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_236947248((uint64_t)&v10, (const char **)&v3->__r_.__value_.__l.__data_);
      uint64_t result = (unsigned __int8 *)sub_236947250((uint64_t)v11);
    }
    switch(v2)
    {
      case 1:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_236959538();
          goto LABEL_32;
        }
        break;
      case 2:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_236958EDC();
          goto LABEL_32;
        }
        break;
      case 3:
      case 16:
      case 18:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_236958224();
          goto LABEL_32;
        }
        break;
      case 4:
      case 6:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_236958880();
          goto LABEL_32;
        }
        break;
      case 5:
      case 14:
      case 15:
      case 17:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_23695756C();
          goto LABEL_32;
        }
        break;
      case 7:
      case 13:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_236957BC8();
          goto LABEL_32;
        }
        break;
      case 8:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_236956F14();
LABEL_32:
          uint64_t v8 = 0x1080C4057E67DB5;
          return (unsigned __int8 *)MEMORY[0x237E07580](v4, v8);
        }
        break;
      case 9:
      case 12:
        uint64_t result = *(unsigned __int8 **)v1;
        if (*(void *)v1)
        {
          int v4 = (uint64_t *)sub_2369597C4();
          goto LABEL_37;
        }
        break;
      case 10:
      case 11:
        int v9 = *(unsigned __int8 **)v1;
        if (v9)
        {
          sub_236952304(v9);
          int v4 = sub_2369381D4((uint64_t *)v9);
LABEL_37:
          uint64_t v8 = 0x1020C4014030ADELL;
          return (unsigned __int8 *)MEMORY[0x237E07580](v4, v8);
        }
        break;
      default:
        return result;
    }
  }
  else
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      unsigned __int8 v5 = sub_23694710C(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      sub_236947248((uint64_t)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
      uint64_t result = (unsigned __int8 *)sub_236947250((uint64_t)v11);
    }
    int v6 = dword_23698F210[v2];
    if (v6 == 10)
    {
      uint64_t result = *(unsigned __int8 **)v1;
      if ((v1[10] & 0x10) != 0)
      {
        if (!result) {
          return result;
        }
      }
      else if (!result)
      {
        return result;
      }
      return (unsigned __int8 *)(*(uint64_t (**)(unsigned __int8 *))(*(void *)result + 8))(result);
    }
    if (v6 == 9)
    {
      uint64_t v7 = *(unsigned __int8 **)v1;
      if (v7)
      {
        if ((char)v7[23] < 0) {
          operator delete(*(void **)v7);
        }
        int v4 = (uint64_t *)v7;
        uint64_t v8 = 0x1012C40EC159624;
        return (unsigned __int8 *)MEMORY[0x237E07580](v4, v8);
      }
    }
  }
  return result;
}

void sub_2369519D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236951A18()
{
}

unsigned __int8 *sub_236951A2C(unsigned __int8 *result, unsigned __int8 *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    do
    {
      uint64_t result = sub_236951770(v3 + 40);
      int v4 = (unsigned __int8 *)*((void *)v3 + 1);
      if (v4)
      {
        do
        {
          unsigned __int8 v5 = v4;
          int v4 = *(unsigned __int8 **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          unsigned __int8 v5 = (unsigned __int8 *)*((void *)v3 + 2);
          BOOL v6 = *(void *)v5 == (void)v3;
          uint64_t v3 = v5;
        }
        while (!v6);
      }
      uint64_t v3 = v5;
    }
    while (v5 != a2);
  }
  return result;
}

uint64_t *sub_236951ABC(uint64_t *a1)
{
  sub_236952304(a1);
  return sub_2369381D4(a1);
}

uint64_t sub_236951AF4(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    unsigned __int8 v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return *(void *)(*(void *)(a1 + 16) + 8 * a2 + 8);
}

void sub_236951BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236951BD4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(int **)(result + 16);
  if (!v2) {
    return sub_236951C28(result, a2);
  }
  uint64_t v3 = *v2;
  if ((int)v3 >= *(_DWORD *)(result + 12)) {
    return sub_236951C28(result, a2);
  }
  int v4 = v2 + 2;
  uint64_t v5 = *(int *)(result + 8);
  if ((int)v5 < (int)v3) {
    *(void *)&v4[2 * v3] = *(void *)&v4[2 * v5];
  }
  *(void *)&v4[2 * v5] = a2;
  *(_DWORD *)(result + 8) = v5 + 1;
  ++**(_DWORD **)(result + 16);
  return result;
}

uint64_t sub_236951C28(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(int **)(result + 16);
  if (!v4)
  {
    int v5 = *(_DWORD *)(result + 12);
    goto LABEL_11;
  }
  int v5 = *(_DWORD *)(result + 8);
  int v6 = *(_DWORD *)(result + 12);
  if (v5 == v6)
  {
LABEL_11:
    uint64_t result = sub_2369597C8(result, v5 + 1);
    goto LABEL_12;
  }
  uint64_t v7 = *v4;
  if (v7 != v6)
  {
    if (v5 >= (int)v7)
    {
      int v9 = v7 + 1;
      goto LABEL_13;
    }
    *(void *)&v4[2 * v7 + 2] = *(void *)&v4[2 * v5 + 2];
LABEL_12:
    int v4 = *(int **)(v3 + 16);
    int v9 = *v4 + 1;
LABEL_13:
    int *v4 = v9;
    goto LABEL_14;
  }
  uint64_t result = *(void *)&v4[2 * v5 + 2];
  if (result) {
    BOOL v8 = *(void *)v3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    int v4 = *(int **)(v3 + 16);
  }
LABEL_14:
  uint64_t v10 = *(int *)(v3 + 8);
  *(_DWORD *)(v3 + 8) = v10 + 1;
  *(void *)&v4[2 * v10 + 2] = a2;
  return result;
}

uint64_t *sub_236951D08(void *a1, void *a2, uint64_t *a3)
{
  if (a1 != a2)
  {
    int v5 = a1;
    do
    {
      sub_23694BA9C(a3, *((unsigned int *)v5 + 8), v5 + 5);
      int v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          int v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          int v5 = v7;
        }
        while (!v8);
      }
      int v5 = v7;
    }
    while (v7 != a2);
  }
  return a3;
}

const std::string::value_type *sub_236951D8C(uint64_t a1, std::string::value_type *__s, int a3, std::string *a4)
{
  if (*(void *)(a1 + 8) - (void)__s + 16 >= a3)
  {
    uint64_t v6 = a3;
    MEMORY[0x237E07280](a4, __s, a3);
    return &__s[v6];
  }
  else
  {
    return sub_236953EA0(a1, __s, a3, a4);
  }
}

char *sub_236951DF8(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v15 = (unint64_t)&result[v5];
    long long v16 = *(_OWORD *)(a3 + 16);
    v19[0] = *(_OWORD *)a3;
    v19[1] = v16;
    uint64_t v20 = *(void *)(a3 + 32);
    uint64_t result = sub_236952054(result, v15, (unsigned int **)v19);
    if ((char *)v15 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      long long v10 = *(_OWORD *)(a3 + 16);
      v24[0] = *(_OWORD *)a3;
      v24[1] = v10;
      uint64_t v25 = *(void *)(a3 + 32);
      uint64_t result = sub_236952054(result, v8, (unsigned int **)v24);
      if (!result) {
        break;
      }
      signed int v11 = result - *(void *)(a1 + 8);
      if (v11 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v12 = sub_23694710C(&v26, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v23, (const char **)&v12->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v26);
      }
      int v13 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v27 = 0;
        v26.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v26.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        uint64_t v22 = *(void *)(a3 + 32);
        long long v17 = *(_OWORD *)(a3 + 16);
        v21[0] = *(_OWORD *)a3;
        v21[1] = v17;
        unsigned int v18 = (std::string *)sub_236952054((char *)&v26 + v11, (unint64_t)&v26 + v13, (unsigned int **)v21);
        uint64_t result = 0;
        if (v18 && v18 == (std::string *)((char *)&v26 + v13)) {
          return (char *)(*(void *)(a1 + 8) + v13);
        }
        return result;
      }
      int v5 = v5 - v9 - v11;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        int v14 = sub_23694710C(&v26, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v23, (const char **)&v14->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v26);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v11;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_23695202C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

char *sub_236952054(char *a1, unint64_t a2, unsigned int **a3)
{
  uint64_t v3 = a1;
  while ((unint64_t)v3 < a2)
  {
    unint64_t v6 = *v3;
    if (*v3 < 0)
    {
      int v7 = v6 + (v3[1] << 7);
      unint64_t v6 = (v7 - 128);
      if (v3[1] < 0)
      {
        uint64_t v3 = (char *)sub_236954390((uint64_t)v3, (v7 - 128));
        if (!v3) {
          return v3;
        }
        unint64_t v6 = v8;
      }
      else
      {
        v3 += 2;
      }
    }
    else
    {
      ++v3;
    }
    if (((unsigned int (*)(unsigned int *, unint64_t))a3[1])(a3[2], v6))
    {
      int v9 = (int *)*a3;
      uint64_t v10 = **a3;
      if (v10 == (*a3)[1])
      {
        int v11 = v10 + 1;
        sub_2369570D0((int *)*a3, v10 + 1);
        *(_DWORD *)(sub_236957570((uint64_t)v9) + 4 * v10) = v6;
      }
      else
      {
        *(_DWORD *)(sub_236957570((uint64_t)*a3) + 4 * v10) = v6;
        int v11 = v10 + 1;
      }
      int *v9 = v11;
    }
    else
    {
      int v12 = *((_DWORD *)a3 + 8);
      int v13 = (unint64_t *)a3[3];
      if (*v13) {
        int v14 = (std::string *)((*v13 & 0xFFFFFFFFFFFFFFFELL) + 8);
      }
      else {
        int v14 = (std::string *)sub_236937EDC(v13);
      }
      sub_23695427C(v12, v6, v14);
    }
  }
  return v3;
}

char *sub_236952180(uint64_t a1, char *__src, int64_t __n)
{
  *(_DWORD *)(a1 + 84) = 0;
  if (__n >= 17)
  {
    *(_DWORD *)(a1 + 28) = 16;
    unint64_t v6 = &__src[__n - 16];
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = a1 + 40;
    if (*(void *)(a1 + 72) != 1) {
      return __src;
    }
    uint64_t v7 = 2;
    unint64_t v8 = __src;
    goto LABEL_6;
  }
  unint64_t v8 = (char *)(a1 + 40);
  memcpy((void *)(a1 + 40), __src, __n);
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)a1 = &v8[__n];
  *(void *)(a1 + 8) = &v8[__n];
  *(void *)(a1 + 16) = 0;
  if (*(void *)(a1 + 72) == 1)
  {
    uint64_t v7 = __src - v8;
LABEL_6:
    *(void *)(a1 + 72) = v7;
  }
  return v8;
}

uint64_t sub_236952234(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if ((v1 & 0x80000000) != 0)
  {
    sub_2369470F4((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    int v5 = sub_23694710C(v7, "CHECK failed: (n) >= (0): ");
    sub_236947248((uint64_t)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    return sub_236947250((uint64_t)v7);
  }
  else if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = (uint64_t *)(*(void *)(result + 16) + 8);
    do
    {
      uint64_t v4 = *v3++;
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
      --v1;
    }
    while (v1);
    *(_DWORD *)(v2 + 8) = 0;
  }
  return result;
}

void sub_2369522EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236952304(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 2;
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3) {
          (*(void (**)(void))(*(void *)*v3 + 8))(*v3);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t **sub_236952390(uint64_t **a1, int *a2, _OWORD *a3)
{
  char v6 = a1 + 1;
  int v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        int v5 = *v8;
        char v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      int v5 = v8[1];
      if (!v5)
      {
        char v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x40uLL);
    long long v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    sub_236914A80(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void sub_23695244C(uint64_t a1)
{
}

uint64_t *sub_236952454(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  char v6 = sub_2369524DC(a1, a2, &v12, &v11, a3);
  int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    unint64_t v8 = (uint64_t **)v6;
    int v7 = (uint64_t *)operator new(0x40uLL);
    long long v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    sub_236914A80(a1, (uint64_t)v12, v8, v7);
  }
  return v7;
}

uint64_t *sub_2369524DC(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    unint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      long long v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        long long v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      int v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        int v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          long long v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      long long v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    int v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      int v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    char v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      char v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void sub_236952684()
{
}

uint64_t sub_2369526B0(uint64_t (***a1)(void))
{
  return (**a1)(a1);
}

void sub_2369526D4(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_2369526E8()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2688A6EB0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2688A6EB0))
  {
    qword_26889B028 = 0;
    unk_26889B030 = 0;
    qword_26889B038 = 0;
    sub_2369532CC((uint64_t)sub_2369526D4, (uint64_t)&qword_26889B028);
    atomic_store(1u, (unsigned __int8 *)&unk_26889B040);
    __cxa_guard_release(&qword_2688A6EB0);
  }
}

void sub_23695277C(_Unwind_Exception *a1)
{
}

uint64_t sub_236952794(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 64))(v4, a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, a2);
  (*(void (**)(uint64_t))(*(void *)a2 + 40))(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 64))(a2, v4);
  int v5 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 8);
  return v5(v4);
}

void sub_2369528EC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_236952920(_DWORD *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2688A6EB8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2688A6EB8))
  {
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &stru_26889A538, &dword_2367AD000);
    __cxa_guard_release(&qword_2688A6EB8);
  }
  pthread_t v2 = pthread_self();
  uint64_t v3 = (uint64_t)v2;
  if (qword_2688A6EC0)
  {
    if (v2 && v2 == (pthread_t)qword_2688A6EC0) {
      goto LABEL_5;
    }
  }
  else if (!v2)
  {
LABEL_5:
    if (*a1 != 1)
    {
      sub_2369470F4((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/generated_message_util.cc", 785);
      uint64_t v4 = sub_23694710C(v6, "CHECK failed: (scc->visit_status.load(std::memory_order_relaxed)) == (SCCInfoBase::kRunning): ");
      sub_236947248((uint64_t)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v6);
    }
    return;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&unk_26889B040, memory_order_acquire) & 1) == 0) {
    sub_2369526E8();
  }
  std::mutex::lock(&stru_26889A538);
  qword_2688A6EC0 = v3;
  sub_236952A8C(a1);
  qword_2688A6EC0 = 0;
  std::mutex::unlock(&stru_26889A538);
}

void sub_236952A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

_DWORD *sub_236952A8C(_DWORD *result)
{
  if (*result == -1)
  {
    uint64_t v1 = (uint64_t (**)(void))result;
    *uint64_t result = 1;
    pthread_t v2 = result + 6;
    int v3 = result[1];
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        if (*(void *)&v2[2 * i])
        {
          sub_236952A8C();
          int v3 = *((_DWORD *)v1 + 1);
        }
      }
    }
    uint64_t v5 = v3;
    int v6 = *((_DWORD *)v1 + 2);
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      unint64_t v8 = &v2[2 * v5];
      do
      {
        if (**(void **)&v8[2 * v7])
        {
          sub_236952A8C();
          int v6 = *((_DWORD *)v1 + 2);
        }
        ++v7;
      }
      while (v7 < v6);
    }
    uint64_t result = (_DWORD *)v1[2]();
    atomic_store(0, (unsigned int *)v1);
  }
  return result;
}

uint64_t sub_236952B3C(char *__src, int64_t __n, uint64_t a3, char a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0x7FFFFFFF00000000;
  int v14 = dword_26889A530;
  unsigned int v15 = 0x80000000;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v6 = sub_236952180((uint64_t)v9, __src, __n);
  if ((*(uint64_t (**)(uint64_t, char *, unsigned char *))(*(void *)a3 + 88))(a3, v6, v9)) {
    BOOL v7 = v13 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (a4 & 2) != 0 || ((*(uint64_t (**)(uint64_t))(*(void *)a3 + 48))(a3)) {
      return 1;
    }
    sub_236952C68(a3);
  }
  return 0;
}

void *sub_236952C58@<X0>(void *a1@<X8>)
{
  return sub_236919B40(a1, "(cannot determine missing fields for lite message)");
}

uint64_t sub_236952C68(uint64_t a1)
{
  sub_2369470F4((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 133);
  sub_236952D1C("parse", a1, &__p);
  pthread_t v2 = sub_236947138(v6, (const std::string::value_type *)&__p);
  sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return sub_236947250((uint64_t)v6);
}

void sub_236952CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_236947250((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_236952D1C(const std::string::value_type *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::append(a3, "Can't ");
  std::string::append(a3, a1);
  std::string::append(a3, " message of type \"");
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a2 + 16))(&__p, a2);
  if ((v12 & 0x80u) == 0) {
    p_p = (const std::string::value_type *)&__p;
  }
  else {
    p_p = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v7 = v12;
  }
  else {
    std::string::size_type v7 = v11;
  }
  std::string::append(a3, p_p, v7);
  if ((char)v12 < 0) {
    operator delete(__p);
  }
  std::string::append(a3, "\" because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a2 + 56))(&__p, a2);
  if ((v12 & 0x80u) == 0) {
    unint64_t v8 = (const std::string::value_type *)&__p;
  }
  else {
    unint64_t v8 = (const std::string::value_type *)__p;
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v9 = v12;
  }
  else {
    std::string::size_type v9 = v11;
  }
  std::string::append(a3, v8, v9);
  if ((char)v12 < 0) {
    operator delete(__p);
  }
}

void sub_236952E58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_236952E98(uint64_t a1, char *a2, unsigned int a3)
{
  if ((a3 & 0x80000000) != 0) {
    sub_2369535A0();
  }
  int64_t v5 = a3;
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  return sub_236952B3C(a2, v5, a1, 1);
}

BOOL sub_236952F14(uint64_t a1, std::string *a2)
{
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1) & 1) == 0)
  {
    sub_2369470F4((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 449);
    char v4 = sub_23694710C(v9, "CHECK failed: IsInitialized(): ");
    sub_236952D1C("serialize", a1, &__p);
    int64_t v5 = sub_236947138(v4, (const std::string::value_type *)&__p);
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    sub_236947250((uint64_t)v9);
  }
  return sub_236953020(a1, a2);
}

void sub_236952FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_236947250((uint64_t)&a16);
  _Unwind_Resume(a1);
}

BOOL sub_236953020(uint64_t a1, std::string *a2)
{
  pthread_t v2 = a2;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  unint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
  uint64_t v6 = v5;
  unint64_t v7 = v5 >> 31;
  if (v5 >> 31)
  {
    sub_2369470F4((uint64_t)v16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 457);
    (*(void (**)(std::string *__return_ptr, uint64_t))(*(void *)a1 + 16))(__p, a1);
    long long v10 = sub_236947138(v16, (const std::string::value_type *)__p);
    std::string::size_type v11 = sub_23694710C(v10, " exceeded maximum protobuf size of 2GB: ");
    unsigned __int8 v12 = sub_236947384(v11, v6);
    sub_236947248((uint64_t)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    std::string::size_type v9 = v16;
    goto LABEL_12;
  }
  std::string::resize(v2, v5 + size, 0);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0) {
    pthread_t v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  }
  *(_OWORD *)&v16[0].__r_.__value_.__l.__data_ = (unint64_t)v2 + size + v6;
  uint64_t v17 = 0;
  __int16 v18 = 0;
  char v19 = byte_26889B024 & 1;
  if (v16[0].__r_.__value_.__r.__words[0] != (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1))
  {
    sub_2369470F4((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 360);
    unint64_t v8 = sub_23694710C(__p, "CHECK failed: target + size == res: ");
    sub_236947248((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
    std::string::size_type v9 = __p;
LABEL_12:
    sub_236947250((uint64_t)v9);
  }
  return v7 == 0;
}

void sub_236953214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

BOOL sub_23695325C@<W0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  BOOL result = sub_236952F14(a1, (std::string *)a2);
  if (!result)
  {
    if (*(char *)(a2 + 23) < 0)
    {
      **(unsigned char **)a2 = 0;
      *(void *)(a2 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a2 = 0;
      *(unsigned char *)(a2 + 23) = 0;
    }
  }
  return result;
}

void sub_2369532B0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2369532CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236953400();
  std::mutex::lock((std::mutex *)(v4 + 24));
  unint64_t v5 = *(void **)(v4 + 8);
  unint64_t v6 = *(void *)(v4 + 16);
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = ((uint64_t)v5 - *(void *)v4) >> 4;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 60) {
      sub_236913FC4();
    }
    uint64_t v10 = v6 - *(void *)v4;
    if (v10 >> 3 > v9) {
      unint64_t v9 = v10 >> 3;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unsigned __int8 v12 = (char *)sub_236914EC0(v4 + 16, v11);
    }
    else {
      unsigned __int8 v12 = 0;
    }
    uint64_t v13 = &v12[16 * v8];
    char v14 = &v12[16 * v11];
    *(void *)uint64_t v13 = a1;
    *((void *)v13 + 1) = a2;
    unint64_t v7 = v13 + 16;
    uint64_t v16 = *(char **)v4;
    uint64_t v15 = *(char **)(v4 + 8);
    if (v15 != *(char **)v4)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v15 - 1);
        v13 -= 16;
        v15 -= 16;
      }
      while (v15 != v16);
      uint64_t v15 = *(char **)v4;
    }
    *(void *)uint64_t v4 = v13;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    void *v5 = a1;
    v5[1] = a2;
    unint64_t v7 = v5 + 2;
  }
  *(void *)(v4 + 8) = v7;
  std::mutex::unlock((std::mutex *)(v4 + 24));
}

void sub_2369533EC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_236953400()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26889A580, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26889A580))
  {
    operator new();
  }
  return qword_26889A578;
}

void sub_236953490(_Unwind_Exception *a1)
{
}

void sub_2369534A8()
{
  if ((byte_2688A6EC8 & 1) == 0)
  {
    uint64_t v0 = sub_236953400();
    if (v0)
    {
      uint64_t v1 = sub_2369534F8(v0);
      MEMORY[0x237E07580](v1, 0x1020C40A0054943);
    }
    byte_2688A6EC8 = 1;
  }
}

uint64_t sub_2369534F8(uint64_t a1)
{
  pthread_t v2 = *(void **)a1;
  int v3 = *(void **)(a1 + 8);
  uint64_t v4 = v3 - 2;
  if (*(void **)a1 != v3 && v4 > v2)
  {
    do
    {
      unint64_t v6 = (void (*)(void))*v2;
      *pthread_t v2 = *v4;
      void *v4 = v6;
      uint64_t v7 = v2[1];
      v2[1] = v4[1];
      v4[1] = v7;
      v2 += 2;
      v4 -= 2;
    }
    while (v2 < v4);
    pthread_t v2 = *(void **)a1;
    int v3 = *(void **)(a1 + 8);
  }
  while (v2 != v3)
  {
    ((void (*)(void))*v2)(v2[1]);
    v2 += 2;
  }
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  uint64_t v8 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v8;
    operator delete(v8);
  }
  return a1;
}

void sub_2369535A0()
{
  __assert_rtn("StringPiece", "stringpiece.h", 229, "len >= 0");
}

_OWORD *sub_2369535CC(uint64_t a1)
{
  if (*(int *)(a1 + 28) <= 16)
  {
    sub_2369470F4((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 158);
    pthread_t v2 = sub_23694710C(v7, "CHECK failed: limit_ > kSlopBytes: ");
    sub_236947248((uint64_t)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v7);
  }
  BOOL result = sub_236953694(a1, 0, -1);
  uint64_t v4 = *(void *)(a1 + 8);
  if (result)
  {
    int v5 = *(_DWORD *)(a1 + 28) + result - v4;
    *(_DWORD *)(a1 + 28) = v5;
    v4 += v5 & (v5 >> 31);
  }
  else
  {
    *(_DWORD *)(a1 + 80) = 1;
  }
  *(void *)a1 = v4;
  return result;
}

void sub_23695367C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_236953694(uint64_t a1, unsigned int a2, int a3)
{
  int v3 = *(_OWORD **)(a1 + 16);
  if (!v3) {
    return v3;
  }
  uint64_t v5 = a1 + 40;
  if (v3 != (_OWORD *)(a1 + 40))
  {
    int v6 = *(_DWORD *)(a1 + 24);
    if (v6 <= 16)
    {
      sub_2369470F4((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 105);
      uint64_t v7 = sub_23694710C(v33, "CHECK failed: size_ > kSlopBytes: ");
      sub_236947248((uint64_t)&__src, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v33);
      int v3 = *(_OWORD **)(a1 + 16);
      int v6 = *(_DWORD *)(a1 + 24);
    }
    *(void *)(a1 + 8) = (char *)v3 + v6 - 16;
    *(void *)(a1 + 16) = v5;
    if (*(void *)(a1 + 72) == 1) {
      *(void *)(a1 + 72) = 2;
    }
    return v3;
  }
  _OWORD *v3 = *(_OWORD *)*(void *)(a1 + 8);
  if (*(int *)(a1 + 84) < 1) {
    goto LABEL_46;
  }
  int v8 = a3;
  if (a3 < 0) {
    goto LABEL_39;
  }
  if ((a2 & 0x80000000) != 0)
  {
    sub_2369470F4((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 53);
    unint64_t v11 = sub_23694710C(v33, "CHECK failed: overrun >= 0: ");
    sub_236947248((uint64_t)&__src, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v33);
LABEL_14:
    unint64_t v12 = a1 + 56;
    uint64_t v13 = (unsigned __int8 *)v3 + (int)a2;
    char v14 = v13;
    while (2)
    {
      int v15 = (char)*v14++;
      int v16 = v15;
      if (v15 < 0)
      {
        int v16 = v16 + (*v14 << 7) - 128;
        if ((char)*v14 < 0)
        {
          char v14 = v13 + 3;
          uint64_t v20 = -21;
          while (1)
          {
            v16 += (*(v14 - 1) - 1) << (v20 + 35);
            if (((char)*(v14 - 1) & 0x80000000) == 0) {
              break;
            }
            ++v14;
            v20 += 7;
            if (!v20) {
              goto LABEL_39;
            }
          }
        }
        else
        {
          char v14 = v13 + 2;
        }
      }
      if ((unint64_t)v14 <= v12)
      {
        if (!v16) {
          goto LABEL_46;
        }
        switch(v16 & 7)
        {
          case 0:
            v33[0].__r_.__value_.__r.__words[0] = 0;
            char v14 = sub_236954AD4((char *)v14, v33);
            if (!v14) {
              goto LABEL_39;
            }
            goto LABEL_38;
          case 1:
            v14 += 8;
            goto LABEL_38;
          case 2:
            int v18 = *v14;
            if ((char)*v14 < 0)
            {
              uint64_t v19 = sub_23695441C((uint64_t)v14, v18);
              if (!v19) {
                goto LABEL_39;
              }
            }
            else
            {
              uint64_t v19 = (uint64_t)(v14 + 1);
            }
            if ((uint64_t)(v12 - v19) < v18) {
              goto LABEL_39;
            }
            char v14 = (unsigned __int8 *)(v19 + v18);
LABEL_38:
            uint64_t v13 = v14;
            if ((unint64_t)v14 >= v12) {
              goto LABEL_39;
            }
            continue;
          case 3:
            ++v8;
            goto LABEL_38;
          case 4:
            BOOL v17 = __OFSUB__(v8--, 1);
            if (v8 < 0 != v17) {
              goto LABEL_46;
            }
            goto LABEL_38;
          case 5:
            v14 += 4;
            goto LABEL_38;
          default:
            goto LABEL_39;
        }
      }
      goto LABEL_39;
    }
  }
  if (a2 >= 0x11)
  {
    sub_2369470F4((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 54);
    uint64_t v10 = sub_23694710C(v33, "CHECK failed: overrun <= kSlopBytes: ");
    sub_236947248((uint64_t)&__src, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v33);
    goto LABEL_39;
  }
  if (a2 != 16) {
    goto LABEL_14;
  }
LABEL_39:
  __src = 0;
  if (!(*(unsigned int (**)(void, void **, uint64_t))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32), &__src, a1 + 24))
  {
LABEL_45:
    *(_DWORD *)(a1 + 84) = 0;
LABEL_46:
    if (*(void *)(a1 + 72) == 2) {
      *(void *)(a1 + 72) = *(void *)(a1 + 8) - (void)v3;
    }
    *(void *)(a1 + 8) = a1 + 56;
    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 24) = 0;
    return v3;
  }
  while (1)
  {
    size_t v21 = *(unsigned int *)(a1 + 24);
    *(_DWORD *)(a1 + 84) -= v21;
    if ((int)v21 >= 17)
    {
      unint64_t v27 = *(void *)(a1 + 72);
      std::string v26 = (void *)(a1 + 72);
      unint64_t v25 = v27;
      uint64_t v28 = (char *)(v26 - 2);
      unsigned int v29 = __src;
      *((_OWORD *)v26 - 1) = *(_OWORD *)__src;
      *(v26 - 7) = v29;
      goto LABEL_52;
    }
    if ((int)v21 >= 1) {
      break;
    }
    if (v21)
    {
      sub_2369470F4((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 137);
      int v22 = sub_23694710C(v33, "CHECK failed: size_ == 0: ");
      char v23 = sub_236947304(v22, *(_DWORD *)(a1 + 24));
      sub_236947248((uint64_t)&v31, (const char **)&v23->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v33);
    }
    if (((*(uint64_t (**)(void, void **, uint64_t))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32), &__src, a1 + 24) & 1) == 0)goto LABEL_45; {
  }
    }
  memcpy((void *)(a1 + 56), __src, v21);
  unint64_t v30 = *(void *)(a1 + 72);
  std::string v26 = (void *)(a1 + 72);
  unint64_t v25 = v30;
  uint64_t v28 = (char *)v3 + v21;
  *(v26 - 7) = v3;
LABEL_52:
  *(v26 - 8) = v28;
  if (v25 > 1) {
    *std::string v26 = 1;
  }
  return v3;
}

void sub_236953A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_236953AC0(uint64_t a1, signed int a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 28);
  if (v3 < a2) {
    return 0;
  }
  signed int v5 = a2;
  if (v3 == a2)
  {
    sub_2369470F4((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 175);
    uint64_t v7 = sub_23694710C(v19, "CHECK failed: overrun != limit_: ");
    sub_236947248((uint64_t)&v18, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v19);
    int v3 = *(_DWORD *)(a1 + 28);
  }
  if (v3 <= v5)
  {
    sub_2369470F4((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 176);
    int v8 = sub_23694710C(v19, "CHECK failed: overrun < limit_: ");
    sub_236947248((uint64_t)&v18, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v19);
    int v3 = *(_DWORD *)(a1 + 28);
  }
  if (*(void *)a1 != *(void *)(a1 + 8) + (v3 & (v3 >> 31)))
  {
    sub_2369470F4((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 181);
    unint64_t v9 = sub_23694710C(v19, "CHECK failed: limit_end_ == buffer_end_ + (std::min)(0, limit_): ");
    sub_236947248((uint64_t)&v18, (const char **)&v9->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v19);
    int v3 = *(_DWORD *)(a1 + 28);
  }
  if (v3 <= 0)
  {
    sub_2369470F4((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 183);
    uint64_t v10 = sub_23694710C(v19, "CHECK failed: limit_ > 0: ");
    sub_236947248((uint64_t)&v18, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v19);
  }
  if (*(void *)a1 != *(void *)(a1 + 8))
  {
    sub_2369470F4((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 184);
    unint64_t v11 = sub_23694710C(v19, "CHECK failed: limit_end_ == buffer_end_: ");
    sub_236947248((uint64_t)&v18, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v19);
  }
  while (1)
  {
    if (v5 < 0)
    {
      sub_2369470F4((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 188);
      unint64_t v12 = sub_23694710C(v19, "CHECK failed: overrun >= 0: ");
      sub_236947248((uint64_t)&v18, (const char **)&v12->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v19);
    }
    uint64_t v13 = sub_236953694(a1, v5, a3);
    if (!v13) {
      break;
    }
    uint64_t v14 = *(void *)(a1 + 8);
    int v15 = *(_DWORD *)(a1 + 28) + v13 - v14;
    *(_DWORD *)(a1 + 28) = v15;
    BOOL result = (char *)v13 + v5;
    signed int v5 = result - v14;
    if ((int)result - (int)v14 < 0)
    {
      *(void *)a1 = v14 + (v15 & (v15 >> 31));
      return result;
    }
  }
  if (v5) {
    return 0;
  }
  if (*(int *)(a1 + 28) <= 0)
  {
    sub_2369470F4((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 193);
    BOOL v17 = sub_23694710C(v19, "CHECK failed: limit_ > 0: ");
    sub_236947248((uint64_t)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v19);
  }
  BOOL result = *(char **)(a1 + 8);
  *(void *)a1 = result;
  *(_DWORD *)(a1 + 80) = 1;
  return result;
}

void sub_236953D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_236953DB8(uint64_t a1, int a2, int a3)
{
  int v5 = *(_DWORD *)(a1 + 8) - a2 + 16;
  while (1)
  {
    BOOL v6 = __OFSUB__(a3, v5);
    a3 -= v5;
    if ((a3 < 0) ^ v6 | (a3 == 0))
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      uint64_t v7 = sub_23694710C(v10, "CHECK failed: size > chunk_size: ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    if (!*(void *)(a1 + 16) || *(int *)(a1 + 28) < 17) {
      break;
    }
    BOOL result = sub_2369535CC(a1);
    if (!result) {
      return result;
    }
    int v5 = *(_DWORD *)(a1 + 8) - result;
    if (a3 <= v5) {
      return (_OWORD *)((char *)result + a3 + 16);
    }
  }
  return 0;
}

void sub_236953E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

const std::string::value_type *sub_236953EA0(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5 = a3;
  BOOL v6 = __s;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    if (a3 >= 50000000) {
      int v10 = 50000000;
    }
    else {
      int v10 = a3;
    }
    std::string::reserve(this, size + v10);
    uint64_t v8 = *(void *)(a1 + 8);
  }
  int v11 = v8 - v6 + 16;
  while (1)
  {
    BOOL v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      uint64_t v13 = sub_23694710C(v16, "CHECK failed: size > chunk_size: ");
      sub_236947248((uint64_t)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v16);
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17) {
      break;
    }
    BOOL result = (const std::string::value_type *)sub_2369535CC(a1);
    if (!result) {
      return result;
    }
    BOOL v6 = result + 16;
    int v11 = *(_DWORD *)(a1 + 8) - result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return &v6[v5];
    }
  }
  return 0;
}

void sub_236954010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

const std::string::value_type *sub_236954028(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5 = a3;
  BOOL v6 = __s;
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    if (a3 >= 50000000) {
      int v10 = 50000000;
    }
    else {
      int v10 = a3;
    }
    std::string::reserve(this, size + v10);
    uint64_t v8 = *(void *)(a1 + 8);
  }
  int v11 = v8 - v6 + 16;
  while (1)
  {
    BOOL v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      uint64_t v13 = sub_23694710C(v16, "CHECK failed: size > chunk_size: ");
      sub_236947248((uint64_t)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v16);
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17) {
      break;
    }
    BOOL result = (const std::string::value_type *)sub_2369535CC(a1);
    if (!result) {
      return result;
    }
    BOOL v6 = result + 16;
    int v11 = *(_DWORD *)(a1 + 8) - result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return &v6[v5];
    }
  }
  return 0;
}

void sub_236954178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236954194(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v6 = (char)*a3;
  unsigned int v7 = *a3;
  if (v6 < 0)
  {
    uint64_t result = sub_23695441C((uint64_t)a3, v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = (char *)result;
    unsigned int v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(a3 + 1);
  }
  int v11 = sub_236938208(a1, (int)v8, v7);
  int v12 = *(_DWORD *)(a1 + 88);
  BOOL v13 = __OFSUB__(v12--, 1);
  *(_DWORD *)(a1 + 88) = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  int v14 = v11;
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)a2 + 88))(a2, v8, a1);
  if (!result) {
    return result;
  }
  ++*(_DWORD *)(a1 + 88);
  if (*(_DWORD *)(a1 + 80)) {
    return 0;
  }
  int v15 = *(_DWORD *)(a1 + 28) + v14;
  *(_DWORD *)(a1 + 28) = v15;
  *(void *)a1 = *(void *)(a1 + 8) + (v15 & (v15 >> 31));
  return result;
}

void sub_23695427C(int a1, unint64_t a2, std::string *this)
{
  unint64_t v5 = (8 * a1);
  if (v5 < 0x80)
  {
    LOBYTE(v6) = 8 * a1;
  }
  else
  {
    do
    {
      std::string::push_back(this, v5 | 0x80);
      unint64_t v6 = v5 >> 7;
      unint64_t v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  std::string::push_back(this, v6);
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      std::string::push_back(this, a2 | 0x80);
      unint64_t v8 = a2 >> 7;
      unint64_t v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }
  std::string::push_back(this, v8);
}

uint64_t sub_236954328(uint64_t a1, int a2)
{
  uint64_t result = a1 + 3;
  uint64_t v4 = -21;
  while (1)
  {
    a2 += (*(unsigned __int8 *)(result - 1) - 1) << (v4 + 35);
    if ((*(char *)(result - 1) & 0x80000000) == 0) {
      break;
    }
    ++result;
    v4 += 7;
    if (!v4)
    {
      while (*(char *)(a1 + v4 + 5) < 0)
      {
        uint64_t result = 0;
        if (++v4 == 5) {
          return result;
        }
      }
      return a1 + v4 + 6;
    }
  }
  return result;
}

uint64_t sub_236954390(uint64_t a1, uint64_t a2)
{
  a2 = a2;
  uint64_t result = a1 + 3;
  uint64_t v4 = (char *)(a1 + 2);
  uint64_t v5 = 14;
  while (1)
  {
    int v6 = *v4++;
    a2 += (v6 - 1) << v5;
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    ++result;
    v5 += 7;
    if (v5 == 70) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2369543D8(uint64_t a1, int a2)
{
  uint64_t result = a1 + 3;
  uint64_t v4 = (char *)(a1 + 2);
  uint64_t v5 = -21;
  while (1)
  {
    int v6 = *v4++;
    a2 += (v6 - 1) << (v5 + 35);
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    ++result;
    v5 += 7;
    if (!v5) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_23695441C(uint64_t a1, int a2)
{
  uint64_t result = a1 + 2;
  uint64_t v4 = -21;
  while (1)
  {
    a2 += (*(unsigned __int8 *)(result - 1) - 1) << (v4 + 28);
    if ((*(char *)(result - 1) & 0x80000000) == 0) {
      break;
    }
    ++result;
    v4 += 7;
    if (!v4)
    {
      unsigned int v5 = *(unsigned __int8 *)(a1 + 4);
      uint64_t v6 = a1 + 5;
      if (a2 + (v5 << 28) - 0x10000000 > 0x7FFFFFEF) {
        uint64_t v6 = 0;
      }
      if (v5 <= 7) {
        return v6;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

const std::string::value_type *sub_23695448C(std::string *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (const std::string::value_type *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = (std::string::value_type *)result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_236951D8C(a3, v6, v5, a1);
}

unsigned __int8 *sub_236954504(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_236954B48(a3, a2, a1);
}

unsigned __int8 *sub_236954514(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_236954E1C(a3, a2, a1);
}

unsigned __int8 *sub_236954524(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_2369550F0(a3, a2, a1);
}

unsigned __int8 *sub_236954534(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_2369553C4(a3, a2, a1);
}

unsigned __int8 *sub_236954544(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_236955698(a3, a2, a1);
}

unsigned __int8 *sub_236954554(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_236955978(a3, a2, a1);
}

unsigned __int8 *sub_236954564(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_236955C58(a3, a2, a1);
}

char *sub_236954578(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_236955F34(a3, v6, v5, a1);
}

char *sub_2369545F4(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_23695603C(a3, v6, v5, a1);
}

char *sub_236954670(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_236956144(a3, v6, v5, a1);
}

char *sub_2369546EC(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_23695624C(a3, v6, v5, a1);
}

char *sub_236954768(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_236956354(a3, v6, v5, a1);
}

char *sub_2369547E4(int *a1, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (char *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    int v5 = v8;
  }
  else
  {
    uint64_t v6 = a2 + 1;
  }
  return sub_23695645C(a3, v6, v5, a1);
}

char *sub_23695485C(uint64_t a1, char *a2, uint64_t a3)
{
  unsigned int v10 = a2;
  while (1)
  {
    if (sub_236937D9C(a3, &v10, *(_DWORD *)(a3 + 92))) {
      return v10;
    }
    int v5 = v10 + 1;
    unsigned int v6 = *v10;
    if (*v10 < 0)
    {
      unsigned int v6 = v6 + (*v5 << 7) - 128;
      if (*v5 < 0)
      {
        int v5 = v10 + 3;
        uint64_t v8 = -21;
        while (1)
        {
          v6 += (*(v5 - 1) - 1) << (v8 + 35);
          if ((*(v5 - 1) & 0x80000000) == 0) {
            break;
          }
          ++v5;
          v8 += 7;
          if (!v8) {
            return 0;
          }
        }
      }
      else
      {
        int v5 = v10 + 2;
      }
    }
    unsigned int v10 = v5;
    if (!v6 || (v6 & 7) == 4) {
      break;
    }
    unsigned int v10 = (char *)sub_236954974(v6, a1);
    if (!v10) {
      return 0;
    }
  }
  *(_DWORD *)(a3 + 80) = v6 - 1;
  return v5;
}

unsigned __int8 *sub_236954948(unsigned int a1, std::string *a2, char *a3, int32x2_t *a4)
{
  int v5 = a2;
  return sub_236954974(a1, &v5, a3, a4);
}

unsigned __int8 *sub_236954974(unint64_t a1, std::string **a2, char *a3, int32x2_t *a4)
{
  unint64_t v4 = a1 >> 3;
  if (!(a1 >> 3)) {
    return 0;
  }
  int v5 = (unsigned __int8 *)a3;
  switch(a1 & 7)
  {
    case 0uLL:
      v11[0].__r_.__value_.__r.__words[0] = 0;
      int v5 = sub_236954AD4(a3, v11);
      if (v5) {
        sub_236956564(a2, v4, v11[0].__r_.__value_.__r.__words[0]);
      }
      return v5;
    case 1uLL:
      int v5 = (unsigned __int8 *)(a3 + 8);
      sub_23695662C((std::string *)a2, v4, *(void *)a3);
      return v5;
    case 2uLL:
      uint64_t v8 = (unsigned __int8 *)sub_2369566E8(a2, v4, a3, (uint64_t)a4);
      goto LABEL_10;
    case 3uLL:
      uint64_t v8 = (unsigned __int8 *)sub_236956854(a2, v4, a3, a4);
LABEL_10:
      int v5 = v8;
      break;
    case 4uLL:
      sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 758);
      unint64_t v7 = sub_23694710C(v11, "Can't happen");
      sub_236947248((uint64_t)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v11);
      break;
    case 5uLL:
      int v5 = (unsigned __int8 *)(a3 + 4);
      sub_236956980((std::string *)a2, v4, *(_DWORD *)a3);
      break;
    default:
      return 0;
  }
  return v5;
}

void sub_236954AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_236954AD4(char *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (*a1 < 0)
  {
    int v4 = a1[1];
    uint64_t v5 = (v2 + (v4 << 7) - 128);
    if ((v4 & 0x80) != 0)
    {
      uint64_t result = (unsigned __int8 *)(a1 + 3);
      uint64_t v6 = 14;
      while (1)
      {
        v5 += (*(result - 1) - 1) << v6;
        if (((char)*(result - 1) & 0x80000000) == 0) {
          break;
        }
        ++result;
        v6 += 7;
        if (v6 == 70)
        {
          uint64_t result = 0;
          uint64_t v5 = 0;
          break;
        }
      }
      *a2 = v5;
    }
    else
    {
      *a2 = v5;
      return (unsigned __int8 *)(a1 + 2);
    }
  }
  else
  {
    *a2 = v2;
    return (unsigned __int8 *)(a1 + 1);
  }
  return result;
}

unsigned __int8 *sub_236954B48(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_236954D6C(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_236954D6C(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_23694710C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_236954D6C((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_23694710C(&v18, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_236954D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_236954D6C(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_236954AD4((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_2369570D0(a3, v7 + 1);
      *(_DWORD *)(sub_236957570((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_236957570((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_236954E1C(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_236955040(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_236955040(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_23694710C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_236955040((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_23694710C(&v18, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_236955018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_236955040(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_236954AD4((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_23695772C(a3, v7 + 1);
      *(_DWORD *)(sub_236957BCC((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_236957BCC((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_2369550F0(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_236955314(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_236955314(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_23694710C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_236955314((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_23694710C(&v18, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_2369552EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_236955314(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_236954AD4((char *)i, &v10);
    if (!i) {
      break;
    }
    uint64_t v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_236957D88(a3, v7 + 1);
      *(void *)(sub_236958228((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(sub_236958228((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_2369553C4(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_2369555E8(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_2369555E8(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_23694710C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_2369555E8((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_23694710C(&v18, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_2369555C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_2369555E8(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_236954AD4((char *)i, &v10);
    if (!i) {
      break;
    }
    uint64_t v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_2369583E4(a3, v7 + 1);
      *(void *)(sub_236958884((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(sub_236958884((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_236955698(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_2369558BC(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_2369558BC(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_23694710C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_2369558BC((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_23694710C(&v18, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_236955894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_2369558BC(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_236954AD4((char *)i, &v10);
    if (!i) {
      break;
    }
    int v6 = -(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_2369570D0(a3, v7 + 1);
      *(_DWORD *)(sub_236957570((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(sub_236957570((uint64_t)a3) + 4 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_236955978(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_236955B9C(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_236955B9C(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_23694710C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_236955B9C((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_23694710C(&v18, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_236955B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_236955B9C(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    unint64_t v10 = 0;
    uint64_t i = sub_236954AD4((char *)i, &v10);
    if (!i) {
      break;
    }
    unint64_t v6 = -(uint64_t)(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_236957D88(a3, v7 + 1);
      *(void *)(sub_236958228((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(sub_236958228((uint64_t)a3) + 8 * v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *sub_236955C58(uint64_t a1, unsigned __int8 *a2, int *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *a2;
  if ((char)*a2 < 0)
  {
    uint64_t result = (unsigned __int8 *)sub_23695441C((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    int v5 = v7;
  }
  else
  {
    uint64_t result = a2 + 1;
  }
  unint64_t v8 = *(void *)(a1 + 8);
  int v9 = v8 - result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    unint64_t v14 = (unint64_t)&result[v5];
    uint64_t result = sub_236955E7C(result, v14, a3);
    if ((unsigned __int8 *)v14 != result) {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      uint64_t result = sub_236955E7C(result, v8, a3);
      if (!result) {
        break;
      }
      signed int v10 = result - *(void *)(a1 + 8);
      if (v10 >= 0x11)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        int v11 = sub_23694710C(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        sub_236947248((uint64_t)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      int v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        __int16 v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(void *)(a1 + 8);
        int v15 = sub_236955E7C((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15) {
          BOOL v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16) {
          return 0;
        }
        return (unsigned __int8 *)(*(void *)(a1 + 8) + v12);
      }
      int v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        sub_2369470F4((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        BOOL v13 = sub_23694710C(&v18, "CHECK failed: (size) > (0): ");
        sub_236947248((uint64_t)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        sub_236947250((uint64_t)&v18);
      }
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (unsigned __int8 *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      result += v10;
      unint64_t v8 = *(void *)(a1 + 8);
      int v9 = v8 - result;
      if (v5 <= (int)v8 - (int)result) {
        goto LABEL_15;
      }
    }
  }
  return result;
}

void sub_236955E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_236955E7C(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = sub_236954AD4((char *)i, &v10);
    if (!i) {
      break;
    }
    BOOL v6 = v10 != 0;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      int v8 = v7 + 1;
      sub_236956A7C(a3, v7 + 1);
      *(unsigned char *)(sub_236956F18((uint64_t)a3) + v7) = v6;
    }
    else
    {
      *(unsigned char *)(sub_236956F18((uint64_t)a3) + v7) = v6;
      int v8 = v7 + 1;
    }
  }
  return i;
}

char *sub_236955F34(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23695772C(a4, *a4 + (v5 >> 2));
    int v11 = (void *)sub_236957900((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return &v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_23695772C(a4, *a4 + (v7 >> 2));
      int v9 = (void *)sub_236957900((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = &result[-(v7 & 3) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_23695603C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_2369570D0(a4, *a4 + (v5 >> 2));
    int v11 = (void *)sub_2369572A4((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return &v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_2369570D0(a4, *a4 + (v7 >> 2));
      int v9 = (void *)sub_2369572A4((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = &result[-(v7 & 3) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_236956144(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_2369583E4(a4, *a4 + (v5 >> 3));
    int v11 = (void *)sub_2369585B8((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return &v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_2369583E4(a4, *a4 + (v7 >> 3));
      int v9 = (void *)sub_2369585B8((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = &result[-(v7 & 7) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_23695624C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_236957D88(a4, *a4 + (v5 >> 3));
    int v11 = (void *)sub_236957F5C((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return &v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_236957D88(a4, *a4 + (v7 >> 3));
      int v9 = (void *)sub_236957F5C((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = &result[-(v7 & 7) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_236956354(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_236958A40(a4, *a4 + (v5 >> 2));
    int v11 = (void *)sub_236958C14((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC)) {
      return &v6[v5 & 0xFFFFFFFC];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_236958A40(a4, *a4 + (v7 >> 2));
      int v9 = (void *)sub_236958C14((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFFC;
      BOOL v6 = &result[-(v7 & 3) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 3));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

char *sub_23695645C(uint64_t a1, char *a2, int a3, int *a4)
{
  int v5 = a3;
  BOOL v6 = a2;
  int v7 = *(_DWORD *)(a1 + 8) - a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    sub_23695909C(a4, *a4 + (v5 >> 3));
    int v11 = (void *)sub_236959270((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8)) {
      return &v6[v5 & 0xFFFFFFF8];
    }
    else {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      sub_23695909C(a4, *a4 + (v7 >> 3));
      int v9 = (void *)sub_236959270((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*(int *)(a1 + 28) < 17) {
        return 0;
      }
      uint64_t result = (char *)sub_2369535CC(a1);
      if (!result) {
        return result;
      }
      v5 -= v7 & 0xFFFFFFF8;
      BOOL v6 = &result[-(v7 & 7) + 16];
      int v7 = *(_DWORD *)(a1 + 8) - (result - (v7 & 7));
      if (v5 <= v7) {
        goto LABEL_5;
      }
    }
  }
}

void sub_236956564(std::string **a1, int a2, unint64_t a3)
{
  int v3 = *a1;
  if (*a1)
  {
    unint64_t v6 = (8 * a2);
    if (v6 < 0x80)
    {
      LOBYTE(v7) = 8 * a2;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    int v9 = *a1;
    if (a3 < 0x80)
    {
      LOBYTE(v10) = a3;
    }
    else
    {
      do
      {
        std::string::push_back(v9, a3 | 0x80);
        unint64_t v10 = a3 >> 7;
        unint64_t v11 = a3 >> 14;
        a3 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v9, v10);
  }
}

std::string *sub_23695662C(std::string *result, int a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  int v3 = (std::string *)result->__r_.__value_.__r.__words[0];
  if (result->__r_.__value_.__r.__words[0])
  {
    int v5 = (std::string **)result;
    unint64_t v6 = (8 * a2) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9[0] = a3;
    return std::string::append(*v5, (const std::string::value_type *)v9, 8uLL);
  }
  return result;
}

const std::string::value_type *sub_2369566E8(std::string **a1, int a2, char *a3, uint64_t a4)
{
  int v7 = *a3;
  if (*a3 < 0)
  {
    uint64_t result = (const std::string::value_type *)sub_23695441C((uint64_t)a3, *a3);
    if (!result) {
      return result;
    }
    unint64_t v8 = (std::string::value_type *)result;
    int v7 = v10;
  }
  else
  {
    unint64_t v8 = a3 + 1;
  }
  unint64_t v11 = *a1;
  if (*a1)
  {
    unint64_t v12 = (8 * a2) | 2u;
    if (v12 < 0x80)
    {
      LOBYTE(v13) = v12;
    }
    else
    {
      do
      {
        std::string::push_back(v11, v12 | 0x80);
        unint64_t v13 = v12 >> 7;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
    }
    std::string::push_back(v11, v13);
    unint64_t v15 = v7;
    BOOL v16 = *a1;
    if (v7 < 0x80)
    {
      LOBYTE(v17) = v7;
    }
    else
    {
      do
      {
        std::string::push_back(v16, v15 | 0x80);
        unint64_t v17 = v15 >> 7;
        unint64_t v18 = v15 >> 14;
        v15 >>= 7;
      }
      while (v18);
    }
    std::string::push_back(v16, v17);
    __int16 v19 = *a1;
    return sub_236956A10(a4, v8, v7, v19);
  }
  else if (*(void *)(a4 + 8) - (void)v8 + 16 >= v7)
  {
    return &v8[v7];
  }
  else
  {
    return (const std::string::value_type *)sub_236953DB8(a4, (int)v8, v7);
  }
}

char *sub_236956854(std::string **a1, int a2, char *a3, int32x2_t *a4)
{
  int v7 = *a1;
  int v8 = 8 * a2;
  if (*a1)
  {
    unint64_t v9 = v8 | 3u;
    if (v9 < 0x80)
    {
      LOBYTE(v10) = v8 | 3;
    }
    else
    {
      do
      {
        std::string::push_back(v7, v9 | 0x80);
        unint64_t v10 = v9 >> 7;
        unint64_t v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v7, v10);
  }
  int v12 = a4[11].i32[0];
  BOOL v13 = __OFSUB__(v12--, 1);
  a4[11].i32[0] = v12;
  if (v12 < 0 != v13) {
    return 0;
  }
  ++a4[11].i32[1];
  unint64_t v14 = sub_23695485C((uint64_t)a1, a3, (uint64_t)a4);
  a4[11] = vadd_s32(a4[11], (int32x2_t)0xFFFFFFFF00000001);
  __int32 v15 = a4[10].i32[0];
  a4[10].i32[0] = 0;
  if (v15 != (v8 | 3) || v14 == 0) {
    return 0;
  }
  unint64_t v17 = v14;
  unint64_t v18 = *a1;
  if (v18)
  {
    unint64_t v19 = v8 | 4u;
    if (v19 < 0x80)
    {
      LOBYTE(v20) = v8 | 4;
    }
    else
    {
      do
      {
        std::string::push_back(v18, v19 | 0x80);
        unint64_t v20 = v19 >> 7;
        unint64_t v21 = v19 >> 14;
        v19 >>= 7;
      }
      while (v21);
    }
    std::string::push_back(v18, v20);
  }
  return v17;
}

std::string *sub_236956980(std::string *result, int a2, int a3)
{
  int v3 = (std::string *)result->__r_.__value_.__r.__words[0];
  if (result->__r_.__value_.__r.__words[0])
  {
    int v5 = (std::string **)result;
    unint64_t v6 = (8 * a2) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        unint64_t v7 = v6 >> 7;
        unint64_t v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    *(_DWORD *)__s = a3;
    return std::string::append(*v5, __s, 4uLL);
  }
  return result;
}

const std::string::value_type *sub_236956A10(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  if (*(void *)(a1 + 8) - (void)__s + 16 >= a3)
  {
    uint64_t v6 = a3;
    std::string::append(this, __s, a3);
    return &__s[v6];
  }
  else
  {
    return sub_236954028(a1, __s, a3, this);
  }
}

void sub_236956A7C(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_236956F18((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_2369470F4((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_23694710C(v15, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_236947248((uint64_t)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v15);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_236956F18((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  if (v6)
  {
    uint64_t v11 = (v9 + 15) & 0x1FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v11);
    }
    int v12 = (void *)sub_236945A60(v6, v11);
  }
  else
  {
    int v12 = operator new(v9 + 8);
  }
  void *v12 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v12 + 1;
  sub_236956F18((uint64_t)a1);
  if (*a1 >= 1)
  {
    BOOL v13 = (void *)sub_236956F18((uint64_t)a1);
    memcpy(v13, v5 + 1, *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_236956C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236956C4C(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_23694710C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_236947304(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_23694710C(v6, ", ");
    unint64_t v8 = sub_236947304(v7, *(_DWORD *)a1);
    sub_236947248((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_236956CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236956D0C(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236956F18((uint64_t)a1) + a2;
}

void sub_236956DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236956DEC(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236956F18((uint64_t)a1) + a2;
}

void sub_236956EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236956ECC(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_236956F18(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_236956F18(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_2369470F4((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_23694710C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_236956F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_236956FA4(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_23694710C(v10, "CHECK failed: (&other) != (this): ");
    sub_236947248((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_236947250((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_236956A7C(v3, *v3 + *a2);
    sub_236956C4C((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_236956D0C(v3, v5);
    if (*a2 <= 0)
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_23694710C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_236956F18((uint64_t)a2);
    return (int *)memcpy(v6, v8, *a2);
  }
  return result;
}

void sub_2369570B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2369570D0(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_236957570((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_23694710C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_236947248((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_236957570((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_236945A60(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_236957570((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_236957570((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_23695728C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2369572A4(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_23694710C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_236947304(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_23694710C(v6, ", ");
    unint64_t v8 = sub_236947304(v7, *(_DWORD *)a1);
    sub_236947248((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_23695734C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236957364(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236957570((uint64_t)a1) + 4 * a2;
}

void sub_236957424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236957444(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236957570((uint64_t)a1) + 4 * a2;
}

void sub_236957504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236957524(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_236957570(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_236957570(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_2369470F4((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_23694710C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_2369575E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_2369575FC(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_23694710C(v10, "CHECK failed: (&other) != (this): ");
    sub_236947248((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_236947250((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_2369570D0(v3, *v3 + *a2);
    sub_2369572A4((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_236957364(v3, v5);
    if (*a2 <= 0)
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_23694710C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_236957570((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_23695770C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23695772C(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_236957BCC((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_23694710C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_236947248((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_236957BCC((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_236945A60(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_236957BCC((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_236957BCC((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_2369578E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236957900(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_23694710C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_236947304(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_23694710C(v6, ", ");
    unint64_t v8 = sub_236947304(v7, *(_DWORD *)a1);
    sub_236947248((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_2369579A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2369579C0(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236957BCC((uint64_t)a1) + 4 * a2;
}

void sub_236957A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236957AA0(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236957BCC((uint64_t)a1) + 4 * a2;
}

void sub_236957B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236957B80(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_236957BCC(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_236957BCC(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_2369470F4((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_23694710C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_236957C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_236957C58(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_23694710C(v10, "CHECK failed: (&other) != (this): ");
    sub_236947248((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_236947250((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_23695772C(v3, *v3 + *a2);
    sub_236957900((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_2369579C0(v3, v5);
    if (*a2 <= 0)
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_23694710C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_236957BCC((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_236957D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236957D88(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_236958228((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_23694710C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_236947248((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_236958228((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_236945A60(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_236958228((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_236958228((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_236957F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236957F5C(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_23694710C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_236947304(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_23694710C(v6, ", ");
    unint64_t v8 = sub_236947304(v7, *(_DWORD *)a1);
    sub_236947248((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_236958004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_23695801C(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236958228((uint64_t)a1) + 8 * a2;
}

void sub_2369580DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2369580FC(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236958228((uint64_t)a1) + 8 * a2;
}

void sub_2369581BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2369581DC(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_236958228(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_236958228(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_2369470F4((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_23694710C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_23695829C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_2369582B4(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_23694710C(v10, "CHECK failed: (&other) != (this): ");
    sub_236947248((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_236947250((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_236957D88(v3, *v3 + *a2);
    sub_236957F5C((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_23695801C(v3, v5);
    if (*a2 <= 0)
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_23694710C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_236958228((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_2369583C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2369583E4(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_236958884((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_23694710C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_236947248((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_236958884((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_236945A60(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_236958884((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_236958884((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_2369585A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2369585B8(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_23694710C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_236947304(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_23694710C(v6, ", ");
    unint64_t v8 = sub_236947304(v7, *(_DWORD *)a1);
    sub_236947248((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_236958660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236958678(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236958884((uint64_t)a1) + 8 * a2;
}

void sub_236958738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236958758(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236958884((uint64_t)a1) + 8 * a2;
}

void sub_236958818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236958838(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_236958884(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_236958884(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_2369470F4((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_23694710C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_2369588F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_236958910(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_23694710C(v10, "CHECK failed: (&other) != (this): ");
    sub_236947248((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_236947250((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_2369583E4(v3, *v3 + *a2);
    sub_2369585B8((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_236958678(v3, v5);
    if (*a2 <= 0)
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_23694710C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_236958884((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_236958A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236958A40(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_236958EE0((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_23694710C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_236947248((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_236958EE0((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 4 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_236945A60(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_236958EE0((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_236958EE0((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_236958BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236958C14(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_23694710C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_236947304(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_23694710C(v6, ", ");
    unint64_t v8 = sub_236947304(v7, *(_DWORD *)a1);
    sub_236947248((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_236958CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236958CD4(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236958EE0((uint64_t)a1) + 4 * a2;
}

void sub_236958D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236958DB4(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_236958EE0((uint64_t)a1) + 4 * a2;
}

void sub_236958E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236958E94(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_236958EE0(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_236958EE0(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_2369470F4((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_23694710C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_236958F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_236958F6C(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_23694710C(v10, "CHECK failed: (&other) != (this): ");
    sub_236947248((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_236947250((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_236958A40(v3, *v3 + *a2);
    sub_236958C14((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_236958CD4(v3, v5);
    if (*a2 <= 0)
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_23694710C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_236958EE0((uint64_t)a2);
    return (int *)memcpy(v6, v8, 4 * *a2);
  }
  return result;
}

void sub_23695907C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23695909C(int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    int v5 = 0;
    if (v2)
    {
LABEL_4:
      uint64_t v6 = *(void *)(sub_23695953C((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        int v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            sub_2369470F4((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            unint64_t v8 = sub_23694710C(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            sub_236947248((uint64_t)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            sub_236947250((uint64_t)v16);
          }
          unsigned int v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    int v5 = (void *)(sub_23695953C((uint64_t)a1) - 8);
    if (a1[1]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = *((void *)a1 + 1);
  if (a2 >= 4)
  {
    int v7 = 0;
LABEL_13:
    int v10 = 2 * v7;
    if (v10 <= a2) {
      unsigned int v9 = a2;
    }
    else {
      unsigned int v9 = v10;
    }
    goto LABEL_16;
  }
LABEL_11:
  unsigned int v9 = 4;
LABEL_16:
  uint64_t v11 = 8 * v9;
  if (v6)
  {
    uint64_t v12 = (v11 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v6 + 24)) {
      (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v6 + 32) + 32) + 40))(*(void *)(*(void *)(v6 + 32) + 32), MEMORY[0x263F8C238], v12);
    }
    BOOL v13 = (void *)sub_236945A60(v6, v12);
  }
  else
  {
    BOOL v13 = operator new(v11 + 8);
  }
  *BOOL v13 = v6;
  a1[1] = v9;
  *((void *)a1 + 1) = v13 + 1;
  sub_23695953C((uint64_t)a1);
  if (*a1 >= 1)
  {
    char v14 = (void *)sub_23695953C((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5) {
      operator delete(v5);
    }
  }
}

void sub_236959258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236959270(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    sub_2369470F4((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    int v5 = sub_23694710C(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    uint64_t v6 = sub_236947304(v5, *(_DWORD *)(a1 + 4));
    int v7 = sub_23694710C(v6, ", ");
    unint64_t v8 = sub_236947304(v7, *(_DWORD *)a1);
    sub_236947248((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v11);
    int v4 = *(_DWORD *)a1;
  }
  uint64_t result = *(void *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_236959318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236959330(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_23695953C((uint64_t)a1) + 8 * a2;
}

void sub_2369593F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_236959410(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    int v4 = sub_23694710C(v8, "CHECK failed: (index) >= (0): ");
    sub_236947248((uint64_t)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  if (*a1 <= a2)
  {
    sub_2369470F4((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    int v5 = sub_23694710C(v8, "CHECK failed: (index) < (current_size_): ");
    sub_236947248((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v8);
  }
  return sub_23695953C((uint64_t)a1) + 8 * a2;
}

void sub_2369594D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2369594F0(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v2 = sub_23695953C(a1);
    uint64_t v4 = *(void *)(v2 - 8);
    int v3 = (void *)(v2 - 8);
    if (!v4) {
      operator delete(v3);
    }
  }
  return a1;
}

uint64_t sub_23695953C(uint64_t a1)
{
  if (*(int *)(a1 + 4) <= 0)
  {
    sub_2369470F4((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    uint64_t v2 = sub_23694710C(v5, "CHECK failed: (total_size_) > (0): ");
    sub_236947248((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_236947250((uint64_t)v5);
  }
  return *(void *)(a1 + 8);
}

void sub_2369595B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

int *sub_2369595C8(int *result, int *a2)
{
  int v3 = result;
  if (a2 == result)
  {
    sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    char v4 = sub_23694710C(v10, "CHECK failed: (&other) != (this): ");
    sub_236947248((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = (int *)sub_236947250((uint64_t)v10);
  }
  if (*a2)
  {
    int v5 = *v3;
    sub_23695909C(v3, *v3 + *a2);
    sub_236959270((uint64_t)v3, *a2);
    uint64_t v6 = (void *)sub_236959330(v3, v5);
    if (*a2 <= 0)
    {
      sub_2369470F4((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      char v7 = sub_23694710C(v10, "CHECK failed: (index) < (current_size_): ");
      sub_236947248((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_236947250((uint64_t)v10);
    }
    unint64_t v8 = (const void *)sub_23695953C((uint64_t)a2);
    return (int *)memcpy(v6, v8, 8 * *a2);
  }
  return result;
}

void sub_2369596D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_236947250((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_2369596F8(uint64_t *a1)
{
  sub_236959734(a1);
  return sub_2369381D4(a1);
}

void sub_236959734(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    int v3 = (uint64_t *)(v2 + 2);
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        uint64_t v5 = *v3;
        if (*v3)
        {
          if (*(char *)(v5 + 23) < 0) {
            operator delete(*(void **)v5);
          }
          MEMORY[0x237E07580](v5, 0x1012C40EC159624);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t sub_2369597C8(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 8);
  BOOL v3 = __OFSUB__(a2, v2);
  int v4 = a2 - v2;
  if (!((v4 < 0) ^ v3 | (v4 == 0))) {
    return sub_2369597DC((uint64_t *)result, v4);
  }
  return result;
}

uint64_t sub_2369597DC(uint64_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 2);
  int v3 = *((_DWORD *)a1 + 3);
  int v4 = v2 + a2;
  uint64_t v5 = (unsigned int *)a1[2];
  if (v3 < v2 + a2)
  {
    uint64_t v7 = *a1;
    int v8 = 2 * v3;
    if (2 * v3 <= v4) {
      int v8 = v4;
    }
    if (v8 <= 4) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = v8;
    }
    uint64_t v10 = 8 * v9;
    if (v7)
    {
      uint64_t v11 = (v10 + 15) & 0x7FFFFFFF8;
      if (*(unsigned char *)(v7 + 24)) {
        (*(void (**)(void, void, uint64_t))(**(void **)(*(void *)(v7 + 32) + 32) + 40))(*(void *)(*(void *)(v7 + 32) + 32), MEMORY[0x263F8C238], v11);
      }
      uint64_t v12 = (unsigned int *)sub_236945A60(v7, v11);
    }
    else
    {
      uint64_t v12 = (unsigned int *)operator new(v10 + 8);
    }
    a1[2] = (uint64_t)v12;
    *((_DWORD *)a1 + 3) = v9;
    if (v5 && (uint64_t v13 = *v5, (int)v13 >= 1))
    {
      memcpy(v12 + 2, v5 + 2, 8 * v13);
      uint64_t v12 = (unsigned int *)a1[2];
      unsigned int *v12 = *v5;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int *v12 = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        uint64_t v12 = (unsigned int *)a1[2];
      }
    }
    int v2 = *((_DWORD *)a1 + 2);
    uint64_t v5 = v12;
  }
  return (uint64_t)&v5[2 * v2 + 2];
}

uint64_t sub_236959908(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  *(void *)a1 = &unk_26E9CE998;
  *(void *)(a1 + 16) = &unk_26E9CE958;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = &unk_26E9CE958;
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v6 = (uint64_t *)(a1 + 88);
  sub_236944CDC((void *)(a1 + 88));
  sub_236959A00(a1, a2, a3, &v8);
  sub_236944F04(v6, &v8);
  sub_236944CE4(&v8);
  return a1;
}

void sub_2369599DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_236944CE4((uint64_t *)va);
  sub_236944CE4(v2);
  _Unwind_Resume(a1);
}

void *sub_236959A00@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v13 = a2;
  unint64_t v14 = a3;
  int v12 = 0;
  uint64_t result = sub_236910588(a2, a3, &v12, a4);
  if (!*a4)
  {
    sub_236944CE4(a4);
    uint64_t result = sub_236942FE0(&v13, 4uLL, a4);
    if (!*a4)
    {
      sub_236944CE4(a4);
      *(_DWORD *)(a1 + 8) = v12;
      int v11 = 0;
      uint64_t result = sub_236910588(v13, v14, &v11, a4);
      if (!*a4)
      {
        sub_236944CE4(a4);
        uint64_t result = sub_236942FE0(&v13, 4uLL, a4);
        if (!*a4)
        {
          sub_236944CE4(a4);
          *(_DWORD *)(a1 + 24) = v11;
          int v10 = 0;
          uint64_t result = sub_236910588(v13, v14, &v10, a4);
          if (!*a4)
          {
            sub_236944CE4(a4);
            uint64_t result = sub_236942FE0(&v13, 4uLL, a4);
            if (!*a4)
            {
              sub_236944CE4(a4);
              int v7 = v10;
              *(_DWORD *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 40) = v7;
              uint64_t result = sub_23691038C(v13, v14, (_DWORD *)(a1 + 48), a4);
              if (!*a4)
              {
                sub_236944CE4(a4);
                uint64_t result = sub_236942FE0(&v13, 4uLL, a4);
                if (!*a4)
                {
                  sub_236944CE4(a4);
                  *(void *)(a1 + 56) = v13;
                  unint64_t v8 = sub_236942F54(*(int *)(a1 + 48), 4uLL);
                  uint64_t result = sub_236942FE0(&v13, v8, a4);
                  if (!*a4)
                  {
                    sub_236944CE4(a4);
                    *(void *)(a1 + 64) = v13;
                    uint64_t result = sub_236942FE0(&v13, 4 * *(int *)(a1 + 48), a4);
                    if (!*a4)
                    {
                      sub_236944CE4(a4);
                      *(void *)(a1 + 72) = v13;
                      uint64_t result = sub_236942FE0(&v13, 4 * *(int *)(a1 + 48) + 20, a4);
                      if (!*a4)
                      {
                        unsigned int v9 = sub_236944CE4(a4);
                        *(void *)(a1 + 80) = v13;
                        return sub_236944CDC(v9);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_236959C00()
{
}

uint64_t sub_236959C14(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_236959C20(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_236959C2C(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 2) & 1;
}

uint64_t sub_236959C38(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 3) & 1;
}

void *sub_236959C44(void *a1)
{
  *a1 = &unk_26E9CE998;
  sub_236944CE4(a1 + 11);
  return a1;
}

void sub_236959C88(void *a1)
{
  *a1 = &unk_26E9CE998;
  sub_236944CE4(a1 + 11);
  JUMPOUT(0x237E07580);
}

uint64_t sub_236959CEC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

const char *sub_236959CF4(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + **(unsigned int **)(a1 + 72));
  strlen(v1);
  return v1;
}

const char *sub_236959D2C(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 4));
  strlen(v1);
  return v1;
}

const char *sub_236959D64(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 8));
  strlen(v1);
  return v1;
}

const char *sub_236959D9C(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 12));
  strlen(v1);
  return v1;
}

const char *sub_236959DD4(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 16));
  strlen(v1);
  return v1;
}

uint64_t sub_236959E0C(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_236959E18(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_236959E24(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) >> 30;
}

const char *sub_236959E30(uint64_t a1, int a2)
{
  int v2 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 4 * (a2 + 5)));
  strlen(v2);
  return v2;
}

float sub_236959E6C(uint64_t a1, int a2)
{
  return *(float *)(*(void *)(a1 + 64) + 4 * a2);
}

BOOL sub_236959E78(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 1;
}

BOOL sub_236959E8C(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 2;
}

BOOL sub_236959EA0(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 3;
}

BOOL sub_236959EB4(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 4;
}

BOOL sub_236959EC8(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 5;
}

BOOL sub_236959EDC(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 6;
}

uint64_t sub_236959EF0(uint64_t a1)
{
  return a1 + 16;
}

uint64_t sub_236959EF8(uint64_t a1)
{
  return a1 + 32;
}

void sub_23695A104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23695A124()
{
  if (!qword_2688A6ED0) {
    qword_2688A6ED0 = _sl_dlopen();
  }
  return qword_2688A6ED0;
}

void sub_23695A1F4(void *a1)
{
  if (!sub_23695A124())
  {
    int v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v2, v3, v4, v5);
    a1 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"void *OfficeImportLibrary(void)", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v14, (uint64_t)a1, @"OfficeImportCompatibility.m", 17, @"%s", 0);

    __break(1u);
    free(v15);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = objc_getClass("OISpotlightImporter");
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    qword_2688A6ED8 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  else
  {
    BOOL v16 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v6, v7, v8, v9);
    unint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"Class getOISpotlightImporterClass(void)_block_invoke", v18, v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v20, @"OfficeImportCompatibility.m", 18, @"Unable to find class %s", "OISpotlightImporter");

    __break(1u);
  }
}

uint64_t sub_23695A33C()
{
  uint64_t result = _sl_dlopen();
  qword_2688A6ED0 = result;
  return result;
}

uint64_t sub_23695A8C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_raise_format_(MEMORY[0x263EFF940], a2, @"FileErrorCode", @"Terminating in DUPaths due to %@", a5, *(void *)(a1 + 32));
}

void sub_23696C414(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v8 = *MEMORY[0x263F07F70];
  char v9 = 1;
  int v10 = &_os_log_internal;
  do
  {
    char v11 = v9;
    uint64_t v12 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5, v6, v7);
    id v53 = 0;
    char v14 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v12, v13, (uint64_t)v2, 1, 0, &v53);
    id v15 = v53;

    if (v14) {
      goto LABEL_15;
    }
    if (objc_msgSend_code(v15, v16, v17, v18, v19) == 640)
    {
      char v24 = objc_msgSend_domain(v15, v20, v21, v22, v23);
      int isEqualToString = objc_msgSend_isEqualToString_(v24, v25, v8, v26, v27);

      if (isEqualToString)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v55 = v2;
          _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DUPaths: _createDirectoryAtPath: exiting due to lack of disk space while creating %@", buf, 0xCu);
        }
        if (objc_msgSend_isInternalBuild(MEMORY[0x263F61E28], v48, v49, v50, v51)
          && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_FAULT, "DUPaths: unable to create directory due to lack of space.", buf, 2u);
        }
        int v47 = 4002;
        goto LABEL_30;
      }
    }
    if (objc_msgSend_code(v15, v20, v21, v22, v23) == 513)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v2;
        _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DUPaths: _createDirectoryAtPath: exiting due to lack of write permissions to directory %@", buf, 0xCu);
      }
      if (objc_msgSend_isInternalBuild(MEMORY[0x263F61E28], v43, v44, v45, v46)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v2;
        _os_log_fault_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_FAULT, "DUPaths: unable to create directory %@ due to lack of permissions.", buf, 0xCu);
      }
LABEL_23:
      int v47 = 4003;
LABEL_30:
      _exit(v47);
    }
    if (objc_msgSend_code(v15, v29, v30, v31, v32) != 516)
    {
      if (v15) {
        objc_msgSend_handleError_(FileErrorCode, v4, (uint64_t)v15, v6, v7);
      }
      goto LABEL_14;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v55 = v2;
      __int16 v56 = 2112;
      id v57 = v15;
      _os_log_error_impl(&dword_2367AD000, v10, OS_LOG_TYPE_ERROR, "DUPaths: deleting file squatting at %@ due to error %@", buf, 0x16u);
    }

    int v37 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v33, v34, v35, v36);
    id v52 = 0;
    objc_msgSend_removeItemAtPath_error_(v37, v38, (uint64_t)v2, (uint64_t)&v52, v39);
    id v40 = v52;

    if (v40)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v55 = v2;
        __int16 v56 = 2112;
        id v57 = v40;
        _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DUPaths: exiting due to failure to delete squatter file %@ due to error %@", buf, 0x16u);
      }
      goto LABEL_23;
    }
    char v9 = 0;
  }
  while ((v11 & 1) != 0);
  id v15 = 0;
LABEL_14:
  uint64_t v41 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v4, v5, v6, v7);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)sel__createDirectoryAtPath_, (uint64_t)v3, @"DUPaths.m", 239, @"DUPaths: _createDirectoryAtPath: %@ error: %@", v2, v15);

LABEL_15:
  objc_sync_exit(v3);
}

void sub_23696C818(_Unwind_Exception *exception_object)
{
}

id sub_23696C848(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = @"TextUnderstanding";
  uint64_t v4 = self;
  uint64_t v5 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  char v9 = objc_msgSend_objectAtIndexedSubscript_(v5, v6, 0, v7, v8);

  if (!v9 || !objc_msgSend_length(v9, v10, v11, v12, v13))
  {
    unint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v10, v11, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)sel_topDirectoryWithName_createIfNeeded_, v4, @"DUPaths.m", 133, @"failed to construct the root path");
  }
  char v14 = (void *)MEMORY[0x237E079B0]();
  uint64_t v18 = objc_msgSend_stringByAppendingPathComponent_(v9, v15, @"TextUnderstanding", v16, v17);
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v22 = 138412290;
  uint64_t v23 = v18;
  _os_log_debug_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "using top directory: %@", (uint8_t *)&v22, 0xCu);
  if (a2) {
LABEL_5:
  }
    sub_23696C414(v4, v18);
LABEL_6:

  return v18;
}

void sub_23696CA98(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x237E079B0]();
  uint64_t v3 = sub_23696C848(*(void *)(a1 + 32), 1);
  uint64_t v4 = (void *)qword_2688A6EE0;
  qword_2688A6EE0 = v3;
}

uint64_t sub_23696D288()
{
  if (!qword_2688A6EF0) {
    qword_2688A6EF0 = _sl_dlopen();
  }
  return qword_2688A6EF0;
}

uint64_t sub_23696D358()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_2688A6F00;
  uint64_t v6 = qword_2688A6F00;
  if (!qword_2688A6F00)
  {
    uint64_t v1 = sub_23696D498();
    v4[3] = (uint64_t)dlsym(v1, "CopyHTMLForIWorkFileAtURL");
    qword_2688A6F00 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_23696D430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_23696D448(uint64_t a1)
{
  id v2 = sub_23696D498();
  uint64_t result = dlsym(v2, "CopyHTMLForIWorkFileAtURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_2688A6F00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_23696D498()
{
  uint64_t v0 = sub_23696D288();
  if (v0) {
    return (void *)v0;
  }
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v1, v2, v3, v4);
  int v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *iWorkImportLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v10, @"iWorkImportCompatibility.m", 13, @"%s", 0);

  __break(1u);
  free(v12);
  return v5;
}

uint64_t sub_23696D548()
{
  uint64_t result = _sl_dlopen();
  qword_2688A6EF0 = result;
  return result;
}

uint64_t sub_23696D6AC()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_2688A6EF8;
  uint64_t v6 = qword_2688A6EF8;
  if (!qword_2688A6EF8)
  {
    uint64_t v1 = sub_23696D498();
    v4[3] = (uint64_t)dlsym(v1, "CopyHTMLForIWorkDataWithUTI");
    qword_2688A6EF8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_23696D784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_23696D79C(uint64_t a1)
{
  uint64_t v2 = sub_23696D498();
  uint64_t result = dlsym(v2, "CopyHTMLForIWorkDataWithUTI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_2688A6EF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23696DCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_23696DCC4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22[0] = 0;
  if (!qword_2688A6F10)
  {
    v22[1] = (void *)MEMORY[0x263EF8330];
    v22[2] = (void *)3221225472;
    v22[3] = sub_23696DEB0;
    v22[4] = &unk_264CB45A0;
    v22[5] = v22;
    long long v23 = xmmword_264CB42A8;
    uint64_t v24 = 0;
    qword_2688A6F10 = _sl_dlopen();
  }
  if (!qword_2688A6F10)
  {
    uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
    id v15 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)"void *ProactiveHarvestingLibrary(void)", v13, v14);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v11, v16, (uint64_t)v15, @"HVHtmlParserHelper.m", 11, @"%s", v22[0]);

    goto LABEL_10;
  }
  if (v22[0]) {
    free(v22[0]);
  }
  Class result = objc_getClass("HVHtmlParser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8, v9, v10);
    unint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"Class getHVHtmlParserClass(void)_block_invoke", v18, v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v11, v21, (uint64_t)v20, @"HVHtmlParserHelper.m", 12, @"Unable to find class %s", "HVHtmlParser");

LABEL_10:
    __break(1u);
  }
  qword_2688A6F08 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23696DEB0()
{
  uint64_t result = _sl_dlopen();
  qword_2688A6F10 = result;
  return result;
}

void sub_23696ED48(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x237E083D0]();
  if (v4 == MEMORY[0x263EF8708])
  {
    string = xpc_dictionary_get_string(v3, "event_type");
    if (strcmp(string, "mds_index_updated") && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DocumentUnderstanding: DocumentUpdateHandler unknown event name", (uint8_t *)&v17, 2u);
    }
    int uint64 = xpc_dictionary_get_uint64(v3, "num_updates");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      uint64_t v18 = string;
      __int16 v19 = 1024;
      int v20 = uint64;
      _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: DocumentUpdateHandler received event %s with number of updates %d", (uint8_t *)&v17, 0x12u);
    }
    objc_msgSend_triggerSpotlightFileUpdateNoArgsWithReply_(*(void **)(a1 + 32), v13, (uint64_t)&unk_26E9CEA70, v14, v15);
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = MEMORY[0x263EF8720];
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5 == v6)
    {
      if (v7)
      {
        uint64_t v16 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        int v17 = 136315138;
        uint64_t v18 = v16;
        uint64_t v8 = &_os_log_internal;
        uint64_t v9 = "DocumentUnderstanding: received DocumentUpdateHandler connection error %s";
        uint32_t v10 = 12;
        goto LABEL_14;
      }
    }
    else if (v7)
    {
      LOWORD(v17) = 0;
      uint64_t v8 = &_os_log_internal;
      uint64_t v9 = "DocumentUnderstanding: DocumentUpdateHandler XPC connction unknown message type";
      uint32_t v10 = 2;
LABEL_14:
      _os_log_error_impl(&dword_2367AD000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, v10);
    }
  }
}

void sub_23696EF54()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v0 = 0;
    _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: DocumentUpdateHandler completed call to triggerSpotlightFileUpdateNoArgsWithReply", v0, 2u);
  }
}

void sub_23696F0E0(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x237E083D0]();
  if (v4 == MEMORY[0x263EF86F0])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      uint64_t v15 = v3;
      _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: DocumentUpdateHandler connection %p event from client", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend__newClientConnection_withTextUnderstandingManager_(*(void **)(a1 + 32), v11, (uint64_t)v3, *(void *)(a1 + 40), v12);
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = MEMORY[0x263EF8720];
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5 == v6)
    {
      if (v7)
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        int v14 = 136315138;
        uint64_t v15 = string;
        uint64_t v8 = &_os_log_internal;
        uint64_t v9 = "DocumentUnderstanding: DocumentUpdateHandler xpc connection error: %s";
        uint32_t v10 = 12;
        goto LABEL_11;
      }
    }
    else if (v7)
    {
      LOWORD(v14) = 0;
      uint64_t v8 = &_os_log_internal;
      uint64_t v9 = "DocumentUnderstanding: DocumentUpdateHandler unknown message type";
      uint32_t v10 = 2;
LABEL_11:
      _os_log_error_impl(&dword_2367AD000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, v10);
    }
  }
}

void sub_23696F464(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Running Poem RunMonthly", buf, 2u);
    }
    sub_23696F548(v3);
    objc_msgSend_onBoardPoem(*(void **)(a1 + 32), v4, v5, v6, v7);
    if (!xpc_activity_set_state((xpc_activity_t)v3, 5) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DONE", v8, 2u);
    }
  }
}

void sub_23696F548(void *a1)
{
  id v1 = a1;
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  id v3 = dispatch_queue_create("com.apple.TextUnderstanding.XPCMonitor", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23696F614;
  block[3] = &unk_264CB4368;
  id v6 = v1;
  id v4 = v1;
  dispatch_after(v2, v3, block);
}

void sub_23696F614(uint64_t a1)
{
  xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Checking defer for XPC activity", buf, 2u);
  }
  while (state == 4 || state == 2)
  {
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setting XPC activity state to DEFER", v9, 2u);
      }
      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DEFER", v8, 2u);
      }
      break;
    }
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x263F08B88], v3, v4, v5, v6, 0.100000001);
    xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Finished checking defer for XPC activity", v7, 2u);
  }
}

void sub_23696F854(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Running Poem RunWeekly", buf, 2u);
    }
    sub_23696F548(v3);
    objc_msgSend_incrementallyUpdatePoem(*(void **)(a1 + 32), v4, v5, v6, v7);
    if (!xpc_activity_set_state((xpc_activity_t)v3, 5) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DONE", v8, 2u);
    }
  }
}

uint64_t sub_23696FAEC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return 1;
}

void sub_23696FB10(uint64_t a1)
{
  dispatch_time_t v2 = (void *)MEMORY[0x237E079B0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_23696FBFC()
{
  uint64_t v0 = (void *)MEMORY[0x237E079B0]();
  uint64_t v1 = objc_opt_new();
  dispatch_time_t v2 = (void *)qword_2688A6F18;
  qword_2688A6F18 = v1;
}

uint64_t sub_236970290(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend_setClientProcessName_(v5, v7, a3, v8, v9);
  id v10 = objc_alloc(MEMORY[0x263F61E10]);
  uint64_t v15 = objc_msgSend_processIdentifier(v6, v11, v12, v13, v14);
  __int16 v19 = objc_msgSend_initWithProcessIdentifier_(v10, v16, v15, v17, v18);
  objc_msgSend_setBundleIdResolver_(*(void **)(a1 + 32), v20, (uint64_t)v19, v21, v22);

  uint64_t v24 = objc_msgSend_checkForAndLogTrueBooleanEntitlement_connection_serviceName_(DUXPCServerHelper, v23, @"com.apple.TextUnderstanding.DocumentUnderstandingHarvesting", (uint64_t)v6, @"com.apple.TextUnderstanding.DocumentUnderstandingHarvesting");
  return v24;
}

uint64_t sub_236970334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_setRemoteObjectProxy_, a2, a4, a5);
}

void sub_236970340()
{
  uint64_t v0 = du_xpc_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_2367AD000, v0, OS_LOG_TYPE_DEFAULT, "DUXPCServerHelper received call to invalidation handler", v1, 2u);
  }
}

void sub_2369703A8()
{
  uint64_t v0 = du_xpc_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_2367AD000, v0, OS_LOG_TYPE_DEFAULT, "DUXPCServerHelper received call to interruption handler", v1, 2u);
  }
}

void sub_236970554(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "synchronousEventExtractionWithSerializedDocument failed with error: %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = objc_msgSend_count(v5, v8, v9, v10, v11);
      _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "synchronousEventExtractionWithSerializedDocument completed. Detected %ld entities", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

void sub_236970770(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v8;
      _os_log_error_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "requestExtractionOfPersonalIDFromDocument failed with error: %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v9();
    goto LABEL_10;
  }
  if (!v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "requestExtractionOfPersonalIDFromDocument completed. No entities detected", (uint8_t *)&v13, 2u);
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  id v10 = objc_alloc(MEMORY[0x263F3AF70]);
  isPartialExtraction = objc_msgSend_initWithResultType_attributes_isPartialExtraction_(v10, v11, a3, (uint64_t)v7, 0);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = a3;
    _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "requestExtractionOfPersonalIDFromDocument completed. Detected entity of type '%ld'", (uint8_t *)&v13, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_10:
}

id sub_236970E9C(int a1, int *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x400uLL);
  *__error() = 0;
  unsigned int v4 = proc_name(a1, buffer, 0x400u);
  if (a2) {
    *a2 = *__error();
  }
  if ((v4 & 0x80000000) != 0)
  {
    id v7 = 0;
  }
  else
  {
    id v5 = [NSString alloc];
    id v7 = objc_msgSend_initWithBytes_length_encoding_(v5, v6, (uint64_t)buffer, v4, 4);
  }
  return v7;
}

void sub_236971358(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 160));
  _Unwind_Resume(a1);
}

void sub_236971390(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = du_xpc_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = (int)objc_msgSend_processIdentifier(WeakRetained, v4, v5, v6, v7);
      _os_log_impl(&dword_2367AD000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was interrupted.", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

void sub_236971494(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = du_xpc_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = (int)objc_msgSend_processIdentifier(WeakRetained, v4, v5, v6, v7);
      _os_log_impl(&dword_2367AD000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was invalidated.", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

void sub_236971AE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_236971BAC;
  block[3] = &unk_264CB44B8;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_236971BAC(void *a1)
{
  if (*(void *)(a1[4] + 32))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v4 = *(void *)(a1[4] + 32);
    if (isKindOfClass)
    {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, a1[5], 0);
    }
    else
    {
      uint64_t v5 = a1[6];
      if (v5)
      {
        (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0, v5);
      }
      else
      {
        id v6 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v3, @"PageContentFetcher", -1, 0);
        (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
      }
    }
    uint64_t v7 = a1[4];
    id v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;
  }
}

void sub_236971D3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, *(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

id sub_236971E84(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  return (id)objc_msgSend_loadHTMLString_baseURL_(*(void **)(*(void *)(a1 + 32) + 8), v5, *(void *)(a1 + 40), 0, v6);
}

void sub_2369723B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2369723CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_23697255C(a1, a2, a3, a4, a5);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WKWebsiteDataStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_2688A6F30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"Class getWKWebsiteDataStoreClass(void)_block_invoke", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v15, (uint64_t)v14, @"PageContentFetcher.m", 21, @"Unable to find class %s", "WKWebsiteDataStore");

    __break(1u);
  }
}

void sub_236972494(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_23697255C(a1, a2, a3, a4, a5);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("WKWebpagePreferences");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_2688A6F40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"Class getWKWebpagePreferencesClass(void)_block_invoke", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v15, (uint64_t)v14, @"PageContentFetcher.m", 22, @"Unable to find class %s", "WKWebpagePreferences");

    __break(1u);
  }
}

void sub_23697255C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12[0] = 0;
  if (!qword_2688A6F38)
  {
    v12[1] = (void *)MEMORY[0x263EF8330];
    v12[2] = (void *)3221225472;
    v12[3] = sub_2369726AC;
    v12[4] = &unk_264CB45A0;
    v12[5] = v12;
    long long v13 = xmmword_264CB4500;
    uint64_t v14 = 0;
    qword_2688A6F38 = _sl_dlopen();
  }
  if (!qword_2688A6F38)
  {
    uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
    id v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *WebKitLibrary(void)", v8, v9);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"PageContentFetcher.m", 17, @"%s", v12[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = v12[0];
  if (v12[0]) {
LABEL_7:
  }
    free(v5);
}

uint64_t sub_2369726AC()
{
  uint64_t result = _sl_dlopen();
  qword_2688A6F38 = result;
  return result;
}

void sub_236974534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  if (a25) {
    operator delete(a25);
  }

  _Unwind_Resume(a1);
}

void sub_236974794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  sub_23691A350((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_236974920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_236974AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  sub_236944CE4(&a9);
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_236974B64(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x237E07580](v3, 0x10B3C403AC161EFLL);

  _Unwind_Resume(a1);
}

id du_xpc_log_handle()
{
  if (qword_26AD8BE68[0] != -1) {
    dispatch_once(qword_26AD8BE68, &unk_26E9CEAD0);
  }
  uint64_t v0 = (void *)qword_26AD8C178;
  return v0;
}

void sub_236978800()
{
  uint64_t v0 = (void *)MEMORY[0x237E079B0]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.TextUnderstanding", "Server XPCClient");
  uint64_t v2 = (void *)qword_26AD8C178;
  qword_26AD8C178 = (uint64_t)v1;
}

id du_file_notification_log_handle()
{
  if (qword_2688A6F50 != -1) {
    dispatch_once(&qword_2688A6F50, &unk_26E9CEAF0);
  }
  uint64_t v0 = (void *)qword_2688A6F48;
  return v0;
}

void sub_2369788B0()
{
  uint64_t v0 = (void *)MEMORY[0x237E079B0]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.TextUnderstanding", "File Notification");
  uint64_t v2 = (void *)qword_2688A6F48;
  qword_2688A6F48 = (uint64_t)v1;
}

sqlite3 *DU_UDF_prenorm_cosine_distance_create_function(sqlite3 *result)
{
  if (result) {
    return (sqlite3 *)sqlite3_create_function(result, "prenorm_cosine_distance", 2, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))DU_UDF_prenorm_cosine_distance, 0, 0);
  }
  return result;
}

void DU_UDF_prenorm_cosine_distance(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 2
    && ((v5 = sqlite3_value_bytes(*a3), int v6 = sqlite3_value_bytes(a3[1]) >> 2, v5 >= 4) ? (v7 = v5 >> 2 == v6) : (v7 = 0),
        v7))
  {
    sqlite3_value_blob(*a3);
    sqlite3_value_blob(a3[1]);
    cblas_sdot_NEWLAPACK();
    double v9 = 1.0 - v8;
    sqlite3_result_double(a1, v9);
  }
  else
  {
    sqlite3_result_null(a1);
  }
}

void sub_236978AE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_msgSend_objcForResponse_(DUObjCCompatibilityUtils, v6, a2, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_236979654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23697966C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_236979734(a1, a2, a3, a4, a5);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SGSimpleMailMessage");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_2688A6F58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"Class getSGSimpleMailMessageClass(void)_block_invoke", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v15, (uint64_t)v14, @"SGHelper.m", 12, @"Unable to find class %s", "SGSimpleMailMessage");

    __break(1u);
  }
}

void sub_236979734(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12[0] = 0;
  if (!qword_26AD8BE60)
  {
    v12[1] = (void *)MEMORY[0x263EF8330];
    v12[2] = (void *)3221225472;
    v12[3] = sub_236979884;
    v12[4] = &unk_264CB45A0;
    v12[5] = v12;
    long long v13 = xmmword_264CB4588;
    uint64_t v14 = 0;
    qword_26AD8BE60 = _sl_dlopen();
  }
  if (!qword_26AD8BE60)
  {
    int v6 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
    id v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *CoreSuggestionsInternalsLibrary(void)", v8, v9);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"SGHelper.m", 11, @"%s", v12[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v5 = v12[0];
  if (v12[0]) {
LABEL_7:
  }
    free(v5);
}

uint64_t sub_236979884()
{
  uint64_t result = _sl_dlopen();
  qword_26AD8BE60 = result;
  return result;
}

void sub_2369799D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2369799E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_236979734(a1, a2, a3, a4, a5);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SGInhumans");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_26AD8C170 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v10 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"Class getSGInhumansClass(void)_block_invoke", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v15, (uint64_t)v14, @"SGHelper.m", 13, @"Unable to find class %s", "SGInhumans");

    __break(1u);
  }
}

uint64_t sub_236979EBC()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_236979ECC()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_236979EDC()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_236979EEC()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_236979EFC()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_236979F0C()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_236979F1C()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_236979F2C()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_236979F3C()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_236979F4C()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_236979F5C()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_236979F6C()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_236979F7C()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_236979F8C()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_236979F9C()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_236979FAC()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_236979FBC()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_236979FCC()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_236979FDC()
{
  return MEMORY[0x270EEE6E8]();
}

uint64_t sub_236979FEC()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_236979FFC()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_23697A00C()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_23697A01C()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_23697A02C()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_23697A03C()
{
  return MEMORY[0x270EEE818]();
}

uint64_t sub_23697A04C()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_23697A05C()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_23697A06C()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_23697A07C()
{
  return MEMORY[0x270EEE8B8]();
}

uint64_t sub_23697A08C()
{
  return MEMORY[0x270EEE8C8]();
}

uint64_t sub_23697A09C()
{
  return MEMORY[0x270EEE8D8]();
}

uint64_t sub_23697A0AC()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_23697A0BC()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_23697A0CC()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_23697A0DC()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_23697A0EC()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23697A0FC()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23697A10C()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_23697A11C()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_23697A12C()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_23697A13C()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_23697A14C()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_23697A15C()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23697A16C()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_23697A17C()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23697A18C()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_23697A19C()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23697A1AC()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_23697A1BC()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_23697A1CC()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23697A1DC()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_23697A1EC()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_23697A1FC()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_23697A20C()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_23697A21C()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23697A22C()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_23697A23C()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_23697A24C()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23697A25C()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_23697A26C()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_23697A27C()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_23697A28C()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_23697A29C()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_23697A2AC()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_23697A2BC()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_23697A2CC()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_23697A2DC()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23697A2EC()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_23697A2FC()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23697A30C()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23697A31C()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_23697A32C()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_23697A33C()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23697A34C()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_23697A35C()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_23697A36C()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_23697A37C()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_23697A38C()
{
  return MEMORY[0x270EF1400]();
}

uint64_t sub_23697A39C()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_23697A3AC()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_23697A3BC()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_23697A3CC()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_23697A3DC()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_23697A3EC()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_23697A3FC()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_23697A40C()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_23697A41C()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_23697A42C()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_23697A43C()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_23697A44C()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_23697A45C()
{
  return MEMORY[0x270F4B8C0]();
}

uint64_t sub_23697A46C()
{
  return MEMORY[0x270F4B8C8]();
}

uint64_t sub_23697A47C()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_23697A48C()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_23697A49C()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_23697A4AC()
{
  return MEMORY[0x270F2F818]();
}

uint64_t sub_23697A4BC()
{
  return MEMORY[0x270F7EC08]();
}

uint64_t sub_23697A4CC()
{
  return MEMORY[0x270F7EC48]();
}

uint64_t sub_23697A4DC()
{
  return MEMORY[0x270F7EC50]();
}

uint64_t sub_23697A4EC()
{
  return MEMORY[0x270F7EE60]();
}

uint64_t sub_23697A4FC()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_23697A50C()
{
  return MEMORY[0x270F7EE90]();
}

uint64_t sub_23697A51C()
{
  return MEMORY[0x270F7EEB0]();
}

uint64_t sub_23697A52C()
{
  return MEMORY[0x270F7EEC8]();
}

uint64_t sub_23697A53C()
{
  return MEMORY[0x270F7EEE8]();
}

uint64_t sub_23697A54C()
{
  return MEMORY[0x270F7EF00]();
}

uint64_t sub_23697A55C()
{
  return MEMORY[0x270F7EF10]();
}

uint64_t sub_23697A56C()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_23697A58C()
{
  return MEMORY[0x270F2F840]();
}

uint64_t sub_23697A59C()
{
  return MEMORY[0x270F2F848]();
}

uint64_t sub_23697A5AC()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_23697A5BC()
{
  return MEMORY[0x270F2F950]();
}

uint64_t sub_23697A5CC()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_23697A5DC()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_23697A5EC()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_23697A5FC()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_23697A60C()
{
  return MEMORY[0x270F7F2C8]();
}

uint64_t sub_23697A61C()
{
  return MEMORY[0x270F2FDE0]();
}

uint64_t sub_23697A62C()
{
  return MEMORY[0x270F2FDF8]();
}

uint64_t sub_23697A63C()
{
  return MEMORY[0x270FA2A88]();
}

uint64_t sub_23697A64C()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_23697A65C()
{
  return MEMORY[0x270F2EE10]();
}

uint64_t sub_23697A66C()
{
  return MEMORY[0x270F2EE20]();
}

uint64_t sub_23697A67C()
{
  return MEMORY[0x270F2EE30]();
}

uint64_t sub_23697A68C()
{
  return MEMORY[0x270F2EE48]();
}

uint64_t sub_23697A6BC()
{
  return MEMORY[0x270F41E08]();
}

uint64_t sub_23697A6CC()
{
  return MEMORY[0x270F41E10]();
}

uint64_t sub_23697A6DC()
{
  return MEMORY[0x270F449F0]();
}

uint64_t sub_23697A6EC()
{
  return MEMORY[0x270F44A00]();
}

uint64_t sub_23697A6FC()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_23697A70C()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_23697A71C()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_23697A72C()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_23697A75C()
{
  return MEMORY[0x270F44B00]();
}

uint64_t sub_23697A76C()
{
  return MEMORY[0x270F44B08]();
}

uint64_t sub_23697A77C()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_23697A78C()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_23697A79C()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_23697A7AC()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_23697A7BC()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_23697A7CC()
{
  return MEMORY[0x270F44B60]();
}

uint64_t sub_23697A7DC()
{
  return MEMORY[0x270F44B70]();
}

uint64_t sub_23697A7EC()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_23697A7FC()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_23697A80C()
{
  return MEMORY[0x270F44BA8]();
}

uint64_t sub_23697A81C()
{
  return MEMORY[0x270F44BB0]();
}

uint64_t sub_23697A82C()
{
  return MEMORY[0x270F44BB8]();
}

uint64_t sub_23697A83C()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_23697A84C()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_23697A85C()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_23697A86C()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_23697A87C()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_23697A88C()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_23697A89C()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_23697A8AC()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_23697A8BC()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_23697A8DC()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_23697A8FC()
{
  return MEMORY[0x270F44D08]();
}

uint64_t sub_23697A90C()
{
  return MEMORY[0x270F44D28]();
}

uint64_t sub_23697A91C()
{
  return MEMORY[0x270F44D38]();
}

uint64_t sub_23697A92C()
{
  return MEMORY[0x270F44D40]();
}

uint64_t sub_23697A93C()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_23697A94C()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_23697A95C()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_23697A96C()
{
  return MEMORY[0x270F44DA0]();
}

uint64_t sub_23697A97C()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_23697A98C()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_23697A99C()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_23697A9AC()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_23697A9BC()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_23697A9CC()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_23697A9DC()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_23697A9EC()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_23697A9FC()
{
  return MEMORY[0x270F57850]();
}

uint64_t sub_23697AA0C()
{
  return MEMORY[0x270F57858]();
}

uint64_t sub_23697AA1C()
{
  return MEMORY[0x270F57860]();
}

uint64_t sub_23697AA2C()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_23697AA3C()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_23697AA4C()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_23697AA5C()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_23697AA6C()
{
  return MEMORY[0x270FA18D0]();
}

uint64_t sub_23697AA7C()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_23697AA8C()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_23697AA9C()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_23697AAAC()
{
  return MEMORY[0x270F7DE50]();
}

uint64_t sub_23697AABC()
{
  return MEMORY[0x270F7DE88]();
}

uint64_t sub_23697AACC()
{
  return MEMORY[0x270F2FED0]();
}

uint64_t sub_23697AADC()
{
  return MEMORY[0x270F2FEF8]();
}

uint64_t sub_23697AAEC()
{
  return MEMORY[0x270F26BE0]();
}

uint64_t sub_23697AAFC()
{
  return MEMORY[0x270F26BE8]();
}

uint64_t sub_23697AB0C()
{
  return MEMORY[0x270F26BF0]();
}

uint64_t sub_23697AB1C()
{
  return MEMORY[0x270F26BF8]();
}

uint64_t sub_23697AB2C()
{
  return MEMORY[0x270F26C00]();
}

uint64_t sub_23697AB3C()
{
  return MEMORY[0x270F26C08]();
}

uint64_t sub_23697AB4C()
{
  return MEMORY[0x270F26C10]();
}

uint64_t sub_23697AB5C()
{
  return MEMORY[0x270F26C18]();
}

uint64_t sub_23697AB6C()
{
  return MEMORY[0x270F26C20]();
}

uint64_t sub_23697AB7C()
{
  return MEMORY[0x270F26C28]();
}

uint64_t sub_23697AB8C()
{
  return MEMORY[0x270F26C30]();
}

uint64_t sub_23697AB9C()
{
  return MEMORY[0x270F2F1F0]();
}

uint64_t sub_23697ABAC()
{
  return MEMORY[0x270F2F200]();
}

uint64_t sub_23697ABCC()
{
  return MEMORY[0x270F2F2D0]();
}

uint64_t sub_23697ABDC()
{
  return MEMORY[0x270F2F2E0]();
}

uint64_t sub_23697ABEC()
{
  return MEMORY[0x270F2F440]();
}

uint64_t sub_23697ABFC()
{
  return MEMORY[0x270F2F448]();
}

uint64_t sub_23697AC0C()
{
  return MEMORY[0x270F2F450]();
}

uint64_t sub_23697AC1C()
{
  return MEMORY[0x270F2F458]();
}

uint64_t sub_23697AC2C()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_23697AC3C()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_23697AC4C()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_23697AC5C()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_23697AC6C()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_23697AC7C()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_23697AC8C()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_23697AC9C()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_23697ACAC()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_23697ACBC()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_23697ACCC()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_23697ACDC()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23697ACEC()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23697ACFC()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_23697AD0C()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23697AD1C()
{
  return MEMORY[0x270EE7530]();
}

uint64_t sub_23697AD2C()
{
  return MEMORY[0x270EE7540]();
}

uint64_t sub_23697AD3C()
{
  return MEMORY[0x270EE7588]();
}

uint64_t sub_23697AD4C()
{
  return MEMORY[0x270EE7650]();
}

uint64_t sub_23697AD5C()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23697AD6C()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_23697AD7C()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23697AD8C()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23697AD9C()
{
  return MEMORY[0x270F58050]();
}

uint64_t sub_23697ADAC()
{
  return MEMORY[0x270F58060]();
}

uint64_t sub_23697ADBC()
{
  return MEMORY[0x270F58128]();
}

uint64_t sub_23697ADCC()
{
  return MEMORY[0x270F58130]();
}

uint64_t sub_23697ADDC()
{
  return MEMORY[0x270F582E8]();
}

uint64_t sub_23697ADEC()
{
  return MEMORY[0x270F30050]();
}

uint64_t sub_23697ADFC()
{
  return MEMORY[0x270F2F510]();
}

uint64_t sub_23697AE3C()
{
  return MEMORY[0x270F2EEF8]();
}

uint64_t sub_23697AE5C()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23697AE6C()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_23697AE7C()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23697AE8C()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_23697AE9C()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_23697AEAC()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23697AEBC()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_23697AECC()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_23697AEDC()
{
  return MEMORY[0x270FA2B80]();
}

uint64_t sub_23697AEEC()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_23697AEFC()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_23697AF0C()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23697AF1C()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_23697AF2C()
{
  return MEMORY[0x270EF18A8]();
}

uint64_t sub_23697AF3C()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23697AF4C()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23697AF5C()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23697AF6C()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23697AF7C()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_23697AF8C()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_23697AF9C()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23697AFAC()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_23697AFBC()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_23697AFCC()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_23697AFDC()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23697AFEC()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_23697AFFC()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_23697B00C()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_23697B01C()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_23697B02C()
{
  return MEMORY[0x270F7DEC0]();
}

uint64_t sub_23697B03C()
{
  return MEMORY[0x270F7DF28]();
}

uint64_t sub_23697B04C()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23697B06C()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23697B07C()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_23697B08C()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_23697B09C()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23697B0AC()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_23697B0BC()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_23697B0CC()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23697B0DC()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_23697B0EC()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_23697B10C()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_23697B11C()
{
  return MEMORY[0x270F9D818]();
}

uint64_t sub_23697B12C()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_23697B13C()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_23697B14C()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_23697B15C()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_23697B16C()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_23697B17C()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_23697B18C()
{
  return MEMORY[0x270F9D8B8]();
}

uint64_t sub_23697B19C()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_23697B1AC()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_23697B1BC()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23697B1CC()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23697B1DC()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23697B1EC()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_23697B1FC()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23697B20C()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23697B21C()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23697B22C()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23697B23C()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_23697B24C()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23697B25C()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23697B26C()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23697B27C()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23697B28C()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_23697B29C()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_23697B2AC()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_23697B2BC()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_23697B2CC()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_23697B2DC()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23697B2EC()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_23697B2FC()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_23697B30C()
{
  return MEMORY[0x270FA10B8]();
}

uint64_t sub_23697B31C()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_23697B32C()
{
  return MEMORY[0x270EF1DD8]();
}

uint64_t sub_23697B33C()
{
  return MEMORY[0x270EF1DF0]();
}

uint64_t sub_23697B34C()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23697B35C()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23697B36C()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23697B37C()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23697B38C()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23697B39C()
{
  return MEMORY[0x270EE7920]();
}

uint64_t sub_23697B3AC()
{
  return MEMORY[0x270EE7928]();
}

uint64_t sub_23697B3BC()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_23697B3CC()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_23697B3DC()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23697B3EC()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23697B3FC()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_23697B40C()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_23697B41C()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_23697B42C()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_23697B43C()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_23697B44C()
{
  return MEMORY[0x270FA10F0]();
}

uint64_t sub_23697B46C()
{
  return MEMORY[0x270FA10F8]();
}

uint64_t sub_23697B47C()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_23697B48C()
{
  return MEMORY[0x270FA1108]();
}

uint64_t sub_23697B49C()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_23697B4AC()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_23697B4BC()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23697B4CC()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_23697B4DC()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_23697B4EC()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23697B4FC()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_23697B50C()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23697B51C()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23697B52C()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_23697B53C()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_23697B54C()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_23697B55C()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23697B56C()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_23697B58C()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_23697B59C()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_23697B5AC()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_23697B5BC()
{
  return MEMORY[0x270FA2C00]();
}

uint64_t sub_23697B5CC()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_23697B5DC()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23697B5FC()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23697B60C()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_23697B61C()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_23697B62C()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_23697B63C()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_23697B64C()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23697B65C()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23697B66C()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23697B67C()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_23697B68C()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_23697B69C()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23697B6AC()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23697B6BC()
{
  return MEMORY[0x270F2F550]();
}

uint64_t sub_23697B6DC()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_23697B6EC()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23697B6FC()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23697B70C()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23697B71C()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_23697B72C()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23697B73C()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23697B74C()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23697B75C()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23697B76C()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23697B77C()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23697B78C()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_23697B79C()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_23697B7AC()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_23697B7BC()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23697B7CC()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23697B7DC()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t sub_23697B7EC()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_23697B7FC()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23697B80C()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_23697B81C()
{
  return MEMORY[0x270F9F090]();
}

uint64_t sub_23697B82C()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23697B83C()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23697B84C()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23697B85C()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23697B87C()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23697B88C()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_23697B89C()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_23697B8AC()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23697B8DC()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23697B90C()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_23697B91C()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23697B92C()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23697B94C()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_23697B95C()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23697B96C()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_23697B97C()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_23697B98C()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_23697B99C()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23697B9AC()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23697B9BC()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_23697B9CC()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23697B9DC()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23697B9EC()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23697B9FC()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23697BA0C()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_23697BA1C()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_23697BA2C()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23697BA3C()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23697BA4C()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23697BA5C()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_23697BA6C()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23697BA7C()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_23697BAAC()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x270EE5360](url, key, propertyValueTypeRefPtr, error);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B98](url);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6BF8](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

uint64_t CGPDFPageCopyString()
{
  return MEMORY[0x270EE6D60]();
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x270F82BA0](string);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectFromString(NSString *string)
{
  MEMORY[0x270F82BA8](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x270F474B0]();
}

uint64_t MRLNeuralNetworkClear()
{
  return MEMORY[0x270F4C460]();
}

uint64_t MRLNeuralNetworkCreate()
{
  return MEMORY[0x270F4C470]();
}

uint64_t MRLNeuralNetworkGetOutput()
{
  return MEMORY[0x270F4C478]();
}

uint64_t MRLNeuralNetworkPredict()
{
  return MEMORY[0x270F4C488]();
}

uint64_t MRLNeuralNetworkSetInputTensor()
{
  return MEMORY[0x270F4C498]();
}

uint64_t MRLNeuralNetworkTensorAppendData()
{
  return MEMORY[0x270F4C4A0]();
}

uint64_t MRLNeuralNetworkTensorCreate()
{
  return MEMORY[0x270F4C4A8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _PASCollapseWhitespaceAndStrip()
{
  return MEMORY[0x270F57F68]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  double v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  double v1 = (const std::string_view::value_type *)MEMORY[0x270F98298](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986F0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98788]();
}

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

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x270F98838](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x270F98848](this);
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

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p, std::align_val_t a2)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _exit(int a1)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_sdot_NEWLAPACK()
{
  return MEMORY[0x270EDE428]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double expm1(long double __x)
{
  MEMORY[0x270ED9878](__x);
  return result;
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log1pf(float a1)
{
  MEMORY[0x270EDA0C8](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x270EDA848](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x270F9B600](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x270F9B870](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x270F9B878](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x270EDBE30]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}