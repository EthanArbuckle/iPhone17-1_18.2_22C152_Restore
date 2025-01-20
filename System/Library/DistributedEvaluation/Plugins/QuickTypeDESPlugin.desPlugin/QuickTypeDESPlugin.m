void sub_42EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_4480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_4664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v26 - 112), 8);
  _Block_object_dispose((const void *)(v26 - 80), 8);

  _Unwind_Resume(a1);
}

uint64_t sub_46B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_46C4(uint64_t a1)
{
}

void sub_46CC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (a4 == 1)
  {
    if ([*(id *)(a1 + 32) processingNewRecord])
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        [*(id *)(a1 + 32) sampleNoneClassExample:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
      v5 = *(void **)(a1 + 32);
      [v5 setProcessingNewRecord:0];
    }
  }
  else
  {
    id v6 = [objc_alloc((Class)NSString) initWithBytes:a2 length:a3 encoding:4];
    id v14 = [v6 lowercaseString];

    if (CEMStringContainsEmoji())
    {
      v7 = [*(id *)(*(void *)(a1 + 32) + 56) valueForKey:v14];
      if (v7 && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        [*(id *)(*(void *)(a1 + 32) + 48) addObject:v7];
        id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
        id v9 = [*(id *)(a1 + 32) maxSequenceLength];
        v10 = *(void **)(a1 + 32);
        if (v8 <= v9)
        {
          v11 = [v10 sentences];
          id v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
          [v11 addObject:v12];
        }
        else
        {
          v11 = [v10 sentences];
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "subarrayWithRange:", (unsigned char *)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count")- (unsigned char *)objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"), objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"));
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          id v13 = [v12 copy];
          [v11 addObject:v13];
        }
      }
    }
    else
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          [*(id *)(a1 + 32) sampleNoneClassExample:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
    }
  }
}

void sub_49A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_4EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_4FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_5250(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v10 isEqualToString:@"NONE"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v7 floatValue], v8 >= 0.0)
    && ([v7 floatValue], v9 <= 1.0))
  {
    objc_storeStrong((id *)(a1[4] + 64), a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !CEMStringContainsEmoji()
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ((unint64_t)[v7 integerValue] & 0x8000000000000000) != 0
      || (unint64_t)[v7 integerValue] >= *(void *)(*(void *)(a1[5] + 8) + 24))
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

void sub_53C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_53D8(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (CEMStringContainsEmoji() && ![v7 integerValue])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_5464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_57C4(const void **a1, const void *a2)
{
  v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_57FC(void *a1)
{
}

void *sub_5810(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_5894(a1, a2);
    id v6 = (_DWORD *)a1[1];
    id v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_5878(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_5894(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_58D8();
  }
  result = (char *)sub_58F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void sub_58D8()
{
}

void *sub_58F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_59B8();
  }
  return operator new(4 * a2);
}

void sub_5928(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_5984(exception, a1);
}

void sub_5970(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_5984(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_59B8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_59EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_5B24(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_5C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_61BC(_Unwind_Exception *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);

  sub_57C4((const void **)va, 0);
  _Unwind_Resume(a1);
}

void sub_638C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_697C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  sub_8550(&a9, 0);
  _Unwind_Resume(a1);
}

void sub_6B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  _Block_object_dispose(&a18, 8);
  if (__p)
  {
    a25 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 sub_6B74(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_6B98(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_6BB0(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_58D8();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    id v6 = (char *)sub_58F0(v3, a2);
    id v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = &v6[4 * v8];
    id v10 = (char *)*a1;
    v11 = (char *)a1[1];
    id v12 = v7;
    if (v11 != *a1)
    {
      id v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_6C58(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4)
  {
    unsigned int v5 = a4;
    if (a4 == 2)
    {
      id v10 = *(void **)(*(void *)(a1 + 40) + 8);
      v11 = (char *)v10[7];
      unint64_t v12 = v10[8];
      if ((unint64_t)v11 >= v12)
      {
        id v14 = (char *)v10[6];
        uint64_t v15 = (v11 - v14) >> 2;
        if ((unint64_t)(v15 + 1) >> 62) {
          goto LABEL_47;
        }
        unint64_t v16 = v12 - (void)v14;
        unint64_t v17 = (uint64_t)(v12 - (void)v14) >> 1;
        if (v17 <= v15 + 1) {
          unint64_t v17 = v15 + 1;
        }
        if (v16 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18)
        {
          v19 = (char *)sub_58F0((uint64_t)(v10 + 8), v18);
          id v14 = (char *)v10[6];
          v11 = (char *)v10[7];
        }
        else
        {
          v19 = 0;
        }
        v20 = &v19[4 * v15];
        v21 = &v19[4 * v18];
        *(_DWORD *)v20 = 2;
        int v13 = v20 + 4;
        while (v11 != v14)
        {
          int v22 = *((_DWORD *)v11 - 1);
          v11 -= 4;
          *((_DWORD *)v20 - 1) = v22;
          v20 -= 4;
        }
        v10[6] = v20;
        v10[7] = v13;
        v10[8] = v21;
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *(_DWORD *)v11 = 2;
        int v13 = v11 + 4;
      }
      v10[7] = v13;
      [*(id *)(a1 + 32) addPreprocessedExample:*(void *)(*(void *)(a1 + 40) + 8) + 48];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 48);
      return;
    }
    if (a4 == 1)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) != *(void *)(*(void *)(*(void *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 48))
        sub_10214();
      unsigned int v5 = 1;
    }
  }
  else
  {
    id v6 = [objc_alloc((Class)NSString) initWithBytes:a2 length:a3 encoding:4];
    id v7 = +[NSString stringWithFormat:@"%C", 8217];
    uint64_t v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:@"'"];

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    int v45 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = sub_7C90;
    v40 = sub_7CA0;
    id v41 = objc_alloc_init((Class)NSMutableArray);
    LXLexiconEnumerateEntriesForString();
    unsigned int v5 = *((_DWORD *)v43 + 6);
    if (!v5)
    {
      if ([(id)v37[5] count] == (char *)&dword_0 + 1)
      {
        uint64_t v9 = [(id)v37[5] objectAtIndexedSubscript:0];
        unsigned int v5 = [v9 unsignedIntValue];
      }
      else
      {
        unsigned int v5 = *((_DWORD *)v43 + 6);
      }
    }
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
  }
  v23 = *(void **)(*(void *)(a1 + 40) + 8);
  v24 = (unsigned int *)v23[7];
  unint64_t v25 = v23[8];
  if ((unint64_t)v24 >= v25)
  {
    v27 = (unsigned int *)v23[6];
    uint64_t v28 = v24 - v27;
    if (!((unint64_t)(v28 + 1) >> 62))
    {
      unint64_t v29 = v25 - (void)v27;
      unint64_t v30 = (uint64_t)(v25 - (void)v27) >> 1;
      if (v30 <= v28 + 1) {
        unint64_t v30 = v28 + 1;
      }
      if (v29 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31)
      {
        v32 = (char *)sub_58F0((uint64_t)(v23 + 8), v31);
        v27 = (unsigned int *)v23[6];
        v24 = (unsigned int *)v23[7];
      }
      else
      {
        v32 = 0;
      }
      v33 = (unsigned int *)&v32[4 * v28];
      v34 = &v32[4 * v31];
      unsigned int *v33 = v5;
      uint64_t v26 = v33 + 1;
      while (v24 != v27)
      {
        unsigned int v35 = *--v24;
        *--v33 = v35;
      }
      v23[6] = v33;
      v23[7] = v26;
      v23[8] = v34;
      if (v27) {
        operator delete(v27);
      }
      goto LABEL_44;
    }
LABEL_47:
    sub_58D8();
  }
  unsigned int *v24 = v5;
  uint64_t v26 = v24 + 1;
LABEL_44:
  v23[7] = v26;
}

void sub_701C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v24 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_7264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, const void *a13)
{
  __cxa_free_exception(v16);
  sub_7580(&a13);

  _Unwind_Resume(a1);
}

const void **sub_7580(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_7740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_7C90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7CA0(uint64_t a1)
{
}

void sub_7CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  if (v6 >= [*(id *)(a1 + 32) maxSequenceLength])
  {
    id v9 = [*(id *)(a1 + 32) sentences];
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
    [v9 addObject:v7];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeAllObjects];
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v10 = +[NSNumber numberWithUnsignedInt:a4];
  objc_msgSend(v8, "addObject:");
}

void sub_7D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_8240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_82D0(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unsigned int v5 = (__CFString *)LXEntryCopyString();
  uint64_t TokenID = LXEntryGetTokenID();
  if (a3 && CFEqual(*(CFStringRef *)(a1 + 48), v5))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = TokenID;
    *a3 = 1;
    if (!v5) {
      return;
    }
    goto LABEL_8;
  }
  id v7 = [(__CFString *)v5 decomposedStringWithCanonicalMapping];
  uint64_t v8 = [*(id *)(a1 + 48) decomposedStringWithCanonicalMapping];
  id v9 = [v7 length];
  if (v9 == [v8 length])
  {
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v11 = +[NSNumber numberWithUnsignedInt:TokenID];
    [v10 addObject:v11];
  }
  if (v5) {
LABEL_8:
  }
    CFRelease(v5);
}

void sub_83E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_8428((const void **)va, 0);
  _Unwind_Resume(a1);
}

void sub_8428(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void *sub_8460(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
  }
  return a1;
}

void sub_84E8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void sub_8518(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_8550(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_8588(const void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1 || (CFTypeID TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(a1)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_8630(exception);
  }

  sub_8640((const __CFArray *)a1, a2);
}

void sub_861C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *sub_8630@<X0>(std::runtime_error *a1@<X8>)
{
  return std::runtime_error::runtime_error(a1, "Could not convert");
}

void sub_8640(const __CFArray *a1@<X0>, uint64_t a2@<X8>)
{
  int Count = CFArrayGetCount(a1);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  sub_87A8((void **)a2, Count);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, i);
      float v7 = sub_8850(ValueAtIndex);
      float v8 = v7;
      id v10 = *(float **)(a2 + 8);
      unint64_t v9 = *(void *)(a2 + 16);
      if ((unint64_t)v10 >= v9)
      {
        unint64_t v12 = *(float **)a2;
        uint64_t v13 = ((uint64_t)v10 - *(void *)a2) >> 2;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62) {
          sub_58D8();
        }
        uint64_t v15 = v9 - (void)v12;
        if (v15 >> 1 > v14) {
          unint64_t v14 = v15 >> 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          unint64_t v17 = (char *)sub_58F0(a2 + 16, v16);
          unint64_t v12 = *(float **)a2;
          id v10 = *(float **)(a2 + 8);
        }
        else
        {
          unint64_t v17 = 0;
        }
        unint64_t v18 = (float *)&v17[4 * v13];
        *unint64_t v18 = v8;
        v11 = v18 + 1;
        while (v10 != v12)
        {
          int v19 = *((_DWORD *)v10-- - 1);
          *((_DWORD *)v18-- - 1) = v19;
        }
        *(void *)a2 = v18;
        *(void *)(a2 + 8) = v11;
        *(void *)(a2 + 16) = &v17[4 * v16];
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        float *v10 = v7;
        v11 = v10 + 1;
      }
      *(void *)(a2 + 8) = v11;
    }
  }
}

void sub_8784(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_87A8(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_58D8();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    id v6 = (char *)sub_58F0(v3, a2);
    float v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = &v6[4 * v8];
    id v10 = (char *)*a1;
    v11 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v11 != *a1)
    {
      unint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

float sub_8850(const __CFNumber *a1)
{
  uint64_t v1 = sub_88C4(a1);
  if ((v1 & 0xFF00000000) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_8630(exception);
  }
  return *(float *)&v1;
}

void sub_88B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_88C4(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return sub_8990(a1);
    }
  }

  return sub_892C(a1);
}

uint64_t sub_892C(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t v3 = COERCE_UNSIGNED_INT((float)CFBooleanGetValue(a1));
    uint64_t v4 = 0x100000000;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  return v3 | v4;
}

uint64_t sub_8990(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_15;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberFloat64Type;
      goto LABEL_25;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      int v18 = SLOBYTE(valuePtr);
      goto LABEL_13;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      int v18 = SLOWORD(valuePtr);
LABEL_13:
      float v19 = (float)v18;
      goto LABEL_26;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
LABEL_15:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      float v19 = (float)SLODWORD(valuePtr);
      goto LABEL_26;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloatType;
LABEL_19:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_27;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberDoubleType;
      goto LABEL_25;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberNSIntegerType;
LABEL_23:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      float v19 = (float)*(uint64_t *)&valuePtr;
      goto LABEL_26;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberCGFloatType;
LABEL_25:
      int Value = CFNumberGetValue(v15, v16, &valuePtr);
      float v19 = valuePtr;
LABEL_26:
      uint64_t v20 = LODWORD(v19);
LABEL_27:
      uint64_t v6 = v20 | 0x100000000;
      if (!Value) {
        uint64_t v6 = 0;
      }
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

void sub_8C90(id a1)
{
  byte_1F118 = MGGetBoolAnswer();
}

void sub_95D8(id a1)
{
  uint64_t v1 = +[NSMutableCharacterSet characterSetWithRange:](NSMutableCharacterSet, "characterSetWithRange:", 7840, 95);
  CFNumberRef v2 = (void *)qword_1F128;
  qword_1F128 = v1;

  CFNumberType v3 = (void *)qword_1F128;

  [v3 addCharactersInString:@"àÀãÃáÁăĂâÂđĐèÈéÉêÊìÌĩĨíÍòÒõÕóÓôÔơƠùÙũŨúÚưýÝ"];
}

void sub_9638(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_9C9C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) evaluationSession];
  id v2 = [v1 taskIsDeferred];

  return v2;
}

void sub_A204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, int a15, __int16 a16, char a17, char a18, int a19, __int16 a20,char a21,char a22)
{
  if (a2) {
    sub_57FC(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_A6E0(const __CFString *a1)
{
  if (CFStringHasPrefix(a1, @"zh"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_AEFC;
    block[3] = &unk_18868;
    block[4] = a1;
    if (qword_1F148 != -1) {
      dispatch_once(&qword_1F148, block);
    }
    id v2 = &qword_1F140;
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_AF70;
    v4[3] = &unk_18868;
    v4[4] = a1;
    if (qword_1F158 != -1) {
      dispatch_once(&qword_1F158, v4);
    }
    id v2 = &qword_1F150;
  }
  return *v2;
}

uint64_t sub_A808(const __CFString *a1)
{
  if (CFStringHasPrefix(a1, @"zh"))
  {
    if (qword_1F160 != -1) {
      dispatch_once(&qword_1F160, &stru_18888);
    }
    uint64_t v1 = &qword_1F168;
  }
  else
  {
    if (qword_1F170 != -1) {
      dispatch_once(&qword_1F170, &stru_188A8);
    }
    uint64_t v1 = &qword_1F178;
  }
  return *v1;
}

uint64_t sub_A894(uint64_t a1, uint64_t a2, uint64_t a3, const __CFString *a4)
{
  if (MecabraAnalyzeStringWithContext())
  {
    uint64_t v5 = -1;
    while (MecabraGetNextCandidate())
    {
      CFStringRef Surface = (const __CFString *)MecabraCandidateGetSurface();
      ++v5;
      if (CFEqual(Surface, a4)) {
        return v5;
      }
    }
  }
  return -1;
}

void sub_A90C(const void **a1, const void *a2)
{
  int v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_AD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_AEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AEFC(uint64_t a1)
{
  CFLocaleRef v1 = CFLocaleCreate(kCFAllocatorDefault, *(CFLocaleIdentifier *)(a1 + 32));
  v3.location = 0;
  v3.length = 0;
  qword_1F140 = (uint64_t)CFStringTokenizerCreate(kCFAllocatorDefault, 0, v3, 0x210004uLL, v1);

  CFRelease(v1);
}

void sub_AF70(uint64_t a1)
{
  CFLocaleRef v1 = CFLocaleCreate(kCFAllocatorDefault, *(CFLocaleIdentifier *)(a1 + 32));
  v3.location = 0;
  v3.length = 0;
  qword_1F150 = (uint64_t)CFStringTokenizerCreate(kCFAllocatorDefault, 0, v3, 0x10004uLL, v1);

  CFRelease(v1);
}

void sub_AFE4(id a1)
{
  qword_1F168 = MecabraCreateWithOptions();
}

void sub_B010(id a1)
{
  qword_1F178 = MecabraCreateWithOptions();
}

void sub_B158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_B180(uint64_t result)
{
  return result;
}

void sub_B1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_BB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)QuickTypeLanguageModel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_BE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  v23 = v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_BE88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_BE98(uint64_t a1)
{
}

void sub_BEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t TokenIDForString = a4;
  id v10 = [*(id *)(a1 + 32) stringForTokenID:a4 stringBytes:a2 numBytes:a3];
  if (v10)
  {
    if (!TokenIDForString)
    {
      uint64_t TokenIDForString = LMLanguageModelGetTokenIDForString();
      if (!TokenIDForString)
      {
        uint64_t TokenIDForString = LXLexiconGetFirstTokenIDForString();
        if (TokenIDForString)
        {
          uint64_t v6 = (const void *)LXLexiconCopyEntryForTokenID();
          uint64_t v7 = LXEntryCopyString();

          id v10 = (id)v7;
          CFRelease(v6);
        }
      }
    }
    CFNumberType v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v9 = [[QuickTypeToken alloc] initWithString:v10 tokenID:TokenIDForString];
    [v8 addObject:v9];
  }
}

void sub_BFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C478(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v11 = a2;
  unint64_t v12 = 0;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  while (LMPredictionEnumeratorAdvance() && v12 < *(void *)(*(void *)(a1 + 32) + 32))
  {
    LODWORD(v27) = 0;
    LMPredictionEnumeratorGetPrediction();
    StringForuint64_t TokenID = (void *)LMLanguageModelCreateStringForTokenID();
    CFNumberType v14 = [*(id *)(a1 + 40) string];
    unsigned int v15 = [StringForTokenID isEqualToString:v14];

    if (v15)
    {
      *a7 = 1;

      break;
    }
    ++v12;
  }
  if (!*a7)
  {
    CFNumberType v16 = [*(id *)(a1 + 40) string];
    unint64_t v17 = [v16 substringToIndex:a3 + a4];

    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    unint64_t v30 = sub_BE88;
    unint64_t v31 = sub_BE98;
    id v32 = +[NSMutableArray array];
    uint64_t v25 = *(void *)(a1 + 64);
    uint64_t v26 = *(void *)(a1 + 72);
    uint64_t v24 = *(void *)(a1 + 32);
    LMLanguageModelEnumerateCompletionsForPrefixWithBlock();
    int v18 = objc_msgSend((id)v28[5], "sortedArrayUsingComparator:", &stru_18960, _NSConcreteStackBlock, 3221225472, sub_C7E0, &unk_18920, v24, &v27, v25, v26);
    if (*(void *)(*(void *)(a1 + 32) + 32))
    {
      unint64_t v19 = 0;
      while (v19 < (unint64_t)[v18 count])
      {
        uint64_t v20 = [v18 objectAtIndexedSubscript:v19];
        [v20 tokenID];
        v21 = (void *)LMLanguageModelCreateStringForTokenID();

        int v22 = [*(id *)(a1 + 40) string];
        unsigned int v23 = [v21 isEqualToString:v22];

        if (v23)
        {
          *a7 = 1;

          break;
        }
        ++v19;

        if (v19 >= *(void *)(*(void *)(a1 + 32) + 32)) {
          break;
        }
      }
    }

    _Block_object_dispose(&v27, 8);
  }
}

void sub_C748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

id sub_C7E0(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  LMLanguageModelConditionalProbability();
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  CFNumberType v8 = [[QuickTypeCandidate alloc] initWithTokenID:a2 andScore:v7];
  [v6 addObject:v8];

  id result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  if ((unint64_t)result >= *(void *)(*(void *)(a1 + 32) + 40)) {
    *a3 = 1;
  }
  return result;
}

void sub_C88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_C89C(id a1, id a2, id a3)
{
  id v4 = a3;
  [a2 lmScore];
  double v6 = v5;
  [v4 lmScore];
  double v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  CFNumberType v8 = +[NSNumber numberWithDouble:v6];
  id v9 = [v7 compare:v8];

  return (int64_t)v9;
}

void sub_C930(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_CA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_CBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_CBF8(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_5894(a1, a2);
    id v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_CC54(_Unwind_Exception *exception_object)
{
  CFRange v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_CE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_DCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_DFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_E294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E2BC(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableArray);
  id v2 = (void *)qword_1F190;
  qword_1F190 = (uint64_t)v1;

  CFRange v3 = (void *)qword_1F190;
  double v5 = objc_alloc_init(QuickTypeFavoniusEvaluator);
  objc_msgSend(v3, "addObject:");

  id v4 = (void *)qword_1F190;
  double v6 = objc_alloc_init(QuickTypeMecabraEvaluator);
  objc_msgSend(v4, "addObject:");
}

void sub_E358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_E3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E658(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

void sub_EC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_F238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_F418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F548(const void **a1, const void *a2)
{
  id v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_F580(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_FC8C(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to load '%@' word embeddings", buf, 0xCu);
}

void sub_FCEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FD58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FDC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FE30()
{
  sub_63A8();
  sub_59EC(&dword_0, v0, v1, "NLPLearnerTask %ld is not supported", v2, v3, v4, v5, v6);
}

void sub_FE98()
{
  sub_63A8();
  __int16 v2 = 2048;
  uint64_t v3 = 1;
  __int16 v4 = 2048;
  uint64_t v5 = 2;
  __int16 v6 = 2048;
  uint64_t v7 = 3;
  __int16 v8 = 2048;
  uint64_t v9 = 4;
  __int16 v10 = 2048;
  uint64_t v11 = 5;
  __int16 v12 = 2048;
  uint64_t v13 = 6;
  __int16 v14 = 2048;
  uint64_t v15 = 7;
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Initializing data for %ld task.\n (Emoji %ld, LM Legacy %ld, Character LM %ld, LM Shipping %ld, LM Fragment %ld, LM Ngram %ld, ACT %ld)", v1, 0x52u);
}

void sub_FF60(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Processing %ld events extracted from CoreDuet", buf, 0xCu);
}

void sub_FFA8()
{
  sub_63A8();
  sub_59EC(&dword_0, v0, v1, "Unexpected call to addResource with '%@'", v2, v3, v4, v5, v6);
}

void sub_10010(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unexpected recipe parameter '%@'", (uint8_t *)&v2, 0xCu);
}

void sub_10088(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Task %ld doesn't have an associated privacy identifier", (uint8_t *)&v2, 0xCu);
}

void sub_10100(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Lexicon load failed %@", (uint8_t *)&v2, 0xCu);
}

void sub_10178(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Token id mapping failed", v1, 2u);
}

void sub_101BC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Tokens: '%@'", buf, 0xCu);
}

void sub_10214()
{
  __assert_rtn("-[NLPLearnerLanguageModelingData loadFromCoreDuet:limitSamplesTo:]_block_invoke", "NLPLearnerLanguageModelingData.mm", 145, "tokens.size() == 0 && \"unexpected sentence beginning\"");
}

void sub_10240(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to load character tokenization resources from '%@'", (uint8_t *)&v2, 0xCu);
}

void sub_102B8()
{
  sub_63A8();
  sub_9638(&dword_0, v0, v1, "Removed temporary file %@", v2, v3, v4, v5, v6);
}

void sub_10320()
{
  sub_9654();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Failed to remove temporary file %@: %@", v1, 0x16u);
}

void sub_10398()
{
  sub_63A8();
  sub_9638(&dword_0, v0, v1, "Processing sent message from CoreDuet: '%{sensitive}@'", v2, v3, v4, v5, v6);
}

void sub_10400()
{
  sub_63A8();
  sub_9638(&dword_0, v0, v1, "Processing sent email from CoreDuet:\n'%{sensitive}@'", v2, v3, v4, v5, v6);
}

void sub_10468(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to extract message for CoreDuet event's intent", v1, 2u);
}

void sub_104AC()
{
  sub_9654();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "'%{sensitive}@' discarded (detected language not matching %@)", v1, 0x16u);
}

void sub_10524()
{
  sub_63A8();
  sub_9638(&dword_0, v0, v1, "'%{sensitive}@' discarded (too short)", v2, v3, v4, v5, v6);
}

void sub_1058C()
{
  sub_63A8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Telemtry not supported for CoreDuet event %@", v1, 0xCu);
}

void sub_10600(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 taskIdentifier];
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to archive task %@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_106A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_106E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10718(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t CEMStringContainsEmoji()
{
  return _CEMStringContainsEmoji();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return _CFLocaleCreate(allocator, localeIdentifier);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return _CFNumberGetType(number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return _CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

uint64_t INTypedInteractionWithInteraction()
{
  return _INTypedInteractionWithInteraction();
}

uint64_t LMCreateMontrealIDsFromLMTokenIDSequence()
{
  return _LMCreateMontrealIDsFromLMTokenIDSequence();
}

uint64_t LMLanguageModelConditionalProbability()
{
  return _LMLanguageModelConditionalProbability();
}

uint64_t LMLanguageModelCreate()
{
  return _LMLanguageModelCreate();
}

uint64_t LMLanguageModelCreatePredictionEnumerator()
{
  return _LMLanguageModelCreatePredictionEnumerator();
}

uint64_t LMLanguageModelCreateStringForSpecialTokenID()
{
  return _LMLanguageModelCreateStringForSpecialTokenID();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return _LMLanguageModelCreateStringForTokenID();
}

uint64_t LMLanguageModelEnumerateCompletionsForPrefixWithBlock()
{
  return _LMLanguageModelEnumerateCompletionsForPrefixWithBlock();
}

uint64_t LMLanguageModelGetTokenIDForString()
{
  return _LMLanguageModelGetTokenIDForString();
}

uint64_t LMLanguageModelJointProbability()
{
  return _LMLanguageModelJointProbability();
}

uint64_t LMPredictionEnumeratorAdvance()
{
  return _LMPredictionEnumeratorAdvance();
}

uint64_t LMPredictionEnumeratorGetPrediction()
{
  return _LMPredictionEnumeratorGetPrediction();
}

uint64_t LMStreamTokenizerCreate()
{
  return _LMStreamTokenizerCreate();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return _LMStreamTokenizerPushBytes();
}

uint64_t LMStreamTokenizerReset()
{
  return _LMStreamTokenizerReset();
}

uint64_t LXEntryCopyString()
{
  return _LXEntryCopyString();
}

uint64_t LXEntryGetTokenID()
{
  return _LXEntryGetTokenID();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return _LXLexiconCopyEntryForTokenID();
}

uint64_t LXLexiconCreate()
{
  return _LXLexiconCreate();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return _LXLexiconEnumerateEntriesForString();
}

uint64_t LXLexiconGetFirstTokenIDForString()
{
  return _LXLexiconGetFirstTokenIDForString();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MecabraAnalyzeStringWithContext()
{
  return _MecabraAnalyzeStringWithContext();
}

uint64_t MecabraCandidateGetSurface()
{
  return _MecabraCandidateGetSurface();
}

uint64_t MecabraCreateWithOptions()
{
  return _MecabraCreateWithOptions();
}

uint64_t MecabraGetNextCandidate()
{
  return _MecabraGetNextCandidate();
}

uint64_t NLStringEmbeddingCreateWithOptions()
{
  return _NLStringEmbeddingCreateWithOptions();
}

uint64_t NLStringEmbeddingFillWordVectors()
{
  return _NLStringEmbeddingFillWordVectors();
}

uint64_t NLStringEmbeddingGetDimension()
{
  return _NLStringEmbeddingGetDimension();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSRange v3 = _NSRangeFromString(aString);
  NSUInteger length = v3.length;
  NSUInteger location = v3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_read_data_block()
{
  return _archive_read_data_block();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header()
{
  return _archive_read_next_header();
}

uint64_t archive_read_open_filename()
{
  return _archive_read_open_filename();
}

uint64_t archive_read_support_filter_all()
{
  return _archive_read_support_filter_all();
}

uint64_t archive_read_support_format_all()
{
  return _archive_read_support_format_all();
}

uint64_t archive_write_data_block()
{
  return _archive_write_data_block();
}

uint64_t archive_write_disk_new()
{
  return _archive_write_disk_new();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return _archive_write_disk_set_standard_lookup();
}

uint64_t archive_write_finish_entry()
{
  return _archive_write_finish_entry();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__nonNilParameters(void *a1, const char *a2, ...)
{
  return [a1 _nonNilParameters];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowRunningPFLTask(void *a1, const char *a2, ...)
{
  return [a1 allowRunningPFLTask];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bosTokenID(void *a1, const char *a2, ...)
{
  return [a1 bosTokenID];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_chracterCount(void *a1, const char *a2, ...)
{
  return [a1 chracterCount];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreDuetEvents(void *a1, const char *a2, ...)
{
  return [a1 coreDuetEvents];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decomposedStringWithCanonicalMapping(void *a1, const char *a2, ...)
{
  return [a1 decomposedStringWithCanonicalMapping];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMaxSequenceLength(void *a1, const char *a2, ...)
{
  return [a1 defaultMaxSequenceLength];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_dominantLanguage(void *a1, const char *a2, ...)
{
  return [a1 dominantLanguage];
}

id objc_msgSend_eosTokenID(void *a1, const char *a2, ...)
{
  return [a1 eosTokenID];
}

id objc_msgSend_evaluationSession(void *a1, const char *a2, ...)
{
  return [a1 evaluationSession];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return [a1 interaction];
}

id objc_msgSend_isOOV(void *a1, const char *a2, ...)
{
  return [a1 isOOV];
}

id objc_msgSend_iterator(void *a1, const char *a2, ...)
{
  return [a1 iterator];
}

id objc_msgSend_ksrScore(void *a1, const char *a2, ...)
{
  return [a1 ksrScore];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lmScore(void *a1, const char *a2, ...)
{
  return [a1 lmScore];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailCount(void *a1, const char *a2, ...)
{
  return [a1 mailCount];
}

id objc_msgSend_matchingRecordSet(void *a1, const char *a2, ...)
{
  return [a1 matchingRecordSet];
}

id objc_msgSend_maxSequenceLength(void *a1, const char *a2, ...)
{
  return [a1 maxSequenceLength];
}

id objc_msgSend_messageCount(void *a1, const char *a2, ...)
{
  return [a1 messageCount];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nativeRecordInfo(void *a1, const char *a2, ...)
{
  return [a1 nativeRecordInfo];
}

id objc_msgSend_numCharacters(void *a1, const char *a2, ...)
{
  return [a1 numCharacters];
}

id objc_msgSend_numOutputClasses(void *a1, const char *a2, ...)
{
  return [a1 numOutputClasses];
}

id objc_msgSend_numSamples(void *a1, const char *a2, ...)
{
  return [a1 numSamples];
}

id objc_msgSend_numSavedCharacters(void *a1, const char *a2, ...)
{
  return [a1 numSavedCharacters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_processingNewRecord(void *a1, const char *a2, ...)
{
  return [a1 processingNewRecord];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return [a1 recipe];
}

id objc_msgSend_recipeUserInfo(void *a1, const char *a2, ...)
{
  return [a1 recipeUserInfo];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_sentenceInMailCount(void *a1, const char *a2, ...)
{
  return [a1 sentenceInMailCount];
}

id objc_msgSend_sentenceInMessagesCount(void *a1, const char *a2, ...)
{
  return [a1 sentenceInMessagesCount];
}

id objc_msgSend_sentences(void *a1, const char *a2, ...)
{
  return [a1 sentences];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 taskIdentifier];
}

id objc_msgSend_taskIsDeferred(void *a1, const char *a2, ...)
{
  return [a1 taskIsDeferred];
}

id objc_msgSend_tokenID(void *a1, const char *a2, ...)
{
  return [a1 tokenID];
}

id objc_msgSend_tokenIDMapPath(void *a1, const char *a2, ...)
{
  return [a1 tokenIDMapPath];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userTypedContent(void *a1, const char *a2, ...)
{
  return [a1 userTypedContent];
}

id objc_msgSend_vietnameseCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 vietnameseCharacterSet];
}