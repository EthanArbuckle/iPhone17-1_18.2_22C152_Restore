void sub_10007EE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10007EEC0(uint64_t result, int a2, int a3, uint64_t *a4)
{
  uint64_t v7 = result;
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2277);
    v8 = sub_100051E74(v14, "CHECK failed: (start) >= (0): ");
    sub_100051FB0((uint64_t)&v13, (const char **)&v8->__r_.__value_.__l.__data_);
    result = sub_100051FB8((uint64_t)v14);
    if ((a3 & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((a3 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  sub_100051E5C((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2278);
  v9 = sub_100051E74(v14, "CHECK failed: (num) >= (0): ");
  sub_100051FB0((uint64_t)&v13, (const char **)&v9->__r_.__value_.__l.__data_);
  result = sub_100051FB8((uint64_t)v14);
LABEL_6:
  if (a3 + a2 > *(_DWORD *)(v7 + 8))
  {
    sub_100051E5C((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2279);
    v10 = sub_100051E74(v14, "CHECK failed: (start + num) <= (size()): ");
    sub_100051FB0((uint64_t)&v13, (const char **)&v10->__r_.__value_.__l.__data_);
    result = sub_100051FB8((uint64_t)v14);
  }
  if (a3 >= 1)
  {
    if (a4)
    {
      uint64_t v11 = a3;
      int v12 = a2;
      do
      {
        *a4++ = sub_10006465C(v7, v12++);
        --v11;
      }
      while (v11);
    }
    return sub_10007F040(v7, a2, a3);
  }
  return result;
}

void sub_10007F018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F040(uint64_t result, int a2, int a3)
{
  v3 = *(int **)(result + 16);
  if (v3)
  {
    LODWORD(v4) = a3 + a2;
    LODWORD(v5) = *v3;
    if (a3 + a2 < *v3)
    {
      uint64_t v4 = (int)v4;
      do
      {
        *(void *)((char *)&v3[2 * v4] + 8 - 8 * a3) = *(void *)&v3[2 * v4 + 2];
        ++v4;
        v3 = *(int **)(result + 16);
        uint64_t v5 = *v3;
      }
      while (v4 < v5);
    }
    *(_DWORD *)(result + 8) -= a3;
    int *v3 = v5 - a3;
  }
  return result;
}

uint64_t sub_10007F09C(uint64_t a1)
{
  v1 = *(_DWORD **)(a1 + 16);
  if (v1) {
    return (*v1 - *(_DWORD *)(a1 + 8));
  }
  else {
    return 0;
  }
}

void *sub_10007F0C0(void *result, uint64_t a2)
{
  v3 = result;
  if (*result)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2059);
    uint64_t v4 = sub_100051E74(v11, "CHECK failed: GetArena() == NULL: ");
    uint64_t v5 = sub_100051E74(v4, "AddCleared() can only be used on a RepeatedPtrField not on an arena.");
    sub_100051FB0((uint64_t)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
    result = (void *)sub_100051FB8((uint64_t)v11);
  }
  v6 = (int *)v3[2];
  if (v6)
  {
    int v7 = *v6;
    if (*v6 != *((_DWORD *)v3 + 3)) {
      goto LABEL_9;
    }
  }
  else
  {
    int v7 = *((_DWORD *)v3 + 3);
  }
  int v8 = *((_DWORD *)v3 + 2);
  if (v8 <= v7)
  {
    result = (void *)sub_10007F4D8(v3, v7 - v8 + 1);
    v6 = (int *)v3[2];
  }
LABEL_9:
  uint64_t v9 = *v6;
  int *v6 = v9 + 1;
  *(void *)&v6[2 * v9 + 2] = a2;
  return result;
}

void sub_10007F190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F1AC(uint64_t a1)
{
  if (*(void *)a1)
  {
    sub_100051E5C((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2071);
    v2 = sub_100051E74(v13, "CHECK failed: GetArena() == NULL: ");
    v3 = sub_100051E74(v2, "ReleaseCleared() can only be used on a RepeatedPtrField not on ");
    uint64_t v4 = sub_100051E74(v3, "an arena.");
    sub_100051FB0((uint64_t)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v13);
    if (*(void *)a1)
    {
      sub_100051E5C((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2074);
      uint64_t v5 = sub_100051E74(v13, "CHECK failed: GetArena() == NULL: ");
      sub_100051FB0((uint64_t)&v12, (const char **)&v5->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v13);
    }
  }
  v6 = *(int **)(a1 + 16);
  if (!v6)
  {
    sub_100051E5C((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2075);
    int v7 = sub_100051E74(v13, "CHECK failed: rep_ != NULL: ");
    sub_100051FB0((uint64_t)&v12, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v13);
    v6 = *(int **)(a1 + 16);
  }
  int v8 = *v6;
  if (*v6 <= *(_DWORD *)(a1 + 8))
  {
    sub_100051E5C((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2076);
    uint64_t v9 = sub_100051E74(v13, "CHECK failed: (rep_->allocated_size) > (current_size_): ");
    sub_100051FB0((uint64_t)&v12, (const char **)&v9->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v13);
    v6 = *(int **)(a1 + 16);
    int v8 = *v6;
  }
  uint64_t v10 = v8 - 1;
  int *v6 = v10;
  return *(void *)&v6[2 * v10 + 2];
}

void sub_10007F324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F354(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3) {
    uint64_t v4 = v3 + 8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = a2 - v4;
  sub_10007E64C(a1, (unint64_t)(a2 - v4) >> 3, ((unint64_t)(a2 - v4 + 8) >> 3) - ((unint64_t)(a2 - v4) >> 3));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    uint64_t v7 = v6 + 8;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7 + (v5 << 29 >> 29);
}

uint64_t sub_10007F3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4) {
    uint64_t v5 = v4 + 8;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = a2 - v5;
  sub_10007E64C(a1, (unint64_t)(a2 - v5) >> 3, ((unint64_t)(a3 - v5) >> 3) - ((unint64_t)(a2 - v5) >> 3));
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7) {
    uint64_t v8 = v7 + 8;
  }
  else {
    uint64_t v8 = 0;
  }
  return v8 + (v6 << 29 >> 29);
}

uint64_t sub_10007F414(void *a1, int a2, int a3, uint64_t *a4)
{
  if (*a1)
  {
    sub_100051E5C((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2268);
    uint64_t v8 = sub_100051E74(v13, "CHECK failed: GetArena() == NULL: ");
    uint64_t v9 = sub_100051E74(v8, "ExtractSubrange() when arena is non-NULL is only supported when ");
    uint64_t v10 = sub_100051E74(v9, "the Element type supplies a MergeFrom() operation to make copies.");
    sub_100051FB0((uint64_t)&v12, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v13);
  }
  return sub_10007EEC0((uint64_t)a1, a2, a3, a4);
}

void sub_10007F4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F4D8(uint64_t *a1, int a2)
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
      char v12 = (unsigned int *)sub_10004E520(v7, v11);
      }
    }
    else
    {
      char v12 = (unsigned int *)operator new(v10 + 8);
    }
    a1[2] = (uint64_t)v12;
    *((_DWORD *)a1 + 3) = v9;
    if (v5 && (uint64_t v13 = *v5, (int)v13 >= 1))
    {
      memcpy(v12 + 2, v5 + 2, 8 * v13);
      char v12 = (unsigned int *)a1[2];
      *char v12 = *v5;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      *char v12 = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        char v12 = (unsigned int *)a1[2];
      }
    }
    int v2 = *((_DWORD *)a1 + 2);
    uint64_t v5 = v12;
  }
  return (uint64_t)&v5[2 * v2 + 2];
}

void *sub_10007F604(void *a1, uint64_t a2)
{
  int v4 = (int *)a1[2];
  if (!v4)
  {
    int v5 = *((_DWORD *)a1 + 2);
    int v6 = *((_DWORD *)a1 + 3);
LABEL_6:
    if (v5 <= v6)
    {
      sub_10007F4D8(a1, v6 - v5 + 1);
      int v4 = (int *)a1[2];
    }
    goto LABEL_8;
  }
  int v5 = *((_DWORD *)a1 + 2);
  int v6 = *v4;
  if (v5 < *v4)
  {
    *((_DWORD *)a1 + 2) = v5 + 1;
    return *(void **)&v4[2 * v5 + 2];
  }
  if (v6 == *((_DWORD *)a1 + 3)) {
    goto LABEL_6;
  }
LABEL_8:
  ++*v4;
  uint64_t v8 = *a1;
  if (a2)
  {
    result = (void *)(*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 32))(a2, *a1);
  }
  else
  {
    if (!v8) {
      operator new();
    }
    if (*(unsigned char *)(v8 + 24)) {
    result = (void *)sub_10004DFA4((void *)v8, 0x28uLL, (uint64_t)sub_10006C838);
    }
    void *result = off_1000AE3F0;
    result[1] = v8;
    result[4] = 0;
    result[2] = 0;
    result[3] = 0;
  }
  uint64_t v9 = a1[2];
  uint64_t v10 = *((int *)a1 + 2);
  *((_DWORD *)a1 + 2) = v10 + 1;
  *(void *)(v9 + 8 * v10 + 8) = result;
  return result;
}

uint64_t *sub_10007F7B8(void *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a2 == *a1)
  {
    sub_100051E5C((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1685);
    int v5 = sub_100051E74(v8, "CHECK failed: other->GetArena() != GetArena(): ");
    sub_100051FB0((uint64_t)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v8);
    unint64_t v4 = *a2;
  }
  v8[0].__r_.__value_.__r.__words[2] = 0;
  *(_OWORD *)&v8[0].__r_.__value_.__l.__data_ = v4;
  sub_100048C9C((uint64_t)v8, (uint64_t)a1);
  sub_100048998((uint64_t)a1);
  sub_100048C9C((uint64_t)a1, (uint64_t)a2);
  sub_10003D900(a2, (uint64_t)v8);
  sub_10007DE88(v8);
  return sub_10003D660((uint64_t *)v8);
}

void sub_10007F878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F8A0(uint64_t result, uint64_t a2)
{
  if (*(void *)result) {
    return sub_10007F900(result, a2, 0, *(void *)result);
  }
  int v2 = *(int **)(result + 16);
  if (!v2) {
    return sub_10007F900(result, a2, 0, *(void *)result);
  }
  uint64_t v3 = *v2;
  if ((int)v3 >= *(_DWORD *)(result + 12)) {
    return sub_10007F900(result, a2, 0, *(void *)result);
  }
  unint64_t v4 = v2 + 2;
  uint64_t v5 = *(int *)(result + 8);
  if ((int)v5 < (int)v3) {
    *(void *)&v4[2 * v3] = *(void *)&v4[2 * v5];
  }
  *(void *)&v4[2 * v5] = a2;
  *(_DWORD *)(result + 8) = v5 + 1;
  ++**(_DWORD **)(result + 16);
  return result;
}

uint64_t sub_10007F900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3 && a4)
  {
    sub_10007FA34((uint64_t *)a4, a2);
LABEL_9:
    uint64_t v8 = (std::string *)a2;
    goto LABEL_15;
  }
  if (a4 == a3) {
    goto LABEL_9;
  }
  if (!a4) {
    operator new();
  }
  if (*(unsigned char *)(a4 + 24)) {
  uint64_t v8 = (std::string *)sub_10004DFA4((void *)a4, 0x18uLL, (uint64_t)sub_100048840);
  }
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  std::string::operator=(v8, (const std::string *)a2);
  if (!a3)
  {
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    operator delete();
  }
LABEL_15:
  return sub_10007EB18(a1, (uint64_t)v8);
}

uint64_t *sub_10007FA34(uint64_t *result, uint64_t a2)
{
  if (a2) {
    return sub_10004E108(result, a2, (uint64_t)sub_10007FA50);
  }
  return result;
}

uint64_t sub_10007FA50(uint64_t result)
{
  if (result)
  {
    if (*(char *)(result + 23) < 0) {
      operator delete(*(void **)result);
    }
    operator delete();
  }
  return result;
}

uint64_t sub_10007FAAC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= 0)
  {
    sub_100051E5C((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2040);
    uint64_t v3 = sub_100051E74(v14, "CHECK failed: (current_size_) > (0): ");
    sub_100051FB0((uint64_t)&v13, (const char **)&v3->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v14);
    int v2 = *(_DWORD *)(a1 + 8);
  }
  unint64_t v4 = *(int **)(a1 + 16);
  uint64_t v5 = v2 - 1;
  *(_DWORD *)(a1 + 8) = v5;
  int v6 = &v4[2 * v5];
  uint64_t v9 = *((void *)v6 + 1);
  char v7 = v6 + 2;
  uint64_t v8 = v9;
  int v10 = *v4;
  int v11 = *v4 - 1;
  *unint64_t v4 = v11;
  if (v2 < v10) {
    *char v7 = *(void *)&v4[2 * v11 + 2];
  }
  if (*(void *)a1) {
    operator new();
  }
  return v8;
}

void sub_10007FB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10007FBAC(uint64_t result)
{
  *(_DWORD *)result = 0;
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  *(void *)(result + 8) = 0;
  return result;
}

uint64_t sub_10007FBBC(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  v9[0] = a3;
  v9[1] = a4;
  *(_DWORD *)a1 = a2;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = a1 + 8;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  if (a2)
  {
    sub_1000520F8((uint64_t)v9, &v7);
    if (*(char *)(a1 + 31) < 0) {
      operator delete(*(void **)v5);
    }
    *(_OWORD *)uint64_t v5 = v7;
    *(void *)(v5 + 16) = v8;
  }
  return a1;
}

void sub_10007FC34(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *sub_10007FC54(_DWORD *a1, uint64_t a2)
{
  *a1 = *(_DWORD *)a2;
  uint64_t v3 = a1 + 2;
  if (*(char *)(a2 + 31) < 0)
  {
    sub_1000302DC(v3, *(void **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    *((void *)v3 + 2) = *(void *)(a2 + 24);
    *(_OWORD *)uint64_t v3 = v4;
  }
  return a1;
}

uint64_t sub_10007FCAC(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  std::string::operator=((std::string *)(a1 + 8), (const std::string *)(a2 + 8));
  return a1;
}

uint64_t sub_10007FCDC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return 0;
  }
  uint64_t v2 = *(unsigned __int8 *)(a1 + 31);
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 31);
  }
  else {
    uint64_t v3 = *(void *)(a1 + 16);
  }
  uint64_t v4 = *(unsigned __int8 *)(a2 + 31);
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a2 + 16);
  }
  if (v3 != v4) {
    return 0;
  }
  int v6 = (const void **)(a1 + 8);
  uint64_t v9 = *(unsigned __int8 **)(a2 + 8);
  long long v7 = (unsigned __int8 *)(a2 + 8);
  uint64_t v8 = v9;
  if (v5 < 0) {
    long long v7 = v8;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*v6, v7, *(void *)(a1 + 16)) == 0;
  }
  if (!*(unsigned char *)(a1 + 31)) {
    return 1;
  }
  uint64_t v10 = v2 - 1;
  do
  {
    int v12 = *(unsigned __int8 *)v6;
    int v6 = (const void **)((char *)v6 + 1);
    int v11 = v12;
    int v14 = *v7++;
    int v13 = v14;
    BOOL v16 = v10-- != 0;
    uint64_t result = v11 == v13;
  }
  while (v11 == v13 && v16);
  return result;
}

void sub_10007FD90(uint64_t a1@<X0>, void *a2@<X8>)
{
  unsigned int v3 = *(_DWORD *)a1;
  if (*(_DWORD *)a1)
  {
    if (*(char *)(a1 + 31) < 0) {
      uint64_t v5 = *(void *)(a1 + 16);
    }
    else {
      uint64_t v5 = *(unsigned __int8 *)(a1 + 31);
    }
    if (v5)
    {
      if (v3 > 0x10) {
        long long v7 = "UNKNOWN";
      }
      else {
        long long v7 = off_1000AE570[v3 - 1];
      }
      sub_10000A1B4(&v15, v7);
      uint64_t v8 = std::string::append(&v15, ":");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v16.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      int v10 = *(char *)(a1 + 31);
      if (v10 >= 0) {
        int v11 = (const std::string::value_type *)(a1 + 8);
      }
      else {
        int v11 = *(const std::string::value_type **)(a1 + 8);
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(a1 + 31);
      }
      else {
        std::string::size_type v12 = *(void *)(a1 + 16);
      }
      int v13 = std::string::append(&v16, v11, v12);
      long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      a2[2] = *((void *)&v13->__r_.__value_.__l + 2);
      *(_OWORD *)a2 = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v16.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
      return;
    }
    if (v3 > 0x10) {
      int v6 = "UNKNOWN";
    }
    else {
      int v6 = off_1000AE570[v3 - 1];
    }
  }
  else
  {
    int v6 = "OK";
  }
  sub_10000A1B4(a2, v6);
}

void sub_10007FEDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10007FF10(void *a1, uint64_t a2)
{
  sub_10007FD90(a2, __p);
  if ((v7 & 0x80u) == 0) {
    unsigned int v3 = __p;
  }
  else {
    unsigned int v3 = (void **)__p[0];
  }
  if ((v7 & 0x80u) == 0) {
    uint64_t v4 = v7;
  }
  else {
    uint64_t v4 = (uint64_t)__p[1];
  }
  sub_100018688(a1, (uint64_t)v3, v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_10007FF7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_10007FF98(std::string *a1, char *__format, va_list a3)
{
  uint64_t result = (std::string *)vsnprintf(__str, 0x400uLL, __format, a3);
  if ((int)result > 1023) {
    operator new[]();
  }
  if ((result & 0x80000000) == 0) {
    return std::string::append(a1, __str, result);
  }
  return result;
}

std::string *sub_1000800A4@<X0>(char *__format@<X0>, std::string *a2@<X8>, ...)
{
  va_start(va, a2);
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return sub_10007FF98(a2, __format, va);
}

void sub_1000800EC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100080108(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(char *)(a1 + 23) < 0)
  {
    **(unsigned char **)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a1 = 0;
    *(unsigned char *)(a1 + 23) = 0;
  }
  sub_10007FF98((std::string *)a1, a2, &a9);
  return a1;
}

std::string *sub_100080168(std::string *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_10007FF98(a1, a2, &a9);
}

std::string *sub_100080194@<X0>(char *__format@<X0>, uint64_t **a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v5 = *a2;
  int v6 = a2[1];
  unint64_t v7 = ((char *)v6 - (char *)*a2) / 24;
  if (v7 >= 0x21)
  {
    sub_100051E5C((uint64_t)&v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringprintf.cc", 149);
    long long v9 = sub_100051E74((std::string *)&v19, "CHECK failed: (v.size()) <= (kStringPrintfVectorMaxArgs): ");
    int v10 = sub_100051E74(v9, "StringPrintfVector currently only supports up to ");
    int v11 = sub_1000523B8(v10, 32);
    std::string::size_type v12 = sub_100051E74(v11, " arguments. ");
    int v13 = sub_100051E74(v12, "Feel free to add support for more if you need it.");
    sub_100051FB0((uint64_t)&v18, (const char **)&v13->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)&v19);
    uint64_t v5 = *a2;
    int v6 = a2[1];
    unint64_t v7 = ((char *)v6 - (char *)*a2) / 24;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (v6 != v5)
  {
    if (v7 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v7;
    }
    std::string v15 = &v19;
    do
    {
      std::string v16 = v5;
      if (*((char *)v5 + 23) < 0) {
        std::string v16 = (uint64_t *)*v5;
      }
      *(void *)std::string v15 = v16;
      std::string v15 = (long long *)((char *)v15 + 8);
      v5 += 3;
      --v14;
    }
    while (v14);
  }
  if ((v7 & 0xFFFFFFE0) == 0) {
    memset_pattern16((char *)&v19 + ((8 * v7) & 0x7FFFFFFF8), &off_1000AE5F0, ((248 - 8 * v7) & 0x7FFFFFFF8) + 8);
  }
  return sub_1000800A4(__format, a3, v19, v20, v21, v22, v23, v24, v25, v26, (void)v27, *((void *)&v27 + 1), (void)v28, *((void *)&v28 + 1), (void)v29, *((void *)&v29 + 1), (void)v30, *((void *)&v30 + 1), (void)v31,
           *((void *)&v31 + 1),
           (void)v32,
           *((void *)&v32 + 1),
           (void)v33,
           *((void *)&v33 + 1),
           (void)v34,
           *((void *)&v34 + 1));
}

void sub_10008038C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t sub_1000803AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000803D4(uint64_t a1, const std::string::value_type *a2)
{
  sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 49);
  uint64_t v4 = sub_100051E74(v10, "size too big: ");
  uint64_t v5 = sub_100052538(v4, a1);
  int v6 = sub_100051E74(v5, " details: ");
  unint64_t v7 = sub_100051E74(v6, a2);
  sub_100051FB0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
  return sub_100051FB8((uint64_t)v10);
}

void sub_100080458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_100080470(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a2 + a4;
  a1[1] = a3 - a4;
  if (a4 < 0)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 54);
    unint64_t v7 = sub_100051E74(v11, "CHECK failed: (0) <= (pos): ");
    sub_100051FB0((uint64_t)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v11);
  }
  if (a3 < a4)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 55);
    uint64_t v8 = sub_100051E74(v11, "CHECK failed: (pos) <= (x.length_): ");
    sub_100051FB0((uint64_t)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v11);
  }
  return a1;
}

void sub_10008053C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_100080560(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = a3 - a4;
  if (a3 - a4 >= a5) {
    uint64_t v9 = a5;
  }
  *a1 = a2 + a4;
  a1[1] = v9;
  if (a4 < 0)
  {
    sub_100051E5C((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 62);
    char v10 = sub_100051E74(v15, "CHECK failed: (0) <= (pos): ");
    sub_100051FB0((uint64_t)&v14, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v15);
  }
  if (a3 < a4)
  {
    sub_100051E5C((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 63);
    int v11 = sub_100051E74(v15, "CHECK failed: (pos) <= (x.length_): ");
    sub_100051FB0((uint64_t)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v15);
  }
  if (a5 < 0)
  {
    sub_100051E5C((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 64);
    std::string::size_type v12 = sub_100051E74(v15, "CHECK failed: (len) >= (0): ");
    sub_100051FB0((uint64_t)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v15);
  }
  return a1;
}

void sub_100080678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *sub_1000806A4(uint64_t a1, std::string *this)
{
  return std::string::assign(this, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
}

std::string *sub_1000806B4(uint64_t a1, std::string *this)
{
  return std::string::append(this, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
}

uint64_t sub_1000806C4(const void **a1, const void *a2, int64_t a3)
{
  unsigned int v3 = (char *)a1[1];
  uint64_t v4 = &v3[-a3];
  if ((uint64_t)v3 < a3) {
    return 0;
  }
  unint64_t v7 = (char *)*a1;
  if (memcmp(*a1, a2, a3)) {
    return 0;
  }
  *a1 = &v7[a3];
  a1[1] = v4;
  return 1;
}

uint64_t sub_100080720(void *a1, const void *a2, int64_t a3)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = v3 - a3;
  if (v3 < a3 || memcmp((const void *)(*a1 + v4), a2, a3)) {
    return 0;
  }
  a1[1] = v4;
  return 1;
}

size_t sub_10008076C(void *a1, void *__dst, size_t a3, uint64_t a4)
{
  if (a1[1] - a4 >= a3) {
    size_t v4 = a3;
  }
  else {
    size_t v4 = a1[1] - a4;
  }
  memcpy(__dst, (const void *)(*a1 + a4), v4);
  return v4;
}

BOOL sub_1000807B0(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_1000807D4(a1, a2, a3, 0) != -1;
}

uint64_t sub_1000807D4(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[1];
  if (v4 >= 1 && v4 >= a4)
  {
    uint64_t v8 = sub_100080E8C((unsigned __int8 *)(*a1 + a4), *a1 + v4, a2, &a2[a3]);
    if ((unsigned __int8 *)(*a1 + a1[1]) == v8) {
      return -1;
    }
    else {
      return (uint64_t)&v8[-*a1];
    }
  }
  else if (v4 | a4 | a3)
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_100080864(uint64_t *a1, int a2, unint64_t a3)
{
  uint64_t v3 = a1[1];
  if (v3 < 1 || v3 <= a3) {
    return -1;
  }
  uint64_t v6 = *a1;
  unint64_t v7 = memchr((void *)(*a1 + a3), a2, v3 - a3);
  if (v7) {
    return (uint64_t)v7 - v6;
  }
  else {
    return -1;
  }
}

uint64_t sub_1000808B8(unsigned __int8 **a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[1];
  unint64_t v5 = (unint64_t)&v4[-a3];
  if ((uint64_t)v4 < a3) {
    return -1;
  }
  if (a3)
  {
    unint64_t v7 = *a1;
    if (v5 >= a4) {
      unint64_t v5 = a4;
    }
    uint64_t v8 = &v7[a3 + v5];
    if (v7 == v8) {
      return -1;
    }
    uint64_t v9 = *a1;
    char v10 = v8;
    do
    {
      if (*v9 == *a2)
      {
        uint64_t v11 = 1;
        while (a3 != v11)
        {
          if (&v9[v11] == v8) {
            goto LABEL_17;
          }
          int v12 = v9[v11];
          int v13 = a2[v11++];
          if (v12 != v13) {
            goto LABEL_9;
          }
        }
        char v10 = v9;
      }
LABEL_9:
      ++v9;
    }
    while (v9 != v8);
LABEL_17:
    char v14 = (unsigned __int8 *)(v10 - v7);
    if (v10 == v8) {
      return -1;
    }
    else {
      return (uint64_t)v14;
    }
  }
  else if ((unint64_t)v4 >= a4)
  {
    return a4;
  }
  else
  {
    return (uint64_t)a1[1];
  }
}

uint64_t sub_10008096C(uint64_t *a1, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3 = a1[1];
  if (v3 < 1) {
    return -1;
  }
  if (v3 - 1 >= a3) {
    uint64_t result = a3;
  }
  else {
    uint64_t result = v3 - 1;
  }
  uint64_t v6 = *a1;
  while (*(unsigned __int8 *)(v6 + result) != a2)
  {
    if (result-- <= 0) {
      return -1;
    }
  }
  return result;
}

uint64_t sub_1000809B0(uint64_t *a1, unsigned __int8 *a2, uint64_t a3, int64_t a4)
{
  uint64_t v4 = a1[1];
  if (v4 < 1 || a3 < 1) {
    return -1;
  }
  if (a3 != 1)
  {
    memset(v9, 0, sizeof(v9));
    do
    {
      unsigned int v8 = *a2++;
      *((unsigned char *)v9 + v8) = 1;
      --a3;
    }
    while (a3);
    if (v4 > a4)
    {
      while (!*((unsigned char *)v9 + *(unsigned __int8 *)(*a1 + a4)))
      {
        if (v4 == ++a4) {
          return -1;
        }
      }
      return a4;
    }
    return -1;
  }
  int v6 = (char)*a2;
  return sub_100080864(a1, v6, a4);
}

uint64_t sub_100080AC4(void *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1[1];
  if (v4 < 1) {
    return -1;
  }
  if (a3 < 1) {
    return 0;
  }
  if (a3 != 1)
  {
    memset(v7, 0, sizeof(v7));
    do
    {
      unsigned int v5 = *a2++;
      *((unsigned char *)v7 + v5) = 1;
      --a3;
    }
    while (a3);
    if (v4 > a4)
    {
      while (*((unsigned char *)v7 + *(unsigned __int8 *)(*a1 + a4)))
      {
        if (v4 == ++a4) {
          return -1;
        }
      }
      return a4;
    }
    return -1;
  }
  if (v4 <= (unint64_t)a4) {
    return -1;
  }
  while (*(unsigned __int8 *)(*a1 + a4) == *a2)
  {
    if (v4 == ++a4) {
      return -1;
    }
  }
  return a4;
}

uint64_t sub_100080BCC(void *a1, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3 = a1[1];
  if (v3 < 1 || v3 <= a3) {
    return -1;
  }
  while (*(unsigned __int8 *)(*a1 + a3) == a2)
  {
    if (v3 == ++a3) {
      return -1;
    }
  }
  return a3;
}

uint64_t sub_100080C08(uint64_t *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[1];
  BOOL v6 = v4 < 1;
  unint64_t v5 = v4 - 1;
  BOOL v6 = v6 || a3 < 1;
  if (v6) {
    return -1;
  }
  if (a3 == 1)
  {
    if (v5 >= a4) {
      uint64_t result = a4;
    }
    else {
      uint64_t result = v5;
    }
    uint64_t v9 = *a1;
    while (*(unsigned __int8 *)(v9 + result) != *a2)
    {
      BOOL v6 = result-- < 1;
      if (v6) {
        return -1;
      }
    }
    return result;
  }
  memset(v12, 0, sizeof(v12));
  do
  {
    unsigned int v10 = *a2++;
    *((unsigned char *)v12 + v10) = 1;
    --a3;
  }
  while (a3);
  uint64_t result = v5 >= a4 ? a4 : v5;
  if (result < 0) {
    return -1;
  }
  uint64_t v11 = *a1;
  while (!*((unsigned char *)v12 + *(unsigned __int8 *)(v11 + result)))
  {
    BOOL v6 = result-- <= 0;
    if (v6) {
      return -1;
    }
  }
  return result;
}

uint64_t sub_100080D10(uint64_t *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[1];
  BOOL v5 = v4 < 1;
  unint64_t v6 = v4 - 1;
  if (v5) {
    return -1;
  }
  if (v6 >= a4) {
    uint64_t result = a4;
  }
  else {
    uint64_t result = v6;
  }
  if (a3 < 1) {
    return result;
  }
  if (a3 != 1)
  {
    memset(v12, 0, sizeof(v12));
    do
    {
      unsigned int v10 = *a2++;
      *((unsigned char *)v12 + v10) = 1;
      --a3;
    }
    while (a3);
    if ((result & 0x8000000000000000) == 0)
    {
      uint64_t v11 = *a1;
      while (*((unsigned char *)v12 + *(unsigned __int8 *)(v11 + result)))
      {
        BOOL v5 = result-- <= 0;
        if (v5) {
          return -1;
        }
      }
      return result;
    }
    return -1;
  }
  uint64_t v9 = *a1;
  while (*(unsigned __int8 *)(v9 + result) == *a2)
  {
    BOOL v5 = result-- < 1;
    if (v5) {
      return -1;
    }
  }
  return result;
}

uint64_t sub_100080E0C(uint64_t *a1, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3 = a1[1];
  if (v3 < 1) {
    return -1;
  }
  if (v3 - 1 >= a3) {
    uint64_t result = a3;
  }
  else {
    uint64_t result = v3 - 1;
  }
  uint64_t v6 = *a1;
  while (*(unsigned __int8 *)(v6 + result) == a2)
  {
    if (result-- <= 0) {
      return -1;
    }
  }
  return result;
}

unint64_t sub_100080E50(void *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a1[1];
  if (v3 >= a2) {
    unint64_t v4 = a2;
  }
  else {
    unint64_t v4 = a1[1];
  }
  unint64_t v5 = v3 - v4;
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  if ((v6 & 0x8000000000000000) != 0) {
    sub_10006FF3C();
  }
  return *a1 + v4;
}

unsigned __int8 *sub_100080E8C(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  int64_t v4 = a4 - a3;
  if (a4 == a3) {
    return a1;
  }
  uint64_t v5 = a2;
  if (a2 - (uint64_t)a1 >= v4)
  {
    uint64_t v6 = a2 - v4 + 1;
    if ((unsigned __int8 *)v6 != a1)
    {
      int v9 = *a3;
      unint64_t v7 = a3 + 1;
      int v8 = v9;
      while (*a1 != v8)
      {
LABEL_9:
        if (++a1 == (unsigned __int8 *)v6) {
          return (unsigned __int8 *)v5;
        }
      }
      unsigned int v10 = a1 + 1;
      uint64_t v11 = v7;
      while (v11 != a4)
      {
        int v13 = *v10++;
        int v12 = v13;
        int v14 = *v11++;
        if (v12 != v14) {
          goto LABEL_9;
        }
      }
      return a1;
    }
  }
  return (unsigned __int8 *)v5;
}

uint64_t sub_100080F20(unsigned int *a1, unsigned char *a2, int a3, _DWORD *a4)
{
  *a4 = 0;
  if (!a3) {
    return 241;
  }
  unint64_t v4 = (unint64_t)&a2[a3];
  if (a3 >= 7) {
    unint64_t v5 = v4 - 7;
  }
  else {
    unint64_t v5 = (unint64_t)a2;
  }
  uint64_t v6 = *((void *)a1 + 4) + *a1;
  uint64_t v7 = *((void *)a1 + 7);
  int v8 = a2;
  while (2)
  {
    uint64_t v9 = v8 & 7;
    if ((v8 & 7) != 0 && (unint64_t)v8 < v4)
    {
      char v10 = (_BYTE)v8 + 1;
      while (!*(unsigned char *)(v7 + *v8))
      {
        ++v8;
        uint64_t v9 = v10 & 7;
        if ((v10 & 7) != 0)
        {
          ++v10;
          if ((unint64_t)v8 < v4) {
            continue;
          }
        }
        goto LABEL_12;
      }
LABEL_20:
      uint64_t v11 = v8;
      goto LABEL_21;
    }
LABEL_12:
    if (v9 || (unint64_t)v8 >= v5) {
      goto LABEL_20;
    }
    uint64_t v11 = v8 + 4;
    while (1)
    {
      unint64_t v12 = *(v11 - 1);
      if ((((v12 - a1[6]) | (v12 + a1[7]) | (*v11 - a1[6]) | (*v11 + a1[7])) & 0x80808080) != 0) {
        break;
      }
LABEL_18:
      int v13 = v11 + 2;
      int v14 = v11 + 1;
      v11 += 2;
      if ((unint64_t)v14 >= v5)
      {
        uint64_t v11 = v13 - 1;
        goto LABEL_21;
      }
    }
    if (!(*(unsigned __int8 *)(v7 + BYTE1(v12)) | *(unsigned __int8 *)(v7 + v12) | *(unsigned __int8 *)(v7 + BYTE2(v12)) | *(unsigned __int8 *)(v7 + (v12 >> 24))))
    {
      if (*(unsigned __int8 *)(v7 + BYTE1(*v11)) | *(unsigned __int8 *)(v7 + *v11) | *(unsigned __int8 *)(v7 + BYTE2(*v11)) | *(unsigned __int8 *)(v7 + ((unint64_t)*v11 >> 24))) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    --v11;
LABEL_21:
    if ((unint64_t)v11 < v4)
    {
      unint64_t v15 = v4 - (void)v11;
      std::string v16 = (char *)v11 - 1;
      uint64_t v17 = *((void *)a1 + 4) + *a1;
      int v8 = v11;
      while (1)
      {
        uint64_t v18 = *(unsigned __int8 *)(v17 + *v8);
        if (v18 > 0xEF) {
          break;
        }
        ++v8;
        uint64_t v17 = v6 + (int)(v18 << a1[4]);
        ++v16;
        if (!--v15)
        {
          LODWORD(v8) = v4;
          goto LABEL_32;
        }
      }
      if (a1[1] <= (int)v17 - (int)v6)
      {
        do
        {
          int v8 = v16;
          if (v16 <= a2) {
            break;
          }
          --v16;
        }
        while ((*v8 & 0xC0) == 0x80);
      }
      if (v18 != 253) {
        goto LABEL_42;
      }
      continue;
    }
    break;
  }
  LODWORD(v8) = v11;
  LODWORD(v17) = a1[8] + *a1;
LABEL_32:
  if (a1[1] <= (int)v17 - (int)v6)
  {
    if ((unint64_t)v11 <= v4) {
      long long v19 = (_DWORD *)v4;
    }
    else {
      long long v19 = v11;
    }
    long long v20 = (char *)v19 - 1;
    do
    {
      int v8 = v20;
      if (v20 <= a2) {
        break;
      }
      --v20;
    }
    while ((*v8 & 0xC0) == 0x80);
    uint64_t v18 = 240;
  }
  else
  {
    uint64_t v18 = 241;
  }
LABEL_42:
  *a4 = v8 - a2;
  return v18;
}

uint64_t sub_100081144(unsigned int *a1, char *a2, int a3, _DWORD *a4)
{
  *a4 = 0;
  if (!a3) {
    return 241;
  }
  int v8 = &a2[a3];
  if (a3 >= 7) {
    unint64_t v9 = (unint64_t)(v8 - 7);
  }
  else {
    unint64_t v9 = (unint64_t)a2;
  }
  int v15 = 0;
  char v10 = a2;
  do
  {
    uint64_t v11 = v10 & 7;
    if ((v10 & 7) != 0 && v10 < v8)
    {
      char v12 = (_BYTE)v10 + 1;
      while ((*v10 & 0x80000000) == 0)
      {
        ++v10;
        uint64_t v11 = v12 & 7;
        if ((v12 & 7) != 0)
        {
          ++v12;
          if (v10 < v8) {
            continue;
          }
        }
        goto LABEL_12;
      }
    }
    else
    {
LABEL_12:
      if (!v11)
      {
        while ((unint64_t)v10 < v9 && ((*((_DWORD *)v10 + 1) | *(_DWORD *)v10) & 0x80808080) == 0)
          v10 += 8;
      }
    }
    if (v10 < v8)
    {
      int64_t v13 = v8 - v10;
      while ((*v10 & 0x80000000) == 0)
      {
        ++v10;
        if (!--v13)
        {
          char v10 = v8;
          break;
        }
      }
    }
    uint64_t result = sub_100080F20(a1, &a2[(int)v10 - (int)a2], a3 - ((int)v10 - (int)a2), &v15);
    v10 += v15;
  }
  while (result == 253);
  *a4 = v10 - a2;
  return result;
}

BOOL sub_100081264(char *a1, int a2)
{
  int v4 = 0;
  sub_100081144(dword_1000AE600, a1, a2, &v4);
  return v4 == a2;
}

uint64_t sub_1000812B4(char *a1, int a2)
{
  unsigned int v3 = 0;
  sub_100081144(dword_1000AE600, a1, a2, &v3);
  return v3;
}

char *sub_1000812F0(char *a1, int a2, char *a3, char a4)
{
  uint64_t v7 = a1;
  int __len = 0;
  sub_100081144(dword_1000AE600, a1, a2, &__len);
  uint64_t v8 = __len;
  if (__len != a2)
  {
    memmove(a3, v7, __len);
    if (a2 > v8)
    {
      unint64_t v9 = &v7[a2];
      char v10 = &v7[v8];
      uint64_t v11 = &a3[v8];
      do
      {
        *uint64_t v11 = a4;
        char v12 = v10 + 1;
        if (v9 - (v10 + 1) < 0) {
          sub_10006FF3C();
        }
        int64_t v13 = v11 + 1;
        int __len_4 = 0;
        sub_100081144(dword_1000AE600, v10 + 1, v9 - (v10 + 1), &__len_4);
        uint64_t v14 = __len_4;
        memmove(v13, v12, __len_4);
        char v10 = &v12[v14];
        uint64_t v11 = &v13[v14];
      }
      while (&v12[v14] < v9);
    }
    return a3;
  }
  return v7;
}

char *sub_1000813EC(char *__s1, char *__s2, char a3)
{
  uint64_t v6 = __s1;
  if (__s1[23] < 0) {
    uint64_t v6 = *(char **)__s1;
  }
  for (i = v6; ; i = result + 1)
  {
    uint64_t result = strpbrk(i, __s2);
    if (!result) {
      break;
    }
    unint64_t v9 = __s1;
    if (__s1[23] < 0) {
      unint64_t v9 = *(char **)__s1;
    }
    v9[result - v6] = a3;
  }
  return result;
}

std::string *sub_10008145C(std::string *this)
{
  uint64_t v1 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
  }
  else {
    LODWORD(size) = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if ((int)size < 1)
  {
    if (size) {
      return this;
    }
    goto LABEL_24;
  }
  std::string::size_type v3 = 0;
  while (1)
  {
    this = (std::string *)std::string::at(v1, v3);
    int v4 = this->__r_.__value_.__s.__data_[0];
    if ((v4 - 9) >= 5 && v4 != 32) {
      break;
    }
    if (size == ++v3) {
      goto LABEL_24;
    }
  }
  if (size == v3)
  {
LABEL_24:
    if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    {
      *v1->__r_.__value_.__l.__data_ = 0;
      v1->__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v1->__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&v1->__r_.__value_.__s + 23) = 0;
    }
    return this;
  }
  if (v3)
  {
    this = std::string::erase(v1, 0, v3);
    LODWORD(size) = size - v3;
  }
  uint64_t v5 = (size - 1);
  if ((int)size >= 1)
  {
    uint64_t v6 = 0;
    while (1)
    {
      this = (std::string *)std::string::at(v1, v5 + v6);
      int v7 = this->__r_.__value_.__s.__data_[0];
      if ((v7 - 9) >= 5 && v7 != 32) {
        break;
      }
      --v6;
      if (v5 + v6 + 1 <= 0) {
        return this;
      }
    }
    if (v6)
    {
      return std::string::erase(v1, (v5 + v6 + 1), 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  return this;
}

std::string *sub_10008159C(std::string *__str, uint64_t a2, uint64_t a3, char a4, std::string *this)
{
  uint64_t v5 = this;
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  uint64_t v8 = *(void *)(a2 + 8);
  if ((v7 & 0x80u) == 0) {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  if (v9)
  {
    std::string::size_type v11 = 0;
    while (1)
    {
      std::string::size_type v12 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
      char v13 = v12;
      std::string::size_type size = __str->__r_.__value_.__l.__size_;
      int v15 = (v12 & 0x80u) == 0 ? __str : (std::string *)__str->__r_.__value_.__r.__words[0];
      std::string::size_type v16 = (v12 & 0x80u) == 0 ? HIBYTE(__str->__r_.__value_.__r.__words[2]) : __str->__r_.__value_.__l.__size_;
      uint64_t v17 = (v7 & 0x80u) == 0 ? (char *)a2 : *(char **)a2;
      int64_t v18 = (v7 & 0x80u) == 0 ? v7 : v8;
      if (v16 < v11) {
        break;
      }
      std::string::size_type v19 = v11;
      if (v18)
      {
        long long v20 = (char *)v15 + v11;
        long long v21 = (char *)v15 + v16;
        int64_t v22 = v16 - v11;
        if ((uint64_t)(v16 - v11) < v18) {
          break;
        }
        std::string::size_type v37 = __str->__r_.__value_.__l.__size_;
        int v23 = *v17;
        while (1)
        {
          int64_t v24 = v22 - v18;
          if (v24 == -1 || (long long v25 = (char *)memchr(v20, v23, v24 + 1)) == 0)
          {
LABEL_41:
            uint64_t v5 = this;
            std::string::size_type size = v37;
            char v13 = v12;
            goto LABEL_42;
          }
          long long v26 = v25;
          if (!memcmp(v25, v17, v18)) {
            break;
          }
          long long v20 = v26 + 1;
          int64_t v22 = v21 - (v26 + 1);
          if (v22 < v18) {
            goto LABEL_41;
          }
        }
        uint64_t v5 = this;
        std::string::size_type size = v37;
        char v13 = v12;
        if (v26 == v21) {
          break;
        }
        std::string::size_type v19 = v26 - (char *)v15;
      }
      if (v19 == -1) {
        break;
      }
      std::string::append(v5, __str, v11, v19 - v11);
      int v27 = *(char *)(a3 + 23);
      if (v27 >= 0) {
        long long v28 = (const std::string::value_type *)a3;
      }
      else {
        long long v28 = *(const std::string::value_type **)a3;
      }
      if (v27 >= 0) {
        std::string::size_type v29 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        std::string::size_type v29 = *(void *)(a3 + 8);
      }
      std::string::append(v5, v28, v29);
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
      uint64_t v8 = *(void *)(a2 + 8);
      if ((v7 & 0x80u) == 0) {
        uint64_t v30 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v30 = *(void *)(a2 + 8);
      }
      std::string::size_type v11 = v30 + v19;
      if ((a4 & 1) == 0)
      {
        std::string::size_type v12 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
        std::string::size_type size = __str->__r_.__value_.__l.__size_;
        char v13 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
        break;
      }
    }
LABEL_42:
    if (v13 >= 0) {
      std::string::size_type v31 = v12;
    }
    else {
      std::string::size_type v31 = size;
    }
    return std::string::append(v5, __str, v11, v31 - v11);
  }
  else
  {
    int v33 = SHIBYTE(__str->__r_.__value_.__r.__words[2]);
    if (v33 >= 0) {
      long long v34 = __str;
    }
    else {
      long long v34 = (std::string *)__str->__r_.__value_.__r.__words[0];
    }
    if (v33 >= 0) {
      std::string::size_type v35 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v35 = __str->__r_.__value_.__l.__size_;
    }
    return std::string::append(this, (const std::string::value_type *)v34, v35);
  }
}

std::string *sub_1000817BC@<X0>(std::string *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  return sub_10008159C(a1, a2, a3, a4, a5);
}

void sub_1000817EC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100081808(unsigned __int8 *__src, uint64_t a2, char *__s, uint64_t *a4)
{
  v31[0] = (uint64_t)__src;
  v31[1] = a2;
  int v7 = *__s;
  if (*__s && !__s[1])
  {
    if (a2)
    {
      long long v20 = __src;
      long long v21 = (char *)&__src[a2];
      int64_t v22 = (char *)&__src[a2];
      do
      {
        if (*v20 == v7)
        {
          int v23 = v20 + 1;
        }
        else
        {
          int64_t v24 = (char *)(v20 + 1);
          while (v24 != v21)
          {
            int v25 = *v24++;
            if (v25 == v7)
            {
              int v23 = (unsigned __int8 *)(v24 - 1);
              goto LABEL_27;
            }
          }
          int v23 = (unsigned __int8 *)v22;
LABEL_27:
          sub_10001DEEC(__p, v20, v23 - v20);
          int v27 = a4;
          sub_100087178(&v27, (long long *)__p);
          if (v30 < 0) {
            operator delete(__p[0]);
          }
        }
        long long v20 = v23;
      }
      while (v23 != (unsigned __int8 *)v21);
    }
  }
  else
  {
    size_t v8 = strlen(__s);
    uint64_t v9 = v8;
    if ((v8 & 0x8000000000000000) != 0) {
      sub_1000803D4(v8, "size_t to int conversion");
    }
    uint64_t v10 = sub_100080AC4(v31, (unsigned __int8 *)__s, v9, 0);
    if (v10 != -1)
    {
      uint64_t v11 = v10;
      while (1)
      {
        size_t v12 = strlen(__s);
        uint64_t v13 = v12;
        if ((v12 & 0x8000000000000000) != 0) {
          sub_1000803D4(v12, "size_t to int conversion");
        }
        uint64_t v14 = sub_1000809B0(v31, (unsigned __int8 *)__s, v13, v11);
        if (v14 == -1) {
          break;
        }
        uint64_t v15 = v14;
        int v27 = (uint64_t *)sub_100080E50(v31, v11, v14 - v11);
        uint64_t v28 = v16;
        sub_1000520F8((uint64_t)&v27, __p);
        long long v26 = a4;
        sub_100087178(&v26, (long long *)__p);
        if (v30 < 0) {
          operator delete(__p[0]);
        }
        size_t v17 = strlen(__s);
        uint64_t v18 = v17;
        if ((v17 & 0x8000000000000000) != 0) {
          sub_1000803D4(v17, "size_t to int conversion");
        }
        uint64_t v11 = sub_100080AC4(v31, (unsigned __int8 *)__s, v18, v15);
        if (v11 == -1) {
          return;
        }
      }
      int v27 = (uint64_t *)sub_100080E50(v31, v11, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v28 = v19;
      sub_1000520F8((uint64_t)&v27, __p);
      long long v26 = a4;
      sub_100087178(&v26, (long long *)__p);
      if (v30 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_100081A2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100081A50(uint64_t a1, uint64_t a2, char *__s, uint64_t *a4)
{
  v18[0] = a1;
  v18[1] = a2;
  sub_100087128(&v16, __s);
  uint64_t v6 = sub_1000809B0(v18, v16, v17, 0);
  if (v6 == -1)
  {
    unint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    do
    {
      unint64_t v12 = sub_100080E50(v18, v8, v7 - v8);
      uint64_t v13 = v9;
      sub_1000520F8((uint64_t)&v12, __p);
      uint64_t v11 = a4;
      sub_100087178(&v11, (long long *)__p);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
      unint64_t v8 = v7 + 1;
      sub_100087128(&v16, __s);
      uint64_t v7 = sub_1000809B0(v18, v16, v17, v7 + 1);
    }
    while (v7 != -1);
  }
  unint64_t v12 = sub_100080E50(v18, v8, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v13 = v10;
  sub_1000520F8((uint64_t)&v12, __p);
  uint64_t v11 = a4;
  sub_100087178(&v11, (long long *)__p);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100081B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100081B90(uint64_t *a1, char *__s, uint64_t a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (!a3)
  {
    sub_100051E5C((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 264);
    uint64_t v7 = sub_100051E74(v19, "CHECK failed: result != nullptr: ");
    sub_100051FB0((uint64_t)&v18, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v19);
  }
  if (*(char *)(a3 + 23) < 0)
  {
    **(unsigned char **)a3 = 0;
    *(void *)(a3 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 23) = 0;
  }
  int v8 = strlen(__s);
  if (v6 == v5)
  {
    std::string::reserve((std::string *)a3, 0);
  }
  else
  {
    int v9 = v8;
    uint64_t v10 = 0;
    int v11 = 0;
    uint64_t v12 = v5;
    do
    {
      if (v10) {
        int v13 = v8;
      }
      else {
        int v13 = 0;
      }
      if (*(char *)(v12 + 23) < 0) {
        uint64_t v14 = *(void *)(v5 + 8 + v10);
      }
      else {
        LODWORD(v14) = *(unsigned __int8 *)(v12 + 23);
      }
      v11 += v13 + v14;
      v12 += 24;
      v10 += 24;
    }
    while (v12 != v6);
    std::string::reserve((std::string *)a3, v11);
    uint64_t v15 = 0;
    do
    {
      if (v15) {
        std::string::append((std::string *)a3, __s, v9);
      }
      uint64_t v16 = (const std::string::value_type *)(v5 + v15);
      if (*(char *)(v5 + v15 + 23) < 0)
      {
        uint64_t v16 = *(const std::string::value_type **)(v5 + v15);
        std::string::size_type v17 = *(void *)(v5 + v15 + 8);
      }
      else
      {
        std::string::size_type v17 = *(unsigned __int8 *)(v5 + v15 + 23);
      }
      std::string::append((std::string *)a3, v16, v17);
      v15 += 24;
    }
    while (v5 + v15 != v6);
  }
}

void sub_100081CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100081D0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100081D14(a1, a2, 0);
}

uint64_t sub_100081D14(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a3)
  {
    sub_100051E5C((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 316);
    uint64_t v5 = sub_100051E74(v25, "CHECK failed: errors == nullptr: ");
    uint64_t v6 = sub_100051E74(v5, "Error reporting not implemented.");
    sub_100051FB0((uint64_t)&v24, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v25);
  }
  if (a1 == a2)
  {
    for (i = a1; *i && *i != 92; ++i)
      ;
    a1 = i;
  }
  else
  {
    i = a2;
  }
  while (1)
  {
    int v8 = *a1;
    if (v8 != 92)
    {
      if (!*a1) {
        goto LABEL_59;
      }
      goto LABEL_57;
    }
    int v9 = a1 + 1;
    int v8 = (char)a1[1];
    if (v8 <= 62) {
      break;
    }
    if (v8 > 97)
    {
      switch(a1[1])
      {
        case 'n':
          LOBYTE(v8) = 10;
          goto LABEL_56;
        case 'o':
        case 'p':
        case 'q':
        case 's':
        case 'u':
        case 'w':
          goto LABEL_58;
        case 'r':
          LOBYTE(v8) = 13;
          goto LABEL_56;
        case 't':
          LOBYTE(v8) = 9;
          goto LABEL_56;
        case 'v':
          LOBYTE(v8) = 11;
          goto LABEL_56;
        case 'x':
          goto LABEL_30;
        default:
          if (v8 == 102)
          {
            LOBYTE(v8) = 12;
          }
          else
          {
            if (v8 != 98) {
              goto LABEL_58;
            }
            LOBYTE(v8) = 8;
          }
          break;
      }
      goto LABEL_56;
    }
    if (v8 > 91)
    {
      if (v8 != 92)
      {
        if (v8 != 97) {
          goto LABEL_58;
        }
        LOBYTE(v8) = 7;
      }
LABEL_56:
      a1 = v9;
LABEL_57:
      *i++ = v8;
      int v9 = a1;
      goto LABEL_58;
    }
    if (v8 == 63) {
      goto LABEL_56;
    }
    if (v8 != 88) {
      goto LABEL_58;
    }
LABEL_30:
    if ((a1[2] - 48) < 0xAu || (unsigned int v16 = a1[2] - 65, v16 <= 0x25) && ((1 << v16) & 0x3F0000003FLL) != 0)
    {
      LOBYTE(v8) = 0;
      std::string::size_type v17 = a1 + 1;
      while (1)
      {
        unsigned __int8 v19 = *++v17;
        unsigned __int8 v18 = v19;
        if ((v19 - 48) >= 0xAu
          && (v18 - 65 > 0x25 || ((1 << (v18 - 65)) & 0x3F0000003FLL) == 0))
        {
          break;
        }
        unsigned int v21 = v18;
        char v22 = v18 + 9;
        if (v21 <= 0x39) {
          char v22 = v21;
        }
        int v9 = v17;
        LOBYTE(v8) = v22 & 0xF | (16 * v8);
      }
      goto LABEL_56;
    }
LABEL_58:
    a1 = v9 + 1;
  }
  if (v8 > 47)
  {
    if ((v8 - 48) >= 8) {
      goto LABEL_58;
    }
    LOBYTE(v8) = v8 - 48;
    unsigned __int8 v11 = a1[2];
    uint64_t v10 = a1 + 2;
    char v12 = v11 + 8 * v8 - 48;
    if ((v11 & 0xF8) == 0x30)
    {
      int v9 = v10;
      LOBYTE(v8) = v12;
    }
    unsigned __int8 v13 = v9[1];
    int v14 = v13 & 0xF8;
    char v15 = v13 + 8 * v8 - 48;
    if (v14 == 48) {
      a1 = v9 + 1;
    }
    else {
      a1 = v9;
    }
    if (v14 == 48) {
      LOBYTE(v8) = v15;
    }
    goto LABEL_57;
  }
  if (v8 == 34 || v8 == 39) {
    goto LABEL_56;
  }
  if (a1[1]) {
    goto LABEL_58;
  }
LABEL_59:
  unsigned __int8 *i = 0;
  return (i - a2);
}

void sub_100081FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100081FEC()
{
}

void sub_100081FF4()
{
}

void sub_1000820E8(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100051FB8((uint64_t)va);
  operator delete[]();
}

void sub_100082124()
{
}

void sub_1000821D0()
{
}

uint64_t sub_1000821F4(unsigned __int8 *a1, int a2, uint64_t a3, int a4, int a5, char a6)
{
  if (a2 >= 1)
  {
    char v9 = a5;
    uint64_t v10 = a1;
    char v11 = 0;
    LODWORD(v12) = 0;
    if (a5) {
      unsigned __int8 v13 = "\\x%02x";
    }
    else {
      unsigned __int8 v13 = "\\%03o";
    }
    unint64_t v14 = (unint64_t)&a1[a2];
    while (1)
    {
      if (a4 - (int)v12 < 2) {
        return 0xFFFFFFFFLL;
      }
      int v15 = (char)*v10;
      if (v15 > 33)
      {
        switch(v15)
        {
          case '""':
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 8796;
            goto LABEL_20;
          case '\'':
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 10076;
            goto LABEL_20;
          case '\\':
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 23644;
            goto LABEL_20;
        }
      }
      else
      {
        switch(v15)
        {
          case 9:
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 29788;
            goto LABEL_20;
          case 10:
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 28252;
            goto LABEL_20;
          case 13:
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 29276;
LABEL_20:
            uint64_t v12 = (v12 + 2);
            goto LABEL_21;
        }
      }
      if (v15 < 0 && (a6 & 1) != 0
        || (v15 - 32) <= 0x5E
        && ((v11 & 1) == 0
         || (v15 - 48) >= 0xA
         && (*v10 - 65 > 0x25 || ((1 << (v15 - 65)) & 0x3F0000003FLL) == 0)))
      {
        char v11 = 0;
        *(unsigned char *)(a3 + (int)v12) = v15;
        uint64_t v12 = (v12 + 1);
      }
      else
      {
        if ((a4 - v12) < 4) {
          return 0xFFFFFFFFLL;
        }
        sprintf((char *)(a3 + (int)v12), v13, *v10);
        uint64_t v12 = (v12 + 4);
        char v11 = v9;
      }
LABEL_21:
      if ((unint64_t)++v10 >= v14) {
        goto LABEL_34;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_34:
  if ((int)v12 >= a4) {
    return 0xFFFFFFFFLL;
  }
  *(unsigned char *)(a3 + (int)v12) = 0;
  return v12;
}

void sub_1000823DC(const std::string::value_type *a1, int64_t a2, std::string *a3)
{
  uint64_t v12 = a1;
  int64_t v13 = a2;
  unint64_t v14 = a1;
  int64_t v15 = a2;
  if (a2 < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
      v7 += byte_100093017[sub_1000825BC(&v14, v6++)];
    while (v15 > v6);
  }
  if (v7 == a2)
  {
    std::string::append(a3, a1, a2);
    return;
  }
  if (SHIBYTE(a3->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = a3->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  }
  std::string::resize(a3, size + v7, 0);
  if (SHIBYTE(a3->__r_.__value_.__r.__words[2]) < 0) {
    a3 = (std::string *)a3->__r_.__value_.__r.__words[0];
  }
  if (a2 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = (char *)a3 + size;
    do
    {
      unsigned int v11 = sub_1000825BC(&v12, v9);
      if (v11 > 0x21u)
      {
        switch(v11)
        {
          case '""':
            *(_WORD *)uint64_t v10 = 8796;
            v10 += 2;
            break;
          case '\'':
            *(_WORD *)uint64_t v10 = 10076;
            v10 += 2;
            break;
          case '\\':
            *(_WORD *)uint64_t v10 = 23644;
            v10 += 2;
            break;
          default:
LABEL_28:
            if (v11 - 32 >= 0x5F)
            {
              unsigned char *v10 = 92;
              v10[1] = (v11 >> 6) | 0x30;
              std::string v10[2] = (v11 >> 3) & 7 | 0x30;
              v10[3] = v11 & 7 | 0x30;
              v10 += 4;
            }
            else
            {
              *v10++ = v11;
            }
            break;
        }
      }
      else
      {
        switch(v11)
        {
          case 9u:
            *(_WORD *)uint64_t v10 = 29788;
            v10 += 2;
            break;
          case 0xAu:
            *(_WORD *)uint64_t v10 = 28252;
            v10 += 2;
            break;
          case 0xDu:
            *(_WORD *)uint64_t v10 = 29276;
            v10 += 2;
            break;
          default:
            goto LABEL_28;
        }
      }
      ++v9;
    }
    while (v13 > v9);
  }
}

uint64_t sub_1000825BC(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_100087670();
  }
  if (a1[1] <= a2) {
    sub_10008769C();
  }
  return *(char *)(*a1 + a2);
}

void sub_1000825F0(uint64_t *a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  sub_100048934(v3, a1);
  sub_1000823DC(v3[0], (int64_t)v3[1], a2);
}

void sub_100082638(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100082654()
{
}

void sub_10008275C(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100051FB8((uint64_t)va);
  operator delete[]();
}

void sub_100082798()
{
}

void sub_1000828A0(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100051FB8((uint64_t)va);
  operator delete[]();
}

uint64_t sub_1000828DC(const char *a1, char **a2, int a3)
{
  int v6 = *__error();
  *__error() = 0;
  uint64_t v7 = strtol(a1, a2, a3);
  if (*__error() == 34 && v7 == 0x8000000000000000) {
    return 0x80000000;
  }
  if (*__error() == 34 && v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFLL;
  }
  int v10 = *__error();
  unsigned int v11 = __error();
  if (!v10 && v7 <= (uint64_t)0xFFFFFFFF7FFFFFFFLL)
  {
    *unsigned int v11 = 34;
    return 0x80000000;
  }
  int v12 = *v11;
  int64_t v13 = __error();
  if (!v12 && v7 >= 0x80000000)
  {
    *int64_t v13 = 34;
    return 0x7FFFFFFFLL;
  }
  if (!*v13) {
    *__error() = v6;
  }
  return v7;
}

uint64_t sub_1000829C8(const char *a1, char **a2, int a3)
{
  int v6 = *__error();
  *__error() = 0;
  unint64_t v7 = strtoul(a1, a2, a3);
  if (*__error() == 34 && v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v9 = *__error();
  int v10 = __error();
  if (!v9 && HIDWORD(v7))
  {
    int *v10 = 34;
    return 0xFFFFFFFFLL;
  }
  if (!*v10) {
    *__error() = v6;
  }
  return v7;
}

unsigned char *sub_100082A6C(unint64_t a1, unsigned char *a2)
{
  unint64_t v2 = a1;
  a2[21] = 0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    if (a1 < 0xFFFFFFFFFFFFFFF7)
    {
      unint64_t v6 = -10 - a1;
      uint64_t result = a2 + 19;
      a2[20] = (v6 % 0xA) | 0x30;
      unint64_t v7 = v6 / 0xA + 1;
      do
      {
        *result-- = (v7 % 0xA) | 0x30;
        BOOL v8 = v7 > 9;
        v7 /= 0xAuLL;
      }
      while (v8);
    }
    else
    {
      char v5 = 48 - a1;
      uint64_t result = a2 + 19;
      a2[20] = v5;
    }
    unsigned char *result = 45;
  }
  else
  {
    uint64_t result = a2 + 21;
    do
    {
      *--uint64_t result = (v2 % 0xA) | 0x30;
      BOOL v4 = v2 >= 0xA;
      v2 /= 0xAuLL;
    }
    while (v4);
  }
  return result;
}

unsigned char *sub_100082B24(unsigned int a1, unsigned char *a2)
{
  unsigned int v2 = a1;
  a2[11] = 0;
  if ((a1 & 0x80000000) != 0)
  {
    if (a1 < 0xFFFFFFF7)
    {
      unsigned int v6 = -10 - a1;
      unsigned int v7 = (-10 - a1) / 0xA;
      uint64_t result = a2 + 9;
      a2[10] = (v6 % 0xA) | 0x30;
      unsigned int v8 = v7 + 1;
      do
      {
        *result-- = (v8 % 0xA) | 0x30;
        BOOL v9 = v8 > 9;
        v8 /= 0xAu;
      }
      while (v9);
    }
    else
    {
      char v5 = 48 - a1;
      uint64_t result = a2 + 9;
      a2[10] = v5;
    }
    unsigned char *result = 45;
  }
  else
  {
    uint64_t result = a2 + 11;
    do
    {
      *--uint64_t result = (v2 % 0xA) | 0x30;
      BOOL v4 = v2 >= 0xA;
      v2 /= 0xAu;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_100082BDC(int a1, uint64_t a2)
{
  int v3 = a1;
  if (a1 < 0)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 887);
    BOOL v4 = sub_100051E74(v11, "CHECK failed: i >= 0: ");
    char v5 = sub_100051E74(v4, "FastHexToBuffer() wants non-negative integers, not ");
    unsigned int v6 = sub_1000523B8(v5, v3);
    sub_100051FB0((uint64_t)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v11);
  }
  *(unsigned char *)(a2 + 21) = 0;
  uint64_t v7 = a2 + 21;
  do
  {
    *(unsigned char *)--uint64_t v7 = a0123456789abcd[v3 & 0xF];
    BOOL v8 = v3 <= 15;
    int v3 = v3 >> 4;
  }
  while (!v8);
  return v7;
}

void sub_100082C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100082CA0(unint64_t a1, uint64_t a2, int a3)
{
  *(unsigned char *)(a2 + a3) = 0;
  if (a3 >= 1)
  {
    unint64_t v3 = a3 + 1;
    do
    {
      *(unsigned char *)(a2 + (v3 - 2)) = a0123456789abcd[a1 & 0xF];
      a1 >>= 4;
      --v3;
    }
    while (v3 > 1);
  }
  return a2;
}

uint64_t sub_100082CE4(unint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v2 = 15;
  do
  {
    *(unsigned char *)(a2 + v2) = a0123456789abcd[a1 & 0xF];
    a1 >>= 4;
    unint64_t v3 = v2-- + 1;
  }
  while (v3 > 1);
  return a2;
}

uint64_t sub_100082D1C(unsigned int a1, uint64_t a2)
{
  unint64_t v2 = a1;
  *(unsigned char *)(a2 + 8) = 0;
  uint64_t v3 = 7;
  do
  {
    *(unsigned char *)(a2 + v3) = a0123456789abcd[v2 & 0xF];
    v2 >>= 4;
    unint64_t v4 = v3-- + 1;
  }
  while (v4 > 1);
  return a2;
}

unsigned char *sub_100082D58(unsigned int a1, unsigned char *a2)
{
  if (a1 >= 0x3B9ACA00)
  {
    unint64_t v2 = a1 / 0x5F5E100uLL;
    *(_WORD *)a2 = word_100092BCD[v2];
    a2 += 2;
    goto LABEL_3;
  }
  if (a1 > 0x63)
  {
    if (a1 >> 4 <= 0x270)
    {
      if (a1 <= 0x3E7)
      {
        LODWORD(v5) = (unsigned __int16)a1 / 0x64u;
        *a2++ = v5 + 48;
        goto LABEL_9;
      }
LABEL_8:
      unint64_t v5 = a1 / 0x64uLL;
      *(_WORD *)a2 = word_100092BCD[v5];
      a2 += 2;
LABEL_9:
      a1 -= 100 * v5;
      goto LABEL_10;
    }
    if (a1 < 0xF4240)
    {
      if (a1 >> 5 <= 0xC34)
      {
        LODWORD(v4) = a1 / 0x2710;
        *a2++ = a1 / 0x2710 + 48;
        goto LABEL_7;
      }
LABEL_6:
      unint64_t v4 = a1 / 0x2710uLL;
      *(_WORD *)a2 = word_100092BCD[v4];
      a2 += 2;
LABEL_7:
      a1 -= 10000 * v4;
      goto LABEL_8;
    }
    if (a1 < 0x5F5E100)
    {
      if (a1 <= 0x98967F)
      {
        LODWORD(v3) = a1 / 0xF4240;
        *a2++ = a1 / 0xF4240 + 48;
        goto LABEL_5;
      }
LABEL_4:
      unint64_t v3 = a1 / 0xF4240uLL;
      *(_WORD *)a2 = word_100092BCD[v3];
      a2 += 2;
LABEL_5:
      a1 -= 1000000 * v3;
      goto LABEL_6;
    }
    LODWORD(v2) = a1 / 0x5F5E100;
    *a2++ = a1 / 0x5F5E100 + 48;
LABEL_3:
    a1 -= 100000000 * v2;
    goto LABEL_4;
  }
  if (a1 <= 9)
  {
    *a2 = a1 + 48;
    unsigned int v6 = a2 + 1;
    goto LABEL_11;
  }
LABEL_10:
  *(_WORD *)a2 = word_100092BCD[a1];
  unsigned int v6 = a2 + 2;
LABEL_11:
  unsigned char *v6 = 0;
  return v6;
}

unsigned char *sub_100082ED0(unsigned int a1, unsigned char *a2)
{
  if ((a1 & 0x80000000) != 0)
  {
    *a2++ = 45;
    a1 = -a1;
  }
  return sub_100082D58(a1, a2);
}

unsigned char *sub_100082EE8(unint64_t a1, unsigned char *a2)
{
  int v2 = a1;
  if (HIDWORD(a1))
  {
    unint64_t v4 = a1 / 0x3B9ACA00;
    unint64_t v5 = (_WORD *)sub_100082EE8(a1 / 0x3B9ACA00);
    unsigned int v6 = v2 - 1000000000 * v4;
    if (v6 >= 0x3B9ACA00)
    {
      sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1068);
      uint64_t v7 = sub_100051E74(v10, "CHECK failed: (digits) < (100): ");
      sub_100051FB0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v10);
    }
    *unint64_t v5 = word_100092BCD[v6 / 0x989680];
    v5[1] = word_100092BCD[v6 % 0x989680 / 0x186A0uLL];
    unsigned int v8 = v6 % 0x989680 % 0x186A0;
    v5[2] = word_100092BCD[v8 / 0x3E8uLL];
    v8 %= 0x3E8u;
    v5[3] = word_100092BCD[v8 / 0xAuLL];
    v5[4] = (v8 % 0xA + 48);
    return (char *)v5 + 9;
  }
  else
  {
    return sub_100082D58(a1, a2);
  }
}

void sub_10008306C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

unsigned char *sub_100083084(unint64_t a1, unsigned char *a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    *a2++ = 45;
    a1 = -(uint64_t)a1;
  }
  return sub_100082EE8(a1, a2);
}

void *sub_10008309C@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  unint64_t v3 = sub_100082B24(a1, v5);
  return sub_10000A1B4(a2, v3);
}

void *sub_100083104@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  unint64_t v3 = sub_100082D58(a1, v5);
  return sub_100032010(a2, v5, v3, v3 - v5);
}

void *sub_100083178@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = sub_100082A6C(a1, v5);
  return sub_10000A1B4(a2, v3);
}

void *sub_1000831E0@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = sub_100082EE8(a1, v5);
  return sub_100032010(a2, v5, v3, v3 - v5);
}

void *sub_100083254@<X0>(void *a1@<X8>, double a2@<D0>)
{
  sub_1000832BC(__s, a2);
  return sub_10000A1B4(a1, __s);
}

char *sub_1000832BC(char *__str, double a2)
{
  if (a2 == INFINITY)
  {
    int v4 = 6712937;
LABEL_5:
    *(_DWORD *)__str = v4;
    return __str;
  }
  if (a2 == -INFINITY)
  {
    __str[4] = 0;
    int v4 = 1718511917;
    goto LABEL_5;
  }
  if ((snprintf(__str, 0x20uLL, "%.*g", 15, a2) - 32) <= 0xFFFFFFE0)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1265);
    unsigned int v6 = sub_100051E74(v10, "CHECK failed: snprintf_result > 0 && snprintf_result < kDoubleToBufferSize: ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v10);
  }
  double v9 = 0.0;
  double v9 = sub_100083794(__str, 0);
  if (v9 != a2 && (snprintf(__str, 0x20uLL, "%.*g", 17, a2) - 32) <= 0xFFFFFFE0)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1279);
    uint64_t v7 = sub_100051E74(v10, "CHECK failed: snprintf_result > 0 && snprintf_result < kDoubleToBufferSize: ");
    sub_100051FB0((uint64_t)&v8, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v10);
  }
  sub_100083670(__str);
  return __str;
}

void sub_100083440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_100083460@<X0>(void *a1@<X8>, float a2@<S0>)
{
  sub_1000834C8(v4, a2);
  return sub_10000A1B4(a1, v4);
}

char *sub_1000834C8(char *__str, float a2)
{
  if (a2 == INFINITY)
  {
    int v4 = 6712937;
LABEL_5:
    *(_DWORD *)__str = v4;
    return __str;
  }
  if (a2 == -INFINITY)
  {
    __str[4] = 0;
    int v4 = 1718511917;
    goto LABEL_5;
  }
  if ((snprintf(__str, 0x18uLL, "%.*g", 6, a2) - 24) <= 0xFFFFFFE8)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1383);
    unsigned int v6 = sub_100051E74(v10, "CHECK failed: snprintf_result > 0 && snprintf_result < kFloatToBufferSize: ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v10);
  }
  float v9 = 0.0;
  if ((!sub_100083E24(__str, &v9) || v9 != a2)
    && (snprintf(__str, 0x18uLL, "%.*g", 9, a2) - 24) <= 0xFFFFFFE8)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1391);
    uint64_t v7 = sub_100051E74(v10, "CHECK failed: snprintf_result > 0 && snprintf_result < kFloatToBufferSize: ");
    sub_100051FB0((uint64_t)&v8, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v10);
  }
  sub_100083670(__str);
  return __str;
}

void sub_100083650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_100083670(char *a1)
{
  uint64_t result = strchr(a1, 46);
  if (!result)
  {
    for (i = a1 + 2; ; ++i)
    {
      int v4 = *((unsigned __int8 *)i - 2);
      if ((v4 - 48) >= 0xA
        && ((v4 - 43) > 0x3A || ((1 << (v4 - 43)) & 0x400000004000005) == 0))
      {
        break;
      }
    }
    if (*(i - 2))
    {
      uint64_t v7 = (unsigned __int8 *)(i - 1);
      int v6 = *((unsigned __int8 *)i - 1);
      *((unsigned char *)i - 2) = 46;
      if ((v6 - 48) >= 0xA
        && ((v6 - 43) > 0x3A || ((1 << (v6 - 43)) & 0x400000004000005) == 0))
      {
        if (v6)
        {
          do
          {
            char v8 = i;
            int v9 = *(unsigned __int8 *)i;
            if ((v9 - 48) < 0xA) {
              break;
            }
            ++i;
            BOOL v10 = (v9 - 43) > 0x3A || ((1 << (v9 - 43)) & 0x400000004000005) == 0;
          }
          while (v10 && v9 != 0);
          size_t v12 = strlen(v8) + 1;
          return (char *)memmove(v7, v8, v12);
        }
      }
    }
  }
  return result;
}

double sub_100083794(char *a1, char **a2)
{
  unsigned __int8 v18 = 0;
  double v4 = strtod(a1, &v18);
  unint64_t v5 = v18;
  if (a2) {
    *a2 = v18;
  }
  if (*v5 == 46)
  {
    int v6 = snprintf(&__str, 0x10uLL, "%.1f", 1.5);
    if (__str != 49)
    {
      sub_100051E5C((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2425);
      uint64_t v7 = sub_100051E74(v20, "CHECK failed: (temp[0]) == ('1'): ");
      sub_100051FB0((uint64_t)&v19, (const char **)&v7->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v20);
    }
    if (v22[v6 - 2] != 53)
    {
      sub_100051E5C((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2426);
      char v8 = sub_100051E74(v20, "CHECK failed: (temp[size - 1]) == ('5'): ");
      sub_100051FB0((uint64_t)&v19, (const char **)&v8->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v20);
    }
    if (v6 >= 7)
    {
      sub_100051E5C((uint64_t)v20, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2427);
      int v9 = sub_100051E74(v20, "CHECK failed: (size) <= (6): ");
      sub_100051FB0((uint64_t)&v19, (const char **)&v9->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v20);
    }
    memset(&v17, 0, sizeof(v17));
    size_t v10 = strlen(a1);
    std::string::reserve(&v17, v10 + v6 - 3);
    sub_100031E98(&v17, a1, v5);
    std::string::append(&v17, v22, v6 - 2);
    unsigned int v11 = v5 + 1;
    size_t v12 = &v17;
    std::string::append(&v17, v11);
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      size_t v12 = (std::string *)v17.__r_.__value_.__r.__words[0];
    }
    v20[0].__r_.__value_.__r.__words[0] = 0;
    double v4 = strtod((const char *)v12, &v20[0].__r_.__value_.__l.__data_);
    char v13 = HIBYTE(v17.__r_.__value_.__r.__words[2]);
    if (a2 && (int64_t)(v20[0].__r_.__value_.__r.__words[0] - (void)v12) > v18 - a1)
    {
      int v14 = strlen(a1);
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v15 = HIBYTE(v17.__r_.__value_.__r.__words[2]);
      }
      else {
        int v15 = v17.__r_.__value_.__r.__words[1];
      }
      *a2 = &a1[v20[0].__r_.__value_.__r.__words[0] - ((void)v12 + v15 - v14)];
    }
    if (v13 < 0) {
      operator delete(v17.__r_.__value_.__l.__data_);
    }
  }
  return v4;
}

void sub_100083A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t sub_100083A54(unsigned __int8 *a1, uint64_t a2, char *a3)
{
  if (!a3)
  {
    sub_100051E5C((uint64_t)v38, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1305);
    int v6 = sub_100051E74(v38, "CHECK failed: value != nullptr: ");
    uint64_t v7 = sub_100051E74(v6, "nullptr output BOOLean given.");
    sub_100051FB0((uint64_t)&v37, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v38);
  }
  switch(a2)
  {
    case 1:
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = a1[v8];
        if ((v9 - 65) < 0x1A) {
          LOBYTE(v9) = v9 + 32;
        }
        int v10 = aT[v8];
        if ((v10 - 65) < 0x1A) {
          LOBYTE(v10) = v10 + 32;
        }
        if (v9 != v10) {
          break;
        }
        if (a2 == ++v8) {
          goto LABEL_40;
        }
      }
      if (a2 == 1) {
        goto LABEL_33;
      }
      if (a2 == 5) {
        goto LABEL_49;
      }
      if (a2 != 3) {
        goto LABEL_44;
      }
      goto LABEL_23;
    case 3:
LABEL_23:
      uint64_t v14 = 0;
      while (1)
      {
        int v15 = a1[v14];
        if ((v15 - 65) < 0x1A) {
          LOBYTE(v15) = v15 + 32;
        }
        int v16 = aYes[v14];
        if ((v16 - 65) < 0x1A) {
          LOBYTE(v16) = v16 + 32;
        }
        if (v15 != v16) {
          break;
        }
        if (a2 == ++v14) {
          goto LABEL_40;
        }
      }
      if (a2 == 5)
      {
LABEL_49:
        char v24 = "false";
        int v25 = a1;
        uint64_t v26 = a2;
        while (1)
        {
          int v28 = *v25++;
          char v27 = v28;
          char v29 = v28 + 32;
          if ((v28 - 65) < 0x1A) {
            char v27 = v29;
          }
          int v31 = *(unsigned __int8 *)v24++;
          char v30 = v31;
          char v32 = v31 + 32;
          if ((v31 - 65) < 0x1A) {
            char v30 = v32;
          }
          if (v27 != v30) {
            goto LABEL_44;
          }
          if (!--v26) {
            goto LABEL_56;
          }
        }
      }
      if (a2 != 1) {
        goto LABEL_44;
      }
LABEL_33:
      uint64_t v17 = 0;
      while (1)
      {
        int v18 = a1[v17];
        if ((v18 - 65) < 0x1A) {
          LOBYTE(v18) = v18 + 32;
        }
        int v19 = aY[v17];
        if ((v19 - 65) < 0x1A) {
          LOBYTE(v19) = v19 + 32;
        }
        if (v18 != v19) {
          break;
        }
        if (a2 == ++v17) {
          goto LABEL_40;
        }
      }
      int v21 = *a1;
      if ((v21 - 65) < 0x1A) {
        LOBYTE(v21) = v21 + 32;
      }
      if (v21 != 49) {
        goto LABEL_44;
      }
      goto LABEL_40;
    case 4:
      uint64_t v11 = 0;
      break;
    case 5:
      goto LABEL_49;
    default:
      goto LABEL_44;
  }
  while (1)
  {
    int v12 = a1[v11];
    if ((v12 - 65) < 0x1A) {
      LOBYTE(v12) = v12 + 32;
    }
    int v13 = aTrue[v11];
    if ((v13 - 65) < 0x1A) {
      LOBYTE(v13) = v13 + 32;
    }
    if (v12 != v13) {
      break;
    }
    if (++v11 == 4)
    {
LABEL_40:
      char v20 = 1;
      goto LABEL_57;
    }
  }
LABEL_44:
  sub_100087128(v36, "f");
  if (sub_100083DC4(a1, a2, v36[0], (uint64_t)v36[1])
    || (sub_100087128(v35, "no"), sub_100083DC4(a1, a2, v35[0], (uint64_t)v35[1]))
    || (sub_100087128(v34, "n"), sub_100083DC4(a1, a2, v34[0], (uint64_t)v34[1])))
  {
LABEL_56:
    char v20 = 0;
  }
  else
  {
    sub_100087128(v33, "0");
    BOOL v22 = sub_100083DC4(a1, a2, v33[0], (uint64_t)v33[1]);
    char v20 = 0;
    uint64_t result = 0;
    if (!v22) {
      return result;
    }
  }
LABEL_57:
  *a3 = v20;
  return 1;
}

void sub_100083D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_100083DC4(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a2 != a4) {
    return 0;
  }
  if (a2)
  {
    while (1)
    {
      int v5 = *a1++;
      unsigned __int8 v4 = v5;
      unsigned __int8 v6 = v5 + 32;
      if ((v5 - 65) < 0x1A) {
        unsigned __int8 v4 = v6;
      }
      int v8 = *a3++;
      unsigned __int8 v7 = v8;
      unsigned __int8 v9 = v8 + 32;
      if ((v8 - 65) < 0x1A) {
        unsigned __int8 v7 = v9;
      }
      int v10 = v4 - v7;
      if (v10) {
        break;
      }
      if (!--a2) {
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int v10 = 0;
  }
  return v10 == 0;
}

BOOL sub_100083E24(const char *a1, float *a2)
{
  int v5 = 0;
  *__error() = 0;
  *a2 = strtof(a1, &v5);
  return *a1 && !*v5 && *__error() == 0;
}

BOOL sub_100083E98(char *a1, double *a2)
{
  unsigned __int8 v6 = 0;
  *a2 = sub_100083794(a1, &v6);
  i = a1;
  if (v6 != a1)
  {
    for (i = v6; ; unsigned __int8 v6 = i)
    {
      int v4 = *i;
      if ((v4 - 9) >= 5 && v4 != 32) {
        break;
      }
      ++i;
    }
  }
  return *a1 && *i == 0;
}

uint64_t sub_100083F28(uint64_t a1, int *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    sub_1000302DC(&__p, *(void **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = sub_100083FB8(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_100083F9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100083FB8(std::string *__str, int *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    int v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    int v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v16, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v17);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v16;
  if (v10 == 45) {
    return sub_10008735C((unsigned __int8 *)__str, a2);
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    sub_1000302DC(__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)&__str->__r_.__value_.__l.__data_;
    std::string::size_type v15 = __str->__r_.__value_.__r.__words[2];
  }
  uint64_t v12 = sub_1000872C0((unsigned __int8 *)__p, a2);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  return v12;
}

void sub_100084130(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10008414C(uint64_t a1, unsigned int *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    sub_1000302DC(&__p, *(void **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = sub_1000841DC(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_1000841C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000841DC(std::string *__str, unsigned int *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    int v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    int v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v16, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v17);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v16;
  if (v10 == 45) {
    return 0;
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    sub_1000302DC(__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)&__str->__r_.__value_.__l.__data_;
    std::string::size_type v15 = __str->__r_.__value_.__r.__words[2];
  }
  uint64_t v12 = sub_1000873FC((unsigned __int8 *)__p, a2);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  return v12;
}

void sub_100084340(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10008435C(uint64_t a1, int64_t *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    sub_1000302DC(&__p, *(void **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = sub_1000843EC(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_1000843D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000843EC(std::string *__str, int64_t *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    int v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    int v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v16, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v17);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v16;
  if (v10 == 45) {
    return sub_100087530((unsigned __int8 *)__str, a2);
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    sub_1000302DC(__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)&__str->__r_.__value_.__l.__data_;
    std::string::size_type v15 = __str->__r_.__value_.__r.__words[2];
  }
  uint64_t v12 = sub_100087494((unsigned __int8 *)__p, a2);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  return v12;
}

void sub_100084564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100084580(uint64_t a1, unint64_t *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    sub_1000302DC(&__p, *(void **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  uint64_t v3 = sub_100084610(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_1000845F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100084610(std::string *__str, unint64_t *a2)
{
  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    int v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    int64_t size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    int v4 = __str;
    int64_t size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  unsigned __int8 v6 = (char *)v4 + size;
  unsigned __int8 v7 = v4;
  if (size >= 1)
  {
    unsigned __int8 v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32) {
        break;
      }
      unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  uint64_t v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6) {
      return 0;
    }
    int v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  int v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    unsigned __int8 v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1)) {
      return 0;
    }
  }
  uint64_t v11 = __str;
  if ((*((unsigned char *)&__str->__r_.__value_.__s + 23) & 0x80) != 0) {
    uint64_t v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  std::string::basic_string(&v16, __str, (char *)v7 - (char *)v11, v8 - (void)v7, (std::allocator<char> *)&v17);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str->__r_.__value_.__l.__data_);
  }
  *char __str = v16;
  if (v10 == 45) {
    return 0;
  }
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    sub_1000302DC(__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)&__str->__r_.__value_.__l.__data_;
    std::string::size_type v15 = __str->__r_.__value_.__r.__words[2];
  }
  uint64_t v12 = sub_1000875D8((unsigned __int8 *)__p, a2);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  return v12;
}

void sub_100084774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100084790(void *result, unint64_t a2, char a3)
{
  uint64_t v3 = 0;
  unint64_t v4 = (1 << (4 * a3 - 4)) | a2;
  do
  {
    *((unsigned char *)result + v3 + 47) = a0123456789abcd[a2 & 0xF];
    a2 >>= 4;
    --v3;
    BOOL v5 = v4 > 0xF;
    v4 >>= 4;
  }
  while (v5);
  char *result = (char *)result + v3 + 48;
  result[1] = -v3;
  return result;
}

void sub_1000847EC(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a3, *(void *)(a2 + 8) + *(void *)(a1 + 8), 0);
  if ((a3->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned __int8 v6 = a3;
  }
  else {
    unsigned __int8 v6 = (std::string *)a3->__r_.__value_.__r.__words[0];
  }
  size_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    memcpy(v6, *(const void **)a1, v7);
    uint64_t v8 = (char *)v6 + *(void *)(a1 + 8);
  }
  else
  {
    uint64_t v8 = (char *)v6;
  }
  size_t v9 = *(void *)(a2 + 8);
  if (v9)
  {
    memcpy(v8, *(const void **)a2, v9);
    v8 += *(void *)(a2 + 8);
  }
  std::string::size_type size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a3->__r_.__value_.__l.__size_;
  }
  if (v8 != (char *)v6 + size)
  {
    sub_100051E5C((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1477);
    uint64_t v11 = sub_100051E74(v13, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v12, (const char **)&v11->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v13);
  }
}

void sub_1000848F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

void sub_100084924(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a4, *(void *)(a2 + 8) + *(void *)(a1 + 8) + *(void *)(a3 + 8), 0);
  if ((a4->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = (std::string *)a4->__r_.__value_.__r.__words[0];
  }
  size_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    memcpy(v8, *(const void **)a1, v9);
    int v10 = (char *)v8 + *(void *)(a1 + 8);
  }
  else
  {
    int v10 = (char *)v8;
  }
  size_t v11 = *(void *)(a2 + 8);
  if (v11)
  {
    memcpy(v10, *(const void **)a2, v11);
    v10 += *(void *)(a2 + 8);
  }
  size_t v12 = *(void *)(a3 + 8);
  if (v12)
  {
    memcpy(v10, *(const void **)a3, v12);
    v10 += *(void *)(a3 + 8);
  }
  std::string::size_type size = HIBYTE(a4->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  if (v10 != (char *)v8 + size)
  {
    sub_100051E5C((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1487);
    uint64_t v14 = sub_100051E74(v16, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v15, (const char **)&v14->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v16);
  }
}

void sub_100084A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

char *sub_100084A8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = 0;
  std::string::resize((std::string *)a5, *(void *)(a2 + 8) + *(void *)(a1 + 8) + *(void *)(a3 + 8) + *(void *)(a4 + 8), 0);
  if (*(char *)(a5 + 23) >= 0) {
    int v10 = (char *)a5;
  }
  else {
    int v10 = *(char **)a5;
  }
  uint64_t result = sub_100084BBC(v10, a1, a2, a3, a4);
  uint64_t v12 = *(unsigned __int8 *)(a5 + 23);
  if ((v12 & 0x80u) != 0) {
    uint64_t v12 = *(void *)(a5 + 8);
  }
  if (result != &v10[v12])
  {
    sub_100051E5C((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1497);
    int v13 = sub_100051E74(v15, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
    return (char *)sub_100051FB8((uint64_t)v15);
  }
  return result;
}

void sub_100084B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

char *sub_100084BBC(char *__dst, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __dst;
  size_t v9 = *(void *)(a2 + 8);
  if (v9)
  {
    memcpy(__dst, *(const void **)a2, v9);
    v8 += *(void *)(a2 + 8);
  }
  size_t v11 = *(void *)(a3 + 8);
  if (v11)
  {
    memcpy(v8, *(const void **)a3, v11);
    v8 += *(void *)(a3 + 8);
  }
  size_t v12 = *(void *)(a4 + 8);
  if (v12)
  {
    memcpy(v8, *(const void **)a4, v12);
    v8 += *(void *)(a4 + 8);
  }
  size_t v13 = *(void *)(a5 + 8);
  if (v13)
  {
    memcpy(v8, *(const void **)a5, v13);
    v8 += *(void *)(a5 + 8);
  }
  return v8;
}

char *sub_100084C70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  std::string::resize((std::string *)a6, *(void *)(a2 + 8) + *(void *)(a1 + 8) + *(void *)(a3 + 8) + *(void *)(a4 + 8) + *(void *)(a5 + 8), 0);
  if (*(char *)(a6 + 23) >= 0) {
    size_t v12 = (char *)a6;
  }
  else {
    size_t v12 = *(char **)a6;
  }
  uint64_t result = sub_100084BBC(v12, a1, a2, a3, a4);
  char v14 = result;
  size_t v15 = *(void *)(a5 + 8);
  if (v15)
  {
    uint64_t result = (char *)memcpy(result, *(const void **)a5, v15);
    v14 += *(void *)(a5 + 8);
  }
  uint64_t v16 = *(unsigned __int8 *)(a6 + 23);
  if ((v16 & 0x80u) != 0) {
    uint64_t v16 = *(void *)(a6 + 8);
  }
  if (v14 != &v12[v16])
  {
    sub_100051E5C((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1508);
    char v17 = sub_100051E74(v19, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    return (char *)sub_100051FB8((uint64_t)v19);
  }
  return result;
}

void sub_100084DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

char *sub_100084DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  std::string::resize((std::string *)a7, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8), 0);
  if (*(char *)(a7 + 23) >= 0) {
    char v14 = (char *)a7;
  }
  else {
    char v14 = *(char **)a7;
  }
  uint64_t result = sub_100084BBC(v14, a1, a2, a3, a4);
  uint64_t v16 = result;
  size_t v17 = *(void *)(a5 + 8);
  if (v17)
  {
    uint64_t result = (char *)memcpy(result, *(const void **)a5, v17);
    v16 += *(void *)(a5 + 8);
  }
  size_t v18 = *(void *)(a6 + 8);
  if (v18)
  {
    uint64_t result = (char *)memcpy(v16, *(const void **)a6, v18);
    v16 += *(void *)(a6 + 8);
  }
  uint64_t v19 = *(unsigned __int8 *)(a7 + 23);
  if ((v19 & 0x80u) != 0) {
    uint64_t v19 = *(void *)(a7 + 8);
  }
  if (v16 != &v14[v19])
  {
    sub_100051E5C((uint64_t)v22, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1520);
    char v20 = sub_100051E74(v22, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v21, (const char **)&v20->__r_.__value_.__l.__data_);
    return (char *)sub_100051FB8((uint64_t)v22);
  }
  return result;
}

void sub_100084F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

char *sub_100084F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(void *)a8 = 0;
  *(void *)(a8 + 8) = 0;
  *(void *)(a8 + 16) = 0;
  std::string::resize((std::string *)a8, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8)+ *(void *)(a7 + 8), 0);
  if (*(char *)(a8 + 23) >= 0) {
    uint64_t v16 = (char *)a8;
  }
  else {
    uint64_t v16 = *(char **)a8;
  }
  uint64_t result = sub_100084BBC(v16, a1, a2, a3, a4);
  size_t v18 = result;
  size_t v19 = *(void *)(a5 + 8);
  if (v19)
  {
    uint64_t result = (char *)memcpy(result, *(const void **)a5, v19);
    v18 += *(void *)(a5 + 8);
  }
  size_t v20 = *(void *)(a6 + 8);
  if (v20)
  {
    uint64_t result = (char *)memcpy(v18, *(const void **)a6, v20);
    v18 += *(void *)(a6 + 8);
  }
  size_t v21 = *(void *)(a7 + 8);
  if (v21)
  {
    uint64_t result = (char *)memcpy(v18, *(const void **)a7, v21);
    v18 += *(void *)(a7 + 8);
  }
  uint64_t v22 = *(unsigned __int8 *)(a8 + 23);
  if ((v22 & 0x80u) != 0) {
    uint64_t v22 = *(void *)(a8 + 8);
  }
  if (v18 != &v16[v22])
  {
    sub_100051E5C((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1534);
    int v23 = sub_100051E74(v25, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v24, (const char **)&v23->__r_.__value_.__l.__data_);
    return (char *)sub_100051FB8((uint64_t)v25);
  }
  return result;
}

void sub_1000850E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

char *sub_10008511C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(void *)a9 = 0;
  *(void *)(a9 + 8) = 0;
  *(void *)(a9 + 16) = 0;
  std::string::resize((std::string *)a9, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8)+ *(void *)(a7 + 8)+ *(void *)(a8 + 8), 0);
  if (*(char *)(a9 + 23) >= 0) {
    size_t v18 = (char *)a9;
  }
  else {
    size_t v18 = *(char **)a9;
  }
  size_t v19 = sub_100084BBC(v18, a1, a2, a3, a4);
  uint64_t result = sub_100084BBC(v19, a5, a6, a7, a8);
  uint64_t v21 = *(unsigned __int8 *)(a9 + 23);
  if ((v21 & 0x80u) != 0) {
    uint64_t v21 = *(void *)(a9 + 8);
  }
  if (result != &v18[v21])
  {
    sub_100051E5C((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1547);
    uint64_t v22 = sub_100051E74(v24, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v23, (const char **)&v22->__r_.__value_.__l.__data_);
    return (char *)sub_100051FB8((uint64_t)v24);
  }
  return result;
}

void sub_10008526C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

char *sub_1000852A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  *(void *)a9 = 0;
  *(void *)(a9 + 8) = 0;
  *(void *)(a9 + 16) = 0;
  std::string::resize((std::string *)a9, *(void *)(a2 + 8)+ *(void *)(a1 + 8)+ *(void *)(a3 + 8)+ *(void *)(a4 + 8)+ *(void *)(a5 + 8)+ *(void *)(a6 + 8)+ *(void *)(a7 + 8)+ *(void *)(a8 + 8)+ *(void *)(a10 + 8), 0);
  if (*(char *)(a9 + 23) >= 0) {
    size_t v18 = (char *)a9;
  }
  else {
    size_t v18 = *(char **)a9;
  }
  size_t v19 = sub_100084BBC(v18, a1, a2, a3, a4);
  uint64_t result = sub_100084BBC(v19, a5, a6, a7, a8);
  uint64_t v21 = result;
  size_t v22 = *(void *)(a10 + 8);
  if (v22)
  {
    uint64_t result = (char *)memcpy(result, *(const void **)a10, v22);
    v21 += *(void *)(a10 + 8);
  }
  uint64_t v23 = *(unsigned __int8 *)(a9 + 23);
  if ((v23 & 0x80u) != 0) {
    uint64_t v23 = *(void *)(a9 + 8);
  }
  if (v21 != &v18[v23])
  {
    sub_100051E5C((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1561);
    char v24 = sub_100051E74(v27, "CHECK failed: (out) == (begin + result.size()): ");
    sub_100051FB0((uint64_t)&v26, (const char **)&v24->__r_.__value_.__l.__data_);
    return (char *)sub_100051FB8((uint64_t)v27);
  }
  return result;
}

void sub_10008541C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  if (*(char *)(v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  _Unwind_Resume(a1);
}

std::string *sub_100085450(std::string *this, uint64_t a2)
{
  unint64_t v4 = *(const std::string::value_type **)a2;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unsigned __int8 v6 = &v4[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    unsigned __int8 v6 = (const std::string::value_type *)(v4 - (const std::string::value_type *)this);
  }
  if ((unint64_t)v6 <= size)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1574);
    size_t v7 = sub_100051E74(v10, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v10);
    unint64_t v4 = *(const std::string::value_type **)a2;
  }
  return std::string::append(this, v4, *(void *)(a2 + 8));
}

void sub_1000854F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100085508(std::string *this, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v6 = *(unsigned char **)a2;
  int v7 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v7 < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v9 = (std::string::size_type)&v6[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = v6 - (unsigned char *)this;
  }
  if (v9 <= size)
  {
    sub_100051E5C((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1579);
    int v10 = sub_100051E74(v23, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v22, (const char **)&v10->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v23);
    LOBYTE(v7) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  size_t v11 = *(unsigned char **)a3;
  if ((v7 & 0x80) != 0)
  {
    std::string::size_type v13 = this->__r_.__value_.__l.__size_;
    std::string::size_type v12 = (std::string::size_type)&v11[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type v12 = v11 - (unsigned char *)this;
    std::string::size_type v13 = v7;
  }
  if (v12 <= v13)
  {
    sub_100051E5C((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1580);
    char v14 = sub_100051E74(v23, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v22, (const char **)&v14->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v23);
    LOBYTE(v7) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v7 & 0x80) != 0) {
    std::string::size_type v15 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v15 = v7;
  }
  std::string::resize(this, *(void *)(a2 + 8) + v15 + *(void *)(a3 + 8), 0);
  uint64_t v16 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    uint64_t v16 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  size_t v17 = (char *)v16 + v15;
  size_t v18 = *(void *)(a2 + 8);
  if (v18)
  {
    memcpy(v17, *(const void **)a2, v18);
    v17 += *(void *)(a2 + 8);
  }
  size_t v19 = *(void *)(a3 + 8);
  if (v19)
  {
    memcpy(v17, *(const void **)a3, v19);
    v17 += *(void *)(a3 + 8);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type v20 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v20 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (v17 != (char *)v16 + v20)
  {
    sub_100051E5C((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1585);
    uint64_t v21 = sub_100051E74(v23, "CHECK failed: (out) == (begin + result->size()): ");
    sub_100051FB0((uint64_t)&v22, (const char **)&v21->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v23);
  }
}

void sub_1000856EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100085714(std::string *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(unsigned char **)a2;
  int v9 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v9 < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v11 = (std::string::size_type)&v8[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v11 = v8 - (unsigned char *)this;
  }
  if (v11 <= size)
  {
    sub_100051E5C((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1590);
    std::string::size_type v12 = sub_100051E74(v30, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v29, (const char **)&v12->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v30);
    LOBYTE(v9) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  std::string::size_type v13 = *(unsigned char **)a3;
  if ((v9 & 0x80) != 0)
  {
    std::string::size_type v15 = this->__r_.__value_.__l.__size_;
    std::string::size_type v14 = (std::string::size_type)&v13[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type v14 = v13 - (unsigned char *)this;
    std::string::size_type v15 = v9;
  }
  if (v14 <= v15)
  {
    sub_100051E5C((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1591);
    uint64_t v16 = sub_100051E74(v30, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v29, (const char **)&v16->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v30);
    LOBYTE(v9) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  size_t v17 = *(unsigned char **)a4;
  if ((v9 & 0x80) != 0)
  {
    std::string::size_type v19 = this->__r_.__value_.__l.__size_;
    std::string::size_type v18 = (std::string::size_type)&v17[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    std::string::size_type v18 = v17 - (unsigned char *)this;
    std::string::size_type v19 = v9;
  }
  if (v18 <= v19)
  {
    sub_100051E5C((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1592);
    std::string::size_type v20 = sub_100051E74(v30, "CHECK failed: (uintptr_t((c).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v29, (const char **)&v20->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v30);
    LOBYTE(v9) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v9 & 0x80) != 0) {
    std::string::size_type v21 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v21 = v9;
  }
  std::string::resize(this, *(void *)(a2 + 8) + *(void *)(a4 + 8) + v21 + *(void *)(a3 + 8), 0);
  char v22 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    char v22 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  uint64_t v23 = (char *)v22 + v21;
  size_t v24 = *(void *)(a2 + 8);
  if (v24)
  {
    memcpy(v23, *(const void **)a2, v24);
    v23 += *(void *)(a2 + 8);
  }
  size_t v25 = *(void *)(a3 + 8);
  if (v25)
  {
    memcpy(v23, *(const void **)a3, v25);
    v23 += *(void *)(a3 + 8);
  }
  size_t v26 = *(void *)(a4 + 8);
  if (v26)
  {
    memcpy(v23, *(const void **)a4, v26);
    v23 += *(void *)(a4 + 8);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type v27 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v27 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (v23 != (char *)v22 + v27)
  {
    sub_100051E5C((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1598);
    int v28 = sub_100051E74(v30, "CHECK failed: (out) == (begin + result->size()): ");
    sub_100051FB0((uint64_t)&v29, (const char **)&v28->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v30);
  }
}

void sub_100085988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_1000859B8(std::string *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = *a2;
  int v11 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v11 < 0)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type v13 = v10 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v13 = v10 - (void)this;
  }
  if (v13 <= size)
  {
    sub_100051E5C((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1603);
    std::string::size_type v14 = sub_100051E74(v33, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v32, (const char **)&v14->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v33);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  uint64_t v15 = *a3;
  if ((v11 & 0x80) != 0)
  {
    std::string::size_type v17 = this->__r_.__value_.__l.__size_;
    std::string::size_type v16 = v15 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v16 = v15 - (void)this;
    std::string::size_type v17 = v11;
  }
  if (v16 <= v17)
  {
    sub_100051E5C((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1604);
    std::string::size_type v18 = sub_100051E74(v33, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v32, (const char **)&v18->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v33);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  uint64_t v19 = *a4;
  if ((v11 & 0x80) != 0)
  {
    std::string::size_type v21 = this->__r_.__value_.__l.__size_;
    std::string::size_type v20 = v19 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v20 = v19 - (void)this;
    std::string::size_type v21 = v11;
  }
  if (v20 <= v21)
  {
    sub_100051E5C((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1605);
    char v22 = sub_100051E74(v33, "CHECK failed: (uintptr_t((c).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v32, (const char **)&v22->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v33);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  uint64_t v23 = *a5;
  if ((v11 & 0x80) != 0)
  {
    std::string::size_type v25 = this->__r_.__value_.__l.__size_;
    std::string::size_type v24 = v23 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v24 = v23 - (void)this;
    std::string::size_type v25 = v11;
  }
  if (v24 <= v25)
  {
    sub_100051E5C((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1606);
    size_t v26 = sub_100051E74(v33, "CHECK failed: (uintptr_t((d).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    sub_100051FB0((uint64_t)&v32, (const char **)&v26->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v33);
    LOBYTE(v11) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v11 & 0x80) != 0) {
    std::string::size_type v27 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v27 = v11;
  }
  std::string::resize(this, a2[1] + a4[1] + a5[1] + v27 + a3[1], 0);
  int v28 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    int v28 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  uint64_t result = sub_100084BBC((char *)v28 + v27, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type v30 = this->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v30 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (result != (char *)v28 + v30)
  {
    sub_100051E5C((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1611);
    int v31 = sub_100051E74(v33, "CHECK failed: (out) == (begin + result->size()): ");
    sub_100051FB0((uint64_t)&v32, (const char **)&v31->__r_.__value_.__l.__data_);
    return (char *)sub_100051FB8((uint64_t)v33);
  }
  return result;
}

void sub_100085C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100085CA0(uint64_t a1, uint64_t a2, std::string *this)
{
  if (!this)
  {
    sub_100051E5C((uint64_t)&v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1616);
    unsigned __int8 v6 = sub_100051E74(&v24, "CHECK failed: s != nullptr: ");
    sub_100051FB0((uint64_t)&v23, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)&v24);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (!this->__r_.__value_.__l.__size_) {
      return 0;
    }
  }
  else if (!*((unsigned char *)&this->__r_.__value_.__s + 23))
  {
    return 0;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::size_type v7 = *(void *)(a1 + 8);
    if (v7)
    {
      memset(&v24, 0, sizeof(v24));
      uint64_t v8 = *(const std::string::value_type **)a1;
      goto LABEL_12;
    }
    return 0;
  }
  std::string::size_type v7 = *(unsigned __int8 *)(a1 + 23);
  if (!*(unsigned char *)(a1 + 23)) {
    return 0;
  }
  memset(&v24, 0, sizeof(v24));
  uint64_t v8 = (const std::string::value_type *)a1;
LABEL_12:
  int v9 = std::string::find(this, v8, 0, v7);
  if (v9 == -1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    int v11 = 0;
    LODWORD(v10) = 0;
    do
    {
      std::string::append(&v24, this, v11, v9 - v11);
      uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
      if ((v12 & 0x80u) == 0) {
        std::string::size_type v13 = (char *)a2;
      }
      else {
        std::string::size_type v13 = *(char **)a2;
      }
      if ((v12 & 0x80u) != 0) {
        uint64_t v12 = *(void *)(a2 + 8);
      }
      sub_100085EB4(&v24, v13, &v13[v12]);
      int v14 = *(char *)(a1 + 23);
      if (v14 >= 0) {
        std::string::size_type v15 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        std::string::size_type v15 = *(void *)(a1 + 8);
      }
      if (v14 >= 0) {
        std::string::size_type v16 = (const std::string::value_type *)a1;
      }
      else {
        std::string::size_type v16 = *(const std::string::value_type **)a1;
      }
      int v17 = v15 + v9;
      std::string::size_type v18 = (int)v15 + v9;
      int v9 = std::string::find(this, v16, v18, v15);
      uint64_t v10 = (v10 + 1);
      int v11 = v17;
    }
    while (v9 != -1);
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    std::string::append(&v24, this, v18, size - v18);
    std::string::size_type v20 = this->__r_.__value_.__r.__words[2];
    long long v21 = *(_OWORD *)&this->__r_.__value_.__l.__data_;
    *this = v24;
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v21;
    v24.__r_.__value_.__r.__words[2] = v20;
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  return v10;
}

void sub_100085E80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_100085EB4(std::string *this, char *a2, char *a3)
{
  unint64_t v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    int v14 = this;
    if ((v6 & 0x80) != 0) {
      int v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    std::string::size_type v15 = (char *)v14 + size;
    while (v4 != a3)
    {
      char v16 = *v4++;
      *v15++ = v16;
    }
    *std::string::size_type v15 = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    sub_100032010(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_10008600C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100086028(int a1, int a2)
{
  uint64_t v2 = (4 * (a1 / 3));
  if (a1 % 3)
  {
    unsigned int v3 = v2 | 3;
    int v4 = v2 + 4;
    if (a2) {
      unsigned int v3 = v2 + 4;
    }
    LODWORD(v2) = v2 | 2;
    if (a2) {
      LODWORD(v2) = v4;
    }
    if (a1 % 3 == 1) {
      uint64_t v2 = v2;
    }
    else {
      uint64_t v2 = v3;
    }
  }
  if ((int)v2 < a1) {
    sub_1000876C8();
  }
  return v2;
}

uint64_t sub_100086090(int a1)
{
  return sub_100086028(a1, 1);
}

uint64_t sub_100086098(unsigned __int8 *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  if (!a3)
  {
    if (a2 >= 4)
    {
      unsigned int v6 = 0;
      LODWORD(v26) = 0;
      while (*a1)
      {
        if (!a1[1]) {
          break;
        }
        if (!a1[2]) {
          break;
        }
        unsigned int v6 = (*(char *)(a5 + a1[1]) << 12) | (*(char *)(a5 + *a1) << 18) | (*(char *)(a5 + a1[2]) << 6) | *(char *)(a5 + a1[3]);
        if ((v6 & 0x80000000) != 0) {
          break;
        }
        LODWORD(v7) = 0;
        a2 -= 4;
        a1 += 4;
        int v8 = -1;
LABEL_75:
        int v27 = 0;
        LODWORD(v26) = v26 + 3;
        if (a2 <= 3) {
          goto LABEL_114;
        }
      }
      unsigned int v29 = a2 + 1;
      std::string::size_type v30 = a1 + 1;
      int v31 = a1 + 2;
      int v32 = a2 - 1;
      int v33 = a1 + 3;
      int v34 = a2 - 2;
      std::string::size_type v35 = a1 + 4;
      int v36 = a2;
      while (1)
      {
        uint64_t v37 = *(v30 - 1);
        int v8 = *(char *)(a5 + v37);
        if ((v8 & 0x80000000) == 0) {
          break;
        }
        a1 = v30;
        if ((v37 - 9) >= 5 && v37 != 32)
        {
          a2 = v29 - 2;
          goto LABEL_104;
        }
        ++v30;
        --v29;
        --v36;
        ++v31;
        --v32;
        ++v33;
        --v34;
        ++v35;
        if (v29 <= 4)
        {
          a2 = 3;
LABEL_104:
          int v27 = 0;
          LODWORD(v7) = v37;
          goto LABEL_114;
        }
      }
      while (1)
      {
        uint64_t v39 = *(v31 - 1);
        int v8 = *(char *)(a5 + v39);
        if ((v8 & 0x80000000) == 0) {
          break;
        }
        int v38 = v36;
        a1 = v31;
        if ((v39 - 9) < 5 || v39 == 32)
        {
          ++v31;
          --v36;
          --v32;
          ++v33;
          --v34;
          ++v35;
          if (v36 > 3) {
            continue;
          }
        }
        a2 = v38 - 2;
        int v27 = 1;
        LODWORD(v7) = v39;
        goto LABEL_114;
      }
      while (1)
      {
        uint64_t v22 = *(v33 - 1);
        int v8 = *(char *)(a5 + v22);
        if ((v8 & 0x80000000) == 0) {
          break;
        }
        int v40 = v32;
        a1 = v33;
        if ((v22 - 9) < 5 || v22 == 32)
        {
          ++v33;
          --v32;
          --v34;
          ++v35;
          if (v32 > 2) {
            continue;
          }
        }
        a2 = v40 - 2;
        int v27 = 2;
LABEL_111:
        LODWORD(v7) = v22;
        goto LABEL_114;
      }
      do
      {
        int v41 = v34;
        a1 = v35;
        uint64_t v7 = *(v35 - 1);
        int v8 = *(unsigned __int8 *)(a5 + v7);
        if ((*(char *)(a5 + v7) & 0x80000000) == 0)
        {
          a2 = v34 - 2;
          goto LABEL_75;
        }
        if ((v7 - 9) >= 5 && v7 != 32) {
          break;
        }
        ++v35;
        --v34;
      }
      while (v34 > 1);
      int v8 = (char)v8;
      a2 = v41 - 2;
      int v27 = 3;
      goto LABEL_114;
    }
LABEL_77:
    unsigned int v6 = 0;
    int v27 = 0;
    LODWORD(v26) = 0;
    goto LABEL_78;
  }
  if (a2 < 4) {
    goto LABEL_77;
  }
  uint64_t v5 = 0;
  unsigned int v6 = 0;
  while (*a1)
  {
    if (!a1[1]) {
      break;
    }
    if (!a1[2]) {
      break;
    }
    unsigned int v6 = (*(char *)(a5 + a1[1]) << 12) | (*(char *)(a5 + *a1) << 18) | (*(char *)(a5 + a1[2]) << 6) | *(char *)(a5 + a1[3]);
    if ((v6 & 0x80000000) != 0) {
      break;
    }
    LODWORD(v7) = 0;
    a2 -= 4;
    a1 += 4;
    int v8 = -1;
LABEL_37:
    uint64_t v26 = v5 + 3;
    if ((int)v5 + 3 > a4) {
      return 0xFFFFFFFFLL;
    }
    int v27 = 0;
    uint64_t v28 = a3 + v5;
    *(_WORD *)(v28 + 1) = bswap32(v6) >> 16;
    v6 >>= 16;
    *(unsigned char *)uint64_t v28 = v6;
    uint64_t v5 = v26;
    if (a2 <= 3) {
      goto LABEL_114;
    }
  }
  unsigned int v9 = a2 + 1;
  uint64_t v10 = a1 + 1;
  unint64_t v11 = a1 + 2;
  int v12 = a2 - 1;
  std::string::size_type v13 = a1 + 3;
  int v14 = a2 - 2;
  std::string::size_type v15 = a1 + 4;
  int v16 = a2;
  while (1)
  {
    a1 = v10;
    uint64_t v17 = *(v10 - 1);
    int v18 = *(unsigned __int8 *)(a5 + v17);
    if ((*(char *)(a5 + v17) & 0x80000000) == 0) {
      break;
    }
    if ((v17 - 9) >= 5 && v17 != 32)
    {
      a2 = v9 - 2;
      goto LABEL_100;
    }
    ++v10;
    --v9;
    --v16;
    ++v11;
    --v12;
    ++v13;
    --v14;
    ++v15;
    if (v9 <= 4)
    {
      a2 = 3;
LABEL_100:
      int v27 = 0;
      int v8 = (char)v18;
      LODWORD(v26) = v5;
      LODWORD(v7) = v17;
      goto LABEL_114;
    }
  }
  while (1)
  {
    a1 = v11;
    uint64_t v20 = *(v11 - 1);
    int v21 = *(unsigned __int8 *)(a5 + v20);
    if ((*(char *)(a5 + v20) & 0x80000000) == 0) {
      break;
    }
    int v19 = v16;
    if ((v20 - 9) < 5 || v20 == 32)
    {
      ++v11;
      --v16;
      --v12;
      ++v13;
      --v14;
      ++v15;
      if (v16 > 3) {
        continue;
      }
    }
    int v8 = (char)v21;
    a2 = v19 - 2;
    int v27 = 1;
    LODWORD(v26) = v5;
    LODWORD(v7) = v20;
    unsigned int v6 = *(unsigned __int8 *)(a5 + v17);
    goto LABEL_114;
  }
  unsigned int v6 = v21 | (v18 << 6);
  while (1)
  {
    a1 = v13;
    uint64_t v22 = *(v13 - 1);
    int v23 = *(unsigned __int8 *)(a5 + v22);
    if ((*(char *)(a5 + v22) & 0x80000000) == 0) {
      break;
    }
    int v24 = v12;
    if ((v22 - 9) < 5 || v22 == 32)
    {
      ++v13;
      --v12;
      --v14;
      ++v15;
      if (v12 > 2) {
        continue;
      }
    }
    int v8 = (char)v23;
    a2 = v24 - 2;
    int v27 = 2;
    LODWORD(v26) = v5;
    goto LABEL_111;
  }
  unsigned int v6 = v23 | (v6 << 6);
  do
  {
    int v25 = v14;
    a1 = v15;
    uint64_t v7 = *(v15 - 1);
    int v8 = *(unsigned __int8 *)(a5 + v7);
    if ((*(char *)(a5 + v7) & 0x80000000) == 0)
    {
      unsigned int v6 = v8 | (v6 << 6);
      a2 = v14 - 2;
      goto LABEL_37;
    }
    if ((v7 - 9) >= 5 && v7 != 32) {
      break;
    }
    ++v15;
    --v14;
  }
  while (v14 > 1);
  int v8 = (char)v8;
  a2 = v25 - 2;
  int v27 = 3;
  LODWORD(v26) = v5;
LABEL_114:
  if ((v8 & 0x80000000) == 0) {
    goto LABEL_115;
  }
  if (v7 == 61 || v7 == 46) {
    goto LABEL_124;
  }
  if (v7)
  {
    if ((v7 - 9) >= 5 && v7 != 32) {
      return 0xFFFFFFFFLL;
    }
LABEL_115:
    if (v7 != 61 && v7 != 46) {
      goto LABEL_78;
    }
LABEL_124:
    int v42 = a2 + 1;
    v43 = a1 - 1;
    goto LABEL_125;
  }
LABEL_78:
  if (a2 >= 1)
  {
LABEL_79:
    int v42 = a2;
    while (1)
    {
      v43 = a1;
      unsigned int v45 = *a1++;
      int v44 = v45;
      int v46 = *(char *)(a5 + v45);
      if ((v46 & 0x80000000) == 0)
      {
        int v48 = v46 | (v6 << 6);
        if (++v27 == 4)
        {
          if (a3)
          {
            if ((int)v26 + 3 > a4) {
              return 0xFFFFFFFFLL;
            }
            int v27 = 0;
            unsigned int v49 = v6 << 6;
            v50 = (unsigned char *)(a3 + (int)v26);
            v50[2] = v48;
            v50[1] = BYTE1(v49);
            unsigned char *v50 = BYTE2(v49);
            LODWORD(v26) = v26 + 3;
            unsigned int v6 = 0;
          }
          else
          {
            int v27 = 0;
            unsigned int v6 = 0;
            LODWORD(v26) = v26 + 3;
          }
        }
        else
        {
          unsigned int v6 = v48;
        }
        a1 = v43 + 1;
        a2 = v42 - 1;
        if (v42 < 2)
        {
LABEL_107:
          ++v43;
          --v42;
          goto LABEL_125;
        }
        goto LABEL_79;
      }
      if ((v44 - 9) >= 5)
      {
        if (v44 > 45)
        {
          if (v44 == 46 || v44 == 61) {
            goto LABEL_125;
          }
          return 0xFFFFFFFFLL;
        }
        if (v44 != 32)
        {
          if (v44) {
            return 0xFFFFFFFFLL;
          }
          goto LABEL_107;
        }
      }
      unsigned int v47 = v42--;
      if (v47 <= 1)
      {
        if (a2 >= 1) {
          int v51 = 1;
        }
        else {
          int v51 = a2;
        }
        int v42 = v51 - 1;
        ++v43;
        goto LABEL_125;
      }
    }
  }
  int v42 = a2;
  v43 = a1;
LABEL_125:
  uint64_t result = 0xFFFFFFFFLL;
  switch(v27)
  {
    case 0:
      break;
    case 1:
      return result;
    case 2:
      if (!a3) {
        goto LABEL_129;
      }
      if ((int)v26 >= a4) {
        return result;
      }
      *(unsigned char *)(a3 + (int)v26) = v6 >> 4;
LABEL_129:
      LODWORD(v26) = v26 + 1;
      int v27 = 2;
      break;
    case 3:
      if (!a3) {
        goto LABEL_134;
      }
      if ((int)v26 + 2 > a4) {
        return result;
      }
      v55 = (unsigned char *)(a3 + (int)v26);
      v55[1] = v6 >> 2;
      unsigned char *v55 = v6 >> 10;
LABEL_134:
      int v27 = 1;
      LODWORD(v26) = v26 + 2;
      break;
    default:
      sub_100051E5C((uint64_t)v61, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1930);
      v53 = sub_100051E74(v61, "This can't happen; base64 decoder state = ");
      v54 = sub_1000523B8(v53, v27);
      sub_100051FB0((uint64_t)&v60, (const char **)&v54->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v61);
      int v27 = 0;
      break;
  }
  if (v42 >= 1)
  {
    int v56 = 0;
    int v57 = v42 + 1;
    while (1)
    {
      unsigned int v58 = *v43;
      if (v58 > 0x3D) {
        return 0xFFFFFFFFLL;
      }
      if (((1 << v58) & 0x100003E00) == 0)
      {
        if (((1 << v58) & 0x2000400000000000) == 0)
        {
          if (!*v43) {
            goto LABEL_144;
          }
          return 0xFFFFFFFFLL;
        }
        ++v56;
      }
      ++v43;
      if (--v57 <= 1) {
        goto LABEL_144;
      }
    }
  }
  int v56 = 0;
LABEL_144:
  if (v56 == v27 || v56 == 0) {
    return v26;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_10008680C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100086834(unsigned __int8 *a1, int a2, uint64_t a3, int a4)
{
  return sub_100086098(a1, a2, a3, a4, (uint64_t)&unk_100092C95);
}

BOOL sub_100086840@<W0>(unsigned __int8 *a1@<X0>, int a2@<W1>, std::string *a3@<X2>, int a4@<W8>)
{
  return sub_10008684C(a3, a1, a2, (uint64_t)&unk_100092D95, a4);
}

BOOL sub_10008684C@<W0>(std::string *this@<X2>, unsigned __int8 *a2@<X0>, int a3@<W1>, uint64_t a4@<X3>, int a5@<W8>)
{
  int v9 = 3 * (a3 / 4) + a3 - (a5 & 0xFFFFFFFC);
  std::string::resize(this, v9, 0);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_)
    {
      uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v10 = this;
    if (*((unsigned char *)&this->__r_.__value_.__s + 23)) {
      goto LABEL_7;
    }
  }
  uint64_t v10 = 0;
LABEL_7:
  int v11 = sub_100086098(a2, a3, (uint64_t)v10, v9, a4);
  int v12 = v11;
  if (v11 < 0)
  {
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
  }
  else
  {
    if (v11 > v9)
    {
      sub_100051E5C((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2073);
      std::string::size_type v13 = sub_100051E74(v16, "CHECK failed: (len) <= (dest_len): ");
      sub_100051FB0((uint64_t)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v16);
    }
    std::string::erase(this, v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  return v12 >= 0;
}

void sub_100086988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_1000869A0@<W0>(unsigned __int8 *a1@<X0>, int a2@<W1>, std::string *a3@<X2>, int a4@<W8>)
{
  return sub_10008684C(a3, a1, a2, (uint64_t)&unk_100092C95, a4);
}

uint64_t sub_1000869AC(unsigned __int8 *a1, int a2, unsigned char *a3, int a4, uint64_t a5, int a6)
{
  if (a2 < 1 || 3 * a4 < 4 * a2) {
    return 0;
  }
  int v7 = (int)a3;
  int v8 = &a1[a2];
  for (i = a3; a1 < v8 - 3; i += 4)
  {
    unsigned int v10 = *(_DWORD *)a1;
    a1 += 3;
    unint64_t v11 = bswap32(v10);
    unsigned char *i = *(unsigned char *)(a5 + (v11 >> 26));
    i[1] = *(unsigned char *)(a5 + ((v11 >> 20) & 0x3F));
    i[2] = *(unsigned char *)(a5 + ((v11 >> 14) & 0x3F));
    i[3] = *(unsigned char *)(a5 + ((v11 >> 8) & 0x3F));
  }
  int v12 = v8 - a1;
  int v13 = a3 + a4 - i;
  switch(v12)
  {
    case 0:
      goto LABEL_22;
    case 1:
      if (v13 < 2) {
        return 0;
      }
      unint64_t v14 = *a1;
      unsigned char *i = *(unsigned char *)(a5 + (v14 >> 2));
      i[1] = *(unsigned char *)(a5 + 16 * (v14 & 3));
      if (!a6)
      {
        LODWORD(i) = i + 2;
        goto LABEL_22;
      }
      if (v13 < 4) {
        return 0;
      }
      *((_WORD *)i + 1) = 15677;
      goto LABEL_19;
    case 2:
      if (v13 < 3) {
        return 0;
      }
      unint64_t v17 = bswap32(*(unsigned __int16 *)a1);
      unsigned char *i = *(unsigned char *)(a5 + ((unint64_t)WORD1(v17) >> 10));
      i[1] = *(unsigned char *)(a5 + ((v17 >> 20) & 0x3F));
      i[2] = *(unsigned char *)(a5 + ((v17 >> 14) & 0x3CLL));
      if (a6)
      {
        if (v13 < 4) {
          return 0;
        }
        char v18 = 61;
LABEL_18:
        i[3] = v18;
LABEL_19:
        LODWORD(i) = i + 4;
      }
      else
      {
        LODWORD(i) = i + 3;
      }
LABEL_22:
      uint64_t result = (i - v7);
      break;
    case 3:
      if (v13 < 4) {
        return 0;
      }
      unsigned __int8 v19 = *a1;
      unint64_t v20 = bswap32(*(unsigned __int16 *)(a1 + 1));
      unsigned char *i = *(unsigned char *)(a5 + (*a1 >> 2));
      i[1] = *(unsigned char *)(a5 + ((unint64_t)(WORD1(v20) & 0xFFFCFFFF | ((v19 & 3) << 16)) >> 12));
      i[2] = *(unsigned char *)(a5 + ((v20 >> 22) & 0x3F));
      char v18 = *(unsigned char *)(a5 + ((v20 >> 16) & 0x3F));
      goto LABEL_18;
    default:
      sub_100051E5C((uint64_t)v22, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2181);
      char v15 = sub_100051E74(v22, "Logic problem? szsrc = ");
      int v16 = sub_1000523B8(v15, v12);
      sub_100051FB0((uint64_t)&v21, (const char **)&v16->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v22);
      goto LABEL_22;
  }
  return result;
}

void sub_100086BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100086BE8(unsigned __int8 *a1, int a2, unsigned char *a3, int a4)
{
  return sub_1000869AC(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", 1);
}

uint64_t sub_100086BF8(unsigned __int8 *a1, int a2, unsigned char *a3, int a4, int a5)
{
  return sub_1000869AC(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_", a5);
}

std::string *sub_100086C08(unsigned __int8 *a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  int v10 = sub_100086028(a2, a4);
  std::string::resize((std::string *)a3, v10, 0);
  if (*(char *)(a3 + 23) < 0)
  {
    uint64_t v11 = *(void *)(a3 + 8);
    if (v11) {
      int v12 = *(unsigned char **)a3;
    }
    else {
      int v12 = 0;
    }
  }
  else
  {
    LODWORD(v11) = *(unsigned __int8 *)(a3 + 23);
    if (*(unsigned char *)(a3 + 23)) {
      int v12 = (unsigned char *)a3;
    }
    else {
      int v12 = 0;
    }
  }
  int v13 = sub_1000869AC(a1, a2, v12, v11, a5, a4);
  if (v10 != v13)
  {
    sub_100051E5C((uint64_t)v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2213);
    unint64_t v14 = sub_100051E74(v17, "CHECK failed: (calc_escaped_size) == (escaped_len): ");
    sub_100051FB0((uint64_t)&v16, (const char **)&v14->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v17);
  }
  return std::string::erase((std::string *)a3, v13, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_100086D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *sub_100086D20(unsigned __int8 *a1, int a2, uint64_t a3, int a4)
{
  return sub_100086C08(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
}

std::string *sub_100086D2C(unsigned __int8 *a1, int a2, uint64_t a3, int a4)
{
  return sub_100086C08(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

std::string *sub_100086D38(unsigned __int8 *a1, int a2, uint64_t a3)
{
  return sub_100086C08(a1, a2, a3, 1, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
}

std::string *sub_100086D48(unsigned __int8 *a1, int a2, uint64_t a3)
{
  return sub_100086C08(a1, a2, a3, 0, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

std::string *sub_100086D58(unsigned __int8 *a1, int a2, uint64_t a3)
{
  return sub_100086C08(a1, a2, a3, 1, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

uint64_t sub_100086D68(unsigned int a1, void *a2)
{
  if (a1 >= 0x80)
  {
    if (HIWORD(a1)) {
      unsigned int v4 = (16 * a1) & 0x3F0000 | a1 & 0x3F | (((a1 >> 18) & 7) << 24) | (((a1 >> 6) & 0x3F) << 8) | 0xF0808080;
    }
    else {
      unsigned int v4 = (4 * (_WORD)a1) & 0x3F00 | a1 & 0x3F | ((unsigned __int16)a1 >> 12 << 16) | 0xE08080;
    }
    if (HIWORD(a1)) {
      unsigned int v5 = 4;
    }
    else {
      unsigned int v5 = 3;
    }
    BOOL v6 = a1 > 0x7FF;
    if (a1 <= 0x7FF) {
      a1 = (4 * (_WORD)a1) & 0x1F00 | a1 & 0x3F | 0xC080;
    }
    else {
      a1 = v4;
    }
    if (v6) {
      uint64_t v3 = v5;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  int v8 = sub_1000528F4(a1);
  memcpy(a2, (char *)&v8 - v3 + 4, v3);
  return v3;
}

uint64_t sub_100086E44(unsigned __int8 *a1, int a2)
{
  if (a2) {
    return byte_100092F17[*a1];
  }
  else {
    return 0;
  }
}

void sub_100086E64(uint64_t a1, std::string *this, int a3)
{
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_) {
      goto LABEL_3;
    }
  }
  else if (*((unsigned char *)&this->__r_.__value_.__s + 23))
  {
LABEL_3:
    if (*(char *)(a1 + 23) < 0) {
      sub_1000302DC(&__p, *(void **)a1, *(void *)(a1 + 8));
    }
    else {
      std::string __p = *(std::string *)a1;
    }
    sub_100086F80(&__p, a3);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(this, (const std::string::value_type *)p_p, size);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    return;
  }
  int v5 = *(char *)(a1 + 23);
  if (v5 >= 0) {
    BOOL v6 = (const std::string::value_type *)a1;
  }
  else {
    BOOL v6 = *(const std::string::value_type **)a1;
  }
  if (v5 >= 0) {
    std::string::size_type v7 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    std::string::size_type v7 = *(void *)(a1 + 8);
  }
  std::string::append(this, v6, v7);
  sub_100086F80(this, a3);
}

void sub_100086F64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100086F80(std::string *this, int a2)
{
  uint64_t v2 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    unsigned int v4 = (std::string *)this->__r_.__value_.__r.__words[0];
    int64_t size = this->__r_.__value_.__l.__size_;
  }
  else
  {
    int64_t size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    unsigned int v4 = this;
  }
  if (size < 1)
  {
    int64_t v5 = 0;
    goto LABEL_37;
  }
  int64_t v5 = 0;
  int64_t v6 = 0;
  char v7 = 0;
  do
  {
    if (v7)
    {
      int v8 = (char *)v4 + v6;
      int v9 = v4->__r_.__value_.__s.__data_[v6];
      if (v9 != 10)
      {
        if (v9 == 13)
        {
          v4->__r_.__value_.__s.__data_[v5++] = 10;
LABEL_18:
          char v7 = 1;
LABEL_27:
          ++v6;
          continue;
        }
        v4->__r_.__value_.__s.__data_[v5++] = 10;
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    int v8 = (char *)v4 + v6;
    if (v6 + 8 >= size)
    {
      LOBYTE(v10) = *v8;
LABEL_16:
      if (v10 != 10)
      {
        if (v10 == 13) {
          goto LABEL_18;
        }
LABEL_23:
        if (v6 == v5)
        {
          char v7 = 0;
          int64_t v5 = v6 + 1;
          goto LABEL_27;
        }
        char v7 = 0;
        v4->__r_.__value_.__s.__data_[v5] = *v8;
LABEL_26:
        ++v5;
        goto LABEL_27;
      }
LABEL_19:
      if (v6 != v5) {
        v4->__r_.__value_.__s.__data_[v5] = 10;
      }
      char v7 = 0;
      goto LABEL_26;
    }
    std::string::size_type v10 = *(void *)v8;
    if (((*(void *)v8 - 0xE0E0E0E0E0E0E0ELL) & ~*(void *)v8 & 0x8080808080808080) != 0) {
      goto LABEL_16;
    }
    if (v5 != v6) {
      *(std::string::size_type *)((char *)v4->__r_.__value_.__r.__words + v5) = v10;
    }
    char v7 = 0;
    v5 += 8;
    v6 += 8;
  }
  while (v6 < size);
  if ((v7 & 1) != 0 || a2 && v5 >= 1 && v4->__r_.__value_.__s.__data_[v5 - 1] != 10)
  {
    std::string::resize(this, v5 + 1, 0);
    if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0) {
      uint64_t v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
    }
    v2->__r_.__value_.__s.__data_[v5] = 10;
    return;
  }
LABEL_37:
  if (v5 < size)
  {
    std::string::resize(this, v5, 0);
  }
}

void *sub_100087128(void *a1, char *__s)
{
  *a1 = __s;
  a1[1] = 0;
  if (__s)
  {
    size_t v3 = strlen(__s);
    size_t v4 = v3;
    if ((v3 & 0x8000000000000000) != 0) {
      sub_1000803D4(v3, "size_t to int conversion");
    }
    a1[1] = v4;
  }
  return a1;
}

uint64_t **sub_100087178(uint64_t **a1, long long *a2)
{
  size_t v4 = *a1;
  unint64_t v5 = (*a1)[1];
  int64_t v6 = *a1;
  unint64_t v9 = v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if (v5 >= v9)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *v4) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004204();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v4) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x555555555555555) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v15 = v13;
    }
    v20[4] = v7;
    if (v15) {
      char v16 = (char *)sub_10000D200(v7, v15);
    }
    else {
      char v16 = 0;
    }
    unint64_t v17 = &v16[24 * v12];
    v20[0] = v16;
    v20[1] = v17;
    v20[3] = &v16[24 * v15];
    long long v18 = *a2;
    *((void *)v17 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v17 = v18;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    std::string v20[2] = v17 + 24;
    sub_10000D788(v4, v20);
    uint64_t v11 = v4[1];
    sub_10000D920((uint64_t)v20);
  }
  else
  {
    long long v10 = *a2;
    *(void *)(v5 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v5 = v10;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    uint64_t v11 = v5 + 24;
    v4[1] = v5 + 24;
  }
  v4[1] = v11;
  return a1;
}

void sub_1000872AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000D920((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000872C0(unsigned __int8 *a1, int *a2)
{
  if ((char)a1[23] < 0)
  {
    size_t v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    int v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    int v4 = 0;
    unint64_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 214748364 || (int v7 = 10 * v4, v7 > -2147483601 - v6))
      {
        uint64_t result = 0;
        int v4 = 0x7FFFFFFF;
        goto LABEL_15;
      }
      int v4 = v7 + v6 - 48;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t sub_10008735C(unsigned __int8 *a1, int *a2)
{
  int v2 = (char)a1[23];
  BOOL v3 = v2 < 0;
  if (v2 >= 0) {
    int v4 = a1;
  }
  else {
    int v4 = *(unsigned __int8 **)a1;
  }
  if (v3) {
    uint64_t v5 = *((void *)a1 + 1);
  }
  else {
    uint64_t v5 = a1[23];
  }
  if (v5 < 1)
  {
    int v6 = 0;
LABEL_15:
    uint64_t result = 1;
  }
  else
  {
    int v6 = 0;
    int v7 = &v4[v5];
    while (1)
    {
      int v8 = *v4;
      if ((v8 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v6 < -214748364 || (int v9 = 10 * v6, v9 < v8 + 2147483600))
      {
        uint64_t result = 0;
        int v6 = 0x80000000;
        goto LABEL_18;
      }
      int v6 = v9 - v8 + 48;
      if (++v4 >= v7) {
        goto LABEL_15;
      }
    }
    uint64_t result = 0;
  }
LABEL_18:
  *a2 = v6;
  return result;
}

uint64_t sub_1000873FC(unsigned __int8 *a1, unsigned int *a2)
{
  if ((char)a1[23] < 0)
  {
    BOOL v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    unsigned int v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    unsigned int v4 = 0;
    uint64_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 0x19999999 || (unsigned int v7 = 10 * v4, v7 > 47 - v6))
      {
        uint64_t result = 0;
        unsigned int v4 = -1;
        goto LABEL_15;
      }
      unsigned int v4 = v7 + v6 - 48;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t sub_100087494(unsigned __int8 *a1, uint64_t *a2)
{
  if ((char)a1[23] < 0)
  {
    BOOL v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    uint64_t v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 0xCCCCCCCCCCCCCCCLL || (uint64_t v7 = 10 * v4, v8 = (v6 - 48), v7 > (v8 ^ 0x7FFFFFFFFFFFFFFFLL)))
      {
        uint64_t result = 0;
        uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_15;
      }
      uint64_t v4 = v8 + v7;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t sub_100087530(unsigned __int8 *a1, int64_t *a2)
{
  int v2 = (char)a1[23];
  BOOL v3 = v2 < 0;
  if (v2 >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(unsigned __int8 **)a1;
  }
  if (v3) {
    uint64_t v5 = *((void *)a1 + 1);
  }
  else {
    uint64_t v5 = a1[23];
  }
  if (v5 < 1)
  {
    int64_t v6 = 0;
LABEL_15:
    uint64_t result = 1;
  }
  else
  {
    int64_t v6 = 0;
    uint64_t v7 = &v4[v5];
    while (1)
    {
      int v8 = *v4;
      if ((v8 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v6 < (uint64_t)0xF333333333333334
        || (unsigned int v9 = v8 - 48, v10 = 10 * v6, v10 < (uint64_t)(v9 | 0x8000000000000000)))
      {
        uint64_t result = 0;
        int64_t v6 = 0x8000000000000000;
        goto LABEL_18;
      }
      int64_t v6 = v10 - v9;
      if (++v4 >= v7) {
        goto LABEL_15;
      }
    }
    uint64_t result = 0;
  }
LABEL_18:
  *a2 = v6;
  return result;
}

uint64_t sub_1000875D8(unsigned __int8 *a1, unint64_t *a2)
{
  if ((char)a1[23] < 0)
  {
    BOOL v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    uint64_t v2 = *((void *)v3 + 1);
  }
  else
  {
    uint64_t v2 = a1[23];
  }
  if (v2 < 1)
  {
    unint64_t v4 = 0;
LABEL_12:
    uint64_t result = 1;
  }
  else
  {
    unint64_t v4 = 0;
    uint64_t v5 = &a1[v2];
    while (1)
    {
      int v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6) {
        break;
      }
      if (v4 > 0x1999999999999999 || (unsigned int v7 = v6 - 48, v8 = 10 * v4, __CFADD__(v8, v7)))
      {
        uint64_t result = 0;
        unint64_t v4 = -1;
        goto LABEL_15;
      }
      unint64_t v4 = v7 + v8;
      if (++a1 >= v5) {
        goto LABEL_12;
      }
    }
    uint64_t result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

void sub_100087670()
{
  __assert_rtn("operator[]", "stringpiece.h", 276, "0 <= i");
}

void sub_10008769C()
{
}

void sub_1000876C8()
{
  __assert_rtn("CalculateBase64EscapedLen", "strutil.cc", 1683, "len >= input_len");
}

uint64_t sub_1000876F4(uint64_t a1, unsigned int a2)
{
  if (a2 < 8) {
    return 0;
  }
  uint64_t result = 0;
  switch(a2 & 7)
  {
    case 0u:
      uint64_t v5 = *(char **)a1;
      if (*(void *)a1 < *(void *)(a1 + 8) && (*v5 & 0x80000000) == 0)
      {
        uint64_t v6 = (uint64_t)(v5 + 1);
        goto LABEL_24;
      }
      sub_10004FE4C(a1);
      return v14 & 1;
    case 1u:
      uint64_t v17 = 0;
      if ((int)(*(_DWORD *)(a1 + 8) - *(void *)a1) >= 8)
      {
        uint64_t v6 = *(void *)a1 + 8;
        goto LABEL_24;
      }
      return sub_10004FD8C(a1, &v17);
    case 2u:
      uint64_t v8 = *(char **)a1;
      unint64_t v7 = *(void *)(a1 + 8);
      if (*(void *)a1 >= v7)
      {
        int v9 = 0;
      }
      else
      {
        int v9 = *v8;
        if ((*v8 & 0x80000000) == 0)
        {
          uint64_t v10 = (uint64_t)(v8 + 1);
          *(void *)a1 = v10;
          goto LABEL_12;
        }
      }
      uint64_t v15 = sub_100050114((uint64_t *)a1, v9);
      if ((v15 & 0x8000000080000000) != 0) {
        return 0;
      }
      int v9 = v15;
      uint64_t v10 = *(void *)a1;
      unint64_t v7 = *(void *)(a1 + 8);
LABEL_12:
      if (v9 <= (int)v7 - (int)v10)
      {
        uint64_t v6 = v10 + v9;
        goto LABEL_24;
      }
      return sub_10004F6C0(a1, v9, (int)v7 - (int)v10);
    case 3u:
      int v11 = *(_DWORD *)(a1 + 52);
      BOOL v12 = __OFSUB__(v11--, 1);
      *(_DWORD *)(a1 + 52) = v11;
      if (v11 < 0 != v12) {
        return 0;
      }
      uint64_t result = sub_1000878C8((char **)a1);
      if (result)
      {
        int v13 = *(_DWORD *)(a1 + 52);
        if (v13 < *(_DWORD *)(a1 + 56)) {
          *(_DWORD *)(a1 + 52) = v13 + 1;
        }
        return *(_DWORD *)(a1 + 32) == (a2 & 0xFFFFFFF8 | 4);
      }
      return result;
    case 5u:
      int v16 = 0;
      if ((int)(*(_DWORD *)(a1 + 8) - *(void *)a1) < 4) {
        return sub_10004FD24(a1, &v16);
      }
      uint64_t v6 = *(void *)a1 + 4;
LABEL_24:
      *(void *)a1 = v6;
      return 1;
    default:
      return result;
  }
}

uint64_t sub_1000878C8(char **a1)
{
  do
  {
    uint64_t v2 = *a1;
    if (*a1 >= a1[1])
    {
      int v3 = 0;
    }
    else
    {
      int v3 = *v2;
      if ((*v2 & 0x80000000) == 0)
      {
        *a1 = v2 + 1;
        goto LABEL_6;
      }
    }
    int v3 = sub_1000506B8((uint64_t *)a1, v3);
LABEL_6:
    *((_DWORD *)a1 + 8) = v3;
    if (v3) {
      BOOL v4 = (v3 & 7) == 4;
    }
    else {
      BOOL v4 = 1;
    }
    uint64_t v5 = v4;
  }
  while (!v4 && (sub_1000876F4(a1) & 1) != 0);
  return v5;
}

BOOL sub_100087944(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2 < 8) {
    return 0;
  }
  BOOL v3 = 0;
  switch(a2 & 7)
  {
    case 0u:
      unint64_t v7 = *(char **)a1;
      if (*(void *)a1 >= *(void *)(a1 + 8) || *v7 < 0)
      {
        unint64_t v22 = sub_10004FE4C(a1);
        if ((v23 & 1) == 0) {
          return 0;
        }
        unint64_t v8 = v22;
      }
      else
      {
        unint64_t v8 = *v7;
        *(void *)a1 = v7 + 1;
      }
      int v24 = *(char **)(a3 + 64);
      if (*(void *)a3 <= (unint64_t)v24) {
        int v24 = sub_100051170(a3, v24);
      }
      if (a2 > 0x7F)
      {
        *int v24 = a2 | 0x80;
        unsigned int v26 = a2 >> 7;
        if (a2 >> 14)
        {
          int v25 = v24 + 2;
          do
          {
            *(v25 - 1) = v26 | 0x80;
            unsigned int v39 = v26 >> 7;
            ++v25;
            unsigned int v40 = v26 >> 14;
            v26 >>= 7;
          }
          while (v40);
          *(v25 - 1) = v39;
        }
        else
        {
          v24[1] = v26;
          int v25 = v24 + 2;
        }
      }
      else
      {
        *int v24 = a2;
        int v25 = v24 + 1;
      }
      *(void *)(a3 + 64) = v25;
      if (*(void *)a3 <= (unint64_t)v25) {
        int v25 = sub_100051170(a3, v25);
      }
      if (v8 > 0x7F)
      {
        *int v25 = v8 | 0x80;
        unint64_t v41 = v8 >> 7;
        if (v8 >> 14)
        {
          std::string::size_type v35 = v25 + 2;
          do
          {
            *(v35 - 1) = v41 | 0x80;
            unint64_t v42 = v41 >> 7;
            ++v35;
            unint64_t v43 = v41 >> 14;
            v41 >>= 7;
          }
          while (v43);
          *(v35 - 1) = v42;
        }
        else
        {
          v25[1] = v41;
          std::string::size_type v35 = v25 + 2;
        }
      }
      else
      {
        *int v25 = v8;
        std::string::size_type v35 = v25 + 1;
      }
      goto LABEL_72;
    case 1u:
      __p.__r_.__value_.__r.__words[0] = 0;
      int v9 = *(std::string::size_type **)a1;
      if ((int)(*(_DWORD *)(a1 + 8) - *(void *)a1) < 8)
      {
        if (!sub_10004FD8C(a1, &__p)) {
          return 0;
        }
      }
      else
      {
        __p.__r_.__value_.__r.__words[0] = *v9;
        *(void *)a1 = v9 + 1;
      }
      uint64_t v10 = *(char **)(a3 + 64);
      if (*(void *)a3 <= (unint64_t)v10) {
        uint64_t v10 = sub_100051170(a3, v10);
      }
      if (a2 > 0x7F)
      {
        char *v10 = a2 | 0x80;
        unsigned int v20 = a2 >> 7;
        if (a2 >> 14)
        {
          int v11 = v10 + 2;
          do
          {
            *(v11 - 1) = v20 | 0x80;
            unsigned int v32 = v20 >> 7;
            ++v11;
            unsigned int v33 = v20 >> 14;
            v20 >>= 7;
          }
          while (v33);
          *(v11 - 1) = v32;
        }
        else
        {
          v10[1] = v20;
          int v11 = v10 + 2;
        }
      }
      else
      {
        char *v10 = a2;
        int v11 = v10 + 1;
      }
      *(void *)(a3 + 64) = v11;
      std::string::size_type v34 = __p.__r_.__value_.__r.__words[0];
      if (*(void *)a3 <= (unint64_t)v11) {
        int v11 = sub_100051170(a3, v11);
      }
      *(void *)int v11 = v34;
      std::string::size_type v35 = v11 + 8;
      goto LABEL_72;
    case 2u:
      BOOL v12 = *(char **)a1;
      if (*(void *)a1 >= *(void *)(a1 + 8))
      {
        LODWORD(v13) = 0;
      }
      else
      {
        uint64_t v13 = *v12;
        if ((*v12 & 0x80000000) == 0)
        {
          *(void *)a1 = v12 + 1;
          goto LABEL_78;
        }
      }
      uint64_t v13 = sub_100050114((uint64_t *)a1, v13);
      if (v13 < 0) {
        return 0;
      }
LABEL_78:
      unsigned int v45 = *(char **)(a3 + 64);
      if (*(void *)a3 <= (unint64_t)v45)
      {
        uint64_t v59 = v13;
        char v60 = sub_100051170(a3, v45);
        uint64_t v13 = v59;
        unsigned int v45 = v60;
      }
      if (a2 > 0x7F)
      {
        *unsigned int v45 = a2 | 0x80;
        unsigned int v47 = a2 >> 7;
        if (a2 >> 14)
        {
          int v46 = v45 + 2;
          do
          {
            *(v46 - 1) = v47 | 0x80;
            unsigned int v48 = v47 >> 7;
            ++v46;
            unsigned int v49 = v47 >> 14;
            v47 >>= 7;
          }
          while (v49);
          *(v46 - 1) = v48;
        }
        else
        {
          v45[1] = v47;
          int v46 = v45 + 2;
        }
      }
      else
      {
        *unsigned int v45 = a2;
        int v46 = v45 + 1;
      }
      *(void *)(a3 + 64) = v46;
      if (*(void *)a3 <= (unint64_t)v46)
      {
        uint64_t v61 = v13;
        v62 = sub_100051170(a3, v46);
        uint64_t v13 = v61;
        int v46 = v62;
      }
      if (v13 > 0x7F)
      {
        *int v46 = v13 | 0x80;
        unsigned int v51 = v13 >> 7;
        if (v13 >> 14)
        {
          v50 = v46 + 2;
          do
          {
            *(v50 - 1) = v51 | 0x80;
            unsigned int v52 = v51 >> 7;
            ++v50;
            unsigned int v53 = v51 >> 14;
            v51 >>= 7;
          }
          while (v53);
          *(v50 - 1) = v52;
        }
        else
        {
          v46[1] = v51;
          v50 = v46 + 2;
        }
      }
      else
      {
        *int v46 = v13;
        v50 = v46 + 1;
      }
      *(void *)(a3 + 64) = v50;
      memset(&__p, 0, sizeof(__p));
      BOOL v3 = sub_10004FAE8(a1, &__p, v13);
      if (v3)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int v55 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          int v55 = __p.__r_.__value_.__r.__words[1];
        }
        uint64_t v56 = *(void *)(a3 + 64);
        if (*(void *)a3 - v56 < v55)
        {
          unsigned int v58 = sub_100051284((uint64_t *)a3, (char *)p_p, v55, *(void *)(a3 + 64));
        }
        else
        {
          uint64_t v57 = v55;
          memcpy(*(void **)(a3 + 64), p_p, v55);
          unsigned int v58 = (char *)(v56 + v57);
        }
        *(void *)(a3 + 64) = v58;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      return v3;
    case 3u:
      char v14 = *(char **)(a3 + 64);
      if (*(void *)a3 <= (unint64_t)v14) {
        char v14 = sub_100051170(a3, v14);
      }
      if (a2 > 0x7F)
      {
        *char v14 = a2 | 0x80;
        unsigned int v19 = a2 >> 7;
        if (a2 >> 14)
        {
          uint64_t v15 = v14 + 2;
          do
          {
            *(v15 - 1) = v19 | 0x80;
            unsigned int v27 = v19 >> 7;
            ++v15;
            unsigned int v28 = v19 >> 14;
            v19 >>= 7;
          }
          while (v28);
          *(v15 - 1) = v27;
        }
        else
        {
          v14[1] = v19;
          uint64_t v15 = v14 + 2;
        }
      }
      else
      {
        *char v14 = a2;
        uint64_t v15 = v14 + 1;
      }
      *(void *)(a3 + 64) = v15;
      int v29 = *(_DWORD *)(a1 + 52);
      BOOL v30 = __OFSUB__(v29--, 1);
      *(_DWORD *)(a1 + 52) = v29;
      if (v29 < 0 != v30 || !sub_100087F4C((char **)a1, (void *)a3)) {
        return 0;
      }
      int v31 = *(_DWORD *)(a1 + 52);
      if (v31 < *(_DWORD *)(a1 + 56)) {
        *(_DWORD *)(a1 + 52) = v31 + 1;
      }
      return *(_DWORD *)(a1 + 32) == (a2 & 0xFFFFFFF8 | 4);
    case 5u:
      LODWORD(__p.__r_.__value_.__l.__data_) = 0;
      int v16 = *(std::string::size_type **)a1;
      if ((int)(*(_DWORD *)(a1 + 8) - *(void *)a1) < 4)
      {
        if (!sub_10004FD24(a1, &__p)) {
          return 0;
        }
      }
      else
      {
        LODWORD(__p.__r_.__value_.__l.__data_) = *(_DWORD *)v16;
        *(void *)a1 = (char *)v16 + 4;
      }
      uint64_t v17 = *(char **)(a3 + 64);
      if (*(void *)a3 <= (unint64_t)v17) {
        uint64_t v17 = sub_100051170(a3, v17);
      }
      if (a2 > 0x7F)
      {
        *uint64_t v17 = a2 | 0x80;
        unsigned int v21 = a2 >> 7;
        if (a2 >> 14)
        {
          long long v18 = v17 + 2;
          do
          {
            *(v18 - 1) = v21 | 0x80;
            unsigned int v36 = v21 >> 7;
            ++v18;
            unsigned int v37 = v21 >> 14;
            v21 >>= 7;
          }
          while (v37);
          *(v18 - 1) = v36;
        }
        else
        {
          v17[1] = v21;
          long long v18 = v17 + 2;
        }
      }
      else
      {
        *uint64_t v17 = a2;
        long long v18 = v17 + 1;
      }
      *(void *)(a3 + 64) = v18;
      int data = (int)__p.__r_.__value_.__l.__data_;
      if (*(void *)a3 <= (unint64_t)v18) {
        long long v18 = sub_100051170(a3, v18);
      }
      *(_DWORD *)long long v18 = data;
      std::string::size_type v35 = v18 + 4;
LABEL_72:
      *(void *)(a3 + 64) = v35;
      BOOL v3 = 1;
      break;
    default:
      return v3;
  }
  return v3;
}

void sub_100087F18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100087F4C(char **a1, void *a2)
{
  while (1)
  {
    BOOL v4 = *a1;
    if (*a1 >= a1[1])
    {
      unsigned int v5 = 0;
    }
    else
    {
      unsigned int v5 = *v4;
      if ((*v4 & 0x80000000) == 0)
      {
        *a1 = v4 + 1;
        goto LABEL_6;
      }
    }
    unsigned int v5 = sub_1000506B8((uint64_t *)a1, v5);
LABEL_6:
    *((_DWORD *)a1 + 8) = v5;
    BOOL v6 = v5 == 0;
    if (!v5) {
      return v6;
    }
    if ((v5 & 7) == 4) {
      break;
    }
    if ((sub_100087944((int)a1) & 1) == 0) {
      return v6;
    }
  }
  unint64_t v7 = (char *)a2[8];
  if (*a2 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170((uint64_t)a2, v7);
  }
  if (v5 > 0x7F)
  {
    *unint64_t v7 = v5 | 0x80;
    unsigned int v9 = v5 >> 7;
    if (v5 >> 14)
    {
      unint64_t v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unint64_t v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v5;
    unint64_t v8 = v7 + 1;
  }
  a2[8] = v8;
  return 1;
}

uint64_t sub_100088064(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return sub_1000876F4(a2, a3);
}

uint64_t sub_100088070(uint64_t a1, char **a2)
{
  return sub_1000878C8(a2);
}

BOOL sub_10008807C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return sub_100087944(a2, a3, *(void *)(a1 + 8));
}

BOOL sub_100088090(uint64_t a1, char **a2)
{
  return sub_100087F4C(a2, *(void **)(a1 + 8));
}

char *sub_1000880A0(char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v5 = result;
  BOOL v6 = (void *)*((void *)result + 1);
  unint64_t v7 = (char *)v6[8];
  if (*v6 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170(*((void *)result + 1), v7);
    unint64_t v7 = result;
  }
  if (a2 > 0x7F)
  {
    *unint64_t v7 = a2 | 0x80;
    unsigned int v9 = a2 >> 7;
    if (a2 >> 14)
    {
      unint64_t v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unint64_t v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = a2;
    unint64_t v8 = v7 + 1;
  }
  v6[8] = v8;
  BOOL v12 = (void *)*((void *)v5 + 1);
  uint64_t v13 = (char *)v12[8];
  if (*v12 <= (unint64_t)v13)
  {
    uint64_t result = sub_100051170((uint64_t)v12, v13);
    uint64_t v13 = result;
  }
  if (a3 > 0x7F)
  {
    *uint64_t v13 = a3 | 0x80;
    unint64_t v15 = (unint64_t)(int)a3 >> 7;
    if (a3 >> 14)
    {
      char v14 = v13 + 2;
      do
      {
        *(v14 - 1) = v15 | 0x80;
        unint64_t v16 = v15 >> 7;
        ++v14;
        unint64_t v17 = v15 >> 14;
        v15 >>= 7;
      }
      while (v17);
      *(v14 - 1) = v16;
    }
    else
    {
      v13[1] = v15;
      char v14 = v13 + 2;
    }
  }
  else
  {
    *uint64_t v13 = a3;
    char v14 = v13 + 1;
  }
  v12[8] = v14;
  return result;
}

uint64_t sub_1000881CC(uint64_t *a1, unsigned int a2, unsigned int (*a3)(uint64_t), uint64_t a4, int *a5)
{
  unsigned int v10 = (char *)*a1;
  if (*a1 >= (unint64_t)a1[1])
  {
    int v11 = 0;
  }
  else
  {
    int v11 = *v10;
    if ((*v10 & 0x80000000) == 0)
    {
      *a1 = (uint64_t)(v10 + 1);
      goto LABEL_6;
    }
  }
  uint64_t v12 = sub_100050114(a1, v11);
  int v11 = v12;
  if (v12 < 0) {
    return 0;
  }
LABEL_6:
  int v30 = sub_10004F2B8((uint64_t)a1, v11);
  if ((int)sub_10004F55C(a1) >= 1)
  {
    unsigned int v13 = 8 * a2;
    char v14 = (8 * a2) | 0x80;
    int v15 = (a2 >> 4) & 0x1FFFFFF;
    while (1)
    {
      unint64_t v16 = (char *)*a1;
      if (*a1 >= (unint64_t)a1[1]) {
        break;
      }
      uint64_t v17 = *v16;
      if (*v16 < 0) {
        goto LABEL_12;
      }
      *a1 = (uint64_t)(v16 + 1);
LABEL_13:
      if (a3 && !a3(v17))
      {
        unsigned int v20 = *(char **)(a4 + 64);
        if (*(void *)a4 <= (unint64_t)v20) {
          unsigned int v20 = sub_100051170(a4, *(char **)(a4 + 64));
        }
        if (v13 > 0x7F)
        {
          *unsigned int v20 = v14;
          if (v13 >= 0x4000)
          {
            unsigned int v21 = v20 + 2;
            unsigned int v22 = v15;
            do
            {
              *(v21 - 1) = v22 | 0x80;
              unsigned int v23 = v22 >> 7;
              ++v21;
              unsigned int v24 = v22 >> 14;
              v22 >>= 7;
            }
            while (v24);
            *(v21 - 1) = v23;
          }
          else
          {
            v20[1] = v13 >> 7;
            unsigned int v21 = v20 + 2;
          }
        }
        else
        {
          unsigned int v21 = v20 + 1;
          *unsigned int v20 = v13;
        }
        *(void *)(a4 + 64) = v21;
        if (*(void *)a4 <= (unint64_t)v21) {
          unsigned int v21 = sub_100051170(a4, v21);
        }
        if (v17 > 0x7F)
        {
          *unsigned int v21 = v17 | 0x80;
          unsigned int v26 = v17 >> 7;
          if (v17 >> 14)
          {
            int v25 = v21 + 2;
            do
            {
              *(v25 - 1) = v26 | 0x80;
              unsigned int v27 = v26 >> 7;
              ++v25;
              unsigned int v28 = v26 >> 14;
              v26 >>= 7;
            }
            while (v28);
            *(v25 - 1) = v27;
          }
          else
          {
            v21[1] = v26;
            int v25 = v21 + 2;
          }
        }
        else
        {
          *unsigned int v21 = v17;
          int v25 = v21 + 1;
        }
        *(void *)(a4 + 64) = v25;
      }
      else
      {
        uint64_t v18 = *a5;
        if (v18 == a5[1])
        {
          int v19 = v18 + 1;
          sub_100075018(a5, v18 + 1);
          *(_DWORD *)(sub_100075830((uint64_t)a5) + 4 * v18) = v17;
        }
        else
        {
          *(_DWORD *)(sub_100075830((uint64_t)a5) + 4 * v18) = v17;
          int v19 = v18 + 1;
        }
        *a5 = v19;
      }
      if ((int)sub_10004F55C(a1) <= 0) {
        goto LABEL_39;
      }
    }
    LODWORD(v17) = 0;
LABEL_12:
    uint64_t v17 = sub_100050114(a1, v17);
    if (v17 < 0) {
      return 0;
    }
    goto LABEL_13;
  }
LABEL_39:
  sub_10004F330((uint64_t)a1, v30);
  return 1;
}

char *sub_100088434(char *__src, int a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a3 + 64);
  int64_t v5 = 4 * a2;
  if ((uint64_t)(*(void *)a3 - v4) < v5)
  {
    uint64_t result = sub_100051284((uint64_t *)a3, __src, v5, v4);
  }
  else
  {
    memcpy(*(void **)(a3 + 64), __src, v5);
    uint64_t result = (char *)(v4 + v5);
  }
  *(void *)(a3 + 64) = result;
  return result;
}

char *sub_1000884AC(char *__src, int a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a3 + 64);
  int64_t v5 = 8 * a2;
  if ((uint64_t)(*(void *)a3 - v4) < v5)
  {
    uint64_t result = sub_100051284((uint64_t *)a3, __src, v5, v4);
  }
  else
  {
    memcpy(*(void **)(a3 + 64), __src, v5);
    uint64_t result = (char *)(v4 + v5);
  }
  *(void *)(a3 + 64) = result;
  return result;
}

char *sub_100088524(char *__src, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 64);
  if (*(void *)a3 - v4 < a2)
  {
    uint64_t result = sub_100051284((uint64_t *)a3, __src, a2, *(void *)(a3 + 64));
  }
  else
  {
    uint64_t v5 = a2;
    memcpy(*(void **)(a3 + 64), __src, a2);
    uint64_t result = (char *)(v4 + v5);
  }
  *(void *)(a3 + 64) = result;
  return result;
}

char *sub_100088590(char *result, unsigned int a2, void *a3)
{
  unsigned int v5 = 8 * result;
  BOOL v6 = (char *)a3[8];
  if (*a3 <= (unint64_t)v6)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v6);
    BOOL v6 = result;
  }
  if (v5 > 0x7F)
  {
    char *v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      unint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      unint64_t v7 = v6 + 2;
    }
  }
  else
  {
    char *v6 = v5;
    unint64_t v7 = v6 + 1;
  }
  a3[8] = v7;
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  if (a2 > 0x7F)
  {
    *unint64_t v7 = a2 | 0x80;
    unint64_t v12 = (unint64_t)(int)a2 >> 7;
    if (a2 >> 14)
    {
      int v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        unint64_t v13 = v12 >> 7;
        ++v11;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      int v11 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = a2;
    int v11 = v7 + 1;
  }
  a3[8] = v11;
  return result;
}

char *sub_1000886B0(char *result, unint64_t a2, void *a3)
{
  unsigned int v5 = 8 * result;
  BOOL v6 = (char *)a3[8];
  if (*a3 <= (unint64_t)v6)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v6);
    BOOL v6 = result;
  }
  if (v5 > 0x7F)
  {
    char *v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      unint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      unint64_t v7 = v6 + 2;
    }
  }
  else
  {
    char *v6 = v5;
    unint64_t v7 = v6 + 1;
  }
  a3[8] = v7;
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  if (a2 > 0x7F)
  {
    *unint64_t v7 = a2 | 0x80;
    unint64_t v12 = a2 >> 7;
    if (a2 >> 14)
    {
      int v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        unint64_t v13 = v12 >> 7;
        ++v11;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      int v11 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = a2;
    int v11 = v7 + 1;
  }
  a3[8] = v11;
  return result;
}

char *sub_1000887CC(char *result, unsigned int a2, void *a3)
{
  unsigned int v5 = 8 * result;
  BOOL v6 = (char *)a3[8];
  if (*a3 <= (unint64_t)v6)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v6);
    BOOL v6 = result;
  }
  if (v5 > 0x7F)
  {
    char *v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      unint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      unint64_t v7 = v6 + 2;
    }
  }
  else
  {
    char *v6 = v5;
    unint64_t v7 = v6 + 1;
  }
  a3[8] = v7;
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  if (a2 > 0x7F)
  {
    *unint64_t v7 = a2 | 0x80;
    unsigned int v12 = a2 >> 7;
    if (a2 >> 14)
    {
      int v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        unsigned int v13 = v12 >> 7;
        ++v11;
        unsigned int v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      int v11 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = a2;
    int v11 = v7 + 1;
  }
  a3[8] = v11;
  return result;
}

char *sub_1000888E8(char *result, int a2, void *a3)
{
  unsigned int v5 = 8 * result;
  BOOL v6 = (char *)a3[8];
  if (*a3 <= (unint64_t)v6)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v6);
    BOOL v6 = result;
  }
  if (v5 > 0x7F)
  {
    char *v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      unint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      unint64_t v7 = v6 + 2;
    }
  }
  else
  {
    char *v6 = v5;
    unint64_t v7 = v6 + 1;
  }
  a3[8] = v7;
  unsigned int v11 = (2 * a2) ^ (a2 >> 31);
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  if (v11 > 0x7F)
  {
    *unint64_t v7 = v11 | 0x80;
    unsigned int v13 = v11 >> 7;
    if (v11 >> 14)
    {
      unsigned int v12 = v7 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        unsigned int v14 = v13 >> 7;
        ++v12;
        unsigned int v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v7[1] = v13;
      unsigned int v12 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v11;
    unsigned int v12 = v7 + 1;
  }
  a3[8] = v12;
  return result;
}

char *sub_100088A0C(char *result, uint64_t a2, void *a3)
{
  unsigned int v5 = 8 * result;
  BOOL v6 = (char *)a3[8];
  if (*a3 <= (unint64_t)v6)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v6);
    BOOL v6 = result;
  }
  if (v5 > 0x7F)
  {
    char *v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      unint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      unint64_t v7 = v6 + 2;
    }
  }
  else
  {
    char *v6 = v5;
    unint64_t v7 = v6 + 1;
  }
  a3[8] = v7;
  unint64_t v11 = (2 * a2) ^ (a2 >> 63);
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  if (v11 > 0x7F)
  {
    *unint64_t v7 = v11 | 0x80;
    unint64_t v13 = v11 >> 7;
    if (v11 >> 14)
    {
      unsigned int v12 = v7 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        unint64_t v14 = v13 >> 7;
        ++v12;
        unint64_t v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v7[1] = v13;
      unsigned int v12 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v11;
    unsigned int v12 = v7 + 1;
  }
  a3[8] = v12;
  return result;
}

char *sub_100088B30(char *result, int a2, void *a3)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 5;
  unint64_t v7 = (char *)a3[8];
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  a3[8] = v8;
  if (*a3 <= (unint64_t)v8)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v8);
    unsigned int v8 = result;
  }
  *(_DWORD *)unsigned int v8 = a2;
  a3[8] = v8 + 4;
  return result;
}

char *sub_100088C08(char *result, uint64_t a2, void *a3)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 1;
  unint64_t v7 = (char *)a3[8];
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  a3[8] = v8;
  if (*a3 <= (unint64_t)v8)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v8);
    unsigned int v8 = result;
  }
  *(void *)unsigned int v8 = a2;
  a3[8] = v8 + 8;
  return result;
}

char *sub_100088CE0(char *result, void *a2, float a3)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 5;
  unint64_t v7 = (char *)a2[8];
  if (*a2 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a2, v7);
    unint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  a2[8] = v8;
  if (*a2 <= (unint64_t)v8)
  {
    uint64_t result = sub_100051170((uint64_t)a2, v8);
    unsigned int v8 = result;
  }
  *(float *)unsigned int v8 = a3;
  a2[8] = v8 + 4;
  return result;
}

char *sub_100088DC0(char *result, void *a2, double a3)
{
  int v5 = (int)result;
  unsigned int v6 = (8 * result) | 1;
  unint64_t v7 = (char *)a2[8];
  if (*a2 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a2, v7);
    unint64_t v7 = result;
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  a2[8] = v8;
  if (*a2 <= (unint64_t)v8)
  {
    uint64_t result = sub_100051170((uint64_t)a2, v8);
    unsigned int v8 = result;
  }
  *(double *)unsigned int v8 = a3;
  a2[8] = v8 + 8;
  return result;
}

char *sub_100088EA0(char *result, char a2, void *a3)
{
  unsigned int v5 = 8 * result;
  unsigned int v6 = (char *)a3[8];
  if (*a3 <= (unint64_t)v6)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v6);
    unsigned int v6 = result;
  }
  if (v5 > 0x7F)
  {
    char *v6 = v5 | 0x80;
    unsigned int v8 = v5 >> 7;
    if (v5 >> 14)
    {
      unint64_t v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        unsigned int v9 = v8 >> 7;
        ++v7;
        unsigned int v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      unint64_t v7 = v6 + 2;
    }
  }
  else
  {
    char *v6 = v5;
    unint64_t v7 = v6 + 1;
  }
  a3[8] = v7;
  if (*a3 <= (unint64_t)v7)
  {
    uint64_t result = sub_100051170((uint64_t)a3, v7);
    unint64_t v7 = result;
  }
  *unint64_t v7 = a2;
  a3[8] = v7 + 1;
  return result;
}

char *sub_100088F6C(int a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = (8 * a1) | 2;
  unint64_t v7 = *(char **)(a3 + 64);
  if (*(void *)a3 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170(a3, *(char **)(a3 + 64));
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *(void *)(a3 + 64) = v8;
  int v12 = *(char *)(a2 + 23);
  if (v12 < 0 && *(void *)(a2 + 8) >> 31)
  {
    sub_100051E5C((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 482);
    unint64_t v13 = sub_100051E74(v25, "CHECK failed: (value.size()) <= (kint32max): ");
    sub_100051FB0((uint64_t)&v24, (const char **)&v13->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v25);
    LOBYTE(v12) = *(unsigned char *)(a2 + 23);
    unsigned int v8 = *(char **)(a3 + 64);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = *(void *)(a2 + 8);
  }
  if (*(void *)a3 <= (unint64_t)v8) {
    unsigned int v8 = sub_100051170(a3, v8);
  }
  if (v14 > 0x7F)
  {
    char *v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = v8 + 2;
    }
  }
  else
  {
    char *v8 = v14;
    unint64_t v15 = v8 + 1;
  }
  *(void *)(a3 + 64) = v15;
  int v19 = *(char *)(a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = (char *)a2;
  }
  else {
    unsigned int v20 = *(char **)a2;
  }
  if (v19 >= 0) {
    LODWORD(v21) = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v21 = *(void *)(a2 + 8);
  }
  if (*(void *)a3 - (void)v15 < (int)v21)
  {
    uint64_t result = sub_100051284((uint64_t *)a3, v20, v21, (unint64_t)v15);
  }
  else
  {
    uint64_t v22 = (int)v21;
    memcpy(v15, v20, (int)v21);
    uint64_t result = &v15[v22];
  }
  *(void *)(a3 + 64) = result;
  return result;
}

void sub_100089168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_100089180(int a1, void **a2, uint64_t a3)
{
  unsigned int v6 = (8 * a1) | 2;
  unint64_t v7 = *(char **)(a3 + 64);
  if (*(void *)a3 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170(a3, *(char **)(a3 + 64));
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *(void *)(a3 + 64) = v8;
  int v12 = *((char *)a2 + 23);
  if (v12 < 0 && (unint64_t)a2[1] >> 31)
  {
    sub_100051E5C((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 491);
    unint64_t v13 = sub_100051E74(v24, "CHECK failed: (value.size()) <= (kint32max): ");
    sub_100051FB0((uint64_t)&v23, (const char **)&v13->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v24);
    LOBYTE(v12) = *((unsigned char *)a2 + 23);
    unsigned int v8 = *(char **)(a3 + 64);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = a2[1];
  }
  if (*(void *)a3 <= (unint64_t)v8) {
    unsigned int v8 = sub_100051170(a3, v8);
  }
  if (v14 > 0x7F)
  {
    char *v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = v8 + 2;
    }
  }
  else
  {
    char *v8 = (char)v14;
    unint64_t v15 = v8 + 1;
  }
  *(void *)(a3 + 64) = v15;
  int v19 = *((char *)a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = a2;
  }
  else {
    unsigned int v20 = *a2;
  }
  if (v19 >= 0) {
    uint64_t v21 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v21 = *((unsigned int *)a2 + 2);
  }
  uint64_t result = sub_100051654(a3, v20, v21, v15);
  *(void *)(a3 + 64) = result;
  return result;
}

void sub_10008934C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_100089364(int a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = (8 * a1) | 2;
  unint64_t v7 = *(char **)(a3 + 64);
  if (*(void *)a3 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170(a3, *(char **)(a3 + 64));
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *(void *)(a3 + 64) = v8;
  int v12 = *(char *)(a2 + 23);
  if (v12 < 0 && *(void *)(a2 + 8) >> 31)
  {
    sub_100051E5C((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 498);
    unint64_t v13 = sub_100051E74(v25, "CHECK failed: (value.size()) <= (kint32max): ");
    sub_100051FB0((uint64_t)&v24, (const char **)&v13->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v25);
    LOBYTE(v12) = *(unsigned char *)(a2 + 23);
    unsigned int v8 = *(char **)(a3 + 64);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = *(void *)(a2 + 8);
  }
  if (*(void *)a3 <= (unint64_t)v8) {
    unsigned int v8 = sub_100051170(a3, v8);
  }
  if (v14 > 0x7F)
  {
    char *v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = v8 + 2;
    }
  }
  else
  {
    char *v8 = v14;
    unint64_t v15 = v8 + 1;
  }
  *(void *)(a3 + 64) = v15;
  int v19 = *(char *)(a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = (char *)a2;
  }
  else {
    unsigned int v20 = *(char **)a2;
  }
  if (v19 >= 0) {
    LODWORD(v21) = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v21 = *(void *)(a2 + 8);
  }
  if (*(void *)a3 - (void)v15 < (int)v21)
  {
    uint64_t result = sub_100051284((uint64_t *)a3, v20, v21, (unint64_t)v15);
  }
  else
  {
    uint64_t v22 = (int)v21;
    memcpy(v15, v20, (int)v21);
    uint64_t result = &v15[v22];
  }
  *(void *)(a3 + 64) = result;
  return result;
}

void sub_100089560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_100089578(int a1, void **a2, uint64_t a3)
{
  unsigned int v6 = (8 * a1) | 2;
  unint64_t v7 = *(char **)(a3 + 64);
  if (*(void *)a3 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170(a3, *(char **)(a3 + 64));
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  *(void *)(a3 + 64) = v8;
  int v12 = *((char *)a2 + 23);
  if (v12 < 0 && (unint64_t)a2[1] >> 31)
  {
    sub_100051E5C((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 506);
    unint64_t v13 = sub_100051E74(v24, "CHECK failed: (value.size()) <= (kint32max): ");
    sub_100051FB0((uint64_t)&v23, (const char **)&v13->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v24);
    LOBYTE(v12) = *((unsigned char *)a2 + 23);
    unsigned int v8 = *(char **)(a3 + 64);
  }
  if ((v12 & 0x80u) == 0) {
    LODWORD(v14) = v12;
  }
  else {
    uint64_t v14 = a2[1];
  }
  if (*(void *)a3 <= (unint64_t)v8) {
    unsigned int v8 = sub_100051170(a3, v8);
  }
  if (v14 > 0x7F)
  {
    char *v8 = v14 | 0x80;
    unsigned int v16 = v14 >> 7;
    if (v14 >> 14)
    {
      unint64_t v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        unsigned int v17 = v16 >> 7;
        ++v15;
        unsigned int v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      unint64_t v15 = v8 + 2;
    }
  }
  else
  {
    char *v8 = (char)v14;
    unint64_t v15 = v8 + 1;
  }
  *(void *)(a3 + 64) = v15;
  int v19 = *((char *)a2 + 23);
  if (v19 >= 0) {
    unsigned int v20 = a2;
  }
  else {
    unsigned int v20 = *a2;
  }
  if (v19 >= 0) {
    uint64_t v21 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v21 = *((unsigned int *)a2 + 2);
  }
  uint64_t result = sub_100051654(a3, v20, v21, v15);
  *(void *)(a3 + 64) = result;
  return result;
}

void sub_100089744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_10008975C(int a1, uint64_t a2, void *a3)
{
  unsigned int v5 = 8 * a1;
  unsigned int v6 = (8 * a1) | 3;
  unint64_t v7 = (char *)a3[8];
  if (*a3 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170((uint64_t)a3, v7);
  }
  unsigned int v8 = v5 >> 7;
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    if (v6 >> 14)
    {
      unsigned int v9 = v7 + 2;
      unsigned int v10 = v5 >> 7;
      do
      {
        *(v9 - 1) = v10 | 0x80;
        unsigned int v11 = v10 >> 7;
        ++v9;
        unsigned int v12 = v10 >> 14;
        v10 >>= 7;
      }
      while (v12);
      *(v9 - 1) = v11;
    }
    else
    {
      v7[1] = v8;
      unsigned int v9 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v9 = v7 + 1;
  }
  a3[8] = v9;
  uint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  uint64_t v14 = result;
  a3[8] = result;
  unsigned int v15 = v5 | 4;
  if (*a3 <= (unint64_t)result)
  {
    uint64_t result = sub_100051170((uint64_t)a3, result);
    uint64_t v14 = result;
  }
  if (v15 > 0x7F)
  {
    *uint64_t v14 = v5 | 0x84;
    if (v15 >> 14)
    {
      unsigned int v16 = v14 + 2;
      do
      {
        *(v16 - 1) = v8 | 0x80;
        unsigned int v17 = v8 >> 7;
        ++v16;
        unsigned int v18 = v8 >> 14;
        v8 >>= 7;
      }
      while (v18);
      *(v16 - 1) = v17;
    }
    else
    {
      v14[1] = v8;
      unsigned int v16 = v14 + 2;
    }
  }
  else
  {
    *uint64_t v14 = v15;
    unsigned int v16 = v14 + 1;
  }
  a3[8] = v16;
  return result;
}

uint64_t sub_1000898C0(int a1, uint64_t a2, void *a3)
{
  unsigned int v6 = (8 * a1) | 2;
  unint64_t v7 = (char *)a3[8];
  if (*a3 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170((uint64_t)a3, v7);
  }
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    unsigned int v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      unsigned int v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        unsigned int v10 = v9 >> 7;
        ++v8;
        unsigned int v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      unsigned int v8 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v8 = v7 + 1;
  }
  a3[8] = v8;
  unsigned int v12 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 80))(a2);
  unint64_t v13 = (char *)a3[8];
  if (*a3 <= (unint64_t)v13) {
    unint64_t v13 = sub_100051170((uint64_t)a3, v13);
  }
  if (v12 > 0x7F)
  {
    *unint64_t v13 = v12 | 0x80;
    unsigned int v15 = v12 >> 7;
    if (v12 >> 14)
    {
      uint64_t v14 = v13 + 2;
      do
      {
        *(v14 - 1) = v15 | 0x80;
        unsigned int v16 = v15 >> 7;
        ++v14;
        unsigned int v17 = v15 >> 14;
        v15 >>= 7;
      }
      while (v17);
      *(v14 - 1) = v16;
    }
    else
    {
      v13[1] = v15;
      uint64_t v14 = v13 + 2;
    }
  }
  else
  {
    *unint64_t v13 = v12;
    uint64_t v14 = v13 + 1;
  }
  a3[8] = v14;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  a3[8] = result;
  return result;
}

uint64_t sub_100089A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 96))(a2, *(void *)(a3 + 64));
  *(void *)(a3 + 64) = result;
  return result;
}

char *sub_100089A98(int a1, uint64_t a2, void *a3)
{
  unsigned int v5 = 8 * a1;
  unsigned int v6 = (8 * a1) | 3;
  unint64_t v7 = (char *)a3[8];
  if (*a3 <= (unint64_t)v7) {
    unint64_t v7 = sub_100051170((uint64_t)a3, v7);
  }
  unsigned int v8 = v5 >> 7;
  if (v6 > 0x7F)
  {
    *unint64_t v7 = v6 | 0x80;
    if (v6 >> 14)
    {
      unsigned int v9 = v7 + 2;
      unsigned int v10 = v5 >> 7;
      do
      {
        *(v9 - 1) = v10 | 0x80;
        unsigned int v11 = v10 >> 7;
        ++v9;
        unsigned int v12 = v10 >> 14;
        v10 >>= 7;
      }
      while (v12);
      *(v9 - 1) = v11;
    }
    else
    {
      v7[1] = v8;
      unsigned int v9 = v7 + 2;
    }
  }
  else
  {
    *unint64_t v7 = v6;
    unsigned int v9 = v7 + 1;
  }
  a3[8] = v9;
  (*(void (**)(uint64_t))(*(void *)a2 + 80))(a2);
  uint64_t result = (char *)(*(uint64_t (**)(uint64_t, void, void *))(*(void *)a2 + 96))(a2, a3[8], a3);
  uint64_t v14 = result;
  a3[8] = result;
  unsigned int v15 = v5 | 4;
  if (*a3 <= (unint64_t)result)
  {
    uint64_t result = sub_100051170((uint64_t)a3, result);
    uint64_t v14 = result;
  }
  if (v15 > 0x7F)
  {
    *uint64_t v14 = v5 | 0x84;
    if (v15 >> 14)
    {
      unsigned int v16 = v14 + 2;
      do
      {
        *(v16 - 1) = v8 | 0x80;
        unsigned int v17 = v8 >> 7;
        ++v16;
        unsigned int v18 = v8 >> 14;
        v8 >>= 7;
      }
      while (v18);
      *(v16 - 1) = v17;
    }
    else
    {
      v14[1] = v8;
      unsigned int v16 = v14 + 2;
    }
  }
  else
  {
    *uint64_t v14 = v15;
    unsigned int v16 = v14 + 1;
  }
  a3[8] = v16;
  return result;
}

BOOL sub_100089C28(uint64_t *a1, std::string *this)
{
  uint64_t v4 = (char *)*a1;
  if (*a1 >= (unint64_t)a1[1])
  {
    LODWORD(v5) = 0;
  }
  else
  {
    uint64_t v5 = *v4;
    if ((*v4 & 0x80000000) == 0)
    {
      *a1 = (uint64_t)(v4 + 1);
      goto LABEL_6;
    }
  }
  uint64_t v5 = sub_100050114(a1, v5);
  if (v5 < 0) {
    return 0;
  }
LABEL_6:
  return sub_10004FAE8((uint64_t)a1, this, v5);
}

BOOL sub_100089CB0(uint64_t *a1, std::string **a2)
{
  BOOL v3 = *a2;
  if (*a2 == (std::string *)&qword_1000B6B88) {
    operator new();
  }
  uint64_t v4 = (char *)*a1;
  if (*a1 >= (unint64_t)a1[1])
  {
    LODWORD(v5) = 0;
  }
  else
  {
    uint64_t v5 = *v4;
    if ((*v4 & 0x80000000) == 0)
    {
      *a1 = (uint64_t)(v4 + 1);
      goto LABEL_8;
    }
  }
  uint64_t v5 = sub_100050114(a1, v5);
  if (v5 < 0) {
    return 0;
  }
LABEL_8:
  return sub_10004FAE8((uint64_t)a1, v3, v5);
}

void sub_100089D80(uint64_t a1, const std::string::value_type *a2)
{
  v16[0] = 0;
  v16[1] = 0;
  uint64_t v17 = 0;
  sub_10000A1B4(&__p, "");
  if (a1)
  {
    sub_1000800A4(" '%s'", v14, a1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v14[0];
  }
  sub_100051E5C((uint64_t)v14, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 577);
  uint64_t v4 = sub_100051E74(v14, "String field");
  uint64_t v5 = sub_100051EA0(v4, (const std::string::value_type *)&__p);
  unsigned int v6 = sub_100051E74(v5, " contains invalid ");
  unint64_t v7 = sub_100051E74(v6, "UTF-8 data when ");
  unsigned int v8 = sub_100051E74(v7, a2);
  unsigned int v9 = sub_100051E74(v8, " a protocol ");
  unsigned int v10 = sub_100051E74(v9, "buffer. Use the 'bytes' type if you intend to send raw ");
  unsigned int v11 = sub_100051E74(v10, "bytes. ");
  unsigned int v12 = sub_100051EA0(v11, (const std::string::value_type *)v16);
  sub_100051FB0((uint64_t)&v13, (const char **)&v12->__r_.__value_.__l.__data_);
  sub_100051FB8((uint64_t)v14);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
}

void sub_100089EAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v22 - 17) < 0) {
    operator delete(*(void **)(v22 - 40));
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100089EF8(char *a1, int a2, int a3, uint64_t a4)
{
  BOOL v6 = sub_100081264(a1, a2);
  if (!v6)
  {
    unint64_t v7 = "serializing";
    if (a3 != 1) {
      unint64_t v7 = 0;
    }
    if (a3) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = "parsing";
    }
    sub_100089D80(a4, v8);
  }
  return v6;
}

uint64_t sub_100089F60(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    int v5 = *(_DWORD *)sub_1000753A0(a1, v3);
    if (v5 < 0) {
      uint64_t v6 = 10;
    }
    else {
      uint64_t v6 = (9 * (__clz(v5 | 1) ^ 0x1F) + 73) >> 6;
    }
    v4 += v6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

uint64_t sub_100089FEC(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
    v4 += (9 * (__clz(*(_DWORD *)sub_100076B84(a1, v3++) | 1) ^ 0x1F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t sub_10008A06C(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    int v5 = (int *)sub_1000753A0(a1, v3);
    v4 += (9 * (__clz((2 * *v5) ^ (*v5 >> 31) | 1) ^ 0x1F) + 73) >> 6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

uint64_t sub_10008A0F4(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
    v4 += (9 * (__clz(*(void *)sub_100078340(a1, v3++) | 1) ^ 0x3F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t sub_10008A170(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
    v4 += (9 * (__clz(*(void *)sub_100079B24(a1, v3++) | 1) ^ 0x3F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t sub_10008A1EC(int *a1)
{
  int v1 = *a1;
  if (*a1 < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    int v5 = (uint64_t *)sub_100078340(a1, v3);
    v4 += (9 * (__clz((2 * *v5) ^ (*v5 >> 63) | 1) ^ 0x3F) + 73) >> 6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

void sub_10008A274()
{
}

void sub_10008A28C()
{
}

uint64_t sub_10008A2A0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(void *)uint64_t result = off_1000AE6E8;
  *(void *)(result + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(result + 16) = a3;
  *(_DWORD *)(result + 20) = v4;
  *(void *)(result + 24) = 0;
  return result;
}

BOOL sub_10008A2D0(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v3 = *(int *)(a1 + 24);
  int v4 = *(_DWORD *)(a1 + 16);
  if ((int)v3 >= v4)
  {
    *(_DWORD *)(a1 + 28) = 0;
  }
  else
  {
    int v5 = v4 - v3;
    if (v4 - (int)v3 >= *(_DWORD *)(a1 + 20)) {
      int v5 = *(_DWORD *)(a1 + 20);
    }
    *(_DWORD *)(a1 + 28) = v5;
    *a2 = *(void *)(a1 + 8) + v3;
    *a3 = v5;
    *(_DWORD *)(a1 + 24) += *(_DWORD *)(a1 + 28);
  }
  return (int)v3 < v4;
}

uint64_t sub_10008A324(uint64_t result, int a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 28);
  if (v4 <= 0)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 80);
    int v5 = sub_100051E74(v10, "CHECK failed: (last_returned_size_) > (0): ");
    uint64_t v6 = sub_100051E74(v5, "BackUp() can only be called after a successful Next().");
    sub_100051FB0((uint64_t)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v10);
    int v4 = *(_DWORD *)(v3 + 28);
  }
  if (v4 < a2)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 82);
    unint64_t v7 = sub_100051E74(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v10);
  }
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 83);
    unsigned int v8 = sub_100051E74(v10, "CHECK failed: (count) >= (0): ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v8->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v10);
  }
  *(void *)(v3 + 24) = (*(_DWORD *)(v3 + 24) - a2);
  return result;
}

void sub_10008A438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_10008A460(_DWORD *a1, int a2)
{
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 89);
    int v4 = sub_100051E74(v11, "CHECK failed: (count) >= (0): ");
    sub_100051FB0((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v11);
  }
  int v5 = a1[4];
  int v6 = a1[6];
  int v7 = v5 - v6;
  BOOL result = v5 - v6 >= a2;
  int v9 = v6 + a2;
  if (v7 >= a2) {
    int v5 = v9;
  }
  a1[6] = v5;
  a1[7] = 0;
  return result;
}

void sub_10008A4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008A504(uint64_t a1)
{
  return *(int *)(a1 + 24);
}

uint64_t sub_10008A50C(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(void *)BOOL result = off_1000AE728;
  *(void *)(result + 8) = a2;
  if (a4 <= 0) {
    int v4 = a3;
  }
  else {
    int v4 = a4;
  }
  *(_DWORD *)(result + 16) = a3;
  *(_DWORD *)(result + 20) = v4;
  *(void *)(result + 24) = 0;
  return result;
}

BOOL sub_10008A53C(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v3 = *(int *)(a1 + 24);
  int v4 = *(_DWORD *)(a1 + 16);
  if ((int)v3 >= v4)
  {
    *(_DWORD *)(a1 + 28) = 0;
  }
  else
  {
    int v5 = v4 - v3;
    if (v4 - (int)v3 >= *(_DWORD *)(a1 + 20)) {
      int v5 = *(_DWORD *)(a1 + 20);
    }
    *(_DWORD *)(a1 + 28) = v5;
    *a2 = *(void *)(a1 + 8) + v3;
    *a3 = v5;
    *(_DWORD *)(a1 + 24) += *(_DWORD *)(a1 + 28);
  }
  return (int)v3 < v4;
}

uint64_t sub_10008A590(uint64_t result, int a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 28);
  if (v4 <= 0)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 127);
    int v5 = sub_100051E74(v10, "CHECK failed: (last_returned_size_) > (0): ");
    int v6 = sub_100051E74(v5, "BackUp() can only be called after a successful Next().");
    sub_100051FB0((uint64_t)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    BOOL result = sub_100051FB8((uint64_t)v10);
    int v4 = *(_DWORD *)(v3 + 28);
  }
  if (v4 < a2)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 129);
    int v7 = sub_100051E74(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    BOOL result = sub_100051FB8((uint64_t)v10);
  }
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 130);
    unsigned int v8 = sub_100051E74(v10, "CHECK failed: (count) >= (0): ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v8->__r_.__value_.__l.__data_);
    BOOL result = sub_100051FB8((uint64_t)v10);
  }
  *(void *)(v3 + 24) = (*(_DWORD *)(v3 + 24) - a2);
  return result;
}

void sub_10008A6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008A6CC(uint64_t a1)
{
  return *(int *)(a1 + 24);
}

void *sub_10008A6D4(void *result, uint64_t a2)
{
  char *result = off_1000AE770;
  result[1] = a2;
  return result;
}

uint64_t sub_10008A6F4(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  if (!v6)
  {
    sub_100051E5C((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 142);
    int v7 = sub_100051E74(v15, "CHECK failed: target_ != NULL: ");
    sub_100051FB0((uint64_t)&v14, (const char **)&v7->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v15);
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if (*(char *)(v6 + 23) < 0)
  {
    unint64_t v8 = *(void *)(v6 + 8);
    unint64_t v9 = (*(void *)(v6 + 16) & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v8 < v9) {
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v8 = *(unsigned __int8 *)(v6 + 23);
    if (*(unsigned __int8 *)(v6 + 23) < 0x16u)
    {
      unint64_t v9 = 22;
      goto LABEL_8;
    }
  }
  unint64_t v9 = 2 * v8;
LABEL_8:
  if (v8 + 0x7FFFFFFF < v9) {
    unint64_t v9 = v8 + 0x7FFFFFFF;
  }
  if (v9 <= 0x10) {
    std::string::size_type v10 = 16;
  }
  else {
    std::string::size_type v10 = v9;
  }
  std::string::resize((std::string *)v6, v10, 0);
  unsigned int v11 = *(uint64_t ***)(a1 + 8);
  if (*((char *)v11 + 23) < 0) {
    unsigned int v11 = (uint64_t **)*v11;
  }
  *a2 = (char *)v11 + v8;
  uint64_t v12 = *(void *)(a1 + 8);
  if (*(char *)(v12 + 23) < 0) {
    uint64_t v12 = *(void *)(v12 + 8);
  }
  else {
    LODWORD(v12) = *(unsigned __int8 *)(v12 + 23);
  }
  *a3 = v12 - v8;
  return 1;
}

void sub_10008A808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10008A820(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 169);
    int v4 = sub_100051E74(v11, "CHECK failed: (count) >= (0): ");
    sub_100051FB0((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v11);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (!v5)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 170);
    uint64_t v6 = sub_100051E74(v11, "CHECK failed: target_ != NULL: ");
    sub_100051FB0((uint64_t)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v11);
    uint64_t v5 = *(void *)(a1 + 8);
  }
  LODWORD(v7) = *(char *)(v5 + 23);
  if ((v7 & 0x80000000) != 0) {
    unint64_t v8 = *(void *)(v5 + 8);
  }
  else {
    unint64_t v8 = *(unsigned __int8 *)(v5 + 23);
  }
  if (v8 < a2)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 171);
    unint64_t v9 = sub_100051E74(v11, "CHECK failed: (count) <= (target_->size()): ");
    sub_100051FB0((uint64_t)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v11);
    uint64_t v5 = *(void *)(a1 + 8);
    LOBYTE(v7) = *(unsigned char *)(v5 + 23);
  }
  if ((v7 & 0x80) != 0) {
    uint64_t v7 = *(void *)(v5 + 8);
  }
  else {
    uint64_t v7 = v7;
  }
  std::string::resize((std::string *)v5, v7 - a2, 0);
}

void sub_10008A954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008A97C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (!v1)
  {
    sub_100051E5C((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 176);
    uint64_t v3 = sub_100051E74(v6, "CHECK failed: target_ != NULL: ");
    sub_100051FB0((uint64_t)&v5, (const char **)&v3->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v6);
    uint64_t v1 = *(void *)(a1 + 8);
  }
  if (*(char *)(v1 + 23) < 0) {
    return *(void *)(v1 + 8);
  }
  else {
    return *(unsigned __int8 *)(v1 + 23);
  }
}

void sub_10008AA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008AA18()
{
  uint64_t v0 = __chkstk_darwin();
  int v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = v4;
    BOOL v6 = __OFSUB__(v2, v4);
    int v7 = v2 - v4;
    if ((v7 < 0) ^ v6 | (v7 == 0)) {
      break;
    }
    uint64_t v8 = v7 >= 4096 ? 4096 : v7;
    int v9 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)v3 + 16))(v3, v11, v8);
    uint64_t v4 = (v9 + v5);
  }
  while (v9 > 0);
  return v5;
}

uint64_t sub_10008AAF4(uint64_t result, uint64_t a2, int a3)
{
  *(void *)BOOL result = off_1000AE7B8;
  *(void *)(result + 8) = a2;
  *(_WORD *)(result + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_DWORD *)(result + 48) = 0;
  *(_DWORD *)(result + 40) = v3;
  return result;
}

uint64_t sub_10008AB30(uint64_t a1)
{
  *(void *)a1 = off_1000AE7B8;
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v3) {
    operator delete[]();
  }
  return a1;
}

void sub_10008ABC8(uint64_t a1)
{
  sub_10008AB30(a1);
  operator delete();
}

uint64_t sub_10008AC00(uint64_t a1, void *a2, int *a3)
{
  if (*(unsigned char *)(a1 + 17)) {
    return 0;
  }
  sub_10008ACDC(a1);
  uint64_t v7 = *(unsigned int *)(a1 + 48);
  if ((int)v7 < 1)
  {
    int v8 = (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8), *(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
    *(_DWORD *)(a1 + 44) = v8;
    if (v8 <= 0)
    {
      if (v8 < 0) {
        *(unsigned char *)(a1 + 17) = 1;
      }
      sub_10008AD58(a1);
      return 0;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    *(void *)(a1 + 24) += v8;
    *a3 = v8;
    *a2 = v9;
  }
  else
  {
    *a2 = *(void *)(a1 + 32) + *(int *)(a1 + 44) - v7;
    *a3 = v7;
    *(_DWORD *)(a1 + 48) = 0;
  }
  return 1;
}

uint64_t sub_10008ACDC(uint64_t result)
{
  if (!*(void *)(result + 32)) {
    operator new[]();
  }
  return result;
}

uint64_t sub_10008AD58(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    sub_100051E5C((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 292);
    uint64_t v2 = sub_100051E74(v5, "CHECK failed: (backup_bytes_) == (0): ");
    sub_100051FB0((uint64_t)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v5);
  }
  *(_DWORD *)(a1 + 44) = 0;
  uint64_t result = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (result) {
    operator delete[]();
  }
  return result;
}

void sub_10008ADE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008AE00(uint64_t result, int a2)
{
  uint64_t v3 = result;
  if (*(_DWORD *)(result + 48) || !*(void *)(result + 32))
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 248);
    char v4 = sub_100051E74(v11, "CHECK failed: backup_bytes_ == 0 && buffer_.get() != NULL: ");
    uint64_t v5 = sub_100051E74(v4, " BackUp() can only be called after Next().");
    sub_100051FB0((uint64_t)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v11);
  }
  if (*(_DWORD *)(v3 + 44) < a2)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 250);
    BOOL v6 = sub_100051E74(v11, "CHECK failed: (count) <= (buffer_used_): ");
    uint64_t v7 = sub_100051E74(v6, " Can't back up over more bytes than were returned by the last call to Next().");
    sub_100051FB0((uint64_t)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v11);
  }
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 253);
    int v8 = sub_100051E74(v11, "CHECK failed: (count) >= (0): ");
    uint64_t v9 = sub_100051E74(v8, " Parameter to BackUp() can't be negative.");
    sub_100051FB0((uint64_t)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v11);
  }
  *(_DWORD *)(v3 + 48) = a2;
  return result;
}

void sub_10008AF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_10008AF54(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 259);
    char v4 = sub_100051E74(v10, "CHECK failed: (count) >= (0): ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v10);
  }
  if (*(unsigned char *)(a1 + 17)) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 48);
  if (v6 >= a2)
  {
    *(_DWORD *)(a1 + 48) = v6 - a2;
    return 1;
  }
  else
  {
    uint64_t v7 = (a2 - v6);
    *(_DWORD *)(a1 + 48) = 0;
    int v8 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), v7);
    *(void *)(a1 + 24) += v8;
    return v8 == v7;
  }
}

void sub_10008B030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008B048(uint64_t a1)
{
  return *(void *)(a1 + 24) - *(int *)(a1 + 48);
}

uint64_t sub_10008B058(uint64_t result, uint64_t a2, int a3)
{
  *(void *)uint64_t result = off_1000AE7F8;
  *(void *)(result + 8) = a2;
  *(_WORD *)(result + 16) = 0;
  if (a3 <= 0) {
    int v3 = 0x2000;
  }
  else {
    int v3 = a3;
  }
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = v3;
  *(_DWORD *)(result + 44) = 0;
  return result;
}

uint64_t sub_10008B090(uint64_t a1)
{
  *(void *)a1 = off_1000AE7F8;
  sub_10008B12C(a1);
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v3) {
    operator delete[]();
  }
  return a1;
}

uint64_t sub_10008B12C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 17)) {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 44)) {
    return 1;
  }
  if ((*(unsigned int (**)(void, void))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8), *(void *)(a1 + 32)))
  {
    *(void *)(a1 + 24) += *(int *)(a1 + 44);
    *(_DWORD *)(a1 + 44) = 0;
    return 1;
  }
  *(unsigned char *)(a1 + 17) = 1;
  *(_DWORD *)(a1 + 44) = 0;
  uint64_t result = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (result) {
    operator delete[]();
  }
  return result;
}

void sub_10008B1E0(uint64_t a1)
{
  sub_10008B090(a1);
  operator delete();
}

uint64_t sub_10008B21C(uint64_t a1, void *a2, _DWORD *a3)
{
  if (*(_DWORD *)(a1 + 44) != *(_DWORD *)(a1 + 40) || (uint64_t result = sub_10008B12C(a1), result))
  {
    sub_10008ACDC(a1);
    int v7 = *(_DWORD *)(a1 + 40);
    uint64_t v8 = *(int *)(a1 + 44);
    *a2 = *(void *)(a1 + 32) + v8;
    *a3 = v7 - v8;
    *(_DWORD *)(a1 + 44) = *(_DWORD *)(a1 + 40);
    return 1;
  }
  return result;
}

uint64_t sub_10008B294(uint64_t result, int a2)
{
  uint64_t v3 = result;
  if (a2 < 0)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 331);
    char v4 = sub_100051E74(v11, "CHECK failed: (count) >= (0): ");
    sub_100051FB0((uint64_t)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v11);
  }
  int v5 = *(_DWORD *)(v3 + 44);
  if (v5 != *(_DWORD *)(v3 + 40))
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 332);
    int v6 = sub_100051E74(v11, "CHECK failed: (buffer_used_) == (buffer_size_): ");
    int v7 = sub_100051E74(v6, " BackUp() can only be called after Next().");
    sub_100051FB0((uint64_t)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v11);
    int v5 = *(_DWORD *)(v3 + 44);
  }
  if (v5 < a2)
  {
    sub_100051E5C((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 334);
    uint64_t v8 = sub_100051E74(v11, "CHECK failed: (count) <= (buffer_used_): ");
    char v9 = sub_100051E74(v8, " Can't back up over more bytes than were returned by the last call to Next().");
    sub_100051FB0((uint64_t)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    uint64_t result = sub_100051FB8((uint64_t)v11);
    int v5 = *(_DWORD *)(v3 + 44);
  }
  *(_DWORD *)(v3 + 44) = v5 - a2;
  return result;
}

void sub_10008B3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008B3DC(uint64_t a1)
{
  return *(void *)(a1 + 24) + *(int *)(a1 + 44);
}

uint64_t sub_10008B3EC(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (*(_DWORD *)(a1 + 40) > (int)a3)
  {
    __n_4[0].__r_.__value_.__r.__words[0] = 0;
    int __n = 0;
    int v6 = (*(uint64_t (**)(uint64_t, std::string *, int *))(*(void *)a1 + 16))(a1, __n_4, &__n);
    uint64_t result = 0;
    if (!v6) {
      return result;
    }
    while ((int)v3 > __n)
    {
      memcpy(__n_4[0].__r_.__value_.__l.__data_, a2, __n);
      a2 += __n;
      LODWORD(v3) = v3 - __n;
      if (((*(uint64_t (**)(uint64_t, std::string *, int *))(*(void *)a1 + 16))(a1, __n_4, &__n) & 1) == 0) {
        return 0;
      }
    }
    memcpy(__n_4[0].__r_.__value_.__l.__data_, a2, (int)v3);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 24))(a1, (__n - v3));
    return 1;
  }
  uint64_t result = sub_10008B12C(a1);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void, char *, uint64_t))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8), a2, v3);
    if (result)
    {
      if (*(_DWORD *)(a1 + 44))
      {
        sub_100051E5C((uint64_t)__n_4, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 350);
        uint64_t v8 = sub_100051E74(__n_4, "CHECK failed: (buffer_used_) == (0): ");
        sub_100051FB0((uint64_t)&__n, (const char **)&v8->__r_.__value_.__l.__data_);
        sub_100051FB8((uint64_t)__n_4);
      }
      *(void *)(a1 + 24) += (int)v3;
      return 1;
    }
  }
  return result;
}

void sub_10008B5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008B5C0(uint64_t a1)
{
  *(_DWORD *)(a1 + 44) = 0;
  uint64_t result = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (result) {
    operator delete[]();
  }
  return result;
}

void *sub_10008B5EC(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = off_1000AE840;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  return a1;
}

uint64_t sub_10008B65C(uint64_t a1)
{
  *(void *)a1 = off_1000AE840;
  if ((*(void *)(a1 + 16) & 0x8000000000000000) != 0) {
    (*(void (**)(void, void))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), -*(_DWORD *)(a1 + 16));
  }
  return a1;
}

void sub_10008B6D8(uint64_t a1)
{
  sub_10008B65C(a1);
  operator delete();
}

uint64_t sub_10008B710(uint64_t a1, uint64_t a2, int *a3)
{
  if (*(uint64_t *)(a1 + 16) < 1) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8));
  if (result)
  {
    uint64_t v6 = *a3;
    uint64_t v7 = *(void *)(a1 + 16) - v6;
    *(void *)(a1 + 16) = v7;
    if (v7 < 0) {
      *a3 = v6 + v7;
    }
    return 1;
  }
  return result;
}

uint64_t sub_10008B794(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v6 = a1 + 8;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(v6 + 8);
  if (v5 < 0)
  {
    uint64_t v8 = (int)a2;
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 24))(v4, (a2 - v5));
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 24))(v4, a2);
    uint64_t v8 = *(void *)(a1 + 16) + v2;
  }
  *(void *)(a1 + 16) = v8;
  return result;
}

BOOL sub_10008B82C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  BOOL v5 = v4 >= (int)a2;
  if (v4 < (int)a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      (*(void (**)(void))(**(void **)(a1 + 8) + 32))(*(void *)(a1 + 8));
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    return 0;
  }
  if (!(*(unsigned int (**)(void, uint64_t))(**(void **)(a1 + 8) + 32))(*(void *)(a1 + 8), a2)) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 16) - (int)a2;
LABEL_6:
  *(void *)(a1 + 16) = v6;
  return v5;
}

uint64_t sub_10008B8E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 40))(*(void *)(a1 + 8));
  if (v2 < 0) {
    v3 += *(void *)(a1 + 16);
  }
  return v3 - *(void *)(a1 + 24);
}

void sub_10008B948()
{
}

void sub_10008B960()
{
}

uint64_t sub_10008B974()
{
  return 0;
}

void sub_10008B980()
{
}

uint64_t sub_10008B994()
{
  return 1;
}

uint64_t sub_10008B99C(uint64_t result, int a2, int a3)
{
  int v3 = *(_DWORD *)(result + 8);
  int v4 = v3 & ~a2;
  int v5 = v3 | a2;
  if (!a3) {
    int v5 = v4;
  }
  *(_DWORD *)(result + 8) = v5;
  return result;
}

uint64_t sub_10008B9B8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000AE950;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE | (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 24))(a2)) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFD | v4;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 32))(a2)) {
    int v5 = 4;
  }
  else {
    int v5 = 0;
  }
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFB | v5;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 40))(a2)) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFF7 | v6;
  return a1;
}

void sub_10008BB08(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v3 = *(_DWORD *)(a1 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::string::resize((std::string *)a2, 4uLL, 0);
  if (*(char *)(a2 + 23) >= 0) {
    int v4 = (_DWORD *)a2;
  }
  else {
    int v4 = *(_DWORD **)a2;
  }
  *int v4 = v3;
}

void sub_10008BB58(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10008BB74(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::string::resize((std::string *)a2, 1uLL, 0);
  if (*(char *)(a2 + 23) >= 0) {
    int v4 = (unsigned char *)a2;
  }
  else {
    int v4 = *(unsigned char **)a2;
  }
  *int v4 = v3;
}

void sub_10008BBC4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10008BBE0(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  *(void *)a1 = off_1000AE990;
  *(void *)(a1 + 16) = off_1000AE950;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = off_1000AE950;
  *(_DWORD *)(a1 + 40) = 0;
  int v6 = (uint64_t *)(a1 + 88);
  sub_10004CF14((void *)(a1 + 88));
  sub_10008BCD8(a1, a2, a3, &v8);
  sub_10004D13C(v6, &v8);
  sub_10004CF1C(&v8);
  return a1;
}

void sub_10008BCB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10004CF1C((uint64_t *)va);
  sub_10004CF1C(v2);
  _Unwind_Resume(a1);
}

void *sub_10008BCD8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  char v13 = a2;
  unint64_t v14 = a3;
  int v12 = 0;
  uint64_t result = sub_100014B44(a2, a3, &v12, a4);
  if (!*a4)
  {
    sub_10004CF1C(a4);
    uint64_t result = sub_10004B1B8(&v13, 4uLL, a4);
    if (!*a4)
    {
      sub_10004CF1C(a4);
      *(_DWORD *)(a1 + 8) = v12;
      int v11 = 0;
      uint64_t result = sub_100014B44(v13, v14, &v11, a4);
      if (!*a4)
      {
        sub_10004CF1C(a4);
        uint64_t result = sub_10004B1B8(&v13, 4uLL, a4);
        if (!*a4)
        {
          sub_10004CF1C(a4);
          *(_DWORD *)(a1 + 24) = v11;
          int v10 = 0;
          uint64_t result = sub_100014B44(v13, v14, &v10, a4);
          if (!*a4)
          {
            sub_10004CF1C(a4);
            uint64_t result = sub_10004B1B8(&v13, 4uLL, a4);
            if (!*a4)
            {
              sub_10004CF1C(a4);
              int v7 = v10;
              *(_DWORD *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 40) = v7;
              uint64_t result = sub_100014948(v13, v14, (_DWORD *)(a1 + 48), a4);
              if (!*a4)
              {
                sub_10004CF1C(a4);
                uint64_t result = sub_10004B1B8(&v13, 4uLL, a4);
                if (!*a4)
                {
                  sub_10004CF1C(a4);
                  *(void *)(a1 + 56) = v13;
                  unint64_t v8 = sub_10004B12C(*(int *)(a1 + 48), 4uLL);
                  uint64_t result = sub_10004B1B8(&v13, v8, a4);
                  if (!*a4)
                  {
                    sub_10004CF1C(a4);
                    *(void *)(a1 + 64) = v13;
                    uint64_t result = sub_10004B1B8(&v13, 4 * *(int *)(a1 + 48), a4);
                    if (!*a4)
                    {
                      sub_10004CF1C(a4);
                      *(void *)(a1 + 72) = v13;
                      uint64_t result = sub_10004B1B8(&v13, 4 * *(int *)(a1 + 48) + 20, a4);
                      if (!*a4)
                      {
                        char v9 = sub_10004CF1C(a4);
                        *(void *)(a1 + 80) = v13;
                        return sub_10004CF14(v9);
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

uint64_t sub_10008BED8(uint64_t a1, uint64_t a2)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1)) {
    return 1;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 112))(a1, a2)) {
    return 2;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 120))(a1, a2)) {
    return 3;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 128))(a1, a2)) {
    return 4;
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 136))(a1, a2)) {
    return 5;
  }
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144))(a1, a2) & 1) == 0)
  {
    if ((int)sub_10004A6A8() <= 2)
    {
      char v14 = 0;
      int v5 = sub_100018688(&std::cerr, (uint64_t)"mmap_model_proto.cc", 19);
      sub_100018688(v5, (uint64_t)"(", 1);
      int v6 = (void *)std::ostream::operator<<();
      int v7 = sub_100018688(v6, (uint64_t)") ", 2);
      unint64_t v8 = sub_100018688(v7, (uint64_t)"LOG(", 4);
      char v9 = sub_100018688(v8, (uint64_t)"ERROR", 5);
      int v10 = sub_100018688(v9, (uint64_t)") ", 2);
      int v11 = sub_100018688(v10, (uint64_t)"Unknown piece type: ", 20);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 88))(a1, a2);
      sub_100018688(v11, v12, v13);
      sub_1000176C4(&v14);
    }
    return 1;
  }
  return 6;
}

void sub_10008C134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

void sub_10008C148(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  memset(&v52, 0, sizeof(v52));
  std::string::resize(&v52, 4uLL, 0);
  int v7 = v4 | 2;
  if (!v5) {
    int v7 = v4;
  }
  int v8 = v7 | (v6 << 30);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v9 = &v52;
  }
  else {
    char v9 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  LODWORD(v9->__r_.__value_.__l.__data_) = v8;
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v10 = &v52;
  }
  else {
    int v10 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v10, size);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 152))(a1);
  sub_10008B9B8((uint64_t)v51, v12);
  sub_10008BB08((uint64_t)v51, (uint64_t)&v52);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v13 = &v52;
  }
  else {
    uint64_t v13 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v14 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v14 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v13, v14);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160))(a1);
  sub_10008B9B8((uint64_t)v50, v15);
  sub_10008BB08((uint64_t)v50, (uint64_t)&v52);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v16 = &v52;
  }
  else {
    unsigned int v16 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v17 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v17 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v16, v17);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  int v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  memset(&v52, 0, sizeof(v52));
  std::string::resize(&v52, 4uLL, 0);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v19 = &v52;
  }
  else {
    int v19 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  LODWORD(v19->__r_.__value_.__l.__data_) = v18;
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v20 = &v52;
  }
  else {
    unsigned int v20 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v21 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v21 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v20, v21);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v22 = v18;
  if (v18)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      LOBYTE(__p) = sub_10008BED8(a1, i);
      sub_10008BB74((char *)&__p, (uint64_t)&v52);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v24 = &v52;
      }
      else {
        char v24 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v25 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v25 = v52.__r_.__value_.__l.__size_;
      }
      std::string::append(a2, (const std::string::value_type *)v24, v25);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v52.__r_.__value_.__l.__data_);
      }
    }
  }
  sub_10004B154(a2);
  if (v18)
  {
    for (uint64_t j = 0; j != v18; ++j)
    {
      float v27 = (*(float (**)(uint64_t, uint64_t))(*(void *)a1 + 96))(a1, j);
      memset(&v52, 0, sizeof(v52));
      std::string::resize(&v52, 4uLL, 0);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v28 = &v52;
      }
      else {
        unsigned int v28 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      *(float *)&v28->__r_.__value_.__l.__data_ = v27;
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v29 = &v52;
      }
      else {
        int v29 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v30 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v30 = v52.__r_.__value_.__l.__size_;
      }
      std::string::append(a2, (const std::string::value_type *)v29, v30);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v52.__r_.__value_.__l.__data_);
      }
    }
  }
  memset(&v52, 0, sizeof(v52));
  std::string __p = 0;
  unsigned int v48 = 0;
  uint64_t v49 = 0;
  v46[0] = &v52;
  v46[1] = (std::string *)&__p;
  int v31 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  sub_10008C7AC(v46, v31, v32);
  unsigned int v33 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
  sub_10008C7AC(v46, v33, v34);
  std::string::size_type v35 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 40))(a1);
  sub_10008C7AC(v46, v35, v36);
  unsigned int v37 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  sub_10008C7AC(v46, v37, v38);
  unsigned int v39 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  sub_10008C7AC(v46, v39, v40);
  if (v18)
  {
    uint64_t v41 = 0;
    do
    {
      unint64_t v42 = (std::string::value_type *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 88))(a1, v41);
      sub_10008C7AC(v46, v42, v43);
      ++v41;
    }
    while (v22 != v41);
  }
  std::string::append(a2, (const std::string::value_type *)__p, v48 - (unsigned char *)__p);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v44 = &v52;
  }
  else {
    int v44 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v45 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v45 = v52.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v44, v45);
  if (__p)
  {
    unsigned int v48 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
}

void sub_10008C718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v23 + 23) < 0) {
    operator delete(*(void **)v23);
  }
  _Unwind_Resume(exception_object);
}

void sub_10008C7AC(std::string **a1, std::string::value_type *__s, std::string::size_type __n)
{
  int v6 = a1[1];
  if (SHIBYTE((*a1)->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type size = (*a1)->__r_.__value_.__l.__size_;
  }
  else {
    LODWORD(size) = HIBYTE((*a1)->__r_.__value_.__r.__words[2]);
  }
  unint64_t v8 = v6->__r_.__value_.__r.__words[2];
  char v9 = (_DWORD *)v6->__r_.__value_.__l.__size_;
  if ((unint64_t)v9 >= v8)
  {
    int v11 = (_DWORD *)v6->__r_.__value_.__r.__words[0];
    uint64_t v12 = (uint64_t)((uint64_t)v9 - v6->__r_.__value_.__r.__words[0]) >> 2;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 62) {
      sub_100004204();
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 1 > v13) {
      unint64_t v13 = v14 >> 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      unsigned int v16 = (char *)sub_10000A17C((uint64_t)&v6->__r_.__value_.__r.__words[2], v15);
      int v11 = (_DWORD *)v6->__r_.__value_.__r.__words[0];
      char v9 = (_DWORD *)v6->__r_.__value_.__l.__size_;
    }
    else
    {
      unsigned int v16 = 0;
    }
    std::string::size_type v17 = &v16[4 * v12];
    int v18 = &v16[4 * v15];
    *(_DWORD *)std::string::size_type v17 = size;
    int v10 = v17 + 4;
    while (v9 != v11)
    {
      int v19 = *--v9;
      *((_DWORD *)v17 - 1) = v19;
      v17 -= 4;
    }
    v6->__r_.__value_.__r.__words[0] = (std::string::size_type)v17;
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)v10;
    v6->__r_.__value_.__r.__words[2] = (std::string::size_type)v18;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    _DWORD *v9 = size;
    int v10 = v9 + 1;
  }
  v6->__r_.__value_.__l.__size_ = (std::string::size_type)v10;
  std::string::append(*a1, __s, __n);
  unsigned int v20 = *a1;
  std::string::push_back(v20, 0);
}

void sub_10008C8D8()
{
}

uint64_t sub_10008C8EC(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_10008C8F8(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_10008C904(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 2) & 1;
}

uint64_t sub_10008C910(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 3) & 1;
}

void *sub_10008C91C(void *a1)
{
  *a1 = off_1000AE990;
  sub_10004CF1C(a1 + 11);
  return a1;
}

void sub_10008C960(void *a1)
{
  *a1 = off_1000AE990;
  sub_10004CF1C(a1 + 11);
  operator delete();
}

uint64_t sub_10008C9C4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

const char *sub_10008C9CC(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + **(unsigned int **)(a1 + 72));
  strlen(v1);
  return v1;
}

const char *sub_10008CA04(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 4));
  strlen(v1);
  return v1;
}

const char *sub_10008CA3C(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 8));
  strlen(v1);
  return v1;
}

const char *sub_10008CA74(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 12));
  strlen(v1);
  return v1;
}

const char *sub_10008CAAC(uint64_t a1)
{
  uint64_t v1 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 16));
  strlen(v1);
  return v1;
}

uint64_t sub_10008CAE4(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) & 1;
}

uint64_t sub_10008CAF0(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 1) & 1;
}

uint64_t sub_10008CAFC(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) >> 30;
}

const char *sub_10008CB08(uint64_t a1, int a2)
{
  uint64_t v2 = (const char *)(*(void *)(a1 + 80) + *(unsigned int *)(*(void *)(a1 + 72) + 4 * (a2 + 5)));
  strlen(v2);
  return v2;
}

float sub_10008CB44(uint64_t a1, int a2)
{
  return *(float *)(*(void *)(a1 + 64) + 4 * a2);
}

BOOL sub_10008CB50(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 1;
}

BOOL sub_10008CB64(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 2;
}

BOOL sub_10008CB78(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 3;
}

BOOL sub_10008CB8C(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 4;
}

BOOL sub_10008CBA0(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 5;
}

BOOL sub_10008CBB4(uint64_t a1, int a2)
{
  return *(unsigned char *)(*(void *)(a1 + 56) + a2) == 6;
}

uint64_t sub_10008CBC8(uint64_t a1)
{
  return a1 + 16;
}

uint64_t sub_10008CBD0(uint64_t a1)
{
  return a1 + 32;
}

uint64_t sub_10008CBD8(uint64_t a1, int a2, int a3)
{
  *(void *)a1 = off_1000AEA78;
  *(void *)(a1 + 8) = off_1000AEAB8;
  *(_DWORD *)(a1 + 16) = a2;
  *(_WORD *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 28) = 0;
  sub_10008AAF4(a1 + 32, a1 + 8, a3);
  return a1;
}

void sub_10008CC54(_Unwind_Exception *a1)
{
  sub_10008CD78(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10008CC68(uint64_t result, int a2)
{
  *(void *)uint64_t result = off_1000AEAB8;
  *(_DWORD *)(result + 8) = a2;
  *(_WORD *)(result + 12) = 0;
  *(_DWORD *)(result + 16) = 0;
  *(unsigned char *)(result + 20) = 0;
  return result;
}

BOOL sub_10008CCA0(uint64_t a1)
{
  return sub_10008CCA8(a1 + 8);
}

BOOL sub_10008CCA8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 13))
  {
    sub_100051E5C((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 117);
    uint64_t v2 = sub_100051E74(v6, "CHECK failed: !is_closed_: ");
    sub_100051FB0((uint64_t)&v5, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v6);
  }
  *(unsigned char *)(a1 + 13) = 1;
  int v3 = sub_10008CE64(*(_DWORD *)(a1 + 8));
  if (v3) {
    *(_DWORD *)(a1 + 16) = *__error();
  }
  return v3 == 0;
}

void sub_10008CD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008CD58(uint64_t a1, void *a2, int *a3)
{
  return sub_10008AC00(a1 + 32, a2, a3);
}

uint64_t sub_10008CD60(uint64_t a1, int a2)
{
  return sub_10008AE00(a1 + 32, a2);
}

BOOL sub_10008CD68(uint64_t a1, int a2)
{
  return sub_10008AF54(a1 + 32, a2);
}

uint64_t sub_10008CD70(uint64_t a1)
{
  return sub_10008B048(a1 + 32);
}

uint64_t sub_10008CD78(uint64_t a1)
{
  *(void *)a1 = off_1000AEAB8;
  if (*(unsigned char *)(a1 + 12) && !sub_10008CCA8(a1))
  {
    sub_100051E5C((uint64_t)v7, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 111);
    uint64_t v2 = sub_100051E74(v7, "close() failed: ");
    int v3 = strerror(*(_DWORD *)(a1 + 16));
    int v4 = sub_100051E74(v2, v3);
    sub_100051FB0((uint64_t)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v7);
  }
  return a1;
}

void sub_10008CE2C(uint64_t a1)
{
  sub_10008CD78(a1);
  operator delete();
}

uint64_t sub_10008CE64(int a1)
{
  do
    uint64_t v2 = close(a1);
  while ((v2 & 0x80000000) != 0 && *__error() == 4);
  return v2;
}

ssize_t sub_10008CEA8(uint64_t a1, void *a2, int a3)
{
  if (*(unsigned char *)(a1 + 13))
  {
    sub_100051E5C((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 132);
    char v6 = sub_100051E74(v10, "CHECK failed: !is_closed_: ");
    sub_100051FB0((uint64_t)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v10);
  }
  while (1)
  {
    ssize_t v7 = read(*(_DWORD *)(a1 + 8), a2, a3);
    if ((v7 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      *(_DWORD *)(a1 + 16) = *__error();
      return v7;
    }
  }
  return v7;
}

void sub_10008CF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008CF78(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 13))
  {
    sub_100051E5C((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 148);
    int v4 = sub_100051E74(v7, "CHECK failed: !is_closed_: ");
    sub_100051FB0((uint64_t)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v7);
  }
  if (*(unsigned char *)(a1 + 20) || lseek(*(_DWORD *)(a1 + 8), (int)a2, 1) == -1)
  {
    *(unsigned char *)(a1 + 20) = 1;
    return sub_10008AA18();
  }
  return a2;
}

void sub_10008D028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008D040(void *a1, int a2)
{
  *a1 = off_1000AEAE8;
  uint64_t result = sub_10008B058((uint64_t)a1, (uint64_t)(a1 + 6), -1);
  *(void *)uint64_t result = off_1000AEAE8;
  *(void *)(result + 48) = off_1000AEB30;
  *(_DWORD *)(result + 56) = a2;
  *(_WORD *)(result + 60) = 0;
  *(_DWORD *)(result + 64) = 0;
  return result;
}

uint64_t sub_10008D0C4(uint64_t result, int a2)
{
  *(void *)uint64_t result = off_1000AEB30;
  *(_DWORD *)(result + 8) = a2;
  *(_WORD *)(result + 12) = 0;
  *(_DWORD *)(result + 16) = 0;
  return result;
}

uint64_t sub_10008D0F0(uint64_t a1)
{
  unsigned int v2 = sub_10008B218(a1);
  return sub_10008D124(a1 + 48) & v2;
}

BOOL sub_10008D124(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 13))
  {
    sub_100051E5C((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 194);
    unsigned int v2 = sub_100051E74(v6, "CHECK failed: !is_closed_: ");
    sub_100051FB0((uint64_t)&v5, (const char **)&v2->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v6);
  }
  *(unsigned char *)(a1 + 13) = 1;
  int v3 = sub_10008CE64(*(_DWORD *)(a1 + 8));
  if (v3) {
    *(_DWORD *)(a1 + 16) = *__error();
  }
  return v3 == 0;
}

void sub_10008D1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008D1D4(void *a1)
{
  *a1 = off_1000AEAE8;
  sub_10008B218(a1);
  sub_10008D274((uint64_t)(a1 + 6));
  return sub_10008B090((uint64_t)a1);
}

void sub_10008D23C(void *a1)
{
  sub_10008D1D4(a1);
  operator delete();
}

uint64_t sub_10008D274(uint64_t a1)
{
  *(void *)a1 = off_1000AEB30;
  if (*(unsigned char *)(a1 + 12) && !sub_10008D124(a1))
  {
    sub_100051E5C((uint64_t)v7, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 188);
    unsigned int v2 = sub_100051E74(v7, "close() failed: ");
    int v3 = strerror(*(_DWORD *)(a1 + 16));
    int v4 = sub_100051E74(v2, v3);
    sub_100051FB0((uint64_t)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v7);
  }
  return a1;
}

void sub_10008D328(uint64_t a1)
{
  sub_10008D274(a1);
  operator delete();
}

BOOL sub_10008D360(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned char *)(a1 + 13))
  {
    sub_100051E5C((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 210);
    char v6 = sub_100051E74(v14, "CHECK failed: !is_closed_: ");
    sub_100051FB0((uint64_t)&v13, (const char **)&v6->__r_.__value_.__l.__data_);
    sub_100051FB8((uint64_t)v14);
  }
  if (a3 < 1) {
    return 1;
  }
  int v7 = 0;
  do
  {
    while (1)
    {
      int v8 = write(*(_DWORD *)(a1 + 8), (const void *)(a2 + v7), a3 - v7);
      int v9 = v8;
      if (v8 < 0) {
        break;
      }
      BOOL result = v8 != 0;
      v7 += v9;
      if (v9) {
        BOOL v10 = v7 < a3;
      }
      else {
        BOOL v10 = 0;
      }
      if (!v10) {
        return result;
      }
    }
  }
  while (*__error() == 4);
  int v11 = __error();
  BOOL result = 0;
  *(_DWORD *)(a1 + 16) = *v11;
  return result;
}

void sub_10008D45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_10008D474(void *a1, uint64_t a2, int a3)
{
  *a1 = off_1000AEB58;
  a1[1] = off_1000AEB98;
  a1[2] = a2;
  sub_10008AAF4((uint64_t)(a1 + 3), (uint64_t)(a1 + 1), a3);
  return a1;
}

void *sub_10008D4E0(void *result, uint64_t a2)
{
  void *result = off_1000AEB98;
  result[1] = a2;
  return result;
}

uint64_t sub_10008D504(uint64_t a1, void *a2, int *a3)
{
  return sub_10008AC00(a1 + 24, a2, a3);
}

uint64_t sub_10008D50C(uint64_t a1, int a2)
{
  return sub_10008AE00(a1 + 24, a2);
}

BOOL sub_10008D514(uint64_t a1, int a2)
{
  return sub_10008AF54(a1 + 24, a2);
}

uint64_t sub_10008D51C(uint64_t a1)
{
  return sub_10008B048(a1 + 24);
}

void sub_10008D524()
{
}

uint64_t sub_10008D538(uint64_t a1)
{
  std::istream::read();
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t result = *(unsigned int *)(v2 + 8);
  if (!result)
  {
    int v4 = *(_DWORD *)(v2 + *(void *)(*(void *)v2 - 24) + 32);
    int v5 = v4 & 5;
    int v6 = v4 & 2;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void *sub_10008D5A8(void *a1, uint64_t a2, int a3)
{
  *a1 = off_1000AEBC8;
  a1[1] = off_1000AEC10;
  a1[2] = a2;
  sub_10008B058((uint64_t)(a1 + 3), (uint64_t)(a1 + 1), a3);
  return a1;
}

void *sub_10008D614(void *result, uint64_t a2)
{
  void *result = off_1000AEC10;
  result[1] = a2;
  return result;
}

void *sub_10008D638(void *a1)
{
  *a1 = off_1000AEBC8;
  uint64_t v2 = a1 + 3;
  sub_10008B218(a1 + 3);
  sub_10008B1DC(v2);
  return a1;
}

void sub_10008D694(void *a1)
{
  sub_10008D638(a1);
  operator delete();
}

uint64_t sub_10008D6CC(uint64_t a1, void *a2, _DWORD *a3)
{
  return sub_10008B21C(a1 + 24, a2, a3);
}

uint64_t sub_10008D6D4(uint64_t a1, int a2)
{
  return sub_10008B294(a1 + 24, a2);
}

uint64_t sub_10008D6DC(uint64_t a1)
{
  return sub_10008B3DC(a1 + 24);
}

void sub_10008D6E4()
{
}

BOOL sub_10008D6F8(uint64_t a1)
{
  return *(_DWORD *)(*(void *)(a1 + 8) + *(void *)(**(void **)(a1 + 8) - 24) + 32) == 0;
}

uint64_t sub_10008D74C(uint64_t result, uint64_t a2, int a3)
{
  *(void *)uint64_t result = off_1000AEC38;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = a3;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t sub_10008D774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(int *)(a1 + 16) < 1) {
    return 0;
  }
  int v6 = *(void **)(a1 + 8);
  do
  {
    uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v6 + 16))(*v6, a2, a3);
    if (v7) {
      break;
    }
    *(void *)(a1 + 24) += (*(uint64_t (**)(void))(***(void ***)(a1 + 8) + 40))(**(void **)(a1 + 8));
    int v6 = (void *)(*(void *)(a1 + 8) + 8);
    *(void *)(a1 + 8) = v6;
    int v8 = *(_DWORD *)(a1 + 16);
    BOOL v9 = __OFSUB__(v8--, 1);
    *(_DWORD *)(a1 + 16) = v8;
  }
  while (!((v8 < 0) ^ v9 | (v8 == 0)));
  return v7;
}

uint64_t sub_10008D84C(uint64_t a1)
{
  if (*(int *)(a1 + 16) < 1)
  {
    sub_100051E5C((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 327);
    int v3 = sub_100051E74(v5, "Can't BackUp() after failed Next().");
    sub_100051FB0((uint64_t)&v4, (const char **)&v3->__r_.__value_.__l.__data_);
    return sub_100051FB8((uint64_t)v5);
  }
  else
  {
    uint64_t v1 = *(uint64_t (**)(void))(***(void ***)(a1 + 8) + 24);
    return v1();
  }
}

void sub_10008D900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008D918(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 16) < 1) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  do
  {
    uint64_t v5 = (*(uint64_t (**)(void))(**(void **)v4 + 40))();
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(***(void ***)(a1 + 8) + 32))(**(void **)(a1 + 8), a2);
    if (v6) {
      break;
    }
    uint64_t v7 = v5 + (int)a2;
    uint64_t v8 = (*(uint64_t (**)(void))(***(void ***)(a1 + 8) + 40))(**(void **)(a1 + 8));
    if (v7 <= v8)
    {
      sub_100051E5C((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 341);
      BOOL v9 = sub_100051E74(v14, "CHECK failed: (final_byte_count) < (target_byte_count): ");
      sub_100051FB0((uint64_t)&v13, (const char **)&v9->__r_.__value_.__l.__data_);
      sub_100051FB8((uint64_t)v14);
    }
    a2 = (v7 - v8);
    *(void *)(a1 + 24) += v8;
    uint64_t v4 = *(void *)(a1 + 8) + 8;
    *(void *)(a1 + 8) = v4;
    int v10 = *(_DWORD *)(a1 + 16);
    BOOL v11 = __OFSUB__(v10--, 1);
    *(_DWORD *)(a1 + 16) = v10;
  }
  while (!((v10 < 0) ^ v11 | (v10 == 0)));
  return v6;
}

void sub_10008DA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10008DA98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (*(_DWORD *)(a1 + 16)) {
    v1 += (*(uint64_t (**)(void))(***(void ***)(a1 + 8) + 40))(**(void **)(a1 + 8));
  }
  return v1;
}

void sub_10008DAF4(void *a1)
{
  *a1 = off_1000AEA78;
  uint64_t v1 = (uint64_t)(a1 + 1);
  sub_10008ABC4(a1 + 4);
  sub_10008CD78(v1);
  operator delete();
}

void sub_10008DB68(void *a1)
{
  *a1 = off_1000AEB58;
  sub_10008ABC4(a1 + 3);
  operator delete();
}

void sub_10008DBD0()
{
}

uint64_t sub_10008DBE4()
{
  sub_100051E5C((uint64_t)v3, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream.cc", 47);
  uint64_t v0 = sub_100051E74(v3, "This ZeroCopyOutputStream doesn't support aliasing. Reaching here usually means a ZeroCopyOutputStream implementation bug.");
  sub_100051FB0((uint64_t)&v2, (const char **)&v0->__r_.__value_.__l.__data_);
  sub_100051FB8((uint64_t)v3);
  return 0;
}

void sub_10008DC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_100051FB8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10008DC60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "DDScannerHelper - Error Running DD Scanner: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10008DCD8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "DDScannerHelper - No end date found in input text: %{private}@", (uint8_t *)&v3, 0xCu);
}

void sub_10008DD54(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EMDEBeamSearchHandler - Found nil in input model for initWithModel:%@", (uint8_t *)&v1, 0xCu);
}

void sub_10008DDD0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EMDEBeamSearchHandler - Found nil in input encoderState for getTopBeamWithModelState", v1, 2u);
}

void sub_10008DE14()
{
  sub_1000098E8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "EMDEEventExtractor - Found nil in input parameters for initWithConfigFile:%{private}@ assetFolderPath:%{private}@", v1, 0x16u);
}

void sub_10008DE8C()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEEventExtractor - Couldn't instantiate EMDEModelWrapper", v2, v3, v4, v5, v6);
}

void sub_10008DEC0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "EMDEEventExtractor - Config load failed: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10008DF3C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "EMDEEventExtractor - Predicted Date String: %{private}@", buf, 0xCu);
}

void sub_10008DF94()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEEventExtractor - Found nil in input params for extractEventDatesFromModelDateOutput", v2, v3, v4, v5, v6);
}

void sub_10008DFC8(uint64_t a1, NSObject *a2, float a3)
{
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "EMDEEventExtractor - Predicted Title String: %{private}@ (Score: %f)", (uint8_t *)&v3, 0x16u);
}

void sub_10008E050()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEEventExtractor - Found nil in inputMessage for extractTitleFromMessage", v2, v3, v4, v5, v6);
}

void sub_10008E084(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "EMDEEventExtractor - Extracting Title from inputMessage: %{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_10008E0FC()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEEventExtractor - Found nil in inputMessage for extractEventFromMessage", v2, v3, v4, v5, v6);
}

void sub_10008E130(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "EMDEEventExtractor - Could not create inputs for model: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10008E1AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "EMDEEventExtractor - Extracting Event from inputMessage: %{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_10008E224()
{
  sub_1000098E8();
  sub_10000991C((void *)&_mh_execute_header, v0, v1, "EMDEEventExtractor - Extracted date object %{private}@ from date string %{private}@");
}

void sub_10008E28C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EMDEEventExtractor - Error in running DataDetector for dateString. Error: %@", buf, 0xCu);
}

void sub_10008E2E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008E350(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EMDEUtils - Found nil in input parameters for loadConfigFromFile:%{private}@ assetFolderPath:%{private}@", (uint8_t *)&v3, 0x16u);
}

void sub_10008E3D8()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEUtils - Loaded config file is not valid.", v2, v3, v4, v5, v6);
}

void sub_10008E40C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008E47C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008E4EC()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEUtils - Found nil in input for tokenizeInputSequence", v2, v3, v4, v5, v6);
}

void sub_10008E520()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEUtils - Error in tokenisation. Returned empty vector for input", v2, v3, v4, v5, v6);
}

void sub_10008E554()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEUtils - Found nil in input for removeLinksFrom", v2, v3, v4, v5, v6);
}

void sub_10008E588()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEUtils - Found nil in inputMessage for preProcessInputMessage", v2, v3, v4, v5, v6);
}

void sub_10008E5BC()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEUtils - Found nil lexicon for profaneRangesForText", v2, v3, v4, v5, v6);
}

void sub_10008E5F0()
{
  sub_10000993C();
  sub_100009900((void *)&_mh_execute_header, v0, v1, "EMDEUtils - Found nil in allowedWords for validateAndUpdateAllowedWords", v2, v3, v4, v5, v6);
}

void sub_10008E624()
{
  sub_100012094();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "EMDEModelWrapper - Found nil in input parameters for loadConfigFromFile:%{private}@ assetFolderPath:%{private}@", v2, 0x16u);
}

void sub_10008E6A8()
{
  sub_100012094();
  sub_10000DCFC((void *)&_mh_execute_header, v0, v1, "EMDEModelWrapper - Unable to load lexicon: %@", v2, v3, v4, v5, v6);
}

void sub_10008E710(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008E748(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008E780()
{
  sub_100012094();
  sub_10000DCFC((void *)&_mh_execute_header, v0, v1, "EMDEModelWrapper - Encoder Model could not be loaded: %@", v2, v3, v4, v5, v6);
}

void sub_10008E7E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10008E820()
{
  sub_100012094();
  sub_10000DCFC((void *)&_mh_execute_header, v0, v1, "EMDEModelWrapper - Decoder Model could not be loaded: %@", v2, v3, v4, v5, v6);
}

void sub_10008E888(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EMDEBeamPath - Found nil in state for initWithState", v1, 2u);
}

void sub_10008E8CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EMDEBeamPath - Found nil in input parentBeam for initFinishedBeamFrom", v1, 2u);
}

void sub_10008E910(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "EMDEBeamPath - Found nil in input parameters for initChildBeamFrom:%@ state:%@ ", (uint8_t *)&v3, 0x16u);
}

void sub_10008E998(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "EventMetaDataExtractorPlugin - Sending CoreAnalytics Event: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return _CFURLCreateWithBytes(allocator, URLBytes, length, encoding, baseURL);
}

uint64_t DDResultCopyExtractedDateFromReferenceDateWithLocale()
{
  return _DDResultCopyExtractedDateFromReferenceDateWithLocale();
}

uint64_t DDResultCopyExtractedStartDateEndDateWithLocale()
{
  return _DDResultCopyExtractedStartDateEndDateWithLocale();
}

uint64_t DDResultGetCategory()
{
  return _DDResultGetCategory();
}

uint64_t DDResultGetMatchedString()
{
  return _DDResultGetMatchedString();
}

uint64_t DDResultGetRangeForURLification()
{
  return _DDResultGetRangeForURLification();
}

uint64_t DDResultGetSubResults()
{
  return _DDResultGetSubResults();
}

uint64_t DDResultGetType()
{
  return _DDResultGetType();
}

uint64_t DDResultHasType()
{
  return _DDResultHasType();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return _DDScannerCopyResultsWithOptions();
}

uint64_t DDScannerCreateWithLocale()
{
  return _DDScannerCreateWithLocale();
}

uint64_t DDScannerReset()
{
  return _DDScannerReset();
}

uint64_t DDScannerScanStringWithRange()
{
  return _DDScannerScanStringWithRange();
}

uint64_t LXEntryGetMetaFlags()
{
  return _LXEntryGetMetaFlags();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return _LXLexiconCopyEntryForTokenID();
}

uint64_t LXLexiconCreate()
{
  return _LXLexiconCreate();
}

uint64_t LXLexiconGetFirstTokenIDForString()
{
  return _LXLexiconGetFirstTokenIDForString();
}

uint64_t MRLNeuralNetworkClear()
{
  return _MRLNeuralNetworkClear();
}

uint64_t MRLNeuralNetworkCopyStates()
{
  return _MRLNeuralNetworkCopyStates();
}

uint64_t MRLNeuralNetworkCreate()
{
  return _MRLNeuralNetworkCreate();
}

uint64_t MRLNeuralNetworkGetOutput()
{
  return _MRLNeuralNetworkGetOutput();
}

uint64_t MRLNeuralNetworkPredict()
{
  return _MRLNeuralNetworkPredict();
}

uint64_t MRLNeuralNetworkSetInputTensor()
{
  return _MRLNeuralNetworkSetInputTensor();
}

uint64_t MRLNeuralNetworkTensorAppendData()
{
  return _MRLNeuralNetworkTensorAppendData();
}

uint64_t MRLNeuralNetworkTensorCreate()
{
  return _MRLNeuralNetworkTensorCreate();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::find(this, __s, __pos, __n);
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__filename(this);
  std::basic_string_view<_CharT, _Traits>::size_type size = v3.__size_;
  int data = v3.__data_;
  result.__size_ = size;
  result.__data_ = data;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__parent_path(this);
  std::basic_string_view<_CharT, _Traits>::size_type size = v3.__size_;
  int data = v3.__data_;
  result.__size_ = size;
  result.__data_ = data;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return std::string::at(this, __n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::append(this, __str, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::append(this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::assign(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::insert(this, __pos, __n, __c);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return std::string::replace(this, __pos, __n1, __s);
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

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::read()
{
  return std::istream::read();
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::istream::operator>>()
{
  return std::istream::operator>>();
}

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::write()
{
  return std::ostream::write();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return std::random_device::random_device(this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return std::random_device::operator()(this);
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__status(a1, __ec);
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
  return std::ios::~ios();
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
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
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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
  return ___cxa_guard_acquire((uint64_t *)a1);
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
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
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

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  return _exp(__x);
}

float expf(float a1)
{
  return _expf(a1);
}

long double expm1(long double __x)
{
  return _expm1(__x);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

long double log(long double __x)
{
  return _log(__x);
}

float log1pf(float a1)
{
  return _log1pf(a1);
}

float logf(float a1)
{
  return _logf(a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return _openat_authenticated_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return _strerror_r(__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return _strpbrk(__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

float strtof(const char *a1, char **a2)
{
  return _strtof(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowedPrefixes(void *a1, const char *a2, ...)
{
  return [a1 allowedPrefixes];
}

id objc_msgSend_allowedWords(void *a1, const char *a2, ...)
{
  return [a1 allowedWords];
}

id objc_msgSend_averageScore(void *a1, const char *a2, ...)
{
  return [a1 averageScore];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_capitaliseNextWord(void *a1, const char *a2, ...)
{
  return [a1 capitaliseNextWord];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentPrediction(void *a1, const char *a2, ...)
{
  return [a1 currentPrediction];
}

id objc_msgSend_currentWord(void *a1, const char *a2, ...)
{
  return [a1 currentWord];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_extractDates(void *a1, const char *a2, ...)
{
  return [a1 extractDates];
}

id objc_msgSend_extractTitles(void *a1, const char *a2, ...)
{
  return [a1 extractTitles];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isValidConfigFile(void *a1, const char *a2, ...)
{
  return [a1 isValidConfigFile];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadDecodeVocabulary(void *a1, const char *a2, ...)
{
  return [a1 loadDecodeVocabulary];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return [a1 resultType];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_runBeamInferenceForDate(void *a1, const char *a2, ...)
{
  return [a1 runBeamInferenceForDate];
}

id objc_msgSend_runBeamInferenceForTitle(void *a1, const char *a2, ...)
{
  return [a1 runBeamInferenceForTitle];
}

id objc_msgSend_runNextTimeStep(void *a1, const char *a2, ...)
{
  return [a1 runNextTimeStep];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return [a1 tokens];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}