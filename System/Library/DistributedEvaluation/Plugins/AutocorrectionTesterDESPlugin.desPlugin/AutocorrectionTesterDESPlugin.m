id sub_4038()
{
  void *v0;
  uint64_t vars8;

  if (qword_AE398 != -1) {
    dispatch_once(&qword_AE398, &stru_8CCB0);
  }
  v0 = (void *)qword_AE390;

  return v0;
}

void sub_408C(id a1)
{
  qword_AE390 = (uint64_t)os_log_create("com.apple.TextInput", "TTKLog");

  _objc_release_x1();
}

void sub_49A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_49C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_49D0(uint64_t a1)
{
}

void sub_49D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  v10 = (char *)[*(id *)(a1 + 32) length];
  if (a3)
  {
    if ((unint64_t)&v10[-a3] >= 0x21)
    {
      v11 = [*(id *)(a1 + 32) substringFromIndex:a3];
      uint64_t v12 = +[NSString stringWithFormat:@"...%@", v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      *a7 = 1;
    }
  }
}

void sub_4FE8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL sub_50E8(UTF32Char a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

uint64_t sub_5444(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_54F4()
{
  v0 = objc_alloc_init(TIAppAutofillManagerMock);
  if (objc_opt_respondsToSelector()) {
    +[TIAppAutofillManager performSelector:"setSharedAppAutofillManager:" withObject:v0];
  }
}

uint64_t sub_5568()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return (uint64_t)+[TIAppAutofillManager performSelector:"setSharedAppAutofillManager:" withObject:0];
  }
  return result;
}

void sub_74C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_8348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_837C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v35 = a3;
  v39 = +[NSMutableArray array];
  v38 = +[NSMutableArray array];
  v37 = +[NSMutableArray array];
  v6 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  v8 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v14 = [v13 touchedKey];
        [v39 addObject:v14];

        v15 = [v13 insertedKey];
        [v7 addObject:v15];

        v16 = [v13 predictionBarState];
        [v37 addObject:v16];

        v17 = [v13 inlineCompletionBarState];
        [v6 addObject:v17];

        uint64_t v18 = [v13 documentState];
        v19 = (void *)v18;
        if (v18) {
          CFStringRef v20 = (const __CFString *)v18;
        }
        else {
          CFStringRef v20 = &stru_8DEF0;
        }
        [v8 addObject:v20];

        v21 = [v13 touch];
        [v38 addObject:v21];

        ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      }
      id v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v10);
  }

  v22 = *(void **)(a1 + 32);
  id v23 = [v39 copy];
  [v22 addObject:v23];

  v24 = *(void **)(a1 + 40);
  id v25 = [v7 copy];
  [v24 addObject:v25];

  v26 = *(void **)(a1 + 48);
  id v27 = [v37 copy];
  [v26 addObject:v27];

  v28 = *(void **)(a1 + 56);
  id v29 = [v6 copy];
  [v28 addObject:v29];

  v30 = *(void **)(a1 + 64);
  id v31 = [v8 copy];
  [v30 addObject:v31];

  v32 = *(void **)(a1 + 72);
  id v33 = [v38 copy];
  [v32 addObject:v33];

  v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[*(id *)(a1 + 40) count] - 1);
  if (v35) {
    [*(id *)(a1 + 80) setObject:v35 forKeyedSubscript:v34];
  }
}

void sub_8DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_A5C0(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_AB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AF5C(_Unwind_Exception *a1)
{
  id v7 = v4;

  _Unwind_Resume(a1);
}

void sub_B0C4(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_B188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v14 = v11;

  _Unwind_Resume(a1);
}

void sub_B3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_BAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_BF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_C188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C2BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CCA0()
{
  if ((byte_AE3B0 & 1) == 0)
  {
    Class v0 = NSClassFromString(@"TIAnalyticsService");
    if (v0)
    {
      Class v1 = v0;
      id v2 = objc_alloc((Class)TIAnalyticsService);
      v3 = objc_opt_new();
      id v4 = [v2 initWithProvider:v3];
      id v5 = (void *)qword_AE3A8;
      qword_AE3A8 = (uint64_t)v4;

      uint64_t v6 = qword_AE3A8;
      [(objc_class *)v1 setMockInstance:v6];
    }
    else
    {
      byte_AE3B0 = 1;
    }
  }
}

void sub_CD54()
{
  if ((byte_AE3B0 & 1) == 0)
  {
    [NSClassFromString(@"TIAnalyticsService") setMockInstance:0];
    Class v0 = (void *)qword_AE3A8;
    qword_AE3A8 = 0;
  }
}

id sub_CDAC()
{
  Class v0 = [(id)qword_AE3A8 provider];
  Class v1 = [v0 allEvents];

  return v1;
}

id sub_CE00(void *a1)
{
  Class v1 = (void *)qword_AE3A8;
  id v2 = a1;
  v3 = [v1 provider];
  id v4 = [TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v2];

  id v5 = [v3 eventsWithName:v4];

  return v5;
}

id sub_CEA4(void *a1)
{
  Class v1 = (void *)qword_AE3A8;
  id v2 = a1;
  v3 = [v1 provider];
  id v4 = [TIAnalyticsInputAnalyticsDomain stringByAppendingFormat:@".%@", v2];

  id v5 = [v3 eventsWithName:v4];

  return v5;
}

id _TIGetMockingAnalyticsServiceEventsForMultipleEventNames(void *a1)
{
  id v1 = a1;
  id v2 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v1;
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    uint64_t v6 = (void *)TIAnalyticsKeyboardDomain;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v9 = [(id)qword_AE3A8 provider];
        id v10 = [v6 stringByAppendingFormat:@".%@", v8];
        uint64_t v11 = [v9 eventsWithName:v10];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              [v2 addObject:*(void *)(*((void *)&v19 + 1) + 8 * (void)j)];
            }
            id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v14);
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  return v2;
}

id sub_D160(void *a1)
{
  id v1 = (void *)qword_AE3A8;
  id v2 = a1;
  id v3 = [v1 provider];
  id v4 = [TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v2];

  id v5 = [v3 countEvent:v4];
  return v5;
}

id sub_D1F0(void *a1, void *a2)
{
  id v3 = (void *)qword_AE3A8;
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 provider];
  id v7 = [TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v5];

  id v8 = [v6 countEvent:v7 filteredWithPredicate:v4];
  return v8;
}

id sub_D294(void *a1, void *a2)
{
  id v3 = (void *)qword_AE3A8;
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 provider];
  id v7 = [TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v5];

  id v8 = [v6 sumIntegerField:v4 forEvent:v7];
  return v8;
}

id sub_D338(void *a1, void *a2, void *a3)
{
  id v5 = (void *)qword_AE3A8;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  id v9 = [v5 provider];
  id v10 = [TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v8];

  id v11 = [v9 sumIntegerField:v7 forEvent:v10 filteredWithPredicate:v6];
  return v11;
}

double sub_D3F8(void *a1, void *a2)
{
  id v3 = (void *)qword_AE3A8;
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 provider];
  id v7 = [TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v5];

  [v6 sumFloatField:v4 forEvent:v7];
  double v9 = v8;

  return v9;
}

double sub_D4A4(void *a1, void *a2, void *a3)
{
  id v5 = (void *)qword_AE3A8;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  double v9 = [v5 provider];
  id v10 = [TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v8];

  [v9 sumFloatField:v7 forEvent:v10 filteredWithPredicate:v6];
  double v12 = v11;

  return v12;
}

void sub_D56C()
{
  id v0 = [(id)qword_AE3A8 provider];
  [v0 clear];
}

void _TIBeginMockingAssetManager()
{
  byte_AE3B1 = 1;
  id v0 = objc_alloc_init(TIAssetManagerMock);
  if (objc_opt_respondsToSelector()) {
    +[TIAssetManager performSelector:"setSharedAssetManager:" withObject:v0];
  }
}

void _TIEndMockingAssetManager()
{
  if (byte_AE3B1 == 1)
  {
    byte_AE3B1 = 0;
    if (objc_opt_respondsToSelector())
    {
      +[TIAssetManager performSelector:"setSharedAssetManager:" withObject:0];
    }
  }
}

void sub_F55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_F6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F988(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

double sub_FAA8(double *a1, uint64_t a2)
{
  double v4 = a1[1] - *a1;
  double v5 = (double)sub_10C00(a2);
  return *a1 + v4 * ((v5 + (double)sub_10C00(a2) * 4294967300.0) * 5.42101086e-20);
}

void sub_FE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_FFA4(void *a1)
{
  id v1 = a1;
  id v2 = (char *)[v1 _rangeOfLongCharacterAtIndex:0];
  if (&v2[v3] == [v1 length])
  {
    UChar32 v4 = [v1 _firstLongCharacter];
    if (u_ispunct(v4)) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = u_isdigit(v4) != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_10030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10044(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"Shift"] & 1) != 0
    || ([v1 isEqualToString:@"More"] & 1) != 0
    || ([v1 isEqualToString:@"Delete"] & 1) != 0)
  {
    id v2 = &def_3B118 + 1;
  }
  else
  {
    id v2 = [v1 isEqualToString:@"\n"];
  }

  return v2;
}

void sub_100C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_103D4(_Unwind_Exception *a1)
{
  UChar32 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10740(_Unwind_Exception *a1)
{
  UChar32 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10C00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2496);
  unint64_t v2 = (v1 + 1) % 0x270uLL;
  unsigned int v3 = *(_DWORD *)(a1 + 4 * ((v1 + 397) % 0x270uLL)) ^ ((*(_DWORD *)(a1 + 4 * v2) & 0x7FFFFFFE | *(_DWORD *)(a1 + 4 * v1) & 0x80000000) >> 1) ^ ((int)(*(_DWORD *)(a1 + 4 * v2) << 31) >> 31) & 0x9908B0DF;
  *(_DWORD *)(a1 + 4 * v1) = v3;
  *(void *)(a1 + 2496) = v2;
  LODWORD(v1) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (v1 << 15) & 0xEFC60000 ^ v1 ^ (((v1 << 15) & 0xEFC60000 ^ v1) >> 18);
}

void sub_10EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10F14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10F24(uint64_t a1)
{
}

uint64_t sub_10F2C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return _objc_release_x1();
}

void sub_110B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) partfileArchivePathsMutable];
  [v2 addObject:*(void *)(a1 + 40)];
}

uint64_t sub_1130C(uint64_t a1)
{
  [*(id *)(a1 + 32) serializeResultsArray:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    unsigned int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

intptr_t sub_11648(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_11758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_121C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id a41,char a42)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a42, 8);

  _Unwind_Resume(a1);
}

__n128 sub_122D4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t sub_122E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_122F4(uint64_t a1)
{
}

void sub_122FC(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v18 = v4;
  if (!v7)
  {
    objc_storeStrong(v6, a2);
    id v4 = v18;
  }
  [v4 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  if (IsNull)
  {
    *(CGFloat *)(v17 + 48) = v9;
    *(CGFloat *)(v17 + 56) = v11;
    *(CGFloat *)(v17 + 64) = v13;
    *(CGFloat *)(v17 + 72) = v15;
  }
  else
  {
    v20.origin.x = v9;
    v20.origin.y = v11;
    v20.size.width = v13;
    v20.size.height = v15;
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = CGRectUnion(*(CGRect *)(v17 + 48), v20);
  }
}

void sub_123E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_127C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_12BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _TIBeginMockingKeyboardActivityController()
{
  uint64_t v1 = objc_alloc_init(TIKeyboardAssertionManagerMock);
  if (objc_opt_respondsToSelector()) {
    +[TIKeyboardAssertionManager performSelector:"setSharedAssertionManager:" withObject:v1];
  }
  id v0 = objc_alloc_init(TIKeyboardActivityControllerMock);
  if (objc_opt_respondsToSelector()) {
    +[TIKeyboardActivityController performSelector:"setSharedController:" withObject:v0];
  }
}

uint64_t _TIEndMockingKeyboardActivityController()
{
  if (objc_opt_respondsToSelector()) {
    +[TIKeyboardActivityController performSelector:"setSharedController:" withObject:0];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return (uint64_t)+[TIKeyboardAssertionManager performSelector:"setSharedAssertionManager:" withObject:0];
  }
  return result;
}

void sub_13890(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_13928(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingContactManagerWithContactCollection(void *a1)
{
  id v1 = a1;
  id v2 = [[TIContactManagerMock alloc] initWithContactCollection:v1];

  if (objc_opt_respondsToSelector()) {
    +[TIContactManager performSelector:"setSharedTIContactManager:" withObject:v2];
  }
}

void _TIEndMockingContactManager()
{
  if (objc_opt_respondsToSelector())
  {
    id v10 = +[TIContactManager sharedTIContactManager];
    id v0 = [v10 observers];
    id v1 = [v0 count];

    if (v1)
    {
      id v2 = TIBundleForInputMode();
      id v3 = [v2 classNamed:@"TIWordSearchKana"];
      if (objc_opt_respondsToSelector()) {
        [v3 performSelector:"clearCachedContactObserver"];
      }
      id v4 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
      while (1)
      {
        uint64_t v5 = +[NSRunLoop currentRunLoop];
        id v6 = +[NSDate dateWithTimeIntervalSinceNow:0.1];
        [v5 runMode:NSDefaultRunLoopMode beforeDate:v6];

        uint64_t v7 = [v10 observers];
        if (![v7 count]) {
          break;
        }
        double v8 = +[NSDate date];
        CGFloat v9 = [v8 laterDate:v4];

        if (v9 != v4) {
          goto LABEL_11;
        }
      }

LABEL_11:
    }
    if (objc_opt_respondsToSelector()) {
      +[TIContactManager performSelector:"setSharedTIContactManager:" withObject:0];
    }
  }
}

id sub_1497C(void *a1)
{
  id v1 = a1;
  if ([v1 length]
    && (id v2 = (char *)[v1 _rangeOfLongCharacterAtIndex:0], &v2[v3] == objc_msgSend(v1, "length")))
  {
    id v4 = [v1 _firstLongCharacter];
    uint64_t v5 = +[NSCharacterSet letterCharacterSet];
    id v6 = [v5 longCharacterIsMember:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL sub_14A10(void *a1)
{
  id v1 = a1;
  if ([v1 length] == (char *)&def_3B118 + 1) {
    UChar32 v2 = [v1 _firstLongCharacter];
  }
  else {
    UChar32 v2 = 0;
  }
  BOOL v3 = u_isspace(v2) != 0;

  return v3;
}

BOOL sub_14A64(void *a1)
{
  id v1 = a1;
  if ([v1 length] == (char *)&def_3B118 + 1) {
    UChar32 v2 = [v1 _firstLongCharacter];
  }
  else {
    UChar32 v2 = 0;
  }
  if (u_isdigit(v2)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = u_ispunct(v2) != 0;
  }

  return v3;
}

BOOL sub_14AD4(void *a1)
{
  id v1 = a1;
  if ([v1 length] == (char *)&def_3B118 + 1) {
    UChar32 v2 = [v1 _firstLongCharacter];
  }
  else {
    UChar32 v2 = 0;
  }
  if (u_ispunct(v2)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = u_isWhitespace(v2) != 0;
  }

  return v3;
}

uint64_t sub_16328(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cursor];
  id v5 = [v4 rangeOfInputSegmentsForCandidate:v3];

  id v6 = [v3 input];
  if ([v6 length])
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    double v8 = [v7 document];
    CGFloat v9 = [v3 input];
    unsigned int v10 = [v8 hasSuffix:v9];
  }
  else
  {
    unsigned int v10 = 1;
  }

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }

  return v11;
}

int64_t sub_16408(id a1, TIKeyboardCandidate *a2, TIKeyboardCandidate *a3)
{
  id v4 = a3;
  id v5 = [(TIKeyboardCandidate *)a2 candidate];
  id v6 = [v5 length];

  uint64_t v7 = [(TIKeyboardCandidate *)v4 candidate];

  id v8 = [v7 length];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

void sub_19764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_197C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_197D0(uint64_t a1)
{
}

void sub_197D8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v17 = a2;
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, 1);
      unsigned __int8 v7 = [v17 isEqualToString:v6];

      if (v7) {
        break;
      }
      if (++v5 >= (unint64_t)[*(id *)(a1 + 32) length]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    id v8 = [*(id *)(a1 + 40) delegate];
    CGFloat v9 = [v8 keyplane];

    unsigned int v10 = objc_msgSend(*(id *)(a1 + 40), "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v17, v9, objc_msgSend(*(id *)(a1 + 40), "lastActionUseSecondaryString"), 1);
    if (v10
      || ([*(id *)(a1 + 40) delegate],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [v11 mapShiftedKeyToUnShiftedKeyExcludeCapitalization:v17],
          unsigned int v10 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10))
    {
      [*(id *)(a1 + 48) addObject:v10];
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v12 = [v10 representedString];
        uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
        double v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      CGFloat v15 = [v10 representedString];
      id v16 = [v15 caseInsensitiveCompare:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

      if (v16) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

id sub_1A198(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[TTKConversationMessage fromJsonDict:](TTKConversationMessage, "fromJsonDict:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v2 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id sub_1A2D8(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "toJsonDict", (void)v10);
        [v2 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id sub_1A884(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[TTKConversationTest fromJsonDict:](TTKConversationTest, "fromJsonDict:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v2 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id _TIQueueBackground()
{
  if (qword_AE3C0 != -1) {
    dispatch_once(&qword_AE3C0, &stru_8CEC8);
  }
  id v0 = (void *)qword_AE3B8;

  return v0;
}

void sub_1AA18(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create(0, v3);
  id v2 = (void *)qword_AE3B8;
  qword_AE3B8 = (uint64_t)v1;
}

id _TIQueueLow()
{
  if (qword_AE3D0 != -1) {
    dispatch_once(&qword_AE3D0, &stru_8CEE8);
  }
  id v0 = (void *)qword_AE3C8;

  return v0;
}

void sub_1AAD4(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create(0, v3);
  id v2 = (void *)qword_AE3C8;
  qword_AE3C8 = (uint64_t)v1;
}

id _TIQueueUserInitiated()
{
  if (qword_AE3E0 != -1) {
    dispatch_once(&qword_AE3E0, &stru_8CF08);
  }
  id v0 = (void *)qword_AE3D8;

  return v0;
}

void sub_1AB90(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create(0, v3);
  id v2 = (void *)qword_AE3D8;
  qword_AE3D8 = (uint64_t)v1;
}

void TIDispatchSync(void *a1, void *a2)
{
  queue = a1;
  id v3 = a2;
  if (qword_AE3F0 != -1) {
    dispatch_once(&qword_AE3F0, &stru_8CF50);
  }
  atomic_fetch_add((atomic_ullong *volatile)&qword_AE3E8, 1uLL);
  dispatch_sync(queue, v3);
  if (qword_AE3F0 != -1) {
    dispatch_once(&qword_AE3F0, &stru_8CF50);
  }
  atomic_fetch_add((atomic_ullong *volatile)&qword_AE3E8, 0xFFFFFFFFFFFFFFFFLL);
}

void TIDispatchAsync(void *a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1ADB0;
  v6[3] = &unk_8CF30;
  id v7 = a2;
  id v3 = v7;
  id v4 = a1;
  id v5 = objc_retainBlock(v6);
  if (qword_AE3F0 != -1) {
    dispatch_once(&qword_AE3F0, &stru_8CF50);
  }
  atomic_fetch_add((atomic_ullong *volatile)&qword_AE3E8, 1uLL);
  dispatch_async(v4, v5);
}

void sub_1ADB0(uint64_t a1)
{
  if (qword_AE3F0 != -1) {
    dispatch_once(&qword_AE3F0, &stru_8CF50);
  }
  atomic_fetch_add((atomic_ullong *volatile)&qword_AE3E8, 0xFFFFFFFFFFFFFFFFLL);
}

unint64_t TIDispatchCount()
{
  if (qword_AE3F0 != -1) {
    dispatch_once(&qword_AE3F0, &stru_8CF50);
  }
  return atomic_load(&qword_AE3E8);
}

void TIDispatchWaitForAllBlocks()
{
  while (1)
  {
    if (qword_AE3F0 != -1) {
      dispatch_once(&qword_AE3F0, &stru_8CF50);
    }
    uint64_t v1 = atomic_load(&qword_AE3E8);
    if (v1 < 1) {
      break;
    }
    id v2 = +[NSRunLoop currentRunLoop];
    id v3 = +[NSDate dateWithTimeIntervalSinceNow:0.01];
    [v2 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v3];
  }
}

void sub_1AF54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF70(id a1)
{
}

void sub_1B06C(id a1)
{
  uint64_t v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, "testingParameters");
  id v3 = class_getInstanceMethod(v1, "mockTestingParameters");
  if (InstanceMethod) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = v3;
    Implementation = method_getImplementation(v3);
    TypeEncoding = method_getTypeEncoding(v5);
    if (class_addMethod(v1, "testingParameters", Implementation, TypeEncoding))
    {
      CGFloat v9 = method_getImplementation(InstanceMethod);
      long long v10 = method_getTypeEncoding(InstanceMethod);
      class_replaceMethod(v1, "mockTestingParameters", v9, v10);
    }
    else
    {
      method_exchangeImplementations(InstanceMethod, v5);
    }
  }
}

void sub_1BA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1BA58(uint64_t a1, void *a2)
{
  [a2 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  long long v12 = *(CGRect **)(*(void *)(a1 + 32) + 8);
  if (IsNull)
  {
    v12[1].origin.x = v4;
    v12[1].origin.y = v6;
    v12[1].size.width = v8;
    v12[1].size.height = v10;
    long long v13 = *(CGFloat **)(*(void *)(a1 + 40) + 8);
    v13[4] = v4;
    v13[5] = v6;
    v13[6] = v8;
    v13[7] = v10;
  }
  else
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(v12[1], v14);
  }
}

void sub_1BB08(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v23.origin.x = v3;
  v23.origin.y = v5;
  v23.size.width = v7;
  v23.size.height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v23)) {
    goto LABEL_4;
  }
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v24))
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    double v12 = MaxX - CGRectGetMinX(v19);
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    double v13 = CGRectGetMaxX(v20);
    if (v12 > v13 - CGRectGetMaxX(*(CGRect *)(a1 + 56))) {
LABEL_4:
    }
      [*(id *)(a1 + 32) addObject:v17];
  }
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 88), v25)) {
    goto LABEL_8;
  }
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v26))
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    double v14 = CGRectGetMaxX(v21);
    double v15 = v14 - CGRectGetMinX(*(CGRect *)(a1 + 88));
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.width = v8;
    v22.size.height = v10;
    if (v15 > MinX - CGRectGetMinX(v22)) {
LABEL_8:
    }
      [*(id *)(a1 + 40) addObject:v17];
  }
}

void sub_1BF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BF54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BF64(uint64_t a1)
{
}

void sub_1BF6C(uint64_t a1, void *a2)
{
  id v16 = a2;
  [v16 frame];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double MinX = CGRectGetMinX(v18);
  double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
  [v16 frame];
  double v11 = v10;
  [*(id *)(a1 + 32) frame];
  if (v11 >= v12)
  {
    double v14 = MinX - MaxX;
  }
  else
  {
    double v13 = CGRectGetMinX(*(CGRect *)(a1 + 56));
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v14 = v13 - CGRectGetMaxX(v19);
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v14 < *(double *)(v15 + 24))
  {
    *(double *)(v15 + 24) = v14;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

id sub_1DFDC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

id sub_1DFE8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

void sub_1E1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1E1FC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

id sub_1E7E4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
  CGFloat v3 = *(void **)(a1 + 32);

  return [v3 updateAutoshift];
}

id sub_1E8E8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

void sub_1ECE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ED0C(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_1F0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1F118(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_20364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2037C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  CGFloat v7 = *(void **)(a1 + 32);
  id v8 = a2;
  CGFloat v9 = [v7 layoutUtils];
  objc_msgSend(v9, "representedStringForKey:shifted:", v8, objc_msgSend(*(id *)(a1 + 40), "isShiftKeyplane"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 48) isEqualToString:v10])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void sub_211B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v11 = a2;
  uint64_t v6 = [v5 textToCommit];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 208);
  *(void *)(v7 + 208) = v6;

  CGFloat v9 = *(void **)(a1 + 32);
  id v10 = [v5 textToCommit];

  [v9 insertText:v10];
  [*(id *)(a1 + 32) setKeyboardConfiguration:v11];
}

id sub_216D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

void sub_21DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v13 = a2;
  id v11 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  unsigned __int8 v12 = [v13 isEqualToString:v11];

  if (v12)
  {
    if (a4 == 1
      && objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0)))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + 1;
    }
  }
  else
  {
    *a7 = 1;
  }
}

id sub_22090(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAutocorrectionList:a2];
}

id sub_22154(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAutocorrectionList:a2];
}

void sub_227C0(uint64_t a1, void *a2)
{
  CGFloat v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setAutocorrectionList:v4];
  id v5 = [v4 corrections];

  uint64_t v6 = [v5 autocorrection];
  unsigned int v7 = [v6 isContinuousPathConversion];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v8 lock];

    [*(id *)(a1 + 32) setLastCPRequestToken:*(void *)(a1 + 40)];
    CGFloat v9 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v9 unlock];

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    [v10 closeRequestToken:v11];
  }
}

void sub_22894(uint64_t a1, void *a2)
{
  CGFloat v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setAutocorrectionList:v4];
  id v5 = [v4 corrections];

  uint64_t v6 = [v5 autocorrection];
  unsigned int v7 = [v6 isContinuousPathConversion];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v8 lock];

    [*(id *)(a1 + 32) setLastCPRequestToken:0];
    id v9 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v9 unlock];
  }
}

void sub_22CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id *sub_22D1C(id *result, uint64_t a2)
{
  if (a2)
  {
    id v2 = result;
    uint64_t result = (id *)[result[4] setCandidateResultSet:a2];
    *(unsigned char *)(*((void *)v2[5] + 1) + 24) = 1;
  }
  return result;
}

void sub_22EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22EC0(uint64_t a1, void *a2)
{
}

void sub_23294(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) updateKeyboardOutput:v15 withInputForSmartPunctuation:*(void *)(a1 + 40)];
  if ([v15 deletionCount])
  {
    unint64_t v6 = 0;
    do
    {
      [*(id *)(a1 + 32) deleteBackwards];
      ++v6;
    }
    while (v6 < (unint64_t)[v15 deletionCount]);
  }
  unsigned int v7 = [v15 insertionText];

  if (v7)
  {
    if ([*(id *)(a1 + 32) inputIsPunctuationFollowingContinuousPath]) {
      [*(id *)(a1 + 32) deleteBackwards];
    }
    id v8 = *(void **)(a1 + 32);
    id v9 = [v15 insertionText];
    [v8 insertText:v9];
  }
  id v10 = [v15 shortcutConversion];

  if (v10)
  {
    id v11 = objc_alloc((Class)TICorrectionCandidates);
    unsigned __int8 v12 = [v15 shortcutConversion];
    id v13 = [v11 initWithAutocorrection:v12 alternateCorrections:0];

    double v14 = +[TIAutocorrectionList listWithCorrections:v13 predictions:0];
    [*(id *)(a1 + 32) setAutocorrectionList:v14];
  }
  [*(id *)(a1 + 32) setKeyboardConfiguration:v5];
}

void sub_259A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingUserDictionaryServer()
{
}

void _TIBeginMockingUserDictionaryServerWithPairs(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(TIUserDictionaryServerMock);
  [(TIUserDictionaryServerMock *)v2 setPairs:v1];

  if (objc_opt_respondsToSelector()) {
    +[TIUserDictionaryServer performSelector:"setSharedInstance:" withObject:v2];
  }
}

uint64_t _TIEndMockingUserDictionaryServer()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return (uint64_t)+[TIUserDictionaryServer performSelector:"setSharedInstance:" withObject:0];
  }
  return result;
}

double sub_26A70(double a1)
{
  double v1 = 1.0;
  if (a1 <= 1.0) {
    double v1 = a1;
  }
  BOOL v2 = a1 < 0.0;
  double result = 0.0;
  if (!v2) {
    return v1;
  }
  return result;
}

void sub_279B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_27B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_27DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_27E08(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    id v5 = [objc_alloc((Class)NSString) initWithBytes:a2 length:a3 encoding:4];
    unint64_t v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v7 = [v5 stringByTrimmingCharactersInSet:v6];

    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
}

void sub_27ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_28350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_283D0()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)qword_AE428;
  uint64_t v8 = qword_AE428;
  if (!qword_AE428)
  {
    double v1 = (void *)sub_29B2C();
    v6[3] = (uint64_t)dlsym(v1, "kLXLexiconNameKey");
    qword_AE428 = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    id v4 = (_Unwind_Exception *)sub_593F0();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  BOOL v2 = *v0;

  return v2;
}

id sub_284D8()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)qword_AE430;
  uint64_t v8 = qword_AE430;
  if (!qword_AE430)
  {
    double v1 = (void *)sub_29B2C();
    v6[3] = (uint64_t)dlsym(v1, "kLXLexiconLocaleKey");
    qword_AE430 = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    id v4 = (_Unwind_Exception *)sub_593F0();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  BOOL v2 = *v0;

  return v2;
}

uint64_t sub_285E0(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v4 = (uint64_t (*)(uint64_t, uint64_t))off_AE438;
  id v11 = off_AE438;
  if (!off_AE438)
  {
    uint64_t v5 = (void *)sub_29B2C();
    v9[3] = (uint64_t)dlsym(v5, "LXLexiconCreateTransient");
    off_AE438 = (_UNKNOWN *)v9[3];
    id v4 = (uint64_t (*)(uint64_t, uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    uint64_t v7 = (_Unwind_Exception *)sub_593F0();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2);
}

void sub_2878C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)TITransientLexiconManagerMock;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_287B8(void *a1)
{
}

void sub_28880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_289D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_28A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_28C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose((const void *)(v11 - 96), 8);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_28CA0(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  unint64_t v6 = (uint64_t (*)(uint64_t))off_AE448;
  id v13 = off_AE448;
  if (!off_AE448)
  {
    uint64_t v7 = (void *)sub_29B2C();
    v11[3] = (uint64_t)dlsym(v7, "LXEntryCopyString");
    off_AE448 = (_UNKNOWN *)v11[3];
    unint64_t v6 = (uint64_t (*)(uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    id v9 = (_Unwind_Exception *)sub_593F0();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  CFStringRef v8 = (const __CFString *)v6(a2);
  if (CFStringCompare(v8, *(CFStringRef *)(a1 + 40), *(unsigned char *)(a1 + 48) == 0) == kCFCompareEqualTo)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  CFRelease(v8);
}

void sub_28E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_28EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_290F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__shared_weak_count *a4, ...)
{
  va_start(va, a4);
  sub_291BC((KB::String *)va);
  if (a4) {
    sub_29E80(a4);
  }
  KB::String::~String((KB::String *)(v5 - 152));
  KB::String::~String((KB::String *)(v5 - 120));

  KB::String::~String((KB::String *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_291BC(KB::String *this)
{
  BOOL v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    sub_29E80(v2);
  }

  KB::String::~String(this);
}

void sub_29420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__shared_weak_count *a4, ...)
{
  va_start(va, a4);
  sub_291BC((KB::String *)va);
  if (a4) {
    sub_29E80(a4);
  }
  KB::String::~String((KB::String *)(v5 - 152));
  KB::String::~String((KB::String *)(v5 - 120));

  KB::String::~String((KB::String *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_29620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _TIBeginMockingTransientLexiconManagerWithData(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  if ((byte_AE408 & 1) == 0)
  {
    Class v4 = NSClassFromString(@"TITransientLexiconManager");
    if (v4)
    {
      uint64_t v5 = [[TITransientLexiconManagerMock alloc] initWithTransientData:v7 namedEntities:v3];
      unint64_t v6 = (void *)qword_AE400;
      qword_AE400 = (uint64_t)v5;

      [(objc_class *)v4 setSharedTITransientLexiconManager:qword_AE400];
    }
    else
    {
      byte_AE408 = 1;
    }
  }
}

void sub_297A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _TISetNewContactCollectionForMockingTransientLexiconManager(uint64_t a1)
{
  return _[(id)qword_AE400 setNewContactCollection:a1];
}

void _TIEndMockingTransientLexiconManager()
{
  if ((byte_AE408 & 1) == 0)
  {
    [NSClassFromString(@"TITransientLexiconManager") setSharedTITransientLexiconManager:0];
    id v0 = (void *)qword_AE400;
    qword_AE400 = 0;
  }
}

id _TIConvertTIMockContactCollection(void *a1)
{
  id v16 = a1;
  double v1 = +[NSMutableDictionary dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v16;
  id v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v19;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v19 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v6 = objc_alloc((Class)_ICContact);
        id v7 = [v5 firstName];
        CFStringRef v8 = [v5 middleName];
        id v9 = [v5 lastName];
        uint64_t v10 = [v5 nickName];
        [v5 relevancyScore];
        id v12 = [v6 initWithFirstName:v7 phoneticFirstName:0 middleName:v8 phoneticMiddleName:0 lastName:v9 phoneticLastName:0 organizationName:v11 jobTitle:0 nickname:0 relations:v10 streets:0 cities:0 score:0];

        id v13 = +[NSUUID UUID];
        double v14 = [v13 UUIDString];
        [v1 setObject:v12 forKey:v14];
      }
      id v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v2);
  }

  return v1;
}

void sub_29A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id _TIMockingTransientLexiconManagerOfferedCount()
{
  return _[(id)qword_AE400 offeredCount];
}

id _TIMockingTransientLexiconManagerAcceptedCount()
{
  return _[(id)qword_AE400 acceptedCount];
}

void *sub_29ADC(uint64_t a1)
{
  id v2 = (void *)sub_29B2C();
  double result = dlsym(v2, "LXLexiconAdd");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_AE410 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_29B2C()
{
  v3[0] = 0;
  if (!qword_AE418)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_29C2C;
    v3[4] = &unk_8D2D0;
    v3[5] = v3;
    long long v4 = off_8D2B8;
    uint64_t v5 = 0;
    qword_AE418 = _sl_dlopen();
  }
  uint64_t v0 = qword_AE418;
  double v1 = (void *)v3[0];
  if (!qword_AE418)
  {
    double v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_29C2C()
{
  uint64_t result = _sl_dlopen();
  qword_AE418 = result;
  return result;
}

void *sub_29CA0(uint64_t a1)
{
  id v2 = (void *)sub_29B2C();
  uint64_t result = dlsym(v2, "LXLexiconIncrementUsageCount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_AE420 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_29CF0(uint64_t a1)
{
  id v2 = (void *)sub_29B2C();
  uint64_t result = dlsym(v2, "kLXLexiconNameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_AE428 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_29D40(uint64_t a1)
{
  id v2 = (void *)sub_29B2C();
  uint64_t result = dlsym(v2, "kLXLexiconLocaleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_AE430 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_29D90(uint64_t a1)
{
  id v2 = (void *)sub_29B2C();
  uint64_t result = dlsym(v2, "LXLexiconCreateTransient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_AE438 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_29DE0(uint64_t a1)
{
  id v2 = (void *)sub_29B2C();
  uint64_t result = dlsym(v2, "LXLexiconEnumerateEntriesForString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_AE440 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_29E30(uint64_t a1)
{
  id v2 = (void *)sub_29B2C();
  uint64_t result = dlsym(v2, "LXEntryCopyString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_AE448 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_29E80(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_29EF4(uint64_t a1)
{
  sub_29F30(a1, *(void **)(a1 + 16));
  id v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_29F30(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_291BC((KB::String *)(v2 + 2));
      operator delete(v2);
      id v2 = v3;
    }
    while (v3);
  }
}

void *sub_29F74(void *a1, void *a2, unsigned int a3)
{
  if (a2[1]) {
    uint64_t v5 = (KB::String *)a2[1];
  }
  else {
    uint64_t v5 = (KB::String *)(a2 + 2);
  }
  unsigned int v6 = KB::String::hash(v5, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v7 = a1[1];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v7 <= v6) {
      unint64_t v11 = v6 % v7;
    }
  }
  else
  {
    unint64_t v11 = (v7 - 1) & v6;
  }
  id v12 = *(void **)(*a1 + 8 * v11);
  if (!v12) {
    return 0;
  }
  id v13 = (void *)*v12;
  if (*v12)
  {
    do
    {
      unint64_t v14 = v13[1];
      if (v14 == v8)
      {
        if (v13 + 2 == a2 || (KB::String::equal((KB::String *)(v13 + 2), (const KB::String *)a2) & 1) != 0) {
          return v13;
        }
      }
      else
      {
        if (v10 > 1)
        {
          if (v14 >= v7) {
            v14 %= v7;
          }
        }
        else
        {
          v14 &= v7 - 1;
        }
        if (v14 != v11) {
          return 0;
        }
      }
      id v13 = (void *)*v13;
    }
    while (v13);
  }
  return v13;
}

void *sub_2A08C(uint64_t a1, void *a2, __n128 *a3)
{
  if (a2[1]) {
    unint64_t v7 = (KB::String *)a2[1];
  }
  else {
    unint64_t v7 = (KB::String *)(a2 + 2);
  }
  unsigned int v8 = KB::String::hash(v7, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v10 <= v8) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    id v13 = *(void **)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = (void *)*v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v9)
          {
            if (v14 + 2 == a2 || (KB::String::equal((KB::String *)(v14 + 2), (const KB::String *)a2) & 1) != 0) {
              return v14;
            }
          }
          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }
            else
            {
              v15 &= v10 - 1;
            }
            if (v15 != v3) {
              break;
            }
          }
          unint64_t v14 = (void *)*v14;
        }
        while (v14);
      }
    }
  }
  sub_2A31C(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_2A3B8(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= v9) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  CGRect v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  unint64_t v14 = (void *)v25[0];
  v25[0] = 0;
  ++*(void *)(a1 + 24);
  sub_2A604(v25, 0);
  return v14;
}

void sub_2A304(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2A604((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

__n128 sub_2A31C@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unsigned int v8 = (__n128 *)operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  v8->n128_u64[0] = 0;
  v8->n128_u64[1] = a2;
  KB::String::String((KB::String *)&v8[1], (const KB::String *)a3);
  __n128 result = a3[2];
  v8[3] = result;
  a3[2].n128_u64[0] = 0;
  a3[2].n128_u64[1] = 0;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2A390(_Unwind_Exception *a1)
{
  sub_2A604(v1, 0);
  _Unwind_Resume(a1);
}

void sub_2A3A8()
{
}

void sub_2A3B8(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_2A4A8(a1, prime);
    }
  }
}

void sub_2A4A8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_2A3A8();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint8x8_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint8x8_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint8x8_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_2A604(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16)) {
      sub_291BC((KB::String *)(v2 + 16));
    }
    operator delete((void *)v2);
  }
}

void *sub_2A65C(uint64_t a1, void *a2, __n128 *a3)
{
  if (a2[1]) {
    uint64_t v7 = (KB::String *)a2[1];
  }
  else {
    uint64_t v7 = (KB::String *)(a2 + 2);
  }
  unsigned int v8 = KB::String::hash(v7, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v10 <= v8) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    id v13 = *(void **)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = (void *)*v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v9)
          {
            if (v14 + 2 == a2 || (KB::String::equal((KB::String *)(v14 + 2), (const KB::String *)a2) & 1) != 0) {
              return v14;
            }
          }
          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }
            else
            {
              v15 &= v10 - 1;
            }
            if (v15 != v3) {
              break;
            }
          }
          unint64_t v14 = (void *)*v14;
        }
        while (v14);
      }
    }
  }
  sub_2A8EC(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_2A3B8(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= v9) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  CGRect v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  unint64_t v14 = (void *)v25[0];
  v25[0] = 0;
  ++*(void *)(a1 + 24);
  sub_2A604(v25, 0);
  return v14;
}

void sub_2A8D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2A604((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

__n128 sub_2A8EC@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unsigned int v8 = (__n128 *)operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  v8->n128_u64[0] = 0;
  v8->n128_u64[1] = a2;
  KB::String::String((KB::String *)&v8[1], (const KB::String *)a3);
  __n128 result = a3[2];
  v8[3] = result;
  a3[2].n128_u64[0] = 0;
  a3[2].n128_u64[1] = 0;
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2A960(_Unwind_Exception *a1)
{
  sub_2A604(v1, 0);
  _Unwind_Resume(a1);
}

void sub_2AF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2AF48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2AF58(uint64_t a1)
{
}

void sub_2AF60(uint64_t a1, uint64_t a2, __int16 a3, double a4, double a5, double a6, double a7)
{
  if (a2)
  {
    id v14 = +[NSString stringWithUTF8String:a2];
    id v13 = -[TTKSimpleKey initWithString:frame:keyCode:]([TTKSimpleKey alloc], "initWithString:frame:keyCode:", v14, a3, a4, a5, a6, a7);
    if (v13) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v13];
    }
  }
}

id _TIGetMockLanguageLikelihoodModel()
{
  return +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
}

void _TIBeginMockingLanguageLikelihoodModel()
{
  uint64_t v0 = objc_alloc_init(TILanguageLikelihoodModelStub);
  _TIBeginMockingLanguageLikelihoodModelWithModel(v0);
}

void _TIBeginMockingLanguageLikelihoodModelWithModel(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    +[_TILanguageLikelihoodModel performSelector:"setSharedLanguageLikelihoodModel:" withObject:v1];
  }
}

uint64_t _TIEndMockingLanguageLikelihoodModel()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return (uint64_t)+[_TILanguageLikelihoodModel performSelector:"setSharedLanguageLikelihoodModel:" withObject:0];
  }
  return result;
}

void sub_2C54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t sub_2C564(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2C574(uint64_t a1)
{
}

void sub_2C57C(uint64_t a1, void *a2)
{
}

void _TIBeginMockingProactiveQuickTypeManager()
{
  uint64_t v0 = objc_alloc_init(TIProactiveQuickTypeManagerMock);
  if (objc_opt_respondsToSelector()) {
    +[TIProactiveQuickTypeManager performSelector:"setSharedTIProactiveQuickTypeManager:" withObject:v0];
  }
}

uint64_t _TIEndMockingProactiveQuickTypeManager()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return (uint64_t)+[TIProactiveQuickTypeManager performSelector:"setSharedTIProactiveQuickTypeManager:" withObject:0];
  }
  return result;
}

uint64_t sub_2C93C(uint64_t a1)
{
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

uint64_t sub_2C970()
{
  return 0;
}

id sub_2C978()
{
  uint64_t v0 = TINgramModelPathForInputMode();

  return v0;
}

uint64_t sub_2C9A4()
{
  return _unigramsFilePathForInputMode(@"en_US");
}

void sub_2C9B0()
{
  id v0 = (id)qword_AE450;
  if (v0) {
    [v0 invalidate];
  }
}

void sub_2CA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_2CA18()
{
  if (qword_AE450)
  {
    id v0 = (id)qword_AE450;
  }
  else
  {
    id v0 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.TextInput.TextInputTestService"];
    id v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TextInputTestServiceProtocol];
    [v0 setRemoteObjectInterface:v1];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3321888768;
    v7[2] = sub_2F6D0;
    v7[3] = &unk_8D438;
    uint64_t v2 = objc_retainBlock(v7);
    [v0 setInvalidationHandler:v2];

    [v0 resume];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3321888768;
    v6[2] = sub_2CBF8;
    v6[3] = &unk_8D318;
    unint64_t v3 = [v0 synchronousRemoteObjectProxyWithErrorHandler:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3321888768;
    v5[2] = nullsub_6;
    v5[3] = &unk_8D348;
    [v3 ackWithReply:v5];
    objc_storeStrong((id *)&qword_AE450, v0);
  }

  return v0;
}

void sub_2CBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2CBF8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 description];
  NSLog(@"Could not message test service: %@", v2);

  __break(1u);
}

void sub_2CC40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2CC70(KB::StaticDictionary *a1@<X0>, uint64_t *a2@<X8>)
{
  KB::StaticDictionary::create(a2, a1);
  sub_2F7AC((uint64_t)v3, (uint64_t)a1);
  KB::StaticDictionary::load();
  KB::String::~String((KB::String *)&v7);
  KB::String::~String((KB::String *)&v6);
  KB::String::~String((KB::String *)&v5);
  KB::String::~String((KB::String *)&v4);
  KB::String::~String((KB::String *)v3);
}

void sub_2CD20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2CD48((uint64_t)va);
  sub_309E4(v2, 0);
  _Unwind_Resume(a1);
}

void sub_2CD48(uint64_t a1)
{
  KB::String::~String((KB::String *)(a1 + 128));
  KB::String::~String((KB::String *)(a1 + 96));
  KB::String::~String((KB::String *)(a1 + 64));
  KB::String::~String((KB::String *)(a1 + 32));

  KB::String::~String((KB::String *)a1);
}

void sub_2CD9C(KB::DynamicDictionary *a1@<X0>, uint64_t *a2@<X8>)
{
  KB::DynamicDictionary::create_single(a2, a1);
  uint64_t v4 = *a2;
  sub_2F7AC((uint64_t)v9, (uint64_t)a1);
  uint64_t v5 = (char *)operator new(0xB0uLL);
  uint64_t v6 = v5 + 176;
  v7[0] = v5;
  v7[2] = v5 + 176;
  sub_2F7AC((uint64_t)v5, (uint64_t)v9);
  v7[1] = v6;
  (*(void (**)(uint64_t, void *, void))(*(void *)v4 + 40))(v4, v7, 0);
  unsigned int v8 = (void **)v7;
  sub_2F878(&v8);
  KB::String::~String((KB::String *)&v13);
  KB::String::~String((KB::String *)&v12);
  KB::String::~String((KB::String *)&v11);
  KB::String::~String((KB::String *)&v10);
  KB::String::~String((KB::String *)v9);
}

void sub_2CEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  unsigned int v8 = va_arg(va1, void **);
  sub_2F878((void ***)va);
  sub_2CD48((uint64_t)va1);
  uint64_t v7 = *v5;
  *uint64_t v5 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Unwind_Resume(a1);
}

void sub_2CF20(void *a1, void *a2)
{
  unint64_t v3 = a1;
  id v5 = a2;
  if (v5)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v6 = (KB *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }
  KB::utf8_string(v10, v3, v4);
  KB::utf8_string(v9, v6, v7);
  KB::MutableLexiconWrapper::create((KB::MutableLexiconWrapper *)v10, (const KB::String *)v9, v8);
  KB::String::~String((KB::String *)v9);
  KB::String::~String((KB::String *)v10);
}

void sub_2CFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2D03C(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void ***a4@<X8>, float a5@<S0>)
{
  unint64_t v9 = a1;
  uint64_t v10 = a2;
  id v11 = a3;
  if (v11)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }
  __getLexiconInfo(v26, v9, v12, 1.0 - a5);
  if (v11)
  {
    UIKeyboardDynamicDictionaryFile();
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }
  __getLexiconInfo(v21, v10, v13, a5);
  sub_2F7AC((uint64_t)v19, (uint64_t)v26);
  sub_2F7AC((uint64_t)&v20, (uint64_t)v21);
  float v17 = 0;
  id v14 = (char *)operator new(0x160uLL);
  uint64_t v15 = 0;
  float v16 = v14;
  BOOL v18 = v14 + 352;
  do
  {
    sub_2F7AC((uint64_t)&v14[v15 * 8], (uint64_t)&v19[v15]);
    v15 += 22;
  }
  while (v15 != 44);
  float v17 = v14 + 352;
  do
  {
    KB::String::~String((KB::String *)&v19[v15 - 6]);
    KB::String::~String((KB::String *)&v19[v15 - 10]);
    KB::String::~String((KB::String *)&v19[v15 - 14]);
    KB::String::~String((KB::String *)&v19[v15 - 18]);
    KB::String::~String((KB::String *)&v19[v15 - 22]);
    v15 -= 22;
  }
  while (v15 * 8);
  KB::DictionaryContainer::create_multilexicon();
  *a4 = v19[0];
  v19[0] = (void **)&v16;
  sub_2F878(v19);
  KB::String::~String((KB::String *)&v25);
  KB::String::~String((KB::String *)&v24);
  KB::String::~String((KB::String *)&v23);
  KB::String::~String((KB::String *)&v22);
  KB::String::~String((KB::String *)v21);

  KB::String::~String((KB::String *)&v30);
  KB::String::~String((KB::String *)&v29);
  KB::String::~String((KB::String *)&v28);
  KB::String::~String((KB::String *)&v27);
  KB::String::~String((KB::String *)v26);
}

void sub_2D280(_Unwind_Exception *a1)
{
  sub_2CD48((uint64_t)&STACK[0x230]);

  _Unwind_Resume(a1);
}

void sub_2D32C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSLocale localeWithLocaleIdentifier:v3];
  uint64_t v6 = +[TIInputMode inputModeWithIdentifier:v3];
  uint64_t v7 = v5;
  +[NSArray arrayWithObjects:&v7 count:1];
  objc_claimAutoreleasedReturnValue();
  [v6 doesSupportInlineCompletion];
  KB::LanguageModelConfig::LanguageModelConfig();
  operator new();
}

void sub_2D628(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef a13, CFTypeRef cf, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a13) {
    CFRelease(a13);
  }
  operator delete();
}

void sub_2D6FC(void *a1, void *a2, void *a3, float a4)
{
  uint64_t v7 = a1;
  unsigned int v8 = a2;
  unint64_t v9 = a3;
  __createAndLoadLanguageModel(&v24, v7, v9, 1);
  __createAndLoadLanguageModel(&v22, v8, v9, 1);
  v17[5] = v24;
  BOOL v18 = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
  if (v18) {
    sub_29E80(v18);
  }
  id v14 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
  if (v14) {
    sub_29E80(v14);
  }
  (*(void (**)(void **__return_ptr))(*(void *)v24 + 48))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v19, *(_DWORD *)__p[0], 1.0 - a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  (*(void (**)(void **__return_ptr))(*(void *)v22 + 48))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v15, *(_DWORD *)__p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  __p[0] = v19;
  __p[1] = v20;
  if (v20) {
    atomic_fetch_add_explicit(v20 + 1, 1uLL, memory_order_relaxed);
  }
  sub_2F990((uint64_t)v27, (uint64_t)&v21);
  v27[5] = v15;
  uint64_t v28 = v16;
  if (v16) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
  }
  sub_2F990((uint64_t)v29, (uint64_t)v17);
  uint64_t v10 = (char *)operator new(0x70uLL);
  for (uint64_t i = 0; i != 14; i += 7)
    sub_2FC74(&v10[i * 8], &__p[i]);
  uint64_t v12 = 0;
  while (1)
  {
    sub_2FC28((uint64_t)&v29[v12]);
    uint64_t v13 = *(std::__shared_weak_count **)&v29[v12 - 8];
    if (v13) {
      sub_29E80(v13);
    }
    v12 -= 56;
    if (v12 == -112) {
      sub_2DB58();
    }
  }
}

void sub_2DA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::__shared_weak_count *a32,uint64_t a33,std::__shared_weak_count *a34,void *__p,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  sub_2FE64((void ***)&__p);
  sub_2DB20((uint64_t)&a15);
  sub_2DB20((uint64_t)&a24);
  if (a32) {
    sub_29E80(a32);
  }
  if (a34) {
    sub_29E80(a34);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_2DB20(uint64_t a1)
{
  sub_2FC28(a1 + 16);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    sub_29E80(v2);
  }
  return a1;
}

void sub_2DB58()
{
}

void sub_2DBC0()
{
}

void sub_2DBE4(uint64_t *a1)
{
  uint64_t v2 = operator new(8uLL);
  void *v2 = 0x100000000;
  sub_2FF34(__p, "");
  v6[0] = operator new(0x18uLL);
  uint64_t v7 = (char *)v6[0] + 24;
  v6[1] = sub_2FFE4((int)&v7, (long long *)__p, &v11, (char *)v6[0]);
  KB::LanguageModelContext::LanguageModelContext();
  unsigned int v8 = v6;
  sub_300F4(&v8);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  operator delete(v2);
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1 != v4)
  {
    do
    {
      KB::LanguageModel::id_for_static_word();
      if (*(_WORD *)v3)
      {
        if (*(void *)(v3 + 8)) {
          uint64_t v5 = *(char **)(v3 + 8);
        }
        else {
          uint64_t v5 = (char *)(v3 + 16);
        }
      }
      else
      {
        uint64_t v5 = "";
      }
      sub_2FF34(v6, v5);
      KB::LanguageModelContext::append();
      if (SHIBYTE(v7) < 0) {
        operator delete(v6[0]);
      }
      v3 += 32;
    }
    while (v3 != v4);
  }
}

void sub_2DD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void **a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  a15 = &a9;
  sub_300F4(&a15);
  if (a21 < 0) {
    operator delete(__p);
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

uint64_t sub_2DE14(uint64_t a1)
{
  uint64_t v5 = (void **)(a1 + 80);
  sub_300F4(&v5);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 72));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    sub_29E80(v3);
  }
  return a1;
}

void sub_2DE7C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_2DE84(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  KB::DictionaryContainer::derive_static_words();
  sub_30198(a3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2E038;
  v6[3] = &unk_8D378;
  void v6[4] = a1;
  int v7 = a2;

  if (v9)
  {
    KB::String::operator=();
    KB::ByteString::operator=();
    *(_DWORD *)(a3 + 56) = 0;
    *(void *)(a3 + 48) = 0;
    KB::String::operator=();
    *(_OWORD *)(a3 + 128) = *(_OWORD *)&stru_68.segname[8];
    *(_OWORD *)(a3 + 144) = *(_OWORD *)&stru_68.size;
    *(_OWORD *)(a3 + 96) = *(_OWORD *)&stru_20.nsects;
    *(_OWORD *)(a3 + 112) = *(_OWORD *)&stru_68.sectname[8];
    KB::String::operator=();
    *(unsigned char *)(a3 + 192) = 116;
    if (a3)
    {
      *(_DWORD *)(a3 + 232) = 365648;
      sub_30270((void *)(a3 + 200), CFAbsoluteTimeGetCurrent, 0);
    }
  }
  long long v11 = (void **)&v8;
  sub_308D8(&v11);
}

void sub_2E000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  *(void *)(v15 - 56) = &a15;
  sub_308D8((void ***)(v15 - 56));
  _Unwind_Resume(a1);
}

BOOL sub_2E038(uint64_t a1, KB::Word *this)
{
  KB::Word::capitalized_string(v7, this);
  if (KB::String::equal((KB::String *)v7, *(const KB::String **)(a1 + 32)))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    if (v4) {
      BOOL v5 = v4 == *((_DWORD *)this + 34);
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  KB::String::~String((KB::String *)v7);
  return v5;
}

void sub_2E0E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  KB::String::~String((KB::String *)va);
  _Unwind_Resume(a1);
}

id sub_2E0FC()
{
  id v0 = sub_2E1C8();
  id v1 = +[NSUUID UUID];
  uint64_t v2 = [v1 UUIDString];
  uint64_t v3 = [v0 stringByAppendingPathComponent:v2];

  if (sub_2E21C(v3)) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void sub_2E1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2E1C8()
{
  if (qword_AE470 != -1) {
    dispatch_once(&qword_AE470, &stru_8D4D0);
  }
  id v0 = (void *)qword_AE468;

  return v0;
}

id sub_2E21C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSFileManager defaultManager];
  NSFileAttributeKey v9 = NSFilePosixPermissions;
  uint64_t v10 = &off_93F88;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v8 = 0;
  id v4 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v3 error:&v8];
  id v5 = v8;

  if (v5) {
    char v6 = (char)v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    NSLog(@"Failed to create temporary directory: %@", v5);
  }

  return v4;
}

void sub_2E330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2E364(void *a1, void *a2)
{
  id v23 = a1;
  id v20 = a2;
  uint64_t v3 = +[NSBundle bundleForClass:NSClassFromString(@"TILanguageSpecificTests")];
  uint64_t v4 = [v3 bundleURL];

  unint64_t v19 = (void *)v4;
  uint64_t v21 = +[NSURL URLWithString:v20 relativeToURL:v4];
  id v5 = +[NSFileManager defaultManager];
  char v6 = [v5 contentsOfDirectoryAtURL:v21 includingPropertiesForKeys:0 options:1 error:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  int v7 = 0;
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    LOBYTE(v10) = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v12 lastPathComponent];
        id v14 = [v23 stringByAppendingPathComponent:v13];

        uint64_t v15 = +[NSURL fileURLWithPath:v14];
        if (v10)
        {
          uint64_t v16 = +[NSFileManager defaultManager];
          id v24 = v7;
          uint64_t v10 = (uint64_t)[v16 copyItemAtURL:v12 toURL:v15 error:&v24];
          id v17 = v24;

          int v7 = v17;
          if (v10) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
        if (v7) {
          NSLog(@"Problem installing test resources: %@", v7);
        }
LABEL_12:
      }
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v8) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v10 = 1;
LABEL_16:

  return v10;
}

void sub_2E5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_2E6AC()
{
  id v0 = sub_2E1C8();
  id v1 = [v0 stringByAppendingPathComponent:@"PretrainedDynamicModels"];

  return v1;
}

void sub_2E700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2E710(void *a1)
{
  id v1 = a1;
  if (qword_AE460 != -1) {
    dispatch_once(&qword_AE460, &stru_8D398);
  }
  id v2 = (id)qword_AE458;
  objc_sync_enter(v2);
  if (([(id)qword_AE458 containsObject:v1] & 1) == 0)
  {
    v11[0] = @"INPUT_MODE";
    v11[1] = @"USE_AUTOCORRECTION";
    v12[0] = v1;
    v12[1] = &__kCFBooleanFalse;
    v11[2] = @"USE_RETROCORRECTION";
    v11[3] = @"USE_AUTOCAPITALIZATION";
    v12[2] = &__kCFBooleanFalse;
    v12[3] = &__kCFBooleanTrue;
    v11[4] = @"WORD_LEARNING_ENABLED";
    v11[5] = @"KEYBOARD_WIDTH";
    v12[4] = &__kCFBooleanTrue;
    v12[5] = &off_93FA0;
    v12[6] = @"Portrait";
    v11[6] = @"KEYBOARD_ORIENTATION";
    v11[7] = @"CUSTOM_DYNAMIC_RESOURCE_PATH";
    uint64_t v4 = sub_2E6AC();
    v12[7] = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:8];

    char v6 = [[AutocorrectionTestHarness alloc] initWithAttributes:v5];
    uint64_t v7 = [&off_94608 objectForKey:v1];
    id v8 = (void *)v7;
    uint64_t v9 = &__NSArray0__struct;
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    id v10 = v9;

    [(AutocorrectionTestHarness *)v6 trainWithCorpus:v10];
    LMLanguageModelPerformMaintenance();

    [(id)qword_AE458 addObject:v1];
  }
  objc_sync_exit(v2);
}

void sub_2E914(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_2E96C(id a1)
{
  uint64_t v1 = +[NSMutableSet set];
  uint64_t v2 = qword_AE458;
  qword_AE458 = v1;

  _objc_release_x1(v1, v2);
}

uint64_t sub_2E9AC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_2E6AC();
  id v17 = +[NSURL URLWithString:v2];

  uint64_t v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [v3 contentsOfDirectoryAtURL:v17 includingPropertiesForKeys:0 options:1 error:0];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  id v5 = 0;
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    LOBYTE(v8) = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v11 = [v10 lastPathComponent];
        uint64_t v12 = [v1 stringByAppendingPathComponent:v11];

        uint64_t v13 = +[NSURL fileURLWithPath:v12];
        if (v8)
        {
          id v14 = +[NSFileManager defaultManager];
          id v19 = v5;
          uint64_t v8 = (uint64_t)[v14 copyItemAtURL:v10 toURL:v13 error:&v19];
          id v15 = v19;

          id v5 = v15;
          if (v8) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v8 = 0;
        }
        if (v5) {
          NSLog(@"Problem installing pretrained dynamic assets: %@", v5);
        }
LABEL_12:
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v6) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v8 = 1;
LABEL_16:

  return v8;
}

void sub_2EBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

id sub_2EC8C(void *a1)
{
  id v1 = a1;
  sub_2ECD8(v1);
  id v2 = sub_2E21C(v1);

  return v2;
}

void sub_2ECC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2ECD8(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = +[NSFileManager defaultManager];
    id v7 = 0;
    id v3 = [v2 removeItemAtPath:v1 error:&v7];
    id v4 = v7;

    if (v4) {
      char v5 = (char)v3;
    }
    else {
      char v5 = 1;
    }
    if ((v5 & 1) == 0) {
      NSLog(@"Failed to remove temporary directory: %@", v4);
    }
  }
  else
  {
    id v3 = &def_3B118 + 1;
  }

  return v3;
}

void sub_2ED80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2EDA8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    char v5 = dynamicFilePathForInputMode();
    id v6 = +[NSFileManager defaultManager];
    unsigned __int8 v7 = [v6 fileExistsAtPath:v5];

    if (v7)
    {
      uint64_t v8 = +[NSFileManager defaultManager];
      id v11 = 0;
      unsigned __int8 v9 = [v8 removeItemAtPath:v5 error:&v11];
      id v10 = v11;

      if ((v9 & 1) == 0) {
        NSLog(@"Failed to remove temporary dynamic dictionary: %@", v10);
      }
    }
  }
}

void sub_2EE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2EED0(void *a1)
{
  id v1 = a1;
  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  KB::LanguageModel::clear_dynamic_learning_bundles();
}

void sub_2EF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2EF40(id a1, BOOL a2)
{
  if (!a2) {
    NSLog(@"Failed to remove temproary dynamic learning bundles!");
  }
}

id sub_2EF68(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:NSClassFromString(@"TILanguageSpecificTests")];
  id v3 = [v2 bundleURL];

  id v4 = +[NSString stringWithFormat:@"%@-corpus.txt", v1];
  char v5 = [@"TestCorpus" stringByAppendingPathComponent:v4];
  id v6 = +[NSURL URLWithString:v5 relativeToURL:v3];

  return v6;
}

void sub_2F054(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

id sub_2F09C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSFileManager);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [&off_944D0 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v13 != v4) {
        objc_enumerationMutation(&off_944D0);
      }
      uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * v5);
      unsigned __int8 v7 = +[NSBundle mainBundle];
      uint64_t v8 = [v7 URLForResource:v1 withExtension:v6 subdirectory:@"TestPersonas"];

      unsigned __int8 v9 = [v8 path];
      unsigned __int8 v10 = [v2 fileExistsAtPath:v9];

      if (v10) {
        break;
      }

      if (v3 == (id)++v5)
      {
        id v3 = [&off_944D0 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_2F230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2F284(void *a1)
{
  id v1 = a1;
  id v8 = 0;
  id v2 = +[NSString stringWithContentsOfURL:v1 encoding:4 error:&v8];
  id v3 = v8;
  if (v3)
  {
    uint64_t v4 = [v1 path];
    NSLog(@"Problem opening file with URL %@ : %@", v4, v3);
  }
  uint64_t v5 = [v2 componentsSeparatedByString:@"\n"];
  uint64_t v6 = [v5 filterWithBlock:&stru_8D418];

  return v6;
}

void sub_2F368(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

BOOL sub_2F3A4(id a1, NSString *a2)
{
  return ![(NSString *)a2 isEqualToString:&stru_8DEF0];
}

id sub_2F3CC(void *a1)
{
  id v14 = a1;
  id v1 = +[NSMutableArray array];
  long long v15 = +[NSString stringWithFormat:@"%@-corpus.txt", v14];
  id v2 = +[NSBundle mainBundle];
  uint64_t v16 = [v2 bundleURL];

  id v3 = [@"TestCorpus" stringByAppendingPathComponent:v15];
  uint64_t v4 = +[NSURL URLWithString:v3 relativeToURL:v16];

  id v21 = 0;
  uint64_t v5 = +[NSString stringWithContentsOfURL:v4 encoding:4 error:&v21];
  id v6 = v21;
  if (v6)
  {
    unsigned __int8 v7 = [v4 path];
    NSLog(@"Problem opening file with URL %@ : %@", v7, v6);
  }
  if (v5)
  {
    [v5 componentsSeparatedByString:@"\n"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (([v12 isEqualToString:&stru_8DEF0] & 1) == 0) {
            [v1 addObject:v12];
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }
  }

  return v1;
}

void sub_2F62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2F6D0()
{
  if (+[NSThread isMainThread])
  {
    id v0 = (void *)qword_AE450;
    qword_AE450 = 0;
  }
  else
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3321888768;
    v2[2] = sub_2F798;
    v2[3] = &unk_8D468;
    id v1 = objc_retainBlock(v2);
    TIDispatchSync(&_dispatch_main_q, v1);
  }
}

void sub_2F798()
{
  id v0 = (void *)qword_AE450;
  qword_AE450 = 0;
}

uint64_t sub_2F7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = KB::String::String((KB::String *)a1, (const KB::String *)a2);
  KB::String::String((KB::String *)(v4 + 32), (const KB::String *)(a2 + 32));
  KB::String::String((KB::String *)(a1 + 64), (const KB::String *)(a2 + 64));
  KB::String::String((KB::String *)(a1 + 96), (const KB::String *)(a2 + 96));
  KB::String::String((KB::String *)(a1 + 128), (const KB::String *)(a2 + 128));
  uint64_t v5 = *(void *)(a2 + 160);
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  *(void *)(a1 + 160) = v5;
  return a1;
}

void sub_2F834(_Unwind_Exception *a1)
{
  KB::String::~String(v4);
  KB::String::~String(v3);
  KB::String::~String(v2);
  KB::String::~String(v1);
  _Unwind_Resume(a1);
}

void sub_2F878(void ***a1)
{
  id v1 = *a1;
  id v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 176;
        sub_2CD48(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_2F8FC(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  *(void *)(a1 + 48) = 0;
  id v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1 + 40) = 0;
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 32) = 0;
  uint64_t v5 = *(const void **)(a1 + 24);
  if (v5) {
    CFRelease(v5);
  }
  *(void *)(a1 + 24) = 0;
  id v6 = *(const void **)(a1 + 16);
  if (v6) {
    CFRelease(v6);
  }
  *(void *)(a1 + 16) = 0;
  unsigned __int8 v7 = *(const void **)(a1 + 8);
  if (v7) {
    CFRelease(v7);
  }
  *(void *)(a1 + 8) = 0;
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  *(void *)a1 = 0;
  return a1;
}

uint64_t sub_2F990(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_2A3B8(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned int **)(a2 + 16); i; uint64_t i = *(unsigned int **)i)
    sub_2FA08(a1, i + 4, (void *)i + 2);
  return a1;
}

void sub_2F9F0(_Unwind_Exception *a1)
{
  sub_2FC28(v1);
  _Unwind_Resume(a1);
}

void *sub_2FA08(uint64_t a1, unsigned int *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    id v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v10 = operator new(0x18uLL);
  void *v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_2A3B8(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  long long v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    long long v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_2FC14(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2FC28(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      id v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_2FC74(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  sub_2F990((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

void sub_2FCBC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_29E80(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_2FCD4(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_2FD54(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_59414(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2FD6C(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        sub_29E80(v5);
      }
    }
  }
}

void sub_2FDF8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_2FE30(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_2FE64(void ***a1)
{
  uint64_t v1 = *a1;
  id v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 56;
        sub_2FEE8(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_2FEE8(uint64_t a1)
{
  sub_2FC28(a1 + 16);
  id v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    sub_29E80(v2);
  }
}

void *sub_2FF34(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

char *sub_2FFE4(int a1, long long *a2, long long *a3, char *__dst)
{
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_30058(__dst, *(void **)v6, *((void *)v6 + 1));
      }
      else
      {
        long long v7 = *v6;
        *((void *)__dst + 2) = *((void *)v6 + 2);
        *(_OWORD *)__dst = v7;
      }
      unint64_t v6 = (long long *)((char *)v6 + 24);
      __dst += 24;
    }
    while (v6 != a3);
  }
  return __dst;
}

void *sub_30058(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *size_t v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_300F4(void ***a1)
{
  id v2 = *a1;
  if (*v2)
  {
    sub_30148((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_30148(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

uint64_t sub_30198(uint64_t a1)
{
  uint64_t v2 = KB::String::String((KB::String *)a1);
  *(_WORD *)(v2 + 32) = 0;
  *(void *)(v2 + 48) = 0x3F80000000000000;
  *(_DWORD *)(v2 + 56) = 1065353216;
  KB::String::String((KB::String *)(v2 + 64));
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(a1 + 96) = _D0;
  *(_DWORD *)(a1 + 104) = 0;
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_DWORD *)(a1 + 144) = 0;
  KB::String::String((KB::String *)(a1 + 160));
  *(unsigned char *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_DWORD *)(a1 + 232) = 1065353216;
  return a1;
}

void sub_30220(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  KB::String::~String(v3);
  if (*(unsigned __int16 *)(v1 + 32) >= 0xFu)
  {
    if (*(void *)(v1 + 40)) {
      operator delete[]();
    }
  }
  KB::String::~String((KB::String *)v1);
  _Unwind_Resume(a1);
}

void sub_30270(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  uint64_t v8 = (void *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = a2[2];
      v8[2] = v9;
      uint64_t v10 = (void *)*v8;
      v8[1] = v9;
      unint64_t v11 = sub_30348((uint64_t)a1, v9, v8 + 2);
      sub_304A0(a1, v8, v11);
      a2 = (void *)*a2;
      uint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    do
    {
      float v12 = (void *)*v8;
      operator delete(v8);
      uint64_t v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_307EC(a1, a2 + 2);
      a2 = (void *)*a2;
    }
  }
}

void *sub_30348(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_30588(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  unint64_t v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    unint64_t v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && v16[2] == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *sub_304A0(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_30588(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_30678(a1, prime);
    }
  }
}

void sub_30678(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_2A3A8();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            *uint64_t v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *sub_307EC(void *a1, unint64_t *a2)
{
  int8x8_t v4 = operator new(0x18uLL);
  unint64_t v5 = *a2;
  v4[2] = *a2;
  void *v4 = 0;
  v4[1] = v5;
  uint64_t v6 = sub_30348((uint64_t)a1, v5, v4 + 2);
  sub_304A0(a1, v4, v6);
  return v4;
}

void sub_30850(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_30864(uint64_t a1)
{
  sub_2FC28(a1 + 200);
  KB::String::~String((KB::String *)(a1 + 160));
  KB::String::~String((KB::String *)(a1 + 64));
  if (*(unsigned __int16 *)(a1 + 32) >= 0xFu && *(void *)(a1 + 40)) {
    operator delete[]();
  }

  KB::String::~String((KB::String *)a1);
}

void sub_308D8(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    int8x8_t v4 = v1[1];
    unint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        sub_30864((uint64_t)v4 - 240);
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_3095C(id a1)
{
  uint64_t v1 = NSTemporaryDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"TextInputTests"];
  int8x8_t v3 = (void *)qword_AE468;
  qword_AE468 = v2;

  if (sub_2EC8C((void *)qword_AE468)) {
    int8x8_t v4 = (void *)qword_AE468;
  }
  else {
    int8x8_t v4 = 0;
  }

  objc_storeStrong((id *)&qword_AE468, v4);
}

void sub_309D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

KB::StaticDictionary *sub_309E4(KB::StaticDictionary **a1, KB::StaticDictionary *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    KB::StaticDictionary::~StaticDictionary(result);
    operator delete();
  }
  return result;
}

void sub_30A34(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_30A9C(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_59414(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_30AB8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_30AF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_30B24()
{
  __cxa_atexit((void (*)(void *))sub_2C93C, &unk_ADC38, &def_3B118);
}

id sub_31330(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2];
}

BOOL sub_31C54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend(v6, "compare:options:range:locale:", v5, 129, 0, objc_msgSend(v6, "length"), *(void *)(a1 + 32));

  return v7 == 0;
}

void sub_33CE4(uint64_t a1, void *a2)
{
  int8x8_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 countForObject:v4]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v4];
}

void _TIBeginMockingUserModelDataStore()
{
  id v0 = objc_alloc_init(TIUserModelDataStoreMock);
  if (objc_opt_respondsToSelector()) {
    +[TIUserModelDataStore performSelector:"setSharedTIUserModelDataStore:" withObject:v0];
  }
}

uint64_t _TIEndMockingUserModelDataStore()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return (uint64_t)+[TIUserModelDataStore performSelector:"setSharedUserModelDataStore:" withObject:0];
  }
  return result;
}

void _TIMockingUserModelDataStoreClear()
{
  id v0 = +[TIUserModelDataStore sharedUserModelDataStore];
  if (objc_opt_respondsToSelector()) {
    [v0 performSelector:"clear" withObject:0];
  }
}

void sub_34784(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_34964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_34B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_34E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_350F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_352CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3549C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_355C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_35718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_358B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_35B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_35E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void _TIBeginMockingTrialManager()
{
  id v0 = objc_alloc_init(MockTITrialManager);
  +[TITrialManagerProxy setSharedManager:v0];
}

id _TIEndMockingTrialManager()
{
  return +[TITrialManagerProxy setSharedManager:0];
}

void sub_39C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_39D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_39D58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"und"] & 1) == 0)
    {
      sub_2FF34(__p, (char *)[v4 UTF8String]);
      id v5 = (uint64_t **)(*(void *)(a1 + 32) + 8);
      uint8x8_t v9 = __p;
      id v6 = sub_3C604(v5, __p, (uint64_t)&unk_86328, (long long **)&v9);
      ++v6[7];
      ++*(void *)(*(void *)(a1 + 32) + 32);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_39E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_39F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_39F48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"und"] & 1) == 0)
    {
      sub_2FF34(__p, (char *)[v4 UTF8String]);
      id v5 = (uint64_t **)(*(void *)(a1 + 32) + 8);
      uint8x8_t v9 = __p;
      id v6 = sub_3C604(v5, __p, (uint64_t)&unk_86328, (long long **)&v9);
      ++v6[7];
      ++*(void *)(*(void *)(a1 + 32) + 32);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_3A008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_3A284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  *(void *)(v21 - 72) = &a15;
  sub_300F4((void ***)(v21 - 72));

  _Unwind_Resume(a1);
}

BOOL sub_3A2E0(uint64_t a1, long long *a2, long long *a3)
{
  id v5 = (uint64_t **)(*(void *)(a1 + 32) + 8);
  uint8x8_t v9 = a2;
  uint64_t v6 = sub_3C604(v5, (void **)a2, (uint64_t)&unk_86328, &v9)[7];
  id v7 = (uint64_t **)(*(void *)(a1 + 32) + 8);
  uint8x8_t v9 = a3;
  return v6 > sub_3C604(v7, (void **)a3, (uint64_t)&unk_86328, &v9)[7];
}

void sub_3A538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_3A698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3A798(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_3A8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3AAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3AC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_3ACAC(char **a1, long long *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    abort();
  }
  char v8 = a1[2];
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v2) >> 3);
  if (2 * v9 > v4) {
    unint64_t v4 = 2 * v9;
  }
  if (v9 >= 0x555555555555555) {
    unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v10 = v4;
  }
  uint64_t v25 = v7;
  if (v10) {
    size_t v11 = (char *)sub_3AE18(v7, v10);
  }
  else {
    size_t v11 = 0;
  }
  unint64_t v12 = &v11[24 * v3];
  int v22 = v11;
  v23.i64[0] = (uint64_t)v12;
  v23.i64[1] = (uint64_t)v12;
  id v24 = &v11[24 * v10];
  if (*((char *)a2 + 23) < 0)
  {
    sub_30058(v12, *(void **)a2, *((void *)a2 + 1));
    uint8x8_t v14 = (char *)v23.i64[1];
    unint64_t v12 = (char *)v23.i64[0];
  }
  else
  {
    long long v13 = *a2;
    *((void *)v12 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v12 = v13;
    uint8x8_t v14 = &v11[24 * v3];
  }
  unint64_t v16 = *a1;
  unint64_t v15 = (unint64_t)a1[1];
  if ((char *)v15 == *a1)
  {
    int64x2_t v18 = vdupq_n_s64(v15);
  }
  else
  {
    do
    {
      long long v17 = *(_OWORD *)(v15 - 24);
      *((void *)v12 - 1) = *(void *)(v15 - 8);
      *(_OWORD *)(v12 - 24) = v17;
      v12 -= 24;
      *(void *)(v15 - 16) = 0;
      *(void *)(v15 - 8) = 0;
      *(void *)(v15 - 24) = 0;
      v15 -= 24;
    }
    while ((char *)v15 != v16);
    int64x2_t v18 = *(int64x2_t *)a1;
  }
  unint64_t v19 = v14 + 24;
  *a1 = v12;
  a1[1] = v14 + 24;
  int64x2_t v23 = v18;
  unint64_t v20 = a1[2];
  a1[2] = v24;
  id v24 = v20;
  int v22 = (char *)v18.i64[0];
  sub_3AE60((uint64_t)&v22);
  return v19;
}

void sub_3AE04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_3AE60((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_3AE18(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_2A3A8();
  }
  return operator new(24 * a2);
}

uint64_t sub_3AE60(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_3AE98(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      id v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        id v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_3AEF0(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, char a5, __n128 a6)
{
LABEL_1:
  unint64_t v12 = (long long *)((char *)a2 - 24);
  long long v13 = (long long *)a1;
LABEL_2:
  uint64_t v14 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v13;
    uint64_t v15 = v14;
    uint64_t v16 = (char *)a2 - (char *)v13;
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v13) >> 3);
    if (!(!v7 & v6))
    {
      switch(v17)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
          {
            uint64_t v32 = *((void *)v13 + 2);
            long long v30 = *v13;
            long long v28 = *v12;
            *((void *)v13 + 2) = *((void *)a2 - 1);
            *long long v13 = v28;
            *unint64_t v12 = v30;
            *((void *)a2 - 1) = v32;
          }
          break;
        case 3uLL:
          sub_3B5B0(v13, (long long *)((char *)v13 + 24), (long long *)((char *)a2 - 24), a3);
          break;
        case 4uLL:
          sub_3BD80((uint64_t)v13, (uint64_t)v13 + 24, (uint64_t)(v13 + 3), (uint64_t)a2 - 24, a3);
          break;
        case 5uLL:
          sub_3BE84((__n128 *)v13, (uint64_t)v13 + 24, (uint64_t)(v13 + 3), (uint64_t)v13 + 72, (uint64_t)a2 - 24, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v16 <= 575) {
      break;
    }
    if (v15 == 1)
    {
      if (v13 != a2)
      {
        sub_3BFC8((uint64_t)v13, a2, a2, a3, a6);
      }
      return;
    }
    unint64_t v18 = v17 >> 1;
    unint64_t v19 = (long long *)((char *)v13 + 24 * (v17 >> 1));
    if ((unint64_t)v16 >= 0xC01)
    {
      sub_3B5B0(v13, (long long *)((char *)v13 + 24 * (v17 >> 1)), (long long *)((char *)a2 - 24), a3);
      uint64_t v20 = 3 * v18;
      uint64_t v21 = (long long *)((char *)v13 + 24 * v18 - 24);
      sub_3B5B0((long long *)((char *)v13 + 24), v21, a2 - 3, a3);
      int v22 = v13 + 3;
      int64x2_t v23 = (long long *)((char *)v13 + 8 * v20 + 24);
      sub_3B5B0(v22, v23, (long long *)((char *)a2 - 72), a3);
      sub_3B5B0(v21, v19, v23, a3);
      uint64_t v31 = *(void *)(a1 + 16);
      long long v29 = *(_OWORD *)a1;
      long long v24 = *v19;
      *(void *)(a1 + 16) = *((void *)v19 + 2);
      *(_OWORD *)a1 = v24;
      *((void *)v19 + 2) = v31;
      long long *v19 = v29;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_3B5B0((long long *)((char *)v13 + 24 * (v17 >> 1)), v13, (long long *)((char *)a2 - 24), a3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0)
    {
      long long v13 = sub_3B71C((long long *)a1, a2, a3);
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v25 = sub_3B910((long long *)a1, (unint64_t)a2, a3);
    if ((v26 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v27 = sub_3BAF8(a1, v25, a3);
    long long v13 = (long long *)(v25 + 24);
    if (sub_3BAF8(v25 + 24, (uint64_t)a2, a3))
    {
      a4 = -v15;
      a2 = (long long *)v25;
      if (v27) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v14 = v15 + 1;
    if (!v27)
    {
LABEL_16:
      sub_3AEF0(a1, v25, a3, -v15, a5 & 1);
      long long v13 = (long long *)(v25 + 24);
LABEL_18:
      a5 = 0;
      a4 = -v15;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    sub_3B328((uint64_t)v13, a2, a3);
  }
  else
  {
    sub_3B47C(v13, a2, a3);
  }
}

void sub_3B328(uint64_t a1, long long *a2, uint64_t a3)
{
  if ((long long *)a1 != a2)
  {
    uint64_t v5 = a1 + 24;
    if ((long long *)(a1 + 24) != a2)
    {
      uint64_t v7 = 0;
      do
      {
        char v8 = (long long *)v5;
        if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
        {
          long long v14 = *v8;
          uint64_t v15 = *((void *)v8 + 2);
          *((void *)v8 + 1) = 0;
          *((void *)v8 + 2) = 0;
          *(void *)char v8 = 0;
          uint64_t v9 = v7;
          do
          {
            uint64_t v10 = a1 + v9;
            size_t v11 = (void **)(a1 + v9 + 24);
            if (*(char *)(a1 + v9 + 47) < 0) {
              operator delete(*v11);
            }
            *(_OWORD *)size_t v11 = *(_OWORD *)v10;
            *(void *)(a1 + v9 + 40) = *(void *)(v10 + 16);
            *(unsigned char *)(v10 + 23) = 0;
            *(unsigned char *)uint64_t v10 = 0;
            if (!v9)
            {
              uint64_t v13 = a1;
              goto LABEL_13;
            }
            v9 -= 24;
          }
          while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
          int v12 = *(char *)(a1 + v9 + 47);
          uint64_t v13 = a1 + v9 + 24;
          if (v12 < 0) {
            operator delete(*(void **)v13);
          }
LABEL_13:
          *(_OWORD *)uint64_t v13 = v14;
          *(void *)(v13 + 16) = v15;
        }
        uint64_t v5 = (uint64_t)v8 + 24;
        v7 += 24;
      }
      while ((long long *)((char *)v8 + 24) != a2);
    }
  }
}

void sub_3B460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_3B47C(long long *a1, long long *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    unint64_t v4 = (long long *)((char *)a1 + 24);
    if ((long long *)((char *)a1 + 24) != a2)
    {
      uint64_t v6 = (uint64_t)a1 - 24;
      do
      {
        uint64_t v7 = v4;
        if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
        {
          long long v12 = *v7;
          uint64_t v13 = *((void *)v7 + 2);
          *((void *)v7 + 1) = 0;
          *((void *)v7 + 2) = 0;
          *(void *)uint64_t v7 = 0;
          uint64_t v8 = v6;
          do
          {
            uint64_t v9 = (void **)(v8 + 48);
            if (*(char *)(v8 + 71) < 0) {
              operator delete(*v9);
            }
            *(_OWORD *)uint64_t v9 = *(_OWORD *)(v8 + 24);
            *(void *)(v8 + 64) = *(void *)(v8 + 40);
            *(unsigned char *)(v8 + 47) = 0;
            *(unsigned char *)(v8 + 24) = 0;
            v8 -= 24;
          }
          while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
          int v10 = *(char *)(v8 + 71);
          uint64_t v11 = v8 + 48;
          if (v10 < 0) {
            operator delete(*(void **)v11);
          }
          *(_OWORD *)uint64_t v11 = v12;
          *(void *)(v11 + 16) = v13;
        }
        unint64_t v4 = (long long *)((char *)v7 + 24);
        v6 += 24;
      }
      while ((long long *)((char *)v7 + 24) != a2);
    }
  }
}

void sub_3B594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3B5B0(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  char v8 = (*(uint64_t (**)(void))(*(void *)a4 + 16))();
  uint64_t result = (*(uint64_t (**)(void))(*(void *)a4 + 16))();
  if ((v8 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    uint64_t v13 = *((void *)a2 + 2);
    long long v14 = *a2;
    uint64_t v15 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v15;
    *a3 = v14;
    *((void *)a3 + 2) = v13;
    if (!(*(unsigned int (**)(void))(*(void *)a4 + 16))()) {
      return 1;
    }
    uint64_t v16 = *((void *)a1 + 2);
    long long v17 = *a1;
    uint64_t v18 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v18;
    *a2 = v17;
    *((void *)a2 + 2) = v16;
    return 2;
  }
  if (!result)
  {
    uint64_t v19 = *((void *)a1 + 2);
    long long v20 = *a1;
    uint64_t v21 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v21;
    *a2 = v20;
    *((void *)a2 + 2) = v19;
    if (!(*(unsigned int (**)(void))(*(void *)a4 + 16))()) {
      return 1;
    }
    uint64_t v22 = *((void *)a2 + 2);
    long long v23 = *a2;
    uint64_t v24 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v24;
    *a3 = v23;
    *((void *)a3 + 2) = v22;
    return 2;
  }
  uint64_t v10 = *((void *)a1 + 2);
  long long v11 = *a1;
  uint64_t v12 = *((void *)a3 + 2);
  *a1 = *a3;
  *((void *)a1 + 2) = v12;
  *a3 = v11;
  *((void *)a3 + 2) = v10;
  return 1;
}

long long *sub_3B71C(long long *a1, long long *a2, uint64_t a3)
{
  uint64_t v14 = *((void *)a1 + 2);
  long long v13 = *a1;
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  if ((*(uint64_t (**)(void))(*(void *)a3 + 16))())
  {
    uint64_t v6 = a1;
    do
      uint64_t v6 = (long long *)((char *)v6 + 24);
    while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0);
  }
  else
  {
    uint64_t v7 = (long long *)((char *)a1 + 24);
    do
    {
      uint64_t v6 = v7;
      if (v7 >= a2) {
        break;
      }
      int v8 = (*(uint64_t (**)(void))(*(void *)a3 + 16))();
      uint64_t v7 = (long long *)((char *)v6 + 24);
    }
    while (!v8);
  }
  if (v6 < a2)
  {
    do
      a2 = (long long *)((char *)a2 - 24);
    while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
  }
  while (v6 < a2)
  {
    uint64_t v16 = *((void *)v6 + 2);
    long long v15 = *v6;
    long long v9 = *a2;
    *((void *)v6 + 2) = *((void *)a2 + 2);
    long long *v6 = v9;
    *((void *)a2 + 2) = v16;
    *a2 = v15;
    do
      uint64_t v6 = (long long *)((char *)v6 + 24);
    while (!(*(unsigned int (**)(void))(*(void *)a3 + 16))());
    do
      a2 = (long long *)((char *)a2 - 24);
    while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
  }
  uint64_t v10 = (void **)v6 - 3;
  if ((long long *)((char *)v6 - 24) == a1)
  {
    if (*((char *)v6 - 1) < 0) {
      operator delete(*v10);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v11 = *(_OWORD *)v10;
    *((void *)a1 + 2) = *((void *)v6 - 1);
    *a1 = v11;
    *((unsigned char *)v6 - 1) = 0;
    *((unsigned char *)v6 - 24) = 0;
  }
  *((void *)v6 - 1) = v14;
  *(_OWORD *)uint64_t v10 = v13;
  return v6;
}

void sub_3B8E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3B910(long long *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  long long v16 = *a1;
  uint64_t v17 = *((void *)a1 + 2);
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  do
    v6 += 24;
  while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
  unint64_t v7 = (unint64_t)a1 + v6;
  if (v6 == 24)
  {
    do
    {
      if (v7 >= a2) {
        break;
      }
      a2 -= 24;
    }
    while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0);
  }
  else
  {
    do
      a2 -= 24;
    while (!(*(unsigned int (**)(void))(*(void *)a3 + 16))());
  }
  int v8 = (long long *)((char *)a1 + v6);
  if (v7 < a2)
  {
    unint64_t v9 = a2;
    do
    {
      long long v10 = *v8;
      uint64_t v11 = *((void *)v8 + 2);
      uint64_t v12 = *(void *)(v9 + 16);
      long long *v8 = *(_OWORD *)v9;
      *((void *)v8 + 2) = v12;
      *(void *)(v9 + 16) = v11;
      *(_OWORD *)unint64_t v9 = v10;
      do
        int v8 = (long long *)((char *)v8 + 24);
      while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
      do
        v9 -= 24;
      while (!(*(unsigned int (**)(void))(*(void *)a3 + 16))());
    }
    while ((unint64_t)v8 < v9);
  }
  long long v13 = (void **)v8 - 3;
  if ((long long *)((char *)v8 - 24) == a1)
  {
    if (*((char *)v8 - 1) < 0) {
      operator delete(*v13);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v14 = *(_OWORD *)v13;
    *((void *)a1 + 2) = *((void *)v8 - 1);
    *a1 = v14;
    *((unsigned char *)v8 - 1) = 0;
    *((unsigned char *)v8 - 24) = 0;
  }
  *((void *)v8 - 1) = v17;
  *(_OWORD *)long long v13 = v16;
  return (uint64_t)v8 - 24;
}

void sub_3BACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_3BAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      int v8 = (long long *)(a2 - 24);
      if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
      {
        uint64_t v9 = *(void *)(a1 + 16);
        long long v10 = *(_OWORD *)a1;
        uint64_t v11 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(void *)(a1 + 16) = v11;
        long long *v8 = v10;
        *(void *)(a2 - 8) = v9;
      }
      return 1;
    case 3uLL:
      sub_3B5B0((long long *)a1, (long long *)(a1 + 24), (long long *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      sub_3BD80(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1;
    case 5uLL:
      sub_3BE84((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24, a3);
      return 1;
    default:
      sub_3B5B0((long long *)a1, (long long *)(a1 + 24), (long long *)(a1 + 48), a3);
      uint64_t v12 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v13 = 0;
      int v14 = 0;
      break;
  }
  while (1)
  {
    if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
    {
      long long v20 = *(_OWORD *)v12;
      uint64_t v21 = *(void *)(v12 + 16);
      *(void *)(v12 + 8) = 0;
      *(void *)(v12 + 16) = 0;
      *(void *)uint64_t v12 = 0;
      uint64_t v15 = v13;
      do
      {
        uint64_t v16 = a1 + v15;
        uint64_t v17 = (void **)(a1 + v15 + 72);
        if (*(char *)(a1 + v15 + 95) < 0) {
          operator delete(*v17);
        }
        *(_OWORD *)uint64_t v17 = *(_OWORD *)(v16 + 48);
        *(void *)(a1 + v15 + 88) = *(void *)(v16 + 64);
        *(unsigned char *)(v16 + 71) = 0;
        *(unsigned char *)(v16 + 48) = 0;
        if (v15 == -48)
        {
          uint64_t v19 = a1;
          goto LABEL_15;
        }
        v15 -= 24;
      }
      while (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) != 0);
      int v18 = *(char *)(a1 + v15 + 95);
      uint64_t v19 = a1 + v15 + 72;
      if (v18 < 0) {
        operator delete(*(void **)v19);
      }
LABEL_15:
      *(_OWORD *)uint64_t v19 = v20;
      *(void *)(v19 + 16) = v21;
      if (++v14 == 8) {
        return v12 + 24 == a2;
      }
    }
    v13 += 24;
    v12 += 24;
    if (v12 == a2) {
      return 1;
    }
  }
}

void sub_3BD4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_3BD80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_3B5B0((long long *)a1, (long long *)a2, (long long *)a3, a5);
  if ((*(unsigned int (**)(void))(*(void *)a5 + 16))())
  {
    uint64_t v11 = *(void *)(a3 + 16);
    long long v12 = *(_OWORD *)a3;
    uint64_t v13 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v13;
    *(_OWORD *)a4 = v12;
    *(void *)(a4 + 16) = v11;
    if ((*(unsigned int (**)(void))(*(void *)a5 + 16))())
    {
      uint64_t v14 = *(void *)(a2 + 16);
      long long v15 = *(_OWORD *)a2;
      uint64_t v16 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v16;
      *(_OWORD *)a3 = v15;
      *(void *)(a3 + 16) = v14;
      if ((*(unsigned int (**)(void))(*(void *)a5 + 16))())
      {
        uint64_t v17 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v18 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v18;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v17;
      }
    }
  }
  return result;
}

__n128 sub_3BE84(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __n128 v12 = sub_3BD80((uint64_t)a1, a2, a3, a4, a6);
  if ((*(unsigned int (**)(__n128))(*(void *)a6 + 16))(v12))
  {
    uint64_t v14 = *(void *)(a4 + 16);
    long long v15 = *(_OWORD *)a4;
    uint64_t v16 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v16;
    *(_OWORD *)a5 = v15;
    *(void *)(a5 + 16) = v14;
    if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
    {
      uint64_t v17 = *(void *)(a3 + 16);
      long long v18 = *(_OWORD *)a3;
      uint64_t v19 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v19;
      *(_OWORD *)a4 = v18;
      *(void *)(a4 + 16) = v17;
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
      {
        uint64_t v20 = *(void *)(a2 + 16);
        __n128 v21 = *(__n128 *)a2;
        uint64_t v22 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v22;
        *(__n128 *)a3 = v21;
        *(void *)(a3 + 16) = v20;
        if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
        {
          unint64_t v23 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v24 = *(void *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v24;
          *(__n128 *)a2 = result;
          *(void *)(a2 + 16) = v23;
        }
      }
    }
  }
  return result;
}

long long *sub_3BFC8(uint64_t a1, long long *a2, long long *a3, uint64_t a4, __n128 a5)
{
  if ((long long *)a1 != a2)
  {
    uint64_t v9 = (uint64_t)a2 - a1;
    uint64_t v10 = ((uint64_t)a2 - a1) / 24;
    if ((uint64_t)a2 - a1 >= 25)
    {
      unint64_t v11 = (unint64_t)(v10 - 2) >> 1;
      unint64_t v12 = v11 + 1;
      uint64_t v13 = (__n128 *)(a1 + 24 * v11);
      do
      {
        a5 = sub_3C21C(a1, a4, v10, v13);
        uint64_t v13 = (__n128 *)((char *)v13 - 24);
        --v12;
      }
      while (v12);
    }
    uint64_t v14 = a2;
    if (a2 != a3)
    {
      long long v15 = a2;
      do
      {
        if ((*(unsigned int (**)(__n128))(*(void *)a4 + 16))(a5))
        {
          uint64_t v16 = *((void *)v15 + 2);
          long long v17 = *v15;
          uint64_t v18 = *(void *)(a1 + 16);
          long long *v15 = *(_OWORD *)a1;
          *((void *)v15 + 2) = v18;
          *(_OWORD *)a1 = v17;
          *(void *)(a1 + 16) = v16;
          a5 = sub_3C21C(a1, a4, v10, (__n128 *)a1);
        }
        long long v15 = (long long *)((char *)v15 + 24);
      }
      while (v15 != a3);
      uint64_t v14 = a3;
    }
    if (v9 >= 25)
    {
      int64_t v19 = v9 / 0x18uLL;
      uint64_t v20 = (long long *)((char *)a2 - 24);
      do
      {
        uint64_t v21 = *(void *)a1;
        *(void *)long long v29 = *(void *)(a1 + 8);
        *(void *)&v29[7] = *(void *)(a1 + 15);
        char v22 = *(unsigned char *)(a1 + 23);
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        uint64_t v23 = sub_3C3F4(a1, a4, v19);
        uint64_t v24 = v23;
        int v25 = *(char *)(v23 + 23);
        if (v20 == (long long *)v23)
        {
          if (v25 < 0) {
            operator delete(*(void **)v23);
          }
          *(void *)uint64_t v24 = v21;
          *(void *)(v24 + 8) = *(void *)v29;
          *(void *)(v24 + 15) = *(void *)&v29[7];
          *(unsigned char *)(v24 + 23) = v22;
        }
        else
        {
          if (v25 < 0) {
            operator delete(*(void **)v23);
          }
          long long v26 = *v20;
          *(void *)(v24 + 16) = *((void *)v20 + 2);
          *(_OWORD *)uint64_t v24 = v26;
          *(void *)uint64_t v20 = v21;
          *((void *)v20 + 1) = *(void *)v29;
          *(void *)((char *)v20 + 15) = *(void *)&v29[7];
          *((unsigned char *)v20 + 23) = v22;
          sub_3C4D8(a1, v24 + 24, a4, 0xAAAAAAAAAAAAAAABLL * ((v24 + 24 - a1) >> 3));
        }
        uint64_t v20 = (long long *)((char *)v20 - 24);
      }
      while (v19-- > 2);
    }
    return v14;
  }
  return a3;
}

void sub_3C204(_Unwind_Exception *exception_object)
{
  if (v2 < 0) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_3C21C(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = a4;
    uint64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v10 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      unint64_t v11 = (__n128 *)(a1 + 24 * v10);
      uint64_t v12 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v12 < a3 && (*(unsigned int (**)(void))(*(void *)a2 + 16))())
      {
        unint64_t v11 = (__n128 *)((char *)v11 + 24);
        uint64_t v10 = v12;
      }
      if (((*(uint64_t (**)(void))(*(void *)a2 + 16))() & 1) == 0)
      {
        __n128 v17 = *v5;
        unint64_t v18 = v5[1].n128_u64[0];
        v5->n128_u64[1] = 0;
        v5[1].n128_u64[0] = 0;
        v5->n128_u64[0] = 0;
        while (1)
        {
          uint64_t v14 = v11;
          if (v5[1].n128_i8[7] < 0) {
            operator delete((void *)v5->n128_u64[0]);
          }
          __n128 v15 = *v11;
          v5[1].n128_u64[0] = v11[1].n128_u64[0];
          *uint64_t v5 = v15;
          v11[1].n128_u8[7] = 0;
          v11->n128_u8[0] = 0;
          if (v7 < v10) {
            break;
          }
          uint64_t v16 = (2 * v10) | 1;
          unint64_t v11 = (__n128 *)(a1 + 24 * v16);
          uint64_t v10 = 2 * v10 + 2;
          if (v10 >= a3)
          {
            uint64_t v10 = v16;
          }
          else if ((*(unsigned int (**)(void))(*(void *)a2 + 16))())
          {
            unint64_t v11 = (__n128 *)((char *)v11 + 24);
          }
          else
          {
            uint64_t v10 = v16;
          }
          uint64_t v5 = v14;
          if ((*(unsigned int (**)(void))(*(void *)a2 + 16))())
          {
            if (v14[1].n128_i8[7] < 0) {
              operator delete((void *)v14->n128_u64[0]);
            }
            break;
          }
        }
        __n128 result = v17;
        v14[1].n128_u64[0] = v18;
        __n128 *v14 = v17;
      }
    }
  }
  return result;
}

void sub_3C3D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3C3F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = a1 + 24 * v6 + 24;
    uint64_t v10 = 2 * v6;
    uint64_t v6 = (2 * v6) | 1;
    uint64_t v11 = v10 + 2;
    if (v10 + 2 < a3 && (*(unsigned int (**)(void))(*(void *)a2 + 16))())
    {
      v9 += 24;
      uint64_t v6 = v11;
    }
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v12 = *(_OWORD *)v9;
    *(void *)(a1 + 16) = *(void *)(v9 + 16);
    *(_OWORD *)a1 = v12;
    *(unsigned char *)(v9 + 23) = 0;
    *(unsigned char *)uint64_t v9 = 0;
    a1 = v9;
  }
  while (v6 <= v8);
  return v9;
}

double sub_3C4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (long long *)(a1 + 24 * (v4 >> 1));
    uint64_t v9 = (long long *)(a2 - 24);
    if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
    {
      long long v13 = *v9;
      uint64_t v14 = *((void *)v9 + 2);
      *((void *)v9 + 1) = 0;
      *((void *)v9 + 2) = 0;
      *(void *)uint64_t v9 = 0;
      while (1)
      {
        uint64_t v11 = v8;
        if (*((char *)v9 + 23) < 0) {
          operator delete(*(void **)v9);
        }
        long long v12 = *v8;
        *((void *)v9 + 2) = *((void *)v8 + 2);
        long long *v9 = v12;
        *((unsigned char *)v8 + 23) = 0;
        *(unsigned char *)uint64_t v8 = 0;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (long long *)(a1 + 24 * v7);
        uint64_t v9 = v11;
        if (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0)
        {
          if (*((char *)v11 + 23) < 0) {
            operator delete(*(void **)v11);
          }
          break;
        }
      }
      double result = *(double *)&v13;
      long long *v11 = v13;
      *((void *)v11 + 2) = v14;
    }
  }
  return result;
}

void sub_3C5E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_3C604(uint64_t **a1, void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)sub_3C69C((uint64_t)a1, &v9, a2);
  double result = *v6;
  if (!*v6)
  {
    sub_3C730((uint64_t)a1, a4, (uint64_t)&v8);
    sub_3C7D8(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

void *sub_3C69C(uint64_t a1, void *a2, void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  unint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        unint64_t v7 = v4;
        uint64_t v8 = v4 + 4;
        if ((sub_3C830(a3, (void **)v4 + 4) & 0x80) == 0) {
          break;
        }
        unint64_t v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if ((sub_3C830(v8, a3) & 0x80) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      unint64_t v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    unint64_t v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

unsigned char *sub_3C730@<X0>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  double result = v6 + 32;
  uint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    double result = sub_30058(result, *(void **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)double result = v9;
  }
  *((void *)v6 + 7) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_3C7BC(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_3CA60(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_3C7D8(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  double result = sub_3C8C8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t sub_3C830(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return sub_3C868(a1, v2, v5, v6);
}

uint64_t sub_3C868(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

uint64_t *sub_3C8C8(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            long long v9 = (uint64_t **)a2[2];
          }
          else
          {
            long long v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            long long *v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_3CA60(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void **sub_3CAC0(uint64_t a1, void **a2)
{
  size_t v2 = (void **)(a1 + 8);
  size_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = (void **)(a1 + 8);
  do
  {
    char v6 = sub_3C830(v3 + 4, a2);
    if (v6 >= 0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6 >= 0) {
      uint64_t v5 = (void **)v3;
    }
    size_t v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2 || (sub_3C830(a2, v5 + 4) & 0x80) != 0) {
    return v2;
  }
  return v5;
}

void sub_3CB40(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_3CB40(a1, *(void *)a2);
    sub_3CB40(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void sub_3CC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_3CD94(_Unwind_Exception *exception_object)
{
}

void sub_3CEAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3CFD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D0F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D17C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D20C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D29C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D328(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D3B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D574(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3D72C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingAggdReporter()
{
  if ((byte_AE480 & 1) == 0)
  {
    Class v0 = NSClassFromString(@"TIAggdReporter");
    if (v0)
    {
      Class v1 = v0;
      size_t v2 = objc_alloc_init(TIAggdReporterMock);
      size_t v3 = (void *)qword_AE478;
      qword_AE478 = (uint64_t)v2;

      uint64_t v4 = qword_AE478;
      [(objc_class *)v1 setSharedAggdReporter:v4];
    }
    else
    {
      byte_AE480 = 1;
    }
  }
}

void _TIEndMockingAggdReporter()
{
  if ((byte_AE480 & 1) == 0)
  {
    [NSClassFromString(@"TIAggdReporter") setSharedAggdReporter:0];
    Class v0 = (void *)qword_AE478;
    qword_AE478 = 0;
  }
}

id _TIGetMockingAggdReporterScalar(uint64_t a1)
{
  if (byte_AE480) {
    return 0;
  }
  else {
    return [(id)qword_AE478 getScalar:a1];
  }
}

id _TIGetMockingAggdReporterDistribution(uint64_t a1)
{
  if (byte_AE480)
  {
    Class v1 = &__NSArray0__struct;
  }
  else
  {
    Class v1 = [(id)qword_AE478 getDistributionObject:a1];
  }

  return v1;
}

id _TIMockingAggdReporterDictionaryToJSON()
{
  return _[(id)qword_AE478 toJsonString];
}

id _TIMockingAggdReporterDictionary()
{
  return [(id)qword_AE478 toDictionary];
}

id _TIMockingAggdReporterClear()
{
  return [(id)qword_AE478 clear];
}

uint64_t sub_3F200(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([v7 length])
  {
    uint64_t v5 = +[PlaybackTest sentenceToTransliteratedPlaybackTest:v7 withCatenation:*(unsigned __int8 *)(a1 + 40) addWordSpacing:*(unsigned __int8 *)(a1 + 41)];
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }

  return _objc_release_x2();
}

void sub_3FF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_3FF48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3FF58(uint64_t a1)
{
}

void sub_3FF60(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 objectForKey:@"perLineResults"];
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (v6) {
    sub_40014(v4);
  }
  else {
    sub_40338(v4);
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v7 setObject:v8 forKey:a1[5]];
}

id sub_40014(void *a1)
{
  id v1 = a1;
  id v17 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = v1;
  id obj = [v1 objectForKey:@"Results"];
  id v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v4 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v5 = [v3 objectForKey:@"CorpusId"];
        [v4 setObject:v5 forKey:@"CorpusId"];

        unsigned int v6 = [v3 objectForKey:@"WordCount"];
        [v4 setObject:v6 forKey:@"WordCount"];

        uint64_t v7 = [v3 objectForKey:@"WordErrorCount"];
        [v4 setObject:v7 forKey:@"WordErrorCount"];

        id v8 = [v3 objectForKey:@"CharacterCount"];
        [v4 setObject:v8 forKey:@"CharacterCount"];

        long long v9 = [v3 objectForKey:@"KeystrokeCount"];
        [v4 setObject:v9 forKey:@"KeystrokeCount"];

        uint64_t v10 = [v3 objectForKey:@"SeparatorErrorCount"];
        [v4 setObject:v10 forKey:@"SeparatorErrorCount"];

        uint64_t v11 = [v3 objectForKey:@"SeparatorCount"];
        [v4 setObject:v11 forKey:@"SeparatorCount"];

        uint64_t v12 = [v3 objectForKey:@"InsertedCharacterCount"];
        [v4 setObject:v12 forKey:@"InsertedCharacterCount"];

        [v17 addObject:v4];
      }
      id v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v18);
  }

  return v17;
}

id sub_40338(void *a1)
{
  id v1 = a1;
  size_t v2 = +[NSMutableDictionary dictionary];
  id v3 = [v1 objectForKey:@"KeystrokeSavingsRatio"];
  [v2 setObject:v3 forKey:@"ksr"];

  id v4 = [v1 objectForKey:@"WordAccuracy"];

  [v2 setObject:v4 forKey:@"accuracy"];

  return v2;
}

void sub_403FC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 stringByAppendingString:@"_customLM"];
  uint64_t v5 = [*(id *)(a1 + 40) objectForKey:@"perLineResults"];
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v6) {
    sub_40014(v4);
  }
  else {
  id v8 = sub_40338(v4);
  }

  [v7 setObject:v8 forKey:v9];
}

void _TIBeginMockingCryptographer()
{
  Class v0 = objc_alloc_init(TICryptographerMock);
  if (objc_opt_respondsToSelector()) {
    +[TICryptographer performSelector:"setSharedCryptographer:" withObject:v0];
  }
}

uint64_t _TIEndMockingCryptographer()
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return (uint64_t)+[TICryptographer performSelector:"setSharedCryptographer:" withObject:0];
  }
  return result;
}

void _TIBeginMockingSingletons()
{
}

void _TIBeginMockingSingletonsWithData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v15 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  if (objc_opt_respondsToSelector()) {
    +[TILaunchServicesLookup disableForTesting:1];
  }
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingTransientLexiconManagerWithData(v13, v12);

  if (v11) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = &__NSArray0__struct;
  }
  _TIBeginMockingUserDictionaryServerWithPairs(v14);

  if (v15)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v15);
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  _TIBeginMockingLanguageLikelihoodModel();
  if (a5) {
LABEL_8:
  }
    _TIBeginMockingAssetManager();
LABEL_9:
  _TIBeginMockingAggdReporter();
  sub_CCA0();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  _TIBeginMockingTrialManager();
  if ((a6 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    sub_54F4();
  }
}

void _TIBeginMockingSingletonsWithResources(void *a1, void *a2, void *a3, int a4, char a5)
{
  id v12 = a3;
  id v9 = a2;
  id v10 = a1;
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingContactManagerWithContactCollection(v10);

  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = &__NSArray0__struct;
  }
  _TIBeginMockingUserDictionaryServerWithPairs(v11);

  if (v12)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v12);
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  _TIBeginMockingLanguageLikelihoodModel();
  if (a4) {
LABEL_6:
  }
    _TIBeginMockingAssetManager();
LABEL_7:
  _TIBeginMockingAggdReporter();
  sub_CCA0();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  _TIBeginMockingTrialManager();
  sub_54F4();
  if ((a5 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    sub_54F4();
  }
}

void _TIBeginMockingSingletonsWithMockData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  _TIConvertTIMockContactCollection(a1);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  _TIBeginMockingSingletonsWithData(v14, v13, v12, v11, a5, a6);
}

uint64_t _TIEndMockingSingletons()
{
  return _TIEndMockingSingletonsWithData(0);
}

uint64_t _TIEndMockingSingletonsWithData(char a1)
{
  TIDispatchWaitForAllBlocks();
  _TIEndMockingUserModelDataStore();
  _TIEndMockingCryptographer();
  sub_CD54();
  _TIEndMockingAggdReporter();
  _TIEndMockingAssetManager();
  _TIEndMockingLanguageLikelihoodModel();
  _TIEndMockingUserDictionaryServer();
  _TIEndMockingTransientLexiconManager();
  _TIEndMockingKeyboardActivityController();
  _TIEndMockingTrialManager();
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = (uint64_t)+[TILaunchServicesLookup disableForTesting:0];
  }
  if ((a1 & 1) == 0)
  {
    _TIEndMockingProactiveQuickTypeManager();
    return sub_5568();
  }
  return result;
}

uint64_t sub_40C04(int a1, int a2, int a3)
{
  return (a2 + a3 * a1);
}

id TIOptimalSequenceAlignment(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  v52 = a3;
  v53 = v5;
  if ((unint64_t)[v5 count] > 0xFFFE
    || (unint64_t)[v6 count] > 0xFFFE
    || (unsigned __int16 v7 = (unsigned __int16)[v5 count] + 1,
        unsigned __int16 v8 = (unsigned __int16)[v6 count],
        uint64_t v9 = v7,
        uint64_t v10 = (unsigned __int16)(v8 + 1),
        uint64_t v49 = v9,
        v9 <= 1)
    && v10 < 2)
  {
    id v11 = &__NSArray0__struct;
    goto LABEL_6;
  }
  id v11 = &__NSArray0__struct;
  if (v9 && v8 != 0xFFFF)
  {
    int v46 = v9 - 1;
    id v13 = (float *)malloc_type_malloc(8 * (v10 * v9), 0x100004000313F17uLL);
    *(void *)id v13 = 0;
    if (v49 >= 2)
    {
      uint64_t v14 = 0;
      id v15 = v13;
      do
      {
        if (v14) {
          float v16 = 0.8;
        }
        else {
          float v16 = 1.0;
        }
        float v17 = v16 + *v15;
        v15 += 2 * v10;
        float *v15 = v17;
        *((_WORD *)v15 + 2) = v14 + 1;
        *((_WORD *)v15 + 3) = 1;
        ++v14;
      }
      while (v49 - 1 != v14);
    }
    v47 = v13;
    uint64_t v48 = v10;
    if (v10 >= 2)
    {
      id v18 = (_WORD *)v13 + 7;
      float v19 = *v13;
      for (uint64_t i = 1; i != v10; ++i)
      {
        if (i == 1) {
          float v21 = 1.0;
        }
        else {
          float v21 = 0.8;
        }
        float v19 = v21 + v19;
        *(float *)(v18 - 3) = v19;
        *(v18 - 1) = i;
        *id v18 = 2;
        v18 += 4;
      }
      uint64_t v22 = 2 * v10;
      uint64_t v50 = 1;
      v51 = v13 + 2;
      do
      {
        if (v49 >= 2)
        {
          uint64_t v23 = 0;
          uint64_t v24 = v51;
          do
          {
            int v25 = [v53 objectAtIndex:v23];
            id v26 = v6;
            BOOL v27 = [v6 objectAtIndex:v50 - 1];
            int v28 = v52[2](v52, v25, v27);

            if (v28) {
              float v29 = 0.0;
            }
            else {
              float v29 = 1.0;
            }
            float v30 = v29 + *(v24 - 2);
            if (*((_WORD *)v24 + 3) == 1) {
              float v31 = 0.8;
            }
            else {
              float v31 = 1.0;
            }
            float v32 = *v24 + v31;
            id v33 = &v24[v22];
            if (HIWORD(v24[v22 - 1]) == 2) {
              float v34 = 0.8;
            }
            else {
              float v34 = 1.0;
            }
            float v35 = v24[v22 - 2] + v34;
            if (v30 > v32 || v30 > v35)
            {
              if (v32 <= v35)
              {
                *id v33 = v32;
                *((_WORD *)v33 + 2) = *((_WORD *)v24 + 2) + 1;
                *((_WORD *)v33 + 3) = 1;
              }
              else
              {
                v24[2 * v48] = v35;
                *((_WORD *)v33 + 2) = LOWORD(v24[v22 - 1]) + 1;
                *((_WORD *)v33 + 3) = 2;
              }
            }
            else
            {
              *id v33 = v30;
              *((_WORD *)v33 + 2) = *((_WORD *)v24 - 2) + 1;
              *((_WORD *)v33 + 3) = 0;
            }
            id v6 = v26;
            ++v23;
            uint64_t v24 = (float *)((char *)v24 + v22 * 4);
          }
          while (v49 - 1 != v23);
        }
        ++v50;
        v51 += 2;
      }
      while (v50 != v48);
    }
    unsigned __int16 v37 = v48 - 1;
    int v38 = v46;
    uint64_t v39 = LOWORD(v47[2 * (v48 - 1 + v48 * v46) + 1]);
    id v11 = +[NSMutableArray arrayWithCapacity:v39];
    if (v39)
    {
      unsigned int v40 = 0;
      do
      {
        long long v41 = objc_alloc_init(TIAlignedIndexes);
        [v11 addObject:v41];

        ++v40;
      }
      while (v40 < v39);
      uint64_t v42 = v39 + 1;
      while (1)
      {
        long long v43 = [v11 objectAtIndex:v42 - 2];
        v44 = v43;
        int v45 = HIWORD(v47[2 * v48 * (unsigned __int16)v38 + 1 + 2 * v37]);
        if (v45 == 2) {
          break;
        }
        if (v45 == 1)
        {
          [v43 setIndex1:(unsigned __int16)v38 - 1];
          [v44 setIndex2:0xFFFFLL];
          --v38;
        }
        else if (!HIWORD(v47[2 * v48 * (unsigned __int16)v38 + 1 + 2 * v37]))
        {
          [v43 setIndex1:(unsigned __int16)v38 - 1];
          [v44 setIndex2:v37 - 1];
          --v38;
LABEL_55:
          --v37;
        }

        if (--v42 <= 1) {
          goto LABEL_57;
        }
      }
      [v43 setIndex1:0xFFFFLL];
      [v44 setIndex2:v37 - 1];
      goto LABEL_55;
    }
LABEL_57:
    free(v47);
  }
LABEL_6:

  return v11;
}

uint64_t sub_4107C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a4 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v4 = a3 + 16 * a4;
  while (*(void *)a3 < a1)
  {
    a3 += 16;
    if (a3 >= v4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (*(void *)a3 <= a1 + a2) {
    return *(void *)a3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

void sub_410BC(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v32 = a1;
  id v7 = a2;
  id v8 = a4;
  if ([v8 count])
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    id v12 = 0;
    float v29 = v8;
    do
    {
      id v13 = objc_msgSend(v8, "objectAtIndex:", v11, v29);
      uint64_t v14 = +[NSMutableString string];
      id v15 = [v14 length];
      id v16 = [v13 length];
      while (v15 < v16)
      {
        float v17 = v12 + 1;
        id v18 = [v7 objectAtIndex:v12];
        [v14 appendString:v18];

        id v15 = [v14 length];
        id v16 = [v13 length];
        id v12 = v17;
      }
      uint64_t v31 = v11;
      uint64_t v19 = 0;
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 < v12)
      {
        do
        {
          float v21 = [v32 objectAtIndex:v10];
          if ([v21 index1] == v9)
          {
            uint64_t v22 = v21;
          }
          else
          {
            do
            {
              uint64_t v22 = [v32 objectAtIndex:++v10];

              float v21 = v22;
            }
            while ([v22 index1] != v9);
          }
          uint64_t v23 = (char *)[v22 index2];
          uint64_t v24 = v19 + v20 - (void)v23;
          if (v19 + v20 <= (unint64_t)v23) {
            uint64_t v25 = (uint64_t)&v23[-v20 + 1];
          }
          else {
            uint64_t v25 = v19;
          }
          if ((unint64_t)v23 < v20) {
            id v26 = v23;
          }
          else {
            id v26 = (char *)v20;
          }
          if ((unint64_t)v23 >= v20) {
            uint64_t v24 = v25;
          }
          if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v27 = (unint64_t)v23;
          }
          else {
            unint64_t v27 = (unint64_t)v26;
          }
          if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v24 = 1;
          }
          if (v23 != (unsigned char *)&loc_FFFC + 3)
          {
            unint64_t v20 = v27;
            uint64_t v19 = v24;
          }

          ++v9;
        }
        while (v9 != v12);
      }
      int v28 = (unint64_t *)(a5 + 16 * v31);
      unint64_t *v28 = v20;
      v28[1] = v19;

      uint64_t v11 = v31 + 1;
      id v8 = v29;
      uint64_t v9 = v12;
    }
    while (v31 + 1 < (unint64_t)[v29 count]);
  }
}

void sub_412D4(void *a1, void *a2, uint64_t a3)
{
  id v17 = a1;
  id v5 = a2;
  if ([v5 count])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v5 objectAtIndex:v7];
      uint64_t v10 = +[NSMutableString string];
      id v11 = [v10 length];
      if (v11 < [v9 length])
      {
        uint64_t v12 = v6;
        do
        {
          uint64_t v8 = v12 + 1;
          id v13 = objc_msgSend(v17, "objectAtIndex:");
          [v10 appendString:v13];

          id v14 = [v10 length];
          id v15 = [v9 length];
          uint64_t v12 = v8;
        }
        while (v14 < v15);
      }
      id v16 = (void *)(a3 + 16 * v7);
      void *v16 = v6;
      v16[1] = v8 - v6;

      ++v7;
      uint64_t v6 = v8;
    }
    while (v7 < (unint64_t)[v5 count]);
  }
}

uint64_t sub_41410(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v4 = (unint64_t)&a3[2 * a4];
  unint64_t v5 = *(void *)(v4 - 8) + *(void *)(v4 - 16);
  if (a2)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = a2 - 1;
    uint64_t v9 = (unint64_t *)(result + 16);
    do
    {
      uint64_t v10 = (unint64_t *)(result + 16 * v6);
      unint64_t v11 = *v10;
      if (*v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v12 = 0;
        unint64_t *v10 = v7;
        v10[1] = 0;
        unint64_t v11 = v7;
      }
      else
      {
        unint64_t v12 = v10[1];
      }
      uint64_t v13 = v6 + 1;
      id v14 = v9;
      unint64_t v15 = v8;
      unint64_t v16 = v5;
      if (v6 + 1 < a2)
      {
        while (1)
        {
          unint64_t v17 = *v14;
          v14 += 2;
          unint64_t v16 = v17;
          if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          if (!--v15)
          {
            unint64_t v16 = v5;
            break;
          }
        }
      }
      unint64_t v18 = v12 + v11;
      if (v11 != v7)
      {
        unint64_t *v10 = v7;
        unint64_t v12 = v18 - v7;
        *(void *)(result + 16 * v6 + 8) = v18 - v7;
      }
      if (v16 != v18)
      {
        uint64_t v19 = a3;
        if (a4 < 1) {
          goto LABEL_22;
        }
        while (1)
        {
          unint64_t v20 = *v19;
          if (*v19 >= v18) {
            break;
          }
          v19 += 2;
          if ((unint64_t)v19 >= v4) {
            goto LABEL_22;
          }
        }
        if (v20 > v16 || v20 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_22:
        }
          unint64_t v20 = v16;
        unint64_t v12 = v20 - v7;
        *(void *)(result + 16 * v6 + 8) = v20 - v7;
      }
      v7 += v12;
      --v8;
      v9 += 2;
      ++v6;
    }
    while (v13 != a2);
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (v7 < v5) {
    *(void *)(result + 16 * a2 - 8) = v5 - *(void *)(result + 16 * a2 - 16);
  }
  return result;
}

void TITargetKeyRangesForSourceTokens(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if ([v14 count])
  {
    unint64_t v16 = 0;
    long long v20 = xmmword_86280;
    do
      *(_OWORD *)(a6 + 16 * v16++) = v20;
    while (v16 < (unint64_t)objc_msgSend(v14, "count", v20));
  }
  if ([v14 count] && objc_msgSend(v15, "count"))
  {
    if ([v14 count])
    {
      unint64_t v18 = 0;
      long long v20 = xmmword_86280;
      do
        *(_OWORD *)(a6 + 16 * v18++) = v20;
      while (v18 < (unint64_t)objc_msgSend(v14, "count", v20));
    }
    sub_410BC(v11, v12, v17, v14, a6);
    [v15 count];
    uint64_t v19 = (unint64_t *)(&v20 - __chkstk_darwin());
    sub_412D4(v13, v15, (uint64_t)v19);
    sub_41410(a6, (unint64_t)[v14 count], v19, (uint64_t)objc_msgSend(v15, "count"));
  }
}

uint64_t sub_416EC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length]) {
    id v5 = objc_msgSend(v3, "characterAtIndex:", (char *)objc_msgSend(v3, "length") - 1);
  }
  else {
    id v5 = 0;
  }
  if ([v4 length]) {
    id v6 = [v4 characterAtIndex:0];
  }
  else {
    id v6 = 0;
  }
  unint64_t v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  if ([v7 characterIsMember:v5])
  {
    unsigned int v8 = 0;
  }
  else
  {
    uint64_t v9 = +[NSCharacterSet punctuationCharacterSet];
    unsigned int v8 = [v9 characterIsMember:v5] ^ 1;
  }
  uint64_t v10 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  if ([v10 characterIsMember:v6])
  {
    unsigned int v11 = 0;
  }
  else
  {
    id v12 = +[NSCharacterSet punctuationCharacterSet];
    unsigned int v11 = [v12 characterIsMember:v6] ^ 1;
  }
  return v8 & v11;
}

id sub_41828(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v25 = a2;
  id v6 = +[NSMutableArray array];
  if ([v5 count])
  {
    unint64_t v7 = 0;
    uint64_t v24 = (void *)(a3 + 8);
    do
    {
      unsigned int v8 = [v5 objectAtIndex:v7];
      id v9 = [v8 copy];

      uint64_t v10 = (unint64_t *)(a3 + 16 * v7);
      unint64_t v11 = *v10;
      id v12 = &stru_8DEF0;
      if (*v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = v6;
        uint64_t v14 = a3;
        id v15 = (char *)v10[1];
        unint64_t v16 = v25;
        if (&v15[v11] > [v25 count])
        {
          uint64_t v17 = +[NSMutableString string];
          [v17 appendFormat:@"WARNING! targetKeyRange [%lu, %lu] for token '%@' is out of bounds.", v11, &v15[v11], v9];
          [v17 appendFormat:@"\nsourceTokens:\n%@", v5];
          [v17 appendFormat:@"\ntargetKeys:\n%@", v25];
          [v17 appendFormat:@"\ntargetKeyRangeForSourceTokens = "];
          if ([v5 count])
          {
            unint64_t v18 = 0;
            uint64_t v19 = v24;
            do
            {
              [v17 appendFormat:@"[%lu, %lu]", *(v19 - 1), *v19 + *(v19 - 1)];
              ++v18;
              v19 += 2;
            }
            while (v18 < (unint64_t)[v5 count]);
          }
          NSLog(@"%@", v17);
          id v20 = [v25 count];
          if (v11 >= (unint64_t)v20) {
            unint64_t v11 = (unint64_t)v20;
          }
          id v15 = (char *)[v25 count] - v11;

          unint64_t v16 = v25;
        }
        a3 = v14;
        id v6 = v13;
        float v21 = objc_msgSend(v16, "subarrayWithRange:", v11, v15);
        id v12 = [v21 componentsJoinedByString:&stru_8DEF0];
      }
      uint64_t v22 = objc_alloc_init(TIAlignedTokens);
      [(TIAlignedTokens *)v22 setSource:v9];
      [(TIAlignedTokens *)v22 setTarget:v12];
      [v6 addObject:v22];

      ++v7;
    }
    while (v7 < (unint64_t)[v5 count]);
  }

  return v6;
}

id TITokenAlignmentForKeyAlignment(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v12 count])
  {
    if ([v13 count])
    {
      [v12 count];
      uint64_t v14 = &v20 - 2 * __chkstk_darwin();
      TITargetKeyRangesForSourceTokens(v9, v10, v11, v12, v13, (uint64_t)v14);
      id v15 = sub_41828(v12, v11, (uint64_t)v14);
      goto LABEL_7;
    }
    unint64_t v16 = [v10 componentsJoinedByString:&stru_8DEF0];
    uint64_t v17 = objc_alloc_init(TIAlignedTokens);
    [(TIAlignedTokens *)v17 setSource:v16];
    [(TIAlignedTokens *)v17 setTarget:&stru_8DEF0];
    float v21 = v17;
    unint64_t v18 = &v21;
  }
  else
  {
    unint64_t v16 = [v11 componentsJoinedByString:&stru_8DEF0];
    uint64_t v17 = objc_alloc_init(TIAlignedTokens);
    [(TIAlignedTokens *)v17 setSource:&stru_8DEF0];
    [(TIAlignedTokens *)v17 setTarget:v16];
    uint64_t v22 = v17;
    unint64_t v18 = &v22;
  }
  id v15 = +[NSArray arrayWithObjects:v18 count:1];

LABEL_7:

  return v15;
}

id TICharSequenceForTokenSequence(void *a1)
{
  id v1 = a1;
  +[NSMutableArray array];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_41D64;
  v4[3] = &unk_8D8F0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:v4];

  return v2;
}

void sub_41D64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 length];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_41E18;
  v5[3] = &unk_8D8C8;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v5);
}

id sub_41E18(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id TIAlignedTypingSequenceForAlignedTokenSequence(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v13 = +[NSMutableArray array];
  if ([v11 count])
  {
    uint64_t v14 = 0;
    id v15 = 0;
    while (1)
    {
      unint64_t v16 = [v11 objectAtIndex:v14];
      uint64_t v17 = [v16 source];
      if (![v17 length]) {
        break;
      }
      unint64_t v18 = (char *)[v12 count];

      if (v15 >= v18) {
        goto LABEL_7;
      }
      uint64_t v19 = objc_alloc_init(TIAlignedTyping);
      uint64_t v20 = [v16 source];
      [(TIAlignedTokens *)v19 setSource:v20];

      float v21 = [v40 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setTouched:v21];

      uint64_t v22 = [v39 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setPredicted:v22];

      uint64_t v23 = [v38 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setInlineCompletions:v23];

      uint64_t v24 = [v37 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setDocumentStates:v24];

      id v25 = [v12 objectAtIndex:v15];
      [(TIAlignedTyping *)v19 setInserted:v25];

      id v26 = [v16 target];
      [(TIAlignedTokens *)v19 setTarget:v26];

      [v13 addObject:v19];
      ++v15;
LABEL_8:

      if (++v14 >= (unint64_t)[v11 count]) {
        goto LABEL_11;
      }
    }

LABEL_7:
    uint64_t v19 = objc_alloc_init(TIAlignedTyping);
    unint64_t v27 = [v16 source];
    [(TIAlignedTokens *)v19 setSource:v27];

    int v28 = +[NSArray array];
    [(TIAlignedTyping *)v19 setTouched:v28];

    float v29 = +[NSArray array];
    [(TIAlignedTyping *)v19 setDocumentStates:v29];

    float v30 = +[NSArray array];
    [(TIAlignedTyping *)v19 setInserted:v30];

    uint64_t v31 = [v16 target];
    [(TIAlignedTokens *)v19 setTarget:v31];

    [v13 addObject:v19];
    goto LABEL_8;
  }
  id v15 = 0;
LABEL_11:
  if (v15 == [v12 count]
    || v15 == (char *)[v12 count] - 1
    && ([v12 objectAtIndex:v15],
        id v32 = objc_claimAutoreleasedReturnValue(),
        [v32 componentsJoinedByString:&stru_8DEF0],
        id v33 = objc_claimAutoreleasedReturnValue(),
        unsigned int v34 = [v33 isEqualToString:&stru_8DEF0],
        v33,
        v32,
        v34))
  {
    id v35 = v13;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

id TIConcatenateAlignedTypingAtBoundaryErrors(void *a1)
{
  id v1 = a1;
  id v29 = +[NSMutableArray array];
  id v2 = +[NSMutableString string];
  id v33 = +[NSMutableArray array];
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  id v5 = +[NSMutableArray array];
  id v6 = +[NSMutableArray array];
  unint64_t v7 = +[NSMutableString string];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v1;
  id v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
      {
        id v9 = v2;
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v11 = [v10 target];
        int v12 = sub_416EC(v7, v11);

        if (v12)
        {
          id v13 = [v10 source];
          id v2 = v9;
          [v9 appendString:v13];

          uint64_t v14 = [v10 touched];
          [v33 addObjectsFromArray:v14];

          id v15 = [v10 predicted];
          [v3 addObjectsFromArray:v15];

          unint64_t v16 = [v10 inlineCompletions];
          [v4 addObjectsFromArray:v16];

          uint64_t v17 = [v10 documentStates];
          [v5 addObjectsFromArray:v17];

          unint64_t v18 = [v10 inserted];
          [v6 addObjectsFromArray:v18];

          uint64_t v19 = [v10 target];
          [v7 appendString:v19];
        }
        else
        {
          id v2 = v9;
          if ([v9 length] || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
          {
            uint64_t v20 = objc_alloc_init(TIAlignedTyping);
            [(TIAlignedTokens *)v20 setSource:v9];
            [(TIAlignedTyping *)v20 setTouched:v33];
            [(TIAlignedTyping *)v20 setPredicted:v3];
            [(TIAlignedTyping *)v20 setInlineCompletions:v4];
            [(TIAlignedTyping *)v20 setDocumentStates:v5];
            [(TIAlignedTyping *)v20 setInserted:v6];
            [(TIAlignedTokens *)v20 setTarget:v7];
            [v29 addObject:v20];
          }
          float v21 = [v10 source];
          [v9 setString:v21];

          [v33 removeAllObjects];
          uint64_t v22 = [v10 touched];
          [v33 addObjectsFromArray:v22];

          [v3 removeAllObjects];
          uint64_t v23 = [v10 predicted];
          [v3 addObjectsFromArray:v23];

          [v4 removeAllObjects];
          uint64_t v24 = [v10 inlineCompletions];
          [v4 addObjectsFromArray:v24];

          [v5 removeAllObjects];
          id v25 = [v10 documentStates];
          [v5 addObjectsFromArray:v25];

          [v6 removeAllObjects];
          id v26 = [v10 inserted];
          [v6 addObjectsFromArray:v26];

          uint64_t v19 = [v10 target];
          [v7 setString:v19];
        }
      }
      id v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v32);
  }

  if ([v2 length] || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
  {
    unint64_t v27 = objc_alloc_init(TIAlignedTyping);
    [(TIAlignedTokens *)v27 setSource:v2];
    [(TIAlignedTyping *)v27 setTouched:v33];
    [(TIAlignedTyping *)v27 setPredicted:v3];
    [(TIAlignedTyping *)v27 setInlineCompletions:v4];
    [(TIAlignedTyping *)v27 setDocumentStates:v5];
    [(TIAlignedTyping *)v27 setInserted:v6];
    [(TIAlignedTokens *)v27 setTarget:v7];
    [v29 addObject:v27];
  }

  return v29;
}

id sub_426E0(void *a1, const char *a2)
{
  return [a1 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
}

id sub_426F4(void *a1)
{
  id v1 = a1;
  +[NSMutableArray array];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_427B0;
  v4[3] = &unk_8D8F0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:v4];

  return v2;
}

void sub_427B0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  [v2 addObject:v3];
}

id sub_42818(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSMutableArray array];
  }
  id v4 = v3;

  return v4;
}

CFStringRef sub_42874(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  unsigned int v8 = [v6 isEqualToString:v7];
  unsigned int v9 = [v5 isEqualToString:v7];

  unsigned int v10 = [v5 isEqualToString:v6];
  unsigned int v11 = [v6 containsString:@"\\b"];

  int v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12) {
    return @"RightInput_NoAutocorrection";
  }
  if ((v8 | v12))
  {
    CFStringRef v14 = @"WrongInput_NoAutocorrection_NoManualCorrection";
    if (v11) {
      CFStringRef v14 = @"WrongInput_NoAutocorrection_WrongManualCorrection";
    }
    if (v8 | v9) {
      CFStringRef v15 = @"UnknownType";
    }
    else {
      CFStringRef v15 = v14;
    }
    CFStringRef v16 = @"RightInput_NoAutocorrection_WrongManualCorrection";
    if (v10) {
      CFStringRef v16 = @"UnknownType";
    }
    if (v11) {
      CFStringRef v16 = @"RightInput_NoAutocorrection_But_WrongResult";
    }
    if ((v8 ^ 1 | v9)) {
      return v15;
    }
    else {
      return v16;
    }
  }
  else if (v11)
  {
    return @"WrongInput_NoAutocorrection_RightManualCorrection";
  }
  else
  {
    return @"WrongInput_NoAutocorrection_NoManualCorrection";
  }
}

CFStringRef sub_429A8(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  unsigned int v8 = [v6 isEqualToString:v7];
  unsigned int v9 = [v5 isEqualToString:v7];

  unsigned int v10 = [v5 isEqualToString:v6];
  unsigned int v11 = [v6 containsString:@"\\b"];

  int v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12) {
    return @"RightInput_NoAutocorrection";
  }
  if ((v8 | v12))
  {
    CFStringRef v14 = @"UnknownType";
    CFStringRef v15 = @"WrongInput_WrongAutocorrection";
    if (v10) {
      CFStringRef v15 = @"WrongInput_NoAutocorrection";
    }
    if (v11) {
      CFStringRef v15 = @"WrongInput_WrongManualCorrection";
    }
    if ((v8 | v9)) {
      CFStringRef v16 = @"UnknownType";
    }
    else {
      CFStringRef v16 = v15;
    }
    if (!v10) {
      CFStringRef v14 = @"RightInput_WrongAutocorrection";
    }
    if (v11) {
      CFStringRef v14 = @"RightInput_WrongAutocorrection_WrongManualCorrection";
    }
    if ((v8 ^ 1 | v9)) {
      return v16;
    }
    else {
      return v14;
    }
  }
  else if (v11)
  {
    return @"WrongInput_WrongAutocorrection_RightManualCorrection";
  }
  else
  {
    return @"WrongInput_RightAutocorrection";
  }
}

id TIAutoCorrectionTypeCorrectedIsNotIntended(void *a1)
{
  v5[0] = @"RightInput_WrongAutocorrection";
  v5[1] = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  v5[2] = @"WrongInput_NoAutocorrection";
  v5[3] = @"WrongInput_WrongAutocorrection";
  void v5[4] = @"WrongInput_WrongManualCorrection";
  void v5[5] = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = a1;
  id v2 = +[NSArray arrayWithObjects:v5 count:6];
  id v3 = [v2 containsObject:v1];

  return v3;
}

id TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(void *a1)
{
  v5[0] = @"RightInput_WrongAutocorrection";
  v5[1] = @"WrongInput_WrongAutocorrection";
  v5[2] = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  v5[3] = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = a1;
  id v2 = +[NSArray arrayWithObjects:v5 count:4];
  id v3 = [v2 containsObject:v1];

  return v3;
}

id TIAutoCorrectionTypeCorrectedIsNotInserted(void *a1)
{
  CFStringRef v5 = @"WrongInput_RightAutocorrection";
  CFStringRef v6 = @"RightInput_WrongAutocorrection";
  CFStringRef v7 = @"WrongInput_WrongAutocorrection";
  CFStringRef v8 = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  CFStringRef v9 = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = a1;
  id v2 = +[NSArray arrayWithObjects:&v5 count:5];
  id v3 = objc_msgSend(v2, "containsObject:", v1, v5, v6, v7, v8, v9);

  return v3;
}

id TIPlistFormattedAlignedTypingSequence(void *a1, char a2, char a3, char a4)
{
  id v7 = a1;
  +[NSMutableArray array];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_42E38;
  v13[3] = &unk_8D918;
  id v14 = v7;
  char v16 = a3;
  char v17 = a2;
  char v18 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v9 = v7;
  [v9 enumerateObjectsUsingBlock:v13];
  unsigned int v10 = v15;
  id v11 = v8;

  return v11;
}

void sub_42E38(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  CFStringRef v6 = [v5 source];
  id v7 = [v5 inserted];
  id v8 = [v7 componentsJoinedByString:&stru_8DEF0];

  id v9 = [v5 target];
  if ((char *)[*(id *)(a1 + 32) count] - 1 <= a3)
  {
    unsigned int v10 = 0;
  }
  else
  {
    unsigned int v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];
  }
  id v32 = v10;
  uint64_t v35 = a1;
  long long v36 = v6;
  id v33 = v9;
  if (([v10 isAutocompleteTriggerForPreviousEntry] & 1) != 0
    || ([v5 isRevisedAutocompleteEntry] & 1) != 0)
  {
    uint64_t v11 = sub_429A8(v6, v8, v9);
  }
  else
  {
    uint64_t v11 = sub_42874(v6, v8, v9);
  }
  int v12 = (void *)v11;
  v37[0] = @"intended";
  id v13 = objc_msgSend(v5, "source", NSMutableDictionary);
  id v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v38[0] = v14;
  v37[1] = @"touched";
  id v15 = [v5 touched];
  char v16 = sub_426F4(v15);
  v38[1] = v16;
  v37[2] = @"inserted";
  long long v34 = v8;
  char v17 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v38[2] = v17;
  v37[3] = @"corrected";
  char v18 = [v5 target];
  uint64_t v19 = [v18 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v37[4] = @"autocorrectionType";
  v38[3] = v19;
  v38[4] = v12;
  uint64_t v31 = v12;
  uint64_t v20 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
  float v21 = [v30 dictionaryWithDictionary:v20];

  if (*(unsigned char *)(v35 + 48))
  {
    uint64_t v22 = [v5 documentStates];
    [v21 setObject:v22 forKeyedSubscript:@"documentStates"];
  }
  uint64_t v23 = [v5 sourceTransliteration];

  if (v23)
  {
    uint64_t v24 = [v5 sourceTransliteration];
    id v25 = [v24 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    [v21 setObject:v25 forKeyedSubscript:@"intendedTransliteration"];
  }
  if (*(unsigned char *)(v35 + 49))
  {
    id v26 = [v5 predicted];
    unint64_t v27 = sub_42818(v26);
    [v21 setObject:v27 forKeyedSubscript:@"predicted"];
  }
  if (*(unsigned char *)(v35 + 50))
  {
    int v28 = [v5 inlineCompletions];
    id v29 = sub_42818(v28);
    [v21 setObject:v29 forKeyedSubscript:@"inlineCompletions"];
  }
  [*(id *)(v35 + 40) addObject:v21];
}

void sub_432D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_43898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_43C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_43E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_44020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4445C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4457C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_449F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_44A6C(uint64_t a1, double a2, double a3, double a4, long double a5)
{
  double v5 = a5;
  double v6 = a2 / (*(double *)(*(void *)(a1 + 32) + 112) * a3);
  double v7 = 0.0;
  if (v6 > 1.0)
  {
    double v8 = a4 + 1.0;
    double v9 = (1.0 - pow(a5, a4 + 1.0)) / (1.0 - a5);
    double v10 = v5;
    if (v9 > v6)
    {
      double v10 = v5;
      do
        double v10 = v10 * 0.5;
      while ((1.0 - pow(v10, v8)) / (1.0 - v10) > v6);
    }
    if (v9 < v6)
    {
      do
        double v5 = v5 + v5;
      while ((1.0 - pow(v5, v8)) / (1.0 - v5) < v6);
    }
    while (1)
    {
      double v7 = (v10 + v5) * 0.5;
      double v11 = (1.0 - pow(v7, v8)) / (1.0 - v7);
      if (vabdd_f64(v6, v11) <= 0.0001) {
        break;
      }
      if (v11 > v6) {
        double v5 = (v10 + v5) * 0.5;
      }
      else {
        double v10 = (v10 + v5) * 0.5;
      }
    }
  }
  return v7;
}

void sub_44D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_44E28(uint64_t a1, uint64_t a2, double *a3)
{
  double v5 = *a3;
  if (*a3 == 1.0)
  {
    double v6 = (double)sub_10C00(a2);
    unsigned int v7 = sub_10C00(a2);
    double v8 = -log((v6 + (double)v7 * 4294967300.0) * -5.42101086e-20 + 1.0);
  }
  else if (*a3 <= 1.0)
  {
    double v22 = 1.0 - v5;
    do
    {
      while (1)
      {
        double v23 = (double)sub_10C00(a2);
        double v24 = (v23 + (double)sub_10C00(a2) * 4294967300.0) * 5.42101086e-20 + 0.0;
        double v25 = (double)sub_10C00(a2);
        unsigned int v26 = sub_10C00(a2);
        double v27 = -log(1.0 - (v25 + (double)v26 * 4294967300.0) * 5.42101086e-20);
        if (v24 <= v22) {
          break;
        }
        double v28 = log((1.0 - v24) / v5);
        double v8 = pow(v22 - v5 * v28, 1.0 / v5);
        if (v8 <= v27 - v28) {
          return v8 * a3[1];
        }
      }
      double v29 = pow(v24, 1.0 / v5);
    }
    while (v29 > v27);
    double v8 = v29;
  }
  else
  {
    double v10 = v5 + -1.0;
    double v11 = v5 * 3.0 + -0.75;
    while (1)
    {
      do
      {
        double v12 = (double)sub_10C00(a2);
        double v13 = (v12 + (double)sub_10C00(a2) * 4294967300.0) * 5.42101086e-20 + 0.0;
        unsigned int v14 = sub_10C00(a2);
        unsigned int v15 = sub_10C00(a2);
        double v16 = v13 * (1.0 - v13);
      }
      while (v16 == 0.0);
      double v17 = (v13 + -0.5) * sqrt(v11 / v16);
      double v8 = v10 + v17;
      if (v10 + v17 >= 0.0)
      {
        double v18 = ((double)v14 + (double)v15 * 4294967300.0) * 5.42101086e-20 + 0.0;
        double v19 = v18 * (v18 * (v16 * (v16 * (v16 * 64.0))));
        if (v19 <= 1.0 - v17 * (v17 + v17) / v8) {
          break;
        }
        double v20 = log(v19);
        long double v21 = log(v8 / v10);
        if (v20 <= -(v17 - v10 * v21) - (v17 - v10 * v21)) {
          break;
        }
      }
    }
  }
  return v8 * a3[1];
}

double sub_45098(uint64_t a1, uint64_t a2, double *a3)
{
  if (*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)(a1 + 24) = 0;
    double v5 = *(double *)(a1 + 16);
  }
  else
  {
    do
    {
      do
      {
        double v7 = (double)sub_10C00(a2);
        double v8 = (v7 + (double)sub_10C00(a2) * 4294967300.0) * 5.42101086e-20 * 2.0 + -1.0;
        double v9 = (double)sub_10C00(a2);
        double v10 = (v9 + (double)sub_10C00(a2) * 4294967300.0) * 5.42101086e-20 * 2.0 + -1.0;
        double v11 = v10 * v10 + v8 * v8;
      }
      while (v11 > 1.0);
    }
    while (v11 == 0.0);
    double v12 = sqrt(log(v10 * v10 + v8 * v8) * -2.0 / v11);
    *(double *)(a1 + 16) = v10 * v12;
    *(unsigned char *)(a1 + 24) = 1;
    double v5 = v8 * v12;
  }
  return *a3 + v5 * a3[1];
}

uint64_t sub_451B4()
{
  fwrite("Usage: autocorrection_tester [-l language] [-p params_file | -j json_params_file] [-t textfile | -T TTKTestCase_file | -s candidate_sentence_file | -z data_driven_test_file] [-c [threshold]]\n", 0xBFuLL, 1uLL, __stdoutp);
  fwrite("-V\tShow version and exit\n\n", 0x1AuLL, 1uLL, __stdoutp);
  fwrite("-j\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tJSON parameter file. JSON format for config parameters - uses same paramters as -p options:\n\n", 0x5EuLL, 1uLL, __stdoutp);
  fwrite("-p\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tParameter file. This file can specify any of the following values:\n\n", 0x45uLL, 1uLL, __stdoutp);
  fwrite("Config Options with Overrides:\n", 0x1FuLL, 1uLL, __stdoutp);
  fwrite("-d\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tDICT: Directory path to TextInput project containing the unigram data files.\n\n", 0x4FuLL, 1uLL, __stdoutp);
  fwrite("-w\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tWORDS: Path to wordlist file. One word to a line.\n\n", 0x34uLL, 1uLL, __stdoutp);
  fwrite("-t\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tTEXT: Path to text file. Format may be arbitrary text.\n\n", 0x39uLL, 1uLL, __stdoutp);
  fwrite("-T, --testcase", 0xEuLL, 1uLL, __stdoutp);
  fwrite("\tTESTCASE: Path to test case file or directory. Format is TTKTestCase, or a directory with layout files and subdirectory of test cases.\n\n", 0x89uLL, 1uLL, __stdoutp);
  fwrite("-s\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tCANDIDATE_SENTENCES: Candidate sentence file. Each line is input and expected output pair, separated by a '|' character.\n\n", 0x7BuLL, 1uLL, __stdoutp);
  fwrite("-l\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tKEYBOARD_LANGUAGE. If dictionary path is specified, and language is not, the default is all languages.\n\n", 0x69uLL, 1uLL, __stdoutp);
  fwrite("-u\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tTYPOLOGY: Path to touch file. Format is determined by Typology.\n\n", 0x42uLL, 1uLL, __stdoutp);
  fwrite("-z\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tPath to data-drvien test file.\n\n", 0x21uLL, 1uLL, __stdoutp);
  fwrite("-c [threshold]\t", 0xFuLL, 1uLL, __stdoutp);
  fwrite("\tUSE_PARTFILE: Serialize intermediate results to disk to reduce memory usage. \n\t\tPass an optional number to override the default serialization threshold PARTFILE_FLUSH_THRESHOLD (500).\n\n", 0xBAuLL, 1uLL, __stdoutp);
  fwrite("-a\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tADDRESSBOOK: Path to contacts file. Format is comma-separated values with three fields per line - first name, surname, probability.\n\n", 0x86uLL, 1uLL, __stdoutp);
  fwrite("-n\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tNAMEDENTITIES: Path to name entities file. Format is one named entity per line.\n\n", 0x52uLL, 1uLL, __stdoutp);
  fwrite("\tPORTRAIT_NAMEDENTITIES: Path to name entities json file with portrait metadata (sources, algorithms, creation timestamps).\n\n", 0x7DuLL, 1uLL, __stdoutp);
  fwrite("-P personaName\n", 0xFuLL, 1uLL, __stdoutp);
  fwrite("\tPERSONA: Persona to use to morph keyboard input.\n\n", 0x33uLL, 1uLL, __stdoutp);
  fwrite("-W width\t", 9uLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_DYNAMIC_LAYOUT --\n\t\tIf nonzero, use dynamic layout.  Default is 0.\n\n", 0x4AuLL, 1uLL, __stdoutp);
  fwrite("\tKEYBOARD_WIDTH --\n\t\tKeyboard width (iPhone5 portrait = 320).  Default is 320.\n\n", 0x50uLL, 1uLL, __stdoutp);
  fwrite("-O orientation\t", 0xFuLL, 1uLL, __stdoutp);
  fwrite("\tKEYBOARD_ORIENTATION --\n\t\tKeyboard orientation: 'Portrait' or 'Landscape'.  Default is 'Portrait'.\n\n", 0x65uLL, 1uLL, __stdoutp);
  fwrite("-o\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tOUTPATH: Output directory\n\n", 0x1CuLL, 1uLL, __stdoutp);
  fwrite("-i\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tSTART_INDEX: Index of first test case to run. Default is 1 (all test cases).\n\n", 0x4FuLL, 1uLL, __stdoutp);
  fwrite("-N\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tEND_INDEX: Index of last test case to run. Default is NIL (all test cases).\n\n", 0x4EuLL, 1uLL, __stdoutp);
  fwrite("-f\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tPRINT_TYPING_TRANSCRIPT: Print each steps action/keytap and resulting text state to stdout.\n\n", 0x5EuLL, 1uLL, __stdoutp);
  fwrite("-C\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tSHOW_CANDIDATE_BAR: Print the candidate bar before each step to stdout.\n\n", 0x4AuLL, 1uLL, __stdoutp);
  fwrite("-x\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tTRANSLITERATION_SUMMARIES: For transliteration modes, at the end of each test case, print the Latin stdout, the intended native script text, and the actual native script text to stdout.\n\n", 0xBCuLL, 1uLL, __stdoutp);
  fwrite("-b\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tPLAYBACK: Path to playback JSON file in keyboardanalytics testcase format.\n\n", 0x4DuLL, 1uLL, __stdoutp);
  fwrite("Conversation Config Options (provide via -j):\n", 0x2EuLL, 1uLL, __stdoutp);
  fwrite("\tCONVERSATIONS_TEST_FILE: Path to conversations file (json format).\n\n", 0x45uLL, 1uLL, __stdoutp);
  fwrite("\tCONVERSATION_SENDERS_TO_TEST: List of senders to test typing for. Only messages from these senders will generate results in the output. Messages from other senders will only influence adaptation.\n\n", 0xC6uLL, 1uLL, __stdoutp);
  fwrite("\tCONVERSATION_ADAPT_TO_SENT_MESSAGES: Adapt to sent messages in conversations. Requires USES_ADAPTATION set to true.\n\n", 0x76uLL, 1uLL, __stdoutp);
  fwrite("\tCONVERSATION_ADAPT_TO_RECEIVED_MESSAGES: Adapt to received messages in conversations. Requires USES_ADAPTATION set to true.\n\n", 0x7EuLL, 1uLL, __stdoutp);
  fwrite("Rest of Config Options:\n", 0x18uLL, 1uLL, __stdoutp);
  fwrite("\t\tNUM_TRIALS --\n\t\tThe number of independent trials to run.  Default is 1.\n\n", 0x4BuLL, 1uLL, __stdoutp);
  fwrite("\t\tSPACE_HORIZONTAL_ERROR_BIAS --\n\t\tIf 0, use the horizontal space key center for touch error calculation. If 1, distribute the horizontal origin along the width of the space bar (with margins equal to 1/2 key height; If 2, bias the horizontal origin to the right "
    "side of the space bar. If 3, bias the horizontal origin to the left side of the space bar. \x13Default is 1.\n"
    "\n",
    0x172uLL,
    1uLL,
    __stdoutp);
  fwrite("\t\tSPACE_VERTICAL_ERROR_BIAS --\n\t\tA bias to be applied to the space bar touch error calculation to simulate suspected user behavior. Expressed as a fraction of the key height (e.g., .5 would bias to the top of the space bar).\n\n", 0xE2uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SPACE_INSTEAD_OF_BOTTOM_ROW --\n\t\tProbability of half-key height added to a bottom key tap in the spacebar direction. Limited by MAX_SPACE_ERRORS_PER_TEST\n\n", 0xA2uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SPACE_REPLACED_BY_BOTTOM_ROW --\n\t\tProbability of half-key height subtracted from a space bar tap in the direction of the bottom key row. Limited by MAX_SPACE_ERRORS_PER_TEST. Use SPACE_HORIZONTAL_ERROR_BIAS=1 to get realistic substitutions.\n\n", 0xF9uLL, 1uLL, __stdoutp);
  fwrite("\t\tMAX_SPACE_ERRORS_PER_TEST --\n\t\t Max count of cumulative errors using PROB_SPACE_INSTEAD_OF_BOTTOM_ROW and PROB_SPACE_REPLACED_BY_BOTTOM_ROW settings. \n\n", 0x9AuLL, 1uLL, __stdoutp);
  fwrite("\t\tWORD_LEARNING_ENABLED --\n\t\tIf nonzero, the keyboard performs online adaptation to typing.  Default is 0.\n\n", 0x6CuLL, 1uLL, __stdoutp);
  fwrite("\t\tNEGATIVE_LEARNING_ENABLED --\n\t\tIf nonzero, the keyboard performs negative learning in response to rejected autocorrections.  Default is 0.\n\n", 0x8EuLL, 1uLL, __stdoutp);
  fwrite("\t\tUSES_ADAPTATION --\n\t\tReplaces deprecated 'USE_WORD_NGRAM_MODEL_ADAPTATION'. If nonzero, adaptation resources are loaded and used in beam search and to compute probabilities. If 'WORD_LEARNING_ENABLED' switch is on, it implies that 'USES_ADAPTATION' switch is on too. Otherwise, default is 0.\n\n", 0x127uLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_LANGUAGE_MODEL --\n\t\tUse this flag to override UIKeyboardHasWordNgramModel value from InputMode_xx.plist.\n\n", 0x70uLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_WORD_NGRAM_MODEL --\n\t\tDeprecated, see USE_LANGUAGE_MODEL instead.\n\n", 0x49uLL, 1uLL, __stdoutp);
  fwrite("\t\tTOUCAN_LM_MODE --\n\t\tControls to which extent new generation neural lm with open vocabulary is enabled (requires presence of respective LM assets on the system or passed via custom path). If 0, 'Toucan' lm is disabled. If 1, 'Toucan' lm is enabled for completions/predictions. If 2, 'Toucan' lm is enabled for autocorrections.\n\n", 0x149uLL, 1uLL, __stdoutp);
  fwrite("\t\tMAX_WORDS_PER_PREDICTION --\n\t\tMaximum words predidicted when autocorrection lists enabled.  Default is 1.\n\n", 0x6DuLL, 1uLL, __stdoutp);
  fwrite("\t\tMAX_PREDICTIONS_REPORTED --\n\t\tMaximum prediction to report for every key stroke.  Default is 0, in  which case nothing is reported\n\n", 0x86uLL, 1uLL, __stdoutp);
  fwrite("\t\tMAX_INLINE_COMPLETIONS_REPORTED --\n\t\tMaximum inline completions to report for every key stroke.  Default is 0, in  which case nothing is reported\n\n", 0x95uLL, 1uLL, __stdoutp);
  fwrite("\t\tLOG_DOCUMENT_CONTEXT --\n\t\tInclude document context before each input in the output report.  Default is NO.\n\n", 0x6EuLL, 1uLL, __stdoutp);
  fwrite("\t\tKEYSTROKE_SEGMENTATION_MODE --\n\t\tSpecify mode for segmenting keystrokes according to intended tokens: 'none', 'typinglog', 'alignment'. Default is 'typinglog'.\n\n", 0xA3uLL, 1uLL, __stdoutp);
  fwrite("\t\tWARN_IF_SELECTING_POPUP_VARIANT --\n\t\tIf nonzero, warn when typer selects a popup variant (may indicate keyboard layout mis-configuration).  Default is 0.\n\n", 0x9DuLL, 1uLL, __stdoutp);
  fwrite("\t\tSIRI_MODE --\n\t\tIf nonzero, run in SIRI MODE (aka as if invoked from type-to-siri).  Default is 0.\n\n", 0x65uLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_AUTOCORRECTION --\n\t\tIf nonzero, enable autocorrection.  Default is 1.\n\n", 0x4DuLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_RETROCORRECTION --\n\t\tIf nonzero, enable retrocorrection.  Default is 0.\n\n", 0x4FuLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_AUTOCAPITALIZATION --\n\t\tIf nonzero, use autocapitalization.  Default is 1.\n\n", 0x52uLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_PREDICTION --\n\t\tIf nonzero, enabled predictions and completions.  Default is 0.\n\n", 0x57uLL, 1uLL, __stdoutp);
  fwrite("\t\tAUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of USE_PREDICTION.\n\n", 0x44uLL, 1uLL, __stdoutp);
  fwrite("\t\tMAX_PREDICTIONS --\n\t\tMaximum number of predictions displayed in UI.  Default is 3.\n\n", 0x56uLL, 1uLL, __stdoutp);
  fwrite("\t\tMULTILINGUAL_ENABLED --\n\t\tIf nonzero, enable multilingual keyboards.  Default is 0.\n\n", 0x57uLL, 1uLL, __stdoutp);
  fwrite("\t\tKEYBOARD_SECOND_LANGUAGE --\n\t\t.If multilingual enabled, manually configure second langauge, i.e. 'fr_FR', 'de_DE'. Default is None.\n\n", 0x87uLL, 1uLL, __stdoutp);
  fwrite("\t\tBASE_KEY_FOR_VARIANTS --\n\t\tIf nonzero, type base letter if diacritic variant is not available.  Default is 1.\n\n", 0x71uLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_TRANSLITERATION--\n\t\tIf nonzero, typing model user types transliteration and chooses native words from prediction bar. The input is expected in playback or tansliterated formats. Default is 0.\n\n", 0xCBuLL, 1uLL, __stdoutp);
  fwrite("\t\tUSE_PARTIAL_CANDIDATES --\n\t\tIf nonzero, the transliteration model will attempt to select partial candidates if the intended string is not visible. Only valid when transliteration is enabled. Default is 0.\n\n", 0xD0uLL, 1uLL, __stdoutp);
  fwrite("\t\tTEST_SENTENCE_TRANSLITERATION--\n\t\tIf nonzero, the expected input and its transliteration will be combined into a single word with no spaces, so the sentence is just the catentation of its words. Default is 0.\n\n", 0xD4uLL, 1uLL, __stdoutp);
  fwrite("\t\tTRANSLITERATE_WITH_SPACES--\n\t\tSet to 1 when transliterating a language that uses spaces to separate words/syllables (languages other than Chinese/Japanese/Thai).\n\n", 0xA5uLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_CONTINUOUS_PATH--\n\t\tIf nonzero, typing model user prefers to enter text using continuous path.  Default is 0.\n\n", 0x79uLL, 1uLL, __stdoutp);
  fwrite("\t\tCONTINUOUS_PATH_ENABLED--\n\t\tIf YES, enable continuous path playback. Default is YES.", 0x56uLL, 1uLL, __stdoutp);
  fwrite("\t\tCONTINUOUS_PATH_GENERATOR--\n\t\tString representing the preferred path generator. Valid values are \"TYPIST\" or \"SIMPLE\". Used only if PREFERS_CONTINUOUS_PATH is non-zero. If not set, then the default SIMPLE generator is used.\n\n", 0xE3uLL, 1uLL, __stdoutp);
  fwrite("\t\tCONTINUOUS_PATH_APPEND_SPACE--\n\t\tIf nonzero, a space is automatically appended to each continuous path conversion. Otherwise, space is prepended prior to conversion, if necessary. Default is 0.\n\n", 0xC5uLL, 1uLL, __stdoutp);
  fwrite("\t\tCONTINUOUS_PATH_ALGORITHMS--\n\t\tA number describing the bitmask of enabled algorithms for continuous path. Fav=1, ML=2, ShapeMatch=4, StoreShapes=8, ChineseML=16. Default is Favonius only.\n\n", 0xBFuLL, 1uLL, __stdoutp);
  fwrite("\t\tENABLE_CONTINUOUS_PATH_RETROCORRECTION--\n\t\tEnable retrocorrection for continuous path input. Default=YES.\n\n", 0x6DuLL, 1uLL, __stdoutp);
  fwrite("\t\tALPHA--\n\t\tfloat value [0.0, 1.0]. The knot parameterization used in TTKTypistContinuousPathGenerator. Used only if CONTINUOUS_PATH_GENERATOR is \"TYPIST\". If not set, then the default centripetal value (0.5) is used.\n\n", 0xDBuLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_PREDICTION_SELECTION --\n\t\tIf nonzero, typing model user prefers to select candidates from prediction bar UI.  Default is 0.\n\n", 0x87uLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_AUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of PREFERS_PREDICTION_SELECTION.\n\n", 0x5AuLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_SPACEBAR_DOUBLETAP --\n\t\tIf nonzero, typing model prefers spacebar double-tap to end sentence (TODO: Not yet implemented!).  Default is 0.\n\n", 0x95uLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_TO_CORRECT_ERRORS --\n\t\tIf nonzero, typer prefers to correct errors by backspacing or rejecting autocorrections.  Default is YES.\n\n", 0x8CuLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_AUTOCORRECT_WITH_REVISION --\n\t\tIf YES, will prefer to use autocorrection but will revise manually if autocorrection is bad. Equivalent to PREFERS_TO_CORRECT_ERRORS=YES, PROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR=1.0, PROB_REJECT_BAD_AUTOCORRECTION=1 and overrides other values.\n\n", 0x122uLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_AUTOCORRECT_FOR_CAPS --\n\t\tIf nonzero, typer prefers to rely on autocorrect for capitalizing words.  Default is 0.\n\n", 0x7DuLL, 1uLL, __stdoutp);
  fwrite("\t\tPREFERS_AUTOCORRECT_FOR_APOSTROPHES --\n\t\tIf nonzero, typer prefers to rely on autocorrect for inserting word-medial apostrophes.  Default is 0.\n\n", 0x93uLL, 1uLL, __stdoutp);
  fwrite("\t\tAVERAGE_KEY_TAPS_PER_SECOND --\n\t\tThe average number of key taps per second.  Default is 5/sec (~60wpm).\n\n", 0x6BuLL, 1uLL, __stdoutp);
  fwrite("\t\tMAX_PRIOR_SEGMENTS_CHECKED_FOR_ERRORS --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the maximum input segments prior to current segment checked by typist for errors.  Default is 2.\n\n", 0xB1uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_BEGIN_CORRECTING_AFTER_WORD --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct a typo before typing a word terminator.  Default is 0.0.\n\n", 0xABuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct typos after a word terminator.  Default is 0.0.\n\n", 0xADuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_REJECT_BAD_AUTOCORRECTION --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of rejecting a bad autocorrection if the typed string is the intended text.  Default is 0.0\n\n", 0xB5uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_TRANSPOSE_LETTERS --\n\t\tProbability that keystrokes for two letters are transposed.  Default is 0.\n\n", 0x6AuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_TRANSPOSE_LETTER_AND_SPACE --\n\t\tProbability that keystrokes for letter and space are transposed.  Default is 0.\n\n", 0x78uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SKIP_LETTER --\n\t\tProbability that non-word-initial letter is skipped.  Default is 0.\n\n", 0x5DuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SKIP_REPEAT_LETTER --\n\t\tProbability that repeated letter is skipped.  Default is 0.\n\n", 0x5CuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SKIP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is skipped.  Default is 0.\n\n", 0x61uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SKIP_SPACE --\n\t\tProbability that space key is skipped.  Default is 0.\n\n", 0x4EuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_DOUBLE_TAP_LETTER --\n\t\tProbability that non-word-initial letter is doubled.  Default is 0.\n\n", 0x63uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_DOUBLE_TAP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is doubled.  Default is 0.\n\n", 0x67uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SUBSTITUTE_LETTER --\n\t\tProbability that some arbitrary key substitutes for non-word-initial letter.  Default is 0.\n\n", 0x7BuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SUBSTITUTE_INITIAL_LETTER --\n\t\tProbability that some arbitrary key substitutes for word-initial letter.  Default is 0.\n\n", 0x7FuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_SUBSTITUTE_SPACE --\n\t\tProbability that some arbitrary key substitutes for space.  Default is 0.\n\n", 0x68uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_EXTRANEOUS_KEY --\n\t\tProbability that extraneous keystoke is inserted before non-word-initial letter.  Default is 0.\n\n", 0x7CuLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_EXTRANEOUS_INITIAL_KEY --\n\t\tProbability that extraneous keystroke is inserted before a word-initial letter.  Default is 0.\n\n", 0x83uLL, 1uLL, __stdoutp);
  fwrite("\t\tPROB_EXTRANEOUS_FINAL_KEY --\n\t\tProbability that extraneous keystroke is inserted after a word-final letter.  Default is 0.\n\n", 0x7EuLL, 1uLL, __stdoutp);
  fwrite("\t\tDECOMPOSE_INPUT_STRING --\n\t\tIf nonzero, input text is decomposed prior to typing keys.  Default is 0.\n\n", 0x69uLL, 1uLL, __stdoutp);
  fwrite("\t\tERROR_GENERATOR --\n\t\tThe subclass of TIErrorGenerator that produces errors for the touch inputs.  Each class has its own parameters, as follows.\n\n", 0x94uLL, 1uLL, __stdoutp);
  fwrite("\t\t\tCommon parameters --\n", 0x18uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tRNG_SEED_SALT --\n\t\t\t\tA salt for seeding the random number generator seed. Default is 0.\n\n", 0x5DuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tREL_ERROR_NUMBERS_PUNCTATION --\n\t\t\t\tRelative error for typing numbers and punctuation (Default=1)\n\n", 0x67uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tREL_ERROR_CONTROL_KEYS --\n\t\t\t\tRelative error for typing control keys (Default=1)\n\n", 0x56uLL, 1uLL, __stdoutp);
  fwrite("\t\t\tTIRadialErrorGenerator --\n\t\t\tEach touch is offset at a random angle and distance, selected from one of two ranges.\n\n", 0x77uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tDEFAULT_ERROR_RADIAL_MIN_DISTANCE --\n\t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n\n", 0x88uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tDEFAULT_ERROR_RADIAL_MAX_DISTANCE --\n\t\t\t\tThe maximum radial distance around a key centroid to select an error point. Within-keyframe max value is 15.\n\n", 0x9BuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tLETTER_ERROR_COUNT --\n\t\t\t\tThe number of randomly selected characters to add geometry errors.\n\n", 0x62uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tLETTER_ERROR_RADIAL_MIN_DISTANCE --\n\t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n\n", 0x87uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tLETTER_ERROR_RADIAL_MAX_DISTANCE --\n\t\t\t\tThe maximum radial distance around a key centroid to select an error point. Recommended value between 15-25.\n\n", 0x9AuLL, 1uLL, __stdoutp);
  fwrite("\t\t\tTIGaussianErrorGenerator --\n\t\t\t(Default) Each touch is offset using independently generated Gaussian noise.\n\n", 0x70uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tGAUSSIAN_ERROR_STDDEV_X --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the X dimension\n\n", 0x6CuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tGAUSSIAN_ERROR_STDDEV_Y --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the Y dimension\n\n", 0x6CuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tSKEW_STDDEV_X --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the X dimension\n\n", 0x6FuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tSKEW_STDDEV_Y --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the Y dimension\n\n", 0x6FuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tSCALE_ERROR_UNITS_TO_POINTS --\n\t\t\t\tOptional multiplier to use to convert from the standard deviation values to points\n\n", 0x7BuLL, 1uLL, __stdoutp);
  fwrite("\t\tSTEP_COUNT --\n\t\tThe number of steps each variable's sweep range is broken into.\n\n", 0x53uLL, 1uLL, __stdoutp);
  fwrite("\t\tUSER_DIRECTORY --\n\t\tDirectory to store dynamic data like user dictionary and LMs.  KB user dirtectory is the default\n\n", 0x78uLL, 1uLL, __stdoutp);
  fwrite("\t\tCLEAN_USER_DIRECTORY --\n\t\tIf nonzero, USER_DIRECTORY will be recreated upon startup\n\n", 0x57uLL, 1uLL, __stdoutp);
  fwrite("\t\tSAVE_DEBUG_DATA --\n\t\tIf nonzero debug information will be saved with each run\n\n", 0x51uLL, 1uLL, __stdoutp);
  fwrite("\t\tREPORT_AGGD_STATISTICS --\n\t\tCollect Aggd Statistics for each line of input text\n\n", 0x53uLL, 1uLL, __stdoutp);
  fwrite("\t\tTYPOLOGY_OUTPATH --\n\t\tOutput Typology log for each line of input text to this directory\n\n", 0x5BuLL, 1uLL, __stdoutp);
  fwrite("\t\tPATH SIMULATION --\n\t\tContinious Path simulation parameters:\n\n", 0x3FuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tCONTINUOUS_PATH_GENERATOR - 'TYPIST' for generating splines and 'SIMPLE' for generating line segment paths. default 'SIMPLE'\n\n", 0x82uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tFINGER_KEY_WIDTH_MULTIPLE - defines thinkness of a finger in multiple of key widths. This option affects overshoot - user is assumed to move his finger until he sees a frame of the key he intends to reach. Default is 0, settig it 1 will make for half key width overshoot\n\n", 0x114uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tGENERATE_MIDDLE_POINT - If true will make path generator to wonder to deviate from the line segments that connect target points\n\n", 0x85uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tMID_POINT_DEV_KEY_HEIGHT_MULTIPLE - how far a middle point is allowed deviate from line segment in key height multiples. default 2.\n\n", 0x89uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tPATH_BETA_PARAMETER - controls simmetrical beta distribution for choosing middle points. default 4. Reducing it to 1 results in uniform distribution, increasing it makes distribution center heavy.\n\n", 0xCAuLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tPATH_NORMAL_KEY_WIDTH_MULTIPLE - controls how far a user misses intended target. By default it's set to 0. Recommended setting 0.4\n\n", 0x88uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tCPPATHGEN_TIMING_ALGORITHM - controls how points are placed on the path. EQUIDISTANT will spread point equally. ANGULAR attempts to mimic user by slowing on sharp turns and gaining speed on longer segments\n\n", 0xD3uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tCPPATHGEN_ACCELERATION - used for ANGULAR, defaults to 1.6\n\n", 0x40uLL, 1uLL, __stdoutp);
  fwrite("\t\tCUSTOM_STATIC_DICTIONARY_PATH --\n\t\tProvide a path to a custom Unigrams file.\n\n", 0x50uLL, 1uLL, __stdoutp);
  fwrite("\t\tCUSTOM_LANGUAGE_MODEL_PATH --\n\t\tProvide a path to a custom language model bundle. It will be combined with other lm bundles on the system. To override system resources bump 'priority' field in the bundle's info.plist.\n\n", 0xDDuLL, 1uLL, __stdoutp);
  fwrite("\t\tCUSTOM_DYNAMIC_RESOURCE_PATH --\n\t\tProvide a path to a custom language model bundle.\n\n", 0x57uLL, 1uLL, __stdoutp);
  fwrite("\t\t\t\tUSER_PATH_FILE - if given will process and use user paths found in the file\n\n", 0x51uLL, 1uLL, __stdoutp);
  fwrite("\t\tFAVONIUS_LANGUAGE_MODEL_WEIGHT-\n\t\tfloat value [0.0, 1.0]. Weight of language model, used for rescoring candidates. If not set, then the default k_linguistic_context_power value (0.24) is used.\n\n", 0xC4uLL, 1uLL, __stdoutp);
  Class v0 = __stdoutp;

  return fputc(10, v0);
}

id sub_460F0(int a1, char *const *a2)
{
  if (a1 <= 1)
  {
    sub_451B4();
    id v2 = 0;
    goto LABEL_45;
  }
  +[NSMutableDictionary dictionary];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_469CC;
  v29[3] = &unk_8D968;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v30 = v5;
  double v6 = objc_retainBlock(v29);
  id v26 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"ADDRESSBOOK", @"a", @"NAMEDENTITIES", @"n", @"PORTRAIT_NAMEDENTITIES", @"n", @"DICTS", @"d", @"WORDS", @"w", @"TEXT", @"t", @"TESTCASE", @"T", @"TYPOLOGY", @"u", @"CANDIDATE_SENTENCES",
          @"s",
          @"PLAYBACK",
          @"b",
          @"PARAMS",
          @"p",
          @"JSON_CONFIG",
          @"j",
          @"BAD_SENTENCES_FILE_PATH",
          @"B",
          0);
  v31[0] = getopt_long(a1, a2, "Vz:d:w:t:T:r:s:l:o:p:u:c:a:n:j:P:S:W:O:i:N:b:B:fCx", (const option *)&off_ADFC0, 0);
  if (v31[0] == -1)
  {
LABEL_39:
    id v2 = v5;
    goto LABEL_44;
  }
  while (2)
  {
    memset(&v28, 0, sizeof(v28));
    double v7 = +[NSString stringWithCharacters:v31 length:1];
    switch(v31[0])
    {
      case ':':
        if (optopt != 122) {
          goto LABEL_8;
        }
        goto LABEL_31;
      case 'B':
        double v11 = +[NSString stringWithCString:optarg encoding:4];
        double v12 = v5;
        double v13 = v11;
        CFStringRef v14 = @"BAD_SENTENCES_FILE_PATH";
        goto LABEL_25;
      case 'C':
        unsigned int v15 = v5;
        CFStringRef v16 = @"SHOW_CANDIDATE_BAR";
        goto LABEL_32;
      case 'N':
        __endptr = 0;
        int v17 = strtol(optarg, &__endptr, 10);
        if (!*__endptr)
        {
          double v11 = +[NSNumber numberWithUnsignedInteger:v17];
          double v12 = v5;
          double v13 = v11;
          CFStringRef v14 = @"END_INDEX";
LABEL_25:
          [v12 setValue:v13 forKey:v14];

LABEL_38:
          v31[0] = getopt_long(a1, a2, "Vz:d:w:t:T:r:s:l:o:p:u:c:a:n:j:P:S:W:O:i:N:b:B:fCx", (const option *)&off_ADFC0, 0);
          if (v31[0] == -1) {
            goto LABEL_39;
          }
          continue;
        }
        fprintf(__stderrp, "Error: invalid end index: %s\n");
LABEL_43:

        id v2 = 0;
LABEL_44:

LABEL_45:
        return v2;
      case 'O':
        double v11 = +[NSString stringWithCString:optarg encoding:4];
        double v12 = v5;
        double v13 = v11;
        CFStringRef v14 = @"KEYBOARD_ORIENTATION";
        goto LABEL_25;
      case 'P':
        if (optarg)
        {
          double v18 = +[NSString stringWithCString:optarg encoding:4];
        }
        else
        {
          double v18 = 0;
        }
        double v24 = sub_2F09C(v18);

        if (!v24)
        {
          fprintf(__stderrp, "Error: persona does not exist: %s\n");
          goto LABEL_51;
        }
        long double v21 = v5;
        double v22 = v18;
        CFStringRef v23 = @"PERSONA";
        goto LABEL_36;
      case 'S':
        double v11 = +[NSString stringWithCString:optarg encoding:4];
        double v12 = v5;
        double v13 = v11;
        CFStringRef v14 = @"SENTENCE";
        goto LABEL_25;
      case 'T':
      case 'a':
      case 'b':
      case 'd':
      case 'j':
      case 'n':
      case 'p':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'w':
        double v8 = optarg;
        double v9 = [v26 objectForKey:v7];
        LOBYTE(v8) = ((uint64_t (*)(void *, char *, void *))v6[2])(v6, v8, v9);

        if ((v8 & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_38;
      case 'V':
        puts((const char *)[@"1.14" UTF8String]);
        exit(0);
      case 'W':
        double v11 = +[NSString stringWithCString:optarg encoding:4];
        double v12 = v5;
        double v13 = v11;
        CFStringRef v14 = @"KEYBOARD_WIDTH";
        goto LABEL_25;
      case 'c':
        double v18 = +[NSString stringWithCString:optarg encoding:4];
        [v5 setValue:&__kCFBooleanTrue forKey:@"USE_PARTFILE"];
        if (!v18) {
          goto LABEL_38;
        }
        double v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v18 integerValue]);
        [v5 setValue:v19 forKey:@"PARTFILE_FLUSH_THRESHOLD"];

        goto LABEL_37;
      case 'f':
        unsigned int v15 = v5;
        CFStringRef v16 = @"PRINT_TYPING_TRANSCRIPT";
        goto LABEL_32;
      case 'i':
LABEL_8:
        __endptr = 0;
        int v10 = strtol(optarg, &__endptr, 10);
        if (*__endptr)
        {
          fprintf(__stderrp, "Error: invalid start index: %s\n");
          goto LABEL_43;
        }
        double v11 = +[NSNumber numberWithUnsignedInteger:v10];
        double v12 = v5;
        double v13 = v11;
        CFStringRef v14 = @"START_INDEX";
        goto LABEL_25;
      case 'l':
        uint64_t v20 = +[NSString stringWithCString:optarg encoding:4];
        if (!v20) {
          goto LABEL_38;
        }
        double v18 = (void *)v20;
        long double v21 = v5;
        double v22 = v18;
        CFStringRef v23 = @"KEYBOARD_LANGUAGE";
        goto LABEL_36;
      case 'o':
        double v11 = +[NSString stringWithCString:optarg encoding:4];
        double v12 = v5;
        double v13 = v11;
        CFStringRef v14 = @"OUTPATH";
        goto LABEL_25;
      case 'x':
        unsigned int v15 = v5;
        CFStringRef v16 = @"TRANSLITERATION_SUMMARIES";
        goto LABEL_32;
      case 'z':
        if (optarg)
        {
          double v18 = +[NSString stringWithCString:optarg encoding:4];
          [v5 setValue:&__kCFBooleanTrue forKey:@"RUN_DSL_TEST"];
          if (v18)
          {
            if (stat(optarg, &v28))
            {
              fprintf(__stderrp, "Error: data driven test file does not exist: %s\n");
LABEL_51:
              exit(1);
            }
            fprintf(__stderrp, "data driven test file path: %s\n", optarg);
            long double v21 = v5;
            double v22 = v18;
            CFStringRef v23 = @"DSL_TEST_FILE";
LABEL_36:
            [v21 setValue:v22 forKey:v23];
LABEL_37:
          }
        }
        else
        {
LABEL_31:
          unsigned int v15 = v5;
          CFStringRef v16 = @"RUN_DSL_TEST";
LABEL_32:
          [v15 setValue:&__kCFBooleanTrue forKey:v16];
        }
        goto LABEL_38;
      default:
        fwrite("Error: invalid paramter.\n", 0x19uLL, 1uLL, __stderrp);
        goto LABEL_43;
    }
  }
}

BOOL sub_469CC(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  memset(&v12, 0, sizeof(v12));
  double v6 = +[NSString stringWithCString:a2 encoding:4];
  int v7 = stat(a2, &v12);
  double v8 = __stderrp;
  id v9 = v5;
  int v10 = (const char *)[v9 cStringUsingEncoding:4];
  if (v7)
  {
    fprintf(v8, "Error: %s path does not exist: %s\n", v10, a2);
  }
  else
  {
    fprintf(v8, "%s path: %s\n", v10, a2);
    [*(id *)(a1 + 32) setValue:v6 forKey:v9];
  }

  return v7 == 0;
}

id sub_46AC8(void *a1)
{
  id v1 = a1;
  id v29 = +[NSMutableDictionary dictionary];
  if (v1)
  {
    id v2 = +[NSData dataWithContentsOfFile:v1];
    if (v2)
    {
      id v3 = [objc_alloc((Class)NSString) initWithData:v2 encoding:4];
      if (v3)
      {
        double v27 = v2;
        id v28 = v1;
        id v26 = v3;
        [v3 componentsSeparatedByString:@"\n"];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v4)
        {
          id v5 = v4;
          CFStringRef v6 = @"#";
          uint64_t v7 = *(void *)v34;
          double v8 = &CFAbsoluteTimeGetCurrent_ptr;
          uint64_t v30 = *(void *)v34;
          do
          {
            id v9 = 0;
            id v31 = v5;
            do
            {
              if (*(void *)v34 != v7) {
                objc_enumerationMutation(obj);
              }
              id v10 = *(id *)(*((void *)&v33 + 1) + 8 * (void)v9);
              id v11 = [v10 rangeOfString:v6];
              if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v12 = [v10 substringToIndex:v11];

                id v10 = (id)v12;
              }
              double v13 = [v8[278] whitespaceCharacterSet];
              CFStringRef v14 = [v10 stringByTrimmingCharactersInSet:v13];

              if (([v14 isEqualToString:&stru_8DEF0] & 1) == 0)
              {
                CFStringRef v15 = v6;
                CFStringRef v16 = [v14 componentsSeparatedByString:@"="];
                int v17 = [v16 objectAtIndex:0];
                double v18 = [v16 objectAtIndex:1];
                [v8[278] whitespaceCharacterSet];
                uint64_t v20 = v19 = v8;
                long double v21 = [v17 stringByTrimmingCharactersInSet:v20];

                double v22 = [v19[278] whitespaceCharacterSet];
                CFStringRef v23 = [v18 stringByTrimmingCharactersInSet:v22];

                if (v21)
                {
                  if (v23) {
                    CFStringRef v24 = v23;
                  }
                  else {
                    CFStringRef v24 = @"0";
                  }
                  [v29 setObject:v24 forKey:v21];
                }

                CFStringRef v6 = v15;
                double v8 = v19;
                uint64_t v7 = v30;
                id v5 = v31;
              }

              id v9 = (char *)v9 + 1;
            }
            while (v5 != v9);
            id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v5);
        }

        id v2 = v27;
        id v1 = v28;
      }
    }
  }

  return v29;
}

id sub_46DCC(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKey:@"PARAMS"];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = sub_46AC8(v2);
LABEL_3:
    id v5 = (id)v4;
    goto LABEL_7;
  }
  id v3 = [v1 objectForKey:@"JSON_CONFIG"];
  if (!v3)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    goto LABEL_3;
  }
  CFStringRef v6 = +[NSData dataWithContentsOfFile:v3];
  id v40 = 0;
  uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:4 error:&v40];
  id v8 = v40;
  if (!v7)
  {
    id v29 = __stderrp;
    uint64_t v30 = (const char *)[v3 cStringUsingEncoding:4];
    id v31 = [v8 localizedDescription];
    fprintf(v29, "Error: Unable to parse JSON config file '%s': %s\n\n", v30, (const char *)[v31 cStringUsingEncoding:4]);

LABEL_37:
    exit(1);
  }
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v7 copyItems:1];

LABEL_7:
  [v5 setObject:v1 forKey:@"COMMAND_LINE_ARGS"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = [&off_94548 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(&off_94548);
        }
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        CFStringRef v14 = [v1 valueForKey:v13];
        if (v14) {
          [v5 setValue:v14 forKey:v13];
        }
      }
      id v10 = [&off_94548 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v10);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = [&off_94560 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v15)
  {
LABEL_24:
    uint64_t v20 = __stderrp;
    long double v21 = "Error: You must provide a source of test input!\n\n";
    size_t v22 = 49;
LABEL_36:
    fwrite(v21, v22, 1uLL, v20);
    sub_451B4();
    goto LABEL_37;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v33;
LABEL_18:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v33 != v17) {
      objc_enumerationMutation(&off_94560);
    }
    double v19 = [v5 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * v18)];

    if (v19) {
      break;
    }
    if (v16 == (id)++v18)
    {
      id v16 = [&off_94560 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_18;
    }
  }
  CFStringRef v23 = [v5 objectForKey:@"DICT"];
  if (v23)
  {
  }
  else
  {
    CFStringRef v24 = [v5 objectForKey:@"KEYBOARD_LANGUAGE"];

    if (!v24)
    {
      uint64_t v20 = __stderrp;
      long double v21 = "Error: You must provide an input language.";
      size_t v22 = 42;
      goto LABEL_36;
    }
  }
  uint64_t v25 = [v1 objectForKey:@"PARAMS"];
  if (v25)
  {
    id v26 = (void *)v25;
    double v27 = [v1 objectForKey:@"JSON_CONFIG"];

    if (v27)
    {
      uint64_t v20 = __stderrp;
      long double v21 = "Error: Use only Text or JSON parameter file but not both.";
      size_t v22 = 57;
      goto LABEL_36;
    }
  }

  return v5;
}

id sub_471D0(uint64_t a1)
{
  id v17 = 0;
  id v1 = +[NSString stringWithContentsOfFile:a1 encoding:4 error:&v17];
  id v2 = v17;
  if (v1)
  {
    id v3 = [v1 componentsSeparatedByString:@"\n"];
    uint64_t v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isEqualToString:", &stru_8DEF0, (void)v13) & 1) == 0)
          {
            uint64_t v11 = +[AutocorrectionTest testWithInput:v10];
            [v4 addObject:v11];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id sub_47398(uint64_t a1)
{
  id v33 = 0;
  id v1 = +[NSString stringWithContentsOfFile:a1 encoding:4 error:&v33];
  id v2 = v33;
  id v3 = v2;
  if (v1)
  {
    id v24 = v2;
    uint64_t v25 = v1;
    uint64_t v4 = [v1 componentsSeparatedByString:@"\n"];
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v6) {
      goto LABEL_16;
    }
    id v7 = v6;
    CFStringRef v8 = &stru_8DEF0;
    uint64_t v9 = *(void *)v30;
    CFStringRef v10 = @"|";
    uint64_t v11 = &CFAbsoluteTimeGetCurrent_ptr;
    uint64_t v26 = *(void *)v30;
    while (1)
    {
      uint64_t v12 = 0;
      id v27 = v7;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
        if (([v13 isEqualToString:v8] & 1) == 0)
        {
          long long v14 = [v11[278] characterSetWithCharactersInString:v10];
          long long v15 = [v13 componentsSeparatedByCharactersInSet:v14];

          if ([v15 count] == (char *)&def_3B118 + 2)
          {
            [v15 objectAtIndex:0];
            CFStringRef v16 = v8;
            id v17 = v5;
            v19 = CFStringRef v18 = v10;
            [v15 objectAtIndex:1];
            v21 = uint64_t v20 = v11;
            size_t v22 = +[AutocorrectionTest testWithInput:v19 expectedOutput:v21];

            uint64_t v11 = v20;
            CFStringRef v10 = v18;
            id v5 = v17;
            CFStringRef v8 = v16;
            uint64_t v9 = v26;
            id v7 = v27;
            goto LABEL_12;
          }
          if ([v15 count] == (char *)&def_3B118 + 1)
          {
            size_t v22 = +[AutocorrectionTest testWithInput:@"\n" expectedOutput:&off_94578];
LABEL_12:
            [v28 addObject:v22];
          }
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v7 != v12);
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v7)
      {
LABEL_16:

        id v3 = v24;
        id v1 = v25;
        goto LABEL_18;
      }
    }
  }
  id v28 = 0;
LABEL_18:

  return v28;
}

__CFString *sub_47650(int a1)
{
  if ((a1 - 1) > 9) {
    return 0;
  }
  else {
    return off_8DA20[a1 - 1];
  }
}

id sub_47674(void *a1, void *a2)
{
  id v3 = a1;
  id v17 = a2;
  uint64_t v4 = UIKeyboardInputModeGetComponentsFromIdentifier();
  id v5 = UIKeyboardInputModeGetNormalizedLevelsFromComponents();

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    CFStringRef v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = +[NSString stringWithFormat:@"Unigrams-%@.words", *(void *)(*((void *)&v19 + 1) + 8 * i)];
        uint64_t v12 = [v3 stringByAppendingPathComponent:v11];
        long long v13 = +[NSFileManager defaultManager];
        unsigned int v14 = [v13 fileExistsAtPath:v12];

        if (v14)
        {
          id v15 = v12;

          CFStringRef v8 = v15;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    CFStringRef v8 = 0;
  }

  return v8;
}

id sub_47844(void *a1, void *a2)
{
  id v2 = sub_47674(a1, a2);
  if (v2)
  {
    id v3 = +[NSMutableArray array];
    id v21 = 0;
    CFStringRef v18 = v2;
    uint64_t v4 = +[NSString stringWithContentsOfFile:v2 encoding:4 error:&v21];
    id v16 = v21;
    id v17 = (void *)v4;
    id v5 = +[NSScanner scannerWithString:v4];
    if (([v5 isAtEnd] & 1) == 0)
    {
      do
      {
        id v20 = 0;
        [v5 scanUpToString:@" : " intoString:&v20];
        id v6 = v20;
        id v19 = 0;
        [v5 scanUpToString:@"\n" intoString:&v19];
        id v7 = v19;
        id v8 = v6;
        uint64_t v9 = [v7 rangeOfString:@"s="];
        uint64_t v11 = v8;
        if (v9 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v11 = objc_msgSend(v7, "substringWithRange:", v9 + 2, (unsigned char *)objc_msgSend(v7, "length") - &v9[v10]);
        }
        long long v22 = v11;
        uint64_t v12 = +[NSArray arrayWithObjects:&v22 count:1];
        long long v13 = +[AutocorrectionTest testWithInput:v8 expectedOutput:v12];

        [v3 addObject:v13];
      }
      while (![v5 isAtEnd]);
    }

    unsigned int v14 = v17;
    id v2 = v18;
  }
  else
  {
    id v3 = 0;
    unsigned int v14 = 0;
  }

  return v3;
}

id sub_47A78(uint64_t a1, uint64_t a2)
{
  id v2 = +[NSString stringWithContentsOfFile:a1 encoding:4 error:a2];
  if (v2)
  {
    +[NSMutableArray array];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_47B54;
    v5[3] = &unk_8D990;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v3;
    [v2 enumerateLinesUsingBlock:v5];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_47B54(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v13 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([v13 length])
  {
    id v5 = [v13 componentsSeparatedByString:@"\t"];
    id v6 = objc_alloc_init((Class)NSNumberFormatter);
    [v6 setNumberStyle:1];
    if ((unint64_t)[v5 count] < 2)
    {
      id v8 = 0;
    }
    else
    {
      id v7 = [v5 objectAtIndexedSubscript:0];
      id v8 = [v6 numberFromString:v7];

      if (v8)
      {
        uint64_t v9 = objc_msgSend(v5, "subarrayWithRange:", 1, (char *)objc_msgSend(v5, "count") - 1);
        uint64_t v10 = [v9 componentsJoinedByString:@"\t"];

        id v11 = (id)v10;
LABEL_7:
        id v13 = v11;
        uint64_t v12 = +[AutocorrectionTest testWithInput:v11 andCorpusId:v8];
        [*(id *)(a1 + 32) addObject:v12];

        goto LABEL_8;
      }
    }
    id v11 = v13;
    goto LABEL_7;
  }
LABEL_8:
}

id sub_47CE4(uint64_t a1)
{
  id v7 = 0;
  id v1 = +[NSString stringWithContentsOfFile:a1 encoding:4 error:&v7];
  id v2 = v7;
  +[NSMutableArray array];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_47DD0;
  v5[3] = &unk_8D990;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  [v1 enumerateLinesUsingBlock:v5];

  return v3;
}

void sub_47DD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([v5 length]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

id sub_47E68(void *a1)
{
  id v1 = a1;
  id v2 = +[NSData dataWithContentsOfFile:v1];
  id v10 = 0;
  id v3 = +[NSJSONSerialization JSONObjectWithData:v2 options:4 error:&v10];
  id v4 = v10;
  if (!v3)
  {
    id v7 = __stderrp;
    id v8 = (const char *)[v1 cStringUsingEncoding:4];
    id v9 = [v4 localizedDescription];
    fprintf(v7, "Error: Unable to parse JSON config file '%s': %s\n\n", v8, (const char *)[v9 cStringUsingEncoding:4]);

    exit(1);
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = +[_ICPortraitUtilities filteredNamedEntitiesFromJSONDonations:v3];
  }
  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

id sub_47FA8(uint64_t a1)
{
  id v7 = 0;
  id v1 = +[NSString stringWithContentsOfFile:a1 encoding:4 error:&v7];
  id v2 = v7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_48098;
  v5[3] = &unk_8D990;
  id v3 = [objc_alloc((Class)TIContactCollection) initWithRelevanceScoreType:1];
  id v6 = v3;
  [v1 enumerateLinesUsingBlock:v5];

  return v3;
}

void sub_48098(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v11 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([v11 length])
  {
    id v5 = [v11 componentsSeparatedByString:@","];
    id v6 = objc_alloc_init((Class)TIContact);
    id v7 = [v5 objectAtIndex:0];
    [v6 setGivenName:v7];

    id v8 = [v5 objectAtIndex:1];
    [v6 setFamilyName:v8];

    id v9 = [v5 objectAtIndex:2];
    [v9 doubleValue];
    *(float *)&double v10 = v10;
    [v6 setRelevancyScore:v10];

    [v6 setHasRelevancyScore:1];
    [*(id *)(a1 + 32) addContact:v6];
  }
}

id sub_481DC(uint64_t a1)
{
  id v7 = 0;
  id v1 = +[NSString stringWithContentsOfFile:a1 encoding:4 error:&v7];
  id v2 = v7;
  +[NSMutableArray array];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_482C8;
  v5[3] = &unk_8D990;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  [v1 enumerateLinesUsingBlock:v5];

  return v3;
}

void sub_482C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v11 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([v11 length])
  {
    id v5 = [v11 componentsSeparatedByString:@","];
    id v6 = objc_alloc_init(TIMockContact);
    id v7 = [v5 objectAtIndex:0];
    [(TIMockContact *)v6 setFirstName:v7];

    id v8 = [v5 objectAtIndex:1];
    [(TIMockContact *)v6 setLastName:v8];

    id v9 = [v5 objectAtIndex:2];
    [v9 doubleValue];
    *(float *)&double v10 = v10;
    [(TIMockContact *)v6 setRelevancyScore:v10];

    [*(id *)(a1 + 32) addObject:v6];
  }
}

id sub_48400(uint64_t a1)
{
  id v1 = +[NSDictionary dictionaryWithContentsOfFile:a1];
  uint64_t v2 = +[NSMutableArray array];
  uint64_t v3 = +[NSMutableArray array];
  id v4 = (void *)v3;
  id v30 = (id)v2;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = +[NSMutableString stringWithCapacity:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v7 = v1;
    id v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      id v9 = v8;
      long long v29 = v1;
      double v10 = 0;
      uint64_t v31 = *(void *)v33;
      do
      {
        id v11 = 0;
        uint64_t v12 = v10;
        do
        {
          if (*(void *)v33 != v31) {
            objc_enumerationMutation(v7);
          }
          double v10 = [v7 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * (void)v11)];

          id v13 = [v10 objectForKey:@"TouchKey"];
          if ([v13 isEqual:@" "])
          {
            id v14 = [v4 copy];
            id v15 = [v6 copy];
            id v16 = +[AutocorrectionTest testWithTouches:v14 expectedOutput:v15];

            [v30 addObject:v16];
            [v6 setString:&stru_8DEF0];
            [v4 removeAllObjects];
          }
          else
          {
            [v6 appendString:v13];
            id v17 = [v10 valueForKeyPath:@"TouchPoint.X"];
            [v17 floatValue];
            double v19 = v18;
            [v10 valueForKeyPath:@"TouchPoint.Y"];
            id v20 = v7;
            id v21 = v9;
            long long v22 = v6;
            v24 = CFStringRef v23 = v4;
            [v24 floatValue];
            id v16 = +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", v19, v25);

            id v4 = v23;
            id v6 = v22;
            id v9 = v21;
            id v7 = v20;

            [v4 addObject:v16];
          }

          id v11 = (char *)v11 + 1;
          uint64_t v12 = v10;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);

      id v1 = v29;
    }

    if ([v4 count])
    {
      long long v36 = v6;
      uint64_t v26 = +[NSArray arrayWithObjects:&v36 count:1];
      id v27 = +[AutocorrectionTest testWithTouches:v4 expectedOutput:v26];

      [v30 addObject:v27];
    }
  }

  return v30;
}

id sub_48748()
{
  if (qword_AE490 != -1) {
    dispatch_once(&qword_AE490, &stru_8D9B0);
  }
  Class v0 = (void *)qword_AE488;

  return v0;
}

void sub_4879C(id a1)
{
  id v1 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"ja_JP-50On", @"ja_JP", @"zh_Hant-HWR", @"zh_Hans-HWR", @"zh_CN", @"zh_Hant-Cangjie", @"zh_Hans-Wubihua", @"zh_Hant-Wubihua", @"zh_TW", 0);
  id v2 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v3 = (void *)qword_AE488;
  qword_AE488 = (uint64_t)v2;

  id v4 = +[TIInputModeController sharedInputModeController];
  BOOL v5 = [v4 supportedInputModeIdentifiers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_488E4;
  void v7[3] = &unk_8D9D8;
  id v8 = v1;
  id v6 = v1;
  [v5 enumerateObjectsUsingBlock:v7];
}

void sub_488E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [(id)qword_AE488 addObject:v3];
  }
}

id sub_48948()
{
  Class v0 = UIKeyboardInputModeGetComponentsFromIdentifier();
  id v1 = UIKeyboardInputModeGetNormalizedLevelsFromComponents();

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = v1;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v7 = sub_48748();
        LOBYTE(v6) = objc_msgSend(v7, "containsObject:", v6, (void)v9);

        if (v6)
        {
          id v3 = &def_3B118 + 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

void sub_4A488(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = +[AutocorrectionTest testWithInput:v8];
    [v6 addObject:v7];
  }
  else
  {
    NSLog(@"Error: Unable to parse inputTextSamples");
    *a4 = 1;
  }
}

void sub_4ABB4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  id v10 = +[TIReporter fileURLForTrial:a3 withOptions:v4];
  TITestTyperWritePropertyListToFile(v5, v10);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"KeystrokeSavingsRatio"];
  [v6 floatValue];

  id v7 = [v5 objectForKeyedSubscript:@"WordAccuracy"];

  [v7 floatValue];
  float v9 = 1.0 - v8;

  fprintf(__stderrp, "KSR:\t %.3f\n", v9);
  fprintf(__stderrp, "Error Rate: %.2f%%\n", (float)(v9 * 100.0));
}

id TITestTyperTokensForString(void *a1, void *a2)
{
  id v3 = a1;
  CFLocaleRef v4 = a2;
  id v5 = +[NSMutableArray array];
  if ([(__CFString *)v3 length])
  {
    v21.length = (CFIndex)[(__CFString *)v3 length];
    v21.location = 0;
    uint64_t v6 = CFStringTokenizerCreate(kCFAllocatorDefault, v3, v21, 4uLL, v4);
    unint64_t v7 = 0;
    while (CFStringTokenizerAdvanceToNextToken(v6))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      while (v7 < CurrentTokenRange.location)
      {
        id v9 = [(__CFString *)v3 rangeOfComposedCharacterSequenceAtIndex:v7];
        id v11 = v9;
        if ((unint64_t)v9 + v10 <= CurrentTokenRange.location) {
          CFIndex v12 = v10;
        }
        else {
          CFIndex v12 = CurrentTokenRange.location - (void)v9;
        }
        id v13 = -[__CFString substringWithRange:](v3, "substringWithRange:", v9, v12);
        [v5 addObject:v13];
        unint64_t v7 = (unint64_t)v11 + v12;
      }
      id v14 = -[__CFString substringWithRange:](v3, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      [v5 addObject:v14];
      unint64_t v7 = CurrentTokenRange.location + CurrentTokenRange.length;
    }
    while (v7 < (unint64_t)[(__CFString *)v3 length])
    {
      id v15 = [(__CFString *)v3 rangeOfComposedCharacterSequenceAtIndex:v7];
      uint64_t v17 = v16;
      float v18 = -[__CFString substringWithRange:](v3, "substringWithRange:", v15, v16);
      [v5 addObject:v18];
      unint64_t v7 = (unint64_t)v15 + v17;
    }
    CFRelease(v6);
  }

  return v5;
}

uint64_t TITestTyperWritePropertyListToFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 URLByDeletingLastPathComponent];
  uint64_t v6 = +[NSFileManager defaultManager];
  id v22 = 0;
  unsigned int v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v8 = v22;

  if (!v7) {
    goto LABEL_9;
  }
  id v9 = +[NSFileManager defaultManager];
  CFIndex v10 = [v4 path];
  id v11 = +[NSData data];
  NSFileAttributeKey v23 = NSFileProtectionKey;
  NSFileProtectionType v24 = NSFileProtectionNone;
  CFIndex v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  unsigned int v13 = [v9 createFileAtPath:v10 contents:v11 attributes:v12];

  if (!v13) {
    goto LABEL_9;
  }
  id v14 = +[NSOutputStream outputStreamWithURL:v4 append:1];
  [v14 open];
  uint64_t v15 = [v14 streamError];

  if (v15)
  {
    BOOL v16 = 0;
    id v8 = (id)v15;
  }
  else
  {
    id v21 = 0;
    NSInteger v17 = +[NSJSONSerialization writeJSONObject:v3 toStream:v14 options:0 error:&v21];
    id v8 = v21;
    BOOL v16 = v17 != 0;
  }
  [v14 close];

  if (v16 && !v8)
  {
    uint64_t v18 = 1;
  }
  else
  {
LABEL_9:
    double v19 = [v4 path];
    NSLog(@"Error serializing and writing property list %@, error: %@", v19, v8);

    uint64_t v18 = 0;
  }

  return v18;
}

void sub_4E40C(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");

  if (!v3)
  {
    [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKey:v4];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

id sub_5023C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) learnWordContextIndex];
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v2];
  unint64_t v4 = v2 + 1;
  if ((unint64_t)[*(id *)(a1 + 40) count] <= v4) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = v4;
  }
  [*(id *)(a1 + 32) setLearnWordContextIndex:v5];

  return v3;
}

void sub_52070()
{
}

void sub_52254()
{
}

void sub_52378()
{
}

void sub_524A8()
{
}

void sub_525E0()
{
}

void sub_526FC()
{
}

void sub_52930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  sub_55214((uint64_t)&a26, a27);
  sub_55214((uint64_t)&a31, a32);
  sub_55214(v32 - 120, *(void **)(v32 - 112));
  _Unwind_Resume(a1);
}

void sub_52B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  sub_55214(v12 + 16, a12);
  _Unwind_Resume(a1);
}

void sub_52CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5340C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56,void *a57,void *a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose((const void *)(v73 - 184), 8);

  _Unwind_Resume(a1);
}

void sub_53600()
{
}

void sub_53608()
{
}

void sub_53614()
{
  JUMPOUT(0x535F0);
}

void sub_53624()
{
}

__n128 sub_53630(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_53640(void *a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  unint64_t v5 = objc_alloc_init(TITestUserPersonaKeyInfo);
  [v16 frame];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double MidX = CGRectGetMidX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  -[TITestUserPersonaKeyInfo setCenter:](v5, "setCenter:", MidX, CGRectGetMidY(v19));
  id v11 = (void *)a1[4];
  uint64_t v12 = [v16 name];
  [v11 setObject:v5 forKey:v12];

  unsigned int v13 = (void *)a1[5];
  id v14 = [v16 name];
  [v13 setObject:v16 forKey:v14];

  uint64_t v15 = *(void *)(a1[6] + 8);
  if (a3)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    *(CGRect *)(*(void *)(a1[6] + 8) + 48) = CGRectUnion(*(CGRect *)(v15 + 48), v20);
  }
  else
  {
    *(CGFloat *)(v15 + 48) = x;
    *(CGFloat *)(v15 + 56) = y;
    *(CGFloat *)(v15 + 64) = width;
    *(CGFloat *)(v15 + 72) = height;
  }
}

void sub_5379C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_537D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
  return result;
}

void sub_537E0(uint64_t a1)
{
}

void sub_537E8(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = [*(id *)(a1 + 32) name];
  unsigned int v9 = [v8 containsString:v10];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_53890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_538B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"OTHERS"])
  {
    fwrite("Invalid key group 'OTHERS' -- keys remaining after grouping is complete will automatically go into the 'OTHERS' group\n", 0x76uLL, 1uLL, __stderrp);
    abort();
  }
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = [v6 objectForKey:@"AREA"];

  if (v8)
  {
    unsigned int v9 = [v6 objectForKey:@"AREA"];
    id v10 = [v9 objectForKey:@"RECT"];
    id v11 = [v9 objectForKey:@"OVAL"];
    uint64_t v12 = [v9 objectForKey:@"REFKEYRECT"];
    if (!v12)
    {
      fprintf(__stderrp, "Missing REFKEYRECT in area key group '%s'\n", (const char *)[v5 UTF8String]);
      abort();
    }
    if (v10 && v11)
    {
      v58 = __stderrp;
      [v5 UTF8String];
      fprintf(v58, "Invalid area key group '%s' - both RECT and OVAL specified.\n");
    }
    else
    {
      if (v10)
      {
        unsigned int v13 = [v10 objectForKey:@"TOPPCT"];
        [v13 doubleValue];
        double v15 = v14;

        id v16 = [v10 objectForKey:@"LEFTPCT"];
        [v16 doubleValue];
        double v18 = v17;

        CGRect v19 = [v10 objectForKey:@"HEIGHTPCT"];
        [v19 doubleValue];
        double v21 = v20;

        id v22 = [v10 objectForKey:@"WIDTHPCT"];
        [v22 doubleValue];
        double v24 = v23 / 100.0;

        float v25 = *(double **)(*(void *)(a1 + 64) + 8);
        double v26 = v25[8];
        double v27 = v25[9];
        double v28 = v25[6] + v26 * (v18 / 100.0);
        double v29 = v25[7] + v27 * (v15 / 100.0);
        double v30 = v24 * v26;
        double v31 = v21 / 100.0 * v27;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_53FA0;
        v77[3] = &unk_8DB50;
        double v59 = v28;
        double v80 = v28;
        double v81 = v29;
        double v82 = v30;
        double v83 = v31;
        uint64_t v32 = *(void **)(a1 + 32);
        id v78 = *(id *)(a1 + 40);
        id v33 = v7;
        id v79 = v33;
        [v32 enumerateKeysAndObjectsUsingBlock:v77];

        long long v34 = [v12 objectForKey:@"TOPPCT"];
        [v34 doubleValue];
        double v36 = v35;

        long long v37 = [v12 objectForKey:@"LEFTPCT"];
        [v37 doubleValue];
        double v39 = v38;

        id v40 = [v12 objectForKey:@"HEIGHTPCT"];
        [v40 doubleValue];
        double v42 = v41;

        long long v43 = [v12 objectForKey:@"WIDTHPCT"];
        [v43 doubleValue];
        double v44 = v36 / 100.0;
        double v45 = v42 / 100.0;
        double v47 = v46 / 100.0;

        CGFloat v48 = v59 + v30 * (v39 / 100.0);
        CGFloat v49 = v29 + v31 * v44;
        CGFloat v50 = v30 * v47;
        CGFloat v51 = v31 * v45;
        v84.origin.CGFloat x = v48;
        v84.origin.CGFloat y = v49;
        v84.size.CGFloat width = v50;
        v84.size.CGFloat height = v51;
        CGFloat MidX = CGRectGetMidX(v84);
        v85.origin.CGFloat x = v48;
        v85.origin.CGFloat y = v49;
        v85.size.CGFloat width = v50;
        v85.size.CGFloat height = v51;
        CGFloat MidY = CGRectGetMidY(v85);
        v76[0] = 0;
        v76[1] = v76;
        v76[2] = 0x2020000000;
        v76[3] = 0x7FF0000000000000;
        uint64_t v70 = 0;
        v71 = &v70;
        uint64_t v72 = 0x3032000000;
        uint64_t v73 = sub_537D0;
        v74 = sub_537E0;
        id v75 = 0;
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_54070;
        v60[3] = &unk_8DB78;
        id v54 = *(id *)(a1 + 32);
        CGFloat v64 = v48;
        CGFloat v65 = v49;
        CGFloat v66 = v50;
        CGFloat v67 = v51;
        CGFloat v68 = MidX;
        CGFloat v69 = MidY;
        id v61 = v54;
        v62 = v76;
        v63 = &v70;
        [v33 enumerateObjectsUsingBlock:v60];
        uint64_t v55 = v71[5];
        if (!v55)
        {
          fprintf(__stderrp, "No reference key found in area for key group '%s'\n", (const char *)[v5 UTF8String]);
          abort();
        }
        [*(id *)(a1 + 48) setObject:v55 forKey:v5];

        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(v76, 8);

        goto LABEL_10;
      }
      v57 = __stderrp;
      if (v11)
      {
        sub_59438(__stderrp);
      }
      else
      {
        [v5 UTF8String];
        fprintf(v57, "Invalid area key group '%s' - no RECT or OVAL specified.\n");
      }
    }
    abort();
  }
  v56 = [v6 objectForKey:@"NAMES"];

  if (v56)
  {
    fwrite("NYI", 3uLL, 1uLL, __stderrp);
    abort();
  }
LABEL_10:
  [*(id *)(a1 + 56) setObject:v7 forKey:v5];
}

void sub_53E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);

  _Unwind_Resume(a1);
}

void sub_53FA0(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  CGFloat v6 = *(double *)(a1 + 48);
  CGFloat v7 = *(double *)(a1 + 56);
  CGFloat v8 = *(double *)(a1 + 64);
  CGFloat v9 = *(double *)(a1 + 72);
  [v5 center];
  v14.CGFloat x = v10;
  v14.CGFloat y = v11;
  v15.origin.CGFloat x = v6;
  v15.origin.CGFloat y = v7;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v9;
  if (CGRectContainsPoint(v15, v14) && [*(id *)(a1 + 32) containsObject:v12])
  {
    [*(id *)(a1 + 40) addObject:v12];
    [*(id *)(a1 + 32) removeObject:v12];
  }
}

void sub_54058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_54070(uint64_t a1, void *a2)
{
  id v11 = a2;
  unint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  v13.CGFloat x = v6;
  v13.CGFloat y = v8;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 56), v13))
  {
    double v9 = (v8 - *(double *)(a1 + 96)) * (v8 - *(double *)(a1 + 96))
       + (v6 - *(double *)(a1 + 88)) * (v6 - *(double *)(a1 + 88));
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v9 < *(double *)(v10 + 24))
    {
      *(double *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
}

void sub_54144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_54164(uint64_t a1, void *a2)
{
  id v4 = a2;
  long long v3 = objc_alloc_init(TIFitAffineMLLMatrixWrapper);
  [*(id *)(a1 + 32) setObject:v3 forKey:v4];
}

void sub_541CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_541EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) objectForKey:v5];
  if (!v7)
  {
    fprintf(__stderrp, "Invalid AFFINES entry %s: Must match an ASSIGNMENT group.\n", (const char *)[v5 UTF8String]);
    abort();
  }
  double v8 = [v6 objectForKey:@"VALUES"];

  if (v8)
  {
    double v9 = [v6 objectForKey:@"VALUES"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v9 count] != (char *)&dword_4 + 2)
    {
      fprintf(__stderrp, "VALUES should be an array of 6 numbers in AFFINES entry %s.\n", (const char *)[v5 UTF8String]);
      abort();
    }
    uint64_t v63 = 0;
    CGFloat v64 = &v63;
    uint64_t v65 = 0x5812000000;
    CGFloat v66 = sub_54994;
    CGFloat v67 = sub_549A0;
    CGFloat v68 = &unk_82CF2;
    TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)&v69, 2uLL, 3uLL);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_549B0;
    v60[3] = &unk_8DBF0;
    id v10 = v5;
    id v61 = v10;
    v62 = &v63;
    [v9 enumerateObjectsUsingBlock:v60];
    id v11 = [*(id *)(a1 + 32) objectForKey:v10];
    [v11 setMatrix:v64 + 6];

    _Block_object_dispose(&v63, 8);
    sub_55214((uint64_t)v70, v70[1]);
  }
  else
  {
    id v12 = [v6 objectForKey:@"TRANS"];
    v58 = v12;
    uint64_t v13 = [v6 objectForKey:@"ROTRAD"];
    if (!v13)
    {
      CGPoint v14 = [v6 objectForKey:@"ROTDEG"];
      CGRect v15 = v14;
      if (!v14
        || ([v14 doubleValue],
            +[NSNumber numberWithDouble:v16 * 3.14159265 / 180.0],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            v15,
            !v13))
      {
        double v17 = [v6 objectForKey:@"ROTGRA"];
        double v18 = v17;
        if (v17)
        {
          [v17 doubleValue];
          uint64_t v13 = +[NSNumber numberWithDouble:v19 * 3.14159265 / 200.0];
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
    }
    double v20 = [v6 objectForKey:@"SKEWROTRAD"];
    double v59 = (void *)v13;
    if (!v20)
    {
      double v21 = [v6 objectForKey:@"SKEWROTDEG"];
      id v22 = v21;
      if (!v21
        || ([v21 doubleValue],
            +[NSNumber numberWithDouble:v23 * 3.14159265 / 180.0],
            double v20 = objc_claimAutoreleasedReturnValue(),
            v22,
            !v20))
      {
        double v24 = [v6 objectForKey:@"SKEWROTGRA"];
        float v25 = v24;
        if (v24)
        {
          [v24 doubleValue];
          double v20 = +[NSNumber numberWithDouble:v26 * 3.14159265 / 200.0];
        }
        else
        {
          double v20 = 0;
        }
      }
    }
    double v27 = [v6 objectForKey:@"SCALE"];
    double v28 = [*(id *)(a1 + 32) objectForKey:v5];
    [v59 doubleValue];
    objc_msgSend(v28, "setRotation:");
    [v20 doubleValue];
    objc_msgSend(v28, "setSkewRotation:");
    if (v12)
    {
      double v29 = [v12 objectForKey:@"XPCT"];
      double v30 = v29;
      if (v29)
      {
        id v31 = v29;
      }
      else
      {
        id v31 = +[NSNumber numberWithDouble:0.0];
      }
      uint64_t v32 = v31;

      id v33 = [v58 objectForKey:@"YPCT"];
      long long v34 = v33;
      if (v33)
      {
        id v35 = v33;
      }
      else
      {
        id v35 = +[NSNumber numberWithDouble:0.0];
      }
      double v36 = v35;

      long long v37 = *(void **)(a1 + 40);
      double v38 = [*(id *)(a1 + 48) objectForKey:v5];
      double v39 = [v37 objectForKey:v38];
      [v39 frame];
      double v41 = v40;
      double v43 = v42;

      [v32 doubleValue];
      double v45 = v44;
      [v36 doubleValue];
      [v28 setXTrans:v41 * (v45 / 100.0) yTrans:v43 * (v46 / 100.0)];

      id v12 = v58;
    }
    if (v27)
    {
      double v47 = [v27 objectForKey:@"XPCT"];
      CGFloat v48 = v47;
      if (v47)
      {
        id v49 = v47;
      }
      else
      {
        id v49 = +[NSNumber numberWithDouble:100.0];
      }
      CGFloat v50 = v49;

      CGFloat v51 = [v27 objectForKey:@"YPCT"];
      v52 = v51;
      if (v51)
      {
        id v53 = v51;
      }
      else
      {
        id v53 = +[NSNumber numberWithDouble:100.0];
      }
      id v54 = v53;

      [v50 doubleValue];
      double v56 = v55;
      [v54 doubleValue];
      [v28 setXScale:v56 / 100.0 yScale:v57 / 100.0];

      id v12 = v58;
    }
  }
}

void sub_54844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_54994(uint64_t a1, uint64_t a2)
{
}

void sub_549A0(uint64_t a1)
{
}

void sub_549B0(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    fprintf(__stderrp, "VALUES entry %ld in AFFINES entry %s is not a number or string.\n", a3, (const char *)[*(id *)(a1 + 32) UTF8String]);
    abort();
  }
  [v6 doubleValue];
  *(void *)TIFitAffineMLLMatrix::operator()() = v5;
}

void sub_54A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_54A9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) objectForKey:v3];
  id v6 = [v4 objectForKey:v5];

  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  v17[0] = @"GAUSSIAN_ERROR_STDDEV_X";
  id v11 = *(void **)(a1 + 48);
  [*(id *)(a1 + 56) doubleValue];
  uint64_t v13 = +[NSNumber numberWithDouble:v8 * (v12 / 100.0)];
  v18[0] = v13;
  v17[1] = @"GAUSSIAN_ERROR_STDDEV_Y";
  [*(id *)(a1 + 64) doubleValue];
  CGRect v15 = +[NSNumber numberWithDouble:v10 * (v14 / 100.0)];
  v17[2] = @"SCALE_ERROR_UNITS_TO_POINTS";
  v18[1] = v15;
  v18[2] = &off_94048;
  double v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  [v11 setObject:v16 forKey:v3];
}

void sub_54C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_54C74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_54F08;
  v29[3] = &unk_8DC68;
  id v8 = v5;
  id v30 = v8;
  double v9 = [v7 keysOfEntriesPassingTest:v29];
  double v10 = [v9 anyObject];
  id v11 = [*(id *)(a1 + 40) objectForKey:v10];
  double v12 = *(void **)(a1 + 48);
  uint64_t v13 = [*(id *)(a1 + 56) objectForKey:v10];
  double v14 = [v12 objectForKey:v13];

  [v14 frame];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v32);
  [v6 center];
  double v22 = v21;
  [v6 center];
  objc_msgSend(v11, "transformedPoint:", v22 - MidX, v23 - MidY);
  objc_msgSend(v6, "setCenter:", MidX + v24, MidY + v25);
  double v26 = [TIGaussianErrorGenerator alloc];
  double v27 = [*(id *)(a1 + 64) objectForKey:v10];
  double v28 = [(TIGaussianErrorGenerator *)v26 initWithAttributes:v27];

  [v6 setErrorGenerator:v28];
  [v6 setRotationMatrix:v11];
}

void sub_54E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_54F08(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id result = [a3 containsObject:*(void *)(a1 + 32)];
  *a4 = (_BYTE)result;
  return result;
}

void sub_5501C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_55188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_55214(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_55214(a1, *a2);
    sub_55214(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_55268()
{
  __cxa_atexit((void (*)(void *))sub_2C93C, &unk_AE360, &def_3B118);
}

void sub_55380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5559C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_557AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_55D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t sub_55F70(void *a1)
{
  id v1 = &off_AE000;
  unsigned int v2 = &__stderrp;
  if (dword_AE4E8) {
    fwrite("Starting parse\n", 0xFuLL, 1uLL, __stderrp);
  }
  int v69 = 0;
  int v73 = 0;
  int v3 = 0;
  dword_AE4EC = 0;
  id v4 = &off_AE000;
  dword_AE4F0 = -2;
  __src = v76;
  unint64_t v5 = 200;
  v71 = v78;
  unint64_t v66 = 128;
  id v6 = (__int16 *)v77;
  double v7 = v77;
  id v8 = (uint64_t *)v76;
  while (1)
  {
    *(_WORD *)double v7 = v3;
    if (&v6[v5 - 1] > (__int16 *)v7) {
      goto LABEL_16;
    }
    if (v5 >> 4 > 0x270) {
      break;
    }
    double v9 = v2;
    uint64_t v10 = 2 * v5 >= 0x2710 ? 10000 : 2 * v5;
    id v11 = (__int16 *)malloc_type_malloc(10 * v10 + 7, 0xAF233AF1uLL);
    if (!v11) {
      break;
    }
    double v12 = v11;
    uint64_t v13 = (v7 - (char *)v6) >> 1;
    uint64_t v14 = v13 + 1;
    memcpy(v11, v6, 2 * (v13 + 1));
    int64_t v15 = v10;
    double v16 = (char *)v12 + ((2 * v10 + 7) & 0xFFFFFFFFFFFFFFF8);
    memcpy(v16, __src, 8 * (v13 + 1));
    if (v6 != (__int16 *)v77) {
      free(v6);
    }
    if (*((_DWORD *)v1 + 314)) {
      fprintf(*v9, "Stack size increased to %lu\n", v15);
    }
    double v7 = (char *)&v12[v13];
    id v8 = (uint64_t *)&v16[8 * v14 - 8];
    if (v15 <= v14)
    {
      uint64_t v60 = 1;
      id v4 = &off_AE000;
      goto LABEL_134;
    }
    id v6 = v12;
    __src = v16;
    id v4 = &off_AE000;
    unint64_t v5 = v15;
    unsigned int v2 = v9;
LABEL_16:
    if (*((_DWORD *)v1 + 314))
    {
      fprintf(*v2, "Entering state %d\n", v3);
      id v4 = &off_AE000;
    }
    unint64_t v75 = v5;
    if ((0x2FF8FA79F0uLL >> v3)) {
      goto LABEL_49;
    }
    int v17 = byte_86388[v3];
    int v18 = *((_DWORD *)v4 + 316);
    if (v18 == -2)
    {
      if (*((_DWORD *)v1 + 314)) {
        fwrite("Reading a token: ", 0x11uLL, 1uLL, *v2);
      }
      int v18 = sub_575C8(a1);
      id v4 = &off_AE000;
      dword_AE4F0 = v18;
    }
    if (v18 <= 0)
    {
      *((_DWORD *)v4 + 316) = 0;
      if (*((_DWORD *)v1 + 314))
      {
        fwrite("Now at end of input.\n", 0x15uLL, 1uLL, *v2);
        id v4 = &off_AE000;
      }
      unsigned int v19 = 0;
    }
    else
    {
      if (v18 > 0x110) {
        unsigned int v19 = 2;
      }
      else {
        unsigned int v19 = byte_863AE[v18];
      }
      if (*((_DWORD *)v1 + 314))
      {
        fprintf(*v2, "%s ", "Next token is");
        double v20 = __stderrp;
        if (v19 >= 0x12) {
          fprintf(__stderrp, "nterm %s (");
        }
        else {
          fprintf(__stderrp, "token %s (");
        }
        double v21 = v20;
        unsigned int v2 = &__stderrp;
        fputc(41, v21);
        fputc(10, __stderrp);
        id v4 = &off_AE000;
      }
    }
    uint64_t v22 = v19 + v17;
    int v73 = v19;
    if (v22 > 0x27 || v19 != byte_864BF[v22])
    {
LABEL_49:
      if (((0x100705060FuLL >> v3) & 1) == 0)
      {
        CGFloat v67 = v7;
        unsigned int v27 = byte_8650F[v3];
        goto LABEL_51;
      }
    }
    else
    {
      int v23 = byte_864E7[v22];
      if (((0x7400000001uLL >> v22) & 1) == 0)
      {
        if (v22 == 23)
        {
          uint64_t v60 = 0;
          double v12 = v6;
          goto LABEL_134;
        }
        int v24 = v69 - 1;
        if (!v69) {
          int v24 = 0;
        }
        int v69 = v24;
        if (*((_DWORD *)v1 + 314))
        {
          fprintf(*v2, "%s ", "Shifting");
          double v25 = __stderrp;
          if (v19 >= 0x12) {
            fprintf(__stderrp, "nterm %s (");
          }
          else {
            fprintf(__stderrp, "token %s (");
          }
          double v26 = v25;
          unsigned int v2 = &__stderrp;
          fputc(41, v26);
          fputc(10, __stderrp);
          id v4 = &off_AE000;
        }
        if (*((_DWORD *)v4 + 316)) {
          *((_DWORD *)v4 + 316) = -2;
        }
        v8[1] = qword_AE4F8;
        ++v8;
        goto LABEL_131;
      }
      if (((0x7400000000uLL >> v22) & 1) == 0)
      {
        CGFloat v67 = v7;
        unsigned int v27 = -v23;
LABEL_51:
        uint64_t v28 = v27;
        unint64_t v70 = byte_86535[v27];
        uint64_t v68 = v8[1 - v70];
        if (*((_DWORD *)v1 + 314))
        {
          fprintf(*v2, "Reducing stack by rule %d (line %lu):\n", v27 - 1, byte_865A9[v27]);
          if (v28)
          {
            uint64_t v29 = 0;
            if (v70 <= 1) {
              int v30 = 1;
            }
            else {
              int v30 = v70;
            }
            do
            {
              int v31 = v29 + 1;
              fprintf(*v2, "   $%d = ", v29 + 1);
              CGRect v32 = __stderrp;
              if (byte_865C5[byte_8660D[v28] + v29] < 18) {
                fprintf(__stderrp, "token %s (");
              }
              else {
                fprintf(__stderrp, "nterm %s (");
              }
              id v33 = v32;
              unsigned int v2 = &__stderrp;
              fputc(41, v33);
              fputc(10, __stderrp);
              ++v29;
            }
            while (v30 != v31);
            goto LABEL_60;
          }
          id v1 = &off_AE000;
          long long v34 = v67;
          unsigned int v35 = v68;
        }
        else
        {
LABEL_60:
          long long v34 = v67;
          id v1 = &off_AE000;
          unsigned int v35 = v68;
          switch((int)v28)
          {
            case 5:
              sub_56BBC(a1, *v8);
              break;
            case 6:
              sub_56C34(a1, *v8);
              break;
            case 7:
              sub_56CB4(a1, *v8);
              break;
            case 8:
              sub_56D34(a1, *v8);
              break;
            case 9:
            case 10:
            case 13:
            case 14:
            case 15:
            case 20:
            case 21:
            case 22:
              break;
            case 11:
              [a1 handleNewLine];
              break;
            case 12:
              sub_59188();
              break;
            case 16:
              sub_56DB8(a1, *(v8 - 1), *(_DWORD *)v8);
              break;
            case 17:
              sub_56E48(a1, *(v8 - 1), *(unsigned int *)v8);
              break;
            case 18:
            case 19:
              sub_56ED0(a1, *(v8 - 1), *v8);
              break;
            case 23:
            case 24:
              uint64_t v51 = *(v8 - 1);
              uint64_t v52 = *v8;
              id v53 = a1;
              goto LABEL_115;
            case 25:
              uint64_t v51 = *v8;
              id v53 = a1;
              uint64_t v52 = 0;
LABEL_115:
              sub_56F78(v53, v51, v52);
              break;
            case 26:
              unsigned int v35 = 1;
              break;
            case 27:
              unsigned int v35 = 0;
              break;
            default:
              unsigned int v35 = v68;
              break;
          }
        }
        if (*((_DWORD *)v1 + 314))
        {
          fprintf(*v2, "%s ", "-> $$ =");
          id v54 = __stderrp;
          int v55 = v28;
          uint64_t v56 = byte_86551[v28];
          if (v55) {
            fprintf(__stderrp, "nterm %s (");
          }
          else {
            fprintf(__stderrp, "token %s (");
          }
          double v57 = v54;
          unsigned int v2 = &__stderrp;
          fputc(41, v57);
          fputc(10, __stderrp);
          v58 = &v8[-v70];
          double v7 = &v34[-2 * v70];
          if (*((_DWORD *)v1 + 314)) {
            sub_57030(v6, (unint64_t)v7);
          }
        }
        else
        {
          v58 = &v8[-v70];
          uint64_t v56 = byte_86551[v28];
          double v7 = &v34[-2 * v70];
        }
        v58[1] = v35 | v68 & 0xFFFFFFFF00000000;
        id v8 = v58 + 1;
        uint64_t v59 = (*(__int16 *)v7 + byte_8656D[v56 - 18]);
        if (v59 <= 0x27 && *(unsigned __int16 *)v7 == (unsigned __int16)byte_864BF[v59]) {
          int v23 = byte_864E7[v59];
        }
        else {
          int v23 = byte_86578[v56 - 18];
        }
        id v4 = &off_AE000;
        goto LABEL_131;
      }
    }
    if (v69 == 3)
    {
      int v43 = *((_DWORD *)v4 + 316);
      if (v43 <= 0)
      {
        if (!v43)
        {
          uint64_t v60 = 1;
          goto LABEL_140;
        }
      }
      else
      {
        double v44 = v4;
        sub_5739C("Error: discarding", v73, (void **)&qword_AE4F8);
        *((_DWORD *)v44 + 316) = -2;
      }
    }
    else if (!v69)
    {
      ++dword_AE4EC;
      uint64_t v36 = sub_570C8(0, v3, *((_DWORD *)v4 + 316));
      uint64_t v37 = v36;
      unint64_t v38 = v66;
      if (v66 < v36)
      {
        if (v36 < 0) {
          size_t v39 = -1;
        }
        else {
          size_t v39 = 2 * v36;
        }
        if (v71 != v78) {
          free(v71);
        }
        double v40 = malloc_type_malloc(v39, 0x6CAC4B48uLL);
        double v41 = v78;
        if (v40) {
          double v41 = v40;
        }
        v71 = v41;
        if (v40) {
          unint64_t v38 = v39;
        }
        else {
          unint64_t v38 = 128;
        }
      }
      unint64_t v66 = v38;
      if (v37 - 1 >= v38)
      {
        uint64_t v45 = sub_59038();
        sub_57494(a1, (uint64_t)"syntax error", v45);
        if (v37) {
          break;
        }
      }
      else
      {
        sub_570C8(v71, v3, dword_AE4F0);
        uint64_t v42 = sub_59038();
        sub_57494(a1, (uint64_t)v71, v42);
      }
    }
    double v46 = (__int16 *)(v7 - 2);
    ++v8;
    while (1)
    {
      if ((0x2FF8FA79F0uLL >> v3) & 1) == 0 && ((0x100304060FuLL >> v3))
      {
        int v47 = byte_86388[v3] + 1;
        BOOL v48 = byte_86388[v3] == 10 || v47 == 1;
        if (v48 && ((0x8BFFFFFFFEuLL >> v47) & 1) != 0) {
          break;
        }
      }
      --v8;
      if (v46 + 1 == v6)
      {
        uint64_t v60 = 1;
        double v12 = v6;
        double v7 = (char *)v6;
        goto LABEL_133;
      }
      sub_5739C("Error: popping", byte_86583[v3], (void **)v8);
      int v3 = *v46;
      if (*((_DWORD *)v1 + 314)) {
        sub_57030(v6, (unint64_t)v46);
      }
      --v46;
    }
    int v23 = byte_864E7[byte_86388[v3] + 1];
    uint64_t *v8 = qword_AE4F8;
    double v7 = (char *)(v46 + 1);
    if (*((_DWORD *)v1 + 314))
    {
      fprintf(__stderrp, "%s ", "Shifting");
      id v49 = __stderrp;
      if ((0x1BE3ECC1FFuLL >> v23)) {
        fprintf(__stderrp, "token %s (");
      }
      else {
        fprintf(__stderrp, "nterm %s (");
      }
      CGFloat v50 = v49;
      unsigned int v2 = &__stderrp;
      fputc(41, v50);
      fputc(10, __stderrp);
      int v69 = 3;
    }
    else
    {
      int v69 = 3;
      unsigned int v2 = &__stderrp;
    }
    id v4 = &off_AE000;
LABEL_131:
    v7 += 2;
    int v3 = v23;
    unint64_t v5 = v75;
  }
  uint64_t v65 = sub_59038();
  sub_57494(a1, (uint64_t)"memory exhausted", v65);
  uint64_t v60 = 2;
  double v12 = v6;
LABEL_133:
  id v4 = &off_AE000;
LABEL_134:
  int v61 = *((_DWORD *)v4 + 316);
  if (v61 != -2 && v61 != 0) {
    sub_5739C("Cleanup: discarding lookahead", v73, (void **)&qword_AE4F8);
  }
  id v6 = v12;
LABEL_140:
  if (*((_DWORD *)v1 + 314)) {
    sub_57030(v6, (unint64_t)v7);
  }
  for (; v7 != (char *)v6; --v8)
  {
    uint64_t v63 = *(__int16 *)v7;
    v7 -= 2;
    sub_5739C("Cleanup: popping", byte_86583[v63], (void **)v8);
  }
  if (v6 != (__int16 *)v77) {
    free(v6);
  }
  if (v71 != v78) {
    free(v71);
  }
  return v60;
}

void sub_56BBC(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSString stringWithUTF8String:a2];
  [v3 handleTyping:v4];
}

void sub_56C34(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSString stringWithUTF8String:a2];
  [v3 handleCorrectionMatch:v4 lineNumber:sub_59038()];
}

void sub_56CB4(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSString stringWithUTF8String:a2];
  [v3 handlePredictionMatch:v4 lineNumber:sub_59038()];
}

void sub_56D34(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSString stringWithUTF8String:a2];
  [v3 handleDocumentMatch:v4 lineNumber:sub_59038()];
}

void sub_56DB8(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  id v6 = +[NSString stringWithUTF8String:a2];
  [v5 handleBoolConfig:v6 withValue:a3 != 0 lineNumber:sub_59038()];
}

void sub_56E48(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = +[NSString stringWithUTF8String:a2];
  [v5 handleIntConfig:v6 withValue:a3 lineNumber:sub_59038()];
}

void sub_56ED0(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v7 = +[NSString stringWithUTF8String:a2];
  id v6 = +[NSString stringWithUTF8String:a3];
  [v5 handleStringConfig:v7 withValue:v6 lineNumber:sub_59038()];
}

void sub_56F78(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v7 = +[NSString stringWithUTF8String:a2];
  if (a3)
  {
    id v6 = +[NSString stringWithUTF8String:a3];
  }
  else
  {
    id v6 = 0;
  }
  [v5 handleCommand:v7 withValue:v6 lineNumber:sub_59038()];

  if (a3) {
}
  }

uint64_t sub_57030(__int16 *a1, unint64_t a2)
{
  fwrite("Stack now", 9uLL, 1uLL, __stderrp);
  while ((unint64_t)a1 <= a2)
  {
    int v4 = *a1++;
    fprintf(__stderrp, " %d", v4);
  }
  id v5 = __stderrp;

  return fputc(10, v5);
}

uint64_t sub_570C8(unsigned char *a1, int a2, unsigned int a3)
{
  if ((0x100705860FuLL >> a2))
  {
    char v5 = a2;
    int v6 = byte_86388[a2];
    if (a3 > 0x110) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = byte_863AE[a3];
    }
    id v8 = off_8DCB0[v7];
    uint64_t v9 = sub_57514(0, v8);
    long long v39 = 0u;
    long long v38 = 0u;
    uint64_t v37 = v8;
    strcpy(v36, "syntax error, unexpected %s");
    if ((0x2FFCFBF9F0uLL >> v5)) {
      int v10 = -v6;
    }
    else {
      int v10 = 0;
    }
    if (40 - v6 >= 18) {
      int v11 = 18;
    }
    else {
      int v11 = 40 - v6;
    }
    if (v10 < v11)
    {
      int v12 = 0;
      uint64_t v13 = &v36[27];
      uint64_t v14 = v10;
      uint64_t v15 = v6;
      uint64_t v16 = v11;
      int v17 = ", expecting %s";
      int v18 = 1;
      uint64_t v35 = v9;
      unint64_t v19 = v9;
      while (1)
      {
        if (v14 != 1 && v14 == byte_864BF[v14 + v15])
        {
          if (v18 == 5)
          {
            v36[27] = 0;
            int v18 = 1;
            unint64_t v19 = v35;
            goto LABEL_27;
          }
          double v20 = off_8DCB0[v14];
          (&v37)[v18] = v20;
          uint64_t v21 = sub_57514(0, v20);
          BOOL v22 = __CFADD__(v21, v19);
          v19 += v21;
          int v23 = v22;
          --v13;
          do
          {
            int v24 = *(unsigned __int8 *)v17++;
            *++uint64_t v13 = v24;
          }
          while (v24);
          ++v18;
          v12 |= v23;
          int v17 = " or %s";
        }
        if (++v14 == v16) {
          goto LABEL_27;
        }
      }
    }
    int v12 = 0;
    int v18 = 1;
    unint64_t v19 = v9;
LABEL_27:
    uint64_t v25 = 0;
    while (v36[v25++])
      ;
    unint64_t v3 = v19 + v25 - 1;
    if (v12 | (v3 < v19)) {
      return -1;
    }
    if (!a1) {
      return v3;
    }
    int v28 = 0;
    for (uint64_t i = v36; ; i += v33)
    {
      int v30 = *i;
      *a1 = v30;
      if (v30 != 37) {
        break;
      }
      if (i[1] != 115 || v28 >= v18) {
        goto LABEL_41;
      }
      int v34 = v28 + 1;
      uint64_t v32 = sub_57514((uint64_t)a1, (&v37)[v28]);
      uint64_t v33 = 2;
      int v28 = v34;
LABEL_43:
      a1 += v32;
    }
    if (!v30) {
      return v3;
    }
LABEL_41:
    uint64_t v32 = 1;
    uint64_t v33 = 1;
    goto LABEL_43;
  }
  return 0;
}

void sub_57358(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_59038();

  sub_57494(a1, a2, v4);
}

void sub_5739C(const char *a1, int a2, void **a3)
{
  if (dword_AE4E8)
  {
    char v5 = "Deleting";
    if (a1) {
      char v5 = a1;
    }
    fprintf(__stderrp, "%s ", v5);
    int v6 = __stderrp;
    if (a2 >= 18) {
      fprintf(__stderrp, "nterm %s (");
    }
    else {
      fprintf(__stderrp, "token %s (");
    }
    fputc(41, v6);
    fputc(10, __stderrp);
  }
  if ((a2 - 12) <= 5)
  {
    uint64_t v7 = *a3;
    free(v7);
  }
}

void sub_57494(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = +[NSString stringWithUTF8String:a2];
  [v5 reportSyntaxErrors:v6 lineNumber:a3];
}

uint64_t sub_57514(uint64_t a1, unsigned char *a2)
{
  if (*a2 != 34)
  {
LABEL_13:
    uint64_t v10 = 0;
    if (a1)
    {
      do
      {
        int v11 = a2[v10];
        *(unsigned char *)(a1 + v10++) = v11;
      }
      while (v11);
    }
    else
    {
      while (a2[v10++])
        ;
    }
    return v10 - 1;
  }
  uint64_t v2 = 0;
  unint64_t v3 = a2;
  for (i = a2; ; unint64_t v3 = i)
  {
    int v6 = (char)*++i;
    int v5 = v6;
    char v7 = v6;
    if (v6 > 91)
    {
      if (v5 == 92)
      {
        int v9 = v3[2];
        id v8 = v3 + 2;
        if (v9 != 92) {
          goto LABEL_13;
        }
        char v7 = 92;
        uint64_t i = v8;
      }
      goto LABEL_10;
    }
    if (v5 == 34) {
      break;
    }
    if (v5 == 39 || v5 == 44) {
      goto LABEL_13;
    }
LABEL_10:
    if (a1) {
      *(unsigned char *)(a1 + v2) = v7;
    }
    ++v2;
  }
  if (a1) {
    *(unsigned char *)(a1 + v2) = 0;
  }
  return v2;
}

uint64_t sub_575C8(void *a1)
{
  id v1 = &off_AE000;
  uint64_t v2 = &off_AE000;
  unint64_t v3 = &off_AE000;
  if ((byte_AE498 & 1) == 0)
  {
    byte_AE498 = 1;
    if (!dword_AE49C) {
      dword_AE49C = 1;
    }
    if (!qword_AE500) {
      qword_AE500 = (uint64_t)__stdinp;
    }
    if (!qword_AE508) {
      qword_AE508 = (uint64_t)__stdoutp;
    }
    uint64_t v4 = qword_AE4A0;
    if (qword_AE4A0 && (uint64_t v5 = qword_AE4A8, (v6 = *(void *)(qword_AE4A0 + 8 * qword_AE4A8)) != 0))
    {
      char v7 = &off_AE000;
    }
    else
    {
      sub_586BC();
      char v7 = &off_AE000;
      uint64_t v6 = sub_5877C((FILE *)qword_AE500, 0x4000);
      uint64_t v4 = qword_AE4A0;
      uint64_t v5 = qword_AE4A8;
      *(void *)(qword_AE4A0 + 8 * qword_AE4A8) = v6;
    }
    qword_AE4C8 = *(void *)(v6 + 32);
    id v8 = *(char **)(v6 + 16);
    qword_AE4B0 = (uint64_t)v8;
    qword_AE518 = (uint64_t)v8;
    v7[160] = **(char ***)(v4 + 8 * v5);
    byte_AE4B8 = *v8;
  }
  int v9 = &off_AE000;
  uint64_t v10 = &off_AE000;
  int v11 = &off_AE000;
LABEL_14:
  uint64_t v12 = qword_AE4B0;
  *(unsigned char *)qword_AE4B0 = *((unsigned char *)v1 + 1208);
  LODWORD(v13) = *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) + dword_AE49C;
  uint64_t v106 = v12;
  while (1)
  {
    do
    {
LABEL_15:
      uint64_t v14 = byte_86638[*(unsigned __int8 *)v12];
      if (word_86738[(int)v13])
      {
        *((_DWORD *)v10 + 303) = v13;
        v9[152] = (char *)v12;
      }
      uint64_t v15 = (int)v13;
      uint64_t v16 = word_86926[(int)v13] + v14;
      if (v13 != (__int16)word_867DC[v16])
      {
        do
        {
          uint64_t v15 = word_869D4[v15];
          if (v15 >= 82) {
            uint64_t v14 = *((unsigned __int8 *)&unk_86A82 + v14);
          }
          uint64_t v16 = word_86926[v15] + v14;
        }
        while (word_867DC[v16] != (unsigned __int16)v15);
      }
      uint64_t v13 = word_86A9C[v16];
      ++v12;
    }
    while (word_86926[v13] != 139);
    while (2)
    {
      int v17 = (unsigned __int16)word_86738[(int)v13];
      if (!word_86738[(int)v13])
      {
        uint64_t v12 = (uint64_t)v9[152];
        int v17 = (unsigned __int16)word_86738[*((int *)v10 + 303)];
      }
      int v18 = (__int16)v17;
      v3[163] = (char *)v106;
      v11[164] = (char *)(v12 - v106);
      *((unsigned char *)v1 + 1208) = *(unsigned char *)v12;
      *(unsigned char *)uint64_t v12 = 0;
      qword_AE4B0 = v12;
      unint64_t v19 = &off_AE000;
      if (v17 != 29 && ((0x1EFEFF9DuLL >> v17) & 1) == 0)
      {
        double v20 = v11[164];
        if (v20)
        {
          int v21 = dword_AE388;
          BOOL v22 = v3[163];
          do
          {
            int v23 = *v22++;
            if (v23 == 10) {
              dword_AE388 = ++v21;
            }
            --v20;
          }
          while (v20);
        }
      }
LABEL_31:
      switch(v18)
      {
        case 0:
          *(unsigned char *)uint64_t v12 = *((unsigned char *)v1 + 1208);
          uint64_t v12 = (uint64_t)v9[152];
          LODWORD(v13) = *((_DWORD *)v10 + 303);
          continue;
        case 1:
        case 7:
        case 20:
          uint64_t v60 = v11[164];
          if (v60) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v60 - 1] == 10;
          }
          goto LABEL_14;
        case 2:
          v87 = v11[164];
          if (v87) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v87 - 1] == 10;
          }
          sub_58804(1);
          return 262;
        case 3:
          v88 = v11[164];
          v89 = v3[163];
          if (v88) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v89[(void)v88 - 1] == 10;
          }
          if (!strcasecmp(v89, "set")) {
            return 263;
          }
          if (!strcasecmp(v89, "yes")) {
            return 260;
          }
          if (!strcasecmp(v89, "no")) {
            return 261;
          }
          v90 = v89;
LABEL_178:
          qword_AE4F8 = (uint64_t)strdup(v90);
          return 272;
        case 4:
          v91 = v11[164];
          v92 = v3[163];
          if (v91) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v92[(void)v91 - 1] == 10;
          }
          LODWORD(qword_AE4F8) = atoi(v92);
          return 266;
        case 5:
        case 6:
          CGRect v85 = v11[164];
          if (v85) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v85 - 1] == 10;
          }
          sub_588C0();
          return 264;
        case 8:
          int v61 = v11[164];
          if (v61) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v61 - 1] == 10;
          }
          int v62 = 4;
          goto LABEL_133;
        case 9:
          v93 = v11[164];
          if (v93) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v93 - 1] == 10;
          }
          sub_588C0();
          qword_AE4F8 = (uint64_t)strndup(byte_AE528, dword_AE514);
          dword_AE514 = 0;
          return 269;
        case 10:
          uint64_t v63 = v11[164];
          if (v63) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v63 - 1] == 10;
          }
          int v62 = 3;
          goto LABEL_133;
        case 11:
          v94 = v11[164];
          if (v94) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v94 - 1] == 10;
          }
          sub_588C0();
          qword_AE4F8 = (uint64_t)strndup(byte_AE528, dword_AE514);
          dword_AE514 = 0;
          return 270;
        case 12:
          CGFloat v64 = v11[164];
          if (v64) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v64 - 1] == 10;
          }
          int v62 = 5;
          goto LABEL_133;
        case 13:
          v95 = v11[164];
          if (v95) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v95 - 1] == 10;
          }
          sub_588C0();
          qword_AE4F8 = (uint64_t)strndup(byte_AE528, dword_AE514);
          dword_AE514 = 0;
          return 271;
        case 14:
        case 15:
          v86 = v11[164];
          if (v86) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v86 - 1] == 10;
          }
          sub_588C0();
          qword_AE4F8 = (uint64_t)strndup(byte_AE528, dword_AE514);
          dword_AE514 = 0;
          return 268;
        case 16:
          uint64_t v65 = v11[164];
          if (v65) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v65 - 1] == 10;
          }
          int v66 = dword_AE49C;
          if (dword_AE49C >= 1) {
            int v66 = dword_AE49C - 1;
          }
          uint64_t v67 = ((uint64_t)v66 >> 1) - 2;
          if (v67 <= 5) {
            sub_57494(a1, (uint64_t)(&off_8DDA0)[v67], (dword_AE388 - 1));
          }
          sub_588C0();
          dword_AE514 = 0;
          goto LABEL_141;
        case 17:
          uint64_t v68 = v2;
          int v69 = v11[164];
          unint64_t v70 = v3[163];
          if (v69) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v68[149]) + 48) = v70[(void)v69 - 1] == 10;
          }
          if (!strcmp(v70, "\\n"))
          {
            uint64_t v83 = dword_AE514++;
            byte_AE528[v83] = 10;
            uint64_t v2 = v68;
            unint64_t v3 = &off_AE000;
          }
          else
          {
            v71 = v1;
            int v72 = strcmp(v70, "\\t");
            uint64_t v73 = dword_AE514;
            if (v72)
            {
              memcpy(&byte_AE528[dword_AE514], v70 + 1, (size_t)(v69 - 1));
              dword_AE514 = v69 + v73 - 1;
            }
            else
            {
              ++dword_AE514;
              byte_AE528[v73] = 9;
            }
            uint64_t v2 = v68;
            unint64_t v3 = &off_AE000;
            id v1 = v71;
LABEL_140:
            int v11 = &off_AE000;
          }
          goto LABEL_141;
        case 18:
          v74 = v1;
          unint64_t v75 = v3;
          size_t v76 = (size_t)v11[164];
          v77 = v75[163];
          if (v76) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v77[v76 - 1] == 10;
          }
          int v78 = dword_AE514;
          memcpy(&byte_AE528[dword_AE514], v77, v76);
          dword_AE514 = v78 + v76;
          unint64_t v3 = &off_AE000;
          id v1 = v74;
          goto LABEL_140;
        case 19:
          v96 = v11[164];
          if (v96) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v96 - 1] == 10;
          }
          sub_58804(2);
          return 258;
        case 21:
          v97 = v11[164];
          if (v97) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v97 - 1] == 10;
          }
          return 265;
        case 22:
          v98 = v11[164];
          v90 = v3[163];
          if (v98) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v90[(void)v98 - 1] == 10;
          }
          goto LABEL_178;
        case 23:
          v99 = v11[164];
          if (v99) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v99 - 1] == 10;
          }
          sub_588C0();
          return 259;
        case 24:
          v100 = v11[164];
          if (v100) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v100 - 1] == 10;
          }
          return 264;
        case 25:
          v101 = v11[164];
          v102 = v3[163];
          if (v101) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v102[(void)v101 - 1] == 10;
          }
          qword_AE4F8 = (uint64_t)strdup(v102);
          return 267;
        case 26:
          id v79 = v11[164];
          if (v79) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v79 - 1] == 10;
          }
          int v62 = 7;
          goto LABEL_133;
        case 27:
          double v80 = v11[164];
          if (v80) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v3[163][(void)v80 - 1] == 10;
          }
          int v62 = 6;
LABEL_133:
          sub_58804(v62);
          goto LABEL_141;
        case 28:
          size_t v81 = (size_t)v11[164];
          double v82 = v3[163];
          if (v81) {
            *(_DWORD *)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 48) = v82[v81 - 1] == 10;
          }
          fwrite(v82, v81, 1uLL, (FILE *)qword_AE508);
LABEL_141:
          int v9 = &off_AE000;
          uint64_t v10 = &off_AE000;
          goto LABEL_14;
        case 29:
          v105 = v3[163];
          *(unsigned char *)uint64_t v12 = *((unsigned char *)v1 + 1208);
          uint64_t v24 = qword_AE4A0;
          uint64_t v25 = v2[149];
          uint64_t v26 = *(void *)(qword_AE4A0 + 8 * (void)v25);
          if (*(_DWORD *)(v26 + 64))
          {
            uint64_t v27 = (uint64_t)v19[153];
          }
          else
          {
            uint64_t v27 = *(void *)(v26 + 32);
            v19[153] = (char *)v27;
            *(void *)uint64_t v26 = qword_AE500;
            uint64_t v26 = *(void *)(v24 + 8 * (void)v25);
            *(_DWORD *)(v26 + 64) = 1;
          }
          LODWORD(v28) = qword_AE4B0;
          uint64_t v29 = *(unsigned char **)(v26 + 8);
          if (qword_AE4B0 <= (unint64_t)&v29[v27])
          {
            uint64_t v12 = (uint64_t)&v3[163][~v105 + (int)v12];
            qword_AE4B0 = v12;
            LODWORD(v13) = sub_58914();
            uint64_t v10 = &off_AE000;
            int v9 = &off_AE000;
            if (word_86738[(int)v13])
            {
              dword_AE4BC = v13;
              qword_AE4C0 = v12;
            }
            uint64_t v56 = (int)v13;
            uint64_t v57 = word_86926[(int)v13] + 1;
            id v1 = &off_AE000;
            int v11 = &off_AE000;
            if (v13 != (__int16)word_867DC[v57])
            {
              do
              {
                int v58 = (unsigned __int16)word_869D4[v56];
                uint64_t v56 = (__int16)v58;
                uint64_t v57 = word_86926[(__int16)v58] + 1;
              }
              while (v58 != word_867DC[v57]);
            }
            uint64_t v106 = (uint64_t)v3[163];
            if (v57)
            {
              int v59 = (unsigned __int16)word_86A9C[v57];
              if (v59 != 81)
              {
                LODWORD(v13) = (__int16)v59;
                qword_AE4B0 = ++v12;
                goto LABEL_15;
              }
            }
            continue;
          }
          if (qword_AE4B0 > (unint64_t)&v29[v27 + 1]) {
            sub_58ABC("fatal flex scanner internal error--end of buffer missed");
          }
          int v30 = v3[163];
          if (!*(_DWORD *)(v26 + 60))
          {
            id v1 = &off_AE000;
            if (qword_AE4B0 - (void)v30 != 1) {
              goto LABEL_91;
            }
            goto LABEL_83;
          }
          int v31 = ~v30 + qword_AE4B0;
          if (v31 >= 1)
          {
            int v32 = ~v30 + qword_AE4B0;
            do
            {
              char v33 = *v30++;
              *v29++ = v33;
              --v32;
            }
            while (v32);
            uint64_t v26 = *(void *)(v24 + 8 * (void)v25);
          }
          uint64_t v107 = v31;
          if (*(_DWORD *)(v26 + 64) == 2)
          {
            v19[153] = 0;
            goto LABEL_44;
          }
          uint64_t v36 = v2;
          int v37 = ~v31;
          int v38 = *(_DWORD *)(v26 + 24);
          unsigned int v39 = v38 + ~v31;
          int v103 = v31;
          if (!v39)
          {
            do
            {
              if (!*(_DWORD *)(v26 + 40))
              {
                *(void *)(v26 + 8) = 0;
LABEL_193:
                sub_58ABC("fatal error - scanner input buffer overflow");
              }
              double v40 = *(void **)(v26 + 8);
              int v41 = 2 * v38;
              *(_DWORD *)(v26 + 24) = v41;
              uint64_t v42 = malloc_type_realloc(v40, v41 + 2, 0xDB05E8D7uLL);
              *(void *)(v26 + 8) = v42;
              if (!v42) {
                goto LABEL_193;
              }
              uint64_t v28 = (uint64_t)v42 + (int)v28 - (int)v40;
              qword_AE4B0 = v28;
              uint64_t v26 = *(void *)(qword_AE4A0 + 8 * (void)v36[149]);
              int v38 = *(_DWORD *)(v26 + 24);
              unsigned int v39 = v38 + v37;
            }
            while (!(v38 + v37));
          }
          uint64_t v2 = v36;
          if (v39 >= 0x2000) {
            size_t v43 = 0x2000;
          }
          else {
            size_t v43 = v39;
          }
          if (!*(_DWORD *)(v26 + 44))
          {
            *__error() = 0;
            size_t v46 = fread((void *)(*(void *)(*(void *)(qword_AE4A0 + 8 * (void)v36[149]) + 8) + v103), 1uLL, v43, (FILE *)qword_AE500);
            unint64_t v34 = (int)v46;
            unint64_t v19 = &off_AE000;
            qword_AE4C8 = (int)v46;
            int v9 = &off_AE000;
            uint64_t v10 = &off_AE000;
            if (v46 << 32) {
              goto LABEL_74;
            }
            while (ferror((FILE *)qword_AE500))
            {
              if (*__error() != 4) {
                goto LABEL_196;
              }
              *__error() = 0;
              clearerr((FILE *)qword_AE500);
              size_t v47 = fread((void *)(*(void *)(*(void *)(qword_AE4A0 + 8 * (void)v36[149]) + 8) + v107), 1uLL, v43, (FILE *)qword_AE500);
              unint64_t v34 = (int)v47;
              unint64_t v19 = &off_AE000;
              qword_AE4C8 = (int)v47;
              if (v47 << 32)
              {
                int v9 = &off_AE000;
                uint64_t v10 = &off_AE000;
                goto LABEL_74;
              }
            }
            uint64_t v24 = qword_AE4A0;
            uint64_t v25 = v36[149];
            uint64_t v26 = *(void *)(qword_AE4A0 + 8 * (void)v25);
            unint64_t v19 = &off_AE000;
            int v9 = &off_AE000;
            uint64_t v10 = &off_AE000;
            int v31 = v103;
LABEL_44:
            *(void *)(v26 + 32) = 0;
            if (!v31) {
              goto LABEL_77;
            }
LABEL_45:
            unint64_t v34 = 0;
            int v35 = 2;
            *(_DWORD *)(v26 + 64) = 2;
            goto LABEL_78;
          }
          unint64_t v34 = 0;
          while (1)
          {
            int v44 = getc((FILE *)qword_AE500);
            BOOL v45 = v44 == -1 || v44 == 10;
            if (v45) {
              break;
            }
            *(unsigned char *)(*(void *)(*(void *)(qword_AE4A0 + 8 * (void)v36[149]) + 8) + v107 + v34++) = v44;
            if (v43 == v34)
            {
              unint64_t v34 = v43;
              break;
            }
          }
          if (v44 == -1)
          {
            int v48 = ferror((FILE *)qword_AE500);
            int v9 = &off_AE000;
            uint64_t v10 = &off_AE000;
            if (v48) {
LABEL_196:
            }
              sub_58ABC("input in flex scanner failed");
          }
          else
          {
            if (v44 == 10) {
              *(unsigned char *)(*(void *)(*(void *)(qword_AE4A0 + 8 * (void)v36[149]) + 8) + v107 + v34++) = 10;
            }
            int v9 = &off_AE000;
            uint64_t v10 = &off_AE000;
          }
          unint64_t v19 = &off_AE000;
          qword_AE4C8 = v34;
LABEL_74:
          uint64_t v24 = qword_AE4A0;
          uint64_t v25 = v36[149];
          uint64_t v26 = *(void *)(qword_AE4A0 + 8 * (void)v25);
          *(void *)(v26 + 32) = v34;
          if (v34)
          {
            int v35 = 0;
            int v31 = v103;
            goto LABEL_78;
          }
          int v31 = v103;
          if (v103) {
            goto LABEL_45;
          }
LABEL_77:
          int v49 = v31;
          sub_58A0C((FILE *)qword_AE500);
          int v31 = v49;
          uint64_t v10 = &off_AE000;
          int v9 = &off_AE000;
          unint64_t v19 = &off_AE000;
          unint64_t v34 = qword_AE4C8;
          uint64_t v24 = qword_AE4A0;
          uint64_t v25 = v2[149];
          uint64_t v26 = *(void *)(qword_AE4A0 + 8 * (void)v25);
          int v35 = 1;
LABEL_78:
          unint64_t v50 = v34 + v31;
          if (v50 <= *(int *)(v26 + 24))
          {
            uint64_t v54 = *(void *)(v26 + 8);
            id v1 = &off_AE000;
          }
          else
          {
            size_t v51 = v50 + (v34 >> 1);
            uint64_t v52 = malloc_type_realloc(*(void **)(v26 + 8), v51, 0xDB05E8D7uLL);
            uint64_t v24 = qword_AE4A0;
            uint64_t v25 = v2[149];
            *(void *)(*(void *)(qword_AE4A0 + 8 * (void)v25) + 8) = v52;
            uint64_t v53 = *(void *)(v24 + 8 * (void)v25);
            uint64_t v54 = *(void *)(v53 + 8);
            if (!v54) {
              sub_58ABC("out of dynamic memory in yy_get_next_buffer()");
            }
            *(_DWORD *)(v53 + 24) = v51 - 2;
            unint64_t v19 = &off_AE000;
            unint64_t v50 = qword_AE4C8 + v107;
            id v1 = &off_AE000;
            int v9 = &off_AE000;
            uint64_t v10 = &off_AE000;
          }
          v19[153] = (char *)v50;
          *(unsigned char *)(v54 + v5_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
          *(unsigned char *)(v50 + *(void *)(*(void *)(v24 + 8 * (void)v25) + 8) + 1) = 0;
          int v30 = *(char **)(*(void *)(v24 + 8 * (void)v25) + 8);
          unint64_t v3 = &off_AE000;
          qword_AE518 = (uint64_t)v30;
          if (v35 == 1)
          {
LABEL_83:
            qword_AE4B0 = (uint64_t)v30;
            int v55 = dword_AE49C;
            if (dword_AE49C >= 1) {
              int v55 = dword_AE49C - 1;
            }
            int v18 = (v55 >> 1) + 30;
            int v11 = &off_AE000;
            goto LABEL_31;
          }
          if (v35)
          {
            BOOL v45 = v35 == 2;
            int v11 = &off_AE000;
            if (!v45) {
              goto LABEL_14;
            }
            uint64_t v29 = *(unsigned char **)(*(void *)(qword_AE4A0 + 8 * (void)v2[149]) + 8);
            uint64_t v27 = qword_AE4C8;
LABEL_91:
            uint64_t v12 = (uint64_t)&v29[v27];
            qword_AE4B0 = (uint64_t)&v29[v27];
            LODWORD(v13) = sub_58914();
            uint64_t v10 = &off_AE000;
            int v9 = &off_AE000;
            uint64_t v106 = (uint64_t)v3[163];
            int v11 = &off_AE000;
            continue;
          }
          uint64_t v12 = (uint64_t)&v30[~v105 + (int)v12];
          qword_AE4B0 = v12;
          LODWORD(v13) = sub_58914();
          uint64_t v10 = &off_AE000;
          int v9 = &off_AE000;
          uint64_t v106 = qword_AE518;
          int v11 = &off_AE000;
          break;
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
          return 0;
        default:
          sub_58ABC("fatal flex scanner internal error--no action found");
      }
      break;
    }
  }
}

void *sub_586BC()
{
  id result = (void *)qword_AE4A0;
  if (qword_AE4A0)
  {
    if (qword_AE4A8 >= (unint64_t)(qword_AE4D8 - 1))
    {
      uint64_t v1 = qword_AE4D8 + 8;
      id result = malloc_type_realloc((void *)qword_AE4A0, 8 * (qword_AE4D8 + 8), 0xDB05E8D7uLL);
      qword_AE4A0 = (uint64_t)result;
      if (result)
      {
        uint64_t v2 = &result[qword_AE4D8];
        _OWORD *v2 = 0u;
        v2[1] = 0u;
        v2[2] = 0u;
        v2[3] = 0u;
        qword_AE4D8 = v1;
        return result;
      }
LABEL_8:
      sub_58ABC("out of dynamic memory in yyensure_buffer_stack()");
    }
  }
  else
  {
    id result = malloc_type_malloc(8uLL, 0xBF065FE1uLL);
    qword_AE4A0 = (uint64_t)result;
    if (!result) {
      goto LABEL_8;
    }
    *id result = 0;
    qword_AE4D8 = 1;
    qword_AE4A8 = 0;
  }
  return result;
}

uint64_t sub_5877C(FILE *a1, int a2)
{
  uint64_t v4 = malloc_type_malloc(0x48uLL, 0xBF065FE1uLL);
  if (!v4
    || (uint64_t v5 = (uint64_t)v4, v4[6] = a2, v6 = malloc_type_malloc(a2 + 2, 0xBF065FE1uLL), (*(void *)(v5 + 8) = v6) == 0))
  {
    sub_58ABC("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v5 + 4_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1;
  sub_58AF4(v5, a1);
  return v5;
}

_DWORD *sub_58804(int a1)
{
  int v2 = dword_AE4E0;
  int v3 = dword_AE4E4;
  id result = (_DWORD *)qword_AE4D0;
  if (dword_AE4E0 >= dword_AE4E4)
  {
    int v5 = dword_AE4E4 + 25;
    dword_AE4E4 += 25;
    if (qword_AE4D0) {
      id result = malloc_type_realloc((void *)qword_AE4D0, 4 * (v3 + 25), 0xDB05E8D7uLL);
    }
    else {
      id result = malloc_type_malloc(4 * v5, 0xBF065FE1uLL);
    }
    qword_AE4D0 = (uint64_t)result;
    if (!result) {
      sub_58ABC("out of memory expanding start-condition stack");
    }
    int v2 = dword_AE4E0;
  }
  int v6 = dword_AE49C;
  if (dword_AE49C >= 1) {
    int v6 = dword_AE49C - 1;
  }
  dword_AE4E0 = v2 + 1;
  result[v2] = v6 >> 1;
  dword_AE49C = (2 * a1) | 1;
  return result;
}

void sub_588C0()
{
  int v0 = dword_AE4E0;
  unsigned int v1 = --dword_AE4E0;
  if (v0 <= 0) {
    sub_58ABC("start-condition stack underflow");
  }
  dword_AE49C = (2 * *(_DWORD *)(qword_AE4D0 + 4 * v1)) | 1;
}

uint64_t sub_58914()
{
  uint64_t result = (*(_DWORD *)(*(void *)(qword_AE4A0 + 8 * qword_AE4A8) + 48) + dword_AE49C);
  unsigned int v1 = (unsigned char *)qword_AE518;
  if (qword_AE518 < (unint64_t)qword_AE4B0)
  {
    do
    {
      if (*v1) {
        uint64_t v2 = byte_86638[*v1];
      }
      else {
        uint64_t v2 = &def_3B118 + 1;
      }
      if (word_86738[(int)result])
      {
        dword_AE4BC = result;
        qword_AE4C0 = (uint64_t)v1;
      }
      uint64_t v3 = (int)result;
      uint64_t v4 = word_86926[(int)result] + v2;
      if (result != (__int16)word_867DC[v4])
      {
        do
        {
          uint64_t v3 = word_869D4[v3];
          if (v3 >= 82) {
            uint64_t v2 = *((unsigned __int8 *)&unk_86A82 + v2);
          }
          uint64_t v4 = word_86926[v3] + v2;
        }
        while (word_867DC[v4] != (unsigned __int16)v3);
      }
      uint64_t result = word_86A9C[v4];
      ++v1;
    }
    while (v1 != (unsigned char *)qword_AE4B0);
  }
  return result;
}

uint64_t sub_58A04()
{
  return 1;
}

int *sub_58A0C(FILE *a1)
{
  if (!qword_AE4A0 || (uint64_t v2 = *(void *)(qword_AE4A0 + 8 * qword_AE4A8)) == 0)
  {
    sub_586BC();
    uint64_t v2 = sub_5877C((FILE *)qword_AE500, 0x4000);
    *(void *)(qword_AE4A0 + 8 * qword_AE4A8) = v2;
  }
  uint64_t result = sub_58AF4(v2, a1);
  uint64_t v4 = *(void *)(qword_AE4A0 + 8 * qword_AE4A8);
  uint64_t v5 = *(void *)(v4 + 32);
  qword_AE4B0 = *(void *)(v4 + 16);
  qword_AE518 = qword_AE4B0;
  int v6 = *(uint64_t **)(qword_AE4A0 + 8 * qword_AE4A8);
  qword_AE4C8 = v5;
  qword_AE500 = *v6;
  byte_AE4B8 = *(unsigned char *)qword_AE4B0;
  return result;
}

void sub_58ABC(const char *a1)
{
}

int *sub_58AF4(uint64_t a1, FILE *a2)
{
  int v4 = *__error();
  sub_58CE4(a1);
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 6_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1;
  uint64_t v5 = qword_AE4A0;
  if (qword_AE4A0) {
    uint64_t v5 = *(void *)(qword_AE4A0 + 8 * qword_AE4A8);
  }
  if (v5 != a1) {
    *(void *)(a1 + 52) = 1;
  }
  if (a2)
  {
    int v6 = fileno(a2);
    BOOL v7 = isatty(v6) > 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  *(_DWORD *)(a1 + 44) = v7;
  uint64_t result = __error();
  *uint64_t result = v4;
  return result;
}

void *sub_58B94(uint64_t a1)
{
  uint64_t result = sub_586BC();
  uint64_t v3 = qword_AE4A0;
  if (qword_AE4A0)
  {
    uint64_t v4 = qword_AE4A8;
    uint64_t v5 = *(void *)(qword_AE4A0 + 8 * qword_AE4A8);
    if (v5 == a1) {
      return result;
    }
    if (v5)
    {
      uint64_t v6 = qword_AE4B0;
      *(unsigned char *)qword_AE4B0 = byte_AE4B8;
      *(void *)(*(void *)(v3 + 8 * v4) + 16) = v6;
      *(void *)(*(void *)(v3 + 8 * v4) + 32) = qword_AE4C8;
    }
  }
  else
  {
    if (!a1) {
      return result;
    }
    uint64_t v4 = qword_AE4A8;
  }
  *(void *)(v3 + 8 * v4) = a1;
  qword_AE4C8 = *(void *)(a1 + 32);
  qword_AE4B0 = *(void *)(a1 + 16);
  qword_AE518 = qword_AE4B0;
  qword_AE500 = **(void **)(v3 + 8 * v4);
  byte_AE4B8 = *(unsigned char *)qword_AE4B0;
  return result;
}

void *sub_58C58(size_t a1)
{
  return malloc_type_malloc(a1, 0xBF065FE1uLL);
}

void sub_58C64(void **a1)
{
  if (a1)
  {
    if (qword_AE4A0) {
      uint64_t v2 = *(void ***)(qword_AE4A0 + 8 * qword_AE4A8);
    }
    else {
      uint64_t v2 = 0;
    }
    if (v2 == a1) {
      *(void *)(qword_AE4A0 + 8 * qword_AE4A8) = 0;
    }
    if (*((_DWORD *)a1 + 10)) {
      free(a1[1]);
    }
    free(a1);
  }
}

uint64_t sub_58CE4(uint64_t result)
{
  if (result)
  {
    *(void *)(result + 32) = 0;
    **(unsigned char **)(result + 8) = 0;
    *(unsigned char *)(*(void *)(result + 8) + 1) = 0;
    *(void *)(result + 16) = *(void *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    if (qword_AE4A0) {
      uint64_t v1 = *(void *)(qword_AE4A0 + 8 * qword_AE4A8);
    }
    else {
      uint64_t v1 = 0;
    }
    if (v1 == result)
    {
      uint64_t v2 = *(void *)(qword_AE4A0 + 8 * qword_AE4A8);
      qword_AE4C8 = *(void *)(v2 + 32);
      qword_AE4B0 = *(void *)(v2 + 16);
      qword_AE518 = qword_AE4B0;
      qword_AE500 = **(void **)(qword_AE4A0 + 8 * qword_AE4A8);
      byte_AE4B8 = *(unsigned char *)qword_AE4B0;
    }
  }
  return result;
}

void *sub_58D84(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = sub_586BC();
    uint64_t v2 = qword_AE4A0;
    uint64_t v3 = qword_AE4A8;
    if (qword_AE4A0)
    {
      if (*(void *)(qword_AE4A0 + 8 * qword_AE4A8))
      {
        uint64_t v4 = qword_AE4B0;
        *(unsigned char *)qword_AE4B0 = byte_AE4B8;
        *(void *)(*(void *)(v2 + 8 * v3) + 16) = v4;
        *(void *)(*(void *)(v2 + 8 * v3++) + 32) = qword_AE4C8;
        qword_AE4A8 = v3;
      }
    }
    *(void *)(v2 + 8 * v3) = v1;
    uint64_t v5 = v1[4];
    qword_AE4B0 = v1[2];
    qword_AE518 = qword_AE4B0;
    uint64_t v6 = *(uint64_t **)(v2 + 8 * v3);
    qword_AE4C8 = v5;
    qword_AE500 = *v6;
    byte_AE4B8 = *(unsigned char *)qword_AE4B0;
  }
  return result;
}

void sub_58E34()
{
  if (qword_AE4A0)
  {
    int v0 = *(void ***)(qword_AE4A0 + 8 * qword_AE4A8);
    if (v0)
    {
      sub_58C64(v0);
      uint64_t v1 = qword_AE4A0;
      uint64_t v2 = qword_AE4A8;
      *(void *)(qword_AE4A0 + 8 * qword_AE4A8) = 0;
      if (v2)
      {
        uint64_t v3 = v2 - 1;
        qword_AE4A8 = v3;
        uint64_t v4 = *(void *)(v1 + 8 * v3);
        if (v4)
        {
          qword_AE4C8 = *(void *)(v4 + 32);
          qword_AE4B0 = *(void *)(v4 + 16);
          qword_AE518 = qword_AE4B0;
          qword_AE500 = **(void **)(v1 + 8 * v3);
          byte_AE4B8 = *(unsigned char *)qword_AE4B0;
        }
      }
    }
  }
}

char *sub_58ECC(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 - 2;
  if (a2 < 2 || *(unsigned char *)(a1 + v2) || *(unsigned char *)(a2 + a1 - 1)) {
    return 0;
  }
  uint64_t v6 = (char *)malloc_type_malloc(0x48uLL, 0xBF065FE1uLL);
  if (!v6) {
    sub_58ABC("out of dynamic memory in yy_scan_buffer()");
  }
  uint64_t v4 = v6;
  *((_DWORD *)v6 + 6) = v2;
  *((void *)v6 + 1) = a1;
  *((void *)v6 + 2) = a1;
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 4) = (int)v2;
  *((void *)v6 + 5) = 0;
  *((_DWORD *)v6 + 12) = 1;
  *(void *)(v6 + 6_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 0;
  sub_58B94((uint64_t)v6);
  return v4;
}

char *sub_58F6C(char *a1)
{
  uint64_t v2 = (int)strlen(a1);

  return sub_58FA8(a1, v2);
}

char *sub_58FA8(char *a1, uint64_t a2)
{
  unint64_t v4 = a2 + 2;
  uint64_t v5 = malloc_type_malloc(a2 + 2, 0xBF065FE1uLL);
  if (!v5) {
    sub_58ABC("out of dynamic memory in yy_scan_bytes()");
  }
  if (a2)
  {
    uint64_t v6 = v5;
    uint64_t v7 = a2;
    do
    {
      char v8 = *a1++;
      *v6++ = v8;
      --v7;
    }
    while (v7);
  }
  *(_WORD *)&v5[a2] = 0;
  uint64_t result = sub_58ECC((uint64_t)v5, v4);
  if (!result) {
    sub_58ABC("bad buffer in yy_scan_bytes()");
  }
  *((_DWORD *)result + 1_TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0) = 1;
  return result;
}

uint64_t sub_59038()
{
  return dword_AE388;
}

uint64_t sub_59044()
{
  return qword_AE500;
}

uint64_t sub_59050()
{
  return qword_AE508;
}

uint64_t sub_5905C()
{
  return qword_AE520;
}

uint64_t sub_59068()
{
  return qword_AE518;
}

uint64_t sub_59074(uint64_t result)
{
  dword_AE388 = result;
  return result;
}

uint64_t sub_59080(uint64_t result)
{
  qword_AE500 = result;
  return result;
}

uint64_t sub_5908C(uint64_t result)
{
  qword_AE508 = result;
  return result;
}

uint64_t sub_59098()
{
  return dword_AE510;
}

uint64_t sub_590A4(uint64_t result)
{
  dword_AE510 = result;
  return result;
}

uint64_t sub_590B0()
{
  for (uint64_t i = (void *)qword_AE4A0; qword_AE4A0; uint64_t i = (void *)qword_AE4A0)
  {
    if (!i[qword_AE4A8]) {
      break;
    }
    sub_58C64((void **)i[qword_AE4A8]);
    *(void *)(qword_AE4A0 + 8 * qword_AE4A8) = 0;
    sub_58E34();
  }
  free(i);
  free((void *)qword_AE4D0);
  dword_AE388 = 1;
  qword_AE4A0 = 0;
  qword_AE4A8 = 0;
  qword_AE4D8 = 0;
  qword_AE4B0 = 0;
  byte_AE498 = 0;
  dword_AE49C = 0;
  dword_AE4E0 = 0;
  dword_AE4E4 = 0;
  qword_AE4D0 = 0;
  qword_AE500 = 0;
  qword_AE508 = 0;
  return 0;
}

void *sub_5917C(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0xDB05E8D7uLL);
}

void sub_59188()
{
  dword_AE49C = 1;
  dword_AE514 = 0;
}

void sub_591A0(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 2;
  _os_log_error_impl(&def_3B118, a2, OS_LOG_TYPE_ERROR, "Error: file major version %d incompatible with CURRENT_MAJOR_VERSION_NUMBER %d", (uint8_t *)v3, 0xEu);
}

void sub_5922C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&def_3B118, log, OS_LOG_TYPE_ERROR, "Unable to parse data from input file", v1, 2u);
}

void sub_59270(void *a1)
{
  [a1 cStringUsingEncoding:4];
  sub_74C0(&def_3B118, v1, v2, "Loading test cases from directory %s", v3, v4, v5, v6, 2u);
}

void sub_592F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&def_3B118, a2, OS_LOG_TYPE_ERROR, "Error loading JSON from a file : %@", (uint8_t *)&v2, 0xCu);
}

void sub_5936C(void *a1)
{
  [a1 cStringUsingEncoding:4];
  sub_74C0(&def_3B118, v1, v2, "Loading data from file %s", v3, v4, v5, v6, 2u);
}

uint64_t sub_593F0()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_59414(v0);
}

uint64_t sub_59414(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

size_t sub_59438(FILE *__stream)
{
  return fwrite("NYI", 3uLL, 1uLL, __stream);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return _CFCharacterSetGetPredefined(theSetIdentifier);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return _CFCharacterSetIsLongCharacterMember(theSet, theChar);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return _CFLocaleCreate(allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t LMLanguageModelPerformMaintenance()
{
  return _LMLanguageModelPerformMaintenance();
}

uint64_t LMStreamTokenizerCreate()
{
  return _LMStreamTokenizerCreate();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return _LMStreamTokenizerPushBytes();
}

uint64_t LMStreamTokenizerRelease()
{
  return _LMStreamTokenizerRelease();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t TIBundleForInputMode()
{
  return _TIBundleForInputMode();
}

uint64_t TICharIsAlphaNumeric()
{
  return _TICharIsAlphaNumeric();
}

uint64_t TICharIsSpace()
{
  return _TICharIsSpace();
}

uint64_t TIGetInputModeProperties()
{
  return _TIGetInputModeProperties();
}

uint64_t TIInputModeGetLanguage()
{
  return _TIInputModeGetLanguage();
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return _TIInputModeGetLanguageWithRegion();
}

uint64_t TIIsRevision_Enabled()
{
  return _TIIsRevision_Enabled();
}

uint64_t TILogProblemSentencesToStdout()
{
  return _TILogProblemSentencesToStdout();
}

uint64_t TINgramModelPathForInputMode()
{
  return _TINgramModelPathForInputMode();
}

uint64_t TIPrintTypingTranscriptToStdout()
{
  return _TIPrintTypingTranscriptToStdout();
}

uint64_t TISwearWordPolicyV1Enabled()
{
  return _TISwearWordPolicyV1Enabled();
}

uint64_t TI_SET_DIALECT_LM_PATH()
{
  return _TI_SET_DIALECT_LM_PATH();
}

uint64_t TI_SET_IS_USING_CUSTOM_DIALECT_LM()
{
  return _TI_SET_IS_USING_CUSTOM_DIALECT_LM();
}

uint64_t TI_SET_KB_USER_DIRECTORY()
{
  return _TI_SET_KB_USER_DIRECTORY();
}

uint64_t TI_SET_USING_TOUCAN_LM()
{
  return _TI_SET_USING_TOUCAN_LM();
}

uint64_t UIKeyboardDeltaLexiconPathForInputMode()
{
  return _UIKeyboardDeltaLexiconPathForInputMode();
}

uint64_t UIKeyboardDynamicDictionaryFile()
{
  return _UIKeyboardDynamicDictionaryFile();
}

uint64_t UIKeyboardGetInputModeKBStarLayout()
{
  return _UIKeyboardGetInputModeKBStarLayout();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom()
{
  return _UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom();
}

uint64_t UIKeyboardInputModeGetComponentsFromIdentifier()
{
  return _UIKeyboardInputModeGetComponentsFromIdentifier();
}

uint64_t UIKeyboardInputModeGetNormalizedLevelsFromComponents()
{
  return _UIKeyboardInputModeGetNormalizedLevelsFromComponents();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return _UIKeyboardInputModeWithNewSWLayout();
}

uint64_t UIKeyboardStaticUnigramsFile()
{
  return _UIKeyboardStaticUnigramsFile();
}

uint64_t UIKeyboardUserDirectory()
{
  return _UIKeyboardUserDirectory();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __getLexiconInfo(NSString *a1, NSString *a2, float a3)
{
  return __getLexiconInfo(a1, a2, a3);
}

uint64_t __createAndLoadLanguageModel(NSString *a1, NSString *a2, BOOL a3)
{
  return __createAndLoadLanguageModel(a1, a2, a3);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
}

uint64_t TIFitAffineMLLMatrix::identity(TIFitAffineMLLMatrix *this, unint64_t a2)
{
  return TIFitAffineMLLMatrix::identity(this, a2);
}

void TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(TIFitAffineMLLMatrix *this, const TIFitAffineMLLMatrix *a2)
{
}

void TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(TIFitAffineMLLMatrix *this, unint64_t a2, unint64_t a3)
{
}

uint64_t TIFitAffineMLLMatrix::TIFitAffineMLLMatrix()
{
  return TIFitAffineMLLMatrix::TIFitAffineMLLMatrix();
}

uint64_t TIFitAffineMLLMatrix::operator()()
{
  return TIFitAffineMLLMatrix::operator()();
}

uint64_t KB::ByteString::operator=()
{
  return KB::ByteString::operator=();
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return KB::utf8_string(this, a2);
}

uint64_t KB::AppTrieLoader::create()
{
  return KB::AppTrieLoader::create();
}

uint64_t KB::LanguageModel::clear_dynamic_learning_bundles()
{
  return KB::LanguageModel::clear_dynamic_learning_bundles();
}

uint64_t KB::StaticDictionary::load()
{
  return KB::StaticDictionary::load();
}

uint64_t KB::StaticDictionary::create(KB::StaticDictionary *this)
{
  return KB::StaticDictionary::create(this);
}

void KB::StaticDictionary::~StaticDictionary(KB::StaticDictionary *this)
{
}

uint64_t KB::DynamicDictionary::create_single(KB::DynamicDictionary *this)
{
  return KB::DynamicDictionary::create_single(this);
}

uint64_t KB::DictionaryContainer::create_multilexicon()
{
  return KB::DictionaryContainer::create_multilexicon();
}

uint64_t KB::LanguageModelConfig::LanguageModelConfig()
{
  return KB::LanguageModelConfig::LanguageModelConfig();
}

uint64_t KB::LanguageModelContext::append()
{
  return KB::LanguageModelContext::append();
}

uint64_t KB::LanguageModelContext::LanguageModelContext()
{
  return KB::LanguageModelContext::LanguageModelContext();
}

uint64_t KB::AddressBookTrieLoader::create()
{
  return KB::AddressBookTrieLoader::create();
}

uint64_t KB::LanguageModelImplStub::LanguageModelImplStub()
{
  return KB::LanguageModelImplStub::LanguageModelImplStub();
}

uint64_t KB::MutableLexiconWrapper::create(KB::MutableLexiconWrapper *a1, const KB::String *a2, const KB::String *a3)
{
  return KB::MutableLexiconWrapper::create(a1, a2, a3);
}

uint64_t KB::LanguageModelContainer::LanguageModelContainer()
{
  return KB::LanguageModelContainer::LanguageModelContainer();
}

uint64_t KB::LanguageModelLexiconGroup::set_lexicon_weight(KB::LanguageModelLexiconGroup *this, unsigned int a2, float a3)
{
  return KB::LanguageModelLexiconGroup::set_lexicon_weight(this, a2, a3);
}

uint64_t KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup()
{
  return KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
}

uint64_t KB::String::hash(KB::String *this, const char *a2, unsigned int a3)
{
  return KB::String::hash(this, a2, a3);
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return KB::String::String(this, a2);
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return KB::String::String(this, a2);
}

uint64_t KB::String::String(KB::String *this)
{
  return KB::String::String(this);
}

void KB::String::~String(KB::String *this)
{
}

uint64_t KB::String::operator=()
{
  return KB::String::operator=();
}

uint64_t TIFitAffineMLLMatrix::addRow()
{
  return TIFitAffineMLLMatrix::addRow();
}

uint64_t TIFitAffineMLLMatrix::transform(TIFitAffineMLLMatrix *this)
{
  return TIFitAffineMLLMatrix::transform(this);
}

uint64_t TIFitAffineMLLMatrix::operator*()
{
  return TIFitAffineMLLMatrix::operator*();
}

uint64_t KB::LanguageModel::id_for_static_word()
{
  return KB::LanguageModel::id_for_static_word();
}

uint64_t KB::DictionaryContainer::derive_static_words()
{
  return KB::DictionaryContainer::derive_static_words();
}

uint64_t KB::Word::capitalized_string(KB::Word *this)
{
  return KB::Word::capitalized_string(this);
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return KB::String::equal(this, a2);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
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

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_read_close()
{
  return _archive_read_close();
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

uint64_t archive_write_close()
{
  return _archive_write_close();
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

int atoi(const char *a1)
{
  return _atoi(a1);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_replaceMethod(cls, name, imp, types);
}

void clearerr(FILE *a1)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t dynamicFilePathForInputMode()
{
  return _dynamicFilePathForInputMode();
}

void exit(int a1)
{
}

float expf(float a1)
{
  return _expf(a1);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return _getc(a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

int isatty(int a1)
{
  return _isatty(a1);
}

long double log(long double __x)
{
  return _log(__x);
}

float logf(float a1)
{
  return _logf(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
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

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return _method_getImplementation(m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return _method_getTypeEncoding(m);
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

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int sgesv_(__CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return _sgesv_(__n, __nrhs, __a, __lda, __ipiv, __b, __ldb, __info);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int system(const char *a1)
{
  return _system(a1);
}

UBool u_isWhitespace(UChar32 c)
{
  return _u_isWhitespace(c);
}

UBool u_isdigit(UChar32 c)
{
  return _u_isdigit(c);
}

UBool u_ispunct(UChar32 c)
{
  return _u_ispunct(c);
}

UBool u_isspace(UChar32 c)
{
  return _u_isspace(c);
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _[a1 CGPointValue];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_JSONObjectWithStream_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithStream:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForResource_withExtension_subdirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:subdirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:relativeToURL:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__bumpTouchPathID(void *a1, const char *a2, ...)
{
  return _[a1 _bumpTouchPathID];
}

id objc_msgSend__finishKeystrokeAndRecordPredictionsInTypingLog_touchedKey_insertedKey_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishKeystrokeAndRecordPredictionsInTypingLog:touchedKey:insertedKey:typingLog:");
}

id objc_msgSend__firstLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 _firstLongCharacter];
}

id objc_msgSend__generateControlPoints_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateControlPoints:alpha:");
}

id objc_msgSend__generateTouchPointsOnPath_withSegmentTiming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateTouchPointsOnPath:withSegmentTiming:");
}

id objc_msgSend__getScalar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getScalar:");
}

id objc_msgSend__keyplaneCloserToKeyWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyplaneCloserToKeyWithString:");
}

id objc_msgSend__lastLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 _lastLongCharacter];
}

id objc_msgSend__logStringForTouchedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logStringForTouchedKey:");
}

id objc_msgSend__performAcceptCandidate_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAcceptCandidate:timestamp:typingLog:");
}

id objc_msgSend__performAcceptCandidate_timestamp_typingLog_predictiveCandidate_intendedTransliteration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:intendedTransliteration:");
}

id objc_msgSend__performAcceptPredictiveCandidate_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAcceptPredictiveCandidate:timestamp:typingLog:");
}

id objc_msgSend__performGestureKeyInput_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performGestureKeyInput:timestamp:typingLog:");
}

id objc_msgSend__performRejectCandidate_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performRejectCandidate:timestamp:typingLog:");
}

id objc_msgSend__performTapAtLocation_timestamp_fingerID_secondaryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performTapAtLocation:timestamp:fingerID:secondaryString:");
}

id objc_msgSend__performTapAtLocation_timestamp_intendedKey_touchedKey_secondaryString_touchError_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:");
}

id objc_msgSend__performTouchEvent_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performTouchEvent:typingLog:");
}

id objc_msgSend__performVariantKey_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performVariantKey:timestamp:typingLog:");
}

id objc_msgSend__pointOnCurve_atTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointOnCurve:atTime:");
}

id objc_msgSend__priorProbabilityForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_priorProbabilityForLanguage:");
}

id objc_msgSend__priorProbabilityForLanguage_recipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_priorProbabilityForLanguage:recipient:");
}

id objc_msgSend__rangeOfBackwardDeletionClusterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangeOfBackwardDeletionClusterAtIndex:");
}

id objc_msgSend__rangeOfLongCharacterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangeOfLongCharacterAtIndex:");
}

id objc_msgSend__setScalar_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setScalar:withValue:");
}

id objc_msgSend__skipTapTimestamp_intendedKey_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_skipTapTimestamp:intendedKey:typingLog:");
}

id objc_msgSend__stringWithUnichar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringWithUnichar:");
}

id objc_msgSend_abbreviatedDescription(void *a1, const char *a2, ...)
{
  return _[a1 abbreviatedDescription];
}

id objc_msgSend_accentKeyString(void *a1, const char *a2, ...)
{
  return _[a1 accentKeyString];
}

id objc_msgSend_acceptAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 acceptAutocorrection];
}

id objc_msgSend_acceptCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidate:");
}

id objc_msgSend_acceptCandidate_predictiveCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidate:predictiveCandidate:");
}

id objc_msgSend_acceptCandidateFromPredictionBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidateFromPredictionBar:");
}

id objc_msgSend_acceptCandidateInputEvent_fromCandidateBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidateInputEvent:fromCandidateBar:");
}

id objc_msgSend_acceptInputForMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptInputForMode:beforeDate:");
}

id objc_msgSend_acceptPredictiveCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPredictiveCandidate:");
}

id objc_msgSend_acceptedCandidate(void *a1, const char *a2, ...)
{
  return _[a1 acceptedCandidate];
}

id objc_msgSend_ackWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ackWithReply:");
}

id objc_msgSend_activeTouchState(void *a1, const char *a2, ...)
{
  return _[a1 activeTouchState];
}

id objc_msgSend_adaptToReceivedMessages(void *a1, const char *a2, ...)
{
  return _[a1 adaptToReceivedMessages];
}

id objc_msgSend_adaptToSentMessages(void *a1, const char *a2, ...)
{
  return _[a1 adaptToSentMessages];
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCharactersInString:");
}

id objc_msgSend_addContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContact:");
}

id objc_msgSend_addCurveToPoint_controlPoint1_controlPoint2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCurveToPoint:controlPoint1:controlPoint2:");
}

id objc_msgSend_addDebugObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDebugObject:forKey:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEntry_toLexicon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntry:toLexicon:");
}

id objc_msgSend_addError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addError:");
}

id objc_msgSend_addInput_fromVariantKey_fromGestureKey_touchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInput:fromVariantKey:fromGestureKey:touchEvent:");
}

id objc_msgSend_addInput_fromVariantKey_touchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInput:fromVariantKey:touchEvent:");
}

id objc_msgSend_addKeyWithExactString_frame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyWithExactString:frame:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPoint_andPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPoint:andPoint:");
}

id objc_msgSend_addResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResult:");
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSample:");
}

id objc_msgSend_addStringFromGestureKeyInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStringFromGestureKeyInput:");
}

id objc_msgSend_addStringFromVariantKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStringFromVariantKey:");
}

id objc_msgSend_addTextEntry_timestamp_senderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextEntry:timestamp:senderIdentifier:");
}

id objc_msgSend_addValue_withMin_withMax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:withMin:withMax:");
}

id objc_msgSend_addValue_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:withValue:");
}

id objc_msgSend_additionalIntendedTexts(void *a1, const char *a2, ...)
{
  return _[a1 additionalIntendedTexts];
}

id objc_msgSend_adjustContinuousPathCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustContinuousPathCandidate:");
}

id objc_msgSend_adjustCursorByOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustCursorByOffset:");
}

id objc_msgSend_adjustForContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 adjustForContinuousPath];
}

id objc_msgSend_adjustKeyplaneEmulatingKBStar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustKeyplaneEmulatingKBStar:");
}

id objc_msgSend_adjustPhraseBoundaryInForwardDirection_granularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustPhraseBoundaryInForwardDirection:granularity:");
}

id objc_msgSend_adjustPhraseBoundaryInForwardDirection_granularity_keyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:");
}

id objc_msgSend_advancePositionByAcceptingCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advancePositionByAcceptingCandidate:");
}

id objc_msgSend_advancePositionByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advancePositionByString:");
}

id objc_msgSend_advancePositionForAutospace(void *a1, const char *a2, ...)
{
  return _[a1 advancePositionForAutospace];
}

id objc_msgSend_advanceSegmentCursor(void *a1, const char *a2, ...)
{
  return _[a1 advanceSegmentCursor];
}

id objc_msgSend_advanceSweep(void *a1, const char *a2, ...)
{
  return _[a1 advanceSweep];
}

id objc_msgSend_aggdStatistics(void *a1, const char *a2, ...)
{
  return _[a1 aggdStatistics];
}

id objc_msgSend_alignedTypingSequenceForResult_keystrokeSegmentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignedTypingSequenceForResult:keystrokeSegmentationMode:");
}

id objc_msgSend_alignedTypingSequenceForTransliteratedResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignedTypingSequenceForTransliteratedResult:");
}

id objc_msgSend_allEvents(void *a1, const char *a2, ...)
{
  return _[a1 allEvents];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return _[a1 allResults];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alternateKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 alternateKeyplane];
}

id objc_msgSend_alternateKeyplaneName(void *a1, const char *a2, ...)
{
  return _[a1 alternateKeyplaneName];
}

id objc_msgSend_alternativeKeyForString_keyplane_preferBaseKeyVariants_preferManualShift_substituteUpperCaseForLowerCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternativeKeyForString:keyplane:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:");
}

id objc_msgSend_annotations(void *a1, const char *a2, ...)
{
  return _[a1 annotations];
}

id objc_msgSend_anyKeyForString_keyplane_wantSecondaryString_isRetyping_preferBaseKeyVariants_preferManualShift_substituteUpperCaseForLowerCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:");
}

id objc_msgSend_anyKeyForString_keyplane_wantSecondaryString_substituteUpperCaseForLowerCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendStringToFile_atFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendStringToFile:atFilePath:");
}

id objc_msgSend_applyToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyToPoint:");
}

id objc_msgSend_applyWithTyper_log_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyWithTyper:log:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayInterspersingSpaceStringsBetweenObjects(void *a1, const char *a2, ...)
{
  return _[a1 arrayInterspersingSpaceStringsBetweenObjects];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asyncPredictions(void *a1, const char *a2, ...)
{
  return _[a1 asyncPredictions];
}

id objc_msgSend_atBeginningOfText(void *a1, const char *a2, ...)
{
  return _[a1 atBeginningOfText];
}

id objc_msgSend_atEndOfText(void *a1, const char *a2, ...)
{
  return _[a1 atEndOfText];
}

id objc_msgSend_attemptTapOnKeyWithString_withErrorGenerator_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:");
}

id objc_msgSend_attemptToDelete(void *a1, const char *a2, ...)
{
  return _[a1 attemptToDelete];
}

id objc_msgSend_attemptToShift(void *a1, const char *a2, ...)
{
  return _[a1 attemptToShift];
}

id objc_msgSend_attemptToTapMoreKey(void *a1, const char *a2, ...)
{
  return _[a1 attemptToTapMoreKey];
}

id objc_msgSend_attemptToTypeIntended_expected_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeIntended:expected:typingLog:");
}

id objc_msgSend_attemptToTypeText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeText:");
}

id objc_msgSend_attemptToTypeText_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeText:typingLog:");
}

id objc_msgSend_attemptToTypeWithLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeWithLog:");
}

id objc_msgSend_autocapitalizationType(void *a1, const char *a2, ...)
{
  return _[a1 autocapitalizationType];
}

id objc_msgSend_autocorrection(void *a1, const char *a2, ...)
{
  return _[a1 autocorrection];
}

id objc_msgSend_autocorrectionList(void *a1, const char *a2, ...)
{
  return _[a1 autocorrectionList];
}

id objc_msgSend_autocorrectionType(void *a1, const char *a2, ...)
{
  return _[a1 autocorrectionType];
}

id objc_msgSend_averageActionInterval(void *a1, const char *a2, ...)
{
  return _[a1 averageActionInterval];
}

id objc_msgSend_averageKeyTapsPerSecond(void *a1, const char *a2, ...)
{
  return _[a1 averageKeyTapsPerSecond];
}

id objc_msgSend_badSentenceFilePath(void *a1, const char *a2, ...)
{
  return _[a1 badSentenceFilePath];
}

id objc_msgSend_badSentenceLogFilePath(void *a1, const char *a2, ...)
{
  return _[a1 badSentenceLogFilePath];
}

id objc_msgSend_badSentenceTranscriptFilePath(void *a1, const char *a2, ...)
{
  return _[a1 badSentenceTranscriptFilePath];
}

id objc_msgSend_baseKeyForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseKeyForString:");
}

id objc_msgSend_baseKeyForVariants(void *a1, const char *a2, ...)
{
  return _[a1 baseKeyForVariants];
}

id objc_msgSend_beginKeystrokeWithIntendedKey_touchEvent_touchError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginKeystrokeWithIntendedKey:touchEvent:touchError:");
}

id objc_msgSend_beginKeystrokeWithIntendedKey_touchEvent_touchError_documentBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginKeystrokeWithIntendedKey:touchEvent:touchError:documentBefore:");
}

id objc_msgSend_beginLogTrial(void *a1, const char *a2, ...)
{
  return _[a1 beginLogTrial];
}

id objc_msgSend_beginToken(void *a1, const char *a2, ...)
{
  return _[a1 beginToken];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_BOOLForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForProperty:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boxPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boxPoint:");
}

id objc_msgSend_bufferEmpty(void *a1, const char *a2, ...)
{
  return _[a1 bufferEmpty];
}

id objc_msgSend_bufferFull(void *a1, const char *a2, ...)
{
  return _[a1 bufferFull];
}

id objc_msgSend_buildLookupTree(void *a1, const char *a2, ...)
{
  return _[a1 buildLookupTree];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cachedCandidateForSecureCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedCandidateForSecureCandidate:");
}

id objc_msgSend_cachedKeysByKeyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedKeysByKeyName:");
}

id objc_msgSend_calcMatrix(void *a1, const char *a2, ...)
{
  return _[a1 calcMatrix];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return _[a1 callback];
}

id objc_msgSend_canBeginBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 canBeginBackspacing];
}

id objc_msgSend_canContinueBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 canContinueBackspacing];
}

id objc_msgSend_canHandleDoubleLetter(void *a1, const char *a2, ...)
{
  return _[a1 canHandleDoubleLetter];
}

id objc_msgSend_canSuggestSupplementalItemsForCurrentSelection(void *a1, const char *a2, ...)
{
  return _[a1 canSuggestSupplementalItemsForCurrentSelection];
}

id objc_msgSend_candidate(void *a1, const char *a2, ...)
{
  return _[a1 candidate];
}

id objc_msgSend_candidateBarCandidates(void *a1, const char *a2, ...)
{
  return _[a1 candidateBarCandidates];
}

id objc_msgSend_candidateByApplyingSmartPunctuationToCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateByApplyingSmartPunctuationToCandidate:");
}

id objc_msgSend_candidateByReplacingWithCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateByReplacingWithCandidate:");
}

id objc_msgSend_candidateByReplacingWithCandidate_input_rawInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateByReplacingWithCandidate:input:rawInput:");
}

id objc_msgSend_candidateRejected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateRejected:");
}

id objc_msgSend_candidateResultSet(void *a1, const char *a2, ...)
{
  return _[a1 candidateResultSet];
}

id objc_msgSend_candidateToConfirmInputString(void *a1, const char *a2, ...)
{
  return _[a1 candidateToConfirmInputString];
}

id objc_msgSend_candidateToSelectFromCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateToSelectFromCandidates:");
}

id objc_msgSend_candidateWithCandidate_forInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateWithCandidate:forInput:");
}

id objc_msgSend_candidateWithUnchangedInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateWithUnchangedInput:");
}

id objc_msgSend_candidates(void *a1, const char *a2, ...)
{
  return _[a1 candidates];
}

id objc_msgSend_candidatesForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidatesForString:");
}

id objc_msgSend_capitalizedStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capitalizedStringWithLocale:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_changeToNearestKeyplaneWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeToNearestKeyplaneWithString:");
}

id objc_msgSend_changingContextWithTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changingContextWithTrigger:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSet(void *a1, const char *a2, ...)
{
  return _[a1 characterSet];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_clearDynamicLearningCaches(void *a1, const char *a2, ...)
{
  return _[a1 clearDynamicLearningCaches];
}

id objc_msgSend_clearSoftLearning(void *a1, const char *a2, ...)
{
  return _[a1 clearSoftLearning];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentifier];
}

id objc_msgSend_clonedKeyboardState(void *a1, const char *a2, ...)
{
  return _[a1 clonedKeyboardState];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return _[a1 closeFile];
}

id objc_msgSend_closeRequestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeRequestToken:");
}

id objc_msgSend_collectAggdStatisticsForResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectAggdStatisticsForResult:");
}

id objc_msgSend_commitText(void *a1, const char *a2, ...)
{
  return _[a1 commitText];
}

id objc_msgSend_commitsAcceptedCandidate(void *a1, const char *a2, ...)
{
  return _[a1 commitsAcceptedCandidate];
}

id objc_msgSend_committedText(void *a1, const char *a2, ...)
{
  return _[a1 committedText];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_range_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:range:locale:");
}

id objc_msgSend_compareExpectedValue_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareExpectedValue:withResult:");
}

id objc_msgSend_componentName(void *a1, const char *a2, ...)
{
  return _[a1 componentName];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeTranslations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeTranslations:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _[a1 config];
}

id objc_msgSend_configurationPropertyList(void *a1, const char *a2, ...)
{
  return _[a1 configurationPropertyList];
}

id objc_msgSend_configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:");
}

id objc_msgSend_configureWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithParameters:");
}

id objc_msgSend_consumeTestFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeTestFile:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextAfterInput(void *a1, const char *a2, ...)
{
  return _[a1 contextAfterInput];
}

id objc_msgSend_contextBeforeInput(void *a1, const char *a2, ...)
{
  return _[a1 contextBeforeInput];
}

id objc_msgSend_continuousPathState(void *a1, const char *a2, ...)
{
  return _[a1 continuousPathState];
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return _[a1 conversation];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_corpusId(void *a1, const char *a2, ...)
{
  return _[a1 corpusId];
}

id objc_msgSend_corrected(void *a1, const char *a2, ...)
{
  return _[a1 corrected];
}

id objc_msgSend_correctedTransliterationSequence(void *a1, const char *a2, ...)
{
  return _[a1 correctedTransliterationSequence];
}

id objc_msgSend_corrections(void *a1, const char *a2, ...)
{
  return _[a1 corrections];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countEvent:");
}

id objc_msgSend_countEvent_filteredWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countEvent:filteredWithPredicate:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_cpRequestTokenLock(void *a1, const char *a2, ...)
{
  return _[a1 cpRequestTokenLock];
}

id objc_msgSend_createAutofillTestHarnessInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAutofillTestHarnessInstance:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createKeyboardInputManagerWrapper(void *a1, const char *a2, ...)
{
  return _[a1 createKeyboardInputManagerWrapper];
}

id objc_msgSend_createTTKPlane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTTKPlane:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_currentAndNextKeysAreTransposable(void *a1, const char *a2, ...)
{
  return _[a1 currentAndNextKeysAreTransposable];
}

id objc_msgSend_currentComposedCharacter(void *a1, const char *a2, ...)
{
  return _[a1 currentComposedCharacter];
}

id objc_msgSend_currentExternalSegment(void *a1, const char *a2, ...)
{
  return _[a1 currentExternalSegment];
}

id objc_msgSend_currentInternalSegment(void *a1, const char *a2, ...)
{
  return _[a1 currentInternalSegment];
}

id objc_msgSend_currentKeystroke(void *a1, const char *a2, ...)
{
  return _[a1 currentKeystroke];
}

id objc_msgSend_currentKeystrokeSequence(void *a1, const char *a2, ...)
{
  return _[a1 currentKeystrokeSequence];
}

id objc_msgSend_currentLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 currentLongCharacter];
}

id objc_msgSend_currentPartfileArchivePath(void *a1, const char *a2, ...)
{
  return _[a1 currentPartfileArchivePath];
}

id objc_msgSend_currentRequestToken(void *a1, const char *a2, ...)
{
  return _[a1 currentRequestToken];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_cursor(void *a1, const char *a2, ...)
{
  return _[a1 cursor];
}

id objc_msgSend_customInfoType(void *a1, const char *a2, ...)
{
  return _[a1 customInfoType];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_debugData(void *a1, const char *a2, ...)
{
  return _[a1 debugData];
}

id objc_msgSend_debugValues(void *a1, const char *a2, ...)
{
  return _[a1 debugValues];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFloatForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decomposeDiphthong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeDiphthong:");
}

id objc_msgSend_decomposeDoublePatchim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeDoublePatchim:");
}

id objc_msgSend_decomposeHangul_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeHangul:");
}

id objc_msgSend_decomposeHangulSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeHangulSequence:");
}

id objc_msgSend_decomposeInputString(void *a1, const char *a2, ...)
{
  return _[a1 decomposeInputString];
}

id objc_msgSend_decomposedStringWithCanonicalMapping(void *a1, const char *a2, ...)
{
  return _[a1 decomposedStringWithCanonicalMapping];
}

id objc_msgSend_defaultCandidate(void *a1, const char *a2, ...)
{
  return _[a1 defaultCandidate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteBackwards(void *a1, const char *a2, ...)
{
  return _[a1 deleteBackwards];
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCharactersInRange:");
}

id objc_msgSend_deleteInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInput:");
}

id objc_msgSend_deleteText_rawText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteText:rawText:");
}

id objc_msgSend_deletionCount(void *a1, const char *a2, ...)
{
  return _[a1 deletionCount];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableForTesting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableForTesting:");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return _[a1 displayString];
}

id objc_msgSend_displayStringOverrideForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStringOverrideForKey:");
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return _[a1 displayType];
}

id objc_msgSend_distanceBetween_andPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceBetween:andPoint:");
}

id objc_msgSend_distanceFromKey_toPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromKey:toPoint:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_distributions(void *a1, const char *a2, ...)
{
  return _[a1 distributions];
}

id objc_msgSend_divideKeyplane_intoLeft_right_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "divideKeyplane:intoLeft:right:");
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return _[a1 document];
}

id objc_msgSend_documentEditRangeWithSegmentRangePtr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentEditRangeWithSegmentRangePtr:");
}

id objc_msgSend_documentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 documentIdentifier];
}

id objc_msgSend_documentIsEmpty(void *a1, const char *a2, ...)
{
  return _[a1 documentIsEmpty];
}

id objc_msgSend_documentState(void *a1, const char *a2, ...)
{
  return _[a1 documentState];
}

id objc_msgSend_documentStateAfterCursorAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentStateAfterCursorAdjustment:");
}

id objc_msgSend_documentStateAfterSettingMarkedText_selectedRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentStateAfterSettingMarkedText:selectedRange:");
}

id objc_msgSend_documentStateWithContextBefore_selectedText_contextAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentStateWithContextBefore:selectedText:contextAfter:");
}

id objc_msgSend_documentStates(void *a1, const char *a2, ...)
{
  return _[a1 documentStates];
}

id objc_msgSend_doesMatchResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesMatchResult:");
}

id objc_msgSend_doesSupportInlineCompletion(void *a1, const char *a2, ...)
{
  return _[a1 doesSupportInlineCompletion];
}

id objc_msgSend_dotProduct_andPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dotProduct:andPoint:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dragged(void *a1, const char *a2, ...)
{
  return _[a1 dragged];
}

id objc_msgSend_dropInput(void *a1, const char *a2, ...)
{
  return _[a1 dropInput];
}

id objc_msgSend_dslTestDriver(void *a1, const char *a2, ...)
{
  return _[a1 dslTestDriver];
}

id objc_msgSend_dynamicKeyboardForName_size_isLandscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicKeyboardForName:size:isLandscape:");
}

id objc_msgSend_dynamicResourcePath(void *a1, const char *a2, ...)
{
  return _[a1 dynamicResourcePath];
}

id objc_msgSend_emojiLastUsageTime(void *a1, const char *a2, ...)
{
  return _[a1 emojiLastUsageTime];
}

id objc_msgSend_emojiList(void *a1, const char *a2, ...)
{
  return _[a1 emojiList];
}

id objc_msgSend_emptyResultForPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyResultForPlayback:");
}

id objc_msgSend_emptyResultForTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyResultForTest:");
}

id objc_msgSend_emptyTouchEventForLogging(void *a1, const char *a2, ...)
{
  return _[a1 emptyTouchEventForLogging];
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeFloat:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endLogTrial(void *a1, const char *a2, ...)
{
  return _[a1 endLogTrial];
}

id objc_msgSend_enumerateKeyplaneNamesAdjacentToKeyplane_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeyplaneNamesAdjacentToKeyplane:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateKeysUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysUsingBlock:");
}

id objc_msgSend_enumerateKeystrokesAndPathsForTokensWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeystrokesAndPathsForTokensWithBlock:");
}

id objc_msgSend_enumerateLinesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLinesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateRemainingLongCharactersForCurrentSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRemainingLongCharactersForCurrentSegment:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_enumerateTagsInRange_scheme_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateTagsInRange:scheme:options:usingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorForKeyString_rect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorForKeyString:rect:");
}

id objc_msgSend_errorGenerator(void *a1, const char *a2, ...)
{
  return _[a1 errorGenerator];
}

id objc_msgSend_errorGeneratorWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorGeneratorWithAttributes:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithErrorVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithErrorVector:");
}

id objc_msgSend_eventsWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventsWithName:");
}

id objc_msgSend_exactKeyForString_keyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exactKeyForString:keyplane:");
}

id objc_msgSend_exactKeyForString_keyplane_includeSecondaryStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exactKeyForString:keyplane:includeSecondaryStrings:");
}

id objc_msgSend_expected(void *a1, const char *a2, ...)
{
  return _[a1 expected];
}

id objc_msgSend_expectedOutput(void *a1, const char *a2, ...)
{
  return _[a1 expectedOutput];
}

id objc_msgSend_expectsAppendedSpaceToContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 expectsAppendedSpaceToContinuousPath];
}

id objc_msgSend_externalSegments(void *a1, const char *a2, ...)
{
  return _[a1 externalSegments];
}

id objc_msgSend_externalStringToInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalStringToInternal:");
}

id objc_msgSend_extractDataFromTypingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractDataFromTypingLog:");
}

id objc_msgSend_failedTests(void *a1, const char *a2, ...)
{
  return _[a1 failedTests];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return _[a1 fileHandleWithStandardOutput];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLForTrial_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLForTrial:withOptions:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileVersion(void *a1, const char *a2, ...)
{
  return _[a1 fileVersion];
}

id objc_msgSend_filterWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithBlock:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredNamedEntitiesFromJSONDonations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredNamedEntitiesFromJSONDonations:");
}

id objc_msgSend_findKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findKey:");
}

id objc_msgSend_findPartialCandidate(void *a1, const char *a2, ...)
{
  return _[a1 findPartialCandidate];
}

id objc_msgSend_fingerID(void *a1, const char *a2, ...)
{
  return _[a1 fingerID];
}

id objc_msgSend_finishKeystrokeWithTouchedKey_touchEvent_insertedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:");
}

id objc_msgSend_finishKeystrokeWithTouchedKey_touchEvent_insertedKey_predictionBarState_inlineCompletionBarState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_firstCachedKeyWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstCachedKeyWithName:");
}

id objc_msgSend_firstCandidate(void *a1, const char *a2, ...)
{
  return _[a1 firstCandidate];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstTap(void *a1, const char *a2, ...)
{
  return _[a1 firstTap];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flushBufferWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushBufferWithCompletionHandler:");
}

id objc_msgSend_flushDynamicLearningCaches(void *a1, const char *a2, ...)
{
  return _[a1 flushDynamicLearningCaches];
}

id objc_msgSend_flushThreshold(void *a1, const char *a2, ...)
{
  return _[a1 flushThreshold];
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return _[a1 force];
}

id objc_msgSend_forcedKeyCode(void *a1, const char *a2, ...)
{
  return _[a1 forcedKeyCode];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_friendId(void *a1, const char *a2, ...)
{
  return _[a1 friendId];
}

id objc_msgSend_fromJsonDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromJsonDict:");
}

id objc_msgSend_fromUserData(void *a1, const char *a2, ...)
{
  return _[a1 fromUserData];
}

id objc_msgSend_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_isContinuousPath_withAvailableApps_logBlock_async_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAndRenderProactiveSuggestionsWithTriggers:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:isContinuousPath:withAvailableApps:logBlock:async:completion:");
}

id objc_msgSend_generateAngularTiming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAngularTiming:");
}

id objc_msgSend_generateAutocorrectionsOrCandidates(void *a1, const char *a2, ...)
{
  return _[a1 generateAutocorrectionsOrCandidates];
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:");
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_candidateRange_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:");
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:");
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:completionHandler:");
}

id objc_msgSend_generateAutocorrectionsWithShiftState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithShiftState:");
}

id objc_msgSend_generateCandidatesWithKeyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCandidatesWithKeyboardState:");
}

id objc_msgSend_generateCandidatesWithKeyboardState_candidateRange_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCandidatesWithKeyboardState:candidateRange:completionHandler:");
}

id objc_msgSend_generateEquidistantTiming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateEquidistantTiming:");
}

id objc_msgSend_generateInflections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateInflections:");
}

id objc_msgSend_generateKeyCentersFromKeys_string_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateKeyCentersFromKeys:string:layout:");
}

id objc_msgSend_generateKeysFromString_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateKeysFromString:layout:");
}

id objc_msgSend_generatePathFromInflectionPoints_timestamp_duration_segmentTiming_keys_string_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:");
}

id objc_msgSend_generatePathFromInflectionPoints_timestamp_segmentTiming_keys_string_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:");
}

id objc_msgSend_generatePathFromString_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromString:layout:");
}

id objc_msgSend_generatePathFromString_timestamp_duration_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromString:timestamp:duration:layout:");
}

id objc_msgSend_generatePathFromString_timestamp_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromString:timestamp:layout:");
}

id objc_msgSend_generateReplacementsForString_keyLayout_continuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateReplacementsForString:keyLayout:continuation:");
}

id objc_msgSend_generateTimingArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateTimingArray:");
}

id objc_msgSend_generatesCandidates(void *a1, const char *a2, ...)
{
  return _[a1 generatesCandidates];
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getDebugData(void *a1, const char *a2, ...)
{
  return _[a1 getDebugData];
}

id objc_msgSend_getDebugObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDebugObject:");
}

id objc_msgSend_getDistributionObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDistributionObject:");
}

id objc_msgSend_getEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEntries:");
}

id objc_msgSend_getNextTestCase(void *a1, const char *a2, ...)
{
  return _[a1 getNextTestCase];
}

id objc_msgSend_getScalar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getScalar:");
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:");
}

id objc_msgSend_getValue_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:size:");
}

id objc_msgSend_globalBias(void *a1, const char *a2, ...)
{
  return _[a1 globalBias];
}

id objc_msgSend_handleAcceptedCandidate_keyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAcceptedCandidate:keyboardState:completionHandler:");
}

id objc_msgSend_handleBoolConfig_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleBoolConfig:withValue:lineNumber:");
}

id objc_msgSend_handleCommand_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCommand:withValue:lineNumber:");
}

id objc_msgSend_handleCorrectionMatch_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCorrectionMatch:lineNumber:");
}

id objc_msgSend_handleDocumentMatch_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDocumentMatch:lineNumber:");
}

id objc_msgSend_handleIntConfig_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIntConfig:withValue:lineNumber:");
}

id objc_msgSend_handleKeyboardInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyboardInput:");
}

id objc_msgSend_handleKeyboardInput_keyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyboardInput:keyboardState:completionHandler:");
}

id objc_msgSend_handleNewLine(void *a1, const char *a2, ...)
{
  return _[a1 handleNewLine];
}

id objc_msgSend_handlePredictionMatch_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePredictionMatch:lineNumber:");
}

id objc_msgSend_handleStringConfig_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStringConfig:withValue:lineNumber:");
}

id objc_msgSend_handleTyping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTyping:");
}

id objc_msgSend_hardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return _[a1 hardwareKeyboardMode];
}

id objc_msgSend_hasDesiredAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 hasDesiredAutocorrection];
}

id objc_msgSend_hasPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrediction:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_inPartialCandidateSelection(void *a1, const char *a2, ...)
{
  return _[a1 inPartialCandidateSelection];
}

id objc_msgSend_index1(void *a1, const char *a2, ...)
{
  return _[a1 index1];
}

id objc_msgSend_index2(void *a1, const char *a2, ...)
{
  return _[a1 index2];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:");
}

id objc_msgSend_init_inputMode_layouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:inputMode:layouts:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributes:");
}

id objc_msgSend_initWithAutocorrection_alternateCorrections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAutocorrection:alternateCorrections:");
}

id objc_msgSend_initWithBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBuildVersion:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCandidate_forInput_rawInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:forInput:rawInput:");
}

id objc_msgSend_initWithCandidate_forInput_rawInput_wordOriginFeedbackID_usageTrackingMask_sourceMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:");
}

id objc_msgSend_initWithCandidate_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:timestamp:");
}

id objc_msgSend_initWithCandidate_timestamp_intendedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:timestamp:intendedCandidate:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:");
}

id objc_msgSend_initWithConfig_keyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:keyboardState:");
}

id objc_msgSend_initWithConfig_keyboardState_languageSelectionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:keyboardState:languageSelectionController:");
}

id objc_msgSend_initWithContactCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContactCollection:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithContextBefore_markedText_selectedText_contextAfter_selectedRangeInMarkedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:");
}

id objc_msgSend_initWithCreationDate_withLastUpdateDate_withKey_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCreationDate:withLastUpdateDate:withKey:withValue:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDebug_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDebug:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithErrorVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithErrorVector:");
}

id objc_msgSend_initWithFirstName_phoneticFirstName_middleName_phoneticMiddleName_lastName_phoneticLastName_organizationName_jobTitle_nickname_relations_streets_cities_score_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relations:streets:cities:score:");
}

id objc_msgSend_initWithFirstTap_secondTap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstTap:secondTap:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInputMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputMode:");
}

id objc_msgSend_initWithInputMode_keyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputMode:keyboardState:");
}

id objc_msgSend_initWithIntendedKey_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedKey:timestamp:");
}

id objc_msgSend_initWithIntendedKey_touchedKey_error_location_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedKey:touchedKey:error:location:timestamp:");
}

id objc_msgSend_initWithIntendedKey_touchedKey_error_location_timestamp_secondaryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:");
}

id objc_msgSend_initWithIntendedString_repeatLimit_timeout_badSentencePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedString:repeatLimit:timeout:badSentencePath:");
}

id objc_msgSend_initWithIntendedText_additionalIntendedTexts_touchDataCollection_recordID_layoutName_inputText_transliteration_context_annotations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedText:additionalIntendedTexts:touchDataCollection:recordID:layoutName:inputText:transliteration:context:annotations:");
}

id objc_msgSend_initWithInternalSegments_externalSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternalSegments:externalSegments:");
}

id objc_msgSend_initWithJsonDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJsonDictionary:");
}

id objc_msgSend_initWithKey_inputMode_value_secondaryValue_realValue_properties_creationDate_lastUpdateDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:");
}

id objc_msgSend_initWithLanguageLikelihoodModel_preferenceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguageLikelihoodModel:preferenceProvider:");
}

id objc_msgSend_initWithLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLayout:");
}

id objc_msgSend_initWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocale:");
}

id objc_msgSend_initWithMetadata_records_intendedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadata:records:intendedText:");
}

id objc_msgSend_initWithModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModel:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithOptionsAndTestTyper_testTyper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptionsAndTestTyper:testTyper:");
}

id objc_msgSend_initWithOutputPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputPath:");
}

id objc_msgSend_initWithOutputURL_flushThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputURL:flushThreshold:");
}

id objc_msgSend_initWithParameters_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:delegate:");
}

id objc_msgSend_initWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParams:");
}

id objc_msgSend_initWithPath_intendedString_keyplane_fromUserData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:intendedString:keyplane:fromUserData:");
}

id objc_msgSend_initWithPathFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPathFile:");
}

id objc_msgSend_initWithPersonaName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonaName:");
}

id objc_msgSend_initWithPoint_timeStamp_force_radius_stage_pathIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPoint:timeStamp:force:radius:stage:pathIndex:");
}

id objc_msgSend_initWithPreferredSecondaryInputMode_userEnabledInputModes_userPreferredLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredSecondaryInputMode:userEnabledInputModes:userPreferredLanguages:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithRecipientIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipientIdentifiers:");
}

id objc_msgSend_initWithRecipientIdentifiers_senderIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipientIdentifiers:senderIdentifiers:");
}

id objc_msgSend_initWithRelevanceScoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRelevanceScoreType:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithString_frame_keyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:frame:keyCode:");
}

id objc_msgSend_initWithTagSchemes_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTagSchemes:options:");
}

id objc_msgSend_initWithTestTyper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestTyper:");
}

id objc_msgSend_initWithTests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTests:");
}

id objc_msgSend_initWithTimestamp_withKey_withInputMode_withValue_withSecondaryValue_withRealValue_withProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:");
}

id objc_msgSend_initWithTouchedKey_location_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTouchedKey:location:timestamp:");
}

id objc_msgSend_initWithTransientData_namedEntities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransientData:namedEntities:");
}

id objc_msgSend_initWithTypologyPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTypologyPreferences:");
}

id objc_msgSend_initWithUIKBTree_layoutUtils_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUIKBTree:layoutUtils:");
}

id objc_msgSend_initialDragPoint(void *a1, const char *a2, ...)
{
  return _[a1 initialDragPoint];
}

id objc_msgSend_initializeConversationHistory(void *a1, const char *a2, ...)
{
  return _[a1 initializeConversationHistory];
}

id objc_msgSend_inlineCompletion(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletion];
}

id objc_msgSend_inlineCompletionBarState(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletionBarState];
}

id objc_msgSend_inlineCompletionCandidates(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletionCandidates];
}

id objc_msgSend_inlineCompletionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletionEnabled];
}

id objc_msgSend_inlineCompletions(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletions];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _[a1 input];
}

id objc_msgSend_inputContextHistory(void *a1, const char *a2, ...)
{
  return _[a1 inputContextHistory];
}

id objc_msgSend_inputIsPunctuationFollowingContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 inputIsPunctuationFollowingContinuousPath];
}

id objc_msgSend_inputManager(void *a1, const char *a2, ...)
{
  return _[a1 inputManager];
}

id objc_msgSend_inputManagerClass(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerClass];
}

id objc_msgSend_inputManagerLogger(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerLogger];
}

id objc_msgSend_inputManagerState(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerState];
}

id objc_msgSend_inputManagerWrapper(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerWrapper];
}

id objc_msgSend_inputMode(void *a1, const char *a2, ...)
{
  return _[a1 inputMode];
}

id objc_msgSend_inputModeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 inputModeIdentifier];
}

id objc_msgSend_inputModeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputModeWithIdentifier:");
}

id objc_msgSend_inputModeWithIdentifier_isSiriMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputModeWithIdentifier:isSiriMode:");
}

id objc_msgSend_inputSegment(void *a1, const char *a2, ...)
{
  return _[a1 inputSegment];
}

id objc_msgSend_inputSegmentsForContinuousPathString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputSegmentsForContinuousPathString:");
}

id objc_msgSend_inputSegmentsForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputSegmentsForString:");
}

id objc_msgSend_inputStreamWithFileAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithFileAtPath:");
}

id objc_msgSend_inputString(void *a1, const char *a2, ...)
{
  return _[a1 inputString];
}

id objc_msgSend_inputText(void *a1, const char *a2, ...)
{
  return _[a1 inputText];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertText:");
}

id objc_msgSend_insertTextAfterSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertTextAfterSelection:");
}

id objc_msgSend_inserted(void *a1, const char *a2, ...)
{
  return _[a1 inserted];
}

id objc_msgSend_insertedKey(void *a1, const char *a2, ...)
{
  return _[a1 insertedKey];
}

id objc_msgSend_insertionText(void *a1, const char *a2, ...)
{
  return _[a1 insertionText];
}

id objc_msgSend_insertsSpaceAfterPredictiveInput(void *a1, const char *a2, ...)
{
  return _[a1 insertsSpaceAfterPredictiveInput];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intended(void *a1, const char *a2, ...)
{
  return _[a1 intended];
}

id objc_msgSend_intendedKey(void *a1, const char *a2, ...)
{
  return _[a1 intendedKey];
}

id objc_msgSend_intendedString(void *a1, const char *a2, ...)
{
  return _[a1 intendedString];
}

id objc_msgSend_intendedText(void *a1, const char *a2, ...)
{
  return _[a1 intendedText];
}

id objc_msgSend_intendedTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 intendedTransliteration];
}

id objc_msgSend_intendedTransliterationSequence(void *a1, const char *a2, ...)
{
  return _[a1 intendedTransliterationSequence];
}

id objc_msgSend_interTouchTimestampInterval(void *a1, const char *a2, ...)
{
  return _[a1 interTouchTimestampInterval];
}

id objc_msgSend_interactionType(void *a1, const char *a2, ...)
{
  return _[a1 interactionType];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intermediateText(void *a1, const char *a2, ...)
{
  return _[a1 intermediateText];
}

id objc_msgSend_intermediateTextWithInputString_displayString_selectionLocation_lastInputString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intermediateTextWithInputString:displayString:selectionLocation:lastInputString:");
}

id objc_msgSend_internalSegments(void *a1, const char *a2, ...)
{
  return _[a1 internalSegments];
}

id objc_msgSend_internalStringToExternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalStringToExternal:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAlphabeticPlane(void *a1, const char *a2, ...)
{
  return _[a1 isAlphabeticPlane];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isAutocompleteTriggerForPreviousEntry(void *a1, const char *a2, ...)
{
  return _[a1 isAutocompleteTriggerForPreviousEntry];
}

id objc_msgSend_isAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 isAutocorrection];
}

id objc_msgSend_isAutoshifted(void *a1, const char *a2, ...)
{
  return _[a1 isAutoshifted];
}

id objc_msgSend_isBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 isBackspacing];
}

id objc_msgSend_isContinuousPathConversion(void *a1, const char *a2, ...)
{
  return _[a1 isContinuousPathConversion];
}

id objc_msgSend_isContinuousPathNonSpacePunctuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContinuousPathNonSpacePunctuation:");
}

id objc_msgSend_isDebugEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isDebugEnabled];
}

id objc_msgSend_isDoubleSpace(void *a1, const char *a2, ...)
{
  return _[a1 isDoubleSpace];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFlick(void *a1, const char *a2, ...)
{
  return _[a1 isFlick];
}

id objc_msgSend_isForShortcutConversion(void *a1, const char *a2, ...)
{
  return _[a1 isForShortcutConversion];
}

id objc_msgSend_isKanaPlane(void *a1, const char *a2, ...)
{
  return _[a1 isKanaPlane];
}

id objc_msgSend_isKeyStringAboveSpaceBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyStringAboveSpaceBar:");
}

id objc_msgSend_isKeyplane_alternateOfKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyplane:alternateOfKeyplane:");
}

id objc_msgSend_isKeyplane_shiftAlternateOfKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyplane:shiftAlternateOfKeyplane:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMatchForKey_forInputMode_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchForKey:forInputMode:sinceDate:");
}

id objc_msgSend_isMatchForKeyPrefix_forInputMode_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchForKeyPrefix:forInputMode:sinceDate:");
}

id objc_msgSend_isMatchForKeyPrefix_forInputMode_weeklyKeySuffixes_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchForKeyPrefix:forInputMode:weeklyKeySuffixes:endDate:");
}

id objc_msgSend_isMatchSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchSinceDate:");
}

id objc_msgSend_isPathableWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPathableWord:");
}

id objc_msgSend_isPopupVariant(void *a1, const char *a2, ...)
{
  return _[a1 isPopupVariant];
}

id objc_msgSend_isRetyping(void *a1, const char *a2, ...)
{
  return _[a1 isRetyping];
}

id objc_msgSend_isRevisedAutocompleteEntry(void *a1, const char *a2, ...)
{
  return _[a1 isRevisedAutocompleteEntry];
}

id objc_msgSend_isSameRequestAs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameRequestAs:");
}

id objc_msgSend_isScreenLocked(void *a1, const char *a2, ...)
{
  return _[a1 isScreenLocked];
}

id objc_msgSend_isSecureContentCandidate(void *a1, const char *a2, ...)
{
  return _[a1 isSecureContentCandidate];
}

id objc_msgSend_isShiftKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 isShiftKeyplane];
}

id objc_msgSend_isShifted(void *a1, const char *a2, ...)
{
  return _[a1 isShifted];
}

id objc_msgSend_isSiriMode(void *a1, const char *a2, ...)
{
  return _[a1 isSiriMode];
}

id objc_msgSend_jsonFrameArrayForWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonFrameArrayForWord:");
}

id objc_msgSend_justAcceptedAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 justAcceptedAutocorrection];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyCodeWithString_inKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyCodeWithString:inKeyplane:");
}

id objc_msgSend_keyContainingPoint_inKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyContainingPoint:inKeyplane:");
}

id objc_msgSend_keyLayout(void *a1, const char *a2, ...)
{
  return _[a1 keyLayout];
}

id objc_msgSend_keyOverrides(void *a1, const char *a2, ...)
{
  return _[a1 keyOverrides];
}

id objc_msgSend_keyToAccessKeyplane_fromKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyToAccessKeyplane:fromKeyplane:");
}

id objc_msgSend_keyToAccessKeyplaneCloserToKeyString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyToAccessKeyplaneCloserToKeyString:");
}

id objc_msgSend_keyWithString_inKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithString:inKeyplane:");
}

id objc_msgSend_keyboard(void *a1, const char *a2, ...)
{
  return _[a1 keyboard];
}

id objc_msgSend_keyboardController(void *a1, const char *a2, ...)
{
  return _[a1 keyboardController];
}

id objc_msgSend_keyboardFeatureSpecializationClassFromInputModeProperties(void *a1, const char *a2, ...)
{
  return _[a1 keyboardFeatureSpecializationClassFromInputModeProperties];
}

id objc_msgSend_keyboardFromWidth_useDynamicLayout_orientation_keyboardLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardFromWidth:useDynamicLayout:orientation:keyboardLayout:");
}

id objc_msgSend_keyboardInfoDelgate(void *a1, const char *a2, ...)
{
  return _[a1 keyboardInfoDelgate];
}

id objc_msgSend_keyboardInputManagerFactory(void *a1, const char *a2, ...)
{
  return _[a1 keyboardInputManagerFactory];
}

id objc_msgSend_keyboardOrientation(void *a1, const char *a2, ...)
{
  return _[a1 keyboardOrientation];
}

id objc_msgSend_keyboardPrefixForWidth_andEdge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardPrefixForWidth:andEdge:");
}

id objc_msgSend_keyboardScreenReferenceSize(void *a1, const char *a2, ...)
{
  return _[a1 keyboardScreenReferenceSize];
}

id objc_msgSend_keyboardState(void *a1, const char *a2, ...)
{
  return _[a1 keyboardState];
}

id objc_msgSend_keyboardSuffixForScreenDimensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardSuffixForScreenDimensions:");
}

id objc_msgSend_keyboardWidth(void *a1, const char *a2, ...)
{
  return _[a1 keyboardWidth];
}

id objc_msgSend_keyboardWithName_inCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardWithName:inCache:");
}

id objc_msgSend_keyplane(void *a1, const char *a2, ...)
{
  return _[a1 keyplane];
}

id objc_msgSend_keyplaneHeightForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyplaneHeightForKeys:");
}

id objc_msgSend_keyplaneSizeForLayout_screenTraits_keyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyplaneSizeForLayout:screenTraits:keyboardType:");
}

id objc_msgSend_keyplaneWidthForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyplaneWidthForKeys:");
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return _[a1 keys];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_keystrokeRecord(void *a1, const char *a2, ...)
{
  return _[a1 keystrokeRecord];
}

id objc_msgSend_keystrokesForTokens(void *a1, const char *a2, ...)
{
  return _[a1 keystrokesForTokens];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_languageForOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageForOptions:");
}

id objc_msgSend_languageWithRegion(void *a1, const char *a2, ...)
{
  return _[a1 languageWithRegion];
}

id objc_msgSend_lastActionSuppressesError(void *a1, const char *a2, ...)
{
  return _[a1 lastActionSuppressesError];
}

id objc_msgSend_lastActionUseSecondaryString(void *a1, const char *a2, ...)
{
  return _[a1 lastActionUseSecondaryString];
}

id objc_msgSend_lastAndCurrentKeysAreSame(void *a1, const char *a2, ...)
{
  return _[a1 lastAndCurrentKeysAreSame];
}

id objc_msgSend_lastCPRequestToken(void *a1, const char *a2, ...)
{
  return _[a1 lastCPRequestToken];
}

id objc_msgSend_lastCursorPositionForTransliteratedCandidate(void *a1, const char *a2, ...)
{
  return _[a1 lastCursorPositionForTransliteratedCandidate];
}

id objc_msgSend_lastInputWasContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 lastInputWasContinuousPath];
}

id objc_msgSend_lastInputWasSelection(void *a1, const char *a2, ...)
{
  return _[a1 lastInputWasSelection];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastTimestamp];
}

id objc_msgSend_lastTouchEvent(void *a1, const char *a2, ...)
{
  return _[a1 lastTouchEvent];
}

id objc_msgSend_lastUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 lastUpdateDate];
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return _[a1 layout];
}

id objc_msgSend_layoutName(void *a1, const char *a2, ...)
{
  return _[a1 layoutName];
}

id objc_msgSend_layoutState(void *a1, const char *a2, ...)
{
  return _[a1 layoutState];
}

id objc_msgSend_layoutUtils(void *a1, const char *a2, ...)
{
  return _[a1 layoutUtils];
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return _[a1 layouts];
}

id objc_msgSend_learnWordContextIndex(void *a1, const char *a2, ...)
{
  return _[a1 learnWordContextIndex];
}

id objc_msgSend_leftKeys(void *a1, const char *a2, ...)
{
  return _[a1 leftKeys];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 letterCharacterSet];
}

id objc_msgSend_lexiconLocale(void *a1, const char *a2, ...)
{
  return _[a1 lexiconLocale];
}

id objc_msgSend_linguisticTagger(void *a1, const char *a2, ...)
{
  return _[a1 linguisticTagger];
}

id objc_msgSend_linkWithUserActionStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkWithUserActionStream:");
}

id objc_msgSend_listWithCorrections_predictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listWithCorrections:predictions:");
}

id objc_msgSend_listWithCorrections_predictions_emojiList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listWithCorrections:predictions:emojiList:");
}

id objc_msgSend_loadFromDir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromDir:");
}

id objc_msgSend_loadFromFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromFile:");
}

id objc_msgSend_loadFromFile_inputMode_layouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromFile:inputMode:layouts:");
}

id objc_msgSend_loadFromPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromPath:");
}

id objc_msgSend_loadFromPath_fileManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromPath:fileManager:");
}

id objc_msgSend_loadFromPlaybackFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromPlaybackFile:");
}

id objc_msgSend_loadFromSentence_withCatenation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromSentence:withCatenation:");
}

id objc_msgSend_loadFromTextInputFile_withCatenation_addWordSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromTextInputFile:withCatenation:addWordSpacing:");
}

id objc_msgSend_loadLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadLayouts:");
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_localeIdentifierForLanguage(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifierForLanguage];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logAcceptedCandidate_intendedTransliterationCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAcceptedCandidate:intendedTransliterationCandidate:");
}

id objc_msgSend_logAutocorrectionInserted(void *a1, const char *a2, ...)
{
  return _[a1 logAutocorrectionInserted];
}

id objc_msgSend_logRejectedAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 logRejectedAutocorrection];
}

id objc_msgSend_logResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logResult:");
}

id objc_msgSend_logSerializationQueue(void *a1, const char *a2, ...)
{
  return _[a1 logSerializationQueue];
}

id objc_msgSend_longCharacterAtSegment_position_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longCharacterAtSegment:position:");
}

id objc_msgSend_longCharacterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longCharacterIsMember:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longPredictionListEnabled(void *a1, const char *a2, ...)
{
  return _[a1 longPredictionListEnabled];
}

id objc_msgSend_lookup_keyboardController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookup:keyboardController:");
}

id objc_msgSend_lowercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseLetterCharacterSet];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_lowercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseStringWithLocale:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return _[a1 majorVersion];
}

id objc_msgSend_mapShiftedKeyToUnShiftedKeyExcludeCapitalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapShiftedKeyToUnShiftedKeyExcludeCapitalization:");
}

id objc_msgSend_markedText(void *a1, const char *a2, ...)
{
  return _[a1 markedText];
}

id objc_msgSend_matchTransliterationCandidateToSegment_withCursorAt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchTransliterationCandidateToSegment:withCursorAt:");
}

id objc_msgSend_maxPredictions(void *a1, const char *a2, ...)
{
  return _[a1 maxPredictions];
}

id objc_msgSend_maxPredictionsReported(void *a1, const char *a2, ...)
{
  return _[a1 maxPredictionsReported];
}

id objc_msgSend_maxPriorSegmentsCheckedForErrors(void *a1, const char *a2, ...)
{
  return _[a1 maxPriorSegmentsCheckedForErrors];
}

id objc_msgSend_mergeFrameFromKey_intoKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrameFromKey:intoKey:");
}

id objc_msgSend_mergeHyphenatedWord_string_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeHyphenatedWord:string:");
}

id objc_msgSend_messageWithText_senderId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithText:senderId:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return _[a1 middleName];
}

id objc_msgSend_minorVersion(void *a1, const char *a2, ...)
{
  return _[a1 minorVersion];
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_multilingualEnabled(void *a1, const char *a2, ...)
{
  return _[a1 multilingualEnabled];
}

id objc_msgSend_multilingualInputManagerClass(void *a1, const char *a2, ...)
{
  return _[a1 multilingualInputManagerClass];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_namedEntityLexicon(void *a1, const char *a2, ...)
{
  return _[a1 namedEntityLexicon];
}

id objc_msgSend_needAutofill(void *a1, const char *a2, ...)
{
  return _[a1 needAutofill];
}

id objc_msgSend_newKeyboardInputManager(void *a1, const char *a2, ...)
{
  return _[a1 newKeyboardInputManager];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_nextInputWouldStartSentence(void *a1, const char *a2, ...)
{
  return _[a1 nextInputWouldStartSentence];
}

id objc_msgSend_nextKeyIsFlick(void *a1, const char *a2, ...)
{
  return _[a1 nextKeyIsFlick];
}

id objc_msgSend_nextKeyIsMultitap(void *a1, const char *a2, ...)
{
  return _[a1 nextKeyIsMultitap];
}

id objc_msgSend_nextLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 nextLongCharacter];
}

id objc_msgSend_nextLongCharacterEndsSegment(void *a1, const char *a2, ...)
{
  return _[a1 nextLongCharacterEndsSegment];
}

id objc_msgSend_nextUserAction(void *a1, const char *a2, ...)
{
  return _[a1 nextUserAction];
}

id objc_msgSend_nickName(void *a1, const char *a2, ...)
{
  return _[a1 nickName];
}

id objc_msgSend_normalizedIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 normalizedIdentifier];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_nullifyConversationHistory(void *a1, const char *a2, ...)
{
  return _[a1 nullifyConversationHistory];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTouches];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_onNewLayoutsFound(void *a1, const char *a2, ...)
{
  return _[a1 onNewLayoutsFound];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_outputStreamWithURL_append_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputStreamWithURL:append:");
}

id objc_msgSend_overrideInputMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideInputMode:");
}

id objc_msgSend_overridingJsonKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overridingJsonKeys:");
}

id objc_msgSend_paddedFrame(void *a1, const char *a2, ...)
{
  return _[a1 paddedFrame];
}

id objc_msgSend_parseData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseData:");
}

id objc_msgSend_parseLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseLayouts:");
}

id objc_msgSend_partfileArchivePaths(void *a1, const char *a2, ...)
{
  return _[a1 partfileArchivePaths];
}

id objc_msgSend_partfileArchivePathsMutable(void *a1, const char *a2, ...)
{
  return _[a1 partfileArchivePathsMutable];
}

id objc_msgSend_partfileArchivePathsQueue(void *a1, const char *a2, ...)
{
  return _[a1 partfileArchivePathsQueue];
}

id objc_msgSend_partfileCount(void *a1, const char *a2, ...)
{
  return _[a1 partfileCount];
}

id objc_msgSend_partfileURL(void *a1, const char *a2, ...)
{
  return _[a1 partfileURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathGenerator(void *a1, const char *a2, ...)
{
  return _[a1 pathGenerator];
}

id objc_msgSend_pathGeneratorWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathGeneratorWithAttributes:");
}

id objc_msgSend_pathIndex(void *a1, const char *a2, ...)
{
  return _[a1 pathIndex];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pathsForWords(void *a1, const char *a2, ...)
{
  return _[a1 pathsForWords];
}

id objc_msgSend_performHitTestForTouchEvent_keyboardState_continuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHitTestForTouchEvent:keyboardState:continuation:");
}

id objc_msgSend_performMaintenance(void *a1, const char *a2, ...)
{
  return _[a1 performMaintenance];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSkipTapAtLocation_radius_timestamp_pathIndex_fingerID_forcedKeyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSkipTapAtLocation:radius:timestamp:pathIndex:fingerID:forcedKeyCode:");
}

id objc_msgSend_performStrokeForPath_typingLog_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performStrokeForPath:typingLog:callback:");
}

id objc_msgSend_performTouchCancelAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchCancelAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchDownAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchDragAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchEndRestAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchEndRestAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchRestAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchRestAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchUpAtLocation_radius_timestamp_pathIndex_fingerID_secondaryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:");
}

id objc_msgSend_persistentBiasForBottomRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentBiasForBottomRow:");
}

id objc_msgSend_persistentBiasForKeyString_rect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentBiasForKeyString:rect:");
}

id objc_msgSend_persistentBiasForSpaceBarRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentBiasForSpaceBarRect:");
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return _[a1 point];
}

id objc_msgSend_pointForAttemptedTapOnKey_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointForAttemptedTapOnKey:withError:");
}

id objc_msgSend_positionInCurrentInternalSegment(void *a1, const char *a2, ...)
{
  return _[a1 positionInCurrentInternalSegment];
}

id objc_msgSend_postTokenisString_i_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postTokenisString:i:");
}

id objc_msgSend_predictationBarDebugString(void *a1, const char *a2, ...)
{
  return _[a1 predictationBarDebugString];
}

id objc_msgSend_predicted(void *a1, const char *a2, ...)
{
  return _[a1 predicted];
}

id objc_msgSend_predictionBarCandidates(void *a1, const char *a2, ...)
{
  return _[a1 predictionBarCandidates];
}

id objc_msgSend_predictionBarState(void *a1, const char *a2, ...)
{
  return _[a1 predictionBarState];
}

id objc_msgSend_predictions(void *a1, const char *a2, ...)
{
  return _[a1 predictions];
}

id objc_msgSend_preferBaseKeyForVariants(void *a1, const char *a2, ...)
{
  return _[a1 preferBaseKeyForVariants];
}

id objc_msgSend_preferInlineSelection(void *a1, const char *a2, ...)
{
  return _[a1 preferInlineSelection];
}

id objc_msgSend_preferManualCorrection(void *a1, const char *a2, ...)
{
  return _[a1 preferManualCorrection];
}

id objc_msgSend_preferManualShift(void *a1, const char *a2, ...)
{
  return _[a1 preferManualShift];
}

id objc_msgSend_preferPredictionSelection(void *a1, const char *a2, ...)
{
  return _[a1 preferPredictionSelection];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_prefersAutocorrectForApostrophes(void *a1, const char *a2, ...)
{
  return _[a1 prefersAutocorrectForApostrophes];
}

id objc_msgSend_prefersAutocorrectForCaps(void *a1, const char *a2, ...)
{
  return _[a1 prefersAutocorrectForCaps];
}

id objc_msgSend_prefersContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 prefersContinuousPath];
}

id objc_msgSend_prefersInlineSelection(void *a1, const char *a2, ...)
{
  return _[a1 prefersInlineSelection];
}

id objc_msgSend_prefersPredictionSelection(void *a1, const char *a2, ...)
{
  return _[a1 prefersPredictionSelection];
}

id objc_msgSend_prefersSpaceBarDoubleTap(void *a1, const char *a2, ...)
{
  return _[a1 prefersSpaceBarDoubleTap];
}

id objc_msgSend_prefersToCorrectErrors(void *a1, const char *a2, ...)
{
  return _[a1 prefersToCorrectErrors];
}

id objc_msgSend_prefersTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 prefersTransliteration];
}

id objc_msgSend_previousLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 previousLongCharacter];
}

id objc_msgSend_primaryInputMode(void *a1, const char *a2, ...)
{
  return _[a1 primaryInputMode];
}

id objc_msgSend_primaryIntendedText(void *a1, const char *a2, ...)
{
  return _[a1 primaryIntendedText];
}

id objc_msgSend_primaryLanguageWeight(void *a1, const char *a2, ...)
{
  return _[a1 primaryLanguageWeight];
}

id objc_msgSend_printDebugInfo_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printDebugInfo:lineNumber:");
}

id objc_msgSend_printTranslitSummaries(void *a1, const char *a2, ...)
{
  return _[a1 printTranslitSummaries];
}

id objc_msgSend_printTypingTranscript(void *a1, const char *a2, ...)
{
  return _[a1 printTypingTranscript];
}

id objc_msgSend_priorStates(void *a1, const char *a2, ...)
{
  return _[a1 priorStates];
}

id objc_msgSend_priorTokenisString_i_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priorTokenisString:i:");
}

id objc_msgSend_probBeginCorrectingAfterWord(void *a1, const char *a2, ...)
{
  return _[a1 probBeginCorrectingAfterWord];
}

id objc_msgSend_probBeginCorrectingAfterWordTerminator(void *a1, const char *a2, ...)
{
  return _[a1 probBeginCorrectingAfterWordTerminator];
}

id objc_msgSend_probDoubleTapInitialLetter(void *a1, const char *a2, ...)
{
  return _[a1 probDoubleTapInitialLetter];
}

id objc_msgSend_probDoubleTapLetter(void *a1, const char *a2, ...)
{
  return _[a1 probDoubleTapLetter];
}

id objc_msgSend_probExtraneousFinalKey(void *a1, const char *a2, ...)
{
  return _[a1 probExtraneousFinalKey];
}

id objc_msgSend_probExtraneousInitialKey(void *a1, const char *a2, ...)
{
  return _[a1 probExtraneousInitialKey];
}

id objc_msgSend_probExtraneousKey(void *a1, const char *a2, ...)
{
  return _[a1 probExtraneousKey];
}

id objc_msgSend_probRejectBadAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 probRejectBadAutocorrection];
}

id objc_msgSend_probSkipInitialLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSkipInitialLetter];
}

id objc_msgSend_probSkipLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSkipLetter];
}

id objc_msgSend_probSkipRepeatLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSkipRepeatLetter];
}

id objc_msgSend_probSkipSpace(void *a1, const char *a2, ...)
{
  return _[a1 probSkipSpace];
}

id objc_msgSend_probSubstituteInitialLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSubstituteInitialLetter];
}

id objc_msgSend_probSubstituteLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSubstituteLetter];
}

id objc_msgSend_probSubstituteSpace(void *a1, const char *a2, ...)
{
  return _[a1 probSubstituteSpace];
}

id objc_msgSend_probTappingSpaceInsteadOfBottomRow(void *a1, const char *a2, ...)
{
  return _[a1 probTappingSpaceInsteadOfBottomRow];
}

id objc_msgSend_probTappingSpaceReplacedByBottomRow(void *a1, const char *a2, ...)
{
  return _[a1 probTappingSpaceReplacedByBottomRow];
}

id objc_msgSend_probTransposeLetterAndSpace(void *a1, const char *a2, ...)
{
  return _[a1 probTransposeLetterAndSpace];
}

id objc_msgSend_probTransposeLetters(void *a1, const char *a2, ...)
{
  return _[a1 probTransposeLetters];
}

id objc_msgSend_probabilityOfDoubledKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfDoubledKey];
}

id objc_msgSend_probabilityOfExtraneousKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfExtraneousKey];
}

id objc_msgSend_probabilityOfSkippedKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfSkippedKey];
}

id objc_msgSend_probabilityOfSubstituteKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfSubstituteKey];
}

id objc_msgSend_probabilityOfTransposition(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfTransposition];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 punctuationCharacterSet];
}

id objc_msgSend_pushAutocorrections_requestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushAutocorrections:requestToken:");
}

id objc_msgSend_pushCandidateResultSet_requestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushCandidateResultSet:requestToken:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_randomActionInterval(void *a1, const char *a2, ...)
{
  return _[a1 randomActionInterval];
}

id objc_msgSend_randomErrorForKeyString_rect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomErrorForKeyString:rect:");
}

id objc_msgSend_randomNumberFromBetaDistribution(void *a1, const char *a2, ...)
{
  return _[a1 randomNumberFromBetaDistribution];
}

id objc_msgSend_randomNumberFromNormalDistribution(void *a1, const char *a2, ...)
{
  return _[a1 randomNumberFromNormalDistribution];
}

id objc_msgSend_randomPointInDistribution(void *a1, const char *a2, ...)
{
  return _[a1 randomPointInDistribution];
}

id objc_msgSend_randomPointWithStandardDeviationX_Y_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomPointWithStandardDeviationX:Y:");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return _[a1 range];
}

id objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
}

id objc_msgSend_rangeOfInputSegmentsForCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfInputSegmentsForCandidate:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rank(void *a1, const char *a2, ...)
{
  return _[a1 rank];
}

id objc_msgSend_rawInput(void *a1, const char *a2, ...)
{
  return _[a1 rawInput];
}

id objc_msgSend_realValue(void *a1, const char *a2, ...)
{
  return _[a1 realValue];
}

id objc_msgSend_recipientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 recipientIdentifier];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return _[a1 records];
}

id objc_msgSend_registerLayoutWithFavonius(void *a1, const char *a2, ...)
{
  return _[a1 registerLayoutWithFavonius];
}

id objc_msgSend_registerLearning_fullCandidate_keyboardState_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerLearning:fullCandidate:keyboardState:mode:");
}

id objc_msgSend_registerPathStringAsKeyStrokes_path_predictionBarState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPathStringAsKeyStrokes:path:predictionBarState:");
}

id objc_msgSend_rejectAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 rejectAutocorrection];
}

id objc_msgSend_rejectCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rejectCandidate:");
}

id objc_msgSend_relevancyScore(void *a1, const char *a2, ...)
{
  return _[a1 relevancyScore];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_repeatLimit(void *a1, const char *a2, ...)
{
  return _[a1 repeatLimit];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replacementString(void *a1, const char *a2, ...)
{
  return _[a1 replacementString];
}

id objc_msgSend_replayTest_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replayTest:withError:");
}

id objc_msgSend_reportFailedTest_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFailedTest:lineNumber:");
}

id objc_msgSend_reportForAutocorrectionResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportForAutocorrectionResults:");
}

id objc_msgSend_reportForTrial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportForTrial:");
}

id objc_msgSend_reportSyntaxErrors_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSyntaxErrors:lineNumber:");
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return _[a1 reporter];
}

id objc_msgSend_reporterWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reporterWithOptions:");
}

id objc_msgSend_representedString(void *a1, const char *a2, ...)
{
  return _[a1 representedString];
}

id objc_msgSend_representedStringForKey_shifted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representedStringForKey:shifted:");
}

id objc_msgSend_representedStringForKey_shifted_includeSecondaryStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representedStringForKey:shifted:includeSecondaryStrings:");
}

id objc_msgSend_requestCondition(void *a1, const char *a2, ...)
{
  return _[a1 requestCondition];
}

id objc_msgSend_requiresMaintenance(void *a1, const char *a2, ...)
{
  return _[a1 requiresMaintenance];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetForIntendedSegments_expectedSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetForIntendedSegments:expectedSegments:");
}

id objc_msgSend_resetOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetOptions:");
}

id objc_msgSend_resultClassifiers(void *a1, const char *a2, ...)
{
  return _[a1 resultClassifiers];
}

id objc_msgSend_resultLoggers(void *a1, const char *a2, ...)
{
  return _[a1 resultLoggers];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resultsBuffer(void *a1, const char *a2, ...)
{
  return _[a1 resultsBuffer];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retestTouchAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revisitPreviousToken(void *a1, const char *a2, ...)
{
  return _[a1 revisitPreviousToken];
}

id objc_msgSend_rewindPositionByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rewindPositionByString:");
}

id objc_msgSend_rewindSegmentCursor(void *a1, const char *a2, ...)
{
  return _[a1 rewindSegmentCursor];
}

id objc_msgSend_rightKeys(void *a1, const char *a2, ...)
{
  return _[a1 rightKeys];
}

id objc_msgSend_rotationMatrix(void *a1, const char *a2, ...)
{
  return _[a1 rotationMatrix];
}

id objc_msgSend_runAutocorrectionTester_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAutocorrectionTester:");
}

id objc_msgSend_runAutofillTestWithoutTyping_testHarness_trialID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAutofillTestWithoutTyping:testHarness:trialID:");
}

id objc_msgSend_runConversationTest_trialID_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runConversationTest:trialID:withError:");
}

id objc_msgSend_runDslTest_withHarnessClass_forLanguage_errorMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runDslTest:withHarnessClass:forLanguage:errorMessage:");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_runTest_trialID_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTest:trialID:withError:");
}

id objc_msgSend_runTestBasedOnTestType_options_trialID_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestBasedOnTestType:options:trialID:withError:");
}

id objc_msgSend_runTestCasesForSource_errorMessage_reportObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestCasesForSource:errorMessage:reportObserver:");
}

id objc_msgSend_runTestCasesForSource_options_reporter_reportObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestCasesForSource:options:reporter:reportObserver:");
}

id objc_msgSend_runTests_withHarnessClass_forLanguage_errorMessage_reportObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:");
}

id objc_msgSend_runTestsInRange_options_trialID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestsInRange:options:trialID:");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_runWithObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithObserver:");
}

id objc_msgSend_runWithTests_inRange_testHarness_options_reporter_numTrials_reportObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:");
}

id objc_msgSend_samples(void *a1, const char *a2, ...)
{
  return _[a1 samples];
}

id objc_msgSend_saveBadSentenceAndTranscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveBadSentenceAndTranscript:");
}

id objc_msgSend_scalarMultiplyPoint_by_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scalarMultiplyPoint:by:");
}

id objc_msgSend_scalars(void *a1, const char *a2, ...)
{
  return _[a1 scalars];
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToString:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_searchHelper_forWord_caseSensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchHelper:forWord:caseSensitive:");
}

id objc_msgSend_searchString(void *a1, const char *a2, ...)
{
  return _[a1 searchString];
}

id objc_msgSend_secondTap(void *a1, const char *a2, ...)
{
  return _[a1 secondTap];
}

id objc_msgSend_secondaryInputMode(void *a1, const char *a2, ...)
{
  return _[a1 secondaryInputMode];
}

id objc_msgSend_secondaryLanguageWeight(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLanguageWeight];
}

id objc_msgSend_secondaryRepresentedStrings(void *a1, const char *a2, ...)
{
  return _[a1 secondaryRepresentedStrings];
}

id objc_msgSend_secondaryString(void *a1, const char *a2, ...)
{
  return _[a1 secondaryString];
}

id objc_msgSend_secondaryValue(void *a1, const char *a2, ...)
{
  return _[a1 secondaryValue];
}

id objc_msgSend_secureCandidateForInput_slotID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureCandidateForInput:slotID:");
}

id objc_msgSend_secureCandidateRenderer(void *a1, const char *a2, ...)
{
  return _[a1 secureCandidateRenderer];
}

id objc_msgSend_secureTextEntry(void *a1, const char *a2, ...)
{
  return _[a1 secureTextEntry];
}

id objc_msgSend_seed(void *a1, const char *a2, ...)
{
  return _[a1 seed];
}

id objc_msgSend_seedForTest_trialID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seedForTest:trialID:");
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return _[a1 seekToEndOfFile];
}

id objc_msgSend_segmentAnchorRangeForCursor_withDocumentBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentAnchorRangeForCursor:withDocumentBefore:");
}

id objc_msgSend_segmentCursor(void *a1, const char *a2, ...)
{
  return _[a1 segmentCursor];
}

id objc_msgSend_segmentCursorBeforeBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 segmentCursorBeforeBackspacing];
}

id objc_msgSend_segmentEditHorizon(void *a1, const char *a2, ...)
{
  return _[a1 segmentEditHorizon];
}

id objc_msgSend_selectFromPredictionBar_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectFromPredictionBar:lineNumber:");
}

id objc_msgSend_selectedRange(void *a1, const char *a2, ...)
{
  return _[a1 selectedRange];
}

id objc_msgSend_selectedRangeForText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedRangeForText:");
}

id objc_msgSend_selectedRangeInMarkedText(void *a1, const char *a2, ...)
{
  return _[a1 selectedRangeInMarkedText];
}

id objc_msgSend_selectedText(void *a1, const char *a2, ...)
{
  return _[a1 selectedText];
}

id objc_msgSend_selfId(void *a1, const char *a2, ...)
{
  return _[a1 selfId];
}

id objc_msgSend_senderId(void *a1, const char *a2, ...)
{
  return _[a1 senderId];
}

id objc_msgSend_sendersToTest(void *a1, const char *a2, ...)
{
  return _[a1 sendersToTest];
}

id objc_msgSend_sentenceToTransliteratedPlaybackTest_withCatenation_addWordSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:");
}

id objc_msgSend_serializeResultsArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializeResultsArray:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAcceptedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptedCandidate:");
}

id objc_msgSend_setAggdStatistics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAggdStatistics:");
}

id objc_msgSend_setAllowsSpaceCorrections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSpaceCorrections:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAsyncPredictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAsyncPredictions:");
}

id objc_msgSend_setAutocapitalizationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationEnabled:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionEnabled:");
}

id objc_msgSend_setAutocorrectionList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionList:");
}

id objc_msgSend_setAutocorrectionListUIDisplayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionListUIDisplayed:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutoshifted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoshifted:");
}

id objc_msgSend_setBackspace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackspace:");
}

id objc_msgSend_setBadSentenceLogFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadSentenceLogFilePath:");
}

id objc_msgSend_setCanMultitap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanMultitap:");
}

id objc_msgSend_setCanSuggestSupplementalItemsForCurrentSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanSuggestSupplementalItemsForCurrentSelection:");
}

id objc_msgSend_setCandidateResultSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCandidateResultSet:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setClientProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientProxy:");
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfig:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setContinuousPathConversion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathConversion:");
}

id objc_msgSend_setContinuousPathEnabledAlgorithms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathEnabledAlgorithms:");
}

id objc_msgSend_setContinuousPathEnsembleSourceScales_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathEnsembleSourceScales:");
}

id objc_msgSend_setContinuousPathEnsembleSourceWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathEnsembleSourceWeights:");
}

id objc_msgSend_setContinuousPathParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathParams:");
}

id objc_msgSend_setCorpusId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorpusId:");
}

id objc_msgSend_setCorrected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorrected:");
}

id objc_msgSend_setCpCandidatesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCpCandidatesCount:");
}

id objc_msgSend_setCurrentKeystroke_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentKeystroke:");
}

id objc_msgSend_setCurrentKeystrokeSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentKeystrokeSequence:");
}

id objc_msgSend_setCurrentRequestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequestToken:");
}

id objc_msgSend_setCursor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursor:");
}

id objc_msgSend_setDebugData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugData:");
}

id objc_msgSend_setDefaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultValue:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeletionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeletionCount:");
}

id objc_msgSend_setDisableAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableAnalytics:");
}

id objc_msgSend_setDocumentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocumentIdentifier:");
}

id objc_msgSend_setDocumentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocumentState:");
}

id objc_msgSend_setDocumentStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocumentStates:");
}

id objc_msgSend_setDragged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDragged:");
}

id objc_msgSend_setDynamicResourcePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDynamicResourcePath:");
}

id objc_msgSend_setErrorGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorGenerator:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFavoniusLanguageModelWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFavoniusLanguageModelWeight:");
}

id objc_msgSend_setFirstName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstName:");
}

id objc_msgSend_setFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlick:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGesture:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setHardwareKeyboardMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHardwareKeyboardMode:");
}

id objc_msgSend_setHasAccentKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasAccentKey:");
}

id objc_msgSend_setHasCandidateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCandidateKey:");
}

id objc_msgSend_setHasRelevancyScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasRelevancyScore:");
}

id objc_msgSend_setIndex1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex1:");
}

id objc_msgSend_setIndex2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex2:");
}

id objc_msgSend_setInitialDragPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialDragPoint:");
}

id objc_msgSend_setInitialKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 setInitialKeyplane];
}

id objc_msgSend_setInlineCompletionBarState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInlineCompletionBarState:");
}

id objc_msgSend_setInlineCompletionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInlineCompletionEnabled:");
}

id objc_msgSend_setInlineCompletions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInlineCompletions:");
}

id objc_msgSend_setInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInput:");
}

id objc_msgSend_setInputContextHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputContextHistory:");
}

id objc_msgSend_setInputForMarkedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputForMarkedText:");
}

id objc_msgSend_setInputIsPunctuationFollowingContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputIsPunctuationFollowingContinuousPath:");
}

id objc_msgSend_setInputManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManager:");
}

id objc_msgSend_setInputManagerHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerHint:");
}

id objc_msgSend_setInputManagerLogger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerLogger:");
}

id objc_msgSend_setInputManagerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerState:");
}

id objc_msgSend_setInputManagerWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerWrapper:");
}

id objc_msgSend_setInputMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputMode:");
}

id objc_msgSend_setInputModeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputModeIdentifier:");
}

id objc_msgSend_setInputSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputSegment:");
}

id objc_msgSend_setInserted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInserted:");
}

id objc_msgSend_setInsertedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertedKey:");
}

id objc_msgSend_setInsertionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertionText:");
}

id objc_msgSend_setInsertsSpaceAfterPredictiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertsSpaceAfterPredictiveInput:");
}

id objc_msgSend_setIntended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntended:");
}

id objc_msgSend_setIntendedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntendedKey:");
}

id objc_msgSend_setIntendedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntendedText:");
}

id objc_msgSend_setIntendedTransliteration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntendedTransliteration:");
}

id objc_msgSend_setIntermediateText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntermediateText:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAlphabeticPlane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAlphabeticPlane:");
}

id objc_msgSend_setIsBackspacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBackspacing:");
}

id objc_msgSend_setIsKanaPlane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsKanaPlane:");
}

id objc_msgSend_setIsScreenLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsScreenLocked:");
}

id objc_msgSend_setJustAcceptedAutocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJustAcceptedAutocorrection:");
}

id objc_msgSend_setKeyLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyLayout:");
}

id objc_msgSend_setKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboard:");
}

id objc_msgSend_setKeyboardConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardConfiguration:");
}

id objc_msgSend_setKeyboardInfoDelgate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardInfoDelgate:");
}

id objc_msgSend_setKeyboardInputManagerFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardInputManagerFactory:");
}

id objc_msgSend_setKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyplane:");
}

id objc_msgSend_setKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeys:");
}

id objc_msgSend_setLastActionSuppressesError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastActionSuppressesError:");
}

id objc_msgSend_setLastActionUseSecondaryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastActionUseSecondaryString:");
}

id objc_msgSend_setLastCPRequestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastCPRequestToken:");
}

id objc_msgSend_setLastCursorPositionForTransliteratedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastCursorPositionForTransliteratedCandidate:");
}

id objc_msgSend_setLastInputWasContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastInputWasContinuousPath:");
}

id objc_msgSend_setLastInputWasSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastInputWasSelection:");
}

id objc_msgSend_setLastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastName:");
}

id objc_msgSend_setLastTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTimestamp:");
}

id objc_msgSend_setLastTouchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTouchEvent:");
}

id objc_msgSend_setLastUpdateDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUpdateDate:");
}

id objc_msgSend_setLayoutKeyOverride_forKey_uiKeyboardStringNothing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutKeyOverride:forKey:uiKeyboardStringNothing:");
}

id objc_msgSend_setLayoutState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutState:");
}

id objc_msgSend_setLearnWordContextIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearnWordContextIndex:");
}

id objc_msgSend_setLogDocumentContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogDocumentContext:");
}

id objc_msgSend_setLongPredictionListEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPredictionListEnabled:");
}

id objc_msgSend_setMarkedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarkedText:");
}

id objc_msgSend_setMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatrix:");
}

id objc_msgSend_setMaxPredictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPredictions:");
}

id objc_msgSend_setMaxPredictionsReported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPredictionsReported:");
}

id objc_msgSend_setMaxWordsPerPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxWordsPerPrediction:");
}

id objc_msgSend_setMlttBundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMlttBundleURL:");
}

id objc_msgSend_setMockInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockInstance:");
}

id objc_msgSend_setMultitap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultitap:");
}

id objc_msgSend_setNegativeLearningDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNegativeLearningDisabled:");
}

id objc_msgSend_setNextKeyIsFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextKeyIsFlick:");
}

id objc_msgSend_setNextKeyIsMultitap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextKeyIsMultitap:");
}

id objc_msgSend_setNgramModelPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNgramModelPath:");
}

id objc_msgSend_setNumberOfTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfTouches:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setPaddedFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaddedFrame:");
}

id objc_msgSend_setPairs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairs:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPathGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPathGenerator:");
}

id objc_msgSend_setPathsForWords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPathsForWords:");
}

id objc_msgSend_setPopupVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPopupVariant:");
}

id objc_msgSend_setPositionInCurrentInternalSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPositionInCurrentInternalSegment:");
}

id objc_msgSend_setPredicted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicted:");
}

id objc_msgSend_setPredictionBarState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredictionBarState:");
}

id objc_msgSend_setPrintTranslitSummaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintTranslitSummaries:");
}

id objc_msgSend_setPrintTypingTranscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintTypingTranscript:");
}

id objc_msgSend_setQuickTypeKeyboardFeatureSpecializationClass(void *a1, const char *a2, ...)
{
  return _[a1 setQuickTypeKeyboardFeatureSpecializationClass];
}

id objc_msgSend_setRandomNumberSeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRandomNumberSeed:");
}

id objc_msgSend_setRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRank:");
}

id objc_msgSend_setRecipientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipientIdentifier:");
}

id objc_msgSend_setRelevancyScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelevancyScore:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReporter:");
}

id objc_msgSend_setResultClassifiers(void *a1, const char *a2, ...)
{
  return _[a1 setResultClassifiers];
}

id objc_msgSend_setRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotation:");
}

id objc_msgSend_setRotationMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotationMatrix:");
}

id objc_msgSend_setSearchStringForMarkedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchStringForMarkedText:");
}

id objc_msgSend_setSecureTextEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecureTextEntry:");
}

id objc_msgSend_setSeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeed:");
}

id objc_msgSend_setSegmentCursor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentCursor:");
}

id objc_msgSend_setSegmentCursorBeforeBackspacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentCursorBeforeBackspacing:");
}

id objc_msgSend_setSegmentEditHorizon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentEditHorizon:");
}

id objc_msgSend_setSelectedRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedRange:");
}

id objc_msgSend_setShapeStoreResourceDir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShapeStoreResourceDir:");
}

id objc_msgSend_setSharedAggdReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedAggdReporter:");
}

id objc_msgSend_setSharedManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedManager:");
}

id objc_msgSend_setSharedTITransientLexiconManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedTITransientLexiconManager:");
}

id objc_msgSend_setShiftState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShiftState:");
}

id objc_msgSend_setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:");
}

id objc_msgSend_setShortcutConversionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortcutConversionEnabled:");
}

id objc_msgSend_setShouldSkipCandidateSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSkipCandidateSelection:");
}

id objc_msgSend_setShowsCandidateBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsCandidateBar:");
}

id objc_msgSend_setSkewRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkewRotation:");
}

id objc_msgSend_setSmartDashesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartDashesEnabled:");
}

id objc_msgSend_setSmartPunctuationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartPunctuationOptions:");
}

id objc_msgSend_setSmartQuotesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartQuotesEnabled:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceMetadata:");
}

id objc_msgSend_setSourceTransliteration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceTransliteration:");
}

id objc_msgSend_setSpacingErrorsApplied_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacingErrorsApplied:");
}

id objc_msgSend_setStaticDictionaryPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStaticDictionaryPath:");
}

id objc_msgSend_setStepCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStepCount:");
}

id objc_msgSend_setStepSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStepSize:");
}

id objc_msgSend_setStickerSuggestionsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStickerSuggestionsEnabled:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSupplementalLexiconIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupplementalLexiconIdentifier:");
}

id objc_msgSend_setSweepMax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepMax:");
}

id objc_msgSend_setSweepMin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepMin:");
}

id objc_msgSend_setSweepValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepValue:");
}

id objc_msgSend_setSynthesizedByAcceptingCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynthesizedByAcceptingCandidate:");
}

id objc_msgSend_setTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTags:");
}

id objc_msgSend_setTagsFromClassifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTagsFromClassifiers:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTestHarness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestHarness:");
}

id objc_msgSend_setTesting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTesting:");
}

id objc_msgSend_setTestingStateObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestingStateObject:");
}

id objc_msgSend_setTextInputTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextInputTraits:");
}

id objc_msgSend_setTokenIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenIndex:");
}

id objc_msgSend_setTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouch:");
}

id objc_msgSend_setTouchError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchError:");
}

id objc_msgSend_setTouchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchEvent:");
}

id objc_msgSend_setTouchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchEvents:");
}

id objc_msgSend_setTouched_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouched:");
}

id objc_msgSend_setTouchedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchedKey:");
}

id objc_msgSend_setTtkLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTtkLayout:");
}

id objc_msgSend_setTypingEngine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypingEngine:");
}

id objc_msgSend_setTypologyLogURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypologyLogURL:");
}

id objc_msgSend_setTypologyPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypologyPreferences:");
}

id objc_msgSend_setTypologyTraceLogURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypologyTraceLogURL:");
}

id objc_msgSend_setUppercase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppercase:");
}

id objc_msgSend_setUserInterfaceIdiom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInterfaceIdiom:");
}

id objc_msgSend_setUserModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserModel:");
}

id objc_msgSend_setUserPathManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserPathManager:");
}

id objc_msgSend_setUserPersona_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserPersona:");
}

id objc_msgSend_setUsesAdaptation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesAdaptation:");
}

id objc_msgSend_setUsesAutocapitalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesAutocapitalization:");
}

id objc_msgSend_setUsesAutocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesAutocorrection:");
}

id objc_msgSend_setUsesCJContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesCJContinuousPath:");
}

id objc_msgSend_setUsesContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesContinuousPath:");
}

id objc_msgSend_setUsesContinuousPathRetrocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesContinuousPathRetrocorrection:");
}

id objc_msgSend_setUsesCustomNgramModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesCustomNgramModel:");
}

id objc_msgSend_setUsesCustomStaticDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesCustomStaticDictionary:");
}

id objc_msgSend_setUsesETSRescoring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesETSRescoring:");
}

id objc_msgSend_setUsesPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesPrediction:");
}

id objc_msgSend_setUsesRetrocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesRetrocorrection:");
}

id objc_msgSend_setUsesStemSuffixCorrectionFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesStemSuffixCorrectionFactor:");
}

id objc_msgSend_setUsesTextChecker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesTextChecker:");
}

id objc_msgSend_setUsesTransliteration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesTransliteration:");
}

id objc_msgSend_setUsesTwoHands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesTwoHands:");
}

id objc_msgSend_setUsesUserModelLogging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesUserModelLogging:");
}

id objc_msgSend_setUsesWordNgramModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesWordNgramModel:");
}

id objc_msgSend_setUsesWordNgramModelAdaptation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesWordNgramModelAdaptation:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_setWarnIfSelectingPopupVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWarnIfSelectingPopupVariant:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWordLearningEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWordLearningEnabled:");
}

id objc_msgSend_setXScale_yScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXScale:yScale:");
}

id objc_msgSend_setXTrans_yTrans_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXTrans:yTrans:");
}

id objc_msgSend_setupSingletonMocksWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSingletonMocksWithOptions:");
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return _[a1 sharedInputModeController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedKeyboardFactory(void *a1, const char *a2, ...)
{
  return _[a1 sharedKeyboardFactory];
}

id objc_msgSend_sharedTIContactManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedTIContactManager];
}

id objc_msgSend_sharedUserModelDataStore(void *a1, const char *a2, ...)
{
  return _[a1 sharedUserModelDataStore];
}

id objc_msgSend_shiftAlternateKeyplaneName(void *a1, const char *a2, ...)
{
  return _[a1 shiftAlternateKeyplaneName];
}

id objc_msgSend_shiftKeyToAccessKeyplaneCloserToKeyString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftKeyToAccessKeyplaneCloserToKeyString:");
}

id objc_msgSend_shiftKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 shiftKeyplane];
}

id objc_msgSend_shiftState(void *a1, const char *a2, ...)
{
  return _[a1 shiftState];
}

id objc_msgSend_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap(void *a1, const char *a2, ...)
{
  return _[a1 shiftedKeyToUnShiftedKeyExcludeCapitalizationMap];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortDescription];
}

id objc_msgSend_shortcutConversion(void *a1, const char *a2, ...)
{
  return _[a1 shortcutConversion];
}

id objc_msgSend_shouldAcceptCandidate_beforeInputString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptCandidate:beforeInputString:");
}

id objc_msgSend_shouldAcceptInlineCompletion(void *a1, const char *a2, ...)
{
  return _[a1 shouldAcceptInlineCompletion];
}

id objc_msgSend_shouldAcceptTopCandidate(void *a1, const char *a2, ...)
{
  return _[a1 shouldAcceptTopCandidate];
}

id objc_msgSend_shouldBeginCorrectingAfterWord(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeginCorrectingAfterWord];
}

id objc_msgSend_shouldBeginCorrectingAfterWordTerminator(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeginCorrectingAfterWordTerminator];
}

id objc_msgSend_shouldConcatenateTokensAtBoundaryError(void *a1, const char *a2, ...)
{
  return _[a1 shouldConcatenateTokensAtBoundaryError];
}

id objc_msgSend_shouldIgnoreCurrentCharacter(void *a1, const char *a2, ...)
{
  return _[a1 shouldIgnoreCurrentCharacter];
}

id objc_msgSend_shouldInsertSpaceAfterSelection(void *a1, const char *a2, ...)
{
  return _[a1 shouldInsertSpaceAfterSelection];
}

id objc_msgSend_shouldRejectBadAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 shouldRejectBadAutocorrection];
}

id objc_msgSend_shouldSkipCandidateSelection(void *a1, const char *a2, ...)
{
  return _[a1 shouldSkipCandidateSelection];
}

id objc_msgSend_shouldStopAfterAddingStateString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldStopAfterAddingStateString:");
}

id objc_msgSend_shouldSuppressAutocorrectionWithTerminator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSuppressAutocorrectionWithTerminator:");
}

id objc_msgSend_shouldTypeInternalString(void *a1, const char *a2, ...)
{
  return _[a1 shouldTypeInternalString];
}

id objc_msgSend_showsCandidateBar(void *a1, const char *a2, ...)
{
  return _[a1 showsCandidateBar];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_skipHitTestForTouchEvent_keyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipHitTestForTouchEvent:keyboardState:");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_smartPunctuationController(void *a1, const char *a2, ...)
{
  return _[a1 smartPunctuationController];
}

id objc_msgSend_smartPunctuationOptionsForLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartPunctuationOptionsForLocale:");
}

id objc_msgSend_smartPunctuationOutputForInput_isLockedInput_documentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartPunctuationOutputForInput:isLockedInput:documentState:");
}

id objc_msgSend_smartPunctuationResultsForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartPunctuationResultsForString:");
}

id objc_msgSend_solveSystemOfEquations_withBMatrix_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "solveSystemOfEquations:withBMatrix:size:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceMask(void *a1, const char *a2, ...)
{
  return _[a1 sourceMask];
}

id objc_msgSend_sourceMetadata(void *a1, const char *a2, ...)
{
  return _[a1 sourceMetadata];
}

id objc_msgSend_sourceTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 sourceTransliteration];
}

id objc_msgSend_spaceAutocorrectionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 spaceAutocorrectionEnabled];
}

id objc_msgSend_spaceHorizontalErrorMode(void *a1, const char *a2, ...)
{
  return _[a1 spaceHorizontalErrorMode];
}

id objc_msgSend_spaceVerticalBias(void *a1, const char *a2, ...)
{
  return _[a1 spaceVerticalBias];
}

id objc_msgSend_spacesBetweenTransliterations(void *a1, const char *a2, ...)
{
  return _[a1 spacesBetweenTransliterations];
}

id objc_msgSend_spacingErrorMaxCount(void *a1, const char *a2, ...)
{
  return _[a1 spacingErrorMaxCount];
}

id objc_msgSend_spacingErrorsApplied(void *a1, const char *a2, ...)
{
  return _[a1 spacingErrorsApplied];
}

id objc_msgSend_splitDigraphsInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitDigraphsInString:");
}

id objc_msgSend_stage(void *a1, const char *a2, ...)
{
  return _[a1 stage];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_stateTranscript(void *a1, const char *a2, ...)
{
  return _[a1 stateTranscript];
}

id objc_msgSend_stepSize(void *a1, const char *a2, ...)
{
  return _[a1 stepSize];
}

id objc_msgSend_stoppageReason(void *a1, const char *a2, ...)
{
  return _[a1 stoppageReason];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _[a1 streamError];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return _[a1 streamStatus];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingCurlyQuotesWithStraightQuotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCurlyQuotesWithStraightQuotes:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringEndsWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringEndsWord:");
}

id objc_msgSend_stringForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForProperty:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCharacters:length:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithContentsOfURL_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfURL:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substitutesForKey_preferBaseKeyVariants_preferManualShift_substituteUpperCaseForLowerCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substitutesForKey:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtractPoint_byPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtractPoint:byPoint:");
}

id objc_msgSend_subtreeWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtreeWithName:");
}

id objc_msgSend_subtrees(void *a1, const char *a2, ...)
{
  return _[a1 subtrees];
}

id objc_msgSend_sumFloatField_forEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumFloatField:forEvent:");
}

id objc_msgSend_sumFloatField_forEvent_filteredWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumFloatField:forEvent:filteredWithPredicate:");
}

id objc_msgSend_sumFloatField_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumFloatField:forEvents:");
}

id objc_msgSend_sumIntegerField_forEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumIntegerField:forEvent:");
}

id objc_msgSend_sumIntegerField_forEvent_filteredWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumIntegerField:forEvent:filteredWithPredicate:");
}

id objc_msgSend_sumIntegerField_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumIntegerField:forEvents:");
}

id objc_msgSend_supplementalLexiconIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 supplementalLexiconIdentifier];
}

id objc_msgSend_supportedInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 supportedInputModeIdentifiers];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _[a1 suspend];
}

id objc_msgSend_sweepMax(void *a1, const char *a2, ...)
{
  return _[a1 sweepMax];
}

id objc_msgSend_sweepMin(void *a1, const char *a2, ...)
{
  return _[a1 sweepMin];
}

id objc_msgSend_sweepStateHeader(void *a1, const char *a2, ...)
{
  return _[a1 sweepStateHeader];
}

id objc_msgSend_sweepStateValues(void *a1, const char *a2, ...)
{
  return _[a1 sweepStateValues];
}

id objc_msgSend_sweepValue(void *a1, const char *a2, ...)
{
  return _[a1 sweepValue];
}

id objc_msgSend_swizzleTestingParameters(void *a1, const char *a2, ...)
{
  return _[a1 swizzleTestingParameters];
}

id objc_msgSend_syncToDocumentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncToDocumentState:");
}

id objc_msgSend_syncToEmptyDocument(void *a1, const char *a2, ...)
{
  return _[a1 syncToEmptyDocument];
}

id objc_msgSend_syncToKeyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncToKeyboardState:completionHandler:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_syntaxErrors(void *a1, const char *a2, ...)
{
  return _[a1 syntaxErrors];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return _[a1 tags];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_targetDeviatedNormallyFromPoint_withKeyWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetDeviatedNormallyFromPoint:withKeyWidth:");
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return _[a1 tearDown];
}

id objc_msgSend_teardownSingletonMocks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "teardownSingletonMocks:");
}

id objc_msgSend_terminatorsDeletingAutospace(void *a1, const char *a2, ...)
{
  return _[a1 terminatorsDeletingAutospace];
}

id objc_msgSend_testConversation_testingSender_warmupMessages_adaptToSentMessages_adaptToReceivedMessages_trialID_withError_writingResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:");
}

id objc_msgSend_testHarness(void *a1, const char *a2, ...)
{
  return _[a1 testHarness];
}

id objc_msgSend_testTyper(void *a1, const char *a2, ...)
{
  return _[a1 testTyper];
}

id objc_msgSend_testWithConversation_sendersToTest_warmupMessages_adaptToSentMessages_adaptToReceivedMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:");
}

id objc_msgSend_testWithInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:");
}

id objc_msgSend_testWithInput_andCorpusId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:andCorpusId:");
}

id objc_msgSend_testWithInput_expectedOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:expectedOutput:");
}

id objc_msgSend_testWithInput_expectedOutput_sourceMetadata_withTouches_andCorpusId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:");
}

id objc_msgSend_testWithTouches_expectedOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithTouches:expectedOutput:");
}

id objc_msgSend_testsWithIntendedOutput_expectedOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testsWithIntendedOutput:expectedOutput:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textAccepted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAccepted:");
}

id objc_msgSend_textAccepted_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAccepted:completionHandler:");
}

id objc_msgSend_textAccepted_predictiveCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAccepted:predictiveCandidate:");
}

id objc_msgSend_textCorpus(void *a1, const char *a2, ...)
{
  return _[a1 textCorpus];
}

id objc_msgSend_textCorpusForOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textCorpusForOptions:");
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return _[a1 textInputTraits];
}

id objc_msgSend_textToCommit(void *a1, const char *a2, ...)
{
  return _[a1 textToCommit];
}

id objc_msgSend_timeDelta(void *a1, const char *a2, ...)
{
  return _[a1 timeDelta];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeStamp(void *a1, const char *a2, ...)
{
  return _[a1 timeStamp];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toDictionary];
}

id objc_msgSend_toJsonDict(void *a1, const char *a2, ...)
{
  return _[a1 toJsonDict];
}

id objc_msgSend_toJsonDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toJsonDictionary];
}

id objc_msgSend_tokenForKeyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenForKeyboardState:");
}

id objc_msgSend_tokenizeEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenizeEntity:");
}

id objc_msgSend_tokensForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokensForString:");
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _[a1 touch];
}

id objc_msgSend_touchData(void *a1, const char *a2, ...)
{
  return _[a1 touchData];
}

id objc_msgSend_touchDataCollection(void *a1, const char *a2, ...)
{
  return _[a1 touchDataCollection];
}

id objc_msgSend_touchEvent(void *a1, const char *a2, ...)
{
  return _[a1 touchEvent];
}

id objc_msgSend_touchEventWithStage_location_radius_timestamp_pathIndex_fingerID_forcedKeyCode_continuousPathState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:");
}

id objc_msgSend_touchEventWithStage_location_radius_timestamp_pathIndex_forcedKeyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:");
}

id objc_msgSend_touchEvents(void *a1, const char *a2, ...)
{
  return _[a1 touchEvents];
}

id objc_msgSend_touchPassesDragThresholdAtPoint_pathIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchPassesDragThresholdAtPoint:pathIndex:");
}

id objc_msgSend_touched(void *a1, const char *a2, ...)
{
  return _[a1 touched];
}

id objc_msgSend_touchedKey(void *a1, const char *a2, ...)
{
  return _[a1 touchedKey];
}

id objc_msgSend_touches(void *a1, const char *a2, ...)
{
  return _[a1 touches];
}

id objc_msgSend_trainWithCorpus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainWithCorpus:");
}

id objc_msgSend_traitsWithScreen_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitsWithScreen:orientation:");
}

id objc_msgSend_transformedPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformedPoint:");
}

id objc_msgSend_translateLayoutForKeys_keyboardController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translateLayoutForKeys:keyboardController:");
}

id objc_msgSend_transliteration(void *a1, const char *a2, ...)
{
  return _[a1 transliteration];
}

id objc_msgSend_transliterationCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transliterationCandidate:");
}

id objc_msgSend_trimmedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trimmedCandidate:");
}

id objc_msgSend_tryAcceptCandidate(void *a1, const char *a2, ...)
{
  return _[a1 tryAcceptCandidate];
}

id objc_msgSend_tryAcceptingCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryAcceptingCandidate:");
}

id objc_msgSend_tryBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 tryBackspacing];
}

id objc_msgSend_tryChangeKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 tryChangeKeyplane];
}

id objc_msgSend_tryContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 tryContinuousPath];
}

id objc_msgSend_tryDoubleKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 tryDoubleKeyTap];
}

id objc_msgSend_tryExtraKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 tryExtraKeyTap];
}

id objc_msgSend_tryKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 tryKeyTap];
}

id objc_msgSend_tryPeriodShortcut(void *a1, const char *a2, ...)
{
  return _[a1 tryPeriodShortcut];
}

id objc_msgSend_tryRejectCandidate(void *a1, const char *a2, ...)
{
  return _[a1 tryRejectCandidate];
}

id objc_msgSend_trySelectPopupVariant(void *a1, const char *a2, ...)
{
  return _[a1 trySelectPopupVariant];
}

id objc_msgSend_trySkipKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 trySkipKeyTap];
}

id objc_msgSend_trySubstituteKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 trySubstituteKeyTap];
}

id objc_msgSend_tryTransposedKeyTaps(void *a1, const char *a2, ...)
{
  return _[a1 tryTransposedKeyTaps];
}

id objc_msgSend_tryTypingWillSuppressError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryTypingWillSuppressError:");
}

id objc_msgSend_twoKeyTapShortDescription(void *a1, const char *a2, ...)
{
  return _[a1 twoKeyTapShortDescription];
}

id objc_msgSend_typeTest_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeTest:withError:");
}

id objc_msgSend_typedStringLMRankingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 typedStringLMRankingEnabled];
}

id objc_msgSend_typingEngine(void *a1, const char *a2, ...)
{
  return _[a1 typingEngine];
}

id objc_msgSend_typingLogWithDebug_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typingLogWithDebug:");
}

id objc_msgSend_typologyLogURL(void *a1, const char *a2, ...)
{
  return _[a1 typologyLogURL];
}

id objc_msgSend_typologyOutpath(void *a1, const char *a2, ...)
{
  return _[a1 typologyOutpath];
}

id objc_msgSend_typologyPreferences(void *a1, const char *a2, ...)
{
  return _[a1 typologyPreferences];
}

id objc_msgSend_typologyTraceLogURL(void *a1, const char *a2, ...)
{
  return _[a1 typologyTraceLogURL];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uncommittedText(void *a1, const char *a2, ...)
{
  return _[a1 uncommittedText];
}

id objc_msgSend_uniformRandomNumber(void *a1, const char *a2, ...)
{
  return _[a1 uniformRandomNumber];
}

id objc_msgSend_uniformRandomPointInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniformRandomPointInRect:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAutoshift(void *a1, const char *a2, ...)
{
  return _[a1 updateAutoshift];
}

id objc_msgSend_updateDocumentState(void *a1, const char *a2, ...)
{
  return _[a1 updateDocumentState];
}

id objc_msgSend_updateFromKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFromKeyplane:");
}

id objc_msgSend_updateGlobalBias(void *a1, const char *a2, ...)
{
  return _[a1 updateGlobalBias];
}

id objc_msgSend_updateKeyboardOutput_withInputForSmartPunctuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateKeyboardOutput:withInputForSmartPunctuation:");
}

id objc_msgSend_updateResultForAutoFill_predictionCandidatesWithoutTyping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateResultForAutoFill:predictionCandidatesWithoutTyping:");
}

id objc_msgSend_uppercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseLetterCharacterSet];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_uppercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseStringWithLocale:");
}

id objc_msgSend_usageTrackingMask(void *a1, const char *a2, ...)
{
  return _[a1 usageTrackingMask];
}

id objc_msgSend_usePartialCandidates(void *a1, const char *a2, ...)
{
  return _[a1 usePartialCandidates];
}

id objc_msgSend_userActionStream(void *a1, const char *a2, ...)
{
  return _[a1 userActionStream];
}

id objc_msgSend_userActionStreamWithParameters_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActionStreamWithParameters:delegate:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userModel(void *a1, const char *a2, ...)
{
  return _[a1 userModel];
}

id objc_msgSend_userPathManager(void *a1, const char *a2, ...)
{
  return _[a1 userPathManager];
}

id objc_msgSend_userPersona(void *a1, const char *a2, ...)
{
  return _[a1 userPersona];
}

id objc_msgSend_userPointForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userPointForKey:");
}

id objc_msgSend_usesAutoShift(void *a1, const char *a2, ...)
{
  return _[a1 usesAutoShift];
}

id objc_msgSend_usesAutocapitalization(void *a1, const char *a2, ...)
{
  return _[a1 usesAutocapitalization];
}

id objc_msgSend_usesAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 usesAutocorrection];
}

id objc_msgSend_usesCandidateSelection(void *a1, const char *a2, ...)
{
  return _[a1 usesCandidateSelection];
}

id objc_msgSend_usesContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 usesContinuousPath];
}

id objc_msgSend_usesPrediction(void *a1, const char *a2, ...)
{
  return _[a1 usesPrediction];
}

id objc_msgSend_usesTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 usesTransliteration];
}

id objc_msgSend_usesWordNgramModel(void *a1, const char *a2, ...)
{
  return _[a1 usesWordNgramModel];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_value_withObjCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value:withObjCType:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_velocity(void *a1, const char *a2, ...)
{
  return _[a1 velocity];
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return _[a1 visible];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitUntilDate:");
}

id objc_msgSend_warmupMessages(void *a1, const char *a2, ...)
{
  return _[a1 warmupMessages];
}

id objc_msgSend_warnIfSelectingPopupVariant(void *a1, const char *a2, ...)
{
  return _[a1 warnIfSelectingPopupVariant];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_wordLearningEnabled(void *a1, const char *a2, ...)
{
  return _[a1 wordLearningEnabled];
}

id objc_msgSend_wordOriginFeedbackID(void *a1, const char *a2, ...)
{
  return _[a1 wordOriginFeedbackID];
}

id objc_msgSend_wordSeparator(void *a1, const char *a2, ...)
{
  return _[a1 wordSeparator];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeJSONObject_toStream_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeJSONObject:toStream:options:error:");
}

id objc_msgSend_writeToFile(void *a1, const char *a2, ...)
{
  return _[a1 writeToFile];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_zipGeometrySet(void *a1, const char *a2, ...)
{
  return _[a1 zipGeometrySet];
}