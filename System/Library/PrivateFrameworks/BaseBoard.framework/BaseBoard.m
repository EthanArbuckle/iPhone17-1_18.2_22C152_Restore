uint64_t BSEqualObjects(void *a1, void *a2)
{
  uint64_t result;

  if (a1 == a2) {
    return 1;
  }
  result = 0;
  if (a1)
  {
    if (a2) {
      return [a1 isEqual:a2];
    }
  }
  return result;
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t BSEqualStrings(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t result = 0;
  if (a1)
  {
    if (a2) {
      return [a1 isEqualToString:a2];
    }
  }
  return result;
}

uint64_t BSSettingsEqualToSettings(void *a1, void *a2)
{
  return _BSSettingsEqualToSettings(a1, a2, 0);
}

BOOL BSFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

void sub_18AAAA704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSSettingFlagIsYes(uint64_t a1)
{
  return a1 != 0x7FFFFFFFFFFFFFFFLL && a1 != 0;
}

uint64_t BSEqualBools(int a1, int a2)
{
  return a1 ^ a2 ^ 1u;
}

BOOL BSFloatIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

void sub_18AAAACB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAAFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAABA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_18AAABFD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAAC1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAC4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAAC69C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAC748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSIntegerMapEnumerateWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = (void (**)(void, void, void, void))v4;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSIntegerMapEnumerateWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, __strong id, BOOL *))");
    [v7 handleFailureInFunction:v8, @"BSIntegerMap.m", 209, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_11:
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSIntegerMapEnumerateWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, __strong id, BOOL *))");
    [v9 handleFailureInFunction:v10, @"BSIntegerMap.m", 210, @"Invalid parameter not satisfying: %@", @"block" file lineNumber description];

    goto LABEL_3;
  }
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  char v14 = 0;
  uint64_t v6 = *((void *)v3 + 2);
  if (!v6 || (((void (**)(void, void, uint64_t, char *))v5)[2](v5, 0, v6, &v14), !v14))
  {
    value = 0;
    key = 0;
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *((NSMapTable **)v3 + 1));
    do
    {
      if (!NSNextMapEnumeratorPair(&enumerator, &key, &value)) {
        break;
      }
      ((void (**)(void, void *, void *, char *))v5)[2](v5, key, value, &v14);
    }
    while (!v14);
    NSEndMapTableEnumeration(&enumerator);
  }
}

void sub_18AAAC900(_Unwind_Exception *a1)
{
  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAAC9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAACA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAACB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAD0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAD20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSIntegerMapObjectForKey(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    if (a2)
    {
LABEL_3:
      id v4 = [v3[1] objectForKey:a2];
      goto LABEL_6;
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable BSIntegerMapObjectForKey(BSIntegerMap *__strong _Nonnull, NSInteger)");
    [v5 handleFailureInFunction:v6, @"BSIntegerMap.m", 157, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }
  id v4 = v3[2];
LABEL_6:
  v7 = v4;

  return v7;
}

void sub_18AAAD338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAD40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSIntegerMapSetObjectForKey(void *a1, void *a2, uint64_t a3)
{
  v11 = a1;
  id v5 = a2;
  uint64_t v6 = v11;
  if (v11)
  {
    if (v5) {
      goto LABEL_3;
    }
LABEL_6:
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSIntegerMapSetObjectForKey(BSMutableIntegerMap *__strong _Nonnull, __strong id _Nonnull, NSInteger)");
    [v9 handleFailureInFunction:v10, @"BSIntegerMap.m", 236, @"Invalid parameter not satisfying: %@", @"object" file lineNumber description];

    uint64_t v6 = v11;
    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSIntegerMapSetObjectForKey(BSMutableIntegerMap *__strong _Nonnull, __strong id _Nonnull, NSInteger)");
  [v7 handleFailureInFunction:v8, @"BSIntegerMap.m", 235, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];

  uint64_t v6 = 0;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_3:
  if (a3)
  {
LABEL_4:
    [v6[1] setObject:v5 forKey:a3];
    goto LABEL_8;
  }
LABEL_7:
  objc_storeStrong(v6 + 2, a2);
LABEL_8:
}

void sub_18AAAD58C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAD640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSIntegerMapEnumerateKeysWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void (**)(void, void, void))v4;
  if (!v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSIntegerMapEnumerateKeysWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, BOOL *))");
    [v6 handleFailureInFunction:v7, @"BSIntegerMap.m", 189, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_11:
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSIntegerMapEnumerateKeysWithBlock(BSIntegerMap *__strong _Nonnull, void (^__strong _Nonnull)(NSInteger, BOOL *))");
    [v8 handleFailureInFunction:v9, @"BSIntegerMap.m", 190, @"Invalid parameter not satisfying: %@", @"block" file lineNumber description];

    goto LABEL_3;
  }
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  char v12 = 0;
  if (!v3[2] || (((void (**)(void, void, char *))v5)[2](v5, 0, &v12), !v12))
  {
    key = 0;
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, v3[1]);
    do
    {
      if (!NSNextMapEnumeratorPair(&enumerator, &key, 0)) {
        break;
      }
      ((void (**)(void, void *, char *))v5)[2](v5, key, &v12);
    }
    while (!v12);
    NSEndMapTableEnumeration(&enumerator);
  }
}

void sub_18AAAD7F8(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAAD8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAD96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAADADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAADBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAADCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAADD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAADF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAE064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAE15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __BSIntegerMapAllKeys_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addValue:a2];
}

void sub_18AAAE298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAE52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAE6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAE8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAEA3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAEB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAEBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL BSSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

void sub_18AAAECA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t BSHashPurifyNS(unint64_t a1)
{
  unint64_t v1 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) >> 27));
  return v1 ^ (v1 >> 31);
}

double BSRectWithSize()
{
  return *MEMORY[0x1E4F1DAD8];
}

void BSDispatchQueueAssertBarrier(void *a1)
{
  queue = a1;
  if (queue == MEMORY[0x1E4F14428]) {
    BSDispatchQueueAssertMain();
  }
  else {
    dispatch_assert_queue_barrier(queue);
  }
}

void sub_18AAAEE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAAEEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAAEFFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSFloatByLinearlyInterpolatingFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

void sub_18AAAF928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_18AAAFB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB025C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB03A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AAB055C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB06C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB084C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSCollectionFind(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  BOOL v4 = a2;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v3;
    id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (v4[2](v4, v9))
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_18AAB09EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB0A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB0CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB0E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB0EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSEventQueueLock;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAB0FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB121C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB12EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB13AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSDispatchQueueAssert(void *a1)
{
  queue = a1;
  if (queue == MEMORY[0x1E4F14428]) {
    BSDispatchQueueAssertMain();
  }
  else {
    dispatch_assert_queue_V2(queue);
  }
}

void sub_18AAB141C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSDispatchQueueAssertMain()
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v0 = MEMORY[0x1E4F14428];
    dispatch_assert_queue_V2(v0);
  }
}

void sub_18AAB1870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v42 - 160), 8);

  _Block_object_dispose((const void *)(v42 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t BSSettingsIsEmpty(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 isEmpty];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

void sub_18AAB1960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSIntegerMapCount(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = (void *)v1[1];
    if (v2[2]) {
      uint64_t v4 = [v3 count] + 1;
    }
    else {
      uint64_t v4 = [v3 count];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_18AAB1A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB1FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB202C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSTransactionState(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%li)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5445C18[a1];
  }
  return v1;
}

void sub_18AAB2184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB2268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAB23A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB29B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB2B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAB2C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB2D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAB2D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAB2DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAB2EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSInterfaceOrientationIsLandscape(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t BSSettingFlagForBool(uint64_t result)
{
  return result;
}

void sub_18AAB359C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_18AAB36A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSRectRoundForScale(double a1, double a2, double a3, double a4, double a5)
{
  double v9 = BSFloatRoundForScale(a1, a5);
  BSFloatRoundForScale(a2, a5);
  BSFloatRoundForScale(a3, a5);
  BSFloatRoundForScale(a4, a5);
  return v9;
}

double BSSizeRoundForScale(double a1, double a2, double a3)
{
  double v5 = BSFloatRoundForScale(a1, a3);
  BSFloatRoundForScale(a2, a3);
  return v5;
}

double BSFloatRoundForScale(double a1, double a2)
{
  double v4 = fabs(a2);
  if (a2 <= 0.0 || v4 < 2.22044605e-16)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v4);
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat BSFloatRoundForScale(CGFloat, CGFloat)");
    [v7 handleFailureInFunction:v8 file:@"BSMath.m" lineNumber:65 description:@"Scale must be specified and cannot be less than or equal to 0."];
  }
  return round(a1 * a2) / a2;
}

void sub_18AAB39B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSFloatLessThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 < a2;
}

BOOL BSAtomicSetFlag(unsigned int a1, atomic_uint *a2)
{
  if (!a2) {
    __assert_rtn("BSAtomicSetFlag", "BSAtomicUtilities.m", 23, "value && (sizeof(int32_t) == sizeof(*value))");
  }
  int v2 = a1 ^ 1;
  atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v2, a1, memory_order_relaxed, memory_order_relaxed);
  return v2 == (a1 ^ 1);
}

void sub_18AAB3BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSFloatIsOne(double a1)
{
  return fabs(a1 + -1.0) < 2.22044605e-16;
}

void sub_18AAB3DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3F2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB3FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB4064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB40FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _BSSettingsEqualToSettings(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3 && BSSettingsIsEmpty(v5))
  {
    char IsEmpty = BSSettingsIsEmpty(v6);
    if (v5 == v6) {
      char v8 = 1;
    }
    else {
      char v8 = IsEmpty;
    }
    if (v8) {
      goto LABEL_7;
    }
  }
  else if (v5 == v6)
  {
LABEL_7:
    uint64_t v9 = 1;
    goto LABEL_12;
  }
  uint64_t v9 = 0;
  if (v5 && v6) {
    uint64_t v9 = [v5 isEqual:v6];
  }
LABEL_12:

  return v9;
}

void sub_18AAB41A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSHashPurify32(unsigned int a1)
{
  unsigned int v1 = 321982955 * ((484763065 * (a1 ^ (a1 >> 14))) ^ ((484763065 * (a1 ^ (a1 >> 14))) >> 13));
  return v1 ^ (v1 >> 15);
}

void sub_18AAB441C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSSettingsEncodeSettingObject(void *a1, void *a2)
{
  id v3 = a1;
  if (xpc_is_kind_of_xpc_object4NSXPC())
  {
    *a2 = 0;
    id v4 = v3;
  }
  else
  {
    if ([v3 supportsBSXPCSecureCoding] & 1) != 0 || (objc_opt_respondsToSelector())
    {
      *a2 = xpc_int64_create(1);
      id v5 = +[BSXPCCoder coder];
      [v5 encodeObject:v3 forKey:@"__BSXPCSecureValue"];
      id v6 = NSStringFromClass((Class)[v3 classForCoder]);
      [v5 encodeObject:v6 forKey:@"__BSXPCSecureClass"];

      uint64_t v7 = [v5 createMessage];
    }
    else
    {
      *a2 = xpc_int64_create(2);
      id v5 = objc_alloc_init(MEMORY[0x1E4F29278]);
      [v5 beginEncoding];
      [v5 encodeObject:v3 forKey:@"__BSXPCSecureValue"];
      uint64_t v7 = [v5 finishEncoding];
    }
    id v4 = (id)v7;
  }
  return v4;
}

void sub_18AAB45A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB466C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)BSXPCCoder;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

id _BSXPCDecodeObjectForKey(uint64_t a1, void *a2, objc_class *a3, unsigned char *a4)
{
  if (!a2)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectForKey(BSXPCCoder *const __strong, NSString *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    [v20 handleFailureInFunction:v21, @"BSXPCCoder.m", 455, @"Invalid parameter not satisfying: %@", @"key != nil" file lineNumber description];
  }
  char v8 = *(void **)(a1 + 24);
  if (!v8) {
    char v8 = *(void **)(a1 + 8);
  }
  id v9 = v8;
  id v10 = a2;
  long long v11 = (const char *)[v10 UTF8String];
  id v12 = v9;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = objc_msgSend(NSString, "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
    [v22 handleFailureInFunction:v23 file:@"BSXPCObjectUtilities.h" lineNumber:50 description:@"key must not be nil"];
  }
  id v13 = v12;
  long long v14 = v13;
  if (v13
    && (Class Class = object_getClass(v13),
        uint64_t v16 = (objc_class *)MEMORY[0x1E4F14590],
        v14,
        v14,
        Class == v16))
  {
    v17 = xpc_dictionary_get_value(v14, v11);
  }
  else
  {
    v17 = 0;
  }

  v18 = _BSXPCDecodeObjectFromContext(a1, v17, (uint64_t)v10, a3, a4);

  return v18;
}

void sub_18AAB4888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _BSXPCDecodeObjectFromContext(uint64_t a1, void *a2, uint64_t a3, objc_class *a4, unsigned char *a5)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    v60 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObjectFromContext(BSXPCCoder *const __strong, const __strong xpc_object_t, NSString *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    [v59 handleFailureInFunction:v60, @"BSXPCCoder.m", 461, @"Invalid parameter not satisfying: %@", @"expectedClass != nil" file lineNumber description];
  }
  id v9 = (void **)(a1 + 24);
  id v10 = *(void **)(a1 + 24);
  if (!v10) {
    id v10 = *(void **)(a1 + 8);
  }
  id v70 = v10;
  id v11 = (id)MEMORY[0x1E4F14550];
  if (a2) {
    id v12 = a2;
  }
  else {
    id v12 = (void *)MEMORY[0x1E4F14550];
  }
  objc_storeStrong((id *)(a1 + 24), v12);
  id v13 = (void *)MEMORY[0x18C125360]();
  aClass Class = a4;
  if (!a4)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    v62 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(BSXPCCoder *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
    [v61 handleFailureInFunction:v62, @"BSXPCCoder.m", 493, @"Invalid parameter not satisfying: %@", @"expectedClass != nil" file lineNumber description];
  }
  long long v14 = *v9;
  if (!*v9) {
    long long v14 = *(void **)(a1 + 8);
  }
  id v15 = v14;
  uint64_t v16 = v15;
  if (v15 == v11) {
    goto LABEL_31;
  }
  Class Class = object_getClass(v15);
  if ([(objc_class *)aClass isSubclassOfClass:BSXPCObjectBaseClass()])
  {
    id v18 = v16;
    goto LABEL_15;
  }
  if (([(objc_class *)aClass isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)aClass isSubclassOfClass:objc_opt_class()] & 1) != 0
    || ([(objc_class *)aClass isSubclassOfClass:objc_opt_class()] & 1) != 0)
  {
    if (!a5)
    {
      uint64_t v26 = BSLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = NSStringFromClass(aClass);
        *(_DWORD *)applier = 138543362;
        *(void *)&applier[4] = v42;
        _os_log_error_impl(&dword_18AAA8000, v26, OS_LOG_TYPE_ERROR, "Attempted to decode a collection (%{public}@) without specifying the class it contains", applier, 0xCu);
      }
      v27 = (void *)MEMORY[0x1E4F1CA00];
      v22 = NSStringFromClass(aClass);
      [v27 raise:*MEMORY[0x1E4F1C3C8], @"Attempted to decode a collection (%@) without specifying the class it contains", v22 format];
      id v18 = 0;
      goto LABEL_35;
    }
    if (Class != (Class)MEMORY[0x1E4F14568])
    {
      v24 = BSLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)applier = 0;
        _os_log_error_impl(&dword_18AAA8000, v24, OS_LOG_TYPE_ERROR, "Invalid decoding context for collection", applier, 2u);
      }
      v25 = @"Invalid decoding context for collection";
LABEL_29:

LABEL_30:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:v25];
LABEL_31:
      id v18 = 0;
      goto LABEL_36;
    }
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)applier = MEMORY[0x1E4F143A8];
    *(void *)&applier[8] = 3221225472;
    *(void *)&applier[16] = ___BSXPCDecodeObject_block_invoke;
    *(void *)&long long v75 = &unk_1E5446EB8;
    *((void *)&v75 + 1) = a1;
    v77 = a5;
    id v31 = v30;
    id v76 = v31;
    if (xpc_array_apply(v16, applier))
    {
      id v18 = (id)[[aClass alloc] initWithArray:v31];
    }
    else
    {
      v32 = BSLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AAA8000, v32, OS_LOG_TYPE_ERROR, "Unable to decode array: an object within the array failed to decode", buf, 2u);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unable to decode array: an object within the array failed to decode"];
      id v18 = 0;
    }

    goto LABEL_15;
  }
  if ([(objc_class *)aClass isSubclassOfClass:objc_opt_class()])
  {
    if (a5)
    {
      if (Class != (Class)MEMORY[0x1E4F14590])
      {
        v24 = BSLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)applier = 0;
          _os_log_error_impl(&dword_18AAA8000, v24, OS_LOG_TYPE_ERROR, "Invalid decoding context for dictionary", applier, 2u);
        }
        v25 = @"Invalid decoding context for dictionary";
        goto LABEL_29;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v80 = __Block_byref_object_copy__9;
      v81 = __Block_byref_object_dispose__9;
      id v82 = 0;
      v43 = [MEMORY[0x1E4F1CA60] dictionary];
      *(void *)applier = MEMORY[0x1E4F143A8];
      *(void *)&applier[8] = 3221225472;
      *(void *)&applier[16] = ___BSXPCDecodeObject_block_invoke_242;
      *(void *)&long long v75 = &unk_1E5446EE0;
      *((void *)&v75 + 1) = a1;
      v78 = a5;
      id v44 = v43;
      id v76 = v44;
      v77 = buf;
      if (xpc_dictionary_apply(v16, applier))
      {
        id v18 = (id)[[aClass alloc] initWithDictionary:v44];
      }
      else
      {
        v53 = BSLogCommon();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          uint64_t v64 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v72 = 138543362;
          uint64_t v73 = v64;
          _os_log_error_impl(&dword_18AAA8000, v53, OS_LOG_TYPE_ERROR, "Unable to decode dictionary key %{public}@", v72, 0xCu);
        }

        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unable to decode dictionary key %@", *(void *)(*(void *)&buf[8] + 40) format];
        id v18 = 0;
      }

      _Block_object_dispose(buf, 8);
LABEL_15:
      if (!v18) {
        goto LABEL_36;
      }
      goto LABEL_16;
    }
    v36 = xpc_dictionary_get_value(v16, "root");

    if (v36)
    {
      if (Class != (Class)MEMORY[0x1E4F14590])
      {
        v67 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"decodingContextType == XPC_TYPE_DICTIONARY"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v68 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(BSXPCCoder *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
          *(_DWORD *)applier = 138544130;
          *(void *)&applier[4] = v68;
          *(_WORD *)&applier[12] = 2114;
          *(void *)&applier[14] = @"BSXPCCoder.m";
          *(_WORD *)&applier[22] = 1024;
          LODWORD(v75) = 669;
          WORD2(v75) = 2114;
          *(void *)((char *)&v75 + 6) = v67;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", applier, 0x26u);
        }
        qword_1E911F420 = [v67 UTF8String];
        __break(0);
        JUMPOUT(0x18AAB5634);
      }
      goto LABEL_61;
    }
    goto LABEL_54;
  }
  if (Class != (Class)MEMORY[0x1E4F14590]) {
    goto LABEL_54;
  }
  int v69 = [(objc_class *)aClass supportsBSXPCSecureCoding];
  if (v69)
  {
    v40 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v16, "bsx_class");
    goto LABEL_65;
  }
  if [(objc_class *)aClass instancesRespondToSelector:sel_initWithXPCDictionary_]&& ([(objc_class *)aClass instancesRespondToSelector:sel_encodeWithXPCDictionary_])
  {
    v40 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v16, "bs_class");
    if (!NSClassFromString((NSString *)v40))
    {
      v45 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v16, "bs_fallback");
      v46 = v45;
      if (v45)
      {
        v47 = v45;

        v40 = v47;
      }
    }
LABEL_65:
    if (v40 && (v41 = NSClassFromString((NSString *)v40)) != 0)
    {
      if (aClass == v41)
      {
LABEL_82:
        if (v69) {
          uint64_t v51 = [[v41 alloc] initWithBSXPCCoder:a1];
        }
        else {
          uint64_t v51 = [[v41 alloc] initWithXPCDictionary:v16];
        }
        id v18 = (id)v51;

        goto LABEL_15;
      }
      if ([(objc_class *)aClass isSubclassOfClass:v41])
      {
        v41 = aClass;
        goto LABEL_82;
      }
      if ([(objc_class *)v41 isSubclassOfClass:aClass]) {
        goto LABEL_82;
      }
      v57 = BSLogCommon();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v66 = NSStringFromClass(aClass);
        *(_DWORD *)applier = 138543618;
        *(void *)&applier[4] = v40;
        *(_WORD *)&applier[12] = 2114;
        *(void *)&applier[14] = v66;
        _os_log_error_impl(&dword_18AAA8000, v57, OS_LOG_TYPE_ERROR, "Decoded class %{public}@ is not compatible with expected class %{public}@", applier, 0x16u);
      }
      v58 = (void *)MEMORY[0x1E4F1CA00];
      v50 = NSStringFromClass(aClass);
      [v58 raise:*MEMORY[0x1E4F1C3C8], @"Decoded class %@ is not compatible with expected class %@", v40, v50 format];
    }
    else
    {
      v48 = BSLogCommon();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v63 = NSStringFromClass(aClass);
        *(_DWORD *)applier = 138543618;
        *(void *)&applier[4] = v40;
        *(_WORD *)&applier[12] = 2114;
        *(void *)&applier[14] = v63;
        _os_log_error_impl(&dword_18AAA8000, v48, OS_LOG_TYPE_ERROR, "Unable to reify decoded class %{public}@ for expected class %{public}@", applier, 0x16u);
      }
      v49 = (void *)MEMORY[0x1E4F1CA00];
      v50 = NSStringFromClass(aClass);
      [v49 raise:*MEMORY[0x1E4F1C3C8], @"Unable to reify decoded class %@ for expected class %@", v40, v50 format];
    }

    v41 = 0;
    goto LABEL_82;
  }
  if ([(objc_class *)aClass supportsSecureCoding])
  {
    v52 = xpc_dictionary_get_value(v16, "root");

    if (v52)
    {
      if (a5)
      {
        uint64_t v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", aClass, a5, 0);
        goto LABEL_62;
      }
LABEL_61:
      uint64_t v37 = [MEMORY[0x1E4F1CAD0] setWithObjects:&aClass count:1];
LABEL_62:
      v38 = (void *)v37;
      id v39 = objc_alloc_init(MEMORY[0x1E4F29270]);
      [v39 beginReadingFromXPCObject:v16];
      id v18 = [v39 decodeObjectOfClasses:v38 forKey:@"bsx"];

      goto LABEL_15;
    }
LABEL_54:
    id v18 = (id)_CFXPCCreateCFObjectFromXPCObject();
    if (!v18 && Class == (Class)MEMORY[0x1E4F145F8]) {
      id v18 = (id)[objc_alloc(NSNumber) initWithUnsignedLongLong:xpc_uint64_get_value(v16)];
    }
    if (v18)
    {
LABEL_16:
      if (objc_opt_isKindOfClass()) {
        goto LABEL_36;
      }
      v19 = BSLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        v35 = NSStringFromClass(aClass);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        _os_log_error_impl(&dword_18AAA8000, v19, OS_LOG_TYPE_ERROR, "Decoded object class %{public}@ does not match expected class %{public}@", buf, 0x16u);
      }
      v20 = (void *)MEMORY[0x1E4F1CA00];
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = NSStringFromClass(aClass);
      [v20 raise:*MEMORY[0x1E4F1C3C8], @"Decoded object class %@ does not match expected class %@", v22, v23 format];
      goto LABEL_20;
    }
    v25 = @"Invalid decoding context for <CFXPCBridge>";
    goto LABEL_30;
  }
  v54 = BSLogCommon();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    v65 = NSStringFromClass(aClass);
    *(_DWORD *)applier = 138543362;
    *(void *)&applier[4] = v65;
    _os_log_error_impl(&dword_18AAA8000, v54, OS_LOG_TYPE_ERROR, "No valid encoding type could be determined for expected class: %{public}@", applier, 0xCu);
  }
  v55 = (void *)MEMORY[0x1E4F1CA00];
  v56 = NSStringFromClass(aClass);
  [v55 raise:*MEMORY[0x1E4F1C3C8], @"No valid encoding type could be determined for expected class: %@", v56 format];

  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  v23 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject *_BSXPCDecodeObject(BSXPCCoder *const __strong, __unsafe_unretained Class, __unsafe_unretained Class)");
  [v22 handleFailureInFunction:v23 file:@"BSXPCCoder.m" lineNumber:685 description:@"we should not have been able to vet the class without defining the encoding"];
  id v18 = 0;
LABEL_20:

LABEL_35:
LABEL_36:

  objc_storeStrong((id *)(a1 + 24), v10);
  v28 = *(void **)(a1 + 24);
  if (v28 == *(void **)(a1 + 8))
  {
    void *v9 = 0;
  }

  return v18;
}

void sub_18AAB5644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *exc_buf, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int buf,uint64_t a28,__int16 a29,uint64_t a30,__int16 a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  if (a2)
  {

    if (a2 == 2)
    {
      id v36 = objc_begin_catch(a1);
      objc_exception_rethrow();
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_18AAB58C8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,long long a27,int a28,__int16 a29,__int16 a30,id a31)
{
  if (a2)
  {
    objc_end_catch();

    if (a2 != 2)
    {
      objc_begin_catch(a1);
      JUMPOUT(0x18AAB4B60);
    }
    id v33 = objc_begin_catch(a1);
    v34 = BSLogCommon();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (a14)
    {
      if (v35)
      {
        uint64_t v37 = NSStringFromClass(v31);
        LODWORD(a27) = 138543874;
        *(void *)((char *)&a27 + 4) = v37;
        WORD6(a27) = 2114;
        *(void *)((char *)&a27 + 14) = a14;
        a30 = 2114;
        a31 = v33;
        _os_log_error_impl(&dword_18AAA8000, v34, OS_LOG_TYPE_ERROR, "Exception thrown while decoding class %{public}@ for key \"%{public}@\": %{public}@", (uint8_t *)&a27, 0x20u);
      }
    }
    else if (v35)
    {
      id v36 = NSStringFromClass(v31);
      LODWORD(a27) = 138543618;
      *(void *)((char *)&a27 + 4) = v36;
      WORD6(a27) = 2114;
      *(void *)((char *)&a27 + 14) = v33;
      _os_log_error_impl(&dword_18AAA8000, v34, OS_LOG_TYPE_ERROR, "Exception thrown while decoding class %{public}@: %{public}@", (uint8_t *)&a27, 0x16u);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_18AAB58D8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AAB5918(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x18AAB5920);
  }
  _Unwind_Resume(a1);
}

void sub_18AAB5A40(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {

    objc_end_catch();
    JUMPOUT(0x18AAB5930);
  }
  _Unwind_Resume(a1);
}

void _BSXPCEncodeObjectForKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x18C125360]();
  uint64_t v7 = (objc_class *)objc_opt_class();
  if (!a2 || (BSXPCObjectBaseClass(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (([a2 isNSArray] & 1) == 0
      && ([a2 isNSSet] & 1) == 0
      && ![a2 isNSOrderedSet])
    {
      if ([a2 isNSDictionary])
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = ___BSXPCEncodeObjectForKey_block_invoke;
        v44[3] = &unk_1E5446E90;
        v44[4] = a2;
        v44[5] = a1;
        _BSXPCEncodeDictionaryWithKey(a1, a3, (uint64_t)v44);
        goto LABEL_41;
      }
      if ([a2 supportsBSXPCSecureCoding])
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = ___BSXPCEncodeObjectForKey_block_invoke_2;
        v43[3] = &unk_1E5446E90;
        v43[4] = a2;
        v43[5] = a1;
        _BSXPCEncodeDictionaryWithKey(a1, a3, (uint64_t)v43);
        goto LABEL_41;
      }
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = ___BSXPCEncodeObjectForKey_block_invoke_3;
        v42[3] = &unk_1E5445D00;
        v42[4] = a2;
        _BSXPCEncodeDictionaryWithKey(a1, a3, (uint64_t)v42);
        goto LABEL_41;
      }
      if ([(objc_class *)v7 supportsSecureCoding])
      {
        id v9 = (id)_CFXPCCreateXPCObjectFromCFObject();
        if (!v9)
        {
          id v33 = objc_alloc_init(MEMORY[0x1E4F29278]);
          [v33 beginEncoding];
          [v33 encodeObject:a2 forKey:@"bsx"];
          id v9 = [v33 finishEncoding];
        }
        v34 = *(void **)(a1 + 24);
        if (!a3)
        {
          if (!v34) {
            v34 = *(void **)(a1 + 8);
          }
          xpc_array_append_value(v34, v9);
          goto LABEL_7;
        }
        if (!v34) {
          v34 = *(void **)(a1 + 8);
        }
        id v35 = v34;
        xpc_dictionary_set_value(v35, (const char *)[a3 UTF8String], v9);
      }
      else
      {
        id v36 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v7);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        [v36 raise:*MEMORY[0x1E4F1C3C8], @"%@ could not encode object %@ because it supports neither BSXPC[Secure]Coding nor NSSecureCoding.", v9, v35 format];
      }

LABEL_7:
      goto LABEL_41;
    }
    id v10 = *(void **)(a1 + 24);
    if (!v10) {
      id v10 = *(void **)(a1 + 8);
    }
    id v11 = v10;
    xpc_object_t v12 = xpc_array_create(0, 0);
    objc_storeStrong((id *)(a1 + 24), v12);
    id v13 = v11;
    long long v14 = v13;
    if (a3)
    {
      if (!v13
        || (Class Class = object_getClass(v13),
            uint64_t v16 = (objc_class *)MEMORY[0x1E4F14590],
            v14,
            v14,
            Class != v16))
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        id v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(BSXPCCoder *const __strong, NSString *const __strong, const __strong id<NSFastEnumeration>)");
        [v17 handleFailureInFunction:v18 file:@"BSXPCCoder.m" lineNumber:328 description:&stru_1ED76E928];
        goto LABEL_63;
      }
    }
    else if (!v13 {
           || (Class v19 = object_getClass(v13),
    }
               v20 = (objc_class *)MEMORY[0x1E4F14568],
               v14,
               v14,
               v19 != v20))
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      id v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(BSXPCCoder *const __strong, NSString *const __strong, const __strong id<NSFastEnumeration>)");
      [v17 handleFailureInFunction:v18 file:@"BSXPCCoder.m" lineNumber:327 description:&stru_1ED76E928];
LABEL_63:

      if (!a2) {
        goto LABEL_64;
      }
      goto LABEL_23;
    }
    if (!a2)
    {
LABEL_64:
      id v39 = [MEMORY[0x1E4F28B00] currentHandler];
      v40 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeCollectionWithKey(BSXPCCoder *const __strong, NSString *const __strong, const __strong id<NSFastEnumeration>)");
      [v39 handleFailureInFunction:v40 file:@"BSXPCCoder.m" lineNumber:329 description:&stru_1ED76E928];
    }
LABEL_23:
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v21 = a2;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v21);
          }
          _BSXPCEncodeObjectForKey(a1, *(void *)(*((void *)&v45 + 1) + 8 * i), 0);
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v22);
    }

    if (v12)
    {
      if (a3)
      {
        v25 = (const char *)[a3 UTF8String];
        id v26 = v14;
        id v27 = v12;
        v28 = v27;
        if (v25)
        {
          if (v14 && object_getClass(v27) == (Class)MEMORY[0x1E4F14568]) {
            xpc_dictionary_set_value(v26, v25, v28);
          }
        }
        else
        {
          v41 = [MEMORY[0x1E4F28B00] currentHandler];
          v38 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
          [v41 handleFailureInFunction:v38 file:@"BSXPCObjectUtilities.h" lineNumber:61 description:@"key must not be nil"];
        }
      }
      else
      {
        id v29 = v14;
        id v30 = v12;
        if (v14)
        {
          id v31 = v30;
          if (object_getClass(v30) == (Class)MEMORY[0x1E4F14568]) {
            xpc_array_append_value(v29, v31);
          }
        }
      }
    }
    id v32 = _BSXPCPopEncodingContext(a1, v14);

    goto LABEL_41;
  }
  char v8 = *(void **)(a1 + 24);
  if (a3)
  {
    if (!v8) {
      char v8 = *(void **)(a1 + 8);
    }
    id v9 = v8;
    xpc_dictionary_set_value(v9, (const char *)[a3 UTF8String], a2);
    goto LABEL_7;
  }
  if (!v8) {
    char v8 = *(void **)(a1 + 8);
  }
  xpc_array_append_value(v8, a2);
LABEL_41:
}

void sub_18AAB6188(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *exc_buf, Class aClass, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint8_t buf,int a40,int a41,__int16 a42,int a43,__int16 a44,__int16 a45,uint64_t a46)
{
}

void sub_18AAB6450(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {

    objc_end_catch();
    JUMPOUT(0x18AAB641CLL);
  }
  _Unwind_Resume(a1);
}

id BSXPCObjectBaseClass()
{
  if (qword_1EB21B260 != -1) {
    dispatch_once(&qword_1EB21B260, &__block_literal_global_22);
  }
  v0 = (void *)_MergedGlobals_25;
  return v0;
}

objc_class *BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  int v2 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(a1, a2);
  return v2;
}

char *BSDeserializeStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  int v2 = (char *)BSCreateDeserializedStringFromXPCDictionaryWithKey(a1, a2);
  return v2;
}

objc_class *BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    id v5 = xpc_dictionary_get_value(v3, a2);
    id v6 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_18AAB65C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

objc_class *BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E4F14590])
  {
    id v4 = (NSString *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v2, "bs_class");
    Class v5 = NSClassFromString(v4);
    id v3 = v5;
    if (v4 && !v5)
    {
      id v6 = (NSString *)BSCreateDeserializedStringFromXPCDictionaryWithKey(v2, "bs_fallback");
      id v3 = NSClassFromString(v6);
    }
    if (v3) {
      id v3 = (objc_class *)[[v3 alloc] initWithXPCDictionary:v2];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_18AAB6698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const char *BSCreateDeserializedStringFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    string = xpc_dictionary_get_string(v3, a2);
    if (string) {
      string = (const char *)[[NSString alloc] initWithCString:string encoding:4];
    }
  }
  else
  {
    string = 0;
  }

  return string;
}

void sub_18AAB6734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _BSXPCEncodeDictionaryWithKey(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = (id *)(a1 + 24);
  id v6 = *(void **)(a1 + 24);
  if (!v6) {
    id v6 = *(void **)(a1 + 8);
  }
  id v8 = v6;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  objc_storeStrong(v7, v9);
  id v10 = v8;
  id v25 = v10;
  if (a2)
  {
    if (!v10
      || (Class Class = object_getClass(v10),
          xpc_object_t v12 = (objc_class *)MEMORY[0x1E4F14590],
          v25,
          v25,
          Class != v12))
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(BSXPCCoder *const __strong, NSString *const __strong, void (^const __strong)(__strong xpc_object_t))");
      [v13 handleFailureInFunction:v14 file:@"BSXPCCoder.m" lineNumber:358 description:&stru_1ED76E928];
LABEL_24:
    }
  }
  else if (!v10 {
         || (Class v15 = object_getClass(v10),
  }
             uint64_t v16 = (objc_class *)MEMORY[0x1E4F14568],
             v25,
             v25,
             v15 != v16))
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSXPCEncodeDictionaryWithKey(BSXPCCoder *const __strong, NSString *const __strong, void (^const __strong)(__strong xpc_object_t))");
    [v13 handleFailureInFunction:v14 file:@"BSXPCCoder.m" lineNumber:357 description:&stru_1ED76E928];
    goto LABEL_24;
  }
  (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, v9);
  if (v9 && xpc_dictionary_get_count(v9))
  {
    if (a2)
    {
      v17 = (const char *)[a2 UTF8String];
      id v18 = v25;
      id v19 = v9;
      if (v17)
      {
        if (v25 && object_getClass(v19) == (Class)MEMORY[0x1E4F14590]) {
          xpc_dictionary_set_value(v18, v17, v19);
        }
      }
      else
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        v24 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable __strong, xpc_type_t _Nullable)");
        [v23 handleFailureInFunction:v24 file:@"BSXPCObjectUtilities.h" lineNumber:61 description:@"key must not be nil"];
      }
    }
    else
    {
      id v20 = v25;
      id v21 = v9;
      if (v25 && object_getClass(v21) == (Class)MEMORY[0x1E4F14590]) {
        xpc_array_append_value(v20, v21);
      }
    }
  }
  id v22 = _BSXPCPopEncodingContext(a1, v25);
}

void sub_18AAB6A54(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, id a11)
{
}

void sub_18AAB6B14()
{
  objc_end_catch();
  JUMPOUT(0x18AAB6AE0);
}

void sub_18AAB6B28()
{
}

void sub_18AAB6B30()
{
}

id _BSXPCPopEncodingContext(uint64_t a1, void *a2)
{
  Class v5 = (id *)(a1 + 24);
  id v4 = *(void **)(a1 + 24);
  if (!v4) {
    id v4 = *(void **)(a1 + 8);
  }
  id v6 = v4;
  objc_storeStrong(v5, a2);
  uint64_t v7 = *(void **)(a1 + 24);
  if (v7 == *(void **)(a1 + 8))
  {
    id *v5 = 0;
  }
  return v6;
}

void sub_18AAB6D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  id v22 = v21;

  _Unwind_Resume(a1);
}

void BSSettingsDecodeSettingEntries(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  Class v5 = (void (**)(void, void, void, void))v4;
  if (!v3 || !v4) {
    goto LABEL_7;
  }
  Class Class = object_getClass(v3);
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F14568];
  if (Class == (Class)MEMORY[0x1E4F14568])
  {
    size_t count = xpc_array_get_count(v3);
    if (!count) {
      goto LABEL_7;
    }
    size_t v10 = 0;
    while (1)
    {
      id v11 = xpc_array_get_value(v3, v10);
      xpc_object_t v12 = v11;
      if (v11 && object_getClass(v11) == v7)
      {
        size_t v14 = xpc_array_get_count(v12);
        if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          Class v15 = xpc_array_get_value(v12, 0);
          id v13 = v15;
          if (!v15 || object_getClass(v15) != (Class)MEMORY[0x1E4F145F8])
          {
            uint64_t v16 = BSLogCommon();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              id v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
              __int16 v23 = 2112;
              v24 = v13;
              __int16 v25 = 2114;
              id v26 = v12;
              _os_log_error_impl(&dword_18AAA8000, v16, OS_LOG_TYPE_ERROR, "%s an encoded entry key format is unknown -> %@ : %{public}@", buf, 0x20u);
            }
            goto LABEL_30;
          }
          uint64_t value = xpc_uint64_get_value(v13);
          uint64_t v18 = xpc_array_get_value(v12, 1uLL);
          uint64_t v16 = v18;
          if (v14 < 3)
          {
            id v19 = 0;
            if (v18) {
              goto LABEL_28;
            }
LABEL_24:
            id v20 = BSLogCommon();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
              __int16 v23 = 2114;
              v24 = v12;
              _os_log_error_impl(&dword_18AAA8000, v20, OS_LOG_TYPE_ERROR, "%s the encoded entry was empty -> %{public}@", buf, 0x16u);
            }
          }
          else
          {
            id v19 = xpc_array_get_value(v12, 2uLL);
            if (!v16) {
              goto LABEL_24;
            }
LABEL_28:
            ((void (**)(void, uint64_t, NSObject *, void *))v5)[2](v5, value, v16, v19);
          }

LABEL_30:
          goto LABEL_13;
        }
        id v13 = BSLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_21:
          *(_DWORD *)buf = 136315394;
          id v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
          __int16 v23 = 2114;
          v24 = v12;
          _os_log_error_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_ERROR, "%s an encoded entry format is unknown -> %{public}@", buf, 0x16u);
        }
      }
      else
      {
        id v13 = BSLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
      }
LABEL_13:

      if (count == ++v10) {
        goto LABEL_7;
      }
    }
  }
  id v8 = BSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v22 = "void BSSettingsDecodeSettingEntries(__strong xpc_object_t, __strong BSSettingDecodeBlock)";
    __int16 v23 = 2114;
    v24 = v3;
    _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "%s the encoded entries format is unknown -> %{public}@", buf, 0x16u);
  }

LABEL_7:
}

void sub_18AAB7148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB72A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSSettingsDecodeSettingObject(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  Class v5 = v4;
  if (!v4)
  {
    id v11 = v3;
    goto LABEL_19;
  }
  int64_t value = xpc_int64_get_value(v4);
  if (value == 2)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F29270]);
    [v12 beginReadingFromXPCObject:v3];
    if (qword_1EB21B3D0 != -1) {
      dispatch_once(&qword_1EB21B3D0, &__block_literal_global_208);
    }
    id v11 = [v12 decodeObjectOfClasses:_MergedGlobals_37 forKey:@"__BSXPCSecureValue"];
  }
  else
  {
    if (value == 1)
    {
      uint64_t v7 = +[BSXPCCoder coderWithMessage:v3];
      id v8 = [v7 decodeStringForKey:@"__BSXPCSecureClass"];
      xpc_object_t v9 = v8;
      if (v8)
      {
        Class v10 = NSClassFromString(v8);
        if (v10)
        {
          id v11 = [v7 decodeObjectOfClass:v10 forKey:@"__BSXPCSecureValue"];
LABEL_18:

          goto LABEL_19;
        }
        size_t v14 = BSLogCommon();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_17:

          id v11 = 0;
          goto LABEL_18;
        }
        int v17 = 138412290;
        uint64_t v18 = v9;
        Class v15 = "unable to decode \"%@\" because this class does not exist";
      }
      else
      {
        size_t v14 = BSLogCommon();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        int v17 = 138412290;
        uint64_t v18 = (NSString *)v3;
        Class v15 = "no class specified in message: %@";
      }
      _os_log_error_impl(&dword_18AAA8000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);
      goto LABEL_17;
    }
    id v13 = BSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412546;
      uint64_t v18 = v5;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_error_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_ERROR, "unknown coder type (%@) specified by message: %@", (uint8_t *)&v17, 0x16u);
    }

    id v11 = 0;
  }
LABEL_19:

  return v11;
}

void sub_18AAB753C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(a1);
    Class v15 = BSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v14;
      _os_log_error_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_ERROR, "exception caught while decoding message: %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18AAB73ECLL);
  }

  _Unwind_Resume(a1);
}

void sub_18AAB77AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB78B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id BSSerializeBSXPCEncodableObjectToXPCDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  Class v5 = v4;
  if (v3)
  {
    if (v4)
    {
      [v3 encodeWithXPCDictionary:v4];
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      BSSerializeStringToXPCDictionaryWithKey(v7, v5, "bs_class");

      if (objc_opt_respondsToSelector())
      {
        id v8 = NSStringFromClass((Class)[v3 fallbackXPCEncodableClass]);
        BSSerializeStringToXPCDictionaryWithKey(v8, v5, "bs_fallback");
      }
    }
  }

  return v5;
}

void sub_18AAB7994(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void BSSerializeStringToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v6 = a1;
  id v5 = a2;
  if (v6 && v5 && a3) {
    xpc_dictionary_set_string(v5, a3, (const char *)[v6 UTF8String]);
  }
}

void sub_18AAB7A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB7C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB7CE0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAB7D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAB7EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB7FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB80C0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18AAB823C(_Unwind_Exception *exception_object)
{
}

void sub_18AAB82F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAB8404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB84BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB86E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB8810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB8884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAB88FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB89BC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAB8A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAB8AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL BSFloatGreaterThanFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) >= 2.22044605e-16 && a1 > a2;
}

uint64_t BSEqualArrays(CFArrayRef theArray, const __CFArray *a2)
{
  if (theArray == a2) {
    return 1;
  }
  uint64_t result = 0;
  if (theArray && a2)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count == CFArrayGetCount(a2))
    {
      return [(__CFArray *)theArray isEqualToArray:a2];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_18AAB8C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB8CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB8E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB8F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB9610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAB99DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, objc_super a15)
{
  a15.super_class = (Class)BSTransaction;
  [(_Unwind_Exception *)&a15 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAB9B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAB9D3C(_Unwind_Exception *exception_object)
{
}

void sub_18AAB9E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_18AABA194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABA26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABA358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AABA8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABA99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABABDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABADA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABAF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABB1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSIntegerMapRemoveObjectForKey(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  if (v3)
  {
    if (a2)
    {
LABEL_3:
      [v3[1] removeObjectForKey:a2];
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSIntegerMapRemoveObjectForKey(BSMutableIntegerMap *__strong _Nonnull, NSInteger)");
    [v4 handleFailureInFunction:v5, @"BSIntegerMap.m", 245, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];

    id v3 = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  id v6 = v3[2];
  v3[2] = 0;

LABEL_6:
}

void sub_18AABB2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AABB650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABB70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AABBA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AABBB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABBD24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABBDC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABBE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AABC048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABC154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABC304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABC48C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABC5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABC678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AABC71C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABC7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSIntegerMapAllValues(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"NSArray * _Nonnull BSIntegerMapAllValues(BSIntegerMap *__strong _Nonnull)"];
    [v4 handleFailureInFunction:v5, @"BSIntegerMap.m", 184, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];
  }
  int v2 = NSAllMapTableValues(v1[1]);

  return v2;
}

void sub_18AABC87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSIntegerMapAllKeys(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"BSIntegerSet * _Nonnull BSIntegerMapAllKeys(BSIntegerMap *__strong _Nonnull)"];
    [v5 handleFailureInFunction:v6, @"BSIntegerMap.m", 175, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];
  }
  int v2 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __BSIntegerMapAllKeys_block_invoke;
  v7[3] = &unk_1E5446008;
  id v3 = v2;
  id v8 = v3;
  BSIntegerMapEnumerateKeysWithBlock(v1, v7);

  return v3;
}

void sub_18AABC9FC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AABCA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABCB38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSFloatGreaterThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 > a2;
}

double BSMonotonicReferencedTimeFromMachTime(unint64_t a1)
{
  if (_MergedGlobals_9 != -1) {
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  }
  return *(double *)&qword_1EB21B0C0 * (double)a1;
}

void sub_18AABCE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABCF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSRectEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (CGRectEqualToRect(*(CGRect *)&a1, *(CGRect *)&a5)) {
    return 1;
  }
  double v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= 2.22044605e-16 || v17 >= 2.22044605e-16) {
    return 0;
  }
  BOOL v19 = vabdd_f64(a3, a7) < 2.22044605e-16;
  return vabdd_f64(a4, a8) < 2.22044605e-16 && v19;
}

uint64_t BSCompareFloats(double a1, double a2)
{
  double v2 = vabdd_f64(a1, a2);
  BOOL v3 = v2 < 2.22044605e-16 || a1 <= a2;
  uint64_t v4 = 1;
  if (v3) {
    uint64_t v4 = -1;
  }
  if (v2 >= 2.22044605e-16) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t BSSettingsDiffIsEmpty(void *a1)
{
  id v1 = a1;
  double v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 isEmpty];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

void sub_18AABD0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABD92C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABDB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABDDF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABE09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)BSBlockSentinel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AABE298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABE5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABF0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_18AABF340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AABF7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_18AABF97C(_Unwind_Exception *exception_object)
{
}

void sub_18AABFC78(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2)
  {

    objc_end_catch();
    JUMPOUT(0x18AABFCD8);
  }
  _Unwind_Resume(v13);
}

void sub_18AABFCE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  objc_end_catch();

  _Unwind_Resume(v18);
}

void sub_18AABFE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC0008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC0788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_18AAC09C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC0D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_18AAC0FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLogCommon()
{
  if (BSLogCommon_onceToken != -1) {
    dispatch_once(&BSLogCommon_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)BSLogCommon___logObj;
  return v0;
}

void sub_18AAC1084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSDeserializeCGRectFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    id v6 = xpc_dictionary_get_value(v4, a2);
    double v5 = BSDeserializeCGRectFromXPCObject(v6);
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
  }

  return v5;
}

void sub_18AAC1250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSDeserializeCGRectFromXPCObject(void *a1)
{
  id v1 = a1;
  double v2 = v1;
  double v3 = *MEMORY[0x1E4F1DB28];
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E4F14568] && xpc_array_get_count(v2) == 4)
  {
    double v3 = xpc_array_get_double(v2, 0);
    xpc_array_get_double(v2, 1uLL);
    xpc_array_get_double(v2, 2uLL);
    xpc_array_get_double(v2, 3uLL);
  }

  return v3;
}

void sub_18AAC1330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC13E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC146C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC15B4(_Unwind_Exception *exception_object)
{
}

void sub_18AAC1C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __BSDescribeAppendObjectDescription_block_invoke_3(uint64_t a1, __CFString *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(id *)(v4 + 8);
  switch(*(void *)(v4 + 1104))
  {
    case 1:
      id v6 = (void *)(v4 + 1040);
      uint64_t v7 = *(void *)(v4 + 1040);
      id v8 = (const char *)(v4 + 16);
      if (*(void *)(*(void *)(v4 + 8) + 24) == 3)
      {
        if (v7 > 1022)
        {
          v8[v7] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
          *(void *)(v4 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), ";", 0x8000100u);
        }
        else
        {
          v8[v7] = 59;
          ++*v6;
        }
        goto LABEL_11;
      }
      if (v7 <= 1021)
      {
        *(_WORD *)&v8[v7] = 8251;
        uint64_t v11 = 2;
        goto LABEL_19;
      }
      v8[v7] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
      id v12 = (CFMutableStringRef *)(v4 + 1064);
      id v13 = "; ";
      goto LABEL_24;
    case 2:
      id v6 = (void *)(v4 + 1040);
      uint64_t v9 = *(void *)(v4 + 1040);
      Class v10 = (const char *)(v4 + 16);
      if (v9 <= 1022)
      {
        v10[v9] = 32;
        uint64_t v11 = 1;
        goto LABEL_19;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v10, 0x8000100u);
      id v12 = (CFMutableStringRef *)(v4 + 1064);
      id v13 = " ";
LABEL_24:
      *id v6 = 0;
      CFStringAppendCString(*v12, v13, 0x8000100u);
      break;
    case 3:
LABEL_11:
      uint64_t v14 = *(void *)(v4 + 1040);
      Class v15 = (const char *)(v4 + 16);
      if (v14 > 1022)
      {
        v15[v14] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v15, 0x8000100u);
        *(void *)(v4 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v15[v14] = 10;
        ++*(void *)(v4 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      uint64_t v16 = *(void *)(v4 + 1072);
      if (v16 < 1) {
        break;
      }
      if (v16 >= 8) {
        uint64_t v16 = 8;
      }
      double v17 = (const char *)*((void *)&sIndentSpaceStrings + v16);
      size_t v18 = strlen(v17);
      id v6 = (void *)(v4 + 1040);
      uint64_t v19 = *(void *)(v4 + 1040);
      if ((uint64_t)(v19 + v18) > 1023)
      {
        if (v19 >= 1)
        {
          *(unsigned char *)(v4 + 16 + v19) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), (const char *)(v4 + 16), 0x8000100u);
          *id v6 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v17, 0x8000100u);
      }
      else
      {
        uint64_t v11 = v18;
        memcpy((void *)(v4 + v19 + 16), v17, v18);
LABEL_19:
        *v6 += v11;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(void *)(v4 + 1104) = 0;
LABEL_26:
  uint64_t v20 = v5[8];
  uint64_t v21 = v5[9];
  if (v20 < 2 || v21 < 1)
  {
    uint64_t v21 = 0;
    uint64_t v23 = 1096;
  }
  else
  {
    *(void *)(v4 + 1096) = v20;
    *(void *)(v4 + 1080) = *(void *)(v4 + 1040) + [*(id *)(v4 + 1064) length];
    uint64_t v23 = 1088;
  }
  *(void *)(v4 + v23) = v21;

  uint64_t v24 = *(void *)(a1 + 32);
  if (a2)
  {
    if (_NSIsNSString())
    {
      CFIndex v25 = [(__CFString *)a2 length];
      uint64_t v26 = *(void *)(v24 + 1040);
      if (3 * v25 + v26 > 1023)
      {
        if (v26 >= 1)
        {
          *(unsigned char *)(v24 + 16 + v26) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
          *(void *)(v24 + 1040) = 0;
        }
        if (v25 > 341)
        {
          [*(id *)(v24 + 1064) appendString:a2];
          goto LABEL_109;
        }
        CFIndex usedBufLen = 0;
        v66.location = 0;
        v66.length = v25;
        CFStringGetBytes(a2, v66, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
        CFIndex v27 = usedBufLen;
      }
      else
      {
        CFIndex usedBufLen = 0;
        v65.location = 0;
        v65.length = v25;
        CFStringGetBytes(a2, v65, 0x8000100u, 0, 0, (UInt8 *)(v24 + v26 + 16), 1024 - v26, &usedBufLen);
        CFIndex v27 = *(void *)(v24 + 1040) + usedBufLen;
      }
      goto LABEL_49;
    }
    if (_NSIsNSNumber())
    {
      id v30 = a2;
      int v31 = *(char *)[(__CFString *)v30 objCType];
      if (v31 > 80)
      {
        switch(v31)
        {
          case 'c':
            goto LABEL_68;
          case 'd':
            uint64_t v32 = *(void *)(v24 + 1040);
            if (v32 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v32) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            id v33 = *(void **)(v24 + 1064);
            [(__CFString *)v30 doubleValue];
            id v35 = @"%0.16g";
            goto LABEL_90;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_82;
          case 'f':
            uint64_t v45 = *(void *)(v24 + 1040);
            if (v45 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v45) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            id v33 = *(void **)(v24 + 1064);
            [(__CFString *)v30 floatValue];
            double v34 = v46;
            id v35 = @"%0.7g";
LABEL_90:
            objc_msgSend(v33, "appendFormat:", v35, *(void *)&v34);
            goto LABEL_108;
          case 'i':
            uint64_t v47 = *(void *)(v24 + 1040);
            if (v47 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v47) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 intValue];
            goto LABEL_94;
          case 'l':
            uint64_t v48 = *(void *)(v24 + 1040);
            if (v48 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v48) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 longValue];
            v40 = @"%ld";
            goto LABEL_107;
          case 'q':
            uint64_t v49 = *(void *)(v24 + 1040);
            if (v49 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v49) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 longLongValue];
            v40 = @"%lld";
            goto LABEL_107;
          case 's':
            uint64_t v50 = *(void *)(v24 + 1040);
            if (v50 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v50) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 shortValue];
            v40 = @"%hi";
            goto LABEL_107;
          default:
            if (v31 == 81)
            {
              uint64_t v51 = *(void *)(v24 + 1040);
              if (v51 >= 1)
              {
                *(unsigned char *)(v24 + 16 + v51) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(void *)(v24 + 1040) = 0;
              }
              uint64_t v37 = *(void **)(v24 + 1064);
              uint64_t v38 = [(__CFString *)v30 unsignedLongLongValue];
              v40 = @"%llu";
            }
            else
            {
              if (v31 != 83) {
                goto LABEL_82;
              }
              uint64_t v42 = *(void *)(v24 + 1040);
              if (v42 >= 1)
              {
                *(unsigned char *)(v24 + 16 + v42) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(void *)(v24 + 1040) = 0;
              }
              uint64_t v37 = *(void **)(v24 + 1064);
              uint64_t v38 = [(__CFString *)v30 unsignedShortValue];
              v40 = @"%hu";
            }
            break;
        }
        goto LABEL_107;
      }
      if (v31 > 72)
      {
        if (v31 == 73)
        {
          uint64_t v43 = *(void *)(v24 + 1040);
          if (v43 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v43) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 unsignedIntValue];
          goto LABEL_81;
        }
        if (v31 == 76)
        {
          uint64_t v39 = *(void *)(v24 + 1040);
          if (v39 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v39) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 unsignedLongValue];
          v40 = @"%lu";
          goto LABEL_107;
        }
      }
      else
      {
        if (v31 == 66)
        {
LABEL_68:
          uint64_t v41 = *(void *)(v24 + 1040);
          if (v41 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v41) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 charValue];
LABEL_94:
          v40 = @"%d";
          goto LABEL_107;
        }
        if (v31 == 67)
        {
          uint64_t v36 = *(void *)(v24 + 1040);
          if (v36 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v36) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 unsignedCharValue];
LABEL_81:
          v40 = @"%u";
LABEL_107:
          objc_msgSend(v37, "appendFormat:", v40, v38);
LABEL_108:

          goto LABEL_109;
        }
      }
LABEL_82:
      uint64_t v44 = *(void *)(v24 + 1040);
      if (v44 >= 1)
      {
        *(unsigned char *)(v24 + 16 + v44) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(void *)(v24 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v24 + 1064), "appendFormat:", @"<***unknown type:%s>", -[__CFString objCType](v30, "objCType"));
      goto LABEL_108;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a2 appendDescriptionToStream:v24];
      goto LABEL_109;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a2 appendDescriptionToFormatter:v24];
      goto LABEL_109;
    }
    if (_NSIsNSDictionary())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = (uint64_t (*)())__BSDescribeAppendObjectDescription_block_invoke;
      v63 = &unk_1E5446820;
      uint64_t v64 = v24;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v24, a2, 0, (uint64_t)&usedBufLen);
      goto LABEL_109;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)v24 appendIntegerSet:a2 withName:0 format:0];
      goto LABEL_109;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = (uint64_t (*)())__BSDescribeAppendObjectDescription_block_invoke_2;
      v63 = &unk_1E5446848;
      uint64_t v64 = v24;
      [(id)v24 appendIntegerMap:a2 withName:0 keyFormat:0 valueBlock:&usedBufLen];
      goto LABEL_109;
    }
    if (objc_opt_respondsToSelector())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = __BSDescribeAppendObjectDescription_block_invoke_3;
      v63 = &unk_1E5446848;
      uint64_t v64 = v24;
      [(id)v24 appendCollection:a2 withName:0 itemBlock:&usedBufLen];
      goto LABEL_109;
    }
    if (*(unsigned char *)(v24 + 1056) || (uint64_t v54 = *(void *)(v24 + 8), *(void *)(v54 + 8) == 2))
    {
      if (objc_opt_respondsToSelector())
      {
        v55 = [(__CFString *)a2 succinctDescription];
        goto LABEL_121;
      }
      uint64_t v54 = *(void *)(v24 + 8);
    }
    if (*(void *)(v54 + 16) == 2) {
      [(__CFString *)a2 debugDescription];
    }
    else {
    v55 = [(__CFString *)a2 description];
    }
LABEL_121:
    v56 = v55;
    CFIndex v57 = [(__CFString *)v55 length];
    uint64_t v58 = *(void *)(v24 + 1040);
    if (v58 + 3 * v57 > 1023)
    {
      if (v58 >= 1)
      {
        *(unsigned char *)(v24 + 16 + v58) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(void *)(v24 + 1040) = 0;
      }
      if (v57 > 341)
      {
        [*(id *)(v24 + 1064) appendString:v56];
        goto LABEL_129;
      }
      CFIndex usedBufLen = 0;
      v68.location = 0;
      v68.length = v57;
      CFStringGetBytes(v56, v68, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
      CFIndex v59 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v67.location = 0;
      v67.length = v57;
      CFStringGetBytes(v56, v67, 0x8000100u, 0, 0, (UInt8 *)(v24 + v58 + 16), 1024 - v58, &usedBufLen);
      CFIndex v59 = *(void *)(v24 + 1040) + usedBufLen;
    }
    *(void *)(v24 + 1040) = v59;
LABEL_129:

    goto LABEL_109;
  }
  uint64_t v28 = *(void *)(v24 + 1040);
  uint64_t v29 = v24 + 16 + v28;
  if (v28 <= 1018)
  {
    *(unsigned char *)(v29 + 4) = 62;
    *(_DWORD *)uint64_t v29 = 1818848828;
    CFIndex v27 = *(void *)(v24 + 1040) + 5;
LABEL_49:
    *(void *)(v24 + 1040) = v27;
    goto LABEL_109;
  }
  *(unsigned char *)uint64_t v29 = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
  *(void *)(v24 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), "<nil>", 0x8000100u);
LABEL_109:
  uint64_t v52 = *(void *)(a1 + 32);
  *(void *)(v52 + 1104) = 1;
  return BSDescribeTruncationCommit(v52);
}

void sub_18AAC27A0(_Unwind_Exception *exception_object)
{
}

id BSDescribeAppendFieldFormat(uint64_t a1, __CFString *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v12 = *(id *)(a1 + 8);
  switch(*(void *)(a1 + 1104))
  {
    case 1:
      id v13 = (void *)(a1 + 1040);
      uint64_t v14 = *(void *)(a1 + 1040);
      Class v15 = (const char *)(a1 + 16);
      if (*(void *)(*(void *)(a1 + 8) + 24) == 3)
      {
        if (v14 > 1022)
        {
          v15[v14] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v15, 0x8000100u);
          *(void *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
        }
        else
        {
          v15[v14] = 59;
          ++*v13;
        }
        goto LABEL_11;
      }
      if (v14 <= 1021)
      {
        *(_WORD *)&v15[v14] = 8251;
        uint64_t v18 = 2;
        goto LABEL_19;
      }
      v15[v14] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v15, 0x8000100u);
      uint64_t v19 = (CFMutableStringRef *)(a1 + 1064);
      uint64_t v20 = "; ";
      goto LABEL_24;
    case 2:
      id v13 = (void *)(a1 + 1040);
      uint64_t v16 = *(void *)(a1 + 1040);
      double v17 = (const char *)(a1 + 16);
      if (v16 <= 1022)
      {
        v17[v16] = 32;
        uint64_t v18 = 1;
        goto LABEL_19;
      }
      v17[v16] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v17, 0x8000100u);
      uint64_t v19 = (CFMutableStringRef *)(a1 + 1064);
      uint64_t v20 = " ";
LABEL_24:
      *id v13 = 0;
      CFStringAppendCString(*v19, v20, 0x8000100u);
      break;
    case 3:
LABEL_11:
      uint64_t v21 = *(void *)(a1 + 1040);
      id v22 = (const char *)(a1 + 16);
      if (v21 > 1022)
      {
        v22[v21] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v22, 0x8000100u);
        *(void *)(a1 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v22[v21] = 10;
        ++*(void *)(a1 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      uint64_t v23 = *(void *)(a1 + 1072);
      if (v23 < 1) {
        break;
      }
      if (v23 >= 8) {
        uint64_t v23 = 8;
      }
      uint64_t v24 = (const char *)*((void *)&sIndentSpaceStrings + v23);
      size_t v25 = strlen(v24);
      id v13 = (void *)(a1 + 1040);
      uint64_t v26 = *(void *)(a1 + 1040);
      if ((uint64_t)(v26 + v25) > 1023)
      {
        if (v26 >= 1)
        {
          *(unsigned char *)(a1 + 16 + v26) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *id v13 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v24, 0x8000100u);
      }
      else
      {
        uint64_t v18 = v25;
        memcpy((void *)(a1 + v26 + 16), v24, v25);
LABEL_19:
        *v13 += v18;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(void *)(a1 + 1104) = 0;
LABEL_26:
  if (!a2) {
    goto LABEL_58;
  }
  uint64_t v27 = v12[6];
  uint64_t v28 = v12[7];
  if (v27 < 2 || v28 < 1)
  {
    *(void *)(a1 + 1096) = 0;
  }
  else
  {
    *(void *)(a1 + 1096) = v27;
    *(void *)(a1 + 1080) = *(void *)(a1 + 1040) + [*(id *)(a1 + 1064) length];
    *(void *)(a1 + 1088) = v28;
  }
  CFIndex v30 = [(__CFString *)a2 length];
  uint64_t v31 = *(void *)(a1 + 1040);
  if (v31 + 3 * v30 > 1023)
  {
    if (v31 >= 1)
    {
      *(unsigned char *)(a1 + 16 + v31) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
      *(void *)(a1 + 1040) = 0;
    }
    if (v30 > 341)
    {
      [*(id *)(a1 + 1064) appendString:a2];
      goto LABEL_41;
    }
    CFIndex usedBufLen = 0;
    v53.location = 0;
    v53.length = v30;
    CFStringGetBytes(a2, v53, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
    CFIndex v32 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v52.location = 0;
    v52.length = v30;
    CFStringGetBytes(a2, v52, 0x8000100u, 0, 0, (UInt8 *)(a1 + v31 + 16), 1024 - v31, &usedBufLen);
    CFIndex v32 = *(void *)(a1 + 1040) + usedBufLen;
  }
  *(void *)(a1 + 1040) = v32;
LABEL_41:
  BSDescribeTruncationCommit(a1);
  if (*(uint64_t *)(a1 + 1048) <= 0) {
    id v33 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    id v33 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v34 = *(void *)(*(void *)(a1 + 8) + *v33);
  if (v34 < 2)
  {
    uint64_t v38 = *(void *)(a1 + 1040);
    uint64_t v39 = (const char *)(a1 + 16);
    if (v38 <= 1021)
    {
      *(_WORD *)&v39[v38] = 8250;
      uint64_t v37 = 2;
      goto LABEL_53;
    }
    v39[v38] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v39, 0x8000100u);
    uint64_t v42 = ": ";
  }
  else if (v34 == 2)
  {
    uint64_t v40 = *(void *)(a1 + 1040);
    uint64_t v41 = a1 + 16 + v40;
    if (v40 <= 1020)
    {
      *(unsigned char *)(v41 + 2) = 32;
      *(_WORD *)uint64_t v41 = 15648;
      uint64_t v37 = 3;
      goto LABEL_53;
    }
    *(unsigned char *)uint64_t v41 = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
    uint64_t v42 = " = ";
  }
  else
  {
    if (v34 != 3) {
      goto LABEL_58;
    }
    uint64_t v35 = *(void *)(a1 + 1040);
    uint64_t v36 = (const char *)(a1 + 16);
    if (v35 <= 1019)
    {
      *(_DWORD *)&v36[v35] = 540945696;
      uint64_t v37 = 4;
LABEL_53:
      *(void *)(a1 + 1040) += v37;
      goto LABEL_58;
    }
    v36[v35] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v36, 0x8000100u);
    uint64_t v42 = " -> ";
  }
  *(void *)(a1 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v42, 0x8000100u);
LABEL_58:
  uint64_t v43 = v12[8];
  uint64_t v44 = v12[9];
  if (v43 <= 1 || v44 < 1)
  {
    uint64_t v44 = 0;
    uint64_t v46 = 1096;
  }
  else
  {
    *(void *)(a1 + 1096) = v43;
    *(void *)(a1 + 1080) = *(void *)(a1 + 1040) + [*(id *)(a1 + 1064) length];
    uint64_t v46 = 1088;
  }
  *(void *)(a1 + v46) = v44;

  uint64_t v47 = *(void *)(a1 + 1040);
  if (v47 >= 1)
  {
    *(unsigned char *)(a1 + 16 + v47) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
    *(void *)(a1 + 1040) = 0;
  }
  CFIndex usedBufLen = (CFIndex)&a9;
  CFStringAppendFormatAndArguments(*(CFMutableStringRef *)(a1 + 1064), 0, a3, &a9);
  *(void *)(a1 + 1104) = 1;
  BSDescribeTruncationCommit(a1);
  id v48 = (id)a1;
  return v48;
}

void sub_18AAC2D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC3B14(_Unwind_Exception *exception_object)
{
}

uint64_t BSDescribeTruncationCommit(uint64_t result)
{
  if (*(uint64_t *)(result + 1096) >= 2)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 1040);
    if (v2 >= 1)
    {
      *(unsigned char *)(result + 16 + v2) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(result + 1064), (const char *)(result + 16), 0x8000100u);
      *(void *)(v1 + 1040) = 0;
    }
    uint64_t v3 = *(void *)(v1 + 1080);
    uint64_t result = [*(id *)(v1 + 1064) length];
    uint64_t v4 = result - v3 - *(void *)(v1 + 1088);
    if (v4 < 1) {
      goto LABEL_11;
    }
    uint64_t v5 = *(void *)(v1 + 1096);
    if (v5 != 2)
    {
      if (v5 == 3)
      {
        uint64_t v3 = v3 + (result - v3) / 2 - ((unint64_t)v4 >> 1);
      }
      else
      {
        if (v5 != 4)
        {
LABEL_11:
          *(void *)(v1 + 1088) = 0;
          *(void *)(v1 + 1096) = 0;
          return result;
        }
        v3 += *(void *)(v1 + 1088);
      }
    }
    uint64_t result = objc_msgSend(*(id *)(v1 + 1064), "replaceCharactersInRange:withString:", v3);
    goto LABEL_11;
  }
  return result;
}

void sub_18AAC3CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _BSDefaultDescriptionStyle()
{
  if (qword_1EB21B2D0 != -1) {
    dispatch_once(&qword_1EB21B2D0, &__block_literal_global_25);
  }
  v0 = (void *)_MergedGlobals_30;
  return v0;
}

void sub_18AAC3EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC4108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC427C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC4374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC44D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC457C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC47B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC4984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_18AAC4A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_18AAC4B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AAC4C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC4DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSBundleIDForAuditToken(long long *a1)
{
  uint64_t v2 = BSGetVersionedPID();
  long long v3 = a1[1];
  long long v8 = *a1;
  long long v9 = v3;
  if (v2 == BSVersionedPIDForAuditToken(&v8))
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    [v4 bundleIdentifier];
  }
  else
  {
    long long v5 = a1[1];
    long long v8 = *a1;
    long long v9 = v5;
    uint64_t v4 = BSExecutablePathForAuditToken();
    BSBundleIDForExecutablePath(v4);
  id v6 = };

  return v6;
}

void sub_18AAC4F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSGetVersionedPID()
{
  if (BSGetVersionedPID_onceToken != -1) {
    dispatch_once(&BSGetVersionedPID_onceToken, &__block_literal_global_5);
  }
  return BSGetVersionedPID___versionedPID;
}

void sub_18AAC508C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC56C4(_Unwind_Exception *exception_object)
{
}

void sub_18AAC57D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC5878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC58D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC5A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC5B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  uint64_t v2 = BSCreateDeserializedArrayFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_27);
  return v2;
}

id BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  uint64_t v2 = (void *)BSCreateDeserializedSetFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_32);
  return v2;
}

uint64_t BSCreateDeserializedSetFromXPCDictionaryWithKey(void *a1, const char *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (v5 && (uint64_t v7 = BSCreateDeserializedArrayFromXPCDictionaryWithKey(v5, a2, v6)) != 0)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_18AAC5CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *BSCreateDeserializedArrayFromXPCDictionaryWithKey(void *a1, const char *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = (void (**)(void, void))v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    long long v9 = xpc_dictionary_get_value(v5, a2);
    Class v10 = v9;
    if (v9 && object_getClass(v9) == (Class)MEMORY[0x1E4F14568])
    {
      size_t count = xpc_array_get_count(v10);
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:count];
      if (count)
      {
        for (size_t i = 0; i != count; ++i)
        {
          uint64_t v14 = xpc_array_get_value(v10, i);
          if (v14)
          {
            Class v15 = ((void (**)(void, void *))v7)[2](v7, v14);
            if (v15) {
              [v8 addObject:v15];
            }
          }
        }
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

void sub_18AAC5E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

objc_class *__BSCreateDeserializedArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(a2);
  return v2;
}

objc_class *__BSCreateDeserializedSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(a2);
  return v2;
}

BOOL BSFloatApproximatelyEqualToFloat(double a1, double a2, double a3)
{
  double v3 = vabdd_f64(a1, a2);
  return vabdd_f64(v3, a3) < 2.22044605e-16 || v3 < a3;
}

void sub_18AAC5F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t BSCompareIntegers(uint64_t a1, uint64_t a2)
{
  if (a1 < a2) {
    return -1;
  }
  else {
    return a1 > a2;
  }
}

BOOL BSPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 2.22044605e-16;
  return vabdd_f64(a2, a4) < 2.22044605e-16 && v4;
}

void sub_18AAC62FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSFloatLessThanFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) >= 2.22044605e-16 && a1 < a2;
}

uint64_t BSPIDIsBeingDebugged(int a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1 < 1) {
    return 0;
  }
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  BOOL v1 = _BSShortBSDProcessInfoForPID(a1, v3);
  return *(_DWORD *)&v1 & ((v4 & 2) >> 1);
}

void sub_18AAC64D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC667C(_Unwind_Exception *a1)
{
  if (!v2) {

  }
  _Unwind_Resume(a1);
}

uint64_t BSPIDForXPCConnection(void *a1)
{
  BOOL v1 = a1;
  uint64_t v2 = v1;
  if (v1) {
    uint64_t pid = xpc_connection_get_pid(v1);
  }
  else {
    uint64_t pid = 0xFFFFFFFFLL;
  }

  return pid;
}

void sub_18AAC66FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC67DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC6A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC6C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLogMachPort()
{
  if (BSLogMachPort_onceToken != -1) {
    dispatch_once(&BSLogMachPort_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)BSLogMachPort___logObj;
  return v0;
}

id _BSMachPortRightDescription(unsigned int a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  Class v10 = NSString;
  uint64_t v11 = getpid();
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%i)", (int)a1);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = off_1E5446150[a1];
  }
  if (a2 == 1) {
    id v13 = @":ext";
  }
  else {
    id v13 = &stru_1ED76E928;
  }
  uint64_t v14 = [a5 length];
  if (v14)
  {
    Class v15 = [NSString stringWithFormat:@" from %@", a5];
  }
  else
  {
    Class v15 = &stru_1ED76E928;
  }
  uint64_t v16 = [v10 stringWithFormat:@"(%i:%x:%@%@ %@)%@", v11, a4, v12, v13, a3, v15];
  if (v14) {

  }
  return v16;
}

void sub_18AAC6DEC(_Unwind_Exception *a1)
{
  if (v2) {

  }
  _Unwind_Resume(a1);
}

void sub_18AAC6EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSProcessDescriptionForPID(uint64_t a1)
{
  uint64_t v2 = NSString;
  double v3 = BSProcessNameForPID(a1);
  long long v4 = [v2 stringWithFormat:@"%@.%d", v3, a1];

  return v4;
}

void sub_18AAC6F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSProcessNameForPID(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (getpid() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
    double v3 = [v2 processName];
  }
  else if ((int)a1 < 1)
  {
    double v3 = 0;
  }
  else
  {
    long long v9 = 0u;
    memset(v10, 0, sizeof(v10));
    if (_BSShortBSDProcessInfoForPID(a1, &v9))
    {
      double v3 = [NSString stringWithUTF8String:v10];
    }
    else
    {
      double v3 = 0;
    }
    if (![v3 length])
    {
      memset(v8, 0, 512);
      if (_BSProcessInfoForPID(a1, v8))
      {
        uint64_t v4 = [NSString stringWithUTF8String:(char *)&v8[15] + 3];

        double v3 = (void *)v4;
      }
    }
    if (![v3 length])
    {
      long long v5 = BSExecutablePathForPID(a1);
      uint64_t v6 = [v5 lastPathComponent];

      double v3 = (void *)v6;
    }
  }
  return v3;
}

void sub_18AAC70FC(_Unwind_Exception *a1)
{
  double v3 = v2;

  _Unwind_Resume(a1);
}

BOOL _BSShortBSDProcessInfoForPID(int a1, void *a2)
{
  BOOL result = 0;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1 >= 1)
  {
    if (a2)
    {
      BOOL result = BSSandboxCanGetProcessInfo(a1);
      if (result)
      {
        if (proc_pidinfo(a1, 13, 0, a2, 64) == 64)
        {
          return 1;
        }
        else
        {
          long long v5 = BSLogCommon();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            uint64_t v6 = __error();
            uint64_t v7 = strerror(*v6);
            v8[0] = 67109378;
            v8[1] = a1;
            __int16 v9 = 2082;
            Class v10 = v7;
            _os_log_error_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_ERROR, "Unable to get short BSD proc info for %d: %{public}s", (uint8_t *)v8, 0x12u);
          }

          return 0;
        }
      }
    }
  }
  return result;
}

void sub_18AAC7244(_Unwind_Exception *exception_object)
{
}

BOOL BSSandboxCanGetProcessInfo(int a1)
{
  if (getpid() == a1) {
    return 1;
  }
  if (qword_1EB21B160 != -1) {
    dispatch_once(&qword_1EB21B160, &__block_literal_global_2_0);
  }
  return byte_1EB21B151 != 0;
}

BOOL BSSandboxCanGetMachTaskName(int a1)
{
  if (getpid() == a1) {
    return 1;
  }
  if (qword_1EB21B168 != -1) {
    dispatch_once(&qword_1EB21B168, &__block_literal_global_5_0);
  }
  return byte_1EB21B152 != 0;
}

id _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = (void *)xpc_connection_copy_bundle_id()) != 0)
  {
    double v3 = [NSString stringWithUTF8String:v2];
    free(v2);
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

void sub_18AAC7428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _BSMachPortTypeDecode(int a1, id a2)
{
  if (!a2) {
    return 0;
  }
  Class Class = object_getClass(a2);
  uint64_t v5 = a1 - 1;
  uint64_t v6 = (objc_class *)(v5 > 2 ? MEMORY[0x1E4F145D8] : qword_1E5446170[v5]);
  if (Class != v6) {
    return 0;
  }
  switch(a1)
  {
    case 3:
      return MEMORY[0x1F40CF1C0](a2);
    case 2:
      return MEMORY[0x1F40CF1E8](a2);
    case 1:
      return MEMORY[0x1F40CF1B8](a2);
    default:
      return 0;
  }
}

id BSExecutablePathForPID(uint64_t a1)
{
  int v1 = MEMORY[0x1F4188790](a1);
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (v1 < 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    int v2 = v1;
    double v3 = (void *)MEMORY[0x18C125360]();
    if (BSSandboxCanGetProcessInfo(v2) && (int v4 = proc_pidpath(v2, buffer, 0x1000u), v4 >= 1))
    {
      uint64_t v5 = (void *)[[NSString alloc] initWithBytes:buffer length:v4 encoding:4];
      uint64_t v6 = [v5 stringByStandardizingPath];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

void sub_18AAC762C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _BSProcessInfoForPID(int a1, void *a2)
{
  uint64_t v2 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1 >= 1 && a2)
  {
    if (BSSandboxCanGetProcessInfo(a1))
    {
      size_t v10 = 648;
      *(void *)Class v15 = 0xE00000001;
      int v16 = 1;
      int v17 = a1;
      if (sysctl(v15, 4u, a2, &v10, 0, 0)) {
        BOOL v5 = 0;
      }
      else {
        BOOL v5 = v10 == 648;
      }
      uint64_t v2 = v5;
      if (!v5)
      {
        uint64_t v6 = BSLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = __error();
          uint64_t v9 = strerror(*v8);
          *(_DWORD *)buf = 67109378;
          int v12 = a1;
          __int16 v13 = 2082;
          uint64_t v14 = v9;
          _os_log_error_impl(&dword_18AAA8000, v6, OS_LOG_TYPE_ERROR, "Unable to get proc info for %d: %{public}s", buf, 0x12u);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_18AAC7798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSExecutablePathForAuditToken()
{
  v0 = (audit_token_t *)MEMORY[0x1F4188790]();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v1 = BSPIDForAuditToken(v0);
  if (v1 < 1)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x18C125360]();
    if (BSSandboxCanGetProcessInfo(v1) && (int v3 = proc_pidpath_audittoken(v0, buffer, 0x1000u), v3 >= 1))
    {
      int v4 = (void *)[[NSString alloc] initWithBytes:buffer length:v3 encoding:4];
      BOOL v5 = [v4 stringByStandardizingPath];
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

void sub_18AAC78D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC7DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, id a13, void *a14)
{
  _Unwind_Resume(a1);
}

id BSBundleIDForExecutablePath(void *a1)
{
  int v1 = _BSBundleInfoForExecutablePath(a1, 0);
  uint64_t v2 = objc_msgSend(v1, "bs_safeStringForKey:", *MEMORY[0x1E4F1CFF8]);

  return v2;
}

void sub_18AAC7F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC7F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFDictionaryRef _BSBundleInfoForExecutablePath(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  int v4 = [v3 stringByDeletingLastPathComponent];
  if (BSSandboxCanAccessPath(v4))
  {
    CFURLRef v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x18C125360]();
      CFDictionaryRef v7 = CFBundleCopyInfoDictionaryForURL(v5);
      uint64_t v8 = [v4 rangeOfString:@".bundle/"];
      if ([(__CFDictionary *)v7 count] && v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        CFURLRef v9 = 0;
LABEL_19:
        CFDictionaryRef v10 = v7;
        if (a2)
        {
          *a2 = [(__CFURL *)v9 path];
        }

        goto LABEL_22;
      }
      CFURLRef v11 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      CFURLRef v12 = v11;
      if (!v11)
      {
        CFURLRef v9 = 0;
LABEL_18:

        goto LABEL_19;
      }
      CFDictionaryRef v21 = CFBundleCopyInfoDictionaryInDirectory(v11);
      if ([(__CFDictionary *)v21 count])
      {
        __int16 v13 = [(__CFURL *)v5 lastPathComponent];
        uint64_t v14 = [(__CFDictionary *)v21 bs_safeStringForKey:*MEMORY[0x1E4F1CFF0]];
        int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          CFURLRef v9 = v12;
          CFDictionaryRef v16 = v21;

          CFDictionaryRef v7 = v16;
LABEL_17:

          goto LABEL_18;
        }
        int v17 = BSLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [(__CFURL *)v12 path];
          uint64_t v19 = [v3 lastPathComponent];
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v18;
          __int16 v24 = 2112;
          size_t v25 = v19;
          _os_log_impl(&dword_18AAA8000, v17, OS_LOG_TYPE_DEFAULT, "Resolved bundle path %@ does not match executable %@", buf, 0x16u);
        }
      }
      CFURLRef v9 = 0;
      goto LABEL_17;
    }
  }
  CFDictionaryRef v10 = 0;
  if (a2) {
    *a2 = 0;
  }
LABEL_22:

  return v10;
}

void sub_18AAC8268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

BOOL BSSandboxCanAccessPath(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    getpid();
    [v1 fileSystemRepresentation];
    BOOL v2 = sandbox_check() == 0;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

void sub_18AAC837C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC8548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSCollectionPartition(objc_class *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v23 = a3;
  CFURLRef v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v4;
  uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        CFDictionaryRef v7 = v23[2](v23, v6);
        if (v7)
        {
          id v25 = v7;
          if (_NSIsNSArray())
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v8 = v25;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v9)
            {
              uint64_t v10 = *(void *)v29;
              do
              {
                for (uint64_t j = 0; j != v9; ++j)
                {
                  if (*(void *)v29 != v10) {
                    objc_enumerationMutation(v8);
                  }
                  CFURLRef v12 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                  id v13 = v5;
                  id v14 = v12;
                  id v15 = v6;
                  id v16 = [v13 objectForKey:v14];
                  if (!v16)
                  {
                    id v16 = objc_alloc_init(a1);
                    [v13 setObject:v16 forKey:v14];
                  }
                  [v16 addObject:v15];
                }
                uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v9);
            }
          }
          else
          {
            id v8 = v5;
            id v17 = v25;
            id v18 = v6;
            id v19 = [v8 objectForKey:v17];
            if (!v19)
            {
              id v19 = objc_alloc_init(a1);
              [v8 setObject:v19 forKey:v17];
            }
            [v19 addObject:v18];
          }
          CFDictionaryRef v7 = v25;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v24);
  }

  return v5;
}

void sub_18AAC887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAC8998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAC8A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAC8C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC8E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC90D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

id BSStackFrameInfoForAddresss(const void *a1)
{
  pthread_mutex_lock(&__StackInfoLock);
  if (!__StackInfoCache)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    id v3 = (void *)__StackInfoCache;
    __StackInfoCache = (uint64_t)v2;

    [(id)__StackInfoCache setCountLimit:100];
  }
  id v4 = [NSNumber numberWithUnsignedLong:a1];
  CFURLRef v5 = [(id)__StackInfoCache objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C125360]();
    CFDictionaryRef v7 = [BSStackFrameInfo alloc];
    if (!v7
      || (v27.receiver = v7,
          v27.super_class = (Class)BSStackFrameInfo,
          id v8 = objc_msgSendSuper2(&v27, sel_init),
          (id v9 = v8) == 0))
    {
      CFURLRef v5 = 0;
      goto LABEL_21;
    }
    _DWORD v8[2] = a1;
    memset(&v26, 0, sizeof(v26));
    if (dladdr(a1, &v26))
    {
      if (v26.dli_fname)
      {
        id v10 = [NSString alloc];
        uint64_t v11 = [v10 initWithUTF8String:v26.dli_fname];
        CFURLRef v12 = (void *)*((void *)v9 + 4);
        *((void *)v9 + 4) = v11;
      }
      if (v26.dli_sname)
      {
        id v13 = [NSString alloc];
        uint64_t v14 = [v13 initWithUTF8String:v26.dli_sname];
        id v15 = (void *)*((void *)v9 + 1);
        *((void *)v9 + 1) = v14;
      }
      id v16 = (void *)*((void *)v9 + 1);
      if (!v16) {
        goto LABEL_20;
      }
      id v17 = BSPrettyFunctionName([v16 UTF8String]);
      uint64_t v18 = [v17 copy];
      id v19 = (void *)*((void *)v9 + 3);
      *((void *)v9 + 3) = v18;

      unint64_t v20 = [*((id *)v9 + 3) rangeOfString:@"["];
      unint64_t v21 = [*((id *)v9 + 3) rangeOfString:@" "];
      uint64_t v22 = 0;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL && v21 != 0x7FFFFFFFFFFFFFFFLL && v20 < v21)
      {
        uint64_t v22 = objc_msgSend(*((id *)v9 + 3), "substringWithRange:", v20 + 1, v21 + ~v20);
      }
      uint64_t v23 = [v22 copy];
      uint64_t v24 = (void *)*((void *)v9 + 5);
      *((void *)v9 + 5) = v23;
    }
    else
    {
      uint64_t v22 = v9;
      id v9 = 0;
    }

LABEL_20:
    CFURLRef v5 = v9;
LABEL_21:
    if (v5) {
      [(id)__StackInfoCache setObject:v5 forKey:v4];
    }
  }
  pthread_mutex_unlock(&__StackInfoLock);

  return v5;
}

void sub_18AAC9388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSPrettyFunctionName(uint64_t a1)
{
  if (a1)
  {
    id v1 = [NSString stringWithUTF8String:a1];
    id v2 = [MEMORY[0x1E4F28FE8] scannerWithString:v1];
    if ([v2 scanString:@"__" intoString:0])
    {
      [v2 scanInteger:0];
      id v5 = v1;
      [v2 scanUpToString:@"_block_invoke" intoString:&v5];
      id v3 = v5;

      id v1 = v3;
    }
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

void sub_18AAC94A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC9568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC95F0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAC989C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAC99E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSStoreTokenFromMessageToVar(uint64_t a1, void **a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = (void *)[NSString stringWithFormat:@"message must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v6 = 138544130;
      *(void *)&v6[4] = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreTokenFromMessageToVar(xpc_object_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(void *)&v6[14] = @"BSAuditTokenCaching.m";
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 170;
      *(_WORD *)&v6[28] = 2114;
      *(void *)&v6[30] = v4;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1E911F420 = [v4 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC9B38);
  }
  if (!a2)
  {
    id v5 = (void *)[NSString stringWithFormat:@"var must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v6 = 138544130;
      *(void *)&v6[4] = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreTokenFromMessageToVar(xpc_object_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(void *)&v6[14] = @"BSAuditTokenCaching.m";
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 171;
      *(_WORD *)&v6[28] = 2114;
      *(void *)&v6[30] = v5;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1E911F420 = [v5 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC9BF0);
  }
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)uint64_t v6 = v3;
  *(_OWORD *)&v6[16] = v3;
  xpc_dictionary_get_audit_token();
  BSStoreRealTokenToVar((uint64_t)v6, a2);
}

void BSStoreRealTokenToVar(uint64_t a1, void **a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    CFURLRef v12 = (void *)[NSString stringWithFormat:@"token must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreRealTokenToVar(const audit_token_t *, BSAuditToken **)");
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"BSAuditTokenCaching.m";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 126;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v12;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v12 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC9DF0);
  }
  if (!a2)
  {
    id v13 = (void *)[NSString stringWithFormat:@"var must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreRealTokenToVar(const audit_token_t *, BSAuditToken **)");
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"BSAuditTokenCaching.m";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 127;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v13;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v13 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC9EA8);
  }
  if (qword_1EB21B1D8 != -1) {
    dispatch_once_f(&qword_1EB21B1D8, 0, (dispatch_function_t)_bsxpc_auditToken_init);
  }
  id v4 = *a2;
  if (BSAuditTokenIsValid(a1))
  {
    memset(buf, 0, 32);
    if (v4)
    {
      [v4 realToken];
    }
    else
    {
      *(void *)&long long v6 = -1;
      *((void *)&v6 + 1) = -1;
      *(_OWORD *)buf = v6;
      *(_OWORD *)&buf[16] = v6;
    }
    if (*(void *)a1 != *(void *)buf
      || *(void *)(a1 + 8) != *(void *)&buf[8]
      || *(void *)(a1 + 16) != *(void *)&buf[16]
      || *(void *)(a1 + 24) != *(void *)&buf[24])
    {
      id v10 = [BSAuditToken alloc];
      long long v11 = *(_OWORD *)(a1 + 16);
      v14[0] = *(_OWORD *)a1;
      v14[1] = v11;
      _BSStoreNewRetainedTokenToVar([(BSAuditToken *)v10 initWithAuditToken:v14], a2);
    }
  }
  else if (v4 != (void *)qword_1EB21B1C8)
  {
    id v5 = (id)qword_1EB21B1C8;
    _BSStoreNewRetainedTokenToVar(v5, a2);
  }
}

uint64_t BSPIDForAuditToken(_OWORD *a1)
{
  if (!BSAuditTokenIsValid((uint64_t)a1)) {
    return 0xFFFFFFFFLL;
  }
  long long v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

BOOL BSAuditTokenIsValid(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 16);
  return (*(void *)a1 != v7 || *(void *)(a1 + 8) != v8 || (void)v1 != v9 || *((void *)&v1 + 1) != v10)
      && (*(void *)a1 & *(void *)(a1 + 8) & *(void *)(a1 + 16) & *(void *)(a1 + 24)) != -1;
}

void _BSStoreNewRetainedTokenToVar(void *a1, void **a2)
{
  long long v2 = a1;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v3 = *a2;
  if (*a2 == a1)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"constraint violation: new=%p should not be previous=%p", a1, a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSStoreNewRetainedTokenToVar(BSAuditToken *, BSAuditToken **)");
      __int16 v15 = 2114;
      uint64_t v16 = @"BSAuditTokenCaching.m";
      __int16 v17 = 1024;
      int v18 = 82;
      __int16 v19 = 2114;
      unint64_t v20 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    goto LABEL_23;
  }
  int64_t value = 0;
  originalKey = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_21);
  if (v2 && (void *)qword_1EB21B1C8 != v2)
  {
    if (NSMapMember((NSMapTable *)qword_1EB21B1D0, v2, &originalKey, &value))
    {
      id v5 = (char *)value + 1;
      int64_t value = (char *)value + 1;
      if (originalKey != v2)
      {
        id v6 = originalKey;

        id v5 = (char *)value;
        long long v2 = originalKey;
      }
      NSMapInsert((NSMapTable *)qword_1EB21B1D0, v2, v5);
    }
    else
    {
      int64_t value = (void *)1;
      NSMapInsertKnownAbsent((NSMapTable *)qword_1EB21B1D0, v2, (const void *)1);
    }
  }
  *a2 = v2;
  if (v3)
  {
    if (v3 == (void *)qword_1EB21B1C8)
    {
LABEL_15:

      goto LABEL_16;
    }
    if (NSMapMember((NSMapTable *)qword_1EB21B1D0, v3, &originalKey, &value))
    {
      if ((int)value < 2)
      {
        NSMapRemove((NSMapTable *)qword_1EB21B1D0, originalKey);
      }
      else
      {
        int64_t value = (char *)value - 1;
        NSMapInsert((NSMapTable *)qword_1EB21B1D0, originalKey, value);
      }
      goto LABEL_15;
    }
    id v8 = (id)_bsxpc_auditTokens_desc(1);
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_21);
    uint64_t v9 = (void *)[NSString stringWithFormat:@"failed to find %@ in tokens %@", v3, v8];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void _BSStoreNewRetainedTokenToVar(BSAuditToken *, BSAuditToken **)");
      *(_DWORD *)buf = 138544130;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = @"BSAuditTokenCaching.m";
      __int16 v17 = 1024;
      int v18 = 117;
      __int16 v19 = 2114;
      unint64_t v20 = v9;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v9 UTF8String];
    __break(0);
LABEL_23:
    JUMPOUT(0x18AACA1B4);
  }
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_21);
}

void sub_18AACA330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACA5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACA708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AACA788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSSettingsEncodeAppendSettingArrayEntry(void *a1, uint64_t a2, void *a3, void *a4)
{
  objects[3] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  uint64_t v9 = a4;
  id v19 = 0;
  uint64_t v10 = v9[2](v9, a2, v8, &v19);
  id v11 = v19;
  if (!v10)
  {
    __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
    int v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSSettingsEncodeAppendSettingArrayEntry(__strong xpc_object_t, NSUInteger, __strong id, __strong BSSettingEncodeBlock)");
    [v17 handleFailureInFunction:v18, @"BSSettings.m", 83, @"encodeBlock didn't return an object for %llu -> %@", a2, v8 file lineNumber description];
  }
  objects[0] = xpc_uint64_create(a2);
  id v12 = v10;
  objects[1] = v12;
  id v13 = v11;
  objects[2] = v13;
  if (v13) {
    size_t v14 = 3;
  }
  else {
    size_t v14 = 2;
  }
  xpc_object_t v15 = xpc_array_create(objects, v14);
  xpc_array_append_value(v7, v15);

  for (uint64_t i = 2; i != -1; --i)
}

void sub_18AACA940(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(a1);
    objc_exception_throw(v10);
  }

  _Unwind_Resume(a1);
}

void sub_18AACAA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreateSerial(void *a1)
{
  id v1 = a1;
  long long v2 = +[BSDispatchQueueAttributes serial];
  dispatch_queue_t v3 = BSDispatchQueueCreate(v1, v2);

  return v3;
}

void sub_18AACAB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreate(void *a1, void *a2)
{
  id v3 = a1;
  audit_token_t v4 = a2;
  if (!v4)
  {
    audit_token_t v4 = +[BSDispatchQueueAttributes serial];
    if (!v4)
    {
      id v10 = v3;
      goto LABEL_6;
    }
  }
  dispatch_queue_t v5 = v4[2];
  id v6 = v3;
  if (!v5)
  {
LABEL_6:
    id v11 = (const char *)[v3 UTF8String];
    id v8 = [(dispatch_queue_t *)v4 attributes];
    dispatch_queue_t v9 = BSDispatchQueueCreateWithQualityOfService(v11, v8, QOS_CLASS_UNSPECIFIED, 0);
    goto LABEL_7;
  }
  id v7 = (const char *)[v6 UTF8String];
  id v8 = [(dispatch_queue_t *)v4 attributes];
  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2(v7, v8, v4[2]);
LABEL_7:
  dispatch_queue_t v12 = v9;

  return v12;
}

void sub_18AACAC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreateWithQualityOfService(const char *a1, void *a2, dispatch_qos_class_t a3, int a4)
{
  dispatch_queue_t v5 = _BSDispatchQueueAttributesForAttributes(a2, a3, a4);
  dispatch_queue_t v6 = dispatch_queue_create(a1, v5);

  return v6;
}

NSObject *_BSDispatchQueueAttributesForAttributes(void *a1, dispatch_qos_class_t a2, int a3)
{
  dispatch_queue_t v5 = a1;
  if (v5)
  {
    if (a2)
    {
LABEL_3:
      if (a3 <= -15) {
        int v6 = -15;
      }
      else {
        int v6 = a3;
      }
      uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v5, a2, v6 & (v6 >> 31));

      dispatch_queue_t v5 = v7;
    }
  }
  else
  {
    dispatch_queue_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (a2) {
      goto LABEL_3;
    }
  }
  return v5;
}

BOOL BSAtomicGetFlag(atomic_uint *a1)
{
  if (!a1) {
    __assert_rtn("BSAtomicGetFlag", "BSAtomicUtilities.m", 16, "value && (sizeof(int32_t) == sizeof(*value))");
  }
  unsigned int v1 = 1;
  atomic_compare_exchange_strong_explicit(a1, &v1, v1, memory_order_relaxed, memory_order_relaxed);
  return v1 == 1;
}

double BSDegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

void sub_18AACB120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACB168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSSettingFlagIfYes(int a1)
{
  if (a1) {
    return 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

void BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
}

void sub_18AACB474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSDeserializeDoubleFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  audit_token_t v4 = v3;
  double value = 0.0;
  if (v3 && a2)
  {
    int v6 = xpc_dictionary_get_value(v3, a2);
    uint64_t v7 = v6;
    if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14598]) {
      double value = xpc_double_get_value(v7);
    }
  }
  return value;
}

void sub_18AACB514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSDeserializeCGSizeFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  audit_token_t v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    int v6 = xpc_dictionary_get_value(v4, a2);
    double v5 = BSDeserializeCGSizeFromXPCObject(v6);
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
  }

  return v5;
}

void sub_18AACB5FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSDeserializeCGSizeFromXPCObject(void *a1)
{
  id v1 = a1;
  long long v2 = v1;
  double v3 = *MEMORY[0x1E4F1DB30];
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E4F14568] && xpc_array_get_count(v2) == 2)
  {
    double v3 = xpc_array_get_double(v2, 0);
    xpc_array_get_double(v2, 1uLL);
  }

  return v3;
}

void sub_18AACB6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSCollectionFilter(objc_class *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend([a1 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (v6[2](v6, v12)) {
            objc_msgSend(v7, "addObject:", v12, (void)v14);
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v7 = (void *)[v5 copyWithZone:0];
  }

  return v7;
}

void sub_18AACB968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACBA28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSCollectionCompactMap(objc_class *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = a3;
  uint64_t v7 = objc_msgSend([a1 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    id v11 = (id)*MEMORY[0x1E4F1D260];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v14 = v6[2](v6, v13);

          id v13 = (id)v14;
        }
        if (v13) {
          BOOL v15 = v13 == v11;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v7;
}

void sub_18AACBBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AACBD54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACBE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_18AACBFB8(_Unwind_Exception *a1)
{
  if ((v3 & 1) == 0) {

  }
  _Unwind_Resume(a1);
}

void sub_18AACC174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACC4B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedLongLong(void *a1, const char *a2)
{
  id v3 = a1;
  audit_token_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  id v5 = [v3 _store];
  if (v4) {
    int v6 = (void *)v4[7];
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;
  id v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 unsignedLongLongValue];

  return v9;
}

void sub_18AACC574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getLongLong(void *a1, const char *a2)
{
  id v3 = a1;
  audit_token_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  id v5 = [v3 _store];
  if (v4) {
    int v6 = (void *)v4[7];
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;
  id v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 longLongValue];

  return v9;
}

void sub_18AACC65C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACC768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACC95C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getBool(void *a1, const char *a2)
{
  id v3 = a1;
  audit_token_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  id v5 = [v3 _store];
  if (v4) {
    int v6 = (void *)v4[7];
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v5 BOOLForKey:v7];

  return v8;
}

void sub_18AACCA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACCC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __getMetadataForClass(objc_class *a1)
{
  id v1 = NSStringFromClass(a1);
  if (v1)
  {
    pthread_mutex_lock(&__classNameToSelectorLock);
    long long v2 = (void *)qword_1EB21B148;
    if (qword_1EB21B148) {
      goto LABEL_3;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    int v6 = [NSString stringWithUTF8String:"BSAbstractDefaultDomainClassMetadata *__getMetadataForClass(__unsafe_unretained Class)"];
    [v5 handleFailureInFunction:v6, @"BSAbstractDefaultDomain.m", 54, @"Class metadata map is expected to have been initialized before using %@.", v1 file lineNumber description];

    long long v2 = (void *)qword_1EB21B148;
    if (qword_1EB21B148)
    {
LABEL_3:
      id v3 = [v2 objectForKey:v1];
    }
    else
    {
      id v3 = 0;
    }
    pthread_mutex_unlock(&__classNameToSelectorLock);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_18AACCD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACCE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACCF70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACD118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object, objc_super a15)
{
  a15.super_class = (Class)BSSimpleAssertion;
  [(_Unwind_Exception *)&a15 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AACD164(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void __BSGetVersionedPID_block_invoke()
{
  BSAuditTokenForCurrentProcess(v2);
  BSGetVersionedPID___versionedPID = BSVersionedPIDForAuditToken(v2);
  if (getpid() != BSGetVersionedPID___versionedPID)
  {
    v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v1 = [NSString stringWithUTF8String:"BSVersionedPID BSGetVersionedPID(void)_block_invoke"];
    [v0 handleFailureInFunction:v1 file:@"BSVersionedPID.m" lineNumber:20 description:@"Failed to validate current vpid."];
  }
}

void sub_18AACD238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACD2F0(_Unwind_Exception *a1)
{
  audit_token_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AACD3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACD454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACD6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AACD7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACD8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACDA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACDD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AACDF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __lockAndExecute(os_unfair_lock_s *a1, uint64_t a2)
{
  os_unfair_lock_lock(a1);
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  os_unfair_lock_unlock(a1);
}

void sub_18AACE268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACE370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACE56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  uint64_t v8 = v7;

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AACE7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACE874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL BSMachSendRightRetain(mach_port_name_t name)
{
  int v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    mach_error_t inserted = mach_port_insert_right(*MEMORY[0x1E4F14960], name, name, 0x13u);
    if (inserted)
    {
      _BSMachError(v1, inserted, @"Unable to insert COPY_SEND");
      int v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

void BSAuditTokenForCurrentProcess(_OWORD *a1@<X8>)
{
  *(void *)&long long v1 = -1;
  *((void *)&v1 + 1) = -1;
  *a1 = v1;
  a1[1] = v1;
  if (!BSAuditTokenForTask(*MEMORY[0x1E4F14960], a1))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v2 = [NSString stringWithUTF8String:"audit_token_t BSAuditTokenForCurrentProcess(void)"];
    [v3 handleFailureInFunction:v2 file:@"BSSecurityUtilities.m" lineNumber:116 description:@"Failed to fetch audit token for current task."];
  }
}

void sub_18AACEAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL BSAuditTokenForTask(task_name_t a1, _OWORD *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)task_info_out = v3;
  long long v12 = v3;
  if (a1 - 1 > 0xFFFFFFFD)
  {
    BOOL v5 = 0;
  }
  else
  {
    mach_msg_type_number_t task_info_outCnt = 8;
    mach_error_t v4 = task_info(a1, 0xFu, task_info_out, &task_info_outCnt);
    BOOL v5 = v4 == 0;
    if (v4)
    {
      int v6 = BSLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = mach_error_string(v4);
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = "BSAuditTokenForTask";
        __int16 v15 = 2082;
        long long v16 = v9;
        __int16 v17 = 1024;
        mach_error_t v18 = v4;
        _os_log_error_impl(&dword_18AAA8000, v6, OS_LOG_TYPE_ERROR, "%s failed: %{public}s (0x%x)", buf, 0x1Cu);
      }
    }
  }
  if (a2)
  {
    long long v7 = v12;
    *a2 = *(_OWORD *)task_info_out;
    a2[1] = v7;
  }
  return v5;
}

void sub_18AACEBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACECE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSSerializeSetToXPCDictionaryWithKey(void *a1, void *a2, const char *a3, void *a4)
{
  id v9 = a2;
  id v7 = a4;
  uint64_t v8 = [a1 allObjects];
  BSSerializeArrayToXPCDictionaryWithKey(v8, v9, a3, v7);
}

void sub_18AACEDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSSerializeArrayToXPCDictionaryWithKey(void *a1, void *a2, const char *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a1;
  id v7 = a2;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (a3 && v7 && v8 && [v16 count])
  {
    xpc_object_t v10 = xpc_array_create(0, 0);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v16;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          __int16 v15 = v9[2](v9, *(void *)(*((void *)&v17 + 1) + 8 * v14));
          if (v15) {
            xpc_array_append_value(v10, v15);
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, a3, v10);
  }
}

void sub_18AACEF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id __BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v2 = BSCreateSerializedBSXPCEncodableObject(a2);
  return v2;
}

void sub_18AACF0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v7 = a1;
  id v5 = a2;
  if (v5 && v7 && a3)
  {
    xpc_object_t v6 = BSCreateSerializedBSXPCEncodableObject(v7);
    if (v6) {
      xpc_dictionary_set_value(v5, a3, v6);
    }
  }
}

void sub_18AACF16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

xpc_object_t BSCreateSerializedBSXPCEncodableObject(void *a1)
{
  id v1 = a1;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v1 && v2) {
    id v4 = BSSerializeBSXPCEncodableObjectToXPCDictionary(v1, v2);
  }

  return v3;
}

void sub_18AACF1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACF28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACF2E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACF3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACF544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACF620(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18AACF7CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSMachPortIsType(mach_port_name_t name, int a2)
{
  if (name - 1 > 0xFFFFFFFD) {
    return 0;
  }
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  mach_port_type_t ptype = 0;
  mach_error_t v6 = mach_port_type(*MEMORY[0x1E4F14960], name, &ptype);
  if (v6) {
    _BSMachError(name, v6, @"Port has no valid type");
  }
  return (ptype & a2) != 0;
}

uint64_t _BSMachPortTypeEncode(int a1, uint64_t a2, unsigned char *a3)
{
  switch(a1)
  {
    case 3:
      *a3 = 0;
      return MEMORY[0x1F40CF1C8](a2);
    case 2:
      *a3 = 1;
      return MEMORY[0x1F40CF1E0](a2);
    case 1:
      *a3 = 1;
      return MEMORY[0x1F40CF1B0](a2);
    default:
      *a3 = 0;
      return 0;
  }
}

BOOL BSPIDExists(int a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (getpid() == a1) {
    return 1;
  }
  if (a1 < 1) {
    return 0;
  }
  memset(v3, 0, sizeof(v3));
  return _BSShortBSDProcessInfoForPID(a1, v3);
}

double BSRectGetCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

void sub_18AACFAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AACFBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AACFD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void BSSerializeCFValueToXPCDictionaryWithKey(uint64_t a1, void *a2, const char *a3)
{
  xpc_object_t xdict = a2;
  if (a1 && xdict && a3)
  {
    id v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5) {
      xpc_dictionary_set_value(xdict, a3, v5);
    }
  }
}

void sub_18AACFDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __BSDescribeAppendObjectDescription_block_invoke(uint64_t a1, __CFString *a2, __CFString *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(v6 + 8);
  switch(*(void *)(v6 + 1104))
  {
    case 1:
      id v8 = (void *)(v6 + 1040);
      uint64_t v9 = *(void *)(v6 + 1040);
      CGRect v10 = (const char *)(v6 + 16);
      if (*(void *)(*(void *)(v6 + 8) + 24) == 3)
      {
        if (v9 > 1022)
        {
          v10[v9] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v10, 0x8000100u);
          *(void *)(v6 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), ";", 0x8000100u);
        }
        else
        {
          v10[v9] = 59;
          ++*v8;
        }
        goto LABEL_11;
      }
      if (v9 <= 1021)
      {
        *(_WORD *)&v10[v9] = 8251;
        uint64_t v13 = 2;
        goto LABEL_19;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v10, 0x8000100u);
      uint64_t v14 = (CFMutableStringRef *)(v6 + 1064);
      __int16 v15 = "; ";
      goto LABEL_24;
    case 2:
      id v8 = (void *)(v6 + 1040);
      uint64_t v11 = *(void *)(v6 + 1040);
      uint64_t v12 = (const char *)(v6 + 16);
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v12, 0x8000100u);
      uint64_t v14 = (CFMutableStringRef *)(v6 + 1064);
      __int16 v15 = " ";
LABEL_24:
      void *v8 = 0;
      CFStringAppendCString(*v14, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      uint64_t v16 = *(void *)(v6 + 1040);
      long long v17 = (const char *)(v6 + 16);
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v17, 0x8000100u);
        *(void *)(v6 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++*(void *)(v6 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      uint64_t v18 = *(void *)(v6 + 1072);
      if (v18 < 1) {
        break;
      }
      if (v18 >= 8) {
        uint64_t v18 = 8;
      }
      long long v19 = (const char *)*((void *)&sIndentSpaceStrings + v18);
      size_t v20 = strlen(v19);
      id v8 = (void *)(v6 + 1040);
      uint64_t v21 = *(void *)(v6 + 1040);
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          *(unsigned char *)(v6 + 16 + v21) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
          void *v8 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v19, 0x8000100u);
      }
      else
      {
        uint64_t v13 = v20;
        memcpy((void *)(v6 + v21 + 16), v19, v20);
LABEL_19:
        *v8 += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(void *)(v6 + 1104) = 0;
LABEL_26:
  if (!a2) {
    goto LABEL_123;
  }
  char v22 = *(unsigned char *)(v6 + 1056);
  *(unsigned char *)(v6 + 1056) = 1;
  uint64_t v23 = v7[6];
  uint64_t v24 = v7[7];
  if (v23 < 2 || v24 < 1)
  {
    *(void *)(v6 + 1096) = 0;
  }
  else
  {
    *(void *)(v6 + 1096) = v23;
    *(void *)(v6 + 1080) = *(void *)(v6 + 1040) + [*(id *)(v6 + 1064) length];
    *(void *)(v6 + 1088) = v24;
  }
  if (!_NSIsNSString())
  {
    if (_NSIsNSNumber())
    {
      long long v29 = a2;
      int v30 = *(char *)[(__CFString *)v29 objCType];
      if (v30 > 80)
      {
        switch(v30)
        {
          case 'c':
            goto LABEL_65;
          case 'd':
            uint64_t v31 = *(void *)(v6 + 1040);
            if (v31 >= 1)
            {
              *(unsigned char *)(v6 + 16 + v31) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(void *)(v6 + 1040) = 0;
            }
            long long v32 = *(void **)(v6 + 1064);
            [(__CFString *)v29 doubleValue];
            long long v34 = @"%0.16g";
            goto LABEL_87;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_79;
          case 'f':
            uint64_t v44 = *(void *)(v6 + 1040);
            if (v44 >= 1)
            {
              *(unsigned char *)(v6 + 16 + v44) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(void *)(v6 + 1040) = 0;
            }
            long long v32 = *(void **)(v6 + 1064);
            [(__CFString *)v29 floatValue];
            double v33 = v45;
            long long v34 = @"%0.7g";
LABEL_87:
            objc_msgSend(v32, "appendFormat:", v34, *(void *)&v33);
            goto LABEL_105;
          case 'i':
            uint64_t v46 = *(void *)(v6 + 1040);
            if (v46 >= 1)
            {
              *(unsigned char *)(v6 + 16 + v46) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(void *)(v6 + 1040) = 0;
            }
            uint64_t v36 = *(void **)(v6 + 1064);
            uint64_t v37 = [(__CFString *)v29 intValue];
            goto LABEL_91;
          case 'l':
            uint64_t v47 = *(void *)(v6 + 1040);
            if (v47 >= 1)
            {
              *(unsigned char *)(v6 + 16 + v47) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(void *)(v6 + 1040) = 0;
            }
            uint64_t v36 = *(void **)(v6 + 1064);
            uint64_t v37 = [(__CFString *)v29 longValue];
            uint64_t v39 = @"%ld";
            goto LABEL_104;
          case 'q':
            uint64_t v48 = *(void *)(v6 + 1040);
            if (v48 >= 1)
            {
              *(unsigned char *)(v6 + 16 + v48) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(void *)(v6 + 1040) = 0;
            }
            uint64_t v36 = *(void **)(v6 + 1064);
            uint64_t v37 = [(__CFString *)v29 longLongValue];
            uint64_t v39 = @"%lld";
            goto LABEL_104;
          case 's':
            uint64_t v49 = *(void *)(v6 + 1040);
            if (v49 >= 1)
            {
              *(unsigned char *)(v6 + 16 + v49) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
              *(void *)(v6 + 1040) = 0;
            }
            uint64_t v36 = *(void **)(v6 + 1064);
            uint64_t v37 = [(__CFString *)v29 shortValue];
            uint64_t v39 = @"%hi";
            goto LABEL_104;
          default:
            if (v30 == 81)
            {
              uint64_t v50 = *(void *)(v6 + 1040);
              if (v50 >= 1)
              {
                *(unsigned char *)(v6 + 16 + v50) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
                *(void *)(v6 + 1040) = 0;
              }
              uint64_t v36 = *(void **)(v6 + 1064);
              uint64_t v37 = [(__CFString *)v29 unsignedLongLongValue];
              uint64_t v39 = @"%llu";
            }
            else
            {
              if (v30 != 83) {
                goto LABEL_79;
              }
              uint64_t v41 = *(void *)(v6 + 1040);
              if (v41 >= 1)
              {
                *(unsigned char *)(v6 + 16 + v41) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
                *(void *)(v6 + 1040) = 0;
              }
              uint64_t v36 = *(void **)(v6 + 1064);
              uint64_t v37 = [(__CFString *)v29 unsignedShortValue];
              uint64_t v39 = @"%hu";
            }
            break;
        }
        goto LABEL_104;
      }
      if (v30 > 72)
      {
        if (v30 == 73)
        {
          uint64_t v42 = *(void *)(v6 + 1040);
          if (v42 >= 1)
          {
            *(unsigned char *)(v6 + 16 + v42) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(void *)(v6 + 1040) = 0;
          }
          uint64_t v36 = *(void **)(v6 + 1064);
          uint64_t v37 = [(__CFString *)v29 unsignedIntValue];
          goto LABEL_78;
        }
        if (v30 == 76)
        {
          uint64_t v38 = *(void *)(v6 + 1040);
          if (v38 >= 1)
          {
            *(unsigned char *)(v6 + 16 + v38) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(void *)(v6 + 1040) = 0;
          }
          uint64_t v36 = *(void **)(v6 + 1064);
          uint64_t v37 = [(__CFString *)v29 unsignedLongValue];
          uint64_t v39 = @"%lu";
          goto LABEL_104;
        }
      }
      else
      {
        if (v30 == 66)
        {
LABEL_65:
          uint64_t v40 = *(void *)(v6 + 1040);
          if (v40 >= 1)
          {
            *(unsigned char *)(v6 + 16 + v40) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(void *)(v6 + 1040) = 0;
          }
          uint64_t v36 = *(void **)(v6 + 1064);
          uint64_t v37 = [(__CFString *)v29 charValue];
LABEL_91:
          uint64_t v39 = @"%d";
          goto LABEL_104;
        }
        if (v30 == 67)
        {
          uint64_t v35 = *(void *)(v6 + 1040);
          if (v35 >= 1)
          {
            *(unsigned char *)(v6 + 16 + v35) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
            *(void *)(v6 + 1040) = 0;
          }
          uint64_t v36 = *(void **)(v6 + 1064);
          uint64_t v37 = [(__CFString *)v29 unsignedCharValue];
LABEL_78:
          uint64_t v39 = @"%u";
LABEL_104:
          objc_msgSend(v36, "appendFormat:", v39, v37);
LABEL_105:

          goto LABEL_106;
        }
      }
LABEL_79:
      uint64_t v43 = *(void *)(v6 + 1040);
      if (v43 >= 1)
      {
        *(unsigned char *)(v6 + 16 + v43) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
        *(void *)(v6 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v6 + 1064), "appendFormat:", @"<***unknown type:%s>", -[__CFString objCType](v29, "objCType"));
      goto LABEL_105;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a2 appendDescriptionToStream:v6];
      goto LABEL_106;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a2 appendDescriptionToFormatter:v6];
      goto LABEL_106;
    }
    if (_NSIsNSDictionary())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v110 = 3221225472;
      v111 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke;
      v112 = &unk_1E5446820;
      uint64_t v113 = v6;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v6, a2, 0, (uint64_t)&usedBufLen);
      goto LABEL_106;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)v6 appendIntegerSet:a2 withName:0 format:0];
      goto LABEL_106;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v110 = 3221225472;
      v111 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v112 = &unk_1E5446848;
      uint64_t v113 = v6;
      [(id)v6 appendIntegerMap:a2 withName:0 keyFormat:0 valueBlock:&usedBufLen];
      goto LABEL_106;
    }
    if (objc_opt_respondsToSelector())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v110 = 3221225472;
      v111 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke_3;
      v112 = &unk_1E5446848;
      uint64_t v113 = v6;
      [(id)v6 appendCollection:a2 withName:0 itemBlock:&usedBufLen];
      goto LABEL_106;
    }
    if (*(unsigned char *)(v6 + 1056) || (uint64_t v99 = *(void *)(v6 + 8), *(void *)(v99 + 8) == 2))
    {
      if (objc_opt_respondsToSelector())
      {
        v100 = [(__CFString *)a2 succinctDescription];
        goto LABEL_236;
      }
      uint64_t v99 = *(void *)(v6 + 8);
    }
    if (*(void *)(v99 + 16) == 2) {
      [(__CFString *)a2 debugDescription];
    }
    else {
    v100 = [(__CFString *)a2 description];
    }
LABEL_236:
    v105 = v100;
    CFIndex v106 = [(__CFString *)v100 length];
    uint64_t v107 = *(void *)(v6 + 1040);
    if (v107 + 3 * v106 > 1023)
    {
      if (v107 >= 1)
      {
        *(unsigned char *)(v6 + 16 + v107) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
        *(void *)(v6 + 1040) = 0;
      }
      if (v106 > 341)
      {
        [*(id *)(v6 + 1064) appendString:v105];
        goto LABEL_246;
      }
      CFIndex usedBufLen = 0;
      v121.location = 0;
      v121.length = v106;
      CFStringGetBytes(v105, v121, 0x8000100u, 0, 0, (UInt8 *)(v6 + 16), 1024, &usedBufLen);
      CFIndex v108 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v120.location = 0;
      v120.length = v106;
      CFStringGetBytes(v105, v120, 0x8000100u, 0, 0, (UInt8 *)(v6 + v107 + 16), 1024 - v107, &usedBufLen);
      CFIndex v108 = *(void *)(v6 + 1040) + usedBufLen;
    }
    *(void *)(v6 + 1040) = v108;
LABEL_246:

    goto LABEL_106;
  }
  CFIndex v26 = [(__CFString *)a2 length];
  uint64_t v27 = *(void *)(v6 + 1040);
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      *(unsigned char *)(v6 + 16 + v27) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
      *(void *)(v6 + 1040) = 0;
    }
    if (v26 > 341)
    {
      [*(id *)(v6 + 1064) appendString:a2];
      goto LABEL_106;
    }
    CFIndex usedBufLen = 0;
    v115.location = 0;
    v115.length = v26;
    CFStringGetBytes(a2, v115, 0x8000100u, 0, 0, (UInt8 *)(v6 + 16), 1024, &usedBufLen);
    CFIndex v28 = usedBufLen;
  }
  else
  {
    CFIndex usedBufLen = 0;
    v114.location = 0;
    v114.length = v26;
    CFStringGetBytes(a2, v114, 0x8000100u, 0, 0, (UInt8 *)(v6 + v27 + 16), 1024 - v27, &usedBufLen);
    CFIndex v28 = *(void *)(v6 + 1040) + usedBufLen;
  }
  *(void *)(v6 + 1040) = v28;
LABEL_106:
  BSDescribeTruncationCommit(v6);
  *(unsigned char *)(v6 + 1056) = v22;
  if (*(uint64_t *)(v6 + 1048) <= 0) {
    uint64_t v51 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  }
  else {
    uint64_t v51 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  }
  unint64_t v52 = *(void *)(*(void *)(v6 + 8) + *v51);
  if (v52 < 2)
  {
    CFRange v53 = (void *)(v6 + 1040);
    uint64_t v57 = *(void *)(v6 + 1040);
    uint64_t v58 = (const char *)(v6 + 16);
    if (v57 <= 1021)
    {
      *(_WORD *)&v58[v57] = 8250;
      uint64_t v56 = 2;
      goto LABEL_118;
    }
    v58[v57] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v58, 0x8000100u);
    uint64_t v61 = (CFMutableStringRef *)(v6 + 1064);
    v62 = ": ";
  }
  else if (v52 == 2)
  {
    CFRange v53 = (void *)(v6 + 1040);
    uint64_t v59 = *(void *)(v6 + 1040);
    uint64_t v60 = v6 + 16 + v59;
    if (v59 <= 1020)
    {
      *(unsigned char *)(v60 + 2) = 32;
      *(_WORD *)uint64_t v60 = 15648;
      uint64_t v56 = 3;
      goto LABEL_118;
    }
    *(unsigned char *)uint64_t v60 = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), (const char *)(v6 + 16), 0x8000100u);
    uint64_t v61 = (CFMutableStringRef *)(v6 + 1064);
    v62 = " = ";
  }
  else
  {
    if (v52 != 3) {
      goto LABEL_123;
    }
    CFRange v53 = (void *)(v6 + 1040);
    uint64_t v54 = *(void *)(v6 + 1040);
    v55 = (const char *)(v6 + 16);
    if (v54 <= 1019)
    {
      *(_DWORD *)&v55[v54] = 540945696;
      uint64_t v56 = 4;
LABEL_118:
      *v53 += v56;
      goto LABEL_123;
    }
    v55[v54] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v6 + 1064), v55, 0x8000100u);
    uint64_t v61 = (CFMutableStringRef *)(v6 + 1064);
    v62 = " -> ";
  }
  void *v53 = 0;
  CFStringAppendCString(*v61, v62, 0x8000100u);
LABEL_123:
  uint64_t v63 = v7[8];
  uint64_t v64 = v7[9];
  if (v63 < 2 || v64 < 1)
  {
    uint64_t v64 = 0;
    uint64_t v66 = 1096;
  }
  else
  {
    *(void *)(v6 + 1096) = v63;
    *(void *)(v6 + 1080) = *(void *)(v6 + 1040) + [*(id *)(v6 + 1064) length];
    uint64_t v66 = 1088;
  }
  *(void *)(v6 + v66) = v64;

  uint64_t v67 = *(void *)(a1 + 32);
  if (a3)
  {
    if (_NSIsNSString())
    {
      CFIndex v68 = [(__CFString *)a3 length];
      uint64_t v69 = *(void *)(v67 + 1040);
      if (3 * v68 + v69 > 1023)
      {
        if (v69 >= 1)
        {
          *(unsigned char *)(v67 + 16 + v69) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
          *(void *)(v67 + 1040) = 0;
        }
        if (v68 > 341)
        {
          [*(id *)(v67 + 1064) appendString:a3];
          goto LABEL_206;
        }
        CFIndex usedBufLen = 0;
        v117.location = 0;
        v117.length = v68;
        CFStringGetBytes(a3, v117, 0x8000100u, 0, 0, (UInt8 *)(v67 + 16), 1024, &usedBufLen);
        CFIndex v70 = usedBufLen;
      }
      else
      {
        CFIndex usedBufLen = 0;
        v116.location = 0;
        v116.length = v68;
        CFStringGetBytes(a3, v116, 0x8000100u, 0, 0, (UInt8 *)(v67 + v69 + 16), 1024 - v69, &usedBufLen);
        CFIndex v70 = *(void *)(v67 + 1040) + usedBufLen;
      }
      goto LABEL_146;
    }
    if (_NSIsNSNumber())
    {
      uint64_t v73 = a3;
      int v74 = *(char *)[(__CFString *)v73 objCType];
      if (v74 > 80)
      {
        switch(v74)
        {
          case 'c':
            goto LABEL_165;
          case 'd':
            uint64_t v75 = *(void *)(v67 + 1040);
            if (v75 >= 1)
            {
              *(unsigned char *)(v67 + 16 + v75) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(void *)(v67 + 1040) = 0;
            }
            id v76 = *(void **)(v67 + 1064);
            [(__CFString *)v73 doubleValue];
            v78 = @"%0.16g";
            goto LABEL_187;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_179;
          case 'f':
            uint64_t v88 = *(void *)(v67 + 1040);
            if (v88 >= 1)
            {
              *(unsigned char *)(v67 + 16 + v88) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(void *)(v67 + 1040) = 0;
            }
            id v76 = *(void **)(v67 + 1064);
            [(__CFString *)v73 floatValue];
            double v77 = v89;
            v78 = @"%0.7g";
LABEL_187:
            objc_msgSend(v76, "appendFormat:", v78, *(void *)&v77);
            goto LABEL_205;
          case 'i':
            uint64_t v90 = *(void *)(v67 + 1040);
            if (v90 >= 1)
            {
              *(unsigned char *)(v67 + 16 + v90) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(void *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            uint64_t v81 = [(__CFString *)v73 intValue];
            goto LABEL_191;
          case 'l':
            uint64_t v91 = *(void *)(v67 + 1040);
            if (v91 >= 1)
            {
              *(unsigned char *)(v67 + 16 + v91) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(void *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            uint64_t v81 = [(__CFString *)v73 longValue];
            uint64_t v83 = @"%ld";
            goto LABEL_204;
          case 'q':
            uint64_t v92 = *(void *)(v67 + 1040);
            if (v92 >= 1)
            {
              *(unsigned char *)(v67 + 16 + v92) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(void *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            uint64_t v81 = [(__CFString *)v73 longLongValue];
            uint64_t v83 = @"%lld";
            goto LABEL_204;
          case 's':
            uint64_t v93 = *(void *)(v67 + 1040);
            if (v93 >= 1)
            {
              *(unsigned char *)(v67 + 16 + v93) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
              *(void *)(v67 + 1040) = 0;
            }
            v80 = *(void **)(v67 + 1064);
            uint64_t v81 = [(__CFString *)v73 shortValue];
            uint64_t v83 = @"%hi";
            goto LABEL_204;
          default:
            if (v74 == 81)
            {
              uint64_t v94 = *(void *)(v67 + 1040);
              if (v94 >= 1)
              {
                *(unsigned char *)(v67 + 16 + v94) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
                *(void *)(v67 + 1040) = 0;
              }
              v80 = *(void **)(v67 + 1064);
              uint64_t v81 = [(__CFString *)v73 unsignedLongLongValue];
              uint64_t v83 = @"%llu";
            }
            else
            {
              if (v74 != 83) {
                goto LABEL_179;
              }
              uint64_t v85 = *(void *)(v67 + 1040);
              if (v85 >= 1)
              {
                *(unsigned char *)(v67 + 16 + v85) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
                *(void *)(v67 + 1040) = 0;
              }
              v80 = *(void **)(v67 + 1064);
              uint64_t v81 = [(__CFString *)v73 unsignedShortValue];
              uint64_t v83 = @"%hu";
            }
            break;
        }
        goto LABEL_204;
      }
      if (v74 > 72)
      {
        if (v74 == 73)
        {
          uint64_t v86 = *(void *)(v67 + 1040);
          if (v86 >= 1)
          {
            *(unsigned char *)(v67 + 16 + v86) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(void *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          uint64_t v81 = [(__CFString *)v73 unsignedIntValue];
          goto LABEL_178;
        }
        if (v74 == 76)
        {
          uint64_t v82 = *(void *)(v67 + 1040);
          if (v82 >= 1)
          {
            *(unsigned char *)(v67 + 16 + v82) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(void *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          uint64_t v81 = [(__CFString *)v73 unsignedLongValue];
          uint64_t v83 = @"%lu";
          goto LABEL_204;
        }
      }
      else
      {
        if (v74 == 66)
        {
LABEL_165:
          uint64_t v84 = *(void *)(v67 + 1040);
          if (v84 >= 1)
          {
            *(unsigned char *)(v67 + 16 + v84) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(void *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          uint64_t v81 = [(__CFString *)v73 charValue];
LABEL_191:
          uint64_t v83 = @"%d";
          goto LABEL_204;
        }
        if (v74 == 67)
        {
          uint64_t v79 = *(void *)(v67 + 1040);
          if (v79 >= 1)
          {
            *(unsigned char *)(v67 + 16 + v79) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
            *(void *)(v67 + 1040) = 0;
          }
          v80 = *(void **)(v67 + 1064);
          uint64_t v81 = [(__CFString *)v73 unsignedCharValue];
LABEL_178:
          uint64_t v83 = @"%u";
LABEL_204:
          objc_msgSend(v80, "appendFormat:", v83, v81);
LABEL_205:

          goto LABEL_206;
        }
      }
LABEL_179:
      uint64_t v87 = *(void *)(v67 + 1040);
      if (v87 >= 1)
      {
        *(unsigned char *)(v67 + 16 + v87) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
        *(void *)(v67 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v67 + 1064), "appendFormat:", @"<***unknown type:%s>", -[__CFString objCType](v73, "objCType"));
      goto LABEL_205;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a3 appendDescriptionToStream:v67];
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a3 appendDescriptionToFormatter:v67];
      goto LABEL_206;
    }
    if (_NSIsNSDictionary())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v110 = 3221225472;
      v111 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke;
      v112 = &unk_1E5446820;
      uint64_t v113 = v67;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v67, a3, 0, (uint64_t)&usedBufLen);
      goto LABEL_206;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)v67 appendIntegerSet:a3 withName:0 format:0];
      goto LABEL_206;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v110 = 3221225472;
      v111 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v112 = &unk_1E5446848;
      uint64_t v113 = v67;
      [(id)v67 appendIntegerMap:a3 withName:0 keyFormat:0 valueBlock:&usedBufLen];
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v110 = 3221225472;
      v111 = (uint64_t (*)(uint64_t, __CFString *))__BSDescribeAppendObjectDescription_block_invoke_3;
      v112 = &unk_1E5446848;
      uint64_t v113 = v67;
      [(id)v67 appendCollection:a3 withName:0 itemBlock:&usedBufLen];
      goto LABEL_206;
    }
    if (*(unsigned char *)(v67 + 1056) || (uint64_t v97 = *(void *)(v67 + 8), *(void *)(v97 + 8) == 2))
    {
      if (objc_opt_respondsToSelector())
      {
        v98 = [(__CFString *)a3 succinctDescription];
        goto LABEL_228;
      }
      uint64_t v97 = *(void *)(v67 + 8);
    }
    if (*(void *)(v97 + 16) == 2) {
      [(__CFString *)a3 debugDescription];
    }
    else {
    v98 = [(__CFString *)a3 description];
    }
LABEL_228:
    v101 = v98;
    CFIndex v102 = [(__CFString *)v98 length];
    uint64_t v103 = *(void *)(v67 + 1040);
    if (v103 + 3 * v102 > 1023)
    {
      if (v103 >= 1)
      {
        *(unsigned char *)(v67 + 16 + v103) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
        *(void *)(v67 + 1040) = 0;
      }
      if (v102 > 341)
      {
        [*(id *)(v67 + 1064) appendString:v101];
        goto LABEL_244;
      }
      CFIndex usedBufLen = 0;
      v119.location = 0;
      v119.length = v102;
      CFStringGetBytes(v101, v119, 0x8000100u, 0, 0, (UInt8 *)(v67 + 16), 1024, &usedBufLen);
      CFIndex v104 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v118.location = 0;
      v118.length = v102;
      CFStringGetBytes(v101, v118, 0x8000100u, 0, 0, (UInt8 *)(v67 + v103 + 16), 1024 - v103, &usedBufLen);
      CFIndex v104 = *(void *)(v67 + 1040) + usedBufLen;
    }
    *(void *)(v67 + 1040) = v104;
LABEL_244:

    goto LABEL_206;
  }
  uint64_t v71 = *(void *)(v67 + 1040);
  uint64_t v72 = v67 + 16 + v71;
  if (v71 <= 1018)
  {
    *(unsigned char *)(v72 + 4) = 62;
    *(_DWORD *)uint64_t v72 = 1818848828;
    CFIndex v70 = *(void *)(v67 + 1040) + 5;
LABEL_146:
    *(void *)(v67 + 1040) = v70;
    goto LABEL_206;
  }
  *(unsigned char *)uint64_t v72 = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), (const char *)(v67 + 16), 0x8000100u);
  *(void *)(v67 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v67 + 1064), "<nil>", 0x8000100u);
LABEL_206:
  uint64_t v95 = *(void *)(a1 + 32);
  *(void *)(v95 + 1104) = 1;
  return BSDescribeTruncationCommit(v95);
}

void sub_18AAD1324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD1928(_Unwind_Exception *exception_object)
{
}

void sub_18AAD1F54(_Unwind_Exception *exception_object)
{
}

void sub_18AAD299C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD2D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _BSCollectionLineBreakNoneStyle()
{
  if (qword_1EB21B2F0 != -1) {
    dispatch_once(&qword_1EB21B2F0, &__block_literal_global_54_0);
  }
  v0 = (void *)qword_1EB21B2E8;
  return v0;
}

void sub_18AAD339C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD35A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSEqualSets(CFSetRef theSet, const __CFSet *a2)
{
  if (theSet == a2) {
    return 1;
  }
  uint64_t result = 0;
  if (theSet && a2)
  {
    CFIndex Count = CFSetGetCount(theSet);
    if (Count == CFSetGetCount(a2))
    {
      return [(__CFSet *)theSet isEqualToSet:a2];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_18AAD3940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSDescribeAppendItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 8) + 24);
  if (v4 == 2)
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    if (*(void *)(a1 + 1104) == 1) {
      *(void *)(a1 + 1104) = 0;
    }
    unint64_t v5 = *(void *)(a1 + 1112);
    if ((v5 & 0x8000000000000000) == 0)
    {
      *(void *)(a1 + 1112) = v5 - 1;
      if (v5 >= 2)
      {
        uint64_t v6 = *(void *)(a1 + 1040);
        id v7 = (const char *)(a1 + 16);
        if (v6 > 1021)
        {
          v7[v6] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v7, 0x8000100u);
          *(void *)(a1 + 1040) = 0;
          uint64_t v13 = *(__CFString **)(a1 + 1064);
          CFStringAppendCString(v13, ", ", 0x8000100u);
        }
        else
        {
          *(_WORD *)&v7[v6] = 8236;
          *(void *)(a1 + 1040) += 2;
        }
      }
    }
  }
  else
  {
    switch(*(void *)(a1 + 1104))
    {
      case 1:
        uint64_t v8 = *(void *)(a1 + 1040);
        uint64_t v9 = (const char *)(a1 + 16);
        if (v4 == 3)
        {
          if (v8 > 1022)
          {
            v9[v8] = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v9, 0x8000100u);
            *(void *)(a1 + 1040) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
          }
          else
          {
            v9[v8] = 59;
            ++*(void *)(a1 + 1040);
          }
          goto LABEL_21;
        }
        if (v8 <= 1021)
        {
          *(_WORD *)&v9[v8] = 8251;
          uint64_t v12 = *(void *)(a1 + 1040) + 2;
          goto LABEL_29;
        }
        v9[v8] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v9, 0x8000100u);
        *(void *)(a1 + 1040) = 0;
        uint64_t v14 = *(__CFString **)(a1 + 1064);
        __int16 v15 = "; ";
        goto LABEL_34;
      case 2:
        uint64_t v10 = *(void *)(a1 + 1040);
        uint64_t v11 = (const char *)(a1 + 16);
        if (v10 <= 1022)
        {
          v11[v10] = 32;
          uint64_t v12 = *(void *)(a1 + 1040) + 1;
          goto LABEL_29;
        }
        v11[v10] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v11, 0x8000100u);
        *(void *)(a1 + 1040) = 0;
        uint64_t v14 = *(__CFString **)(a1 + 1064);
        __int16 v15 = " ";
        goto LABEL_34;
      case 3:
LABEL_21:
        uint64_t v16 = *(void *)(a1 + 1040);
        long long v17 = (const char *)(a1 + 16);
        if (v16 > 1022)
        {
          v17[v16] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v17, 0x8000100u);
          *(void *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
        }
        else
        {
          v17[v16] = 10;
          ++*(void *)(a1 + 1040);
        }
        goto LABEL_24;
      case 4:
LABEL_24:
        uint64_t v18 = *(void *)(a1 + 1072);
        if (v18 < 1) {
          goto LABEL_35;
        }
        if (v18 >= 8) {
          uint64_t v18 = 8;
        }
        long long v19 = (const char *)*((void *)&sIndentSpaceStrings + v18);
        size_t v20 = strlen(v19);
        uint64_t v21 = *(void *)(a1 + 1040);
        if ((uint64_t)(v21 + v20) > 1023)
        {
          if (v21 >= 1)
          {
            *(unsigned char *)(a1 + 16 + v21) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            *(void *)(a1 + 1040) = 0;
          }
          uint64_t v14 = *(__CFString **)(a1 + 1064);
          __int16 v15 = v19;
LABEL_34:
          CFStringAppendCString(v14, v15, 0x8000100u);
        }
        else
        {
          size_t v22 = v20;
          memcpy((void *)(a1 + v21 + 16), v19, v20);
          uint64_t v12 = *(void *)(a1 + 1040) + v22;
LABEL_29:
          *(void *)(a1 + 1040) = v12;
        }
LABEL_35:
        *(void *)(a1 + 1104) = 0;
LABEL_36:
        (*(void (**)(uint64_t))(a2 + 16))(a2);
        unint64_t v23 = *(void *)(a1 + 1112);
        if ((v23 & 0x8000000000000000) == 0)
        {
          *(void *)(a1 + 1112) = v23 - 1;
          if (v23 >= 2)
          {
            uint64_t v24 = *(void *)(a1 + 1040);
            id v25 = (const char *)(a1 + 16);
            if (v24 > 1022)
            {
              v25[v24] = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v25, 0x8000100u);
              *(void *)(a1 + 1040) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ",", 0x8000100u);
            }
            else
            {
              v25[v24] = 44;
              ++*(void *)(a1 + 1040);
            }
          }
        }
        uint64_t v26 = *(void *)(a1 + 1040);
        uint64_t v27 = (const char *)(a1 + 16);
        if (v26 > 1022)
        {
          v27[v26] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v27, 0x8000100u);
          *(void *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
        }
        else
        {
          v27[v26] = 10;
          ++*(void *)(a1 + 1040);
        }
        *(void *)(a1 + 1104) = 4;
        break;
      default:
        goto LABEL_36;
    }
  }
}

id _BSCollectionLineBreakEachItemStyle()
{
  if (qword_1EB21B300 != -1) {
    dispatch_once(&qword_1EB21B300, &__block_literal_global_56);
  }
  v0 = (void *)qword_1EB21B2F8;
  return v0;
}

void sub_18AAD3ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD3FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD403C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD414C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD41D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSCFBundle;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAD4384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_18AAD456C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD4750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD48BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD49F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_18AAD4ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

double BSAbsoluteMachTimeNow()
{
  uint64_t v0 = mach_absolute_time();
  if (_MergedGlobals_9 != -1) {
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  }
  return *(double *)&qword_1EB21B0C0 * (double)v0;
}

uint64_t BSEqualDictionaries(CFDictionaryRef theDict, const __CFDictionary *a2)
{
  if (theDict == a2) {
    return 1;
  }
  uint64_t result = 0;
  if (theDict && a2)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
    if (Count == CFDictionaryGetCount(a2))
    {
      return [(__CFDictionary *)theDict isEqualToDictionary:a2];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void BSDispatchQueueAssertNot(void *a1)
{
  queue = a1;
  if (queue == MEMORY[0x1E4F14428]) {
    BSDispatchQueueAssertNotMain();
  }
  else {
    dispatch_assert_queue_not_V2(queue);
  }
}

void sub_18AAD4DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD4E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD4EEC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAD5020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD50F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD5160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD5260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD52C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSDeserializeCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  uint64_t v2 = (void *)BSCreateDeserializedCFValueFromXPCDictionaryWithKey(a1, a2);
  return v2;
}

void sub_18AAD547C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t BSCreateDeserializedCFValueFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (v3 && a2)
  {
    uint64_t v6 = xpc_dictionary_get_value(v3, a2);
    if (v6)
    {
      uint64_t v5 = _CFXPCCreateCFObjectFromXPCObject();
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

void sub_18AAD5518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD581C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD595C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD5C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD5E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSAuditTokenTaskHasEntitlement(_OWORD *a1, void *a2)
{
  id v3 = a2;
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  uint64_t v5 = +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v8);
  uint64_t v6 = -[BSSecTask BOOLForEntitlement:]((uint64_t)v5, v3);

  return v6;
}

void sub_18AAD5F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD5FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSEqualProcessAuditTokens(long long *a1, long long *a2)
{
  long long v3 = a1[1];
  long long v10 = *a1;
  long long v11 = v3;
  uint64_t v4 = BSVersionedPIDForAuditToken(&v10);
  long long v5 = a2[1];
  long long v10 = *a2;
  long long v11 = v5;
  uint64_t v6 = BSVersionedPIDForAuditToken(&v10);
  return v4 != -1 && v6 != -1 && v4 == v6;
}

void sub_18AAD6188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_18AAD6210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSXPCConnectionHasEntitlement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  long long v10 = v5;
  long long v11 = v5;
  xpc_connection_get_audit_token();
  v9[0] = v10;
  v9[1] = v11;
  uint64_t v6 = +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v9);
  uint64_t v7 = -[BSSecTask BOOLForEntitlement:]((uint64_t)v6, v4);

  return v7;
}

void sub_18AAD62B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD6394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AAD6490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD6504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD65A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD6630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSSecTaskCopyEntitlementValue(__SecTask *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    CFErrorRef error = 0;
    id v4 = (void *)SecTaskCopyValueForEntitlement(a1, v3, &error);
    if (error)
    {
      long long v5 = BSLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        CFErrorRef v10 = error;
        _os_log_error_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_ERROR, "Unable to get entitlements for client task. Error: %{public}@", buf, 0xCu);
      }

      CFRelease(error);
    }
  }
  else
  {
    uint64_t v6 = BSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AAA8000, v6, OS_LOG_TYPE_ERROR, "Unable to get security task", buf, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

void sub_18AAD6798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD6A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSVersionedPIDForAuditToken(_OWORD *a1)
{
  if (!BSAuditTokenIsValid((uint64_t)a1)) {
    return -1;
  }
  long long v2 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v2;
  uint64_t v3 = audit_token_to_pidversion(&v6);
  long long v4 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v4;
  return audit_token_to_pid(&v6) | (unint64_t)(v3 << 32);
}

void sub_18AAD6B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id BSInterfaceOrientationDescription(unint64_t a1)
{
  if (a1 > 4) {
    id v1 = @"INVALID";
  }
  else {
    id v1 = off_1E54464A8[a1];
  }
  long long v2 = [NSString stringWithFormat:@"%@ (%li)", v1, a1];
  return v2;
}

id BSSystemRootDirectory()
{
  if (qword_1EB21B1E8 != -1) {
    dispatch_once(&qword_1EB21B1E8, &__block_literal_global_20);
  }
  uint64_t v0 = (void *)_MergedGlobals_22;
  return v0;
}

void BSDispatchMain(void *a1)
{
  block = a1;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    block[2](block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void sub_18AAD6DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD6E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSSerializeDoubleToXPCDictionaryWithKey(void *a1, const char *a2, double a3)
{
  xpc_object_t xdict = a1;
  if (xdict && a2) {
    xpc_dictionary_set_double(xdict, a2, a3);
  }
}

void sub_18AAD6F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD6FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD7638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_18AAD7814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD78F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD7A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD7BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD7E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD80A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCAMediaTimingFunctionClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCAMediaTimingFunctionClass_softClass;
  uint64_t v7 = getCAMediaTimingFunctionClass_softClass;
  if (!getCAMediaTimingFunctionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getCAMediaTimingFunctionClass_block_invoke;
    v3[3] = &unk_1E54455A0;
    _OWORD v3[4] = &v4;
    __getCAMediaTimingFunctionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AAD81C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *BSInterfaceOrientationMaskDescription(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    long long v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = v2;
    if ((v1 & 2) != 0)
    {
      [(__CFString *)v2 appendString:@" Pu"];
      v1 &= ~2uLL;
    }
    if ((v1 & 0x10) != 0)
    {
      [(__CFString *)v3 appendString:@" Ll"];
      v1 &= ~0x10uLL;
    }
    if ((v1 & 8) != 0)
    {
      [(__CFString *)v3 appendString:@" Lr"];
      v1 &= ~8uLL;
    }
    if ((v1 & 4) != 0)
    {
      [(__CFString *)v3 appendString:@" Pd"];
      v1 &= ~4uLL;
    }
    if (v1) {
      [(__CFString *)v3 appendFormat:@" %li", v1];
    }
    [(__CFString *)v3 appendString:@""]);
  }
  else
  {
    uint64_t v3 = @"none";
  }
  return v3;
}

void sub_18AAD83C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD8744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD8894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD8A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD8C0C(_Unwind_Exception *exception_object)
{
  if (!v2) {

  }
  _Unwind_Resume(exception_object);
}

void sub_18AAD8F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD90E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD9234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getCASpringAnimationClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCASpringAnimationClass_softClass;
  uint64_t v7 = getCASpringAnimationClass_softClass;
  if (!getCASpringAnimationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getCASpringAnimationClass_block_invoke;
    v3[3] = &unk_1E54455A0;
    _OWORD v3[4] = &v4;
    __getCASpringAnimationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AAD9310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCATransactionClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCATransactionClass_softClass;
  uint64_t v7 = getCATransactionClass_softClass;
  if (!getCATransactionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getCATransactionClass_block_invoke;
    v3[3] = &unk_1E54455A0;
    _OWORD v3[4] = &v4;
    __getCATransactionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AAD93F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AAD9660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAD977C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_18AAD97F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAD9A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSSerializeCGSizeToXPCDictionaryWithKey(void *a1, const char *a2, double a3, double a4)
{
  xpc_object_t xdict = a1;
  if (xdict && a2)
  {
    xpc_object_t v7 = BSCreateSerializedXPCObjectFromCGSize(a3, a4);
    xpc_dictionary_set_value(xdict, a2, v7);
  }
}

void sub_18AAD9AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

xpc_object_t BSCreateSerializedXPCObjectFromCGSize(double a1, double a2)
{
  objects[2] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  objects[0] = xpc_double_create(a1);
  objects[1] = xpc_double_create(a2);
  xpc_object_t v3 = xpc_array_create(objects, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  return v3;
}

void sub_18AAD9BBC(_Unwind_Exception *a1)
{
  for (uint64_t i = 8; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_18AAD9C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADA080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AADA460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADA5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADA73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

objc_class *BSObjCClassCreate(void *a1, objc_class *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = a3;
  if (!v5)
  {
    uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"preferredName != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v19 = objc_msgSend(NSString, "stringWithUTF8String:", "Class  _Nonnull BSObjCClassCreate(NSString *__strong _Nonnull, __unsafe_unretained Class _Nonnull, BSObjCClassConfigurator  _Nullable __strong)");
      *(_DWORD *)buf = 138544130;
      unint64_t v23 = v19;
      __int16 v24 = 2114;
      id v25 = @"BSObjCRuntime.m";
      __int16 v26 = 1024;
      int v27 = 1950;
      __int16 v28 = 2114;
      long long v29 = v18;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v18 UTF8String];
    __break(0);
    JUMPOUT(0x18AADAA9CLL);
  }
  if (!a2)
  {
    size_t v20 = [NSString stringWithFormat:@"creating root classes is not supported"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "Class  _Nonnull BSObjCClassCreate(NSString *__strong _Nonnull, __unsafe_unretained Class _Nonnull, BSObjCClassConfigurator  _Nullable __strong)");
      *(_DWORD *)buf = 138544130;
      unint64_t v23 = v21;
      __int16 v24 = 2114;
      id v25 = @"BSObjCRuntime.m";
      __int16 v26 = 1024;
      int v27 = 1951;
      __int16 v28 = 2114;
      long long v29 = v20;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v20 UTF8String];
    __break(0);
    JUMPOUT(0x18AADAB68);
  }
  id v7 = v5;
  uint64_t v8 = v7;
  if ([v7 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&BSObjCClassCreate___ObjCLock);
  id v9 = v8;
  Class v10 = objc_lookUpClass((const char *)[v9 UTF8String]);
  ClassPair = v10;
  if (v10)
  {
    if (([(objc_class *)v10 isSubclassOfClass:a2] & 1) == 0)
    {
      uint64_t v12 = NSString;
      uint64_t v13 = NSStringFromClass(a2);
      uint64_t v14 = [v12 stringWithFormat:@"class %@ is not a subclass of %@", v9, v13];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = objc_msgSend(NSString, "stringWithUTF8String:", "Class  _Nonnull BSObjCClassCreate(NSString *__strong _Nonnull, __unsafe_unretained Class _Nonnull, BSObjCClassConfigurator  _Nullable __strong)");
        *(_DWORD *)buf = 138544130;
        unint64_t v23 = v15;
        __int16 v24 = 2114;
        id v25 = @"BSObjCRuntime.m";
        __int16 v26 = 1024;
        int v27 = 1971;
        __int16 v28 = 2114;
        long long v29 = v14;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      qword_1E911F420 = [v14 UTF8String];
      __break(0);
      JUMPOUT(0x18AADA928);
    }
  }
  else
  {
    ClassPair = objc_allocateClassPair(a2, (const char *)[v9 UTF8String], 0);
    if (v6) {
      v6[2](v6, ClassPair);
    }
    objc_registerClassPair(ClassPair);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&BSObjCClassCreate___ObjCLock);
  uint64_t v16 = ClassPair;

  return v16;
}

void sub_18AADAB70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADB114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADB2A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSDispatchTimer;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AADB2F0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AADB464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AADB684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSCollectionMap(objc_class *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  if (v6)
  {
    id v7 = objc_msgSend([a1 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      uint64_t v11 = *MEMORY[0x1E4F1D260];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = v6[2](v6, *(void *)(*((void *)&v15 + 1) + 8 * i));
          if (v13) {
            [v7 addObject:v13];
          }
          else {
            objc_msgSend(v7, "addObject:", v11, (void)v15);
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = (void *)[v5 copyWithZone:0];
  }

  return v7;
}

void sub_18AADB8A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADB950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  uint64_t v6 = NSString;
  id v7 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
  id v8 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a3, 17, *(void *)&a4];
  uint64_t v9 = [v6 stringWithFormat:@"{%@, %@}", v7, v8];

  return v9;
}

void sub_18AADBA38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADBF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSAppendVersionedPIDToStringAppendTarget(unint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 == -1) {
    [v3 appendString:@"<invalid>"];
  }
  else {
    objc_msgSend(v3, "appendFormat:", @"%d(v%X)", a1, HIDWORD(a1));
  }
}

void sub_18AADC010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSVersionedPID(unint64_t a1)
{
  if (a1 == -1)
  {
    id v3 = @"<invalid>";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d(v%X)", a1, HIDWORD(a1), v1);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void sub_18AADC1CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADC2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _BSProtobufDecodeRepeatFieldObject(unsigned char *a1, uint64_t a2, id *a3, void *a4)
{
  id v7 = *a3;
  if (!*a3)
  {
    id v7 = objc_alloc_init(*(Class *)(a2 + 40));
    *a3 = v7;
  }
  uint64_t v13 = 0;
  uint64_t v9 = _BSProtobufDecodeObjectWithClassOverride(a1, *(void **)(a2 + 32), &v13, a4);
  uint64_t v10 = v13;
  if (v9) {
    BOOL v11 = v13 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    [v7 addObject:v13];
  }
  return v9;
}

uint64_t _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = a1;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1[2];
  int v6 = 1;
  uint64_t v20 = v5;
  do
  {
    while (1)
    {
      if (v5) {
        PBDataWriterPlaceMark();
      }
      uint64_t v7 = v4[3];
      if (v7 >= 1)
      {
        uint64_t v8 = 0;
        while (1)
        {
          uint64_t v9 = v4[5];
          uint64_t v10 = v9 + 96 * v8;
          int v11 = *(unsigned __int8 *)(v10 + 88);
          uint64_t v12 = a2 + *(void *)(v10 + 16);
          if (*(uint64_t *)(v10 + 64) >= 1) {
            break;
          }
          if (!*(unsigned char *)(v10 + 88)) {
            goto LABEL_15;
          }
LABEL_17:
          if (++v8 >= v7) {
            goto LABEL_18;
          }
        }
        uint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(void *)(*(void *)(v9 + 96 * v8 + 72) + 8 * v13);
          if ([(id)objc_opt_class() isEqual:*(void *)(v14 + 32)])
          {
            uint64_t v10 = v14;
            goto LABEL_15;
          }
          ++v13;
        }
        while (v13 < *(void *)(v10 + 64));
        if (v11)
        {
          long long v16 = NSString;
          Name = ivar_getName(*(Ivar *)(v9 + 96 * v8 + 24));
          long long v18 = (void *)[v16 stringWithFormat:@"encode ivar %s: unexpected class %@", Name, objc_opt_class()];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress(BSProtobufSchema *, void *, PBDataWriter *, NSError **)");
            __int16 v26 = 2114;
            int v27 = @"BSProtobufSerialization.m";
            __int16 v28 = 1024;
            int v29 = 1145;
            __int16 v30 = 2114;
            uint64_t v31 = v18;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
          qword_1E911F420 = [v18 UTF8String];
          __break(0);
          JUMPOUT(0x18AADCED8);
        }
LABEL_15:
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48))(a3, v10, v12, a4);
        if (!result) {
          return result;
        }
        uint64_t v7 = v4[3];
        goto LABEL_17;
      }
LABEL_18:
      id v4 = (void *)v4[2];
      uint64_t v5 = v20;
      if (!v20) {
        break;
      }
      PBDataWriterRecallMark();
      ++v6;
      if (!v4) {
        return 1;
      }
    }
  }
  while (v4);
  return 1;
}

uint64_t _BSProtobufEncodePOD(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(const char **)(a2 + 8);
  int v3 = *v2;
  if (v3 > 82)
  {
    switch(*v2)
    {
      case 'c':
      case 'i':
      case 'l':
      case 'q':
      case 's':
        goto LABEL_20;
      case 'd':
        goto LABEL_25;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_28;
      case 'f':
        PBDataWriterWriteFloatField();
        return 1;
      default:
        if (v3 == 83) {
          goto LABEL_20;
        }
        if (v3 != 123) {
          goto LABEL_28;
        }
        if (!strncmp("{CGPoint=", *(const char **)(a2 + 8), 9uLL) || !strncmp("{CGSize=", v2, 8uLL))
        {
          PBDataWriterWriteDoubleField();
          goto LABEL_25;
        }
        if (!strncmp("{CGRect=", v2, 8uLL))
        {
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          goto LABEL_25;
        }
        if (!strncmp("{CGAffineTransform=", v2, 0x13uLL))
        {
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          goto LABEL_25;
        }
        if (!strncmp("{CATransform3D=", v2, 0xFuLL))
        {
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
          PBDataWriterWriteDoubleField();
LABEL_25:
          PBDataWriterWriteDoubleField();
          return 1;
        }
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"unsupported encoding:%s", v2);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _BSProtobufEncodePOD(PBDataWriter *, _BSProtobufFieldEntry *, void *, NSError **)");
          __int16 v8 = 2114;
          uint64_t v9 = @"BSProtobufSerialization.m";
          __int16 v10 = 1024;
          int v11 = 893;
          __int16 v12 = 2114;
          uint64_t v13 = v5;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        break;
    }
LABEL_33:
    qword_1E911F420 = [v5 UTF8String];
    __break(0);
    JUMPOUT(0x18AADD368);
  }
  if (v3 > 72)
  {
    if (v3 == 73 || v3 == 76 || v3 == 81) {
      goto LABEL_20;
    }
LABEL_28:
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"unsupported encoding:%s", *(void *)(a2 + 8));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _BSProtobufEncodePOD(PBDataWriter *, _BSProtobufFieldEntry *, void *, NSError **)");
      __int16 v8 = 2114;
      uint64_t v9 = @"BSProtobufSerialization.m";
      __int16 v10 = 1024;
      int v11 = 899;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    goto LABEL_33;
  }
  if (v3 == 66)
  {
    PBDataWriterWriteBOOLField();
    return 1;
  }
  if (v3 != 67) {
    goto LABEL_28;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  return 1;
}

uint64_t _BSProtobufEncodeObject(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = *a3;
  if (*a3)
  {
    PBDataWriterPlaceMark();
    uint64_t result = _BSProtobufSchemaEncodeMessage([*(id *)(a2 + 32) protobufSchema], v4, a1, a4);
    if (!result) {
      return result;
    }
    PBDataWriterRecallMark();
  }
  return 1;
}

uint64_t _BSProtobufSchemaEncodeMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 74))
  {
    __int16 v8 = (void *)[objc_alloc(*(Class *)(a1 + 8)) initProtobufTranslatorForObject:a2];
    uint64_t v9 = _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress((void *)a1, (uint64_t)v8, a3, a4);
    if (v8) {

    }
    return v9;
  }
  else
  {
    if (objc_opt_class() != *(void *)(a1 + 8) && (objc_opt_isKindOfClass() & 1) == 0)
    {
      int v11 = (void *)[NSString stringWithFormat:@"got:%@ expected:%@", objc_opt_class(), *(void *)(a1 + 8)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _BSProtobufSchemaEncodeMessage(BSProtobufSchema *, id, PBDataWriter *, NSError **)");
        __int16 v14 = 2114;
        long long v15 = @"BSProtobufSerialization.m";
        __int16 v16 = 1024;
        int v17 = 1106;
        __int16 v18 = 2114;
        long long v19 = v11;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      qword_1E911F420 = [v11 UTF8String];
      __break(0);
      JUMPOUT(0x18AADD67CLL);
    }
    return _BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress((void *)a1, a2, a3, a4);
  }
}

objc_class *_BSProtobufValidateClassForEncoding(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (BSProtobufClassImplmementsProtobufSchema(a2)) {
    return (objc_class *)a2;
  }
  Class v5 = NSClassFromString((NSString *)objc_msgSend(@"_BSProtobufTranslator_", "stringByAppendingString:", objc_msgSend(a2, "description")));
  if (!v5)
  {
    uint64_t v7 = (void *)[NSString stringWithFormat:@"%s: Class %@ does not conform to BSProtobufSerializable, and a translator class does not exist for it", a1, a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      __int16 v13 = 2114;
      __int16 v14 = @"BSProtobufSerialization.m";
      __int16 v15 = 1024;
      int v16 = 363;
      __int16 v17 = 2114;
      __int16 v18 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AADD804);
  }
  uint64_t v4 = v5;
  if (!BSProtobufClassImplmementsProtobufSchema(v5))
  {
    __int16 v8 = (void *)[NSString stringWithFormat:@"%s: Class %@ does not conform to BSProtobufSerializable, and neither does the translator class", a1, a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      __int16 v13 = 2114;
      __int16 v14 = @"BSProtobufSerialization.m";
      __int16 v15 = 1024;
      int v16 = 366;
      __int16 v17 = 2114;
      __int16 v18 = v8;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v8 UTF8String];
    __break(0);
    JUMPOUT(0x18AADD8C0);
  }
  if (!class_getInstanceMethod(v4, sel_initProtobufTranslatorForObject_))
  {
    uint64_t v9 = (void *)[NSString stringWithFormat:@"%s: Class %@ translator (%@) does not implement initProtobufTranslatorForObject:", a1, a2, v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      __int16 v13 = 2114;
      __int16 v14 = @"BSProtobufSerialization.m";
      __int16 v15 = 1024;
      int v16 = 369;
      __int16 v17 = 2114;
      __int16 v18 = v9;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v9 UTF8String];
    __break(0);
    JUMPOUT(0x18AADD980);
  }
  if (!class_getInstanceMethod(v4, sel_didFinishProtobufDecodingWithError_))
  {
    __int16 v10 = (void *)[NSString stringWithFormat:@"%s: Class %@ translator does not implement didFinishProtobufDecodingWithError: -- translators must return an instance of the original class", a1, a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "Class _BSProtobufValidateClassForEncoding(const char *, Class)");
      __int16 v13 = 2114;
      __int16 v14 = @"BSProtobufSerialization.m";
      __int16 v15 = 1024;
      int v16 = 372;
      __int16 v17 = 2114;
      __int16 v18 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AADDA3CLL);
  }
  return v4;
}

BOOL BSProtobufClassImplmementsProtobufSchema(void *a1)
{
  outCFIndex Count = 0;
  Class Class = object_getClass(a1);
  uint64_t v2 = class_copyMethodList(Class, &outCount);
  if (!v2) {
    return 0;
  }
  int v3 = v2;
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Description = method_getDescription(v3[i]);
      BOOL v6 = Description->name == sel_protobufSchema;
      if (Description->name == sel_protobufSchema) {
        break;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  free(v3);
  return v6;
}

uint64_t _BSProtobufDecodeObjectWithClassOverride(unsigned char *a1, void *a2, void **a3, void *a4)
{
  v12[1] = 0;
  v12[2] = 0;
  if (!PBReaderPlaceMark()) {
    return 0;
  }
  uint64_t v8 = [a2 protobufSchema];
  if (*(unsigned char *)(v8 + 73)) {
    id v9 = (id)[objc_alloc((Class)a2) initForProtobufDecoding];
  }
  else {
    id v9 = objc_alloc_init((Class)a2);
  }
  v12[0] = v9;
  uint64_t v10 = _BSProtobufSchemaDecodeMessage(v8, v12, a1, a4);
  if (v10)
  {
    *a3 = v12[0];
    PBReaderRecallMark();
  }
  else
  {
    *a3 = 0;
  }
  return v10;
}

uint64_t _BSProtobufSchemaDecodeMessage(uint64_t a1, void **a2, unsigned char *a3, void *a4)
{
  uint64_t v4 = a4;
  BOOL v6 = (void *)a1;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  char v7 = 0;
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v65 = *MEMORY[0x1E4F28798];
  id v9 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v64 = *MEMORY[0x1E4F28568];
  uint64_t v10 = (int *)MEMORY[0x1E4F940E0];
  int v11 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
LABEL_4:
    if (!v6) {
      goto LABEL_63;
    }
    v67[0] = 0;
    v67[1] = 0;
    if (v8) {
      break;
    }
    if (*(void *)&a3[*v9] >= *(void *)&a3[*v10] || a3[*v11])
    {
      if (v7)
      {
        char v7 = 1;
        goto LABEL_59;
      }
LABEL_55:
      if (!a3[*v11])
      {
        char v7 = 0;
        goto LABEL_57;
      }
      if (v4)
      {
        unint64_t v52 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v68 = v64;
        uint64_t v69 = [NSString stringWithFormat:@"decode error: mystery error (at end) decoding class %@", *(void *)(a1 + 8)];
        CFRange v53 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v54 = &v69;
        v55 = &v68;
LABEL_77:
        *uint64_t v4 = objc_msgSend(v52, "errorWithDomain:code:userInfo:", v65, 22, objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, 1));
      }
      return 0;
    }
LABEL_30:
    char v31 = 0;
    unsigned int v32 = 0;
    unint64_t v33 = 0;
    do
    {
      while (1)
      {
        uint64_t v34 = *v9;
        uint64_t v35 = *(void *)&a3[v34];
        unint64_t v36 = v35 + 1;
        if (v35 == -1 || v36 > *(void *)&a3[*v10])
        {
          a3[*v11] = 1;
          goto LABEL_34;
        }
        char v42 = *(unsigned char *)(*(void *)&a3[*v12] + v35);
        *(void *)&a3[v34] = v36;
        v33 |= (unint64_t)(v42 & 0x7F) << v31;
        if (v42 < 0) {
          break;
        }
LABEL_34:
        if (a3[*v11]) {
          goto LABEL_60;
        }
LABEL_35:
        if ((v33 & 7) == 4) {
          goto LABEL_55;
        }
        unint64_t v37 = v33 >> 3;
        uint64_t v38 = v6[3];
        if (v38 < 1)
        {
LABEL_40:
          uint64_t v40 = BSLogCommon();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = v6[1];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)double v77 = v37;
            *(_WORD *)&v77[4] = 2114;
            *(void *)&v77[6] = v43;
            _os_log_error_impl(&dword_18AAA8000, v40, OS_LOG_TYPE_ERROR, "decode error: tag %d doesn't exist in schema for class %{public}@", buf, 0x12u);
          }
          char v41 = PBReaderSkipValueWithTag();
          if (v4 && (v41 & 1) == 0)
          {
            unint64_t v52 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v70 = v64;
            uint64_t v71 = [NSString stringWithFormat:@"decode error: corruption at tag %d / class %@", v37, v6[1]];
            CFRange v53 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v54 = &v71;
            v55 = &v70;
            goto LABEL_77;
          }
          int v11 = (int *)MEMORY[0x1E4F940C8];
          if ((v41 & 1) == 0) {
            return 0;
          }
        }
        else
        {
          uint64_t v39 = v6[5];
          while (*(_DWORD *)v39 != v37)
          {
            v39 += 96;
            if (!--v38) {
              goto LABEL_40;
            }
          }
          if (((*(uint64_t (**)(unsigned char *))(v39 + 56))(a3) & 1) == 0) {
            return 0;
          }
        }
        uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
        if (*(void *)&a3[*v9] < *(void *)&a3[*v10])
        {
          char v31 = 0;
          unsigned int v32 = 0;
          unint64_t v33 = 0;
          if (!a3[*v11]) {
            continue;
          }
        }
        goto LABEL_55;
      }
      v31 += 7;
      BOOL v18 = v32++ >= 9;
    }
    while (!v18);
    unint64_t v33 = 0;
    if (!a3[*v11]) {
      goto LABEL_35;
    }
LABEL_60:
    if (v4)
    {
      uint64_t v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v72 = v64;
      uint64_t v73 = [NSString stringWithFormat:@"decode error: mystery error decoding class %@", v6[1]];
      char v7 = 1;
      uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      uint64_t v46 = v44;
      int v11 = (int *)MEMORY[0x1E4F940C8];
      *uint64_t v4 = [v46 errorWithDomain:v65 code:22 userInfo:v45];
    }
    else
    {
      char v7 = 1;
    }
LABEL_57:
    if (v8) {
      PBReaderRecallMark();
    }
LABEL_59:
    BOOL v6 = (void *)v6[2];
  }
  unsigned int v13 = 0;
  while (1)
  {
    uint64_t v14 = *v9;
    uint64_t v15 = *(void *)&a3[v14];
    unint64_t v16 = v15 + 1;
    if (v15 == -1 || v16 > *(void *)&a3[*v10]) {
      break;
    }
    int v17 = *(char *)(*(void *)&a3[*v12] + v15);
    *(void *)&a3[v14] = v16;
    if (v17 < 0)
    {
      BOOL v18 = v13++ >= 9;
      if (!v18) {
        continue;
      }
    }
    goto LABEL_14;
  }
  a3[*v11] = 1;
LABEL_14:
  int v19 = PBReaderPlaceMark();
  char v20 = v19;
  if (v19) {
    int v21 = 0;
  }
  else {
    int v21 = 3;
  }
  if (v4 && (v19 & 1) == 0)
  {
    uint64_t v66 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v74 = v64;
    size_t v22 = NSString;
    unint64_t v23 = v9;
    __int16 v24 = v10;
    uint64_t v25 = v8;
    __int16 v26 = v4;
    uint64_t v27 = v6[1];
    uint64_t v28 = [a3 position];
    uint64_t v61 = [a3 length];
    uint64_t v60 = v27;
    uint64_t v4 = v26;
    uint64_t v8 = v25;
    uint64_t v10 = v24;
    id v9 = v23;
    int v29 = v22;
    uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
    uint64_t v75 = [v29 stringWithFormat:@"decode error: mystery error (2) decoding class %@ (pos:%d length:%d)", v60, v28, v61];
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    int v11 = (int *)MEMORY[0x1E4F940C8];
    *uint64_t v4 = [v66 errorWithDomain:v65 code:22 userInfo:v30];
    int v21 = 3;
  }
  if (v20)
  {
    if (*(void *)&a3[*v9] >= *(void *)&a3[*v10] || a3[*v11]) {
      goto LABEL_55;
    }
    goto LABEL_30;
  }
  char v7 = 1;
  if (!v21) {
    goto LABEL_4;
  }
LABEL_63:
  if (v7) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 72)) {
    return 1;
  }
  uint64_t v47 = *a2;
  v67[0] = 0;
  uint64_t v48 = (void *)[v47 didFinishProtobufDecodingWithError:v67];
  uint64_t v49 = v48;
  if (v48) {
    BOOL v50 = 1;
  }
  else {
    BOOL v50 = v67[0] == 0;
  }
  uint64_t v51 = v50;
  if (v4 && (v51 & 1) == 0)
  {
    *uint64_t v4 = v67[0];
LABEL_83:
    if (v48 != v47)
    {
      id v57 = v48;

      *a2 = v49;
    }
    return v51;
  }
  if (!v48 || !v67[0]) {
    goto LABEL_83;
  }
  uint64_t v58 = (void *)[NSString stringWithFormat:@"non-nil return value from -[%@ didFinishProtobufDecodingWithError:], but received error %@", v47, v67[0]];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v59 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _BSProtobufInvokeDecodeDidFinish(id *, NSError **)");
    *(_DWORD *)buf = 138544130;
    *(void *)double v77 = v59;
    *(_WORD *)&v77[8] = 2114;
    *(void *)&v77[10] = @"BSProtobufSerialization.m";
    __int16 v78 = 1024;
    int v79 = 694;
    __int16 v80 = 2114;
    uint64_t v81 = v58;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
  }
  uint64_t result = [v58 UTF8String];
  qword_1E911F420 = result;
  __break(0);
  return result;
}

uint64_t _BSProtobufDecodePOD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  Class v5 = *(const char **)(a2 + 8);
  int v6 = *v5;
  if (v6 <= 82)
  {
    if (v6 > 72)
    {
      switch(v6)
      {
        case 'I':
LABEL_26:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          uint64_t v34 = (int *)MEMORY[0x1E4F940E8];
          uint64_t v35 = (int *)MEMORY[0x1E4F940E0];
          unint64_t v36 = (int *)MEMORY[0x1E4F940B8];
          while (1)
          {
            uint64_t v37 = *v34;
            uint64_t v38 = *(void *)(a1 + v37);
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)(a1 + *v35)) {
              break;
            }
            char v40 = *(unsigned char *)(*(void *)(a1 + *v36) + v38);
            *(void *)(a1 + v37) = v39;
            v33 |= (unint64_t)(v40 & 0x7F) << v31;
            if ((v40 & 0x80) == 0) {
              goto LABEL_72;
            }
            v31 += 7;
            BOOL v20 = v32++ >= 9;
            if (v20)
            {
              LODWORD(v33) = 0;
              goto LABEL_74;
            }
          }
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
LABEL_72:
          if (*(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8])) {
            LODWORD(v33) = 0;
          }
LABEL_74:
          *(_DWORD *)a3 = v33;
          return 1;
        case 'L':
LABEL_33:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v12 = 0;
          uint64_t v43 = (int *)MEMORY[0x1E4F940E8];
          uint64_t v44 = (int *)MEMORY[0x1E4F940E0];
          uint64_t v45 = (int *)MEMORY[0x1E4F940B8];
          while (1)
          {
            uint64_t v46 = *v43;
            uint64_t v47 = *(void *)(a1 + v46);
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)(a1 + *v44)) {
              goto LABEL_40;
            }
            char v49 = *(unsigned char *)(*(void *)(a1 + *v45) + v47);
            *(void *)(a1 + v46) = v48;
            v12 |= (unint64_t)(v49 & 0x7F) << v41;
            if ((v49 & 0x80) == 0) {
              goto LABEL_41;
            }
            v41 += 7;
            BOOL v20 = v42++ >= 9;
            if (v20)
            {
LABEL_39:
              uint64_t v12 = 0;
              goto LABEL_43;
            }
          }
        case 'Q':
LABEL_10:
          char v10 = 0;
          unsigned int v11 = 0;
          uint64_t v12 = 0;
          unsigned int v13 = (int *)MEMORY[0x1E4F940E8];
          uint64_t v14 = (int *)MEMORY[0x1E4F940E0];
          uint64_t v15 = (int *)MEMORY[0x1E4F940B8];
          while (1)
          {
            uint64_t v16 = *v13;
            uint64_t v17 = *(void *)(a1 + v16);
            unint64_t v18 = v17 + 1;
            if (v17 == -1 || v18 > *(void *)(a1 + *v14)) {
              break;
            }
            char v19 = *(unsigned char *)(*(void *)(a1 + *v15) + v17);
            *(void *)(a1 + v16) = v18;
            v12 |= (unint64_t)(v19 & 0x7F) << v10;
            if ((v19 & 0x80) == 0) {
              goto LABEL_41;
            }
            v10 += 7;
            BOOL v20 = v11++ >= 9;
            if (v20) {
              goto LABEL_39;
            }
          }
LABEL_40:
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
LABEL_41:
          if (*(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8])) {
            uint64_t v12 = 0;
          }
LABEL_43:
          *(void *)a3 = v12;
          return 1;
      }
LABEL_208:
      v163 = objc_msgSend(NSString, "stringWithFormat:", @"unsupported encoding:%s", *(void *)(a2 + 8));
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        uint64_t v165 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _BSProtobufDecodePOD(PBDataReader *, _BSProtobufFieldEntry *, void *, NSError **)");
        __int16 v166 = 2114;
        v167 = @"BSProtobufSerialization.m";
        __int16 v168 = 1024;
        int v169 = 987;
        __int16 v170 = 2114;
        v171 = v163;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      goto LABEL_213;
    }
    if (v6 == 66)
    {
      char v64 = 0;
      unsigned int v65 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = (int *)MEMORY[0x1E4F940E8];
      uint64_t v68 = (int *)MEMORY[0x1E4F940E0];
      uint64_t v69 = (int *)MEMORY[0x1E4F940B8];
      while (1)
      {
        uint64_t v70 = *v67;
        uint64_t v71 = *(void *)(a1 + v70);
        unint64_t v72 = v71 + 1;
        if (v71 == -1 || v72 > *(void *)(a1 + *v68)) {
          break;
        }
        char v73 = *(unsigned char *)(*(void *)(a1 + *v69) + v71);
        *(void *)(a1 + v70) = v72;
        v66 |= (unint64_t)(v73 & 0x7F) << v64;
        if ((v73 & 0x80) == 0) {
          goto LABEL_83;
        }
        v64 += 7;
        BOOL v20 = v65++ >= 9;
        if (v20)
        {
LABEL_67:
          LOBYTE(v23) = 0;
          goto LABEL_89;
        }
      }
      *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
LABEL_83:
      if (*(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8])) {
        BOOL v77 = 1;
      }
      else {
        BOOL v77 = v66 == 0;
      }
      LOBYTE(v23) = !v77;
    }
    else
    {
      if (v6 != 67) {
        goto LABEL_208;
      }
LABEL_19:
      char v21 = 0;
      unsigned int v22 = 0;
      uint64_t v23 = 0;
      __int16 v24 = (int *)MEMORY[0x1E4F940E8];
      uint64_t v25 = (int *)MEMORY[0x1E4F940E0];
      __int16 v26 = (int *)MEMORY[0x1E4F940B8];
      while (1)
      {
        uint64_t v27 = *v24;
        uint64_t v28 = *(void *)(a1 + v27);
        unint64_t v29 = v28 + 1;
        if (v28 == -1 || v29 > *(void *)(a1 + *v25)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a1 + *v26) + v28);
        *(void *)(a1 + v27) = v29;
        v23 |= (unint64_t)(v30 & 0x7F) << v21;
        if ((v30 & 0x80) == 0) {
          goto LABEL_69;
        }
        v21 += 7;
        BOOL v20 = v22++ >= 9;
        if (v20) {
          goto LABEL_67;
        }
      }
      *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
LABEL_69:
      if (*(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8])) {
        LOBYTE(v23) = 0;
      }
    }
LABEL_89:
    *(unsigned char *)a3 = v23;
    return 1;
  }
  switch(*v5)
  {
    case 'c':
      goto LABEL_19;
    case 'd':
      uint64_t v7 = (int)*MEMORY[0x1E4F940E8];
      unint64_t v8 = *(void *)(a1 + v7);
      if (v8 <= 0xFFFFFFFFFFFFFFF7 && v8 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v8);
        *(void *)(a1 + v7) = v8 + 8;
      }
      else
      {
        *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
        uint64_t v9 = 0;
      }
      *(void *)a3 = v9;
      return 1;
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      goto LABEL_208;
    case 'f':
      uint64_t v74 = (int)*MEMORY[0x1E4F940E8];
      unint64_t v75 = *(void *)(a1 + v74);
      if (v75 <= 0xFFFFFFFFFFFFFFFBLL && v75 + 4 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
      {
        int v76 = *(_DWORD *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v75);
        *(void *)(a1 + v74) = v75 + 4;
      }
      else
      {
        *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
        int v76 = 0;
      }
      *(_DWORD *)a3 = v76;
      return 1;
    case 'i':
      goto LABEL_26;
    case 'l':
      goto LABEL_33;
    case 'q':
      goto LABEL_10;
    case 's':
      goto LABEL_54;
    default:
      if (v6 == 83)
      {
LABEL_54:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v56 = 0;
        id v57 = (int *)MEMORY[0x1E4F940E8];
        uint64_t v58 = (int *)MEMORY[0x1E4F940E0];
        uint64_t v59 = (int *)MEMORY[0x1E4F940B8];
        while (1)
        {
          uint64_t v60 = *v57;
          uint64_t v61 = *(void *)(a1 + v60);
          unint64_t v62 = v61 + 1;
          if (v61 == -1 || v62 > *(void *)(a1 + *v58)) {
            break;
          }
          char v63 = *(unsigned char *)(*(void *)(a1 + *v59) + v61);
          *(void *)(a1 + v60) = v62;
          v56 |= (unint64_t)(v63 & 0x7F) << v54;
          if ((v63 & 0x80) == 0) {
            goto LABEL_76;
          }
          v54 += 7;
          BOOL v20 = v55++ >= 9;
          if (v20)
          {
            LOWORD(v56) = 0;
            goto LABEL_78;
          }
        }
        *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
LABEL_76:
        if (*(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8])) {
          LOWORD(v56) = 0;
        }
LABEL_78:
        *(_WORD *)a3 = v56;
        return 1;
      }
      if (v6 != 123) {
        goto LABEL_208;
      }
      if (!strncmp("{CGPoint=", *(const char **)(a2 + 8), 9uLL) || !strncmp("{CGSize=", v5, 8uLL))
      {
        __int16 v78 = (int *)MEMORY[0x1E4F940E8];
        uint64_t v79 = (int)*MEMORY[0x1E4F940E8];
        unint64_t v80 = *(void *)(a1 + v79);
        if (v80 <= 0xFFFFFFFFFFFFFFF7 && v80 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v81 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v80);
          *(void *)(a1 + v79) = v80 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v81 = 0;
        }
        *(void *)a3 = v81;
        uint64_t v82 = *v78;
        unint64_t v83 = *(void *)(a1 + v82);
        if (v83 <= 0xFFFFFFFFFFFFFFF7 && v83 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v84 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v83);
          *(void *)(a1 + v82) = v83 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v84 = 0;
        }
        *(void *)(a3 + 8) = v84;
      }
      else if (!strncmp("{CGRect=", v5, 8uLL))
      {
        uint64_t v85 = (int *)MEMORY[0x1E4F940E8];
        uint64_t v86 = (int)*MEMORY[0x1E4F940E8];
        unint64_t v87 = *(void *)(a1 + v86);
        if (v87 <= 0xFFFFFFFFFFFFFFF7 && v87 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v88 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v87);
          *(void *)(a1 + v86) = v87 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v88 = 0;
        }
        *(void *)a3 = v88;
        uint64_t v138 = *v85;
        unint64_t v139 = *(void *)(a1 + v138);
        if (v139 <= 0xFFFFFFFFFFFFFFF7 && v139 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v140 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v139);
          *(void *)(a1 + v138) = v139 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v140 = 0;
        }
        *(void *)(a3 + 8) = v140;
        uint64_t v141 = *v85;
        unint64_t v142 = *(void *)(a1 + v141);
        if (v142 <= 0xFFFFFFFFFFFFFFF7 && v142 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v143 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v142);
          *(void *)(a1 + v141) = v142 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v143 = 0;
        }
        *(void *)(a3 + 16) = v143;
        uint64_t v144 = *v85;
        unint64_t v145 = *(void *)(a1 + v144);
        if (v145 <= 0xFFFFFFFFFFFFFFF7 && v145 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v146 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v145);
          *(void *)(a1 + v144) = v145 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v146 = 0;
        }
        *(void *)(a3 + 24) = v146;
      }
      else
      {
        if (strncmp("{CGAffineTransform=", v5, 0x13uLL))
        {
          if (!strncmp("{CATransform3D=", v5, 0xFuLL))
          {
            BOOL v50 = (int *)MEMORY[0x1E4F940E8];
            uint64_t v51 = (int)*MEMORY[0x1E4F940E8];
            unint64_t v52 = *(void *)(a1 + v51);
            if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v53 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v52);
              *(void *)(a1 + v51) = v52 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v53 = 0;
            }
            *(void *)a3 = v53;
            uint64_t v93 = *v50;
            unint64_t v94 = *(void *)(a1 + v93);
            if (v94 <= 0xFFFFFFFFFFFFFFF7 && v94 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v95 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v94);
              *(void *)(a1 + v93) = v94 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v95 = 0;
            }
            *(void *)(a3 + 8) = v95;
            uint64_t v96 = *v50;
            unint64_t v97 = *(void *)(a1 + v96);
            if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v98 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v97);
              *(void *)(a1 + v96) = v97 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v98 = 0;
            }
            *(void *)(a3 + 16) = v98;
            uint64_t v99 = *v50;
            unint64_t v100 = *(void *)(a1 + v99);
            if (v100 <= 0xFFFFFFFFFFFFFFF7 && v100 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v101 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v100);
              *(void *)(a1 + v99) = v100 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v101 = 0;
            }
            *(void *)(a3 + 24) = v101;
            uint64_t v102 = *v50;
            unint64_t v103 = *(void *)(a1 + v102);
            if (v103 <= 0xFFFFFFFFFFFFFFF7 && v103 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v104 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v103);
              *(void *)(a1 + v102) = v103 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v104 = 0;
            }
            *(void *)(a3 + 32) = v104;
            uint64_t v105 = *v50;
            unint64_t v106 = *(void *)(a1 + v105);
            if (v106 <= 0xFFFFFFFFFFFFFFF7 && v106 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v107 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v106);
              *(void *)(a1 + v105) = v106 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v107 = 0;
            }
            *(void *)(a3 + 40) = v107;
            uint64_t v108 = *v50;
            unint64_t v109 = *(void *)(a1 + v108);
            if (v109 <= 0xFFFFFFFFFFFFFFF7 && v109 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v110 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v109);
              *(void *)(a1 + v108) = v109 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v110 = 0;
            }
            *(void *)(a3 + 48) = v110;
            uint64_t v111 = *v50;
            unint64_t v112 = *(void *)(a1 + v111);
            if (v112 <= 0xFFFFFFFFFFFFFFF7 && v112 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v113 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v112);
              *(void *)(a1 + v111) = v112 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v113 = 0;
            }
            *(void *)(a3 + 56) = v113;
            uint64_t v114 = *v50;
            unint64_t v115 = *(void *)(a1 + v114);
            if (v115 <= 0xFFFFFFFFFFFFFFF7 && v115 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v116 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v115);
              *(void *)(a1 + v114) = v115 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v116 = 0;
            }
            *(void *)(a3 + 64) = v116;
            uint64_t v117 = *v50;
            unint64_t v118 = *(void *)(a1 + v117);
            if (v118 <= 0xFFFFFFFFFFFFFFF7 && v118 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v119 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v118);
              *(void *)(a1 + v117) = v118 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v119 = 0;
            }
            *(void *)(a3 + 72) = v119;
            uint64_t v120 = *v50;
            unint64_t v121 = *(void *)(a1 + v120);
            if (v121 <= 0xFFFFFFFFFFFFFFF7 && v121 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v122 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v121);
              *(void *)(a1 + v120) = v121 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v122 = 0;
            }
            *(void *)(a3 + 80) = v122;
            uint64_t v123 = *v50;
            unint64_t v124 = *(void *)(a1 + v123);
            if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v125 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v124);
              *(void *)(a1 + v123) = v124 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v125 = 0;
            }
            *(void *)(a3 + 88) = v125;
            uint64_t v126 = *v50;
            unint64_t v127 = *(void *)(a1 + v126);
            if (v127 <= 0xFFFFFFFFFFFFFFF7 && v127 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v128 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v127);
              *(void *)(a1 + v126) = v127 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v128 = 0;
            }
            *(void *)(a3 + 96) = v128;
            uint64_t v129 = *v50;
            unint64_t v130 = *(void *)(a1 + v129);
            if (v130 <= 0xFFFFFFFFFFFFFFF7 && v130 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v131 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v130);
              *(void *)(a1 + v129) = v130 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v131 = 0;
            }
            *(void *)(a3 + 104) = v131;
            uint64_t v132 = *v50;
            unint64_t v133 = *(void *)(a1 + v132);
            if (v133 <= 0xFFFFFFFFFFFFFFF7 && v133 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v134 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v133);
              *(void *)(a1 + v132) = v133 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v134 = 0;
            }
            *(void *)(a3 + 112) = v134;
            uint64_t v135 = *v50;
            unint64_t v136 = *(void *)(a1 + v135);
            if (v136 <= 0xFFFFFFFFFFFFFFF7 && v136 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
            {
              uint64_t v137 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v136);
              *(void *)(a1 + v135) = v136 + 8;
            }
            else
            {
              *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
              uint64_t v137 = 0;
            }
            *(void *)(a3 + 120) = v137;
            return 1;
          }
          v163 = objc_msgSend(NSString, "stringWithFormat:", @"unsupported encoding:%s", v5);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            uint64_t v165 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _BSProtobufDecodePOD(PBDataReader *, _BSProtobufFieldEntry *, void *, NSError **)");
            __int16 v166 = 2114;
            v167 = @"BSProtobufSerialization.m";
            __int16 v168 = 1024;
            int v169 = 981;
            __int16 v170 = 2114;
            v171 = v163;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
LABEL_213:
          qword_1E911F420 = [v163 UTF8String];
          __break(0);
          JUMPOUT(0x18AADF484);
        }
        float v89 = (int *)MEMORY[0x1E4F940E8];
        uint64_t v90 = (int)*MEMORY[0x1E4F940E8];
        unint64_t v91 = *(void *)(a1 + v90);
        if (v91 <= 0xFFFFFFFFFFFFFFF7 && v91 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v92 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v91);
          *(void *)(a1 + v90) = v91 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v92 = 0;
        }
        *(void *)a3 = v92;
        uint64_t v147 = *v89;
        unint64_t v148 = *(void *)(a1 + v147);
        if (v148 <= 0xFFFFFFFFFFFFFFF7 && v148 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v149 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v148);
          *(void *)(a1 + v147) = v148 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v149 = 0;
        }
        *(void *)(a3 + 8) = v149;
        uint64_t v150 = *v89;
        unint64_t v151 = *(void *)(a1 + v150);
        if (v151 <= 0xFFFFFFFFFFFFFFF7 && v151 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v152 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v151);
          *(void *)(a1 + v150) = v151 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v152 = 0;
        }
        *(void *)(a3 + 16) = v152;
        uint64_t v153 = *v89;
        unint64_t v154 = *(void *)(a1 + v153);
        if (v154 <= 0xFFFFFFFFFFFFFFF7 && v154 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v155 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v154);
          *(void *)(a1 + v153) = v154 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v155 = 0;
        }
        *(void *)(a3 + 24) = v155;
        uint64_t v156 = *v89;
        unint64_t v157 = *(void *)(a1 + v156);
        if (v157 <= 0xFFFFFFFFFFFFFFF7 && v157 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v158 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v157);
          *(void *)(a1 + v156) = v157 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v158 = 0;
        }
        *(void *)(a3 + 32) = v158;
        uint64_t v159 = *v89;
        unint64_t v160 = *(void *)(a1 + v159);
        if (v160 <= 0xFFFFFFFFFFFFFFF7 && v160 + 8 <= *(void *)(a1 + (int)*MEMORY[0x1E4F940E0]))
        {
          uint64_t v161 = *(void *)(*(void *)(a1 + (int)*MEMORY[0x1E4F940B8]) + v160);
          *(void *)(a1 + v159) = v160 + 8;
        }
        else
        {
          *(unsigned char *)(a1 + (int)*MEMORY[0x1E4F940C8]) = 1;
          uint64_t v161 = 0;
        }
        *(void *)(a3 + 40) = v161;
      }
      break;
  }
  return 1;
}

uint64_t _BSProtobufDecodeObject(unsigned char *a1, uint64_t a2, void **a3, void *a4)
{
  return _BSProtobufDecodeObjectWithClassOverride(a1, *(void **)(a2 + 32), a3, a4);
}

uint64_t _BSProtobufEncodeRepeatFieldObject(uint64_t a1, uint64_t a2, void **a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    return 1;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v19;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v19 != v10) {
      objc_enumerationMutation(obj);
    }
    uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
    uint64_t v13 = [*(id *)(a2 + 32) protobufSchema];
    if (*(uint64_t *)(a2 + 64) >= 1)
    {
      uint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *(void *)(*(void *)(a2 + 72) + 8 * v14);
        if ([(id)objc_opt_class() isEqual:*(void *)(v15 + 32)]) {
          break;
        }
        if (++v14 >= *(void *)(a2 + 64)) {
          goto LABEL_12;
        }
      }
      uint64_t v13 = [*(id *)(v15 + 32) protobufSchema];
    }
LABEL_12:
    PBDataWriterPlaceMark();
    uint64_t result = _BSProtobufSchemaEncodeMessage(v13, v12, a1, a4);
    if (!result) {
      return result;
    }
    PBDataWriterRecallMark();
    if (++v11 == v9)
    {
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return 1;
    }
  }
}

uint64_t _BSProtobufEncodeString(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3) {
    PBDataWriterWriteStringField();
  }
  return 1;
}

uint64_t _BSProtobufDecodeString(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = (id)PBReaderReadString();
  return 1;
}

void sub_18AADFA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AADFB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADFC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AADFE00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSRadiansToDegrees(double a1)
{
  return a1 * 57.2957795;
}

void sub_18AADFE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE008C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void BSClearTokenVar(void **a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v2 = (void *)[NSString stringWithFormat:@"var must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v3 = 138544130;
      uint64_t v4 = [NSString stringWithUTF8String:"void BSClearTokenVar(BSAuditToken ** _Nonnull)"];
      __int16 v5 = 2114;
      int v6 = @"BSAuditTokenCaching.m";
      __int16 v7 = 1024;
      int v8 = 179;
      __int16 v9 = 2114;
      uint64_t v10 = v2;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
    }
    qword_1E911F420 = [v2 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE022CLL);
  }
  if (*a1)
  {
    if (qword_1EB21B1D8 != -1) {
      dispatch_once_f(&qword_1EB21B1D8, 0, (dispatch_function_t)_bsxpc_auditToken_init);
    }
    _BSStoreNewRetainedTokenToVar(0, a1);
  }
}

void sub_18AAE02F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(void *a1, void *a2, void *a3)
{
  int v3 = _BSLogAddStateCaptureBlockWithTitle(a1, a2, a3);
  return v3;
}

id BSLogAddStateCaptureBlockWithTitle(void *a1, void *a2, void *a3)
{
  int v3 = _BSLogAddStateCaptureBlockWithTitle(a1, a2, a3);
  return v3;
}

id _BSLogAddStateCaptureBlockWithTitle(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  int v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_21:
    char v30 = [MEMORY[0x1E4F28B00] currentHandler];
    char v31 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSInvalidatable> _BSLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong BSLogStateCaptureBlock, BOOL)");
    [v30 handleFailureInFunction:v31, @"BSSharedStateCapturing.m", 82, @"Invalid parameter not satisfying: %@", @"stateCaptureBlock" file lineNumber description];

    if (v5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
  unint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSInvalidatable> _BSLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong BSLogStateCaptureBlock, BOOL)");
  [v28 handleFailureInFunction:v29, @"BSSharedStateCapturing.m", 81, @"Invalid parameter not satisfying: %@", @"stateCaptureTitle" file lineNumber description];

  if (!v8) {
    goto LABEL_21;
  }
LABEL_3:
  if (v5) {
    goto LABEL_7;
  }
LABEL_4:
  if (qword_1EB21B358 != -1) {
    dispatch_once(&qword_1EB21B358, &__block_literal_global_28);
  }
  id v5 = (id)qword_1EB21B360;
LABEL_7:
  id v9 = v8;
  id v10 = v6;
  uint64_t v11 = os_state_add_handler();
  if (v11)
  {
    uint64_t v12 = v11;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_32);
    if (!qword_1EB21B350)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v14 = (void *)qword_1EB21B350;
      qword_1EB21B350 = (uint64_t)v13;
    }
    uint64_t v15 = objc_alloc_init(BSLogStateCaptureEntry);
    id v16 = v9;
    uint64_t v17 = v16;
    if (v15)
    {
      uint64_t v18 = [v16 copy];
      id captureBlock = v15->_captureBlock;
      v15->_id captureBlock = (id)v18;

      id v20 = v10;
      objc_storeStrong((id *)&v15->_title, a2);

      id v21 = v5;
      objc_storeStrong((id *)&v15->_queue, v5);
    }
    else
    {

      id v32 = v5;
    }

    unsigned int v22 = (void *)qword_1EB21B350;
    uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v12];
    [v22 setObject:v15 forKey:v23];

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_32);
    __int16 v24 = [BSStateCaptureInvalidator alloc];
    if (v24)
    {
      v33.receiver = v24;
      v33.super_class = (Class)BSStateCaptureInvalidator;
      id v25 = objc_msgSendSuper2(&v33, sel_init);
      __int16 v26 = v25;
      if (v25) {
        *((void *)v25 + 1) = v12;
      }
    }
    else
    {
      __int16 v26 = 0;
    }
  }
  else
  {
    __int16 v26 = 0;
  }

  return v26;
}

void sub_18AAE06B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSSerializeCGRectToXPCDictionaryWithKey(void *a1, const char *a2, double a3, double a4, double a5, double a6)
{
  xpc_object_t xdict = a1;
  if (xdict && a2)
  {
    xpc_object_t v11 = BSCreateSerializedXPCObjectFromCGRect(a3, a4, a5, a6);
    xpc_dictionary_set_value(xdict, a2, v11);
  }
}

void sub_18AAE0830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

xpc_object_t BSCreateSerializedXPCObjectFromCGRect(double a1, double a2, double a3, double a4)
{
  xpc_object_t objects[4] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  objects[0] = xpc_double_create(a1);
  objects[1] = xpc_double_create(a2);
  objects[2] = xpc_double_create(a3);
  xpc_object_t objects[3] = xpc_double_create(a4);
  xpc_object_t v7 = xpc_array_create(objects, 4uLL);
  for (uint64_t i = 3; i != -1; --i)

  return v7;
}

void sub_18AAE0934(_Unwind_Exception *a1)
{
  for (uint64_t i = 24; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_18AAE0A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE0AEC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void BSIntegerMapRemoveAllObjects(void *a1)
{
  id v1 = a1;
  id v5 = v1;
  if (!v1)
  {
    int v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void BSIntegerMapRemoveAllObjects(BSMutableIntegerMap *__strong _Nonnull)"];
    [v3 handleFailureInFunction:v4, @"BSIntegerMap.m", 254, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];

    id v1 = 0;
  }
  [*((id *)v1 + 1) removeAllObjects];
  uint64_t v2 = (void *)v5[2];
  v5[2] = 0;
}

void sub_18AAE0BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE0CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE0E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSActionResponse;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE1058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE1290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE12F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSAction;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE1478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE1580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE169C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE1860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSContinuousMachTimer;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE18AC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AAE1A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSAbsoluteMachTimer;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE1AAC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AAE1EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)_BSActionResponder;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE1F50(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AAE2674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE27F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSProcessHandle;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE2870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSMachPortRight;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE2F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE3188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE328C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSMachSendRightRelease(mach_port_name_t name)
{
  int v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    mach_error_t v2 = mach_port_deallocate(*MEMORY[0x1E4F14960], name);
    if (v2)
    {
      _BSMachError(v1, v2, @"Unable to deallocate send right");
      int v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

void sub_18AAE3510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE36AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSActionErrorCode(unint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown - %ld)", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_1E5446C00[a1];
  }
  return v1;
}

void sub_18AAE3798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE3860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE3AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE3BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE3E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAE4190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLogBSAction()
{
  if (BSLogBSAction_onceToken != -1) {
    dispatch_once(&BSLogBSAction_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)BSLogBSAction___logObj;
  return v0;
}

void sub_18AAE430C(_Unwind_Exception *exception_object)
{
  if (!v2) {

  }
  _Unwind_Resume(exception_object);
}

void sub_18AAE45F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE4720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE4BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE4FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_18AAE50D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5220(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAE52C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE5EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE6114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _BSCreateObjectOfClassesFromData(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length] && objc_msgSend(v3, "count"))
  {
    id v5 = (void *)MEMORY[0x18C125360]();
    id v22 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v3 fromData:v4 error:&v22];
    id v7 = v22;
    if (v7)
    {
      int v8 = BSLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v7;
        _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "Error during decoding of data: %{public}@", buf, 0xCu);
      }
    }
    if (v6)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v9);
            }
            if (objc_opt_isKindOfClass())
            {

              id v14 = v6;
              goto LABEL_25;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      if (!v7)
      {
        id v13 = BSLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v16);
          *(_DWORD *)buf = 138543618;
          id v24 = v9;
          __int16 v25 = 2114;
          __int16 v26 = v17;
          _os_log_error_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_ERROR, "Error during decoding of data to types=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", buf, 0x16u);
        }
      }
    }
    id v14 = 0;
LABEL_25:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void sub_18AAE6458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE653C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void BSDispatchQueueAssertNotMain()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    int v1 = [NSString stringWithFormat:@"Did not expect the main thread"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = [NSString stringWithUTF8String:"void BSDispatchQueueAssertNotMain(void)"];
      int v3 = 138544130;
      id v4 = v2;
      __int16 v5 = 2114;
      id v6 = @"BSDispatchUtilities.m";
      __int16 v7 = 1024;
      int v8 = 122;
      __int16 v9 = 2114;
      uint64_t v10 = v1;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
    }
    qword_1E911F420 = [v1 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE668CLL);
  }
  uint64_t v0 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_not_V2(v0);
}

void sub_18AAE6694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE6818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE68F4(_Unwind_Exception *exception_object)
{
}

void sub_18AAE6B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAE7120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE77A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE7E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAE7FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE805C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE8274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAE8474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  a13.super_class = (Class)_BSCompoundAssertionAcquisitionReference;
  [(_Unwind_Exception *)&a13 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAE84C4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AAE8590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE87B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AAE8CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AAE8E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  int v3 = (void *)BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(a1, a2, a3);
  return v3;
}

uint64_t BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v5 = a2;
  if (!a1)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject<NSSecureCoding> *BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    [v18 handleFailureInFunction:v19, @"BSXPCSerialization.m", 136, @"Invalid parameter not satisfying: %@", @"class != nil" file lineNumber description];
  }
  if (([a1 supportsSecureCoding] & 1) == 0)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v21 = objc_msgSend(NSString, "stringWithUTF8String:", "NSObject<NSSecureCoding> *BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey(__unsafe_unretained Class, __strong xpc_object_t, const char *)");
    [v20 handleFailureInFunction:v21, @"BSXPCSerialization.m", 137, @"Invalid parameter not satisfying: %@", @"[class supportsSecureCoding]" file lineNumber description];
  }
  uint64_t v6 = 0;
  if (v5 && a3)
  {
    __int16 v7 = (void *)MEMORY[0x18C125360]();
    id v8 = v5;
    Class Class = object_getClass(v8);
    uint64_t v10 = (objc_class *)MEMORY[0x1E4F14590];
    if (Class == (Class)MEMORY[0x1E4F14590])
    {
      xpc_dictionary_get_value(v8, a3);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v13;
      if (v13)
      {
        Class v14 = object_getClass(v13);

        if (v14 == v10) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
LABEL_14:
        id v15 = v12;

        if (v15)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F29270]);
          [v16 beginReadingFromXPCObject:v15];
          uint64_t v6 = [v16 decodeObjectOfClass:a1 forKey:&stru_1ED76E928];
        }
        else
        {
          uint64_t v6 = 0;
        }

        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = 0;
    goto LABEL_14;
  }
LABEL_18:

  return v6;
}

void sub_18AAE9054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSPathExistsOnSystemPartition(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (qword_1EB21B230 == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(&qword_1EB21B230, &__block_literal_global_15_0);
  if (!v2) {
    goto LABEL_8;
  }
LABEL_3:
  int v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v3 attributesOfFileSystemForPath:v2 error:0];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F283A8]];

  if (!v5)
  {
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  if ([(id)qword_1EB21B220 isEqualToNumber:v5]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [(id)qword_1EB21B228 isEqualToNumber:v5];
  }
LABEL_10:

  return v6;
}

void sub_18AAE91B4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AAE9244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE95D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAE981C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAE9F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSSetMainThreadPriorityFixedForUI(int a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!pthread_main_np())
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v6 = 136315138;
    __int16 v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    int v3 = MEMORY[0x1E4F14500];
    id v4 = "%s: BUG: Non-main thread asking to set priority";
    goto LABEL_15;
  }
  if (!a1)
  {
    if (!pthread_set_timeshare_self() || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v6 = 136315138;
    __int16 v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    int v3 = MEMORY[0x1E4F14500];
    id v4 = "%s: pthread_set_timeshare_self: failed to set thread scheduling to timeshare";
LABEL_15:
    uint32_t v5 = 12;
    goto LABEL_16;
  }
  if (pthread_set_fixedpriority_self() && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    __int16 v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: pthread_set_fixedpriority_self: failed to set thread priority to fixed", (uint8_t *)&v6, 0xCu);
  }
  if (proc_setthread_cpupercent() && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v2 = *__error();
    int v6 = 136315394;
    __int16 v7 = "void BSSetMainThreadPriorityFixedForUI(BOOL)";
    __int16 v8 = 1024;
    int v9 = v2;
    int v3 = MEMORY[0x1E4F14500];
    id v4 = "%s: proc_setthread_cpupercent: errno %{darwin.errno}d";
    uint32_t v5 = 18;
LABEL_16:
    _os_log_error_impl(&dword_18AAA8000, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v6, v5);
  }
}

void sub_18AAEA444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEA6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAEA8B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEA9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEAB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)BSActionResponder;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

double BSFloatFloorForScale(double a1, double a2)
{
  double v4 = fabs(a2);
  if (a2 <= 0.0 || v4 < 2.22044605e-16)
  {
    __int16 v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v4);
    __int16 v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat BSFloatFloorForScale(CGFloat, CGFloat)");
    [v7 handleFailureInFunction:v8 file:@"BSMath.m" lineNumber:60 description:@"Scale must be specified and cannot be less than or equal to 0."];
  }
  return floor(a1 * a2) / a2;
}

void sub_18AAEAC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEAF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __BSSandboxCanGetProcessInfo_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  byte_1EB21B151 = result == 0;
  return result;
}

uint64_t __BSSandboxCanGetMachTaskName_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  byte_1EB21B152 = result == 0;
  return result;
}

void __BSLogCommon_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "Common");
  id v1 = (void *)BSLogCommon___logObj;
  BSLogCommon___logObuint64_t j = (uint64_t)v0;
}

void sub_18AAEB2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEB384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSStoreTokenFromXPCConnectionToVar(uint64_t a1, void **a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    double v4 = (void *)[NSString stringWithFormat:@"connection must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v6 = 138544130;
      *(void *)&v6[4] = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreTokenFromXPCConnectionToVar(xpc_connection_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(void *)&v6[14] = @"BSAuditTokenCaching.m";
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 161;
      *(_WORD *)&v6[28] = 2114;
      *(void *)&v6[30] = v4;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1E911F420 = [v4 UTF8String];
    __break(0);
    JUMPOUT(0x18AAEB508);
  }
  if (!a2)
  {
    uint32_t v5 = (void *)[NSString stringWithFormat:@"var must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v6 = 138544130;
      *(void *)&v6[4] = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreTokenFromXPCConnectionToVar(xpc_connection_t _Nonnull, BSAuditToken * _Nullable * _Nonnull)");
      *(_WORD *)&v6[12] = 2114;
      *(void *)&v6[14] = @"BSAuditTokenCaching.m";
      *(_WORD *)&v6[22] = 1024;
      *(_DWORD *)&v6[24] = 162;
      *(_WORD *)&v6[28] = 2114;
      *(void *)&v6[30] = v5;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v6, 0x26u);
    }
    qword_1E911F420 = [v5 UTF8String];
    __break(0);
    JUMPOUT(0x18AAEB5C0);
  }
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)int v6 = v3;
  *(_OWORD *)&v6[16] = v3;
  xpc_connection_get_audit_token();
  BSStoreRealTokenToVar((uint64_t)v6, a2);
}

void sub_18AAEB7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _BSCreateDataFromObject(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    if (([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
    {
      uint64_t v10 = NSString;
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = [v10 stringWithFormat:@"Object of type %@ does not support secure coding", v12];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        Class v14 = [NSString stringWithUTF8String:"NSData *_BSCreateDataFromObject(__strong id)"];
        *(_DWORD *)buf = 138544130;
        uint64_t v23 = (uint64_t)v14;
        __int16 v24 = 2114;
        __int16 v25 = @"NSObject+BSCoding.m";
        __int16 v26 = 1024;
        int v27 = 21;
        __int16 v28 = 2114;
        unint64_t v29 = v13;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      qword_1E911F420 = [v13 UTF8String];
      __break(0);
      JUMPOUT(0x18AAEBA90);
    }
    int v2 = (void *)MEMORY[0x18C125360]();
    id v21 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v21];
    double v4 = (__CFString *)v21;
    if (v4)
    {
      uint32_t v5 = BSLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        __int16 v8 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = (uint64_t)v8;
        __int16 v24 = 2114;
        __int16 v25 = v4;
        id v9 = v8;
        _os_log_error_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_ERROR, "Error during encoding of %{public}@: %{public}@", buf, 0x16u);
      }
      int v6 = &unk_1ED7873C8;
      if (([v1 conformsToProtocol:v6] & 1) == 0)
      {
        id v15 = NSString;
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = NSStringFromProtocol((Protocol *)v6);
        long long v18 = [v15 stringWithFormat:@"%@ does not conform to %@", v16, v17];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [NSString stringWithUTF8String:"NSData *_BSCreateDataFromObject(__strong id)"];
          *(_DWORD *)buf = 138544130;
          uint64_t v23 = v19;
          __int16 v24 = 2114;
          __int16 v25 = @"NSObject+BSCoding.m";
          __int16 v26 = 1024;
          int v27 = 31;
          __int16 v28 = 2114;
          unint64_t v29 = v18;
          long long v20 = (void *)v19;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        qword_1E911F420 = [v18 UTF8String];
        __break(0);
        JUMPOUT(0x18AAEBB88);
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_18AAEBB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAEBC9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEBEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double BSContinuousMachTimeNow()
{
  uint64_t v0 = mach_continuous_time();
  if (_MergedGlobals_9 != -1) {
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  }
  return *(double *)&qword_1EB21B0C0 * (double)v0;
}

void sub_18AAEC024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEC398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _bsxpc_auditToken_init()
{
  uint64_t v0 = [BSAuditToken alloc];
  *(void *)&long long v1 = -1;
  *((void *)&v1 + 1) = -1;
  v3[0] = v1;
  v3[1] = v1;
  qword_1EB21B1C8 = [(BSAuditToken *)v0 initWithAuditToken:v3];
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:16];
  qword_1EB21B1D0 = result;
  return result;
}

dispatch_block_t BSDispatchBlockCreateWithCurrentQualityOfService(int a1, void *a2)
{
  id v3 = a2;
  dispatch_qos_class_t v4 = BSPthreadCurrentEffectiveQualityOfService();
  if (a1 <= -15) {
    int v5 = -15;
  }
  else {
    int v5 = a1;
  }
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v4, v5 & (v5 >> 31), v3);

  return v6;
}

void sub_18AAEC4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSPthreadCurrentEffectiveQualityOfService()
{
  uint64_t v0 = pthread_self();
  sched_param v7 = 0;
  int v6 = 0;
  pthread_getschedparam(v0, &v6, &v7);
  if (v7.sched_priority <= 4) {
    int v1 = 9;
  }
  else {
    int v1 = 17;
  }
  if (v7.sched_priority <= 20) {
    int v2 = v1;
  }
  else {
    int v2 = 21;
  }
  if (v7.sched_priority <= 31) {
    int v3 = v2;
  }
  else {
    int v3 = 25;
  }
  if (v7.sched_priority <= 37) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 33;
  }
  LODWORD(result) = qos_class_self();
  if (v4 <= result) {
    return result;
  }
  else {
    return v4;
  }
}

void sub_18AAEC654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAECD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAECDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAECFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAED0F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAED274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BSCollectionReduce(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  sched_param v7 = a3;
  id v8 = v6;
  id v9 = v8;
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    id v9 = v8;
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      id v9 = v8;
      do
      {
        uint64_t v13 = 0;
        Class v14 = v9;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          id v9 = v7[2](v7, v14, *(void *)(*((void *)&v16 + 1) + 8 * v13));

          ++v13;
          Class v14 = v9;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v9;
}

void sub_18AAED440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAED514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAED5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSXPCObjectBaseClass_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  _MergedGlobals_25 = (uint64_t)NSClassFromString(&cfstr_OsXpcObject.isa);
  if (!_MergedGlobals_25)
  {
    uint64_t v0 = BSLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      int v1 = 138543362;
      int v2 = @"OS_xpc_object";
      _os_log_error_impl(&dword_18AAA8000, v0, OS_LOG_TYPE_ERROR, "Unable to determine xpc_object_t base class; expected '%{public}@' but didn't find it.",
        (uint8_t *)&v1,
        0xCu);
    }
  }
}

double BSTimeDifferenceFromMachTimeToMachTime(unint64_t a1, unint64_t a2)
{
  if (_MergedGlobals_9 != -1) {
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  }
  unint64_t v4 = a2 - a1;
  if (a1 > a2) {
    unint64_t v4 = a1 - a2;
  }
  double result = -(*(double *)&qword_1EB21B0C0 * (double)v4);
  if (a1 <= a2) {
    return *(double *)&qword_1EB21B0C0 * (double)v4;
  }
  return result;
}

void __BSLogStateCaptureEncodePlist_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F98] dataWithPropertyList:&stru_1ED76E928 format:200 options:0 error:0];
  uint64_t v1 = [v0 length];

  qword_1EB21B368 = 32552 - v1;
}

void sub_18AAED820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAED9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLogStateCaptureEncodePlist(void *a1, int a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = v5;
  if (qword_1EB21B370 == -1)
  {
    if (!v5) {
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&qword_1EB21B370, &__block_literal_global_97);
    if (!v6) {
      goto LABEL_13;
    }
  }
  if (a2 && [v6 isNSString])
  {
    id v7 = v6;
    unint64_t v8 = [v7 lengthOfBytesUsingEncoding:1];
    if (v8)
    {
      id v9 = v7;
      if (v8 > qword_1EB21B368)
      {
        id v9 = objc_msgSend(v7, "substringToIndex:");
      }
    }
    else
    {
      unint64_t v10 = [v7 maximumLengthOfBytesUsingEncoding:10];
      id v9 = v7;
      if (v10 > qword_1EB21B368)
      {
        unint64_t v11 = [v7 lengthOfBytesUsingEncoding:10];
        id v9 = v7;
        while (v11 > qword_1EB21B368)
        {
          uint64_t v12 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v7, "length") - ((v11 - qword_1EB21B368 + 1) >> 1));

          id v9 = v12;
          unint64_t v11 = [v12 lengthOfBytesUsingEncoding:10];
        }
      }
    }

    id v6 = v9;
  }
LABEL_13:
  id v21 = 0;
  uint64_t v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v21];
  id v14 = v21;
  if (v13)
  {
    if ((unint64_t)[v13 length] < 0x7F39)
    {
      long long v17 = v14;
      if (!a3) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"Encoded state data is larger than 32KB";
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    long long v17 = [v15 errorWithDomain:@"BSSharedStateCapturing" code:2 userInfo:v16];

    id v14 = (id)v16;
    long long v18 = v13;
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:@"Input generated no data" forKey:*MEMORY[0x1E4F28588]];
    long long v18 = v19;
    if (v14) {
      [v19 setObject:v14 forKey:*MEMORY[0x1E4F28A50]];
    }
    long long v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BSSharedStateCapturing" code:1 userInfo:v18];
  }

  uint64_t v13 = 0;
  if (a3) {
LABEL_22:
  }
    *a3 = v17;
LABEL_23:

  return v13;
}

void sub_18AAEDCF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSSettingsDecodeClasses_block_invoke()
{
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v16, "initWithObjects:", v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  unint64_t v11 = (void *)_MergedGlobals_37;
  _MergedGlobals_37 = v10;
}

void __BSLogMachPort_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "MachPort");
  uint64_t v1 = (void *)BSLogMachPort___logObj;
  BSLogMachPort___logObuint64_t j = (uint64_t)v0;
}

id BSBundleIDForPID(uint64_t a1)
{
  if (getpid() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
    [v2 bundleIdentifier];
  }
  else
  {
    uint64_t v2 = BSExecutablePathForPID(a1);
    BSBundleIDForExecutablePath(v2);
  uint64_t v3 = };

  return v3;
}

void sub_18AAEDFB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEE1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAEE2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)BSWatchdog;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSDiagnosticReportType(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E5446880[a1];
  }
}

id BSBundlePathForExecutablePath(void *a1)
{
  id v4 = 0;
  id v1 = _BSBundleInfoForExecutablePath(a1, &v4);
  id v2 = v4;
  return v2;
}

void sub_18AAEE67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAEE850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSCompoundAssertion;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAEE898(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AAEEA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEEB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSIsBeingDebugged()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  pid_t v0 = getpid();
  if (v0 < 1) {
    return 0;
  }
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  BOOL v1 = _BSShortBSDProcessInfoForPID(v0, v3);
  return *(_DWORD *)&v1 & ((v4 & 2) >> 1);
}

void sub_18AAEEED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEF2E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSDescriptionKeyValuePairSorting(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    BOOL v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v1 = off_1E5446AB0[a1];
  }
  return v1;
}

__CFString *NSStringFromBSDescriptionCollectionTruncationStyle(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    BOOL v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v1 = off_1E5446AC8[a1];
  }
  return v1;
}

void sub_18AAEF45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEF550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSSecTask;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

long double BSTimeUntilNextClockMinute()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B78]);
  uint64_t v1 = [v0 secondOfMinute];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  long double v3 = 60.0 - (double)v1 - fmod(v2, 1.0);

  return v3;
}

void sub_18AAEF630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEF744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEF894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AAEFA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAEFC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAEFE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAF0224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  long long v20 = v19;

  _Unwind_Resume(a1);
}

void sub_18AAF0334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF05B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSShmDelete(char *__s, char a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!__s)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSShmDelete(const char *const _Nonnull, BOOL)");
    [v7 handleFailureInFunction:v8, @"BSSharedMemoryStore.m", 404, @"Invalid parameter not satisfying: %@", @"path" file lineNumber description];
  }
  if (strlen(__s) <= 2)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSShmDelete(const char *const _Nonnull, BOOL)");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"BSSharedMemoryStore.m", 405, @"path '%s' is too short", __s);
  }
  if (strlen(__s) >= 0x20)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSShmDelete(const char *const _Nonnull, BOOL)");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"BSSharedMemoryStore.m", 406, @"path '%s' is too long", __s);
  }
  *__error() = 0;
  if (shm_unlink(__s) && (a2 & 1) == 0)
  {
    long long v4 = __error();
    strerror_r(*v4, __strerrbuf, 0x100uLL);
    long long v5 = BSLogSharedMemory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = *__error();
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = __s;
      __int16 v15 = 1024;
      int v16 = v6;
      __int16 v17 = 2080;
      long long v18 = __strerrbuf;
      _os_log_error_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_ERROR, "%s: failed to unlink : errno=%i (%s)", buf, 0x1Cu);
    }
  }
}

void sub_18AAF084C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSShmStore(char *a1, void *a2, int a3, unsigned char *a4)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!a1)
  {
    char v40 = [MEMORY[0x1E4F28B00] currentHandler];
    char v41 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
    [v40 handleFailureInFunction:v41, @"BSSharedMemoryStore.m", 529, @"Invalid parameter not satisfying: %@", @"path" file lineNumber description];
  }
  if (strlen(a1) <= 2)
  {
    unsigned int v42 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v43 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"BSSharedMemoryStore.m", 530, @"path '%s' is too short", a1);
  }
  if (strlen(a1) < 0x20)
  {
    if (v7) {
      goto LABEL_7;
    }
LABEL_73:
    uint64_t v46 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v47 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
    [v46 handleFailureInFunction:v47, @"BSSharedMemoryStore.m", 532, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];

    if (a4) {
      goto LABEL_8;
    }
    goto LABEL_74;
  }
  uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v45 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
  objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"BSSharedMemoryStore.m", 531, @"path '%s' is too long", a1);

  if (!v7) {
    goto LABEL_73;
  }
LABEL_7:
  if (a4) {
    goto LABEL_8;
  }
LABEL_74:
  unint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
  char v49 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
  [v48 handleFailureInFunction:v49, @"BSSharedMemoryStore.m", 533, @"Invalid parameter not satisfying: %@", @"failure" file lineNumber description];

LABEL_8:
  *__error() = 0;
  int v8 = shm_open(a1, 2562, 384);
  if ((v8 & 0x80000000) == 0)
  {
    unint64_t v9 = [v7 serializedDataLength];
    if (v9 >= 0x7FFFFFFFFFFFFFF0)
    {
      BOOL v50 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v51 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)");
      [v50 handleFailureInFunction:v51 file:@"BSSharedMemoryStore.m" lineNumber:545 description:@"shmLength out of range"];
    }
    if (*a4 == 2)
    {
      *a4 = 0;
      uint64_t v10 = BSLogSharedMemory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        __int16 v78 = a1;
        _os_log_error_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_ERROR, "%s: simulating crash after opening new buffer", (uint8_t *)__strerrbuf, 0xCu);
      }
LABEL_14:

LABEL_34:
      uint64_t v13 = 0;
LABEL_35:
      *__error() = 0;
      if (close(v8))
      {
        uint64_t v23 = __error();
        strerror_r(*v23, __strerrbuf, 0x100uLL);
        __int16 v24 = BSLogSharedMemory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v26 = *__error();
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v26;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = __strerrbuf;
          _os_log_error_impl(&dword_18AAA8000, v24, OS_LOG_TYPE_ERROR, "%s: failed to close write : errno=%i (%s)", buf, 0x1Cu);
        }
      }
      goto LABEL_39;
    }
    *__error() = 0;
    if (ftruncate(v8, v9 + 16))
    {
      uint64_t v14 = __error();
      strerror_r(*v14, __strerrbuf, 0x100uLL);
      __int16 v15 = BSLogSharedMemory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v29 = *__error();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v29;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = __strerrbuf;
        _os_log_error_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_ERROR, "%s: failed to set the size - unlinking : errno=%i (%s)", buf, 0x1Cu);
      }
LABEL_33:

      BSShmDelete(a1, 0);
      goto LABEL_34;
    }
    if (*a4 == 3)
    {
      *a4 = 0;
      uint64_t v10 = BSLogSharedMemory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        __int16 v78 = a1;
        _os_log_error_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_ERROR, "%s: simulating crash after resizing new buffer", (uint8_t *)__strerrbuf, 0xCu);
      }
      goto LABEL_14;
    }
    *__error() = 0;
    int v16 = mmap(0, v9 + 16, 2, 1, v8, 0);
    if (v16 == (unsigned char *)-1)
    {
      uint64_t v22 = __error();
      strerror_r(*v22, __strerrbuf, 0x100uLL);
      __int16 v15 = BSLogSharedMemory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v38 = *__error();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v38;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = __strerrbuf;
        _os_log_error_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_ERROR, "%s: failed to mmap - unlinking : errno=%i (%s)", buf, 0x1Cu);
      }
      goto LABEL_33;
    }
    char v54 = v16;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 1;
    uint64_t v67 = 0;
    uint64_t v68 = &v67;
    uint64_t v69 = 0x2020000000;
    uint64_t v70 = 0;
    uint64_t v63 = 0;
    char v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 0;
    __int16 v17 = [MEMORY[0x1E4F29060] currentThread];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __BSShmStore_block_invoke;
    v55[3] = &unk_1E54459D0;
    id v53 = v17;
    id v56 = v53;
    id v57 = buf;
    unint64_t v60 = v9;
    uint64_t v61 = v54;
    uint64_t v62 = 16;
    uint64_t v58 = &v67;
    uint64_t v59 = &v63;
    int v18 = [v7 serializeToWriter:v55];
    *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
    if (v18)
    {
      if (*((unsigned char *)v64 + 24))
      {
        long long v19 = BSLogSharedMemory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__strerrbuf = 136315138;
          __int16 v78 = a1;
          uint64_t v20 = "%s: data serialized but it tried to serialize more than it declared necessary";
LABEL_46:
          _os_log_error_impl(&dword_18AAA8000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)__strerrbuf, 0xCu);
        }
      }
      else
      {
        if (v68[3] == v9) {
          goto LABEL_48;
        }
        long long v19 = BSLogSharedMemory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__strerrbuf = 136315138;
          __int16 v78 = a1;
          uint64_t v20 = "%s: data serialized but it serialized less than it declared necessary";
          goto LABEL_46;
        }
      }

LABEL_48:
      if (*a4 == 4)
      {
        *a4 = 0;
        uint64_t v30 = BSLogSharedMemory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__strerrbuf = 136315138;
          __int16 v78 = a1;
          _os_log_error_impl(&dword_18AAA8000, v30, OS_LOG_TYPE_ERROR, "%s: simulating crash after writing data to new buffer", (uint8_t *)__strerrbuf, 0xCu);
        }

        uint64_t v13 = 0;
      }
      else
      {
        *(void *)char v54 = v9;
        if (a3) {
          char v31 = 3;
        }
        else {
          char v31 = 1;
        }
        v54[8] = v31;
        *__error() = 0;
        if (msync(v54, v9 + 16, 16) == -1)
        {
          id v32 = __error();
          strerror_r(*v32, __strerrbuf, 0x100uLL);
          objc_super v33 = BSLogSharedMemory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            int v52 = *__error();
            *(_DWORD *)uint64_t v71 = 136315650;
            unint64_t v72 = a1;
            __int16 v73 = 1024;
            int v74 = v52;
            __int16 v75 = 2080;
            int v76 = __strerrbuf;
            _os_log_error_impl(&dword_18AAA8000, v33, OS_LOG_TYPE_ERROR, "%s: failed to msync : errno=%i (%s)", v71, 0x1Cu);
          }
        }
        uint64_t v13 = 1;
      }
      goto LABEL_67;
    }
    if (*((unsigned char *)v64 + 24))
    {
      int v27 = BSLogSharedMemory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        __int16 v78 = a1;
        __int16 v28 = "%s: data failed to serialize (maybe because it tried to write more than it declared up front) - unlinking";
LABEL_65:
        _os_log_error_impl(&dword_18AAA8000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)__strerrbuf, 0xCu);
      }
    }
    else
    {
      uint64_t v34 = v68[3];
      int v27 = BSLogSharedMemory();
      BOOL v35 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v34 == v9)
      {
        if (v35)
        {
          *(_DWORD *)__strerrbuf = 136315138;
          __int16 v78 = a1;
          __int16 v28 = "%s: data failed to serialize (external reason) - unlinking";
          goto LABEL_65;
        }
      }
      else if (v35)
      {
        *(_DWORD *)__strerrbuf = 136315138;
        __int16 v78 = a1;
        __int16 v28 = "%s: data failed to serialize (maybe because it tried to write less than it declared up front) - unlinking";
        goto LABEL_65;
      }
    }

    BSShmDelete(a1, 0);
    uint64_t v13 = 0;
LABEL_67:
    *__error() = 0;
    if (munmap(v54, v9 + 16) == -1)
    {
      unint64_t v36 = __error();
      strerror_r(*v36, __strerrbuf, 0x100uLL);
      uint64_t v37 = BSLogSharedMemory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        int v39 = *__error();
        *(_DWORD *)uint64_t v71 = 136315650;
        unint64_t v72 = a1;
        __int16 v73 = 1024;
        int v74 = v39;
        __int16 v75 = 2080;
        int v76 = __strerrbuf;
        _os_log_error_impl(&dword_18AAA8000, v37, OS_LOG_TYPE_ERROR, "%s: failed to munmap - unlinking : errno=%i (%s)", v71, 0x1Cu);
      }

      BSShmDelete(a1, 0);
    }

    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  unint64_t v11 = __error();
  strerror_r(*v11, __strerrbuf, 0x100uLL);
  uint64_t v12 = BSLogSharedMemory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v21 = *__error();
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v21;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = __strerrbuf;
    _os_log_error_impl(&dword_18AAA8000, v12, OS_LOG_TYPE_ERROR, "%s: failed to create : errno=%i (%s)", buf, 0x1Cu);
  }

  uint64_t v13 = 0;
LABEL_39:

  return v13;
}

void sub_18AAF13D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF162C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSMachCreateReceiveRight(mach_port_name_t *a1)
{
  mach_port_name_t name = 0;
  mach_error_t v2 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name);
  mach_port_name_t v3 = name;
  if (v2)
  {
    _BSMachError(name, v2, @"Unable to allocate receive right");
    mach_port_name_t v3 = 0;
  }
  if (a1) {
    *a1 = v3;
  }
  return v3 - 1 < 0xFFFFFFFE;
}

void sub_18AAF29A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF3004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF3464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF3834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF39E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF3AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF4098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSProcessGenerateDiagnosticReport(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  LODWORD(v5) = a2;
  id v7 = a4;
  int v8 = v7;
  if (v5) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  if (a1 == 2)
  {
    id v12 = v7;
    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v13 = (void (*)(id, uint64_t, uint64_t))off_1EB21B2A0;
    uint64_t v20 = off_1EB21B2A0;
    if (!off_1EB21B2A0)
    {
      uint64_t v14 = OSAnalyticsLibrary();
      v18[3] = (uint64_t)dlsym(v14, "WriteStackshotReportWithPID");
      off_1EB21B2A0 = (_UNKNOWN *)v18[3];
      uint64_t v13 = (void (*)(id, uint64_t, uint64_t))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (v13)
    {
      v13(v12, a3, v5);
      goto LABEL_14;
    }
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    int v16 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL softlinkWriteStackshotReportWithPID(NSString *__strong, mach_exception_data_type_t, pid_t)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"BSProcessDiagnosticReporting.m", 16, @"%s", dlerror());
  }
  else
  {
    if (a1 != 1)
    {
LABEL_15:

      return;
    }
    id v9 = v7;
    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v10 = (void (*)(uint64_t, uint64_t, id))_MergedGlobals_28;
    uint64_t v20 = _MergedGlobals_28;
    if (!_MergedGlobals_28)
    {
      unint64_t v11 = OSAnalyticsLibrary();
      v18[3] = (uint64_t)dlsym(v11, "SimulateCrash");
      _MergedGlobals_28 = (_UNKNOWN *)v18[3];
      uint64_t v10 = (void (*)(uint64_t, uint64_t, id))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (v10)
    {
      v10(v5, a3, v9);
LABEL_14:

      goto LABEL_15;
    }
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    int v16 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL softlinkSimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"BSProcessDiagnosticReporting.m", 15, @"%s", dlerror());
  }

  __break(1u);
}

void sub_18AAF437C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void *OSAnalyticsLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!OSAnalyticsLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __OSAnalyticsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5446868;
    uint64_t v6 = 0;
    OSAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)OSAnalyticsLibraryCore_frameworkLibrary;
  if (!OSAnalyticsLibraryCore_frameworkLibrary)
  {
    id v0 = [MEMORY[0x1E4F28B00] currentHandler];
    mach_port_name_t v3 = [NSString stringWithUTF8String:"void *OSAnalyticsLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSProcessDiagnosticReporting.m", 14, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_18AAF4528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAF4C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF4D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_18AAF4F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF50B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF5260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF530C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAF5BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSMachCreateSendOnceRight(uint64_t a1)
{
  uint64_t result = 0;
  unsigned int v5 = 0;
  if ((a1 - 1) <= 0xFFFFFFFD)
  {
    int v4 = 0;
    mach_error_t v3 = MEMORY[0x18C125160](*MEMORY[0x1E4F14960], a1, 21, &v5, &v4);
    if (v3)
    {
      _BSMachError(a1, v3, @"Unable to create send-once right");
      if (v5) {
        _os_assumes_log();
      }
    }
    return v5;
  }
  return result;
}

void sub_18AAF5E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF6010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF6478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAF6C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSShmLoad(char *__s, void *a2, BOOL *a3, unsigned char *a4)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!__s)
  {
    uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
    int v38 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
    [v37 handleFailureInFunction:v38, @"BSSharedMemoryStore.m", 419, @"Invalid parameter not satisfying: %@", @"path" file lineNumber description];
  }
  if (strlen(__s) <= 2)
  {
    int v39 = [MEMORY[0x1E4F28B00] currentHandler];
    char v40 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"BSSharedMemoryStore.m", 420, @"path '%s' is too short", __s);
  }
  if (strlen(__s) < 0x20)
  {
    if (a3) {
      goto LABEL_7;
    }
LABEL_63:
    uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v44 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
    [v43 handleFailureInFunction:v44, @"BSSharedMemoryStore.m", 422, @"Invalid parameter not satisfying: %@", @"outGenerationTwiddle" file lineNumber description];

    if (a4) {
      goto LABEL_8;
    }
    goto LABEL_64;
  }
  char v41 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v42 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
  objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"BSSharedMemoryStore.m", 421, @"path '%s' is too long", __s);

  if (!a3) {
    goto LABEL_63;
  }
LABEL_7:
  if (a4) {
    goto LABEL_8;
  }
LABEL_64:
  uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v46 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)");
  [v45 handleFailureInFunction:v46, @"BSSharedMemoryStore.m", 423, @"Invalid parameter not satisfying: %@", @"outExisted" file lineNumber description];

LABEL_8:
  *__error() = 0;
  int v8 = shm_open(__s, 0);
  if ((v8 & 0x80000000) == 0)
  {
    int v9 = v8;
    *a4 = 1;
    memset(&v65, 0, sizeof(v65));
    if (fstat(v8, &v65) || v65.st_size < 0x10uLL)
    {
      __int16 v15 = BSLogSharedMemory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315394;
        *(void *)&__strerruint8_t buf[4] = __s;
        *(_WORD *)&__strerrbuf[12] = 2048;
        *(void *)&__strerrbuf[14] = v65.st_size;
        _os_log_error_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_ERROR, "%s: invalid size - unlinking : size=%lli", __strerrbuf, 0x16u);
      }

      uint64_t v14 = 0;
      BSShmDelete(__s, 0);
      goto LABEL_19;
    }
    *__error() = 0;
    uint64_t v10 = (uint64_t *)mmap(0, v65.st_size, 1, 1, v9, 0);
    unint64_t v11 = v10;
    if (v10 == (uint64_t *)-1)
    {
      int v21 = __error();
      strerror_r(*v21, __strerrbuf, 0x100uLL);
      uint64_t v22 = BSLogSharedMemory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v31 = *__error();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = __s;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v31;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = __strerrbuf;
        _os_log_error_impl(&dword_18AAA8000, v22, OS_LOG_TYPE_ERROR, "%s: failed to mmap - unlinking : errno=%i (%s)", buf, 0x1Cu);
      }

      BSShmDelete(__s, 0);
      uint64_t v14 = 0;
      goto LABEL_19;
    }
    char v12 = *((unsigned char *)v10 + 8);
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = BSLogSharedMemory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        *(void *)&__strerruint8_t buf[4] = __s;
        _os_log_error_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_ERROR, "%s: validity check failed - unlinking", __strerrbuf, 0xCu);
      }

      uint64_t v14 = 0;
      BSShmDelete(__s, 0);
      goto LABEL_58;
    }
    uint64_t v23 = *v10;
    if (*v10 > (unint64_t)(v65.st_size - 16))
    {
      __int16 v24 = BSLogSharedMemory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 136315138;
        *(void *)&__strerruint8_t buf[4] = __s;
        _os_log_error_impl(&dword_18AAA8000, v24, OS_LOG_TYPE_ERROR, "%s: size check failed - unlinking", __strerrbuf, 0xCu);
      }

      BSShmDelete(__s, 0);
      uint64_t v14 = 0;
      goto LABEL_58;
    }
    *(void *)__strerrbuf = 0;
    *(void *)&__strerrbuf[8] = __strerrbuf;
    *(void *)&__strerrbuf[16] = 0x2020000000;
    char v61 = 1;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    *(void *)&unsigned char buf[24] = 0;
    uint64_t v56 = 0;
    id v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    int v26 = [MEMORY[0x1E4F29060] currentThread];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __BSShmLoad_block_invoke;
    v48[3] = &unk_1E54459A8;
    id v47 = v26;
    id v49 = v47;
    BOOL v50 = __strerrbuf;
    uint64_t v53 = v23;
    char v54 = v11;
    uint64_t v55 = 16;
    uint64_t v51 = buf;
    int v52 = &v56;
    uint64_t v14 = [a2 deserializeFromReader:v48];
    *(unsigned char *)(*(void *)&__strerrbuf[8] + 24) = 0;
    if (v14)
    {
      if (*((unsigned char *)v57 + 24))
      {
        int v27 = BSLogSharedMemory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v62 = 136315138;
          uint64_t v63 = __s;
          _os_log_debug_impl(&dword_18AAA8000, v27, OS_LOG_TYPE_DEBUG, "%s: data deserialized but it tried to over read the shm", v62, 0xCu);
        }
      }
      else
      {
        if (*(void *)(*(void *)&buf[8] + 24) == v23) {
          goto LABEL_43;
        }
        int v27 = BSLogSharedMemory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v62 = 136315138;
          uint64_t v63 = __s;
          _os_log_impl(&dword_18AAA8000, v27, OS_LOG_TYPE_INFO, "%s: data deserialized but it didn't read all of the shm", v62, 0xCu);
        }
      }

LABEL_43:
      *a3 = (v12 & 2) != 0;
LABEL_57:

      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(buf, 8);
      _Block_object_dispose(__strerrbuf, 8);
LABEL_58:
      *__error() = 0;
      if (munmap(v11, v65.st_size) == -1)
      {
        uint64_t v34 = __error();
        strerror_r(*v34, __strerrbuf, 0x100uLL);
        BOOL v35 = BSLogSharedMemory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          int v36 = *__error();
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = __s;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v36;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = __strerrbuf;
          _os_log_error_impl(&dword_18AAA8000, v35, OS_LOG_TYPE_ERROR, "%s: failed to munmap - unlinking : errno=%i (%s)", buf, 0x1Cu);
        }

        BSShmDelete(__s, 0);
      }
LABEL_19:
      *__error() = 0;
      if (close(v9))
      {
        int v16 = __error();
        strerror_r(*v16, __strerrbuf, 0x100uLL);
        uint64_t v17 = BSLogSharedMemory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v25 = *__error();
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = __s;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v25;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = __strerrbuf;
          _os_log_error_impl(&dword_18AAA8000, v17, OS_LOG_TYPE_ERROR, "%s: failed to close read : errno=%i (%s)", buf, 0x1Cu);
        }
      }
      goto LABEL_28;
    }
    if (*((unsigned char *)v57 + 24))
    {
      int v29 = BSLogSharedMemory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v62 = 136315138;
        uint64_t v63 = __s;
        uint64_t v30 = "%s: data failed to deserialize (maybe because it tried to over read the shm) - unlinking";
LABEL_55:
        _os_log_error_impl(&dword_18AAA8000, v29, OS_LOG_TYPE_ERROR, v30, v62, 0xCu);
      }
    }
    else
    {
      uint64_t v32 = *(void *)(*(void *)&buf[8] + 24);
      int v29 = BSLogSharedMemory();
      BOOL v33 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      if (v32 == v23)
      {
        if (v33)
        {
          *(_DWORD *)uint64_t v62 = 136315138;
          uint64_t v63 = __s;
          uint64_t v30 = "%s: data failed to deserialize (external reason) - unlinking";
          goto LABEL_55;
        }
      }
      else if (v33)
      {
        *(_DWORD *)uint64_t v62 = 136315138;
        uint64_t v63 = __s;
        uint64_t v30 = "%s: data failed to deserialize (maybe because it didn't read all of the shm) - unlinking";
        goto LABEL_55;
      }
    }

    BSShmDelete(__s, 0);
    goto LABEL_57;
  }
  if (*__error() == 2)
  {
    uint64_t v14 = 0;
  }
  else
  {
    int v18 = __error();
    strerror_r(*v18, __strerrbuf, 0x100uLL);
    uint64_t v19 = BSLogSharedMemory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v28 = *__error();
      v65.st_dev = 136315650;
      *(void *)&v65.st_mode = __s;
      WORD2(v65.st_ino) = 1024;
      *(_DWORD *)((char *)&v65.st_ino + 6) = v28;
      HIWORD(v65.st_uvoid (*v10)(uint64_t, uint64_t, id) = 2080;
      *(void *)&v65.st_gid = __strerrbuf;
      _os_log_error_impl(&dword_18AAA8000, v19, OS_LOG_TYPE_ERROR, "%s: failed to read : errno=%i (%s)", (uint8_t *)&v65, 0x1Cu);
    }

    uint64_t v14 = 0;
    *a4 = 0;
  }
LABEL_28:
  return v14;
}

void sub_18AAF772C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLogSharedMemory()
{
  if (BSLogSharedMemory_onceToken != -1) {
    dispatch_once(&BSLogSharedMemory_onceToken, &__block_literal_global_9);
  }
  id v0 = (void *)BSLogSharedMemory___logObj;
  return v0;
}

void sub_18AAF7B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF7C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAF8194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__getCVCreateColorSpaceFromIOSurfaceBulkAttachmentsSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!qword_1EB21AF90)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __CoreVideoLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E54455C0;
    uint64_t v7 = 0;
    qword_1EB21AF90 = _sl_dlopen();
  }
  mach_error_t v2 = (void *)qword_1EB21AF90;
  if (!qword_1EB21AF90)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    mach_error_t v2 = [NSString stringWithUTF8String:"void *CoreVideoLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"IOSurface+BaseBoard.m", 25, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  mach_error_t v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "CVCreateColorSpaceFromIOSurfaceBulkAttachments");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  _MergedGlobals_4 = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_18AAF83DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __BSDescribeAppendObjectDescription_block_invoke_2(uint64_t a1, __CFString *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(id *)(v4 + 8);
  switch(*(void *)(v4 + 1104))
  {
    case 1:
      long long v6 = (void *)(v4 + 1040);
      uint64_t v7 = *(void *)(v4 + 1040);
      uint64_t v8 = (const char *)(v4 + 16);
      if (*(void *)(*(void *)(v4 + 8) + 24) == 3)
      {
        if (v7 > 1022)
        {
          v8[v7] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
          *(void *)(v4 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), ";", 0x8000100u);
        }
        else
        {
          v8[v7] = 59;
          ++*v6;
        }
        goto LABEL_11;
      }
      if (v7 <= 1021)
      {
        *(_WORD *)&v8[v7] = 8251;
        uint64_t v11 = 2;
        goto LABEL_19;
      }
      v8[v7] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v8, 0x8000100u);
      char v12 = (CFMutableStringRef *)(v4 + 1064);
      uint64_t v13 = "; ";
      goto LABEL_24;
    case 2:
      long long v6 = (void *)(v4 + 1040);
      uint64_t v9 = *(void *)(v4 + 1040);
      uint64_t v10 = (const char *)(v4 + 16);
      if (v9 <= 1022)
      {
        v10[v9] = 32;
        uint64_t v11 = 1;
        goto LABEL_19;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v10, 0x8000100u);
      char v12 = (CFMutableStringRef *)(v4 + 1064);
      uint64_t v13 = " ";
LABEL_24:
      *long long v6 = 0;
      CFStringAppendCString(*v12, v13, 0x8000100u);
      break;
    case 3:
LABEL_11:
      uint64_t v14 = *(void *)(v4 + 1040);
      __int16 v15 = (const char *)(v4 + 16);
      if (v14 > 1022)
      {
        v15[v14] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v15, 0x8000100u);
        *(void *)(v4 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v15[v14] = 10;
        ++*(void *)(v4 + 1040);
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      uint64_t v16 = *(void *)(v4 + 1072);
      if (v16 < 1) {
        break;
      }
      if (v16 >= 8) {
        uint64_t v16 = 8;
      }
      uint64_t v17 = (const char *)*((void *)&sIndentSpaceStrings + v16);
      size_t v18 = strlen(v17);
      long long v6 = (void *)(v4 + 1040);
      uint64_t v19 = *(void *)(v4 + 1040);
      if ((uint64_t)(v19 + v18) > 1023)
      {
        if (v19 >= 1)
        {
          *(unsigned char *)(v4 + 16 + v19) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), (const char *)(v4 + 16), 0x8000100u);
          *long long v6 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v4 + 1064), v17, 0x8000100u);
      }
      else
      {
        uint64_t v11 = v18;
        memcpy((void *)(v4 + v19 + 16), v17, v18);
LABEL_19:
        *v6 += v11;
      }
      break;
    default:
      goto LABEL_26;
  }
  *(void *)(v4 + 1104) = 0;
LABEL_26:
  uint64_t v20 = v5[8];
  uint64_t v21 = v5[9];
  if (v20 < 2 || v21 < 1)
  {
    uint64_t v21 = 0;
    uint64_t v23 = 1096;
  }
  else
  {
    *(void *)(v4 + 1096) = v20;
    *(void *)(v4 + 1080) = *(void *)(v4 + 1040) + [*(id *)(v4 + 1064) length];
    uint64_t v23 = 1088;
  }
  *(void *)(v4 + v23) = v21;

  uint64_t v24 = *(void *)(a1 + 32);
  if (a2)
  {
    if (_NSIsNSString())
    {
      CFIndex v25 = [(__CFString *)a2 length];
      uint64_t v26 = *(void *)(v24 + 1040);
      if (3 * v25 + v26 > 1023)
      {
        if (v26 >= 1)
        {
          *(unsigned char *)(v24 + 16 + v26) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
          *(void *)(v24 + 1040) = 0;
        }
        if (v25 > 341)
        {
          [*(id *)(v24 + 1064) appendString:a2];
          goto LABEL_109;
        }
        CFIndex usedBufLen = 0;
        v66.location = 0;
        v66.length = v25;
        CFStringGetBytes(a2, v66, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
        CFIndex v27 = usedBufLen;
      }
      else
      {
        CFIndex usedBufLen = 0;
        v65.location = 0;
        v65.length = v25;
        CFStringGetBytes(a2, v65, 0x8000100u, 0, 0, (UInt8 *)(v24 + v26 + 16), 1024 - v26, &usedBufLen);
        CFIndex v27 = *(void *)(v24 + 1040) + usedBufLen;
      }
      goto LABEL_49;
    }
    if (_NSIsNSNumber())
    {
      uint64_t v30 = a2;
      int v31 = *(char *)[(__CFString *)v30 objCType];
      if (v31 > 80)
      {
        switch(v31)
        {
          case 'c':
            goto LABEL_68;
          case 'd':
            uint64_t v32 = *(void *)(v24 + 1040);
            if (v32 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v32) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            BOOL v33 = *(void **)(v24 + 1064);
            [(__CFString *)v30 doubleValue];
            BOOL v35 = @"%0.16g";
            goto LABEL_90;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_82;
          case 'f':
            uint64_t v45 = *(void *)(v24 + 1040);
            if (v45 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v45) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            BOOL v33 = *(void **)(v24 + 1064);
            [(__CFString *)v30 floatValue];
            double v34 = v46;
            BOOL v35 = @"%0.7g";
LABEL_90:
            objc_msgSend(v33, "appendFormat:", v35, *(void *)&v34);
            goto LABEL_108;
          case 'i':
            uint64_t v47 = *(void *)(v24 + 1040);
            if (v47 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v47) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 intValue];
            goto LABEL_94;
          case 'l':
            uint64_t v48 = *(void *)(v24 + 1040);
            if (v48 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v48) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 longValue];
            char v40 = @"%ld";
            goto LABEL_107;
          case 'q':
            uint64_t v49 = *(void *)(v24 + 1040);
            if (v49 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v49) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 longLongValue];
            char v40 = @"%lld";
            goto LABEL_107;
          case 's':
            uint64_t v50 = *(void *)(v24 + 1040);
            if (v50 >= 1)
            {
              *(unsigned char *)(v24 + 16 + v50) = 0;
              CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
              *(void *)(v24 + 1040) = 0;
            }
            uint64_t v37 = *(void **)(v24 + 1064);
            uint64_t v38 = [(__CFString *)v30 shortValue];
            char v40 = @"%hi";
            goto LABEL_107;
          default:
            if (v31 == 81)
            {
              uint64_t v51 = *(void *)(v24 + 1040);
              if (v51 >= 1)
              {
                *(unsigned char *)(v24 + 16 + v51) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(void *)(v24 + 1040) = 0;
              }
              uint64_t v37 = *(void **)(v24 + 1064);
              uint64_t v38 = [(__CFString *)v30 unsignedLongLongValue];
              char v40 = @"%llu";
            }
            else
            {
              if (v31 != 83) {
                goto LABEL_82;
              }
              uint64_t v42 = *(void *)(v24 + 1040);
              if (v42 >= 1)
              {
                *(unsigned char *)(v24 + 16 + v42) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
                *(void *)(v24 + 1040) = 0;
              }
              uint64_t v37 = *(void **)(v24 + 1064);
              uint64_t v38 = [(__CFString *)v30 unsignedShortValue];
              char v40 = @"%hu";
            }
            break;
        }
        goto LABEL_107;
      }
      if (v31 > 72)
      {
        if (v31 == 73)
        {
          uint64_t v43 = *(void *)(v24 + 1040);
          if (v43 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v43) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 unsignedIntValue];
          goto LABEL_81;
        }
        if (v31 == 76)
        {
          uint64_t v39 = *(void *)(v24 + 1040);
          if (v39 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v39) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 unsignedLongValue];
          char v40 = @"%lu";
          goto LABEL_107;
        }
      }
      else
      {
        if (v31 == 66)
        {
LABEL_68:
          uint64_t v41 = *(void *)(v24 + 1040);
          if (v41 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v41) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 charValue];
LABEL_94:
          char v40 = @"%d";
          goto LABEL_107;
        }
        if (v31 == 67)
        {
          uint64_t v36 = *(void *)(v24 + 1040);
          if (v36 >= 1)
          {
            *(unsigned char *)(v24 + 16 + v36) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
            *(void *)(v24 + 1040) = 0;
          }
          uint64_t v37 = *(void **)(v24 + 1064);
          uint64_t v38 = [(__CFString *)v30 unsignedCharValue];
LABEL_81:
          char v40 = @"%u";
LABEL_107:
          objc_msgSend(v37, "appendFormat:", v40, v38);
LABEL_108:

          goto LABEL_109;
        }
      }
LABEL_82:
      uint64_t v44 = *(void *)(v24 + 1040);
      if (v44 >= 1)
      {
        *(unsigned char *)(v24 + 16 + v44) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(void *)(v24 + 1040) = 0;
      }
      objc_msgSend(*(id *)(v24 + 1064), "appendFormat:", @"<***unknown type:%s>", -[__CFString objCType](v30, "objCType"));
      goto LABEL_108;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a2 appendDescriptionToStream:v24];
      goto LABEL_109;
    }
    if (objc_opt_respondsToSelector())
    {
      [(__CFString *)a2 appendDescriptionToFormatter:v24];
      goto LABEL_109;
    }
    if (_NSIsNSDictionary())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      uint64_t v62 = __BSDescribeAppendObjectDescription_block_invoke;
      uint64_t v63 = &unk_1E5446820;
      uint64_t v64 = v24;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:](v24, a2, 0, (uint64_t)&usedBufLen);
      goto LABEL_109;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(id)v24 appendIntegerSet:a2 withName:0 format:0];
      goto LABEL_109;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      uint64_t v62 = __BSDescribeAppendObjectDescription_block_invoke_2;
      uint64_t v63 = &unk_1E5446848;
      uint64_t v64 = v24;
      [(id)v24 appendIntegerMap:a2 withName:0 keyFormat:0 valueBlock:&usedBufLen];
      goto LABEL_109;
    }
    if (objc_opt_respondsToSelector())
    {
      CFIndex usedBufLen = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      uint64_t v62 = __BSDescribeAppendObjectDescription_block_invoke_3;
      uint64_t v63 = &unk_1E5446848;
      uint64_t v64 = v24;
      [(id)v24 appendCollection:a2 withName:0 itemBlock:&usedBufLen];
      goto LABEL_109;
    }
    if (*(unsigned char *)(v24 + 1056) || (uint64_t v54 = *(void *)(v24 + 8), *(void *)(v54 + 8) == 2))
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v55 = [(__CFString *)a2 succinctDescription];
        goto LABEL_121;
      }
      uint64_t v54 = *(void *)(v24 + 8);
    }
    if (*(void *)(v54 + 16) == 2) {
      [(__CFString *)a2 debugDescription];
    }
    else {
    uint64_t v55 = [(__CFString *)a2 description];
    }
LABEL_121:
    uint64_t v56 = v55;
    CFIndex v57 = [(__CFString *)v55 length];
    uint64_t v58 = *(void *)(v24 + 1040);
    if (v58 + 3 * v57 > 1023)
    {
      if (v58 >= 1)
      {
        *(unsigned char *)(v24 + 16 + v58) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
        *(void *)(v24 + 1040) = 0;
      }
      if (v57 > 341)
      {
        [*(id *)(v24 + 1064) appendString:v56];
        goto LABEL_129;
      }
      CFIndex usedBufLen = 0;
      v68.location = 0;
      v68.length = v57;
      CFStringGetBytes(v56, v68, 0x8000100u, 0, 0, (UInt8 *)(v24 + 16), 1024, &usedBufLen);
      CFIndex v59 = usedBufLen;
    }
    else
    {
      CFIndex usedBufLen = 0;
      v67.location = 0;
      v67.length = v57;
      CFStringGetBytes(v56, v67, 0x8000100u, 0, 0, (UInt8 *)(v24 + v58 + 16), 1024 - v58, &usedBufLen);
      CFIndex v59 = *(void *)(v24 + 1040) + usedBufLen;
    }
    *(void *)(v24 + 1040) = v59;
LABEL_129:

    goto LABEL_109;
  }
  uint64_t v28 = *(void *)(v24 + 1040);
  uint64_t v29 = v24 + 16 + v28;
  if (v28 <= 1018)
  {
    *(unsigned char *)(v29 + 4) = 62;
    *(_DWORD *)uint64_t v29 = 1818848828;
    CFIndex v27 = *(void *)(v24 + 1040) + 5;
LABEL_49:
    *(void *)(v24 + 1040) = v27;
    goto LABEL_109;
  }
  *(unsigned char *)uint64_t v29 = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), (const char *)(v24 + 16), 0x8000100u);
  *(void *)(v24 + 1040) = 0;
  CFStringAppendCString(*(CFMutableStringRef *)(v24 + 1064), "<nil>", 0x8000100u);
LABEL_109:
  uint64_t v52 = *(void *)(a1 + 32);
  *(void *)(v52 + 1104) = 1;
  return BSDescribeTruncationCommit(v52);
}

void sub_18AAF8F58(_Unwind_Exception *exception_object)
{
}

void sub_18AAF9004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF90C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSGetDeviceType()
{
  if (BSGetDeviceType_onceToken != -1) {
    dispatch_once(&BSGetDeviceType_onceToken, &__block_literal_global_27);
  }
  return BSGetDeviceType___DeviceType;
}

void sub_18AAF9340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAF956C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAF979C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAF9B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAF9C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAFA770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AAFA830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAFA980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFAD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFAF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFB010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFB148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFB284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFB350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_18AAFB438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFB4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFB5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSXPCBundleForPID(uint64_t a1)
{
  uint64_t v1 = BSExecutablePathForPID(a1);
  mach_error_t v2 = BSXPCBundleForExecutablePath(v1);

  return v2;
}

void sub_18AAFB618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSXPCBundleForExecutablePath(void *a1)
{
  id v1 = a1;
  mach_error_t v2 = v1;
  if (v1)
  {
    [v1 UTF8String];
    mach_error_t v3 = (void *)xpc_bundle_create();
  }
  else
  {
    mach_error_t v3 = 0;
  }

  return v3;
}

void sub_18AAFB694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSXPCBundleForBundlePath(void *a1)
{
  id v1 = a1;
  mach_error_t v2 = v1;
  if (v1)
  {
    [v1 UTF8String];
    mach_error_t v3 = (void *)xpc_bundle_create();
  }
  else
  {
    mach_error_t v3 = 0;
  }

  return v3;
}

void sub_18AAFB710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *BSXPCBundleGetIdentifier(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    mach_error_t v2 = xpc_bundle_get_info_dictionary();
    if (v2)
    {
      string = (char *)xpc_dictionary_get_string(v2, (const char *)[ (id) *MEMORY[0x1E4F1CFF8] UTF8String]);
      if (string) {
        string = (char *)[[NSString alloc] initWithUTF8String:string];
      }
    }
    else
    {
      string = 0;
    }
  }
  else
  {
    string = 0;
  }

  return string;
}

void sub_18AAFB7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSXPCBundleGetBundlePath(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    property = (void *)xpc_bundle_get_property();
    if (property) {
      property = (void *)[[NSString alloc] initWithUTF8String:property];
    }
  }
  else
  {
    property = 0;
  }

  return property;
}

void sub_18AAFB860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSXPCBundleGetExecutablePath(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    executable_path = (void *)xpc_bundle_get_executable_path();
    if (executable_path) {
      executable_path = (void *)[[NSString alloc] initWithUTF8String:executable_path];
    }
  }
  else
  {
    executable_path = 0;
  }

  return executable_path;
}

void sub_18AAFB8E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSXPCBundleGetInfoDictionary(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    mach_error_t v2 = xpc_bundle_get_info_dictionary();
    if (v2) {
      mach_error_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    }
    else {
      mach_error_t v3 = 0;
    }
  }
  else
  {
    mach_error_t v3 = 0;
  }

  return v3;
}

void sub_18AAFB96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBBB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBCF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBF70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFBFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFC9F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFCBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFCC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BSCGImageFromIOSurfaceBuilder;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAFD088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void unlockIOSurface(void *a1)
{
  id cf = a1;
  if (cf)
  {
    [cf unlockWithOptions:1 seed:0];
    [cf decrementUseCount];
    CFRelease(cf);
  }
}

void sub_18AAFD170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __CoreVideoLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB21AF90 = result;
  return result;
}

void __BSLogBSAction_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "BSAction");
  id v1 = (void *)BSLogBSAction___logObj;
  BSLogBSAction___logObuint64_t j = (uint64_t)v0;
}

void sub_18AAFD2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD4E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD65C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFD9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFDA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFDDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFDEF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFDF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSStringFromCGPoint(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
}

uint64_t BSStringFromCGSize(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
}

void sub_18AAFE154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFE270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFE328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFE564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFE6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFE91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAFEA24(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(a1);
    uint64_t v21 = BSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_error_impl(&dword_18AAA8000, v21, OS_LOG_TYPE_ERROR, "Exception: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18AAFE9ECLL);
  }
  _Unwind_Resume(a1);
}

void sub_18AAFEB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AAFED20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFEDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFEE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFEF44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFEFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFF21C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_18AAFF50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFF5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFF670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFF750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)_BSSqlitePreparedSimpleStatement;
  [(_Unwind_Exception *)&a10 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AAFF888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFFA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFFBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFFD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AAFFDF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

objc_class *BSDeserializeBSXPCEncodableObjectFromXPCDictionary(void *a1)
{
  id v1 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary(a1);
  return v1;
}

void BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v17 = a1;
  id v5 = a2;
  if (v17 && ([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(NSObject<NSSecureCoding> *__strong, __strong xpc_object_t, const char *)");
    [v15 handleFailureInFunction:v16, @"BSXPCSerialization.m", 124, @"Invalid parameter not satisfying: %@", @"!object || [[object class] supportsSecureCoding]" file lineNumber description];
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (!v6
    || (Class Class = object_getClass(v6),
        uint64_t v9 = (objc_class *)MEMORY[0x1E4F14590],
        v7,
        v7,
        Class != v9))
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey(NSObject<NSSecureCoding> *__strong, __strong xpc_object_t, const char *)");
    [v13 handleFailureInFunction:v14, @"BSXPCSerialization.m", 125, @"Invalid parameter not satisfying: %@", @"BSXPCObjectIsDictionary(dictionary)" file lineNumber description];
  }
  if (v17 && a3)
  {
    uint64_t v10 = (void *)MEMORY[0x18C125360]();
    id v11 = objc_alloc_init(MEMORY[0x1E4F29278]);
    [v11 beginEncoding];
    [v11 encodeObject:v17 forKey:&stru_1ED76E928];
    char v12 = [v11 finishEncoding];
    xpc_dictionary_set_value(v7, a3, v12);
  }
}

void sub_18AB00020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *BSCreateDeserializedArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return BSCreateDeserializedArrayFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_27);
}

void BSSerializeSetOfBSXPCEncodableObjectsToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
}

id __BSSerializeSetOfBSXPCEncodableObjectsToXPCDictionaryWithKey_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v2 = BSCreateSerializedBSXPCEncodableObject(a2);
  return v2;
}

uint64_t BSCreateDeserializedSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  return BSCreateDeserializedSetFromXPCDictionaryWithKey(a1, a2, &__block_literal_global_32);
}

void BSSerializeDataToXPCDictionaryWithKey(void *a1, void *a2, const char *a3)
{
  id v7 = a1;
  id v5 = a2;
  if (v7 && v5 && a3)
  {
    id v6 = v7;
    xpc_dictionary_set_data(v5, a3, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

void sub_18AB00174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const void *BSCreateDeserializedDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  size_t length = 0;
  if (v3)
  {
    data = xpc_dictionary_get_data(v3, a2, &length);
    if (data)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      data = (const void *)[v6 initWithBytes:data length:length];
    }
  }
  else
  {
    data = 0;
  }

  return data;
}

void sub_18AB00204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSDeserializeDataFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  xpc_object_t v2 = (void *)BSCreateDeserializedDataFromXPCDictionaryWithKey(a1, a2);
  return v2;
}

xpc_object_t BSCreateSerializedXPCObjectFromCGPoint(double a1, double a2)
{
  objects[2] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  objects[0] = xpc_double_create(a1);
  objects[1] = xpc_double_create(a2);
  xpc_object_t v3 = xpc_array_create(objects, 2uLL);
  for (uint64_t i = 1; i != -1; --i)

  return v3;
}

void sub_18AB002E8(_Unwind_Exception *a1)
{
  for (uint64_t i = 8; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void BSSerializeCGPointToXPCDictionaryWithKey(void *a1, const char *a2, double a3, double a4)
{
  xpc_object_t xdict = a1;
  if (xdict && a2)
  {
    xpc_object_t v7 = BSCreateSerializedXPCObjectFromCGPoint(a3, a4);
    xpc_dictionary_set_value(xdict, a2, v7);
  }
}

void sub_18AB003A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double BSDeserializeCGPointFromXPCObject(void *a1)
{
  id v1 = a1;
  xpc_object_t v2 = v1;
  double v3 = *MEMORY[0x1E4F1DAD8];
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E4F14568] && xpc_array_get_count(v2) == 2)
  {
    double v3 = xpc_array_get_double(v2, 0);
    xpc_array_get_double(v2, 1uLL);
  }

  return v3;
}

void sub_18AB00454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSDeserializeCGPointFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    id v6 = xpc_dictionary_get_value(v4, a2);
    double v5 = BSDeserializeCGPointFromXPCObject(v6);
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
  }

  return v5;
}

void sub_18AB004F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSSerializeIOSurfaceToXPCDictionaryWithKey(__IOSurface *a1, void *a2, const char *a3)
{
  xpc_object_t xdict = a2;
  if (a1 && xdict && a3)
  {
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject(a1);
    if (XPCObject) {
      xpc_dictionary_set_value(xdict, a3, XPCObject);
    }
  }
}

void sub_18AB00590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

IOSurfaceRef BSCreateDeserializedIOSurfaceFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    double v5 = xpc_dictionary_get_value(v3, a2);
    id v6 = v5;
    if (v5) {
      IOSurfaceRef v7 = IOSurfaceLookupFromXPCObject(v5);
    }
    else {
      IOSurfaceRef v7 = 0;
    }
  }
  else
  {
    IOSurfaceRef v7 = 0;
  }

  return v7;
}

void sub_18AB00624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _BSHasInternalSettings()
{
  return MEMORY[0x1F40CD658]();
}

BOOL BSSystemHasCapability()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  BOOL v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

void sub_18AB00E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB01088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB01138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB011E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB01288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB01330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB01458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB01588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB016B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB017E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB018F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB019D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB01B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB01B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB01C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB01D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB01E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB02580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_18AB02EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _initializePath(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)a1 = 47;
  uint64_t v5 = 0;
  if (objc_msgSend(v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a1 + 1, 29, &v5, 4, 1, 0, objc_msgSend(v3, "length"), 0))char v4 = v5 + 1; {
  else
  }
    char v4 = 1;
  *(unsigned char *)(a1 + 32) = v4;
}

void sub_18AB03030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB03424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB034DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)BSSharedMemoryStore;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB0362C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB03734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_18AB03830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB03CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB03EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB04358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __BSShmLoad_block_invoke(void *a1, void *a2, size_t a3)
{
  if (!a2)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)_block_invoke");
    [v13 handleFailureInFunction:v14 file:@"BSSharedMemoryStore.m" lineNumber:452 description:@"buf cannot be nil"];
  }
  id v6 = (void *)a1[4];
  IOSurfaceRef v7 = [MEMORY[0x1E4F29060] currentThread];

  if (v6 != v7)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)_block_invoke");
    [v15 handleFailureInFunction:v16 file:@"BSSharedMemoryStore.m" lineNumber:453 description:@"readBlock cannot be called on a different thread"];
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    size_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSSharedMemoryStoreData>  _Nullable BSShmLoad(const char *const _Nonnull, __unsafe_unretained Class, BOOL * _Nonnull, BOOL * _Nonnull)_block_invoke");
    [v17 handleFailureInFunction:v18 file:@"BSSharedMemoryStore.m" lineNumber:454 description:@"readBlock must be called in scope"];
  }
  unint64_t v8 = a1[8];
  size_t v9 = v8 - a3;
  if (v8 >= a3 && (size_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24), v10 <= v9))
  {
    if (a3)
    {
      memcpy(a2, (const void *)(a1[9] + a1[10] + v10), a3);
      *(void *)(*(void *)(a1[6] + 8) + 24) += a3;
    }
    return 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    id v11 = __error();
    uint64_t result = 0;
    int *v11 = 14;
  }
  return result;
}

void sub_18AB045C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __BSShmStore_block_invoke(void *a1, const void *a2, size_t a3)
{
  if (!a2)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)_block_invoke");
    [v13 handleFailureInFunction:v14 file:@"BSSharedMemoryStore.m" lineNumber:566 description:@"buf cannot be nil"];
  }
  id v6 = (void *)a1[4];
  IOSurfaceRef v7 = [MEMORY[0x1E4F29060] currentThread];

  if (v6 != v7)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)_block_invoke");
    [v15 handleFailureInFunction:v16 file:@"BSSharedMemoryStore.m" lineNumber:567 description:@"writeBlock cannot be called on a different thread"];
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    size_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSShmStore(const char *const _Nonnull, __strong id<BSSharedMemoryStoreData>, BOOL, BSSharedMemoryStoreWriteFailure *)_block_invoke");
    [v17 handleFailureInFunction:v18 file:@"BSSharedMemoryStore.m" lineNumber:568 description:@"writeBlock must be called in scope"];
  }
  unint64_t v8 = a1[8];
  size_t v9 = v8 - a3;
  if (v8 >= a3 && (size_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24), v10 <= v9))
  {
    if (a3)
    {
      memcpy((void *)(a1[9] + a1[10] + v10), a2, a3);
      *(void *)(*(void *)(a1[6] + 8) + 24) += a3;
    }
    return 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    id v11 = __error();
    uint64_t result = 0;
    int *v11 = 28;
  }
  return result;
}

void sub_18AB047F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0492C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB04988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB04AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB04C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB04DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB04F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB050B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB051D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB052C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB05660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB05718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB058F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB05B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB05BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB05C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB05D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB05DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB05E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB05EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB05F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB06350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB064F4(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18AB06D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  _Unwind_Resume(a1);
}

void sub_18AB0720C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB07350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB073D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB076AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB07F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)BSSqliteDatabaseConnection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_18AB081CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB085A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0877C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSFormattedTimeFromSeconds(double a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%02d:%02d:%02d", ((int)(a1 / 60.0) / 60), ((int)(a1 / 60.0) % 60), ((int)llround(a1) % 60));
}

double BSAbsoluteTimeFromMachTime(unint64_t a1)
{
  if (_MergedGlobals_9 != -1) {
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  }
  return *(double *)&qword_1EB21B0C0 * (double)a1;
}

double __machTimeScaleInit()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  mach_timebase_info info = 0;
  uint64_t v0 = mach_timebase_info(&info);
  if (v0)
  {
    int v1 = 2;
    do
    {
      if (!v1)
      {
        IOSurfaceRef v7 = objc_msgSend(NSString, "stringWithFormat:", @"failed to fetch mach_timebase_info after multiple attempts : latest r=%i", v0);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          unint64_t v8 = [NSString stringWithUTF8String:"void __machTimeScaleInit(void *)"];
          *(_DWORD *)buf = 138544130;
          uint64_t v13 = v8;
          __int16 v14 = 2114;
          __int16 v15 = @"BSTimeUtilities.m";
          __int16 v16 = 1024;
          int v17 = 55;
          __int16 v18 = 2114;
          uint64_t v19 = v7;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        qword_1E911F420 = [v7 UTF8String];
        __break(0);
        JUMPOUT(0x18AB08A98);
      }
      CFTypeID v2 = BSLogCommon();
      id v3 = v2;
      if (--v1) {
        os_log_type_t v4 = OS_LOG_TYPE_ERROR;
      }
      else {
        os_log_type_t v4 = OS_LOG_TYPE_FAULT;
      }
      if (os_log_type_enabled(v2, v4))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v0;
        _os_log_impl(&dword_18AAA8000, v3, v4, "failed to fetch mach_timebase_info with r=%i", buf, 8u);
      }

      uint64_t v0 = mach_timebase_info(&info);
    }
    while (v0);
  }
  if (info.numer) {
    BOOL v5 = info.denom == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    size_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"mach_timebase_info returned a numer or denom of zero : numer=%i denom=%i", info.numer, info.denom);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      size_t v10 = [NSString stringWithUTF8String:"void __machTimeScaleInit(void *)"];
      *(_DWORD *)buf = 138544130;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      __int16 v15 = @"BSTimeUtilities.m";
      __int16 v16 = 1024;
      int v17 = 56;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v9 UTF8String];
    __break(0);
    JUMPOUT(0x18AB08B6CLL);
  }
  double result = (double)info.numer / (double)info.denom / 1000000000.0 * 1.84467441e19;
  *(double *)&qword_1EB21B0C0 = (double)info.numer / (double)info.denom / 1000000000.0;
  *(double *)&qword_1EB21B0C8 = result;
  *(double *)&qword_1EB21B0D0 = (double)info.denom / (double)info.numer * 1000000000.0;
  return result;
}

void sub_18AB08B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSMachTimeForTimeDifferenceFromMachTime(unint64_t a1, double a2)
{
  double v3 = fabs(a2);
  if (v3 == INFINITY) {
    return (uint64_t)~*(void *)&a2 >> 63;
  }
  if (_MergedGlobals_9 != -1) {
    dispatch_once_f(&_MergedGlobals_9, 0, (dispatch_function_t)__machTimeScaleInit);
  }
  double v5 = vabdd_f64(v3, *(double *)&qword_1EB21B0C8);
  if (v3 > *(double *)&qword_1EB21B0C8 || v5 < 2.22044605e-16) {
    return (uint64_t)~*(void *)&a2 >> 63;
  }
  unint64_t v8 = (unint64_t)(v3 * *(double *)&qword_1EB21B0D0 + 0.5);
  if ((*(void *)&a2 & 0x8000000000000000) != 0)
  {
    BOOL v9 = a1 >= v8;
    unint64_t v11 = a1 - v8;
    if (v9) {
      return v11;
    }
    else {
      return 0;
    }
  }
  else
  {
    BOOL v9 = __CFADD__(a1, v8);
    unint64_t v10 = a1 + v8;
    if (v9) {
      return -1;
    }
    else {
      return v10;
    }
  }
}

void sub_18AB08D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSTimeIntervalFromMachTimeValue(uint64_t a1)
{
  return (double)SHIDWORD(a1) / 1000000.0 + (double)(int)a1;
}

double BSTimeIntervalForCPUTicks(unsigned int a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = BSTimeIntervalForCPUTicks___MicrosecondsPerTick;
  if (BSTimeIntervalForCPUTicks___MicrosecondsPerTick <= 0)
  {
    v5[0] = 0;
    v5[1] = 0;
    int v6 = 0;
    size_t v4 = 20;
    *(void *)IOSurfaceRef v7 = 0xC00000001;
    if (sysctl(v7, 2u, v5, &v4, 0, 0))
    {
      int v2 = BSTimeIntervalForCPUTicks___MicrosecondsPerTick;
    }
    else
    {
      int v2 = HIDWORD(v5[0]);
      BSTimeIntervalForCPUTicks___MicrosecondsPerTick = HIDWORD(v5[0]);
    }
  }
  return (double)(uint64_t)(v2 * (unint64_t)a1) / 1000000.0;
}

id BSEarlierDate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  int v6 = v4;
  if (v3 && (int v6 = v3, v4))
  {
    id v7 = [v3 earlierDate:v4];
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

void sub_18AB08EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSLaterDate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  double v5 = v4;
  int v6 = v4;
  if (v3 && (int v6 = v3, v4))
  {
    id v7 = [v3 laterDate:v4];
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

void sub_18AB08F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSDateAtStartOfDay(void *a1)
{
  id v1 = a1;
  int v2 = CFCalendarCopyCurrent();
  if (v2)
  {
    uint64_t v7 = 0;
    CFAbsoluteTime at = 0.0;
    unsigned int v6 = 0;
    [v1 timeIntervalSinceReferenceDate];
    if (CFCalendarDecomposeAbsoluteTime(v2, v3, "yMd", (char *)&v7 + 4, &v7, &v6)
      && CFCalendarComposeAbsoluteTime(v2, &at, "yMd", HIDWORD(v7), v7, v6))
    {
      id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:at];
    }
    else
    {
      id v4 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_18AB0909C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

dispatch_time_t BSDispatchTimeFromTimeInterval(double a1)
{
  if (a1 >= 9223372040.0) {
    return -1;
  }
  if (a1 <= -9223372040.0) {
    int64_t v1 = 0x8000000000000000;
  }
  else {
    int64_t v1 = (uint64_t)(a1 * 1000000000.0);
  }
  return dispatch_time(0, v1);
}

void sub_18AB09168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB091E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0926C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB092D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB09364(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AB0940C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AB094D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB09550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB09CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB09FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0A120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0A1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0A278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0A328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0A388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0A514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)BSDispatchSource;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB0AE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB0B378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf, __int16 a18, uint64_t a19, __int16 a20,uint64_t a21)
{
  if (a2 == 1)
  {
    id v36 = objc_begin_catch(a1);
    uint64_t v28 = NSString;
    uint64_t v29 = NSStringFromClass(v24);
    uint64_t v30 = [*(id *)(v22 + 8) bundleIdentifier];
    BOOL v35 = [*(id *)(v22 + 8) bundlePath];
    int v31 = [v28 stringWithFormat:@"%s ERROR while loading plugin.\nClass: %@\nBundleID: %@\nPath: %@\nException: %@"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v34 = [v36 callStackSymbols];
      uint64_t v32 = [v31 stringByAppendingFormat:@"\nCall stack: %@"];

      int v31 = (void *)v32;
    }
    BOOL v33 = BSLogCommon();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_error_impl(&dword_18AAA8000, v33, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18AB0B2ACLL);
  }

  _Unwind_Resume(a1);
}

void sub_18AB0B698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0B7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0B810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0B960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BB2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BC30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BD50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BDEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0BF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id BSLogTransactionAuditHistory()
{
  if (qword_1EB21B0E0 != -1) {
    dispatch_once(&qword_1EB21B0E0, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)_MergedGlobals_10;
  return v0;
}

void __BSLogTransactionAuditHistory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "TransactionAuditHistory");
  int64_t v1 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = (uint64_t)v0;
}

id BSLogPowerMonitor()
{
  if (BSLogPowerMonitor_onceToken != -1) {
    dispatch_once(&BSLogPowerMonitor_onceToken, &__block_literal_global_6);
  }
  os_log_t v0 = (void *)BSLogPowerMonitor___logObj;
  return v0;
}

void __BSLogPowerMonitor_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "PowerMonitor");
  int64_t v1 = (void *)BSLogPowerMonitor___logObj;
  BSLogPowerMonitor___logObuint64_t j = (uint64_t)v0;
}

void __BSLogSharedMemory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "SharedMemory");
  int64_t v1 = (void *)BSLogSharedMemory___logObj;
  BSLogSharedMemory___logObuint64_t j = (uint64_t)v0;
}

id BSLogTimer()
{
  if (BSLogTimer_onceToken != -1) {
    dispatch_once(&BSLogTimer_onceToken, &__block_literal_global_12);
  }
  os_log_t v0 = (void *)BSLogTimer___logObj;
  return v0;
}

void __BSLogTimer_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BaseBoard", "Timer");
  int64_t v1 = (void *)BSLogTimer___logObj;
  BSLogTimer___logObuint64_t j = (uint64_t)v0;
}

void sub_18AB0C27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0C440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0C4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)BSXPCConnectionListenerManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB0C7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0C83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0CD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, id a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  _Unwind_Resume(a1);
}

void sub_18AB0CEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0D040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0D0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0D188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

void sub_18AB0D220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0D2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSUInteger BSObjCSizeForTypeEncoding(const char *a1)
{
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment(a1, &sizep, 0);
  return sizep;
}

void sub_18AB0D47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0D544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0DD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18AB0DF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0E174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0E234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_18AB0E320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0E930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AB0ED10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AB0EEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0EFB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  CFIndex v25 = v24;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_18AB0F6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0F8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0FA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0FB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0FBA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0FBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0FCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB0FF3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB10188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1036C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB104D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB105C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB10774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1094C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB10B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB10D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB10F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB11050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB11100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB111D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB114B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB11780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB11B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB11C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB11DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = (Class)BSWallclockTimer;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB11E40(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_18AB11EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB11F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1240C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB12570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSColor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB12640(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18AB12890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_18AB12998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB12A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB12B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB12B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB12C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB12CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB12DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB12E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB12EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB12F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB12FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB13108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB13258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB132D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB13348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB133A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB134D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_18AB13590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void BSRunLoopPerformAfterCACommit(void *a1)
{
}

void BSRunLoopPerformRelativeToCACommit(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  CFIndex v4 = a1 + 2000000;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __BSRunLoopPerformRelativeToCACommit_block_invoke;
  v8[3] = &unk_1E5445EA0;
  id v5 = v3;
  id v9 = v5;
  unint64_t v10 = &v11;
  CFRunLoopObserverRef v6 = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 0, v4, v8);
  v12[3] = (uint64_t)v6;
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)v12[3], (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  _Block_object_dispose(&v11, 8);
}

void sub_18AB136B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void __BSRunLoopPerformRelativeToCACommit_block_invoke(uint64_t a1, __CFRunLoopObserver *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveObserver(Current, a2, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  CFRunLoopObserverRef v6 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  CFRelease(v6);
}

void sub_18AB13AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_18AB13C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB13C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB13D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB13D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB13ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB14CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18, _Unwind_Exception *exception_object, void *a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_18AB151EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB15370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB153F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSAbstractDefaultDomain;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB154C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB15570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB156E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB15B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AB15CB0(_Unwind_Exception *a1)
{
  int v2 = v1;

  _Unwind_Resume(a1);
}

void sub_18AB15F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB160E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setBool(void *a1, const char *a2, uint64_t a3)
{
  id v14 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v14, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 BOOLValue], v7, v8 == a3))
  {
    char v12 = [v14 _store];
    id v13 = *(id *)(v6 + 56);
    [v12 removeObjectForKey:v13];
  }
  else
  {
    id v9 = [v14 _store];
    if (v6) {
      unint64_t v10 = *(void **)(v6 + 56);
    }
    else {
      unint64_t v10 = 0;
    }
    id v11 = v10;
    [v9 setBool:a3 forKey:v11];

    if (!v6) {
      goto LABEL_11;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v14 synchronizeDefaults];
  }
LABEL_11:
}

void sub_18AB16294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getInt(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  int v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 intValue];

  return v9;
}

void sub_18AB16384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setInt(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 intValue], v7, v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithInt:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB16508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getShort(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  int v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 shortValue];

  return v9;
}

void sub_18AB1660C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setShort(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 shortValue], v7, v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithShort:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB16790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getLong(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  int v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 longValue];

  return v9;
}

void sub_18AB16894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setLong(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 longValue], v7, v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithLong:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB16A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setLongLong(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 longLongValue], v7, v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithLongLong:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB16BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedInt(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 unsignedIntValue];

  return v9;
}

void sub_18AB16CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedInt(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 unsignedIntValue],
                                            v7,
                                            v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithUnsignedInt:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB16E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedShort(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  int v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 unsignedShortValue];

  return v9;
}

void sub_18AB16F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedShort(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64),
        int v8 = [v7 unsignedShortValue],
        v7,
        v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithUnsignedShort:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB170C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sbDefaults_getUnsignedLong(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  int v8 = [v5 objectForKey:v7];
  uint64_t v9 = [v8 unsignedLongValue];

  return v9;
}

void sub_18AB171CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedLong(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 unsignedLongValue], v7, v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithUnsignedLong:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB17350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setUnsignedLongLong(void *a1, const char *a2, uint64_t a3)
{
  id v15 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v15, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), v8 = [v7 unsignedLongLongValue], v7, v8 == a3))
  {
    uint64_t v9 = [v15 _store];
    id v10 = *(id *)(v6 + 56);
    [v9 removeObjectForKey:v10];
  }
  else
  {
    id v11 = [v15 _store];
    char v12 = [NSNumber numberWithUnsignedLongLong:a3];
    if (v6) {
      id v13 = *(void **)(v6 + 56);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v11 setObject:v12 forKey:v14];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v15 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB174F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

float sbDefaults_getFloat(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v5 objectForKey:v7];
  [v8 floatValue];
  float v10 = v9;

  return v10;
}

void sub_18AB175FC(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setFloat(void *a1, const char *a2, float a3)
{
  id v17 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v17, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), [v7 floatValue], v9 = v8, v7, v9 == a3))
  {
    float v10 = [v17 _store];
    id v11 = *(id *)(v6 + 56);
    [v10 removeObjectForKey:v11];
  }
  else
  {
    char v12 = [v17 _store];
    *(float *)&double v13 = a3;
    id v14 = [NSNumber numberWithFloat:v13];
    if (v6) {
      id v15 = *(void **)(v6 + 56);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    [v12 setObject:v14 forKey:v16];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v17 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB1778C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double sbDefaults_getDouble(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  float v8 = [v5 objectForKey:v7];
  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

void sub_18AB17898(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sbDefaults_setDouble(void *a1, const char *a2, double a3)
{
  id v16 = a1;
  uint64_t v5 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v16, a2);
  uint64_t v6 = v5;
  if (v5
    && (*(unsigned char *)(v5 + 72) & 4) != 0
    && (id v7 = *(id *)(v5 + 64), [v7 doubleValue], v9 = v8, v7, v9 == a3))
  {
    double v10 = [v16 _store];
    id v11 = *(id *)(v6 + 56);
    [v10 removeObjectForKey:v11];
  }
  else
  {
    char v12 = [v16 _store];
    double v13 = [NSNumber numberWithDouble:a3];
    if (v6) {
      id v14 = *(void **)(v6 + 56);
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
    [v12 setObject:v13 forKey:v15];

    if (!v6) {
      goto LABEL_10;
    }
  }
  if ((*(unsigned char *)(v6 + 72) & 2) != 0) {
    [v16 synchronizeDefaults];
  }
LABEL_10:
}

void sub_18AB17A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sbDefaults_getURL(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  uint64_t v5 = [v3 _store];
  if (v4) {
    uint64_t v6 = (void *)v4[7];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  double v8 = [v5 URLForKey:v7];

  return v8;
}

void sub_18AB17B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setURL(void *a1, const char *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v17 = v5;
  uint64_t v7 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v17, a2);
  uint64_t v8 = v7;
  if (!v6)
  {
    double v13 = [v17 _store];
    if (v8) {
      id v16 = *(void **)(v8 + 56);
    }
    else {
      id v16 = 0;
    }
    id v15 = v16;
    [v13 removeObjectForKey:v15];
LABEL_12:

    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (!v7
    || (*(unsigned char *)(v7 + 72) & 4) == 0
    || (id v9 = *(id *)(v7 + 64), v10 = [v6 isEqual:v9], v9, !v10))
  {
    double v13 = [v17 _store];
    if (v8) {
      id v14 = *(void **)(v8 + 56);
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
    [v13 setURL:v6 forKey:v15];
    goto LABEL_12;
  }
  id v11 = [v17 _store];
  id v12 = *(id *)(v8 + 56);
  [v11 removeObjectForKey:v12];

LABEL_13:
  if ((*(unsigned char *)(v8 + 72) & 2) != 0) {
    [v17 synchronizeDefaults];
  }
LABEL_15:
}

void sub_18AB17CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v13;

  _Unwind_Resume(a1);
}

id sbDefaults_getObject(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v3, a2);
  id v5 = [v3 _store];
  if (v4) {
    id v6 = (void *)v4[7];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v5 objectForKey:v7];

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v8 = 0;
  }

  return v8;
}

void sub_18AB17DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sbDefaults_setObject(void *a1, const char *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v19 = v5;
  uint64_t v7 = -[BSAbstractDefaultDomain _propertyFromSelector:]((uint64_t)v19, a2);
  uint64_t v8 = v7;
  if (!v6)
  {
    int v10 = [v19 _store];
    if (v8) {
      id v11 = *(void **)(v8 + 56);
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    [v10 removeObjectForKey:v12];
LABEL_19:

    if (!v8) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (!v7)
  {
LABEL_16:
    int v10 = [v19 _store];
    if (v8) {
      __int16 v18 = *(void **)(v8 + 56);
    }
    else {
      __int16 v18 = 0;
    }
    id v12 = v18;
    [v10 setObject:v6 forKey:v12];
    goto LABEL_19;
  }
  if ((*(unsigned char *)(v7 + 72) & 8) == 0) {
    goto LABEL_13;
  }
  id v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_13;
    }
  }
  uint64_t v13 = [v9 count];

  if (v13)
  {
LABEL_13:
    if ((*(unsigned char *)(v8 + 72) & 4) != 0)
    {
      id v14 = *(id *)(v8 + 64);
      int v15 = [v6 isEqual:v14];

      if (v15) {
        goto LABEL_15;
      }
    }
    goto LABEL_16;
  }
LABEL_15:
  id v16 = [v19 _store];
  id v17 = *(id *)(v8 + 56);
  [v16 removeObjectForKey:v17];

LABEL_20:
  if ((*(unsigned char *)(v8 + 72) & 2) != 0) {
    [v19 synchronizeDefaults];
  }
LABEL_22:
}

void sub_18AB18044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v13;

  _Unwind_Resume(a1);
}

dispatch_queue_t BSDispatchQueueCreateWithAttributes(const char *a1, void *a2)
{
  return BSDispatchQueueCreateWithQualityOfService(a1, a2, QOS_CLASS_UNSPECIFIED, 0);
}

dispatch_queue_t BSDispatchQueueCreateSerialWithQoS(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = +[BSDispatchQueueAttributes serial];
  id v5 = [v4 serviceClass:a2];
  dispatch_queue_t v6 = BSDispatchQueueCreate(v3, v5);

  return v6;
}

void sub_18AB18178(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t BSDispatchQueueCreateSerialWithFixedPriority(void *a1, uint64_t a2)
{
  id v3 = (const char *)[a1 UTF8String];
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v5 = _BSDispatchQueueCreateWithPriority(v3, v4, a2);

  return v5;
}

void sub_18AB1820C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

dispatch_queue_t _BSDispatchQueueCreateWithPriority(const char *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.baseboard.fixpri-%d", a3);
  id v6 = objc_claimAutoreleasedReturnValue();
  inactive = dispatch_workloop_create_inactive((const char *)[v6 UTF8String]);
  dispatch_workloop_set_scheduler_priority();
  dispatch_activate(inactive);
  uint64_t v8 = _BSDispatchQueueAttributesForAttributes(v5, QOS_CLASS_UNSPECIFIED, 0);
  dispatch_queue_t v9 = dispatch_queue_create_with_target_V2(a1, v8, inactive);

  return v9;
}

void sub_18AB182F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSDispatchQueueCreateWithFixedPriority(const char *a1, void *a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t BSDispatchQueueCreateWithFixedPriorityAndSchedulingPolicy(const char *a1, void *a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

NSObject *BSDispatchQueueName(NSObject *label)
{
  if (label)
  {
    label = dispatch_queue_get_label(label);
    if (label)
    {
      label = [NSString stringWithUTF8String:label];
    }
    uint64_t v1 = vars8;
  }
  return label;
}

dispatch_block_t BSDispatchBlockCreateWithQualityOfService(dispatch_qos_class_t qos_class, int a2, dispatch_block_t block)
{
  if (a2 <= -15) {
    int v3 = -15;
  }
  else {
    int v3 = a2;
  }
  return dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, qos_class, v3 & (v3 >> 31), block);
}

dispatch_time_t BSDispatchTimeForIntervalFromNow(double a1)
{
  if (a1 >= 9223372040.0) {
    return -1;
  }
  if (a1 <= -9223372040.0) {
    int64_t v1 = 0x8000000000000000;
  }
  else {
    int64_t v1 = (uint64_t)(a1 * 1000000000.0);
  }
  return dispatch_time(0, v1);
}

dispatch_time_t BSDispatchTimeWithInterval(dispatch_time_t a1, double a2)
{
  if (a2 >= 9223372040.0) {
    return -1;
  }
  if (a2 <= -9223372040.0) {
    int64_t v2 = 0x8000000000000000;
  }
  else {
    int64_t v2 = (uint64_t)(a2 * 1000000000.0);
  }
  return dispatch_time(a1, v2);
}

uint64_t BSDispatchTimeDeltaForInterval(double a1)
{
  if (a1 >= 9223372040.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a1 <= -9223372040.0) {
    return 0x8000000000000000;
  }
  return (uint64_t)(a1 * 1000000000.0);
}

void sub_18AB18634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB186D0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AB18A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB18DD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_18AB19568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_18AB1988C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL BSIntegerMapContainsObjectForKey(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BSIntegerMapContainsObjectForKey(BSIntegerMap *__strong _Nonnull, NSInteger)");
    [v5 handleFailureInFunction:v6, @"BSIntegerMap.m", 166, @"Invalid parameter not satisfying: %@", @"map" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = (void *)*((void *)v3 + 2);
    goto LABEL_6;
  }
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = [*((id *)v3 + 1) objectForKey:a2];

LABEL_6:
  return v4 != 0;
}

void sub_18AB19CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSIntegerMapDescription(uint64_t a1)
{
  int64_t v1 = +[BSDescriptionStream descriptionForRootObject:a1];
  return v1;
}

BOOL BSIntegerMapIsEmpty(void *a1)
{
  return BSIntegerMapCount(a1) == 0;
}

BOOL BSEqualAuditTokens(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t BSProcessHasSandbox()
{
  if (qword_1EB21B158 != -1) {
    dispatch_once(&qword_1EB21B158, &__block_literal_global_13);
  }
  return _MergedGlobals_15;
}

uint64_t __BSProcessHasSandbox_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  _MergedGlobals_15 = result != 0;
  return result;
}

BOOL BSSandboxCanAccessMachService(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    getpid();
    [v1 UTF8String];
    BOOL v2 = sandbox_check() == 0;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

void sub_18AB19E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSASIDForAuditToken(_OWORD *a1)
{
  if (!BSAuditTokenIsValid((uint64_t)a1)) {
    return 4294967294;
  }
  long long v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_asid(&v4);
}

uint64_t BSEUIDForAuditToken(_OWORD *a1)
{
  if (!BSAuditTokenIsValid((uint64_t)a1)) {
    return 0xFFFFFFFFLL;
  }
  long long v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_euid(&v4);
}

uint64_t BSEGIDForAuditToken(_OWORD *a1)
{
  if (!BSAuditTokenIsValid((uint64_t)a1)) {
    return 0xFFFFFFFFLL;
  }
  long long v2 = a1[1];
  *(_OWORD *)v4.val = *a1;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_egid(&v4);
}

__n128 BSAuditTokenFromMachMessage(uint64_t a1, __n128 *a2)
{
  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  __n128 v4 = result;
  __n128 v5 = result;
  uint64_t v3 = ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v3 || *(_DWORD *)(v3 + 4) < 0x20u)
  {
    if (!a2) {
      return result;
    }
    goto LABEL_6;
  }
  __n128 result = *(__n128 *)(v3 + 20);
  __n128 v4 = result;
  __n128 v5 = *(__n128 *)(v3 + 36);
  if (a2)
  {
LABEL_6:
    __n128 result = v4;
    *a2 = v4;
    a2[1] = v5;
  }
  return result;
}

id BSAuditTokenTaskCopyEntitlementValue(_OWORD *a1, void *a2)
{
  id v3 = a2;
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  __n128 v5 = +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v8);
  id v6 = -[BSSecTask valueForEntitlement:]((uint64_t)v5, v3);

  return v6;
}

void sub_18AB1A0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSSecTaskHasEntitlement(__SecTask *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    long long v4 = BSSecTaskCopyEntitlementValue(a1, v3);
    __n128 v5 = v4;
    if (v4 && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFBooleanGetTypeID())) {
      uint64_t v7 = [v5 BOOLValue];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v8 = BSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v10 = 0;
      _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "Unable to get entitlement for an invalid secTask", v10, 2u);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

void sub_18AB1A198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSSelfTaskHasEntitlement(void *a1)
{
  id v1 = a1;
  long long v2 = +[BSSecTask secTaskForCurrentProcess]();
  uint64_t v3 = -[BSSecTask BOOLForEntitlement:]((uint64_t)v2, v1);

  return v3;
}

void sub_18AB1A20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSBundlePathForPID(uint64_t a1)
{
  if (getpid() == a1)
  {
    long long v2 = [MEMORY[0x1E4F28B50] mainBundle];
    [v2 bundlePath];
  }
  else
  {
    long long v2 = BSExecutablePathForPID(a1);
    BSBundlePathForExecutablePath(v2);
  uint64_t v3 = };

  return v3;
}

void sub_18AB1A2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSBundlePathForAuditToken(long long *a1)
{
  uint64_t v2 = BSGetVersionedPID();
  long long v3 = a1[1];
  long long v8 = *a1;
  long long v9 = v3;
  if (v2 == BSVersionedPIDForAuditToken(&v8))
  {
    long long v4 = [MEMORY[0x1E4F28B50] mainBundle];
    [v4 bundlePath];
  }
  else
  {
    long long v5 = a1[1];
    long long v8 = *a1;
    long long v9 = v5;
    long long v4 = BSExecutablePathForAuditToken();
    BSBundlePathForExecutablePath(v4);
  CFTypeID v6 = };

  return v6;
}

void sub_18AB1A360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSBundleIDForXPCConnection(void *a1)
{
  id v1 = _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(a1);
  return v1;
}

os_unfair_lock_s *BSAuditTokenRepresentsPlatformBinary(_OWORD *a1)
{
  long long v1 = a1[1];
  v5[0] = *a1;
  v5[1] = v1;
  +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v5);
  uint64_t v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  long long v3 = -[BSSecTask representsPlatformBinary](v2);

  return v3;
}

void sub_18AB1A3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1A474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1A544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AB1A638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1A6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1A88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1A9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1B054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1B194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1B1FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1B94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_18AB1BCD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_18AB1BE9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_18AB1C054(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_18AB1C1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1C348(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AB1C3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1C4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v13;

  _Unwind_Resume(a1);
}

void sub_18AB1C5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1C6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v13;

  _Unwind_Resume(a1);
}

void sub_18AB1C79C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1C838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1C970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1CAB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1CB60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1CC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1CDDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1CED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1D790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1DA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1DBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  _Unwind_Resume(a1);
}

void sub_18AB1DCD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1DE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  long long v8 = v7;

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB1DF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1E0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  long long v8 = v7;

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB1E2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1E3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1E438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1E5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1E788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1EA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1EAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _BSPowerChanged(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  uint64_t v6 = [a1 object];
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    BSDispatchQueueAssert(*(void **)(v6 + 32));
    HIDWORD(v8) = a3;
    LODWORD(v8) = a3 + 536870288;
    switch((v8 >> 4))
    {
      case 0u:
        uint64_t v24 = 0;
        uint64_t v25 = &v24;
        uint64_t v26 = 0x2020000000;
        char v27 = 1;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = ___BSPowerChanged_block_invoke;
        v21[3] = &unk_1E54461B8;
        long long v9 = v7;
        id v22 = v9;
        uint64_t v23 = &v24;
        _bsDispatchToObservers(v9, v21);
        io_connect_t v10 = v9[14];
        if (*((unsigned char *)v25 + 24)) {
          IOAllowPowerChange(v10, a4);
        }
        else {
          IOCancelPowerChange(v10, a4);
        }

        _Block_object_dispose(&v24, 8);
        break;
      case 1u:
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = ___BSPowerChanged_block_invoke_38;
        v17[3] = &unk_1E54461E0;
        id v11 = v7;
        __int16 v18 = v11;
        _bsDispatchToObservers(v11, v17);
        IOAllowPowerChange(v11[14], a4);
        id v12 = v18;
        goto LABEL_9;
      case 2u:
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = ___BSPowerChanged_block_invoke_35;
        v19[3] = &unk_1E54461E0;
        id v20 = v7;
        _bsDispatchToObservers(v20, v19);
        id v12 = (io_connect_t *)v20;
        goto LABEL_9;
      case 9u:
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = ___BSPowerChanged_block_invoke_44;
        v13[3] = &unk_1E54461E0;
        id v14 = v7;
        _bsDispatchToObservers(v14, v13);
        id v12 = (io_connect_t *)v14;
        goto LABEL_9;
      case 0xBu:
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        int v15[2] = ___BSPowerChanged_block_invoke_41;
        v15[3] = &unk_1E54461E0;
        id v16 = v7;
        _bsDispatchToObservers(v16, v15);
        id v12 = (io_connect_t *)v16;
LABEL_9:

        break;
      default:
        break;
    }
  }
}

void sub_18AB1EDC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18AB1EF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)BSPowerMonitor;
  [(_Unwind_Exception *)&a10 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB1EFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1F06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _bsDispatchToObservers(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v4 = a2;
  int v15 = v3;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void _bsDispatchToObservers(BSPowerMonitor *__strong, __strong BSPowerObserverBlock)");
    [v13 handleFailureInFunction:v14, @"BSPowerMonitor.m", 51, @"Invalid parameter not satisfying: %@", @"callout" file lineNumber description];
  }
  BSDispatchQueueAssert(*((void **)v3 + 4));
  os_unfair_lock_lock((os_unfair_lock_t)v3 + 10);
  long long v5 = [*((id *)v3 + 6) allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)v3 + 10);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = BSLogPowerMonitor();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v10;
          _os_log_impl(&dword_18AAA8000, v11, OS_LOG_TYPE_INFO, "Preparing to messaging power observer: %@", buf, 0xCu);
        }

        id v12 = (void *)MEMORY[0x18C125360]();
        v4[2](v4, v10);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }
}

void sub_18AB1F30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1F448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1F538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1F628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1F718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1F808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1F8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB1FBEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _BSHandleSignificantTimeChange()
{
  id v0 = +[BSDateTimeCache sharedInstance];
  [v0 _resetAndConfigure];
}

void sub_18AB1FC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB1FCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)BSDateTimeCache;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB20208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB20450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB205C4(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void _BSHandleSignificantTimeChange_0(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  if (v2 && v2[3]) {
    [v2 fireAndSchedule];
  }
}

void sub_18AB20648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2070C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)BSRelativeDateTimer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB207C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB20890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB20B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB20D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB20E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB21144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB21234(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18AB212AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB213EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2148C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB214F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2154C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSBasicServerClient;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB21600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB21680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB216FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2178C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB21804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2193C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB21A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB21BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BSXPCAuditTokensDescription()
{
  id v0 = (void *)_bsxpc_auditTokens_desc(0);
  return v0;
}

uint64_t _bsxpc_auditTokens_desc(char a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x18C125360]();
  if ((a1 & 1) == 0) {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_21);
  }
  uint64_t v2 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"invalid=%@\ntokens={", qword_1EB21B1C8];
  id v3 = [(NSArray *)NSAllMapTableKeys((NSMapTable *)qword_1EB21B1D0) sortedArrayUsingComparator:&__block_literal_global_19];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 appendFormat:@"\n\t%10i -> %5i : %@", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "pid"), NSMapGet((NSMapTable *)qword_1EB21B1D0, *(const void **)(*((void *)&v11 + 1) + 8 * v7)), *(void *)(*((void *)&v11 + 1) + 8 * v7), context];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [v2 appendString:@"\n}"];
  if ((a1 & 1) == 0) {
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_21);
  }
  uint64_t v8 = [v2 copy];
  return v8;
}

void BSStoreTokenToVar(void *a1, void **a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v6 = (void *)[NSString stringWithFormat:@"token must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138544130;
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreTokenToVar(BSAuditToken *, BSAuditToken **)");
      __int16 v10 = 2114;
      long long v11 = @"BSAuditTokenCaching.m";
      __int16 v12 = 1024;
      int v13 = 143;
      __int16 v14 = 2114;
      int v15 = v6;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x26u);
    }
    qword_1E911F420 = [v6 UTF8String];
    __break(0);
    JUMPOUT(0x18AB22118);
  }
  if (!a2)
  {
    uint64_t v7 = (void *)[NSString stringWithFormat:@"var must not be nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138544130;
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSStoreTokenToVar(BSAuditToken *, BSAuditToken **)");
      __int16 v10 = 2114;
      long long v11 = @"BSAuditTokenCaching.m";
      __int16 v12 = 1024;
      int v13 = 144;
      __int16 v14 = 2114;
      int v15 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x26u);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AB221D0);
  }
  if (qword_1EB21B1D8 != -1) {
    dispatch_once_f(&qword_1EB21B1D8, 0, (dispatch_function_t)_bsxpc_auditToken_init);
  }
  uint64_t v4 = *a2;
  if ([a1 isInvalid])
  {
    if (v4 == (void *)qword_1EB21B1C8) {
      return;
    }
    id v5 = (id)qword_1EB21B1C8;
  }
  else
  {
    if (v4 == a1 || v4 && ([a1 isEqual:v4] & 1) != 0) {
      return;
    }
    id v5 = a1;
  }
  _BSStoreNewRetainedTokenToVar(v5, a2);
}

uint64_t ___bsxpc_auditTokens_desc_block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = [a2 pid];
  if (v5 != [a3 pid])
  {
    int v8 = [a2 pid];
    BOOL v9 = v8 < (int)[a3 pid];
    goto LABEL_6;
  }
  uint64_t v6 = [a2 versionedPID];
  if (v6 != [a3 versionedPID])
  {
    uint64_t v10 = [a2 versionedPID];
    BOOL v9 = v10 < [a3 versionedPID];
LABEL_6:
    BOOL v7 = v9;
    goto LABEL_9;
  }
  BOOL v7 = a2 < a3;
LABEL_9:
  if (v7) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_18AB225F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB229D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_18AB22A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB22CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB22D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB22DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB22E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB22F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB22FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB23140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2336C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2350C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB23748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2380C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB238DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getCAMediaTimingFunctionClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CAMediaTimingFunction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCAMediaTimingFunctionClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCAMediaTimingFunctionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSAnimationSettings.m", 21, @"Unable to find class %s", "CAMediaTimingFunction");

    __break(1u);
  }
}

void sub_18AB23C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *QuartzCoreLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __QuartzCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5446338;
    uint64_t v6 = 0;
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v0 = (void *)QuartzCoreLibraryCore_frameworkLibrary;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    id v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSAnimationSettings.m", 20, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  long long v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_18AB23DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __QuartzCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuartzCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCASpringAnimationClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CASpringAnimation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCASpringAnimationClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCASpringAnimationClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSAnimationSettings.m", 22, @"Unable to find class %s", "CASpringAnimation");

    __break(1u);
  }
}

void sub_18AB23F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getCATransactionClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CATransaction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCATransactionClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCATransactionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BSAnimationSettings.m", 23, @"Unable to find class %s", "CATransaction");

    __break(1u);
  }
}

void sub_18AB24018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__getkCAMediaTimingFunctionLinearSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCAMediaTimingFunctionLinear");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAMediaTimingFunctionLinearSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

CFRunLoopSourceRef BSCreateMIGServerSource(uint64_t a1, int a2, CFIndex a3)
{
  return BSCreateMIGServerSourceWithContext(a1, a2, a3, 0);
}

CFRunLoopSourceRef BSCreateMIGServerSourceWithContext(uint64_t a1, int a2, CFIndex a3, uint64_t a4)
{
  pthread_once(&__BSMIGServerCalloutContextKeyOnce, (void (*)(void))makeCalloutContextKey);
  int v8 = malloc_type_malloc(0x18uLL, 0x10A0040FC6C5850uLL);
  *(_DWORD *)int v8 = a2;
  v8[1] = a1;
  _OWORD v8[2] = a4;
  context.version = 1;
  context.mach_timebase_info info = v8;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F14838];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))migHelperCopyDescription;
  context.equal = (Boolean (__cdecl *)(const void *, const void *))migHelperEqual;
  context.hash = (CFHashCode (__cdecl *)(const void *))migHelperHash;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperGetPort;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperRecievePortCallout;
  CFRunLoopSourceRef v9 = CFRunLoopSourceCreate(0, a3, &context);
  if (!v9) {
    free(v8);
  }
  return v9;
}

uint64_t makeCalloutContextKey()
{
  return pthread_key_create((pthread_key_t *)&__BSMIGServerCalloutContextKey, 0);
}

CFStringRef migHelperCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, @"<CFRunLoopSource MIG Server> {port = %u, subsystem = %p, CFRunLoopSourceContext context = %p}", *a1, *((void *)a1 + 1), *((void *)a1 + 2));
}

BOOL migHelperEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t migHelperHash(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperRecievePortCallout(mach_msg_header_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  mach_msg_return_t v21;
  FILE *v23;
  char *v24;

  uint64_t v6 = *(void *)(a4 + 8);
  mach_msg_id_t msgh_id = a1->msgh_id;
  int v8 = *(_DWORD *)(v6 + 8);
  BOOL v9 = __OFSUB__(msgh_id, v8);
  int v10 = msgh_id - v8;
  if (v10 < 0 != v9 || msgh_id >= *(_DWORD *)(v6 + 12))
  {
    long long v11 = 0;
  }
  else
  {
    long long v11 = *(void (**)(mach_msg_header_t *, mach_msg_header_t *))(v6 + 40 * v10 + 40);
    if (v11)
    {
      char v12 = 0;
      size_t v13 = *(unsigned int *)(v6 + 40 * v10 + 64);
      goto LABEL_7;
    }
  }
  char v12 = 1;
  size_t v13 = 36;
LABEL_7:
  __int16 v14 = (mach_msg_header_t *)malloc_type_malloc(v13, 0xE5F8CC19uLL);
  if (v14)
  {
    int v15 = v14;
    mach_port_t msgh_remote_port = a1->msgh_remote_port;
    v14->mach_msg_bits_t msgh_bits = a1->msgh_bits & 0x1F;
    v14->msgh_size = 36;
    *(void *)&v14->mach_port_t msgh_remote_port = msgh_remote_port;
    v14->mach_msg_id_t msgh_id = a1->msgh_id + 100;
    if (v12)
    {
      *(void *)&v14[1].mach_msg_bits_t msgh_bits = *MEMORY[0x1E4F14068];
      v14[1].mach_port_t msgh_remote_port = -303;
    }
    else
    {
      long long v17 = *(const void **)(a4 + 16);
      if (v17)
      {
        pthread_setspecific(__BSMIGServerCalloutContextKey, v17);
        v11(a1, v15);
        pthread_setspecific(__BSMIGServerCalloutContextKey, 0);
      }
      else
      {
        v11(a1, v14);
      }
    }
    mach_msg_bits_t msgh_bits = v15->msgh_bits;
    if ((v15->msgh_bits & 0x80000000) == 0)
    {
      mach_port_t v19 = v15[1].msgh_remote_port;
      if (v19 == -305)
      {
LABEL_31:
        free(v15);
        return 0;
      }
      if (v19 && (a1->msgh_bits & 0x80000000) != 0)
      {
        a1->mach_port_t msgh_remote_port = 0;
        mach_msg_destroy(a1);
        mach_msg_bits_t msgh_bits = v15->msgh_bits;
      }
    }
    if (v15->msgh_remote_port)
    {
      if ((msgh_bits & 0x1F) == 0x12) {
        mach_msg_option_t v20 = 1;
      }
      else {
        mach_msg_option_t v20 = 17;
      }
      uint64_t v21 = mach_msg(v15, v20, v15->msgh_size, 0, 0, 0, 0);
      if ((v21 - 268435459) >= 2 && v21 != 0)
      {
        uint64_t v23 = (FILE *)*MEMORY[0x1E4F143C8];
        uint64_t v24 = mach_error_string(v21);
        fprintf(v23, "<CFRunLoopSource MIG Server> mach_msg send error in reply: %s\n", v24);
        goto LABEL_31;
      }
      if ((v21 - 268435459) > 1) {
        goto LABEL_31;
      }
      mach_msg_bits_t msgh_bits = v15->msgh_bits;
    }
    if ((msgh_bits & 0x80000000) != 0) {
      mach_msg_destroy(v15);
    }
    goto LABEL_31;
  }
  return 0;
}

uint64_t BSGetMachPortForMIGServerSource(__CFRunLoopSource *a1)
{
  memset(&context.info, 0, 64);
  context.version = 1;
  CFRunLoopSourceGetContext(a1, &context);
  return *(unsigned int *)context.info;
}

void *BSGetContextForCalloutCurrentMIGServerSource()
{
  return pthread_getspecific(__BSMIGServerCalloutContextKey);
}

void sub_18AB24570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB24668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB24744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSProcessExceptionCode(uint64_t a1)
{
  long long v1 = @"UserInitiatedQuit";
  if (a1 != 3735943697) {
    long long v1 = 0;
  }
  if (a1 == 3735883980) {
    uint64_t v2 = @"ResourceExclusion";
  }
  else {
    uint64_t v2 = v1;
  }
  id v3 = @"ThermalPressure";
  if (a1 != 3221229823) {
    id v3 = 0;
  }
  if (a1 == 2343432205) {
    uint64_t v4 = @"WatchdogViolation";
  }
  else {
    uint64_t v4 = v3;
  }
  if (a1 <= 3735883979) {
    long long v5 = v4;
  }
  else {
    long long v5 = v2;
  }
  uint64_t v6 = @"(none)";
  uint64_t v7 = @"BlownAnimationFence";
  if (a1 != 1307235759) {
    uint64_t v7 = 0;
  }
  if (a1 == 732775916) {
    int v8 = @"SecurityViolation";
  }
  else {
    int v8 = v7;
  }
  if (a1) {
    uint64_t v6 = v8;
  }
  if (a1 <= 2343432204) {
    return v6;
  }
  else {
    return v5;
  }
}

void __BSSystemRootDirectory_block_invoke()
{
  CFStringRef v0 = CFStringCreateWithFileSystemRepresentation(0, "/");
  long long v1 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = (uint64_t)v0;
}

id BSSystemSharedResourcesDirectoryForCurrentProcess()
{
  if (qword_1EB21B208 != -1) {
    dispatch_once(&qword_1EB21B208, &__block_literal_global_6_0);
  }
  CFStringRef v0 = (void *)qword_1EB21B200;
  return v0;
}

id BSSystemSharedDirectoryForCurrentProcess()
{
  if (qword_1EB21B1F8 != -1) {
    dispatch_once(&qword_1EB21B1F8, &__block_literal_global_3_0);
  }
  CFStringRef v0 = (void *)qword_1EB21B1F0;
  return v0;
}

void __BSSystemSharedDirectoryForCurrentProcess_block_invoke()
{
  BSSystemSharedDirectoryForIdentifier(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 copy];
  long long v1 = (void *)qword_1EB21B1F0;
  qword_1EB21B1F0 = v0;
}

void sub_18AB2496C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id BSSystemSharedDirectoryForIdentifier(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  [v1 UTF8String];
  id v2 = (void *)container_system_path_for_identifier();
  if (v2)
  {
    id v3 = [NSString stringWithUTF8String:v2];
    free(v2);
  }
  else
  {
    uint64_t v4 = 1;
    long long v5 = BSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = v1;
      if (!v1)
      {
        uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v7 = [(id)v4 bundleIdentifier];
      }
      *(_DWORD *)buf = 138543618;
      BOOL v9 = v7;
      __int16 v10 = 2048;
      uint64_t v11 = 1;
      _os_log_error_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_ERROR, "Error getting shared system container for bundleID: %{public}@: %llu", buf, 0x16u);
      if (!v1)
      {
      }
    }

    id v3 = 0;
  }

  return v3;
}

void sub_18AB24B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSSystemSharedResourcesDirectoryForCurrentProcess_block_invoke()
{
  BSSystemSharedResourcesDirectoryForIdentifier(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 copy];
  id v1 = (void *)qword_1EB21B200;
  qword_1EB21B200 = v0;
}

void sub_18AB24BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id BSSystemSharedResourcesDirectoryForIdentifier(void *a1)
{
  id v1 = BSSystemSharedDirectoryForIdentifier(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"Library"];

  return v2;
}

void sub_18AB24C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSCurrentUserDirectory()
{
  if (qword_1EB21B218 != -1) {
    dispatch_once(&qword_1EB21B218, &__block_literal_global_9_0);
  }
  uint64_t v0 = (void *)qword_1EB21B210;
  return v0;
}

void __BSCurrentUserDirectory_block_invoke()
{
  id v0 = [NSString alloc];
  uid_t v1 = getuid();
  uint64_t v2 = [v0 initWithUTF8String:getpwuid(v1)->pw_dir];
  id v3 = (void *)qword_1EB21B210;
  qword_1EB21B210 = v2;
}

id BSPathForSystemDirectory(NSSearchPathDirectory a1)
{
  return _BSSearchPathForDirectoryInDomain(a1, 8uLL);
}

id _BSSearchPathForDirectoryInDomain(NSSearchPathDirectory a1, NSSearchPathDomainMask domainMask)
{
  char v2 = domainMask;
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)domainMask);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] == 1)
  {
    uint64_t v4 = NSSearchPathForDirectoriesInDomains(a1, domainMask, 1);
    long long v5 = [v4 firstObject];

    if (v5)
    {
      if (v2) {
        BSCurrentUserDirectory();
      }
      else {
      uint64_t v7 = BSSystemRootDirectory();
      }
      if ([v5 hasPrefix:v7])
      {
        id v6 = v5;
      }
      else
      {
        int v8 = [v7 stringByAppendingPathComponent:v5];
        id v6 = [v8 stringByStandardizingPath];
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void sub_18AB24DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSPathForCurrentUserDirectory(NSSearchPathDirectory a1)
{
  return _BSSearchPathForDirectoryInDomain(a1, 1uLL);
}

uint64_t BSIsSymbolicLinkAtPath(void *a1)
{
  memset(&v5, 0, sizeof(v5));
  id v1 = a1;
  if (lstat((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v5))
  {
    BOOL v2 = 0;
  }
  else
  {
    BOOL v2 = (v5.st_mode & 0xF000) == 40960;
  }
  uint64_t v3 = v2;

  return v3;
}

void sub_18AB24E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSModificationDateForPath(void *a1)
{
  memset(&v4, 0, sizeof(v4));
  id v1 = a1;
  double v2 = 0.0;
  if (!stat((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v4)) {
    double v2 = (double)v4.st_mtimespec.tv_nsec / 1000000000.0 + (double)v4.st_mtimespec.tv_sec + -978307200.0;
  }

  return v2;
}

void sub_18AB24F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSEnsureDirectoryExistsAtPath(void *a1)
{
  id v1 = a1;
  int v2 = mkdir((const char *)[v1 fileSystemRepresentation], 0x1FFu);
  if (!v2 || v2 == -1 && *__error() == 17)
  {
    BOOL v3 = 1;
  }
  else
  {
    stat v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = 0;
    [v4 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v7];
    id v5 = v7;

    BOOL v3 = v5 == 0;
  }

  return v3;
}

void sub_18AB24FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSTemporaryFileAtPath(void *a1, int *a2)
{
  id v3 = a1;
  if (!v3)
  {
    int v8 = 0;
    if (!a2) {
      goto LABEL_8;
    }
    int v6 = -1;
    goto LABEL_7;
  }
  id v4 = [NSString stringWithFormat:@"%@.XXXXXX", v3];
  id v5 = strdup((const char *)[v4 fileSystemRepresentation]);
  int v6 = mkstemp(v5);
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 stringWithFileSystemRepresentation:v5 length:strlen(v5)];

  free(v5);
  if (a2)
  {
LABEL_7:
    *a2 = v6;
    goto LABEL_8;
  }
  if ((v6 & 0x80000000) == 0) {
    close(v6);
  }
LABEL_8:

  return v8;
}

void sub_18AB25100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSPathExistsOnSystemPartition_block_invoke()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v0 = BSSystemRootDirectory();
  id v1 = [v0 stringByAppendingPathComponent:@"System"];

  int v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = 0;
  id v3 = [v2 attributesOfFileSystemForPath:v1 error:&v18];
  id v4 = v18;
  uint64_t v5 = *MEMORY[0x1E4F283A8];
  uint64_t v6 = [v3 objectForKey:*MEMORY[0x1E4F283A8]];
  id v7 = (void *)qword_1EB21B220;
  qword_1EB21B220 = v6;

  if (!qword_1EB21B220)
  {
    int v8 = BSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = [v4 descriptionWithMultilinePrefix:0];
      *(_DWORD *)buf = 138543362;
      mach_msg_option_t v20 = v15;
      _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "Unable to resolve system partition file system number: %{public}@", buf, 0xCu);
    }
  }

  BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  __int16 v10 = [v9 attributesOfFileSystemForPath:@"/private/preboot" error:&v17];
  id v11 = v17;
  uint64_t v12 = [v10 objectForKey:v5];
  size_t v13 = (void *)qword_1EB21B228;
  qword_1EB21B228 = v12;

  if (!qword_1EB21B228)
  {
    __int16 v14 = BSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v11 descriptionWithMultilinePrefix:0];
      *(_DWORD *)buf = 138543362;
      mach_msg_option_t v20 = v16;
      _os_log_error_impl(&dword_18AAA8000, v14, OS_LOG_TYPE_ERROR, "Unable to resolve preboot partition file system number: %{public}@", buf, 0xCu);
    }
  }
}

void sub_18AB25380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB25740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_18AB25850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  __int16 v10 = v9;

  a9.super_class = (Class)_BSDefaultObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB259D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB25B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB25BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB25C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB25CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB25D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2619C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB26404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB268F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB269F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB26C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB26CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB26EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_18AB2717C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB27254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB272C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB273C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2749C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB27524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB275AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2785C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_18AB279B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB27BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB27C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  __int16 v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSTimer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB27FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AB282DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2842C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x18C125630](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_18AB286D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB287D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t BSHashPurify64(unint64_t a1)
{
  unint64_t v1 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a1 ^ (a1 >> 30))) >> 27));
  return v1 ^ (v1 >> 31);
}

void sub_18AB28920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB28A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB28C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB28DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB28E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB28EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB28F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB28FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB29054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB29100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2922C(_Unwind_Exception *a1)
{
  if (!v1) {

  }
  _Unwind_Resume(a1);
}

void sub_18AB292AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB29510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_18AB295D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB29654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB296E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB298E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB29A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void BSPthreadCreate(void *a1)
{
  id v1 = a1;
  int v2 = (void (**)(void, void))[v1 copy];

  pthread_t v3 = 0;
  if (pthread_create(&v3, 0, (void *(__cdecl *)(void *))BSStartPthread, v2) && v2) {
    v2[2](v2, 0);
  }
}

void sub_18AB29B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSStartPthread()
{
  id v0 = (void (**)(void, void))MEMORY[0x18C125630]();
  if (v0)
  {
    pthread_t v1 = pthread_self();
    ((void (**)(void, pthread_t))v0)[2](v0, v1);
  }

  return 0;
}

void sub_18AB29B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BSPthreadFixPriority(_opaque_pthread_t *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  policy_mach_timebase_info info = 0;
  thread_act_t v1 = pthread_mach_thread_np(a1);
  thread_policy_set(v1, 1u, &policy_info, 1u);
  int v2 = proc_setthread_cpupercent();
  if (v2)
  {
    int v3 = v2;
    id v4 = BSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v7 = "BSPthreadFixPriority";
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_error_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_ERROR, "%s Error %d setting thread CPU percent", buf, 0x12u);
    }
  }
}

void BSPthreadSetFixedPriority(_opaque_pthread_t *a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v8 = 0;
  sched_param v7 = 0;
  pthread_getschedparam(a1, &v8, &v7);
  v7.sched_priority = a2;
  int v4 = pthread_setschedparam(a1, v8, &v7);
  if (v4)
  {
    uint64_t v5 = BSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = BSPthreadGetName(a1);
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = "BSPthreadSetFixedPriority";
      __int16 v11 = 1024;
      int v12 = v4;
      __int16 v13 = 1024;
      int v14 = a2;
      __int16 v15 = 2114;
      uint64_t v16 = v6;
      _os_log_error_impl(&dword_18AAA8000, v5, OS_LOG_TYPE_ERROR, "%s Error %d setting priority %d for thread: %{public}@", buf, 0x22u);
    }
  }
  BSPthreadFixPriority(a1);
}

void sub_18AB29D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSPthreadGetName(_opaque_pthread_t *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  pthread_getname_np(a1, (char *)v3, 0x80uLL);
  thread_act_t v1 = [NSString stringWithUTF8String:v3];
  return v1;
}

void BSPthreadAttrSetFixedPriority(pthread_attr_t *a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  sched_param v7 = 0;
  pthread_attr_getschedparam(a1, &v7);
  v7.sched_priority = a2;
  int v4 = pthread_attr_setschedparam(a1, &v7);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = BSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      int v9 = "BSPthreadAttrSetFixedPriority";
      __int16 v10 = 1024;
      int v11 = v5;
      __int16 v12 = 1024;
      int v13 = a2;
      __int16 v14 = 2048;
      __int16 v15 = a1;
      _os_log_error_impl(&dword_18AAA8000, v6, OS_LOG_TYPE_ERROR, "%s Error %d setting priority %d for attributes: %p", buf, 0x22u);
    }
  }
}

uint64_t BSPthreadGetCurrentPriority()
{
  id v0 = pthread_self();
  sched_param v3 = 0;
  int v2 = 0;
  pthread_getschedparam(v0, &v2, &v3);
  return v3.sched_priority;
}

uint64_t BSPthreadGetPriority(_opaque_pthread_t *a1)
{
  sched_param v3 = 0;
  int v2 = 0;
  pthread_getschedparam(a1, &v2, &v3);
  return v3.sched_priority;
}

void BSPthreadSetName(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (!pthread_main_np())
  {
    id v3 = v2;
    if (pthread_setname_np((const char *)[v3 UTF8String]))
    {
      int v4 = BSLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136315394;
        uint64_t v6 = "BSPthreadSetName";
        __int16 v7 = 2114;
        id v8 = v3;
        _os_log_error_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_ERROR, "%s Unable to set pthread name: %{public}@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

void sub_18AB2A098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2A1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB2A248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2A480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2A530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2A5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2A790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2AA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2AAF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2AB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2ABE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __BSBlockSentinelFireFailureHandler_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[BSBlockSentinelSignalContext failureContext]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void sub_18AB2AC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id BSDeviceOrientationDescription(unint64_t a1)
{
  if (a1 > 6) {
    uint64_t v1 = @"INVALID";
  }
  else {
    uint64_t v1 = off_1E5446470[a1];
  }
  id v2 = [NSString stringWithFormat:@"%@ (%li)", v1, a1];
  return v2;
}

BOOL BSInterfaceOrientationIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 4;
}

BOOL BSInterfaceOrientationIsPortrait(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL BSInterfaceOrientationMaskContainsInterfaceOrientation(unint64_t a1, char a2)
{
  return ((1 << a2) & a1) != 0;
}

__CFString *BSOrientationRotationDirectionDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%li)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E54464D0[a1];
  }
  return v1;
}

id _BSSafeCast(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    if (objc_opt_isKindOfClass()) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void sub_18AB2ADDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2AF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2B494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2B750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  objc_destroyWeak(v19);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v20 - 104));
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_18AB2BA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2BAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2BC9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2C0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2C160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2C1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2C300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSDispatchTimerTimeRemainingForFireTimeWithRepeat(dispatch_time_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1 == -1) {
    return INFINITY;
  }
  if (!dispatch_time_to_nsec())
  {
    uint64_t v9 = BSLogTimer();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_14:

      return 0.0;
    }
    *(_DWORD *)buf = 134217984;
    dispatch_time_t v15 = a1;
    __int16 v10 = "fireTime couldn't be decomposed to nanoseconds : orig=%llu";
    int v11 = v9;
    uint32_t v12 = 12;
LABEL_21:
    _os_log_debug_impl(&dword_18AAA8000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    goto LABEL_14;
  }
  if (!dispatch_time_to_nsec())
  {
    uint64_t v9 = BSLogTimer();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 134218240;
    dispatch_time_t v15 = a1;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v10 = "next fireTime couldn't be decomposed to nanoseconds : orig=%llu now=%llu";
    int v11 = v9;
    uint32_t v12 = 22;
    goto LABEL_21;
  }
  if (a2)
  {
    if (a3 < 1) {
      return 0.0;
    }
    if ((unint64_t)(a3 * a2) <= 0x7FFFFFFFFFFFFFFELL)
    {
      dispatch_time_t v6 = dispatch_time(a1, a3 * a2);
      if (v6 != -1)
      {
        dispatch_time_t v7 = v6;
        if (dispatch_time_to_nsec()) {
          return 0.0;
        }
        int v13 = BSLogTimer();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134219008;
          dispatch_time_t v15 = a1;
          __int16 v16 = 2048;
          uint64_t v17 = 0;
          __int16 v18 = 2048;
          uint64_t v19 = a2;
          __int16 v20 = 2048;
          uint64_t v21 = a3;
          __int16 v22 = 2048;
          dispatch_time_t v23 = v7;
          _os_log_debug_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_DEBUG, "next fireTime couldn't be decomposed to nanoseconds : orig=%llu now=%lluns repeat=%llux%lluns next=%llu", buf, 0x34u);
        }

        return 0.0;
      }
    }
    return INFINITY;
  }
  return 0.0;
}

void sub_18AB2C8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2CA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB2CEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2CF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2D03C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _wrapRunLoopWithAutoreleasePoolHandler(int a1, uint64_t a2, CFArrayRef theArray)
{
  if (a2 == 1) {
    goto LABEL_6;
  }
  if (a2 == 128 || a2 == 32)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count <= 0) {
      __assert_rtn("_wrapRunLoopWithAutoreleasePoolHandler", "BSMIGServer.m", 33, "count > 0");
    }
    CFIndex v6 = Count - 1;
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, Count - 1);
    MEMORY[0x18C124830](ValueAtIndex);
    CFArrayRemoveValueAtIndex(theArray, v6);
    if (a2 == 32)
    {
LABEL_6:
      id v8 = (const void *)MEMORY[0x18C124850](0);
      CFArrayAppendValue(theArray, v8);
    }
  }
}

void sub_18AB2D214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2D2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2D4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2D560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2D7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2DEDC(_Unwind_Exception *exception_object)
{
}

void sub_18AB2DFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2E690(_Unwind_Exception *exception_object)
{
}

void sub_18AB2E7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB2E9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB2FA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB30330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB309FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB311A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB31734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB31DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB32414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB32A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB330E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = OSAnalyticsLibrary();
  uint64_t result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_28 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OSAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OSAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getWriteStackshotReportWithPIDSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = OSAnalyticsLibrary();
  uint64_t result = dlsym(v2, "WriteStackshotReportWithPID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB21B2A0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AB33620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_18AB3374C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB337C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3385C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB33978(_Unwind_Exception *a1)
{
  CFIndex v6 = v4;

  _Unwind_Resume(a1);
}

void sub_18AB33B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  uint64_t v26 = v23;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_18AB33D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB33EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB33F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB340C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_18AB3419C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_18AB345E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB347F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB34AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB34CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB34F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3511C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBSDescriptionCollectionLineBreak(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5446A78[a1];
  }
  return v1;
}

__CFString *NSStringFromBSDescriptionVerbosity(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5446A98[a1];
  }
  return v1;
}

__CFString *NSStringFromBSDescriptionLineTruncation(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5446AE0[a1];
  }
  return v1;
}

__CFString *NSStringFromBSDescriptionDebugging(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5446B08[a1];
  }
  return v1;
}

__CFString *NSStringFromBSDescriptionItemSeparator(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5446B20[a1];
  }
  return v1;
}

id _BSDefaultCollectionLineBreakStyle()
{
  if (qword_1EB21B2E0 != -1) {
    dispatch_once(&qword_1EB21B2E0, &__block_literal_global_52);
  }
  id v0 = (void *)qword_1EB21B2D8;
  return v0;
}

void sub_18AB355F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3586C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB35998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB35C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _BSCreateObjectOfClassFromData(objc_class *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 length];
    id v5 = 0;
    if (a1 && v4)
    {
      CFIndex v6 = (void *)MEMORY[0x18C125360]();
      id v16 = 0;
      dispatch_time_t v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:v3 error:&v16];
      id v8 = v16;
      if (v8)
      {
        uint64_t v9 = BSLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint32_t v12 = NSStringFromClass(a1);
          *(_DWORD *)buf = 138543618;
          id v18 = v12;
          __int16 v19 = 2114;
          id v20 = v8;
          _os_log_error_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_ERROR, "Error during decoding of data to type=%{public}@: %{public}@", buf, 0x16u);
        }
      }
      if (v7)
      {
        if (objc_opt_isKindOfClass())
        {
          id v5 = v7;
LABEL_17:

          goto LABEL_18;
        }
        if (!v8)
        {
          __int16 v10 = BSLogCommon();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            NSStringFromClass(a1);
            id v13 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v14 = (objc_class *)objc_opt_class();
            dispatch_time_t v15 = NSStringFromClass(v14);
            *(_DWORD *)buf = 138543618;
            id v18 = v13;
            __int16 v19 = 2114;
            id v20 = v15;
            _os_log_error_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_ERROR, "Error during decoding of data to type=%{public}@: decoded %{public}@ instead but unarchiver didn't filter it", buf, 0x16u);
          }
        }
      }
      id v5 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    id v5 = 0;
  }
LABEL_18:

  return v5;
}

void sub_18AB35FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSSecureDecodeOfTypes(void *a1, void *a2)
{
  id v2 = _BSCreateObjectOfClassesFromData(a2, a1);
  return v2;
}

void sub_18AB360D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3613C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB36244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB36530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB36688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3674C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB36940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB36A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSEqualDoubles(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.00000011920929;
}

uint64_t BSCompareSizes(double a1, double a2, double a3, double a4)
{
  double v4 = vabdd_f64(a1, a3);
  double v5 = vabdd_f64(a2, a4);
  BOOL v6 = a2 < a4 && a1 < a3;
  uint64_t v7 = -1;
  if (!v6) {
    uint64_t v7 = 1;
  }
  if (v5 < 2.22044605e-16 && v4 < 2.22044605e-16) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t BSCompareBuildVersions(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v8 = [v5 rangeOfCharacterFromSet:v7];
  uint64_t v10 = v9;

  int v11 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v12 = [v6 rangeOfCharacterFromSet:v11];
  uint64_t v14 = v13;

  dispatch_time_t v15 = [v5 substringToIndex:v8];
  id v16 = [v6 substringToIndex:v12];
  uint64_t v17 = [v15 integerValue];
  uint64_t v18 = [v16 integerValue];
  if (v17 < v18) {
    uint64_t v19 = -1;
  }
  else {
    uint64_t v19 = v17 > v18;
  }
  if (!v19)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      uint64_t v19 = 0;
    }
    else
    {
      char v27 = objc_msgSend(v5, "substringWithRange:", v8, v10);
      uint64_t v26 = objc_msgSend(v6, "substringWithRange:", v12, v14);
      uint64_t v20 = [v27 localizedCaseInsensitiveCompare:v26];
      uint64_t v19 = v20;
      if (a3 == 2 && !v20)
      {
        uint64_t v21 = [v5 substringFromIndex:v8 + v10];
        uint64_t v22 = [v21 integerValue];
        dispatch_time_t v23 = [v6 substringFromIndex:v12 + v14];
        uint64_t v24 = [v23 integerValue];
        if (v22 < v24) {
          uint64_t v19 = -1;
        }
        else {
          uint64_t v19 = v22 > v24;
        }
      }
    }
  }

  return v19;
}

void sub_18AB36CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB36DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB36E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB36ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB36F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSSizeSwap(double a1, double a2)
{
  return a2;
}

__n128 BSIntegralTransform@<Q0>(float64x2_t *a1@<X0>, uint64_t a2@<X8>)
{
  float64x2_t v2 = vrndaq_f64(a1[1]);
  *a1 = vrndaq_f64(*a1);
  a1[1] = v2;
  float64x2_t v3 = a1[1];
  a1[2] = vrndaq_f64(a1[2]);
  *(float64x2_t *)a2 = *a1;
  *(float64x2_t *)(a2 + 16) = v3;
  __n128 result = (__n128)a1[2];
  *(__n128 *)(a2 + 32) = result;
  return result;
}

double _BSRectTransformByTransformingCorners(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v12[0] = a2;
  v12[1] = a3;
  double v13 = a2;
  double v14 = a3 + a5;
  double v15 = a2 + a4;
  double v16 = a3 + a5;
  double v17 = a2 + a4;
  double v18 = a3;
  do
  {
    uint64_t v7 = &v12[v6];
    double *v7 = (*(double (**)(uint64_t, double, double))(a1 + 16))(a1, v12[v6], v12[v6 + 1]);
    *((void *)v7 + 1) = v8;
    v6 += 2;
  }
  while (v6 != 8);
  if (v15 >= v17) {
    double v9 = v17;
  }
  else {
    double v9 = v15;
  }
  if (v12[0] >= v13) {
    double v10 = v13;
  }
  else {
    double v10 = v12[0];
  }
  if (v10 >= v9) {
    return v9;
  }
  else {
    return v10;
  }
}

double BSConvertPointFromOrientationToOrientation(uint64_t a1, uint64_t a2, double result, double a4, double a5, double a6)
{
  if (a1 != a2)
  {
    double v6 = a5 - result;
    double v7 = a6 - a4;
    double v8 = a5 - a4;
    if (a1 == 4) {
      double v9 = a4;
    }
    else {
      double v9 = result;
    }
    if (a1 == 4) {
      a4 = a6 - result;
    }
    if (a1 != 3)
    {
      double v8 = v9;
      __n128 result = a4;
    }
    if (a1 == 2) {
      double v10 = v6;
    }
    else {
      double v10 = v8;
    }
    if (a1 == 2) {
      double v11 = v7;
    }
    else {
      double v11 = result;
    }
    switch(a2)
    {
      case 2:
        return a5 - v10;
      case 3:
        return v11;
      case 4:
        return a6 - v11;
      default:
        return v10;
    }
  }
  return result;
}

double BSConvertRectFromOrientationToOrientation(uint64_t a1, uint64_t a2, double result, double a4, double a5, double a6, double a7, double a8)
{
  if (a1 != a2)
  {
    v10[8] = v8;
    v10[9] = v9;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __BSConvertRectFromOrientationToOrientation_block_invoke;
    _OWORD v10[3] = &__block_descriptor_64_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
    *(double *)&v10[4] = a7;
    *(double *)&v10[5] = a8;
    v10[6] = a1;
    v10[7] = a2;
    return _BSRectTransformByTransformingCorners((uint64_t)v10, result, a4, a5, a6);
  }
  return result;
}

double __BSConvertRectFromOrientationToOrientation_block_invoke(uint64_t a1, double a2, double a3)
{
  return BSConvertPointFromOrientationToOrientation(*(void *)(a1 + 48), *(void *)(a1 + 56), a2, a3, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

double BSRadiansFromAffineTransform(long double *a1)
{
  return atan2(a1[1], *a1);
}

uint64_t BSValueWithPoint()
{
  return objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:");
}

uint64_t BSValueWithSize()
{
  return objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGSize:");
}

uint64_t BSValueWithRect()
{
  return objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:");
}

id BSValueWithAffineTransform(_OWORD *a1)
{
  long long v1 = a1[1];
  v4[0] = *a1;
  v4[1] = v1;
  v4[2] = a1[2];
  float64x2_t v2 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGAffineTransform:", v4);
  return v2;
}

void BSAffineTransformFromValue(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bs_CGAffineTransformValue");
  }
  else
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
}

void sub_18AB372DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t BSNSStringFromCGPoint(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
}

uint64_t BSNSStringFromCGVector(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
}

uint64_t BSNSStringFromCGSize(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
}

uint64_t BSNSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"{{%.*g, %.*g}, {%.*g, %.*g}}", 17, *(void *)&a1, 17, *(void *)&a2, 17, *(void *)&a3, 17, *(void *)&a4];
}

uint64_t BSNSStringFromCGAffineTransform(void *a1)
{
  return [NSString stringWithFormat:@"[%.*g, %.*g, %.*g, %.*g, %.*g, %.*g]", 17, *a1, 17, a1[1], 17, a1[2], 17, a1[3], 17, a1[4], 17, a1[5]];
}

CFTypeRef BSCopyDeviceTreeProperty(char *path, const __CFString *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], path);
  if (!v3) {
    return 0;
  }
  io_object_t v4 = v3;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, a2, 0, 0);
  IOObjectRelease(v4);
  return CFProperty;
}

void __BSGetDeviceType_block_invoke()
{
  CFDataRef v0 = (const __CFData *)BSCopyDeviceTreeProperty("IODeviceTree:/", @"model");
  if (v0)
  {
    CFDataRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      BytePtr = CFDataGetBytePtr(v1);
      CFIndex Length = CFDataGetLength(v1);
      CFStringRef v6 = CFStringCreateWithBytes(v3, BytePtr, Length, 0x8000100u, 0);
      if (v6)
      {
        CFStringRef v7 = v6;
        uint64_t v8 = 0;
        while (!CFStringHasPrefix(v7, __DeviceTypePrefixes[v8]))
        {
          if (++v8 == 4) {
            goto LABEL_10;
          }
        }
        BSGetDeviceType___DeviceType = v8;
LABEL_10:
        CFRelease(v7);
      }
    }
    CFRelease(v1);
  }
}

void sub_18AB3769C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB37750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void vmDeallocateCallback()
{
}

void sub_18AB37828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _bs_set_crash_log_message(uint64_t result)
{
  qword_1E911F420 = result;
  return result;
}

void sub_18AB378D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB37960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB379D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB37A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB37AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB37BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB37C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB37DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSLogStateCaptureMaximumDataSize()
{
  return 32568;
}

BOOL BSLogStateCaptureCheckPlistSizeIsPermitted(void *a1)
{
  uint64_t v3 = 0;
  id v1 = BSLogStateCaptureEncodePlist(a1, 0, &v3);
  return v3 == 0;
}

id BSLogGetAllRegisteredStateCaptureBlocks()
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_32);
  CFDataRef v0 = [(id)qword_1EB21B350 allValues];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_32);
  return v0;
}

void sub_18AB38088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3832C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AB3864C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB38714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB388AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB38A50(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_18AB38BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AB38CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB38DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB38E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB38F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB38FAC(_Unwind_Exception *a1)
{
  io_object_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AB3907C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB390DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB39160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB392F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB393F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB394D8(_Unwind_Exception *a1)
{
  io_object_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AB3958C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB39678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB39760(_Unwind_Exception *a1)
{
  io_object_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_18AB397F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB39860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB398E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3993C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB399B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __BSAuditHistoryItemClasses_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = v2;
}

uint64_t BSProtobufValidateIncomingTag(uint64_t result, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2 < 1)
  {
    CFStringRef v6 = @"tag must be > 0";
    goto LABEL_15;
  }
  if ((unint64_t)(a2 - 19000) < 0x3E8)
  {
    CFStringRef v6 = @"tag must not be between 19000 and 19999, inclusive";
    goto LABEL_15;
  }
  if ((unint64_t)a2 >> 29)
  {
    CFStringRef v6 = @"tag must be <= ((2^29) - 1)";
LABEL_15:
    CFStringRef v7 = (void *)[NSString stringWithFormat:@"%@", v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSProtobufValidateIncomingTag(BSProtobufSchema *, NSInteger)");
      __int16 v10 = 2114;
      double v11 = @"BSProtobufSerialization.m";
      __int16 v12 = 1024;
      int v13 = 382;
      __int16 v14 = 2114;
      double v15 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AB39EB8);
  }
  uint64_t v2 = *(void *)(result + 24);
  if (v2 >= 1)
  {
    uint64_t v3 = *(int **)(result + 40);
    do
    {
      int v4 = *v3;
      v3 += 24;
      if (v4 == a2)
      {
        id v5 = objc_msgSend(NSString, "stringWithFormat:", @"cannot add duplicate tag %d", a2);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void BSProtobufValidateIncomingTag(BSProtobufSchema *, NSInteger)");
          __int16 v10 = 2114;
          double v11 = @"BSProtobufSerialization.m";
          __int16 v12 = 1024;
          int v13 = 387;
          __int16 v14 = 2114;
          double v15 = v5;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
        }
        qword_1E911F420 = [v5 UTF8String];
        __break(0);
        JUMPOUT(0x18AB39DDCLL);
      }
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t _BSProtobufEncodeData(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3) {
    PBDataWriterWriteDataField();
  }
  return 1;
}

uint64_t _BSProtobufDecodeData(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = (id)PBReaderReadData();
  return 1;
}

uint64_t _BSProtobufEncodeRepeatFieldString(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        PBDataWriterWriteStringField();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return 1;
}

uint64_t _BSProtobufDecodeRepeatFieldString(uint64_t a1, uint64_t a2, id *a3)
{
  id v3 = *a3;
  if (!*a3)
  {
    id v3 = objc_alloc_init(*(Class *)(a2 + 40));
    *a3 = v3;
  }
  id v5 = (id)PBReaderReadString();
  if (v5)
  {
    uint64_t v6 = v5;
    [v3 addObject:v5];
  }
  return 1;
}

void sub_18AB3ADDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3AEA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3B058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3B194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3B23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3B2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3B40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3B46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)BSProcessDeathWatcher;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB3B6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3B754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v10 = v9;

  a9.super_class = (Class)BSDateFormatterCache;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_18AB3B864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18AB3B93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3BABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3BB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3BC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3BD30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3BDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3BEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3BF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3C950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3CA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3CCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18AB3CDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3CEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3D02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3D0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3D1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3D2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB3D6F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3D82C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18AB3D8FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_18AB3D980(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AB3DBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_18AB3DDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3DE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3DFC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3E040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3E798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3EC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3ECAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3ED40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3EE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3EF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3EFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v13 = v12;

  _Unwind_Resume(a1);
}

void sub_18AB3F5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F79C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3F9D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3FA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3FAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3FB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_18AB3FBE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3FD24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3FF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB3FFD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB400BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB40134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB401B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB40254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB403E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB404E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB40688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB40838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB40974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB40BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB40D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB40E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_18AB40E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB41230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB41948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB41C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB41E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AB41F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB4256C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_18AB426A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB427AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB428BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB42938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB429C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB42A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB42AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB42BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL BSSettingFlagIsExplicitNo(uint64_t a1)
{
  return a1 == 0;
}

__CFString *BSSettingFlagDescription(uint64_t a1)
{
  uint64_t v1 = @"Yes";
  if (!a1) {
    uint64_t v1 = @"No";
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    return @"NotSet";
  }
  else {
    return v1;
  }
}

void sub_18AB42D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_18AB42DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB42E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB42F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB430D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB4325C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_18AB4333C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BSPIDIsExiting(int a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1 < 1) {
    return 0;
  }
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  BOOL v1 = _BSShortBSDProcessInfoForPID(a1, v3);
  return *(_DWORD *)&v1 & ((v4 & 4) >> 2);
}

uint64_t BSPIDIsExtension()
{
  id v0 = (void *)launch_copy_properties_for_pid_4assertiond();
  BOOL v1 = v0;
  if (v0)
  {
    LODWORD(v2) = xpc_dictionary_get_BOOL(v0, (const char *)*MEMORY[0x1E4F14938]);
    if (xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E4F14928])) {
      uint64_t v2 = v2;
    }
    else {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_18AB43430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id BSProcessDescriptionForAuditToken(_OWORD *a1)
{
  uint64_t v1 = BSPIDForAuditToken(a1);
  return BSProcessDescriptionForPID(v1);
}

void sub_18AB434C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSMachPortIsUsable(mach_port_name_t a1)
{
  return BSMachPortIsType(a1, 458752);
}

void _BSMachError(int a1, mach_error_t a2, void *a3)
{
  *(void *)&v16[13] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = BSLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (a1)
  {
    if (v7)
    {
      int v11 = 136447234;
      long long v12 = "_BSMachError";
      __int16 v13 = 1024;
      *(_DWORD *)uint64_t v14 = a1;
      *(_WORD *)&v14[4] = 2082;
      *(void *)&v14[6] = mach_error_string(a2);
      __int16 v15 = 1024;
      *(_DWORD *)uint64_t v16 = a2;
      v16[2] = 2114;
      *(void *)&v16[3] = v5;
      uint64_t v8 = "%{public}s: port %x; %{public}s (0x%x) \"%{public}@\"";
      long long v9 = v6;
      uint32_t v10 = 44;
LABEL_10:
      _os_log_error_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    int v11 = 136315906;
    long long v12 = "_BSMachError";
    __int16 v13 = 2080;
    *(void *)uint64_t v14 = mach_error_string(a2);
    *(_WORD *)&v14[8] = 1024;
    *(_DWORD *)&v14[10] = a2;
    __int16 v15 = 2114;
    *(void *)uint64_t v16 = v5;
    uint64_t v8 = "%s: %s (0x%x) \"%{public}@\"";
    long long v9 = v6;
    uint32_t v10 = 38;
    goto LABEL_10;
  }

  if ((a1 - 1) < 0xFFFFFFFE || a2 != 15) {
    _os_assumes_log();
  }
}

void sub_18AB43660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BSMachReceiveRightRelease(mach_port_name_t name)
{
  int v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    mach_error_t v2 = mach_port_mod_refs(*MEMORY[0x1E4F14960], name, 1u, -1);
    if (v2)
    {
      _BSMachError(v1, v2, @"Unable to release receive right (modrefs -1)");
      int v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

BOOL BSMachCreateSendRight(mach_port_name_t name)
{
  int v1 = name;
  if (name - 1 <= 0xFFFFFFFD)
  {
    mach_error_t inserted = mach_port_insert_right(*MEMORY[0x1E4F14960], name, name, 0x14u);
    if (inserted)
    {
      _BSMachError(v1, inserted, @"Unable to create send right");
      int v1 = 0;
    }
  }
  return (v1 - 1) < 0xFFFFFFFE;
}

double BSFloatCeilForScale(double a1, double a2)
{
  double v4 = fabs(a2);
  if (a2 <= 0.0 || v4 < 2.22044605e-16)
  {
    BOOL v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v4);
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat BSFloatCeilForScale(CGFloat, CGFloat)");
    [v7 handleFailureInFunction:v8 file:@"BSMath.m" lineNumber:70 description:@"Scale must be specified and cannot be less than or equal to 0."];
  }
  return ceil(a1 * a2) / a2;
}

void sub_18AB4381C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double BSFloatPowerOf2Ceil(double a1)
{
  double result = 0.0;
  if (a1 > 0.0)
  {
    uint64_t v3 = vcvtpd_u64_f64(a1);
    if ((v3 & (v3 - 1)) != 0)
    {
      do
      {
        uint64_t v4 = v3;
        v3 &= v3 - 1;
      }
      while (v3);
      uint64_t v3 = 2 * v4;
    }
    return (double)(unint64_t)v3;
  }
  return result;
}

double BSCGFloatEpsilon()
{
  return 2.22044605e-16;
}

double BSPointRoundForScale(double a1, double a2, double a3)
{
  double v5 = BSFloatRoundForScale(a1, a3);
  BSFloatRoundForScale(a2, a3);
  return v5;
}

double BSPointByLinearlyInterpolatingPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

BOOL BSSizeLessThanSize(double a1, double a2, double a3, double a4)
{
  return a2 < a4 && a1 < a3;
}

uint64_t BSSizeGreaterThanOrEqualToSize(double a1, double a2, double a3, double a4)
{
  double v4 = vabdd_f64(a1, a3);
  if (a1 <= a3 && v4 >= 2.22044605e-16) {
    return 0;
  }
  BOOL v6 = vabdd_f64(a2, a4) < 2.22044605e-16;
  return a2 > a4 || v6;
}

double BSSizeCeilForScale(double a1, double a2, double a3)
{
  double v5 = BSFloatCeilForScale(a1, a3);
  BSFloatCeilForScale(a2, a3);
  return v5;
}

double BSRectCenteredAboutPoint(double a1, double a2, double a3, double a4, double a5)
{
  return a5 - a3 * 0.5;
}

double BSRectByLinearlyInterpolatingRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

uint64_t BSIntervalOrder(double *a1)
{
  double v1 = a1[2];
  double v2 = vabdd_f64(*a1, v1);
  uint64_t v3 = -1;
  if (*a1 >= v1) {
    uint64_t v3 = 1;
  }
  if (v2 >= 2.22044605e-16) {
    return v3;
  }
  else {
    return 0;
  }
}

void BSIntervalFractionForValue(double *a1, double a2)
{
  if (vabdd_f64(a1[2], *a1) >= 2.22044605e-16)
  {
    long long v2 = *((_OWORD *)a1 + 1);
    v3[0] = *(_OWORD *)a1;
    v3[1] = v2;
    BSIntervalClip((double *)v3, a2);
  }
}

double BSIntervalClip(double *a1, double result)
{
  double v2 = *(double *)&v13;
  double v3 = *(double *)&v14;
  double v4 = vabdd_f64(*(double *)&v13, *(double *)&v14);
  uint64_t v5 = -1;
  if (*(double *)&v13 >= *(double *)&v14) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v4 >= 2.22044605e-16) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = &v13;
    if (v7 == -1)
    {
      uint64_t v8 = &v14;
      double v2 = *(double *)&v14;
    }
    double v3 = v2 + -2.22044605e-16;
    if (*((unsigned char *)v8 + 8)) {
      double v3 = v2;
    }
  }
  double v9 = *a1;
  double v10 = a1[2];
  double v11 = vabdd_f64(*a1, v10);
  if (*a1 >= v10) {
    uint64_t v5 = 1;
  }
  if (v11 < 2.22044605e-16) {
    uint64_t v5 = 0;
  }
  if (v5 == -1)
  {
    long long v12 = a1 + 1;
  }
  else
  {
    if (!v5) {
      goto LABEL_22;
    }
    long long v12 = a1 + 3;
    double v9 = a1[2];
  }
  if ((*v12 & 1) == 0) {
    double v9 = v9 + 2.22044605e-16;
  }
LABEL_22:
  if (v9 >= result) {
    double result = v9;
  }
  if (v3 <= result) {
    return v3;
  }
  return result;
}

double BSIntervalValueForFraction(double *a1, double a2)
{
  double v2 = a1[2];
  double result = *a1 + (v2 - *a1) * a2;
  if (vabdd_f64(v2, *a1) < 2.22044605e-16) {
    return a1[2];
  }
  return result;
}

double BSIntervalMin(double *a1)
{
  double result = *a1;
  double v2 = a1[2];
  double v3 = vabdd_f64(*a1, v2);
  uint64_t v4 = -1;
  if (*a1 >= v2) {
    uint64_t v4 = 1;
  }
  if (v3 < 2.22044605e-16) {
    uint64_t v4 = 0;
  }
  if (v4 == -1)
  {
    uint64_t v5 = a1 + 1;
  }
  else
  {
    if (!v4) {
      return result;
    }
    uint64_t v5 = a1 + 3;
    double result = a1[2];
  }
  if ((*v5 & 1) == 0) {
    return result + 2.22044605e-16;
  }
  return result;
}

double BSIntervalMax(uint64_t a1)
{
  double v1 = *(double *)a1;
  double result = *(double *)(a1 + 16);
  double v3 = vabdd_f64(*(double *)a1, result);
  uint64_t v4 = -1;
  if (*(double *)a1 >= result) {
    uint64_t v4 = 1;
  }
  if (v3 < 2.22044605e-16) {
    uint64_t v4 = 0;
  }
  if (v4)
  {
    if (v4 == -1)
    {
      double v1 = *(double *)(a1 + 16);
      a1 += 16;
    }
    double result = v1 + -2.22044605e-16;
    if (*(unsigned char *)(a1 + 8)) {
      return v1;
    }
  }
  return result;
}

double BSIntervalSubIntervalFractionForValue(_OWORD *a1, double *a2, double a3)
{
  long long v4 = a1[1];
  v10[0] = *a1;
  v10[1] = v4;
  BSIntervalFractionForValue((double *)v10, a3);
  long long v7 = 0u;
  uint64_t v8 = 0x3FF0000000000000;
  BYTE8(v7) = 1;
  uint64_t v9 = 1;
  return BSIntervalClip((double *)&v7, (v5 - *a2) / (a2[2] - *a2));
}

double BSIntervalSubIntervalValueForValue(_OWORD *a1, _OWORD *a2, double *a3, double a4)
{
  long long v5 = a1[1];
  v11[0] = *a1;
  v11[1] = v5;
  long long v6 = a2[1];
  v10[0] = *a2;
  v10[1] = v6;
  double v7 = BSIntervalSubIntervalFractionForValue(v11, (double *)v10, a4);
  double v8 = a3[2];
  double result = *a3 + (v8 - *a3) * v7;
  if (vabdd_f64(v8, *a3) < 2.22044605e-16) {
    return a3[2];
  }
  return result;
}

double BSIntervalInterpolate(_OWORD *a1, void *a2, double a3)
{
  id v5 = a2;
  long long v6 = v5;
  if (v5)
  {
    double v7 = (double (*)(id, _OWORD *, double))*((void *)v5 + 2);
    long long v8 = a1[1];
    v10[0] = *a1;
    v10[1] = v8;
    a3 = v7(v5, v10, a3);
  }

  return a3;
}

void sub_18AB43D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NSStringFromInterval(uint64_t a1)
{
  double v1 = @"[";
  if (!*(unsigned char *)(a1 + 8)) {
    double v1 = CFSTR("(");
  }
  if (*(unsigned char *)(a1 + 24)) {
    double v2 = @"]";
  }
  else {
    double v2 = @"");
  }
  return [NSString stringWithFormat:@"<BSInterval: %@%.2f, %.2f%@>", v1, *(void *)a1, *(void *)(a1 + 16), v2];
}

double BSIntervalMap(long long *a1, long long *a2, double a3)
{
  double v3 = *(double *)a1;
  char v4 = *((unsigned char *)a1 + 8);
  double v5 = *((double *)a1 + 2);
  char v6 = *((unsigned char *)a1 + 24);
  double v7 = vabdd_f64(*(double *)a1, v5);
  uint64_t v8 = -1;
  if (*(double *)a1 >= v5) {
    uint64_t v8 = 1;
  }
  if (v7 < 2.22044605e-16) {
    uint64_t v8 = 0;
  }
  double v9 = *(double *)a1;
  char v10 = *((unsigned char *)a1 + 8);
  if (v8 != -1)
  {
    double v9 = *(double *)a1;
    if (!v8) {
      goto LABEL_10;
    }
    double v9 = *((double *)a1 + 2);
    char v10 = *((unsigned char *)a1 + 24);
  }
  if ((v10 & 1) == 0) {
    double v9 = v9 + 2.22044605e-16;
  }
LABEL_10:
  long long v11 = a2[1];
  long long v34 = *a2;
  long long v35 = v11;
  double v12 = *(double *)&v34;
  double v13 = *(double *)&v35;
  double v14 = vabdd_f64(*(double *)&v34, *(double *)&v35);
  uint64_t v15 = -1;
  if (*(double *)&v34 >= *(double *)&v35) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = -1;
  }
  if (v14 >= 2.22044605e-16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v17)
  {
    double v18 = &v34;
    if (v17 == -1)
    {
      double v18 = &v35;
      double v12 = *(double *)&v35;
    }
    double v13 = v12 + -2.22044605e-16;
    if (*((unsigned char *)v18 + 8)) {
      double v13 = v12;
    }
  }
  double v19 = *(double *)a2;
  char v20 = *((unsigned char *)a2 + 8);
  double v21 = *((double *)a2 + 2);
  char v22 = *((unsigned char *)a2 + 24);
  double v23 = vabdd_f64(*(double *)a2, v21);
  if (*(double *)a2 >= v21) {
    uint64_t v15 = 1;
  }
  if (v23 < 2.22044605e-16) {
    uint64_t v15 = 0;
  }
  double v24 = *(double *)a2;
  char v25 = *((unsigned char *)a2 + 8);
  if (v15 != -1)
  {
    double v24 = *(double *)a2;
    if (!v15) {
      goto LABEL_30;
    }
    double v24 = *((double *)a2 + 2);
    char v25 = *((unsigned char *)a2 + 24);
  }
  if ((v25 & 1) == 0) {
    double v24 = v24 + 2.22044605e-16;
  }
LABEL_30:
  long long v26 = a1[1];
  long long v34 = *a1;
  long long v35 = v26;
  double v27 = *(double *)&v34;
  double v28 = *(double *)&v35;
  double v29 = vabdd_f64(*(double *)&v34, *(double *)&v35);
  uint64_t v30 = -1;
  if (*(double *)&v34 >= *(double *)&v35) {
    uint64_t v30 = 1;
  }
  if (v29 >= 2.22044605e-16) {
    uint64_t v31 = v30;
  }
  else {
    uint64_t v31 = 0;
  }
  if (v31)
  {
    uint64_t v32 = &v34;
    if (v31 == -1)
    {
      uint64_t v32 = &v35;
      double v27 = *(double *)&v35;
    }
    double v28 = v27 + -2.22044605e-16;
    if (*((unsigned char *)v32 + 8)) {
      double v28 = v27;
    }
  }
  if (v8 == -1)
  {
    double v5 = v3;
    char v6 = v4;
  }
  else if (!v8)
  {
    goto LABEL_46;
  }
  double v3 = v5 + 2.22044605e-16;
  if (v6) {
    double v3 = v5;
  }
LABEL_46:
  if (v15 == -1)
  {
    double v21 = v19;
    char v22 = v20;
  }
  else if (!v15)
  {
    return (a3 - v9) * (v13 - v24) / (v28 - v3) + v19;
  }
  if (v22) {
    double v19 = v21;
  }
  else {
    double v19 = v21 + 2.22044605e-16;
  }
  return (a3 - v9) * (v13 - v24) / (v28 - v3) + v19;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7470](bundle);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7478](url);
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7480](bundleURL);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x1F40D74E8](bundle, resourceType, subDirName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFDictionaryRef CFBundleGetLocalInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7588](bundle);
}

Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle)
{
  return MEMORY[0x1F40D75E0](bundle);
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x1F40D7670](calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1F40D7678](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x1F40D7680]();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

Boolean CFCalendarGetTimeRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit, CFAbsoluteTime at, CFAbsoluteTime *startp, CFTimeInterval *tip)
{
  return MEMORY[0x1F40D76C8](calendar, unit, startp, tip, at);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  return MEMORY[0x1F40D8080](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E86A0](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x1F40E92D8](property, value);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1F40E9388]();
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x1F40E94A0](property);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1F417CDF8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FE0](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSUInteger NSCountHashTable(NSHashTable *table)
{
  return MEMORY[0x1F40E7038](table);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1F40E70B0](retstr, table);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1F40E70E8](table, pointer);
}

void *__cdecl NSHashInsertIfAbsent(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1F40E70F8](table, pointer);
}

void NSHashRemove(NSHashTable *table, const void *pointer)
{
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1F40E7198](table, key, originalKey, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1F40E71B0](enumerator, key, value);
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1F40E71E0]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1F40E71E8](namestr);
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1F40E71F0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1F40F7180](task);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFPreferencesHasAppValue()
{
  return MEMORY[0x1F40D8F80]();
}

uint64_t _CFRunLoopSetPerCalloutAutoreleasepoolEnabled()
{
  return MEMORY[0x1F40D90C0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSOrderedSet()
{
  return MEMORY[0x1F40D94D0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1F40D94D8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1F40C9E70]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40C9F98]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
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

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x1F41814B8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2B8](atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2C8](atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2D0](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2D8](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2F0](atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2F8](atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E300](atoken);
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1F40CA540]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1F40CA560]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1F4181538](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1F40CB3D0](*(void *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1F40CB800]();
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

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1F40CBB38]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1F40CBB40]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1F40CBB48]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CBB68]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1F40CBCE0]();
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x1F40CBD38]();
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1F41815B8](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1F41815C0](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1F41815C8](v);
}

uint64_t launch_copy_properties_for_pid_4assertiond()
{
  return MEMORY[0x1F40CC778]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1F40CC9C8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x1F40CC9D8](*(void *)&task, *(void *)&name, *(void *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1F41815F0](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE78](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x1F4181650](superclass, name, extraBytes);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1F4181750](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1F4181788](name);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_registerClassPair(Class cls)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C0](audittoken, buffer, *(void *)&buffersize);
}

uint64_t proc_setthread_cpupercent()
{
  return MEMORY[0x1F40CD8F0]();
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1F4181AB8](property, outCount);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1F4181AC0](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_property_t *__cdecl protocol_copyPropertyList2(Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t *)MEMORY[0x1F4181AF8](proto, outCount, isRequiredProperty, isInstanceProperty);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181B00](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  char v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.mach_port_name_t name = v4;
  return result;
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1F40CD920](a1, a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDA10](a1, a2, a3);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x1F40CDB40]();
}

uint64_t pthread_set_timeshare_self()
{
  return MEMORY[0x1F40CDB50]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CDFE0](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1F40CDFE8](a1);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1F40CE190](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1F40CE480](*(void *)&target_tport, *(void *)&pid, tn);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

uint64_t uacal_getDayPeriod()
{
  return MEMORY[0x1F417F8E0]();
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  MEMORY[0x1F40CEA78](xarray, index);
  return result;
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1F40CEB30]();
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x1F40CEB38]();
}

uint64_t xpc_bundle_get_executable_path()
{
  return MEMORY[0x1F40CEB48]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1F40CEB50]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x1F40CEB58]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_bundle_id()
{
  return MEMORY[0x1F40CEB88]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBC0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1F40CECC0]();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1F40CEE78]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1F40CF018](connection);
}

uint64_t xpc_get_class4NSXPC()
{
  return MEMORY[0x1F40CF128]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

uint64_t xpc_is_kind_of_xpc_object4NSXPC()
{
  return MEMORY[0x1F40CF1A0]();
}

uint64_t xpc_pipe_create_reply_from_port()
{
  return MEMORY[0x1F40CF218]();
}

uint64_t xpc_pipe_receive()
{
  return MEMORY[0x1F40CF220]();
}

uint64_t xpc_pipe_routine_reply()
{
  return MEMORY[0x1F40CF228]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1F40CF360](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}