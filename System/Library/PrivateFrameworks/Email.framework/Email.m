void sub_1BEFDDB84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1BEFDDC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDDD34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDDE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EMStringFromSubtype(unint64_t a1)
{
  if (a1 < 9) {
    return off_1E63E2AF8[a1];
  }
  v3 = [MEMORY[0x1E4F28B00] currentHandler];
  v4 = [NSString stringWithUTF8String:"NSString * _Nonnull EMStringFromSubtype(EMCategorySubtype)"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"EMCategory-BlackPearl.m", 70, @"Unexpected category type: %ld", a1);

  return @"None";
}

void sub_1BEFDDF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDE024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDE220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDE2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDE448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDE510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EMStringFromCategoryType(unint64_t a1)
{
  if (a1 < 4) {
    return off_1E63E2AD8[a1];
  }
  v3 = [MEMORY[0x1E4F28B00] currentHandler];
  v4 = [NSString stringWithUTF8String:"NSString * _Nonnull EMStringFromCategoryType(EMCategoryType)"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"EMCategory-BlackPearl.m", 44, @"Unexpected category type: %ld", a1);

  return @"None";
}

void sub_1BEFDE5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDE7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDE8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDEB70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDEDD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDF038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CopyInvocation(void *a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [v1 methodSignature];
  uint64_t v3 = [v2 numberOfArguments];
  v4 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v2];
  unint64_t v5 = [v2 frameLength];
  if (v5 >= 0x6400001)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"NSInvocation *CopyInvocation(NSInvocation *__strong)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"EMRemoteConnection.m", 173, @"Temporary buffer too large or with a negative count (%zu).", v5);
  }
  if (v5 <= 1) {
    size_t v6 = 1;
  }
  else {
    size_t v6 = v5;
  }
  MEMORY[0x1F4188790]();
  v8 = (char *)v16 - v7;
  memset((char *)v16 - v7, 170, v9);
  if (v5 > 0x800)
  {
    v10 = (char *)malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
  }
  else
  {
    bzero(v8, v6);
    v10 = 0;
  }
  if (v5 >= 0x801) {
    v11 = v10;
  }
  else {
    v11 = v8;
  }
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      [v1 getArgument:v11 atIndex:i];
      [v4 setArgument:v11 atIndex:i];
    }
  }
  free(v10);

  return v4;
}

void sub_1BEFDF28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDF40C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFDF6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1BEFDFA48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDFB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEFDFDF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDFE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFDFF18(_Unwind_Exception *a1)
{
}

void sub_1BEFDFFBC(_Unwind_Exception *a1)
{
}

void sub_1BEFE00F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE01DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE0260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE09C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE0B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE0C40(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BEFE0EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BEFE1138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE160C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE175C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE18F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE19C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE1F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BEFE2224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE232C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE241C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE2570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE26E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE28A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE29A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE2ADC(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BEFE2C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE2D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE2E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE2F7C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BEFE303C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE30A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE32A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id predicateFromCompoundPredicateWithChangeBlock(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [v3 subpredicates];
  if ([v3 compoundPredicateType])
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__8;
    v38 = __Block_byref_object_dispose__8;
    id v39 = 0;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__8;
    v32 = __Block_byref_object_dispose__8;
    id v33 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __predicateFromCompoundPredicateWithChangeBlock_block_invoke;
    v25[3] = &unk_1E63E4EC8;
    v27 = &v28;
    id v6 = v5;
    id v26 = v6;
    uint64_t v7 = (void *)MEMORY[0x1C18A2160](v25);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __predicateFromCompoundPredicateWithChangeBlock_block_invoke_2;
    v19[3] = &unk_1E63E4EF0;
    id v21 = v4;
    id v8 = v3;
    id v20 = v8;
    id v9 = v7;
    id v22 = v9;
    v23 = &v34;
    v24 = &v28;
    [v6 enumerateObjectsUsingBlock:v19];
    v10 = (void *)v35[5];
    if (!v10)
    {
      if ([(id)v29[5] count])
      {
        id v15 = objc_alloc(MEMORY[0x1E4F28BA0]);
        uint64_t v16 = [v8 compoundPredicateType];
        id v11 = (id)[v15 initWithType:v16 subpredicates:v29[5]];
        goto LABEL_9;
      }
      v10 = v8;
    }
    id v11 = v10;
LABEL_9:
    id v17 = v11;

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);

    goto LABEL_16;
  }
  if ([v5 count] == 1)
  {
    v12 = [v5 firstObject];
    v13 = (*((void (**)(id, void *))v4 + 2))(v4, v12);

    if (objc_msgSend(v13, "ef_matchesEverything"))
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
LABEL_12:
      id v17 = (id)v14;

      goto LABEL_16;
    }
    if (objc_msgSend(v13, "ef_matchesNothing"))
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
      goto LABEL_12;
    }
  }
  id v17 = v3;
LABEL_16:

  return v17;
}

void sub_1BEFE35E8(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

id predicateFromComparisonPredicateIgnoringKeyPaths(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [v3 leftExpression];
  uint64_t v6 = [v5 expressionType];

  if (v6 == 3)
  {
    uint64_t v7 = [v3 leftExpression];
    id v8 = [v7 keyPath];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(v8, "hasPrefix:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
          {
            objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
            id v13 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  id v13 = v3;
LABEL_13:

  return v13;
}

void sub_1BEFE3814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __predicateFromCompoundPredicateWithChangeBlock_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "ef_matchesEverything"))
  {
    if ([*(id *)(a1 + 32) compoundPredicateType] == 1) {
      goto LABEL_8;
    }
LABEL_6:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6);
    *a4 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "ef_matchesNothing"))
  {
    if ([*(id *)(a1 + 32) compoundPredicateType] != 1) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 != v8)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_9;
  }
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v7) {
    [v7 addObject:v8];
  }
LABEL_9:
}

void sub_1BEFE3974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id predicateFromPredicateIgnoringKeyPaths(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ((objc_msgSend(v3, "ef_matchesEverything") & 1) != 0 || objc_msgSend(v3, "ef_matchesNothing")) {
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      predicateFromComparisonPredicateIgnoringKeyPaths(v3, v4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_3:
    id v5 = v3;
LABEL_4:
    id v6 = v5;
    goto LABEL_5;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __predicateFromPredicateIgnoringKeyPaths_block_invoke;
  v8[3] = &unk_1E63E4EA0;
  id v9 = v4;
  id v6 = predicateFromCompoundPredicateWithChangeBlock(v3, v8);

LABEL_5:
  return v6;
}

void sub_1BEFE3AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id __mailboxScopeForCompoundPredicate_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = mailboxScopeForPredicate(a2, *(void *)(a1 + 32));
  return v2;
}

id mailboxScopeForPredicate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend(v3, "ef_matchesEverything"))
  {
    uint64_t v5 = +[EMMailboxScope allMailboxesScope];
  }
  else
  {
    if (objc_msgSend(v3, "ef_matchesNothing")) {
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v3 compoundPredicateType]) {
        mailboxScopeForCompoundPredicate(v3, v4);
      }
      else {
      uint64_t v5 = mailboxScopeForNotPredicate(v3, v4);
      }
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_4:
      uint64_t v5 = +[EMMailboxScope noMailboxesScope];
    }
    else
    {
      uint64_t v5 = mailboxScopeForComparisonPredicate(v3, v4);
    }
  }
LABEL_5:
  id v6 = (void *)v5;

  return v6;
}

void sub_1BEFE3C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id mailboxScopeForCompoundPredicate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 compoundPredicateType];
  id v6 = [v3 subpredicates];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __mailboxScopeForCompoundPredicate_block_invoke;
  v11[3] = &unk_1E63E4F60;
  id v7 = v4;
  id v12 = v7;
  id v8 = objc_msgSend(v6, "ef_map:", v11);

  id v9 = combinedMailboxScopeForMailboxScopes(v8, v7, v5 == 1);

  return v9;
}

void sub_1BEFE3D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id combinedMailboxScopeForMailboxScopes(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v5 count] == 1)
  {
    id v7 = [v5 firstObject];
  }
  else
  {
    id v8 = +[EMMailboxScope allMailboxesScope];
    id v9 = +[EMMailboxScope noMailboxesScope];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __combinedMailboxScopeForMailboxScopes_block_invoke;
    v13[3] = &unk_1E63E4F88;
    id v10 = v8;
    char v17 = a3;
    id v14 = v10;
    id v15 = v9;
    id v16 = v6;
    id v11 = v9;
    id v7 = objc_msgSend(v5, "ef_reduce:", v13);
  }
  return v7;
}

void sub_1BEFE3EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE42A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id mailboxScopeForComparisonPredicate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 leftExpression];
  uint64_t v6 = [v5 expressionType];

  if (v6 == 3)
  {
    id v7 = [v3 leftExpression];
    id v8 = [v7 keyPath];
    int v9 = [v8 isEqual:@"mailboxObjectIDs.url.absoluteString"];

    if (v9)
    {
      uint64_t v10 = isExclusionPredicate(v3);
      id v11 = [v3 rightExpression];
      id v12 = [v11 constantValue];
      uint64_t v13 = mailboxScopeForMailboxObjectIDValue(v12, v10);
LABEL_8:
      id v21 = (void *)v13;

      goto LABEL_10;
    }
    id v14 = [v3 leftExpression];
    id v15 = [v14 keyPath];
    int v16 = [v15 isEqual:@"mailboxes.type"];

    if (v16)
    {
      uint64_t v17 = isExclusionPredicate(v3);
      id v11 = [v3 rightExpression];
      id v12 = [v11 constantValue];
      uint64_t v13 = mailboxScopeForMailboxTypeValue(v12, v17);
      goto LABEL_8;
    }
    long long v18 = [v3 leftExpression];
    v19 = [v18 keyPath];
    int v20 = [v19 isEqual:@"objectID.serializedRepresentation"];

    if (v20)
    {
      id v11 = [v3 rightExpression];
      id v12 = [v11 constantValue];
      uint64_t v13 = mailboxScopeForMessageObjectIDConstantValue(v12, v4);
      goto LABEL_8;
    }
  }
  id v21 = +[EMMailboxScope allMailboxesScope];
LABEL_10:

  return v21;
}

void sub_1BEFE4540(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id __predicateFromPredicateIgnoringKeyPaths_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = predicateFromPredicateIgnoringKeyPaths(a2, *(void *)(a1 + 32));
  return v2;
}

void sub_1BEFE475C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE4890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v11 == 1) {

  }
  _Unwind_Resume(a1);
}

void sub_1BEFE494C(_Unwind_Exception *a1)
{
}

uint64_t isExclusionPredicate(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 predicateOperatorType];
  uint64_t v3 = 0;
  if (v2 <= 5)
  {
    if (v2 != 4)
    {
      if (v2 != 5) {
        goto LABEL_8;
      }
      uint64_t v3 = 1;
    }
  }
  else if ((unint64_t)(v2 - 6) >= 5 && v2 != 99)
  {
LABEL_8:
    __assert_rtn("isExclusionPredicate", "EMMessageListItemPredicates.m", 1491, "NO");
  }

  return v3;
}

void sub_1BEFE49F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id mailboxScopeForMailboxObjectIDValue(void *a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_147);
  }
  else
  {
    uint64_t v5 = mailboxObjectIDForConstantValue(v3);
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      v9[0] = v5;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
    else
    {
      id v4 = 0;
    }
  }
  if ([v4 count]) {
    +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v4 forExclusion:a2];
  }
  else {
  id v7 = +[EMMailboxScope noMailboxesScope];
  }

  return v7;
}

void sub_1BEFE4B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE4BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

EMMailboxObjectID *mailboxObjectIDForConstantValue(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (EMMailboxObjectID *)v1;
LABEL_5:
    id v3 = v2;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [[EMMailboxObjectID alloc] initWithURL:v1];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v1];
    id v3 = [[EMMailboxObjectID alloc] initWithURL:v5];
  }
  else
  {
    id v3 = 0;
  }
LABEL_6:

  return v3;
}

void sub_1BEFE4D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE4E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE4EE8(_Unwind_Exception *a1)
{
}

void sub_1BEFE4FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE5024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE5114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE5248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE5340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE53E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE54B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE557C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BEFE5634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE573C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE592C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE59E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE5AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE5BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __predicateFromCompoundPredicateWithChangeBlock_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = v5;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "ef_prefix:", a3);
    uint64_t v7 = [v6 mutableCopy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (!v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v5) {
LABEL_5:
  }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
LABEL_6:
}

void sub_1BEFE5C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id mailboxScopeForMailboxTypeValue(void *a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_150);
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:
  if ([v5 count]) {
    +[EMMailboxScope mailboxScopeForMailboxTypes:v5 forExclusion:a2];
  }
  else {
  uint64_t v6 = +[EMMailboxScope noMailboxesScope];
  }

  return v6;
}

void sub_1BEFE5DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE5ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

EMMailboxScope *mailboxScopeForNotPredicate(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 subpredicates];
  id v5 = [v4 firstObject];

  if (objc_msgSend(v5, "ef_matchesEverything")) {
    goto LABEL_2;
  }
  if (objc_msgSend(v5, "ef_matchesNothing"))
  {
    uint64_t v6 = +[EMMailboxScope allMailboxesScope];
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_2:
      uint64_t v6 = +[EMMailboxScope noMailboxesScope];
LABEL_5:
      uint64_t v7 = (EMMailboxScope *)v6;
      goto LABEL_6;
    }
    id v9 = v5;
    id v10 = mailboxScopeForComparisonPredicate(v9, v3);
    uint64_t v11 = [v9 leftExpression];
    if ([v11 expressionType] == 3)
    {
      id v12 = [v9 leftExpression];
      uint64_t v13 = [v12 keyPath];
      if ([v13 isEqual:@"mailboxObjectIDs.url.absoluteString"])
      {

        goto LABEL_18;
      }
      id v14 = [v9 leftExpression];
      id v15 = [v14 keyPath];
      int v16 = [v15 isEqual:@"mailboxes.type"];

      if (v16)
      {
LABEL_18:
        uint64_t v17 = +[EMMailboxScope allMailboxesScope];
        long long v18 = +[EMMailboxScope noMailboxesScope];
        v19 = v18;
        if (v10 == v18)
        {
          v24 = v17;
        }
        else
        {
          if (v10 != v17)
          {
            int v20 = [EMMailboxScope alloc];
            id v21 = [v10 mailboxTypes];
            int v22 = [v10 excludeTypes];
            v23 = [v10 mailboxObjectIDs];
            uint64_t v7 = -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:](v20, "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:", v21, v22 ^ 1u, v23, [v10 excludeMailboxes] ^ 1);

LABEL_24:
            goto LABEL_25;
          }
          v24 = v18;
        }
        uint64_t v7 = v24;
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v7 = v10;
LABEL_25:

    goto LABEL_26;
  }
  normalizedForNotCompoundPredicate(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  mailboxScopeForPredicate(v9, v3);
  uint64_t v7 = (EMMailboxScope *)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_6:
  return v7;
}

void sub_1BEFE6198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE6288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE63EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE6498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE6524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE65B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BEFE6674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE67C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE6980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE69F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFE6C1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFE6F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE709C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&sSortDescriptorsLock);
  _Unwind_Resume(a1);
}

void sub_1BEFE7168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE7558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE788C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE7A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE7B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE7C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE7D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  os_unfair_lock_unlock(v13);
  _Unwind_Resume(a1);
}

void sub_1BEFE7F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE8070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE8184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE8238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE8320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id defaultNonReattemptingHandlerForConnection(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __defaultNonReattemptingHandlerForConnection_block_invoke;
  v5[3] = &unk_1E63E5E88;
  id v6 = v1;
  id v2 = v1;
  id v3 = (void *)MEMORY[0x1C18A2160](v5);

  return v3;
}

void sub_1BEFE84FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE8708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE88B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE8A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE8BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE908C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE91D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE9254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE93E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE95D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE98D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE9A04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFE9C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BEFE9E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1BEFEA220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEA338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEA3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEA4B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEA690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEA8A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEA944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEA9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEAB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEAC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEAD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEADE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEAE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEB0A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);

  _Unwind_Resume(a1);
}

void sub_1BEFEB118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EMBlackPearlIsFeatureEnabled()
{
  if (EMBlackPearlIsFeatureEnabled_onceToken != -1) {
    dispatch_once(&EMBlackPearlIsFeatureEnabled_onceToken, &__block_literal_global_40);
  }
  return EMBlackPearlIsFeatureEnabled_isFeatureEnabled;
}

void sub_1BEFEB238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EMCategoryFromSubtype(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 6) {
    return 0;
  }
  else {
    return qword_1BF0D1640[a1 - 2];
  }
}

void sub_1BEFEB2D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEB374(_Unwind_Exception *a1)
{
}

void sub_1BEFEB3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEB644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEB7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEB8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEB940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEBA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEBC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEBD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEBF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEC09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEC280(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1BEFEC42C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEC564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEC678(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BEFEC734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEC830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEC8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFECD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BEFECF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFED048(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFED1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFED2BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFED3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFED504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFED6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFED848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFED91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEDAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEDBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEDD04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEDDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEDF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEDFEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __combinedMailboxScopeForMailboxScopes_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  uint64_t v8 = otherMailboxScopeForSpecialMailboxScope(v5, v6, *(id *)(a1 + 32));
  if (v8)
  {
    id v9 = (void *)v8;
    if (*(unsigned char *)(a1 + 56)) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = (id *)(a1 + 40);
    uint64_t v10 = otherMailboxScopeForSpecialMailboxScope(v5, v6, *(id *)(a1 + 40));
    if (!v10)
    {
      v14[0] = v5;
      v14[1] = v6;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      combinedMailboxScopeForMailboxScopesHelper(v12, *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    id v9 = (void *)v10;
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_9;
    }
  }
  id v11 = *v7;
  id v12 = v9;
LABEL_8:
  id v9 = v11;

LABEL_9:
  return v9;
}

void sub_1BEFEE138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id otherMailboxScopeForSpecialMailboxScope(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = v6;
  uint64_t v8 = v6;
  if (v5 == a3 || (uint64_t v8 = v5, v6 == a3)) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

EMMailboxScope *combinedMailboxScopeForMailboxScopesHelper(void *a1, void *a2, int a3)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  v47 = v5;
  if ([v5 count] == 1)
  {
    uint64_t v7 = [v5 firstObject];
    goto LABEL_66;
  }
  v46 = v6;
  uint64_t v8 = +[EMMailboxScope allMailboxesScope];
  v51 = +[EMMailboxScope noMailboxesScope];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (!v10)
  {
    v49 = 0;
    v50 = 0;
    v48 = 0;
    id v11 = 0;
    goto LABEL_25;
  }
  v49 = 0;
  v50 = 0;
  v48 = 0;
  id v11 = 0;
  uint64_t v12 = *(void *)v84;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v84 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v83 + 1) + 8 * i);
      if (v14 == v8)
      {
        if (a3) {
          continue;
        }
        id v26 = v8;
        goto LABEL_27;
      }
      if (v14 == v51)
      {
        if ((a3 & 1) == 0) {
          continue;
        }
        id v26 = v51;
LABEL_27:
        uint64_t v7 = v26;

        goto LABEL_65;
      }
      if ([*(id *)(*((void *)&v83 + 1) + 8 * i) excludeTypes])
      {
        v82 = v50;
        id v15 = [v14 mailboxTypes];
        combineSets(&v82, v15, 1, a3);
        int v16 = v82;
        uint64_t v17 = v50;
        v50 = v82;
      }
      else
      {
        v81 = v49;
        id v15 = [v14 mailboxTypes];
        combineSets(&v81, v15, 0, a3);
        int v16 = v81;
        uint64_t v17 = v49;
        v49 = v81;
      }
      id v18 = v16;

      if ([v14 excludeMailboxes])
      {
        v80 = v11;
        v19 = [v14 mailboxObjectIDs];
        combineSets(&v80, v19, 1, a3);
        int v20 = v80;
        id v21 = v11;
        id v11 = v80;
      }
      else
      {
        v79 = v48;
        v19 = [v14 mailboxObjectIDs];
        combineSets(&v79, v19, 0, a3);
        int v20 = v79;
        id v21 = v48;
        v48 = v79;
      }
      id v22 = v20;
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v83 objects:v87 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_25:

  BOOL v78 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__8;
  v76 = __Block_byref_object_dispose__8;
  id v77 = 0;
  BOOL v71 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__8;
  v69 = __Block_byref_object_dispose__8;
  id v70 = 0;
  if (a3)
  {
    uint64_t v23 = resolveSetsForAnd(v49, v50, &v78);
    v24 = (void *)v73[5];
    v73[5] = v23;

    resolveSetsForAnd(v48, v11, &v71);
  }
  else
  {
    uint64_t v27 = resolveSetsForOr(v49, v50, &v78);
    uint64_t v28 = (void *)v73[5];
    v73[5] = v27;

    resolveSetsForOr(v48, v11, &v71);
  uint64_t v25 = };
  v29 = (void *)v66[5];
  v66[5] = v25;

  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __combinedMailboxScopeForMailboxScopesHelper_block_invoke;
  v61[3] = &unk_1E63E4FD8;
  v63 = &v65;
  id v30 = v46;
  id v62 = v30;
  v64 = &v72;
  v31 = (void *)MEMORY[0x1C18A2160](v61);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __combinedMailboxScopeForMailboxScopesHelper_block_invoke_3;
  v57[3] = &unk_1E63E5028;
  v59 = &v65;
  id v32 = v30;
  id v58 = v32;
  v60 = &v72;
  id v33 = (unsigned int (**)(void))MEMORY[0x1C18A2160](v57);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __combinedMailboxScopeForMailboxScopesHelper_block_invoke_5;
  v53[3] = &unk_1E63E5028;
  v55 = &v65;
  id v54 = v32;
  v56 = &v72;
  uint64_t v34 = (unsigned int (**)(void))MEMORY[0x1C18A2160](v53);
  v35 = (void *)v73[5];
  if (v35)
  {
    uint64_t v7 = 0;
    goto LABEL_31;
  }
  if (v66[5])
  {
    uint64_t v7 = 0;
    goto LABEL_35;
  }
  uint64_t v39 = +[EMMailboxScope allMailboxesScope];
  v35 = (void *)v73[5];
  uint64_t v7 = (EMMailboxScope *)v39;
  if (!v35) {
    goto LABEL_35;
  }
LABEL_31:
  if ([v35 count])
  {
LABEL_35:
    uint64_t v36 = (void *)v66[5];
    if (v36 && ![v36 count]) {
      goto LABEL_43;
    }
    if (!v73[5] || !v66[5]) {
      goto LABEL_62;
    }
    if (v71 == v78)
    {
      if (a3)
      {
        if (!v71)
        {
          if (v33[2](v33))
          {
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __combinedMailboxScopeForMailboxScopesHelper_block_invoke_7;
            v52[3] = &unk_1E63E5050;
            v52[4] = &v72;
            v52[5] = &v65;
            uint64_t v40 = objc_msgSend(v9, "ef_firstObjectPassingTest:", v52);

            uint64_t v7 = (EMMailboxScope *)v40;
            if (v40) {
              goto LABEL_64;
            }
            uint64_t v7 = +[EMMailboxScope noMailboxesScope];
LABEL_62:
            if (!v7)
            {
              v44 = [EMMailboxScope alloc];
              uint64_t v7 = [(EMMailboxScope *)v44 initWithMailboxTypes:v73[5] excludeTypes:v78 mailboxObjectIDs:v66[5] excludeMailboxes:v71];
            }
            goto LABEL_64;
          }
          goto LABEL_60;
        }
      }
      else if (v71)
      {
        if (v34[2](v34))
        {
          uint64_t v42 = +[EMMailboxScope allMailboxesScope];
          v43 = v7;
          uint64_t v7 = (EMMailboxScope *)v42;
LABEL_61:

          goto LABEL_62;
        }
        v37 = (void (*)(void *, uint64_t))v31[2];
        uint64_t v41 = 1;
        goto LABEL_59;
      }
      v37 = (void (*)(void *, uint64_t))v31[2];
    }
    else
    {
      v37 = (void (*)(void *, uint64_t))v31[2];
      if (a3)
      {
        if (!v78) {
          goto LABEL_57;
        }
        goto LABEL_52;
      }
      if (!v78)
      {
LABEL_52:
        uint64_t v41 = 0;
LABEL_59:
        v37(v31, v41);
LABEL_60:
        v43 = (EMMailboxScope *)v73[5];
        v73[5] = 0;
        goto LABEL_61;
      }
    }
LABEL_57:
    v37(v31, v71 != v78);
    goto LABEL_62;
  }
LABEL_43:
  uint64_t v38 = +[EMMailboxScope noMailboxesScope];

  uint64_t v7 = (EMMailboxScope *)v38;
LABEL_64:

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v72, 8);

LABEL_65:
  id v6 = v46;
LABEL_66:

  return v7;
}

void sub_1BEFEE988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id a55)
{
  _Block_object_dispose(&a43, 8);

  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void combineSets(void **a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  uint64_t v8 = *a1;
  id v9 = v7;
  if (a3)
  {
    if (v8)
    {
LABEL_3:
      [v8 unionSet:v7];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!v8)
  {
LABEL_8:
    *a1 = (id)[v7 mutableCopy];
    goto LABEL_9;
  }
  if (!v7 || !a4) {
    goto LABEL_3;
  }
  [v8 intersectSet:v7];
LABEL_9:
}

void sub_1BEFEEB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id resolveSetsForOr(void *a1, void *a2, BOOL *a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v6 count])
  {
    if ([v5 count])
    {
      [v6 minusSet:v5];
      BOOL v7 = [v6 count] != 0;
    }
    else
    {
      BOOL v7 = 1;
    }
    uint64_t v8 = v6;
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v8 = v5;
  }
  *a3 = v7;
  id v9 = objc_msgSend(v8, "ef_notEmpty");

  return v9;
}

void sub_1BEFEEBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEEF44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEF118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEF248(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BEFEF334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEF3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEF4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL EMIsGreymatterAvailableWithOverride()
{
  if (_EMShouldOverrideGreymatterAvailability_onceToken != -1) {
    dispatch_once(&_EMShouldOverrideGreymatterAvailability_onceToken, &__block_literal_global_44);
  }
  if (_EMShouldOverrideGreymatterAvailability_overrideIsGreymatterAvailability
    || +[EMGenerativeModelsAvailability isAvailable])
  {
    return 1;
  }
  return +[EMGenerativeModelsAvailability isRestricted];
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_1BEFEF71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEF840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEF960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEFA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __hasMailboxPredicates_block_invoke(uint64_t a1, uint64_t a2)
{
  return hasMailboxPredicates(a2, *(void *)(a1 + 32));
}

void sub_1BEFEFAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEFB70(_Unwind_Exception *a1)
{
}

void sub_1BEFEFCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEFDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BEFEFF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0228(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFF03C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF048C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFF052C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0C70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BEFF0E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF0FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF12E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1374()
{
}

void sub_1BEFF137C()
{
}

void sub_1BEFF1384()
{
}

void sub_1BEFF138C()
{
}

void sub_1BEFF1438(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFF14E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF15C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF1E1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFF1E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF2024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF20A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF214C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF21FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF2288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id __mailboxScopeForMailboxTypeValue_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_1BEFF2350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF24D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  if (EMIsGreymatterSupportedWithOverride_onceToken != -1) {
    dispatch_once(&EMIsGreymatterSupportedWithOverride_onceToken, &__block_literal_global_37);
  }
  return EMIsGreymatterSupportedWithOverride_isGreymatterSupported;
}

void sub_1BEFF26FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF29D8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BEFF2D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF302C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF3144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF323C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF4210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF46BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF47D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF491C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF4A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF4B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF4D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF4EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF500C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BEFF5138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF5214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF5520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF56EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  os_unfair_lock_unlock(v13);
  _Unwind_Resume(a1);
}

void sub_1BEFF5964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  v24 = v22;
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BEFF5CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF60B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF622C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF6320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF63EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF6508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF6814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF68F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF69F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF6B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF6C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF6D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF7070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t hasMailboxPredicates(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 subpredicates];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __hasMailboxPredicates_block_invoke;
    v9[3] = &unk_1E63E50D8;
    id v10 = v4;
    uint64_t v6 = objc_msgSend(v5, "ef_any:", v9);
  }
  else
  {
    BOOL v7 = mailboxScopeForThreadWithPredicate(v3, v4);
    uint64_t v6 = v7 != 0;
  }
  return v6;
}

void sub_1BEFF7218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id mailboxScopeForThreadWithPredicate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = mailboxScopeForComparisonPredicate(v3, v4);
    uint64_t v6 = +[EMMailboxScope allMailboxesScope];

    if (v5 != v6) {
      goto LABEL_5;
    }
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

void sub_1BEFF72EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF73C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF7468(_Unwind_Exception *a1)
{
}

void sub_1BEFF753C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF7634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF7740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF7AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BEFF7D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BEFF8034(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));

  _Unwind_Resume(a1);
}

void sub_1BEFF8108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF82C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BEFF8378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF84B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF8574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF86C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF8758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF886C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BEFF8908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF8B08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFF8BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id defaultReattemptingHandlerForConnection(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __defaultReattemptingHandlerForConnection_block_invoke;
  v5[3] = &unk_1E63E5E88;
  id v6 = v1;
  id v2 = v1;
  id v3 = (void *)MEMORY[0x1C18A2160](v5);

  return v3;
}

void sub_1BEFF8D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF8E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF8F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)EMActivity;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BEFF8FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_EMActivityRegistryObserverWrapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BEFF904C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFF90E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BEFF91A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF923C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFF9430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF95A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void sub_1BEFF9824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF993C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF9A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF9B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFF9E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA5A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFA670(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BEFFA79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)EMQueryingCollection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BEFFAE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFB150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFB52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFB68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFB7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFB9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFBAF4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BEFFBBD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFBC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFBDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BEFFC000(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v3);

  _Unwind_Resume(a1);
}

void sub_1BEFFC0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFC190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v11);

  _Unwind_Resume(a1);
}

void sub_1BEFFC2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  uint64_t v17 = v16;

  _Unwind_Resume(a1);
}

void sub_1BEFFC4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFC5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFC618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFC6A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFC850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFC8E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFCA2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFCB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFCC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&sSortDescriptorsLock);
  _Unwind_Resume(a1);
}

void sub_1BEFFCE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFCFC0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BEFFD138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFD248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFD414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFD6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFD86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFD93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFDA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFDAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFDC14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFDCE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFDF7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFE218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFE264()
{
}

void sub_1BEFFE344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFE934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  os_unfair_lock_unlock(v17);
  _Unwind_Resume(a1);
}

void sub_1BEFFEB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFED0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFEDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BEFFEE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFF000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFF0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFF358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFF418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFF5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFF78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFF894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id nonReattemptingHandlerForErrorHandler(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __nonReattemptingHandlerForErrorHandler_block_invoke;
  v5[3] = &unk_1E63E5EB0;
  id v6 = v1;
  id v2 = v1;
  id v3 = (void *)MEMORY[0x1C18A2160](v5);

  return v3;
}

void sub_1BEFFFAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BEFFFC84(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BEFFFD30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BEFFFEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF00057C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF0006C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v3);

  _Unwind_Resume(a1);
}

void sub_1BF00088C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF000A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  uint64_t v17 = v16;
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF000AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF000B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMRemoteConnection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF000D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  v24 = v22;
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF001044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF00111C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF0013F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF0015D4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t EMInteractionLoggerShouldLog()
{
  if (EFIsSeedBuild()) {
    return 1;
  }
  id v1 = [MEMORY[0x1E4F60D58] currentDevice];
  uint64_t v0 = [v1 isInternal];

  return v0;
}

void sub_1BF00165C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0016E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0018D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  v24 = v22;
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF001A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF001C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id v26 = v24;
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF001D64(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF001E10(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF001FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF002180(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF002248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00252C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00267C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF002824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF002970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF002A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF002AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF002B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF002C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF002DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF002FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0030EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF003210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0032C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF003364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF003424(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void __EMBlackPearlIsFeatureEnabled_block_invoke()
{
  if (!_os_feature_enabled_impl()) {
    goto LABEL_8;
  }
  uint64_t v0 = [MEMORY[0x1E4F60D58] currentDevice];
  int v1 = [v0 isPhone];

  if ((v1 | +[EMInternalPreferences preferenceEnabled:45]) != 1)
  {
    if (_EMBlackPearlPlatformSupported_isPlatformSupported == 1) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v2 = 0;
    goto LABEL_9;
  }
  _EMBlackPearlPlatformSupported_isPlatformSupported = 1;
LABEL_5:
  if (EMBlackPearlIsLanguageSupported_onceToken != -1) {
    dispatch_once(&EMBlackPearlIsLanguageSupported_onceToken, &__block_literal_global_12);
  }
  BOOL v2 = EMBlackPearlIsLanguageSupported_isSupportedLocale != 0;
LABEL_9:
  EMBlackPearlIsFeatureEnabled_isFeatureEnabled = v2;
}

void sub_1BF00377C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00388C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00397C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF003A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF003C14(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF003DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF003E40(_Unwind_Exception *a1)
{
}

void sub_1BF003EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0041E4(_Unwind_Exception *a1)
{
  uint64_t v8 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF00439C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF004480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0045AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF004704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0047E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0049DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF004B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF004EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF004F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF004FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF005030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0052C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0053B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF005518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF005654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF005918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF005C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF005DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF005E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF005FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  os_unfair_lock_unlock(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1BF0060A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF006134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0061A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00627C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0063E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __defaultCollectionScheduler_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"EMQueryingCollection"];
  int v1 = (void *)defaultCollectionScheduler_scheduler;
  defaultCollectionScheduler_scheduler = v0;
}

void sub_1BF0064E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF006540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __EMIsGreymatterSupportedWithOverride_block_invoke()
{
  if ((EFIsRunningUnitTests() & 1) != 0
    || +[EMInternalPreferences preferenceEnabled:57])
  {
    EMIsGreymatterSupportedWithOverride_isGreymatterSupported = 1;
  }
  else
  {
    id v0 = [MEMORY[0x1E4F60D58] currentDevice];
    EMIsGreymatterSupportedWithOverride_isGreymatterSupported = [v0 supportsGenerativeModelSystems];
  }
}

void sub_1BF006630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF006698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0069C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF006B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF006C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF006D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF006E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00702C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0071F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF007280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0073BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0074C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_EMMessageRepositoryCountingQueryObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF007664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0076E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00776C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0077F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0078F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00797C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF007E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0080F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF00816C()
{
}

void sub_1BF0082CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF008410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF008514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0085D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF008700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00885C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0089B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF008AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF008BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF008D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF008E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF008F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0090F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0091F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF009274(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF0094BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0095E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0096E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF009858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0099D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF009B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF009CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF009E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF009FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00A150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00A2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00A450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00A5D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00A828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00AB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00ACC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00AED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1BF00AF54()
{
}

void sub_1BF00AF5C()
{
}

void sub_1BF00B1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1BF00B264()
{
  JUMPOUT(0x1BF00B250);
}

void sub_1BF00B270()
{
}

void sub_1BF00B300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00B524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1BF00B618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00B8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00BA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00BAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00BB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00BC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00BD30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00C0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00C1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00C330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00C398()
{
}

void sub_1BF00C3A0()
{
}

void sub_1BF00C570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF00C5DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF00C644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMAccountRepository;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF00C6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00C7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00C950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00CA2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00CAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00CC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00CDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00CFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v11);
  _Unwind_Resume(a1);
}

void sub_1BF00D75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BF00D88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00D9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00DA1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF00DAA0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF00DB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00DC4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00DD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00DD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00DE1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF00DF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00DFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E228(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF00E2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00E9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00EB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00EB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00ECC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00EDA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF00EEA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF00F53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1BF00FACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33,void *a34,void *a35,uint64_t a36,uint64_t a37,void *a38)
{
  _Unwind_Resume(a1);
}

void sub_1BF010288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0105FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF010700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF010E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF01137C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BF0116D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BF01196C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF011E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF011EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF011F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF012008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF012068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EMBIMIIncomingServerIsAllowlisted(uint64_t a1)
{
  int v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_urlWithString:", a1);
  BOOL v2 = objc_msgSend(v1, "ef_highLevelDomain");

  if ([v2 length]) {
    uint64_t IsAllowlisted = EMBIMIIncomingServerHighLevelDomainIsAllowlisted(v2);
  }
  else {
    uint64_t IsAllowlisted = 0;
  }

  return IsAllowlisted;
}

void sub_1BF0125EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EMBIMIIncomingServerHighLevelDomainIsAllowlisted(void *a1)
{
  id v1 = a1;
  char v6 = 0;
  BOOL v2 = _serverConfigurationValueForKey(@"bimi-mail-provider-allowlist", &v6);
  if (!v2)
  {
    if (v6)
    {
      BOOL v2 = EMLogBIMI();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        EMBIMIIncomingServerHighLevelDomainIsAllowlisted_cold_2();
      }
    }
    else
    {
      BOOL v2 = EMLogBIMI();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        EMBIMIIncomingServerHighLevelDomainIsAllowlisted_cold_1();
      }
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = EMLogBIMI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      EMBIMIIncomingServerHighLevelDomainIsAllowlisted_cold_3();
    }

LABEL_11:
    BOOL v2 = &unk_1F1A61FB0;
  }
  uint64_t v4 = [v2 containsObject:v1];

  return v4;
}

void sub_1BF01271C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _serverConfigurationValueForKey(void *a1, char *a2)
{
  id v3 = a1;
  uint64_t v4 = +[EMServerConfiguration getValueForKey:v3];
  if (v4)
  {
LABEL_4:
    char v5 = 1;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (+[EMServerConfiguration isCacheRecent])
  {
    uint64_t v4 = 0;
    goto LABEL_4;
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0
    && +[EMServerConfiguration refresh])
  {
    uint64_t v4 = +[EMServerConfiguration getValueForKey:v3];
    goto LABEL_4;
  }
  uint64_t v4 = 0;
  char v5 = 0;
  if (a2) {
LABEL_5:
  }
    *a2 = v5;
LABEL_6:

  return v4;
}

void sub_1BF012808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EMBIMIMailProviderDisplayNameForIncomingMailServer(uint64_t a1)
{
  id v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_urlWithString:", a1);
  BOOL v2 = objc_msgSend(v1, "ef_highLevelDomain");

  if (!v2)
  {
    char v5 = 0;
    goto LABEL_25;
  }
  char v10 = 0;
  id v3 = _serverConfigurationValueForKey(@"bimi-mail-provider-info", &v10);
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_14;
    }
    uint64_t v4 = EMLogBIMI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_1();
    }
  }
  else if (v10)
  {
    id v3 = EMLogBIMI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_4();
    }
  }
  else
  {
    id v3 = EMLogBIMI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_3();
    }
  }

  id v3 = 0;
LABEL_14:
  char v6 = [v3 objectForKeyedSubscript:v2];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v7 = EMLogBIMI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_1();
      }

      char v6 = 0;
    }
  }
  char v5 = [v6 objectForKeyedSubscript:@"display-name"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = EMLogBIMI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_1();
      }

      char v5 = 0;
    }
  }

LABEL_25:
  return v5;
}

void sub_1BF012A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF012A7C()
{
  JUMPOUT(0x1BF012A74);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1BF012BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF012CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF012D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF012F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF013024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0130F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0132D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1BF0134DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF013638(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t _blockedSenderOptionsDidChange(uint64_t a1, void *a2)
{
  return [a2 _postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState];
}

void sub_1BF0136E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  char v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMBlockedSenderManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF0137CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF013878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void -[EMBlockedSenderManager _blockedSenderListDidChange:](EMBlockedSenderManager *self, SEL a2, id a3)
{
  uint64_t v4 = [(EMBlockedSenderManager *)self blockedSenderCache];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__EMBlockedSenderManager__blockedSenderListDidChange___block_invoke;
  v5[3] = &unk_1E63E29C8;
  void v5[4] = self;
  [v4 performWhileLocked:v5];
}

void sub_1BF013910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF013AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF013C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF013D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF013E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF013F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF013FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF014084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01410C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0141CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF014224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01428C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0142F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF014428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF014574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF014634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0146EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0147A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void -[EMBlockedSenderManager _blockContact:block:](EMBlockedSenderManager *self, SEL a2, id a3, BOOL a4)
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F605B8]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v6 emailAddresses];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) value];
        [v7 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  if (v4) {
    [(EMBlockedSenderManager *)self blockEmailAddresses:v7];
  }
  else {
    [(EMBlockedSenderManager *)self unblockEmailAddresses:v7];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v13 = objc_msgSend(v6, "phoneNumbers", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = [*(id *)(*((void *)&v18 + 1) + 8 * v16) value];
        if (v4) {
          [(EMBlockedSenderManager *)self _blockPhoneNumber:v17];
        }
        else {
          [(EMBlockedSenderManager *)self _unblockPhoneNumber:v17];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

void sub_1BF0149F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF014B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF014C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void -[EMBlockedSenderManager _blockPhoneNumber:](EMBlockedSenderManager *self, SEL a2, id a3)
{
  id v4 = [a3 formattedInternationalStringValue];
  CMFItemFromString = (const void *)CreateCMFItemFromString();
  if (CMFItemFromString)
  {
    CMFBlockListAddItemForAllServices();
    CFRelease(CMFItemFromString);
  }
}

void sub_1BF014C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF014D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF014D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF014E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF014F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF014FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMBusinessExternalID;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF015088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0151DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01563C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0156C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015A68(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF015B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF015F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF016108(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF016290(_Unwind_Exception *a1)
{
  char v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF0163B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF016564(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF016798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0168E0(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF016A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF016B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF016C58(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF016E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF017010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF017150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF017228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0173CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF017580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF017704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF01792C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF017B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF017BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF017C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EMShortStringFromCategoryType(unint64_t a1)
{
  if (a1 < 4) {
    return off_1E63E2B40[a1];
  }
  id v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"NSString *EMShortStringFromCategoryType(EMCategoryType)"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"EMCategory-BlackPearl.m", 86, @"Unexpected category type: %ld", a1);

  return @"None";
}

void sub_1BF017E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EMShortStringFromSubtype(unint64_t a1)
{
  if (a1 < 9) {
    return off_1E63E2B60[a1];
  }
  id v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"NSString *EMShortStringFromSubtype(EMCategorySubtype)"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"EMCategory-BlackPearl.m", 112, @"Unexpected category type: %ld", a1);

  return @"None";
}

void sub_1BF017EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EMCategoryTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"Transactions"])
  {
    if ([v1 caseInsensitiveCompare:@"Updates"])
    {
      if ([v1 caseInsensitiveCompare:@"Promotions"]) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = 3;
      }
    }
    else
    {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

void sub_1BF017F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EMStringFromCategorizationState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Uncategorized";
  }
  else {
    return off_1E63E2BA8[a1 - 1];
  }
}

void sub_1BF018130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EMShortStringForCategory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    unint64_t v3 = [v1 state];
    if (v3 >= 5)
    {
      id v6 = 0;
    }
    else
    {
      id v4 = off_1E63E2BC8[v3];
      char v5 = [v2 _shortDescription];
      id v6 = [(__CFString *)v4 stringByAppendingString:v5];
    }
  }
  else
  {
    id v6 = @"N/A";
  }

  return v6;
}

void sub_1BF018204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0183E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMCertificateTrustInformation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF0185A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0186CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0187A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF018CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF018D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF018DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF018E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF018FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0190D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF01917C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF019238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0193C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF019790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF019960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF019BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF019D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF019E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF019FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF01A204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01A2E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01A3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01A4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF01A5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF01A874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

void sub_1BF01A9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1BF01AAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01AB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01ABB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01AFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF01B1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01B3B0(_Unwind_Exception *a1)
{
  uint64_t v8 = v7;

  _Unwind_Resume(a1);
}

void sub_1BF01B644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01B7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01B8B0(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF01B978(_Unwind_Exception *a1)
{
  char v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF01BAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01BC64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01BD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01BDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)EMContentRepresentation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF01C14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01C3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01C588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01C8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01CA8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01CC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01CDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF01D208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  _Unwind_Resume(a1);
}

void sub_1BF01D370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01D430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01D5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  long long v18 = v17;

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BF01D6EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01D8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01DA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF01DB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_1BF01DF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01E7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01EB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v23 - 128));
  _Block_object_dispose((const void *)(v23 - 120), 8);

  objc_destroyWeak((id *)(v23 - 88));
  _Unwind_Resume(a1);
}

void sub_1BF01EB88()
{
}

void sub_1BF01EC50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);

  _Unwind_Resume(a1);
}

void sub_1BF01ECD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01EE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01EF74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1BF01F454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01F9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01FAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01FB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1BF01FC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)EMDaemonBooster;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF01FDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01FE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01FEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF01FF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF01FFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMDaemonInterface;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF020198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF020244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02069C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02079C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF020820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF020A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF020C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF020C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BF020D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF020E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v11 = v10;

  os_unfair_lock_unlock(v9);
  a9.super_class = (Class)EMDiagnosticInfoGatherer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF020F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF020FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF0210C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF021150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0211D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF021274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF0216E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id a57)
{
  _Block_object_dispose(&a52, 8);
  _Unwind_Resume(a1);
}

void sub_1BF02192C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0219E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF021A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF021B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF021EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BF022098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)EMDiagnosticsHelper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF022190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF022484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF0226B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF022750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0227DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t EMBlackPearlIsLanguageSupported()
{
  if (EMBlackPearlIsLanguageSupported_onceToken != -1) {
    dispatch_once(&EMBlackPearlIsLanguageSupported_onceToken, &__block_literal_global_12);
  }
  return EMBlackPearlIsLanguageSupported_isSupportedLocale;
}

void __EMBlackPearlIsLanguageSupported_block_invoke()
{
  if (!+[EMInternalPreferences preferenceEnabled:40])
  {
    id v1 = [MEMORY[0x1E4F28B50] mainBundle];
    id v0 = objc_msgSend(v1, "ef_preferredLanguageIdentifier");
    EMBlackPearlIsLanguageSupported_isSupportedLocale = [&unk_1F1A61FC8 containsObject:v0];
  }
}

void sub_1BF0228E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t EMIsGreymatterSupported()
{
  if (EMIsGreymatterSupported_onceToken != -1) {
    dispatch_once(&EMIsGreymatterSupported_onceToken, &__block_literal_global_34);
  }
  return EMIsGreymatterSupported_isGreymatterSupported;
}

void __EMIsGreymatterSupported_block_invoke()
{
  id v0 = [MEMORY[0x1E4F60D58] currentDevice];
  EMIsGreymatterSupported_isGreymatterSupported = [v0 supportsGenerativeModelSystems];
}

void sub_1BF0229A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL EMIsGreymatterAvailable()
{
  if (+[EMGenerativeModelsAvailability isAvailable])
  {
    return 1;
  }
  return +[EMGenerativeModelsAvailability isRestricted];
}

void sub_1BF022A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF022B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF022B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF022BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF022CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF022D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF022DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF022E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_EMFocusController()
{
  if (_ef_log_EMFocusController_onceToken != -1) {
    dispatch_once(&_ef_log_EMFocusController_onceToken, &__block_literal_global_14);
  }
  id v0 = (void *)_ef_log_EMFocusController_log;
  return v0;
}

void sub_1BF022F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF022FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)EMFocusController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF023124(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_1BF0231FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0233B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1BF023548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023658(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF023778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BF0237EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0239F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF023D64(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF023E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF023F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0240A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF024310(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

double +[EMForceBlankCellsController _blockRate](id a1, SEL a2)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  unint64_t v3 = [v2 objectForKey:@"BlankCellBlockRate"];

  if (!v3)
  {
LABEL_9:
    double v5 = 0.2;
    goto LABEL_10;
  }
  [v3 doubleValue];
  double v5 = v4;
  if (v4 < 0.0 || v4 > 1.0)
  {
    id v7 = +[EMForceBlankCellsController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[EMForceBlankCellsController _blockRate](v7);
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

void sub_1BF024420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0244BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF024724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0249BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF024EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF025084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0251D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0252FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF025430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF025554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF025680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF025774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0257E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF025900(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF025AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF025D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF025F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF026128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0263F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02658C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0266C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02680C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02692C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0269EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF026C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *EMGroupedSenderGroupingDescription(unint64_t a1)
{
  if (a1 > 4) {
    return @"Simple Address";
  }
  else {
    return off_1E63E35A8[a1];
  }
}

void sub_1BF026E20(_Unwind_Exception *a1)
{
}

void sub_1BF026F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF027048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0270E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02716C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0272D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF027394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02748C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0275B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0276C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0277D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF027880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF027938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF027998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0279E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_EMGroupedSenderCollectionItemID()
{
  if (_ef_log_EMGroupedSenderCollectionItemID_onceToken != -1) {
    dispatch_once(&_ef_log_EMGroupedSenderCollectionItemID_onceToken, &__block_literal_global_106);
  }
  id v0 = (void *)_ef_log_EMGroupedSenderCollectionItemID_log;
  return v0;
}

void sub_1BF027B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF027C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF027D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF027EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF027F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF028010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF028198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02833C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0283D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF028688(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF02881C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF028944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF028B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF028D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF028E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF028F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF028FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF029154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0291F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0292E4(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF029384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF029674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0297B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF029934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF029A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF029B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1BF029C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF029CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF029D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF029F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1BF02A0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1BF02A214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02A2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02A328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02A4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF02A6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02A810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02AA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF02AB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  long long v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1BF02ACEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF02ADFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF02AE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02AF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02B01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1BF02B180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02B28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1BF02B38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02B5A4(_Unwind_Exception *a1)
{
  uint64_t v9 = v7;

  _Unwind_Resume(a1);
}

void sub_1BF02B704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1BF02B844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02B8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02B93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02B9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF02BAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_1BF02BD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02BE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02BE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02BFB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02C100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02C2F8(_Unwind_Exception *a1)
{
  uint64_t v8 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF02C504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02C720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02C8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02CAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02CBA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02CCF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D2B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02D9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02DC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02DD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02DE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02DF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02E11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02E2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02E48C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02E60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02E754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02E8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02EA6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02EB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02ECA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02EE24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02EF9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02F094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02F0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02F188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02F65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF02F908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v25 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1BF02FA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF02FD0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF02FF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF03004C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0301D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF030314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF03040C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF030488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0304F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF030560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0308D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF030A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF030BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF031004(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v3);
  _Unwind_Resume(a1);
}

void sub_1BF031178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0311E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF031358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF031410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03163C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03179C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF031990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF031AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF031C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF031CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF031E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF031F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF032020(_Unwind_Exception *a1)
{
  double v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF032130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v11);
  _Unwind_Resume(a1);
}

void sub_1BF0322B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF0324BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF032710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1BF03286C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF0328E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03296C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF032A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF032C14(_Unwind_Exception *exception_object)
{
}

void sub_1BF032CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF032E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF032EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF032F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF032F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0330B8(_Unwind_Exception *exception_object)
{
}

void sub_1BF03319C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF033388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0338D4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v5);

  _Unwind_Resume(a1);
}

void sub_1BF033B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF033D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF033F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0346C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF034934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF034C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1BF03549C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03577C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF035DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1BF0360DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF036158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF036204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF0368F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF036BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF036E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF037020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF037284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0373D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF037478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0374F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF037650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF03771C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0377B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0378E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v10;

  if (v11 != v13) {
  _Unwind_Resume(a1);
  }
}

void sub_1BF037A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

void sub_1BF037B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF037E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF038014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF038150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF038258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF038440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0384A4()
{
}

void sub_1BF038528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF0385F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF038694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF038828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF038984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF038BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF038EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF03911C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF039310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0393B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0396C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF039794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0398DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0399D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1BF039AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF039D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF039ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF039FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A15C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A29C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03A928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03AAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03ACD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03AE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03AFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B8B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03B96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03BA50(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF03BB44(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF03BC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF03BCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03BDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03BF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03C0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _userDefaultsDidChange()
{
}

void sub_1BF03C1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03C2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03C3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03C528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03C8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03CA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03CAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03CBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EMRecodeDataToNetwork(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (char *)[v1 bytes];
  uint64_t v3 = [v1 length];
  size_t v4 = v3;
  unint64_t v5 = (unint64_t)&v2[v3];
  if (v2 >= &v2[v3]) {
    goto LABEL_10;
  }
  size_t v6 = v3;
  id v7 = v2;
  size_t v8 = v3;
  do
  {
    uint64_t v9 = (char *)memchr(v7, 10, v6);
    int64_t v10 = (unsigned char *)v7 - (v9 + 1);
    if (v9)
    {
      ++v8;
      id v7 = v9 + 1;
    }
    else
    {
      id v7 = (void *)v5;
    }
    if (!v9) {
      int64_t v10 = 0;
    }
    v6 += v10;
  }
  while ((unint64_t)v7 < v5);
  if (v8 == v4)
  {
LABEL_10:
    id v11 = v1;
  }
  else
  {
    uint64_t v12 = (char *)malloc_type_malloc(v8, 0x9F60BA98uLL);
    uint64_t v13 = v12;
    if ((unint64_t)v2 < v5)
    {
      uint64_t v14 = v12;
      while (1)
      {
        uint64_t v15 = memchr(v2, 10, v4);
        if (!v15) {
          break;
        }
        uint64_t v16 = v15;
        size_t v17 = v15 - v2;
        if (v15 != v2) {
          memcpy(v14, v2, v17);
        }
        long long v18 = &v14[v17];
        *(_WORD *)long long v18 = 2573;
        uint64_t v14 = v18 + 2;
        size_t v4 = &v2[v4] - (v16 + 1);
        uint64_t v2 = v16 + 1;
        if ((unint64_t)(v16 + 1) >= v5) {
          goto LABEL_19;
        }
      }
      memcpy(v14, v2, v5 - (void)v2);
    }
LABEL_19:
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v13 length:v8 freeWhenDone:1];
  }
  long long v19 = v11;

  return v19;
}

void sub_1BF03CD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03CDAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03CEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03CFAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03D0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03D21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF03D46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03D660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03D800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03D914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03DAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03DC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03DDA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1BF03DE60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03DFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03E16C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03E264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03E30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03E418(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF03E6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03E7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03E8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03E9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03EA20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03EE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F2FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03F8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF03FBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03FD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03FDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03FE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03FEE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF03FF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04001C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0401B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0402C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0404BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04060C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id EMLogCategoryMessageLoading()
{
  if (EMLogCategoryMessageLoading_onceToken != -1) {
    dispatch_once(&EMLogCategoryMessageLoading_onceToken, &__block_literal_global_23);
  }
  id v0 = (void *)EMLogCategoryMessageLoading_os_log;
  return v0;
}

void __EMLogCategoryMessageLoading_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MessageLoading");
  id v1 = (void *)EMLogCategoryMessageLoading_os_log;
  EMLogCategoryMessageLoading_os_log = (uint64_t)v0;
}

id EMLogMailDrop()
{
  if (EMLogMailDrop_onceToken != -1) {
    dispatch_once(&EMLogMailDrop_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)EMLogMailDrop_os_log;
  return v0;
}

void __EMLogMailDrop_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MailDrop");
  id v1 = (void *)EMLogMailDrop_os_log;
  EMLogMailDrop_os_log = (uint64_t)v0;
}

id EMLogSearch()
{
  if (EMLogSearch_onceToken != -1) {
    dispatch_once(&EMLogSearch_onceToken, &__block_literal_global_7_0);
  }
  os_log_t v0 = (void *)EMLogSearch_os_log;
  return v0;
}

void __EMLogSearch_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "Search");
  id v1 = (void *)EMLogSearch_os_log;
  EMLogSearch_os_log = (uint64_t)v0;
}

id EMLogCompose()
{
  if (EMLogCompose_onceToken != -1) {
    dispatch_once(&EMLogCompose_onceToken, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)EMLogCompose_os_log;
  return v0;
}

void __EMLogCompose_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "Compose");
  id v1 = (void *)EMLogCompose_os_log;
  EMLogCompose_os_log = (uint64_t)v0;
}

id EMLogSearchableIndexStatus()
{
  if (EMLogSearchableIndexStatus_onceToken != -1) {
    dispatch_once(&EMLogSearchableIndexStatus_onceToken, &__block_literal_global_13_0);
  }
  os_log_t v0 = (void *)EMLogSearchableIndexStatus_os_log;
  return v0;
}

void __EMLogSearchableIndexStatus_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "SearchableIndexStatus");
  id v1 = (void *)EMLogSearchableIndexStatus_os_log;
  EMLogSearchableIndexStatus_os_log = (uint64_t)v0;
}

id EMLogBIMI()
{
  if (EMLogBIMI_onceToken != -1) {
    dispatch_once(&EMLogBIMI_onceToken, &__block_literal_global_16);
  }
  os_log_t v0 = (void *)EMLogBIMI_os_log;
  return v0;
}

void __EMLogBIMI_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "BIMI");
  id v1 = (void *)EMLogBIMI_os_log;
  EMLogBIMI_os_log = (uint64_t)v0;
}

void sub_1BF040AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF040FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_EMMailboxCategoryCloudStorage()
{
  if (_ef_log_EMMailboxCategoryCloudStorage_onceToken != -1) {
    dispatch_once(&_ef_log_EMMailboxCategoryCloudStorage_onceToken, &__block_literal_global_26);
  }
  os_log_t v0 = (void *)_ef_log_EMMailboxCategoryCloudStorage_log;
  return v0;
}

void sub_1BF0411E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF041514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF041890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF041B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF041CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF041E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF041F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF041FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0420B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0421A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF042238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0422C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF042350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04244C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0424C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0425E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0426C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0427B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF042988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF042B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF042C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF042D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF042E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF043194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF043254()
{
  JUMPOUT(0x1BF04323CLL);
}

void ___mailboxTypeOrder_block_invoke()
{
  os_log_t v0 = (void *)_mailboxTypeOrder_order;
  _mailboxTypeOrder_order = (uint64_t)&unk_1F1A61FE0;
}

void sub_1BF0432C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04331C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF043378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0433E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMMailboxRepository;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF0434C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04363C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF043744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04381C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

void sub_1BF0439A0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF043AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF043C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF043CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF043D90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF043ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF043F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0440E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1BF04418C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04426C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void sub_1BF0443E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF044490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04455C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04466C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF044700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04478C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF044814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04488C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0449CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF044A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF044AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF044D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF0450A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF045194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF045260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF045398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04547C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF045560(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF045628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF045684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0456D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF045928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF045AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF045B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF045C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF045D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF045DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF046034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF046230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF046438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF046B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF046BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF046E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF047050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0472EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0474F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF0475B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF047640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF047BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1BF047EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF047F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0480B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF048118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0482F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04842C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF048538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF048CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF048F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF049154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0493D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF049524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF049604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0496D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF049798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04985C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0498C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0499E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF049AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF049BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF049C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF049CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF049D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF049DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04A0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1BF04A208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04A36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04A624(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF04A848(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF04A914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04A96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04AA38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04AAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04AC3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04AD88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04AE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04AF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B03C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B4B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04B6FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF04B808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1BF04B9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04BA6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04BBD4(_Unwind_Exception *a1)
{
  size_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF04BDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Block_object_dispose((const void *)(v25 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BF04BEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04C99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04CAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04CB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04CC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04CD04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04CD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04CE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04CF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04D01C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF04D0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04D1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04D314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, os_unfair_lock_s locka, os_unfair_lock_s lock)
{
  _Unwind_Resume(a1);
}

void sub_1BF04D3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04D608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04D73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04D9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04DBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1BF04DD00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04DE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04DF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04E2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF04E408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04E554(_Unwind_Exception *a1)
{
  size_t v8 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF04E6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04E740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMMessageList;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF04E8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04EA04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04EB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04ED0C(_Unwind_Exception *a1)
{
  unint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF04EDF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04EFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1BF04F130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04F334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF04F45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF04F5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF04F85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04FA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF04FBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04FD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF04FEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF04FFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF050044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF050098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0501BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF05024C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF050454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF050634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0506E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0507E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0509CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF050B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF050BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF050CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF050D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF050DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF050EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF050FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF051190(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF051304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF051494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0515C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0516BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF051898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF051A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF051C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF051D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF051E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF05201C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF052148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF05221C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0523FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05251C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0526F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF052804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF052894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF052A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF052BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF052C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF052DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF052EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF052F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0530AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF053194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF053250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF053300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF053684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42)
{
  os_unfair_lock_unlock(v43);
  _Block_object_dispose(&a37, 8);

  _Unwind_Resume(a1);
}

void sub_1BF0537BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0539E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF053AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF053BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF053CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF053D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF053DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF053E70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF053F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05413C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF054240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0542A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05459C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF0546D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF054780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF054898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF054AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF054BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF054C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0565DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0570A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37)
{
  _Unwind_Resume(a1);
}

uint64_t _groupedSenderMessageListItemsPropertiesAreEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 count] || objc_msgSend(v4, "count"))
  {
    uint64_t v5 = [v3 count];
    if (v5 != [v4 count])
    {
LABEL_17:
      uint64_t v11 = 0;
      goto LABEL_18;
    }
    for (unint64_t i = 0; i < [v3 count]; ++i)
    {
      id v7 = [v3 objectAtIndexedSubscript:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        size_t v8 = [v3 objectAtIndexedSubscript:i];
      }
      else
      {
        size_t v8 = 0;
      }

      uint64_t v9 = [v4 objectAtIndexedSubscript:i];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      int64_t v10 = [v4 objectAtIndexedSubscript:i];

      if (!v8 || !v10 || ([v8 arePropertiesEqual:v10] & 1) == 0)
      {
        uint64_t v9 = v10;
LABEL_16:

        goto LABEL_17;
      }
    }
  }
  uint64_t v11 = 1;
LABEL_18:

  return v11;
}

void sub_1BF057558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0579E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF057AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF057B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF057C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF058774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  if (!v25) {

  }
  _Unwind_Resume(a1);
}

void sub_1BF058E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF0590DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0591FC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF0592A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0598E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF05A940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05B490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05B964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF05BF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C1DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05C968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05CA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05CBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05CCA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05CDC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05CE6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05CFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05CFFC()
{
}

void sub_1BF05D0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D16C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D2D8()
{
}

void sub_1BF05D398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05D978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05DAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05DC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05DD00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05DE6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05DF48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E03C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05E890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05EAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05EBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id predicateFromPredicateIgnoringPredicates(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ((objc_msgSend(v3, "ef_matchesEverything") & 1) != 0 || objc_msgSend(v3, "ef_matchesNothing")) {
    goto LABEL_3;
  }
  if ([v4 containsObject:v3])
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_3:
    id v5 = v3;
LABEL_4:
    size_t v6 = v5;
    goto LABEL_5;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __predicateFromPredicateIgnoringPredicates_block_invoke;
  v8[3] = &unk_1E63E4EA0;
  id v9 = v4;
  size_t v6 = predicateFromCompoundPredicateWithChangeBlock(v3, v8);

LABEL_5:
  return v6;
}

void sub_1BF05ED44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id __predicateFromPredicateIgnoringPredicates_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = predicateFromPredicateIgnoringPredicates(a2, *(void *)(a1 + 32));
  return v2;
}

void sub_1BF05EF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05F1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05F358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05F6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF05F798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05F804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05FA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BF05FC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF05FEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id normalizedForNotCompoundPredicate(void *a1)
{
  id v1 = a1;
  if ([v1 compoundPredicateType])
  {
    uint64_t v2 = [v1 subpredicates];
    id v3 = objc_msgSend(v2, "ef_map:", &__block_literal_global_137);

    if ([v1 compoundPredicateType] == 1) {
      [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v3];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];
    }
  }
  else
  {
    id v3 = [v1 subpredicates];
    uint64_t v4 = [v3 firstObject];
  }
  id v5 = (void *)v4;

  return v5;
}

void sub_1BF05FFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __normalizedForNotCompoundPredicate_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v2 compoundPredicateType])
  {
    id v5 = [v2 subpredicates];
    id v3 = [v5 firstObject];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v2];
  }

  return v3;
}

void sub_1BF0600B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id resolveSetsForAnd(void *a1, void *a2, BOOL *a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v5 count])
  {
    *a3 = 0;
    if ([v6 count]) {
      [v5 minusSet:v6];
    }
    objc_msgSend(v5, "ef_notEmpty");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v5)
  {
    *a3 = 0;
    id v7 = v5;
LABEL_7:
    id v8 = v7;
    goto LABEL_8;
  }
  id v8 = v6;
  *a3 = [v8 count] != 0;
LABEL_8:

  return v8;
}

void sub_1BF06019C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __combinedMailboxScopeForMailboxScopesHelper_block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __combinedMailboxScopeForMailboxScopesHelper_block_invoke_2;
  v10[3] = &unk_1E63E4FB0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v12 = v6;
  char v13 = a2;
  uint64_t v7 = objc_msgSend(v4, "ef_filter:", v10);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1BF060278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL __combinedMailboxScopeForMailboxScopesHelper_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) mailboxTypeForMailboxObjectID:a2];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [NSNumber numberWithInteger:v3];
  LODWORD(v4) = [v4 containsObject:v5];

  return *(unsigned __int8 *)(a1 + 48) == v4;
}

void sub_1BF060304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __combinedMailboxScopeForMailboxScopesHelper_block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __combinedMailboxScopeForMailboxScopesHelper_block_invoke_4;
  v7[3] = &unk_1E63E5000;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v5 = objc_msgSend(v2, "ef_any:", v7);

  return v5;
}

void sub_1BF0603B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t __combinedMailboxScopeForMailboxScopesHelper_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) mailboxTypeForMailboxObjectID:v3];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = [NSNumber numberWithInteger:v4];
  uint64_t v7 = [v5 containsObject:v6] ^ 1;

  return v7;
}

void sub_1BF060448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __combinedMailboxScopeForMailboxScopesHelper_block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __combinedMailboxScopeForMailboxScopesHelper_block_invoke_6;
  v7[3] = &unk_1E63E5000;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v5 = objc_msgSend(v2, "ef_all:", v7);

  return v5;
}

void sub_1BF060508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t __combinedMailboxScopeForMailboxScopesHelper_block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) mailboxTypeForMailboxObjectID:v3];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = [NSNumber numberWithInteger:v4];
  uint64_t v7 = [v5 containsObject:v6] ^ 1;

  return v7;
}

void sub_1BF060598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __combinedMailboxScopeForMailboxScopesHelper_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 excludeTypes] & 1) != 0 || (objc_msgSend(v2, "excludeMailboxes"))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 mailboxTypes];
    if (EFSetsAreEqual())
    {
      uint64_t v5 = [v2 mailboxObjectIDs];
      uint64_t v3 = EFSetsAreEqual();
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

void sub_1BF060660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id mailboxScopeForMessageObjectIDConstantValue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[EMMailboxScope allMailboxesScope];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = +[EMObjectID objectIDFromSerializedRepresentation:v3];
    uint64_t v7 = [v6 mailboxScope];
LABEL_6:
    id v8 = (void *)v7;

    uint64_t v5 = v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    uint64_t v6 = objc_msgSend(v3, "ef_map:", &__block_literal_global_155);
    uint64_t v7 = combinedMailboxScopeForMailboxScopes(v6, v4, 0);
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

void sub_1BF060798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __mailboxScopeForMailboxObjectIDValue_block_invoke(uint64_t a1, void *a2)
{
  id v2 = mailboxObjectIDForConstantValue(a2);
  return v2;
}

id __mailboxScopeForMessageObjectIDConstantValue_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[EMObjectID objectIDFromSerializedRepresentation:a2];
  id v3 = [v2 mailboxScope];

  return v3;
}

void sub_1BF060858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0608F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF060B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF060C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF060CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF060E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0613DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1BF061678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF061EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF061FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF06205C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06234C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06260C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0626D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0628F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF062AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF062D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMMessageRepository;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF062DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1BF062EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF062FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF063038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF063180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0632B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF063418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF06355C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF063D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,void *a48,void *a49,uint64_t a50,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1BF06404C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0641E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF064600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1BF0647D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06496C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF064A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF064AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF064C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF064F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF0651DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1BF065330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06562C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1BF0658E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0659B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF065CA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v4);
  _Unwind_Resume(a1);
}

void sub_1BF065DF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF065EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF065F38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF065FC0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF066058(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF0660E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0661D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF066454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  os_unfair_lock_unlock(v26);
  _Unwind_Resume(a1);
}

void sub_1BF066738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v18 = v16;

  _Unwind_Resume(a1);
}

void sub_1BF0668A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF066978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF066C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF066F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0671C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1BF067378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06751C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0676C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF067954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF067AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF067D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF068054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0681EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0684C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0686B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF068814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0688B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF068CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, os_unfair_lock_t lock, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  _Unwind_Resume(a1);
}

void sub_1BF069020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BF0690E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF069154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF069214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1BF0693DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1BF0694D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF069604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF069708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0698B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1BF0699EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF069B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF069B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF069C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v15 = v14;

  _Unwind_Resume(a1);
}

void sub_1BF069CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF069D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF069E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06A020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06A140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06A1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF06A318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF06A478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF06A608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  long long v21 = v20;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1BF06A758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF06A99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1BF06AAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06AC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1BF06AD88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06AEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF06AFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF06B108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06B1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF06B264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF06B38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06B42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06B498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06B538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06B6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1BF06B76C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF06B7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF06B974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06BAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06BBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06BD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06BE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06BFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1BF06C148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06C218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06C374(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF06C460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06C6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void -[EMMessageRepository _blockedSendersDidChange:](EMMessageRepository *self, SEL a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"EMBlockedSenderManagerBlockedSendersKey"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"EMBlockedSenderManagerIsBlockedSenderEnabledKey"];
  char v8 = [v7 BOOLValue];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__EMMessageRepository__blockedSendersDidChange___block_invoke;
  v11[3] = &unk_1E63E58D8;
  char v14 = v8;
  id v9 = v6;
  id v12 = v9;
  char v13 = self;
  int64_t v10 = (void *)MEMORY[0x1C18A2160](v11);
  [(EMMessageRepository *)self _broadcastMessageListItemChangesToObservers:v10 forObjectIDs:0];
}

void sub_1BF06C868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06CAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF06CBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06CC40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06CCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06CF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06D030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06D09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06D10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06D43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1BF06D648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06D8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_EMMessageRepositoryQueryObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF06D928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06DA70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06DE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF06E45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF06E574(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF06E624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06E9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06EBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06EC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_EMMessageRepositoryMailboxPredictionObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF06EC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06EDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF06EE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1BF06EFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06F024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_EMOneTimeCodeObserver;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF06F224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_1BF06F2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06F3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06F494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF06F5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06F740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BF06F800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF06F91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06FAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06FC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF06FEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF070044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0701B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF070368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF070468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF070574(_Unwind_Exception *a1)
{
  id v3 = v1;

  _Unwind_Resume(a1);
}

void sub_1BF070760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF070944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF070A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1BF070C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF070CC0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF070D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF070E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF070ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07108C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0712FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0713E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0714D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0715A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07167C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0717C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0718C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF071A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF071B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF071CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF071D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF071E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF071F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF071F9C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF072054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0721B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0725B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0726B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___registerEMErrorDomainUserInfoValueProvider_block_invoke()
{
  return [MEMORY[0x1E4F28C58] setUserInfoValueProviderForDomain:@"EMErrorDomain" provider:&__block_literal_global_20];
}

id ___registerEMErrorDomainUserInfoValueProvider_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (![v5 isEqualToString:*MEMORY[0x1E4F28228]])
  {
    id v9 = 0;
    goto LABEL_26;
  }
  uint64_t v6 = [v4 code];
  if (v6 <= 1025)
  {
    if (v6 > 1023)
    {
      if (v6 != 1024)
      {
        BOOL v7 = v6 == 1025;
        char v8 = @"EMItemTemporarilyUnavailableError";
LABEL_20:
        if (v7) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
        goto LABEL_26;
      }
      long long v18 = NSString;
      uint64_t v15 = [v4 userInfo];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"itemID"];
      uint64_t v17 = [v18 stringWithFormat:@"Item not found (itemID: %@)", v16];
    }
    else
    {
      if (v6 != 1)
      {
        BOOL v7 = v6 == 2;
        char v8 = @"EMConnectionInvalidated";
        goto LABEL_20;
      }
      char v14 = NSString;
      uint64_t v15 = [v4 userInfo];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"reason"];
      uint64_t v17 = [v14 stringWithFormat:@"Internal error (reason: %@)", v16];
    }
    id v9 = (void *)v17;

    goto LABEL_26;
  }
  int64_t v10 = @"EMContentCorruptError";
  id v11 = @"EMContentLoadFailedError";
  if (v6 != 2050) {
    id v11 = 0;
  }
  if (v6 != 2049) {
    int64_t v10 = v11;
  }
  id v12 = @"EMItemTimeoutError";
  char v13 = @"EMContentUnavailableError";
  if (v6 != 2048) {
    char v13 = 0;
  }
  if (v6 != 1026) {
    id v12 = v13;
  }
  if (v6 <= 2048) {
    id v9 = v12;
  }
  else {
    id v9 = v10;
  }
LABEL_26:

  return v9;
}

void sub_1BF07289C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF072FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0730D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0732E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07346C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0734EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07360C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF073680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07379C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF073998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF073FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int64_t v10 = v9;

  a9.super_class = (Class)EMOneTimeCodeAccelerator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF074120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07434C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF07468C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07483C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF074B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF074F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF075168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0752FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07539C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF075430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0754E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07562C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF075754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07586C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0759A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF075A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF075AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF075C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF075D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF075E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF075E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF075EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMOutgoingMessageRepository;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF0760E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0762E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0764D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF076528()
{
}

void sub_1BF076668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0768A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF076A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF076C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF076C88()
{
}

void sub_1BF076DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF076F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF077004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF077218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07745C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0775B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0776DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF077830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF077958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF077C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF077D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF077E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF077EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF077FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0780B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF078408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

void sub_1BF0785A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF078658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0787CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07897C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0789F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF078B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF078B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF078CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF078D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF078E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF078FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF079080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v11);

  _Unwind_Resume(a1);
}

void sub_1BF079234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  os_unfair_lock_unlock(v12);

  _Unwind_Resume(a1);
}

void sub_1BF07946C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07955C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF079664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF079788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF079924(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF079A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF079C2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF079CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF079E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF079E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07A168(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF07A32C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07A470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF07A6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF07A978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF07AD14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07AF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07B958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07BAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07BD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07BE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF07BF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07BFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMRemoteConnectionRecoveryAssertion;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF07C514(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF07C5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C85C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07C9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07CABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07CBCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07CD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07CF54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07D9FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __defaultReattemptingHandlerForConnection_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 domain];
  if ([v3 isEqualToString:@"EMErrorDomain"])
  {
    uint64_t v4 = [v2 code];

    if (v4 == 2)
    {
      id v5 = +[EMRemoteConnection log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v2, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __defaultReattemptingHandlerForConnection_block_invoke_cold_1();
      }
      uint64_t v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v5 = +[EMRemoteConnection log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __defaultReattemptingHandlerForConnection_block_invoke_cold_2();
  }
  uint64_t v6 = 1;
LABEL_10:

  return v6;
}

void sub_1BF07DB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __defaultNonReattemptingHandlerForConnection_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EMRemoteConnection log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __defaultNonReattemptingHandlerForConnection_block_invoke_cold_1();
  }

  return 0;
}

void sub_1BF07DC5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __nonReattemptingHandlerForErrorHandler_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }

  return 0;
}

void sub_1BF07DCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07DD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07DE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07DF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E06C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07E8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07EB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  _Unwind_Resume(a1);
}

void sub_1BF07ED40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF07EE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF07EF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07F264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1BF07F3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07F4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF07F564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF07F6A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07F870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _ef_log_EMRemoteContentURLSession()
{
  if (_ef_log_EMRemoteContentURLSession_onceToken != -1) {
    dispatch_once(&_ef_log_EMRemoteContentURLSession_onceToken, &__block_literal_global_45);
  }
  os_log_t v0 = (void *)_ef_log_EMRemoteContentURLSession_log;
  return v0;
}

void sub_1BF07FB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF07FC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF080168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0802CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08038C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF080478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08052C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF080680(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void sub_1BF0807D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF08086C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF080AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1BF080BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08137C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1BF081A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1BF081BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF081DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF081EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void EMPrivacyProxyIsDisabledForNetwork(void *a1)
{
  id v1 = a1;
  if (EMPrivacyProxyIsDisabledForNetwork_onceToken != -1) {
    dispatch_once(&EMPrivacyProxyIsDisabledForNetwork_onceToken, &__block_literal_global_46);
  }
  id v2 = (void *)MEMORY[0x1E4F7A140];
  uint64_t v3 = EMPrivacyProxyIsDisabledForNetwork_sPrivacyProxyStatusQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __EMPrivacyProxyIsDisabledForNetwork_block_invoke_2;
  v5[3] = &unk_1E63E60B0;
  id v6 = v1;
  id v4 = v1;
  [v2 getServiceStatus:v3 completionHandler:v5];
}

void sub_1BF082038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __EMPrivacyProxyIsDisabledForNetwork_block_invoke()
{
  os_log_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.email.EMRemoteContentURLSchemeHandler.privacyProxyStatusQueue", v0);
  id v2 = (void *)EMPrivacyProxyIsDisabledForNetwork_sPrivacyProxyStatusQueue;
  EMPrivacyProxyIsDisabledForNetwork_sPrivacyProxyStatusQueue = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.email", "EMRemoteContentURLUtilities");
  id v4 = (void *)EMPrivacyProxyIsDisabledForNetwork_sLog;
  EMPrivacyProxyIsDisabledForNetwork_sLog = (uint64_t)v3;
}

void __EMPrivacyProxyIsDisabledForNetwork_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = EMPrivacyProxyIsDisabledForNetwork_sLog;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)EMPrivacyProxyIsDisabledForNetwork_sLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "Got service status: %{public}@", buf, 0xCu);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v8 = objc_msgSend(v5, "networkStatuses", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * v11) networkStatus]) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v12 = (id)EMPrivacyProxyIsDisabledForNetwork_sLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = objc_msgSend(v6, "ef_publicDescription");
      __EMPrivacyProxyIsDisabledForNetwork_block_invoke_2_cold_1(v13, buf, v12);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1BF0822A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08234C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0823F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0824B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08254C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF082628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF082690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF082818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08294C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF082A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF082AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF082B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF082CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF082DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF082EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF082F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF082FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF083078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF083178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1BF083224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF083F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(v75);
  objc_destroyWeak(v74);
  objc_destroyWeak(location);
  objc_destroyWeak(&a65);

  _Unwind_Resume(a1);
}

void sub_1BF08420C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF084288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08435C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08441C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0844A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0845D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08463C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0846AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF084720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF084788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF084814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0848A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF084924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)EMSearchableIndexQuery;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF084ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF084BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF084DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF084E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF084F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08500C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0850B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF085174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF085280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF085350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08548C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08554C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0855FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0856D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08574C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0857D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1BF08583C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF085B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF085CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF085E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF085F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF086100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08629C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF086414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0865C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0867EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF086978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF086A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF086B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08706C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF087288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF087580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0876FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF087954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF087AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF087CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF087E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF087F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF087FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF087FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0880E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF088188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08835C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF088444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0885E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0886CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0889AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0892EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF089608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF089704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF089828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF0898D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0899A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF089ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF089B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF089CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF089D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF089EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,id location)
{
  _Unwind_Resume(a1);
}

void sub_1BF08A884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08A8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08A94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMSearchableIndexTopHitsQuery;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF08AB78(_Unwind_Exception *a1)
{
  id v5 = v3;
  objc_destroyWeak(v5);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 56));

  _Unwind_Resume(a1);
}

void sub_1BF08AC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08AC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08ACFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08AD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08AF7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08B1B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08B5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08BB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08BCB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08BD10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08BD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08BF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08BFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08C1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class __getSFMailRankingSignalsClass_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (!SearchFoundationLibraryCore_frameworkLibrary)
  {
    v7[1] = (void *)MEMORY[0x1E4F143A8];
    v7[2] = (void *)3221225472;
    v7[3] = __SearchFoundationLibraryCore_block_invoke;
    void v7[4] = &__block_descriptor_40_e5_v8__0l;
    v7[5] = v7;
    long long v8 = xmmword_1E63E62F8;
    uint64_t v9 = 0;
    SearchFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SearchFoundationLibraryCore_frameworkLibrary)
  {
    os_log_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *SearchFoundationLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"EMSearchableIndexTopHitsQuery.m", 19, @"%s", v7[0]);

    goto LABEL_10;
  }
  if (v7[0]) {
    free(v7[0]);
  }
  Class result = objc_getClass("SFMailRankingSignals");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"Class getSFMailRankingSignalsClass(void)_block_invoke"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"EMSearchableIndexTopHitsQuery.m", 20, @"Unable to find class %s", "SFMailRankingSignals");

LABEL_10:
    __break(1u);
  }
  getSFMailRankingSignalsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BF08C674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __SearchFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BF08C7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08C8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08C9D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CF84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08CFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF08D2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D4C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1BF08D948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF08D9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08DA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08DB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF08DD08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08DEAC(_Unwind_Exception *exception_object)
{
}

void sub_1BF08DFCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E118()
{
}

void sub_1BF08E1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF08E6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E79C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08E830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1BF08E8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF08E9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF08EA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08EB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08EC80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08EDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1BF08EE28()
{
}

void sub_1BF08EEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1BF08F080()
{
}

void sub_1BF08F120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08F970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08FACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF08FBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08FC50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08FCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF08FD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08FDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF08FF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1BF090088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0902B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1BF0904A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09064C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF0907B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF090834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0909B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF090B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF090C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF090DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF090F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF0910A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0911DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF091344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0914D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF09167C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF091778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0918C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF091A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Block_object_dispose((const void *)(v24 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BF091B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF091C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF091DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF091F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0920EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Block_object_dispose((const void *)(v24 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BF0921A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09230C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09245C(_Unwind_Exception *a1)
{
}

void sub_1BF092550(_Unwind_Exception *a1)
{
}

void sub_1BF092644(_Unwind_Exception *a1)
{
}

void sub_1BF09271C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0927A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF092824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0928EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF092A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF092ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF092B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF092C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF092D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF092E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF092EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF092F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF092FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0931AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0932C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09337C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09345C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0935C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF09371C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0937B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09381C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0938AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF093DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF093F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF0940A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09413C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0941A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0942D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09438C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0944FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0945E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0947C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09487C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0949B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF094BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMSender;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF094E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF094FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0950FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0952A0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF0953B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF095474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF095530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF095790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF095848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF095B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BF095DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF095E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF095F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF095FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF096040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF096184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF096284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0963BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id _ef_log_EMServerConfiguration()
{
  if (_ef_log_EMServerConfiguration_onceToken != -1) {
    dispatch_once(&_ef_log_EMServerConfiguration_onceToken, &__block_literal_global_51);
  }
  os_log_t v0 = (void *)_ef_log_EMServerConfiguration_log;
  return v0;
}

void sub_1BF096544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0966AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF0968E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF096A70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF096B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF096BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF096C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF096CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF096DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromEMSmartMailboxType(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t result = @"Flagged";
      break;
    case 2:
      uint64_t result = @"Unread";
      break;
    case 3:
      uint64_t result = @"Includes Me";
      break;
    case 4:
      uint64_t result = @"Has Attachments";
      break;
    case 5:
      uint64_t result = @"Notify Threads";
      break;
    case 6:
      uint64_t result = @"Today";
      break;
    case 7:
      uint64_t result = @"Mute Threads";
      break;
    case 8:
      if ((unint64_t)(a2 - 1) >= 7) {
        uint64_t result = @"Unified";
      }
      else {
        uint64_t result = off_1E63E6760[a2 - 1];
      }
      break;
    case 9:
      uint64_t result = @"Read Later";
      break;
    case 10:
      uint64_t result = @"Follow Up";
      break;
    case 11:
      uint64_t result = @"Send Later";
      break;
    case 12:
      uint64_t result = @"Unsubscribe";
      break;
    case 13:
      uint64_t result = @"Spotlight";
      break;
    default:
      uint64_t result = @"VIP";
      break;
  }
  return result;
}

void sub_1BF096FD4(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0970D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0971D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0972D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0973D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0974D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0975D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0976D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0977D0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0978CC(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0979C8(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF097AC4(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF097BC0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF097CBC(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF097DB8(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF097EB4(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF097FB0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0980AC(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF098220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF098328(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0984AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF0985B4(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF0986E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF0987F0(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF09891C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF098B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF098BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF098C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_EMSMIMEUtilities()
{
  if (_ef_log_EMSMIMEUtilities_onceToken != -1) {
    dispatch_once(&_ef_log_EMSMIMEUtilities_onceToken, &__block_literal_global_53);
  }
  os_log_t v0 = (void *)_ef_log_EMSMIMEUtilities_log;
  return v0;
}

void sub_1BF0992BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_1BF09947C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF099518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0996D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF099AB8(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF099BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF099CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF099F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF09A2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09ADB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09B9E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09BD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,void *a34,void *a35,void *a36,void *a37)
{
  _Unwind_Resume(a1);
}

void sub_1BF09C3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09C6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09C7D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09C8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09C970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09C9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09CBA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09CD04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09CE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D33C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09D918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09DA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF09DB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09DC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09DD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09E0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF09E16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09E35C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09E4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09E5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09E77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09E824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09E950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09EAB0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF09EB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09EC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09ECE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09EE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09EF80(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF09F194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09F2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF09F634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF09F7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF09FA04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *_NSU9ChangeReasonString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown change reason (%lu)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E63E68A8[a1];
  }
  return v1;
}

void sub_1BF09FBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF09FFAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A036C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A08A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A092C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0BA0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF0A0C44(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1BF0A0CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A0D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A1064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, os_unfair_lock_t lock, void *a12)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1BF0A117C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A11F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A142C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A166C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A17D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A18DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A19F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A1AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A1AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A1C5C(_Unwind_Exception *a1)
{
  long long v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1BF0A1CB0()
{
}

void sub_1BF0A1DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1BF0A1E58(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF0A2010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A20CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A212C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)EMVIPManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF0A23A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v21);
  _Unwind_Resume(a1);
}

void sub_1BF0A24C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A265C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A270C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF0A277C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A28CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A29D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A2B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  os_unfair_lock_unlock(v15);
  _Unwind_Resume(a1);
}

void sub_1BF0A2BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A2C4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v3);

  _Unwind_Resume(a1);
}

void sub_1BF0A2DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A2E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A2FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A30B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A31B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A329C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A3348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A33FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A3504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A35F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A36D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A396C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A3E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A3FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __sharedClientVIPManager_block_invoke()
{
  os_log_t v0 = objc_alloc_init(EMDaemonInterface);
  uint64_t v1 = (void *)sharedClientVIPManager_daemonInterface;
  sharedClientVIPManager_daemonInterface = (uint64_t)v0;

  uint64_t v2 = [(id)sharedClientVIPManager_daemonInterface vipManager];
  os_log_t v3 = (void *)sharedClientVIPManager_vipManager;
  sharedClientVIPManager_vipManager = v2;
}

void sub_1BF0A4254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF0A4384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v13 = v12;

  _Unwind_Resume(a1);
}

uint64_t sub_1BF0A4470()
{
  uint64_t v0 = sub_1BF0A9618();
  __swift_allocate_value_buffer(v0, qword_1EB5BCFE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB5BCFE8);
  return sub_1BF0A9608();
}

id sub_1BF0A44F4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EMGenerativeModelsAvailability()), sel_init);
  qword_1EB5BD000 = (uint64_t)result;
  return result;
}

BOOL sub_1BF0A46F8()
{
  uint64_t v0 = sub_1BF0A9578();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  id v6 = (char *)&v13 - v5;
  if (qword_1EB5BD008 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1EB5BD000 + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  swift_beginAccess();
  long long v8 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v8(v6, v7, v0);
  v8(v4, (uint64_t)v6, v0);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v4, v0);
  int v10 = *MEMORY[0x1E4F63D30];
  uint64_t v11 = *(void (**)(char *, uint64_t))(v1 + 8);
  if (v9 != *MEMORY[0x1E4F63D30]) {
    v11(v4, v0);
  }
  v11(v6, v0);
  return v9 == v10;
}

BOOL sub_1BF0A4A8C()
{
  uint64_t v0 = sub_1BF0A9578();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  id v6 = (char *)&v12 - v5;
  if (qword_1EB5BD008 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1EB5BD000 + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  swift_beginAccess();
  long long v8 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v8(v6, v7, v0);
  v8(v4, (uint64_t)v6, v0);
  BOOL v9 = (*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v4, v0) == *MEMORY[0x1E4F63C38];
  int v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  v10(v6, v0);
  return v9;
}

char *sub_1BF0A4C50()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v62 = sub_1BF0A9618();
  uint64_t v56 = *(void *)(v62 - 8);
  MEMORY[0x1F4188790](v62);
  v55 = (char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1BF0A9578();
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v2);
  v53 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  v57 = (char *)&v51 - v6;
  MEMORY[0x1F4188790](v5);
  long long v8 = (char *)&v51 - v7;
  uint64_t v9 = sub_1BF0A9598();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1BF0A95E8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  long long v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityNotification] = 0;
  long long v17 = v0;
  sub_1BF0A9588();
  sub_1BF0A95C8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  id v58 = v16;
  uint64_t v59 = v14;
  long long v18 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  long long v19 = v16;
  uint64_t v20 = v2;
  uint64_t v60 = v13;
  uint64_t v21 = v13;
  uint64_t v22 = v54;
  v18(&v17[OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availability], v19, v21);
  swift_beginAccess();
  sub_1BF0A95A8();
  swift_endAccess();
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(&v17[OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState], v8, v2);

  uint64_t v23 = (objc_class *)type metadata accessor for EMGenerativeModelsAvailability();
  v64.receiver = v17;
  v64.super_class = v23;
  id v24 = objc_msgSendSuper2(&v64, sel_init);
  uint64_t v25 = qword_1EB5BCFC8;
  id v26 = v24;
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v27 = v62;
  uint64_t v28 = __swift_project_value_buffer(v62, (uint64_t)qword_1EB5BCFE8);
  id v30 = v55;
  uint64_t v29 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v55, v28, v27);
  v31 = (char *)v26;
  id v32 = sub_1BF0A95F8();
  int v33 = sub_1BF0A9658();
  if (os_log_type_enabled(v32, (os_log_type_t)v33))
  {
    int v52 = v33;
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v63 = v51;
    *(_DWORD *)uint64_t v34 = 136315138;
    swift_beginAccess();
    v35 = v57;
    sub_1BF0A95A8();
    swift_endAccess();
    uint64_t v36 = v53;
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v53, v35, v20);
    int v37 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v36, v20);
    if (v37 == *MEMORY[0x1E4F63C38])
    {
      uint64_t v38 = *(void (**)(char *, uint64_t))(v22 + 8);
      v38(v36, v20);
      unint64_t v39 = 0xEA00000000006465;
      uint64_t v40 = 0x7463697274736552;
    }
    else if (v37 == *MEMORY[0x1E4F63C50])
    {
      uint64_t v38 = *(void (**)(char *, uint64_t))(v22 + 8);
      v38(v36, v20);
      unint64_t v39 = 0xEB00000000656C62;
      uint64_t v40 = 0x616C696176616E55;
    }
    else
    {
      uint64_t v38 = *(void (**)(char *, uint64_t))(v22 + 8);
      if (v37 == *MEMORY[0x1E4F63D30])
      {
        unint64_t v39 = 0xE900000000000065;
        uint64_t v40 = 0x6C62616C69617641;
      }
      else
      {
        v38(v36, v20);
        unint64_t v39 = 0xE700000000000000;
        uint64_t v40 = 0x6E776F6E6B6E55;
      }
    }
    v38(v57, v20);
    uint64_t v65 = sub_1BF0A6558(v40, v39, &v63);
    sub_1BF0A9668();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BEFDB000, v32, (os_log_type_t)v52, "Current GenerativeModelsAvailability: %s", v34, 0xCu);
    uint64_t v41 = v51;
    swift_arrayDestroy();
    MEMORY[0x1C18A2500](v41, -1, -1);
    MEMORY[0x1C18A2500](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v62);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v27);
  }
  uint64_t v42 = &v31[OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availability];
  swift_beginAccess();
  v43 = v58;
  uint64_t v44 = v59;
  uint64_t v45 = v60;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v58, v42, v60);
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = ObjectType;
  *(void *)(v47 + 16) = v46;
  *(void *)(v47 + 24) = v48;
  swift_retain();
  uint64_t v49 = sub_1BF0A95D8();
  swift_release();

  (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  swift_release();
  *(void *)&v31[OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityNotification] = v49;
  swift_release();
  return v31;
}

void sub_1BF0A5408(NSObject *a1, uint64_t a2)
{
  uint64_t v4 = sub_1BF0A9618();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v105 = &v92[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v6);
  v104 = &v92[-v8];
  uint64_t v9 = sub_1BF0A9578();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = &v92[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  os_log_t v98 = (os_log_t)&v92[-v15];
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  long long v18 = &v92[-v17];
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  v101 = &v92[-v20];
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  v97 = &v92[-v22];
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v25 = &v92[-v24];
  uint64_t v26 = MEMORY[0x1F4188790](v23);
  uint64_t v100 = (uint64_t)&v92[-v27];
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  v103 = &v92[-v29];
  MEMORY[0x1F4188790](v28);
  v31 = &v92[-v30];
  swift_beginAccess();
  uint64_t v32 = MEMORY[0x1C18A2540](a2 + 16);
  if (v32)
  {
    int v33 = (void *)v32;
    uint64_t v108 = v5;
    uint64_t v109 = v4;
    uint64_t v34 = v32 + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
    swift_beginAccess();
    v35 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16);
    uint64_t v110 = v10 + 16;
    v112 = v35;
    v35(v31, (unsigned char *)v34, v9);
    sub_1BF0A6C0C();
    v106 = a1;
    char v36 = sub_1BF0A9628();
    uint64_t v107 = v10;
    int v37 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
    uint64_t v111 = v10 + 8;
    v102 = (void (*)(os_log_t, uint64_t))v37;
    v37(v31, v9);
    uint64_t v99 = v34;
    if (v36)
    {
      v104 = v13;
      if (qword_1EB5BCFC8 != -1) {
        swift_once();
      }
      uint64_t v38 = v109;
      uint64_t v39 = __swift_project_value_buffer(v109, (uint64_t)qword_1EB5BCFE8);
      uint64_t v40 = v108;
      uint64_t v41 = v105;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v108 + 16))(v105, v39, v38);
      uint64_t v42 = v101;
      v43 = v112;
      v112(v101, v106, v9);
      id v44 = v33;
      uint64_t v45 = sub_1BF0A95F8();
      LODWORD(v103) = sub_1BF0A9648();
      v106 = v45;
      if (!os_log_type_enabled(v45, (os_log_type_t)v103))
      {

        v102(v42, v9);
        (*(void (**)(unsigned char *, uint64_t))(v40 + 8))(v41, v38);
        return;
      }
      uint64_t v100 = 0x7463697274736552;
      uint64_t v46 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v114[0] = v47;
      *(_DWORD *)uint64_t v46 = 136315394;
      v43(v18, v42, v9);
      uint64_t v48 = *(uint64_t (**)(unsigned char *, uint64_t))(v107 + 88);
      v107 += 88;
      int v49 = v48(v18, v9);
      int v50 = *MEMORY[0x1E4F63C38];
      uint64_t v51 = 0x7463697274736552;
      unint64_t v52 = 0xEA00000000006465;
      v97 = (unsigned char *)v47;
      v96 = v48;
      if (v49 != v50)
      {
        uint64_t v51 = 0x616C696176616E55;
        unint64_t v52 = 0xEB00000000656C62;
        if (v49 != *MEMORY[0x1E4F63C50])
        {
          if (v49 == *MEMORY[0x1E4F63D30])
          {
            unint64_t v52 = 0xE900000000000065;
            uint64_t v51 = 0x6C62616C69617641;
            v53 = v102;
LABEL_21:
            uint64_t v113 = sub_1BF0A6558(v51, v52, v114);
            sub_1BF0A9668();
            swift_bridgeObjectRelease();
            v53(v42, v9);
            *(_WORD *)(v46 + 12) = 2080;
            os_log_t v68 = v98;
            v69 = (void (*)(unsigned char *, os_log_t, uint64_t))v112;
            v112(v98, (unsigned char *)v99, v9);
            id v70 = v104;
            v69(v104, v68, v9);
            int v71 = v96(v70, v9);
            BOOL v72 = v71 == v50;
            uint64_t v74 = v108;
            uint64_t v73 = v109;
            unint64_t v75 = 0xEA00000000006465;
            if (!v72)
            {
              int v76 = *MEMORY[0x1E4F63C50];
              uint64_t v100 = 0x616C696176616E55;
              unint64_t v75 = 0xEB00000000656C62;
              if (v71 != v76)
              {
                if (v71 == *MEMORY[0x1E4F63D30])
                {
                  unint64_t v75 = 0xE900000000000065;
                  uint64_t v100 = 0x6C62616C69617641;
LABEL_33:
                  v53(v68, v9);
                  uint64_t v113 = sub_1BF0A6558(v100, v75, v114);
                  sub_1BF0A9668();

                  swift_bridgeObjectRelease();
                  long long v86 = v106;
                  _os_log_impl(&dword_1BEFDB000, v106, (os_log_type_t)v103, "GenerativeModelsAvailability changed to: %s, but was already: %s. Skipping availability-change notification", (uint8_t *)v46, 0x16u);
                  v87 = v97;
                  swift_arrayDestroy();
                  MEMORY[0x1C18A2500](v87, -1, -1);
                  MEMORY[0x1C18A2500](v46, -1, -1);

                  (*(void (**)(unsigned char *, uint64_t))(v74 + 8))(v105, v73);
                  return;
                }
                uint64_t v100 = 0x6E776F6E6B6E55;
                unint64_t v75 = 0xE700000000000000;
              }
            }
            v53((os_log_t)v104, v9);
            goto LABEL_33;
          }
          uint64_t v51 = 0x6E776F6E6B6E55;
          unint64_t v52 = 0xE700000000000000;
        }
      }
      v53 = v102;
      v102((os_log_t)v18, v9);
      goto LABEL_21;
    }
    if (qword_1EB5BCFC8 != -1) {
      swift_once();
    }
    uint64_t v54 = v109;
    uint64_t v55 = __swift_project_value_buffer(v109, (uint64_t)qword_1EB5BCFE8);
    uint64_t v56 = v108;
    v57 = v104;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v108 + 16))(v104, v55, v54);
    id v58 = v103;
    v112(v103, v106, v9);
    id v59 = v33;
    uint64_t v60 = sub_1BF0A95F8();
    LODWORD(v105) = sub_1BF0A9658();
    if (!os_log_type_enabled(v60, (os_log_type_t)v105))
    {

      v102((os_log_t)v58, v9);
      (*(void (**)(unsigned char *, uint64_t))(v56 + 8))(v57, v54);
      uint64_t v67 = v107;
      v112(v31, v106, v9);
LABEL_37:
      uint64_t v90 = v99;
      swift_beginAccess();
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v67 + 40))(v90, v31, v9);
      swift_endAccess();
      id v91 = objc_msgSend(self, sel_defaultCenter);
      objc_msgSend(v91, sel_postNotificationName_object_, @"EMGenerativeModelsAvailabilityDidChange", 0);

      return;
    }
    os_log_t v98 = v60;
    v101 = (unsigned char *)0xEA00000000006465;
    uint64_t v61 = swift_slowAlloc();
    v96 = (uint64_t (*)(unsigned char *, uint64_t))swift_slowAlloc();
    v114[0] = (uint64_t)v96;
    *(_DWORD *)uint64_t v61 = 136315394;
    uint64_t v62 = v100;
    uint64_t v63 = (void (*)(unsigned char *, uint64_t, uint64_t))v112;
    v112((unsigned char *)v100, (unsigned char *)v99, v9);
    v63(v25, v62, v9);
    v94 = *(uint64_t (**)(unsigned char *, uint64_t))(v107 + 88);
    int v64 = v94(v25, v9);
    uint64_t v65 = 0x7463697274736552;
    unint64_t v66 = 0xEA00000000006465;
    int v93 = *MEMORY[0x1E4F63C38];
    if (v64 != v93)
    {
      uint64_t v65 = 0x616C696176616E55;
      unint64_t v66 = 0xEB00000000656C62;
      if (v64 != *MEMORY[0x1E4F63C50])
      {
        if (v64 == *MEMORY[0x1E4F63D30])
        {
          unint64_t v66 = 0xE900000000000065;
          uint64_t v65 = 0x6C62616C69617641;
          v102((os_log_t)v100, v9);
LABEL_27:
          uint64_t v113 = sub_1BF0A6558(v65, v66, v114);
          sub_1BF0A9668();
          id v78 = v59;

          swift_bridgeObjectRelease();
          *(_WORD *)(v61 + 12) = 2080;
          v79 = v97;
          v80 = v103;
          v81 = (void (*)(unsigned char *, NSObject *, uint64_t))v112;
          v112(v97, v103, v9);
          int v82 = v94(v79, v9);
          uint64_t v67 = v107;
          uint64_t v83 = 0x7463697274736552;
          v95 = v78;
          if (v82 != v93)
          {
            int v84 = *MEMORY[0x1E4F63C50];
            uint64_t v83 = 0x616C696176616E55;
            v101 = (unsigned char *)0xEB00000000656C62;
            if (v82 != v84)
            {
              if (v82 == *MEMORY[0x1E4F63D30])
              {
                v101 = (unsigned char *)0xE900000000000065;
                uint64_t v83 = 0x6C62616C69617641;
                long long v85 = (void (*)(unsigned char *, uint64_t))v102;
LABEL_36:
                uint64_t v113 = sub_1BF0A6558(v83, (unint64_t)v101, v114);
                sub_1BF0A9668();
                swift_bridgeObjectRelease();
                v85(v80, v9);
                os_log_t v88 = v98;
                _os_log_impl(&dword_1BEFDB000, v98, (os_log_type_t)v105, "GenerativeModelsAvailability changed from: %s, to: %s", (uint8_t *)v61, 0x16u);
                v89 = (uint64_t (*)(void, void))v96;
                swift_arrayDestroy();
                MEMORY[0x1C18A2500](v89, -1, -1);
                MEMORY[0x1C18A2500](v61, -1, -1);

                (*(void (**)(unsigned char *, uint64_t))(v108 + 8))(v104, v109);
                id v59 = v95;
                v81(v31, v106, v9);
                goto LABEL_37;
              }
              uint64_t v83 = 0x6E776F6E6B6E55;
              v101 = (unsigned char *)0xE700000000000000;
            }
          }
          long long v85 = (void (*)(unsigned char *, uint64_t))v102;
          v102((os_log_t)v79, v9);
          goto LABEL_36;
        }
        uint64_t v65 = 0x6E776F6E6B6E55;
        unint64_t v66 = 0xE700000000000000;
      }
    }
    id v77 = (void (*)(uint64_t, uint64_t))v102;
    v102((os_log_t)v25, v9);
    v77(v100, v9);
    goto LABEL_27;
  }
}

id EMGenerativeModelsAvailability.__deallocating_deinit()
{
  if (*(void *)&v0[OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityNotification])
  {
    swift_retain();
    sub_1BF0A95B8();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EMGenerativeModelsAvailability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EMGenerativeModelsAvailability()
{
  uint64_t result = qword_1EB5BD010;
  if (!qword_1EB5BD010) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF0A63C4()
{
  return type metadata accessor for EMGenerativeModelsAvailability();
}

uint64_t sub_1BF0A63CC()
{
  uint64_t result = sub_1BF0A95E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1BF0A9578();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for EMGenerativeModelsAvailability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EMGenerativeModelsAvailability);
}

uint64_t dispatch thunk of static EMGenerativeModelsAvailability.isAvailable.getter()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static EMGenerativeModelsAvailability.isRestricted.getter()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1BF0A64E0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF0A6518()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF0A6550(NSObject *a1)
{
  sub_1BF0A5408(a1, *(void *)(v1 + 16));
}

uint64_t sub_1BF0A6558(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1BF0A662C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1BF0A6BB0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1BF0A6BB0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1BF0A662C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1BF0A9678();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1BF0A67E8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1BF0A9698();
  if (!v8)
  {
    sub_1BF0A96A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BF0A96B8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1BF0A67E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1BF0A6880(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BF0A6A60(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1BF0A6A60(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BF0A6880(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1BF0A69F8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1BF0A9688();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1BF0A96A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1BF0A9638();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1BF0A96B8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1BF0A96A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1BF0A69F8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5BCDA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BF0A6A60(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5BCDA8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1BF0A96B8();
  __break(1u);
  return result;
}

uint64_t sub_1BF0A6BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1BF0A6C0C()
{
  unint64_t result = qword_1EB5BCD90;
  if (!qword_1EB5BCD90)
  {
    sub_1BF0A9578();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5BCD90);
  }
  return result;
}

void EMBIMIIncomingServerHighLevelDomainIsAllowlisted_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BEFDB000, v0, OS_LOG_TYPE_ERROR, "Unable to refresh server configuration for mail provider allowlist.", v1, 2u);
}

void EMBIMIIncomingServerHighLevelDomainIsAllowlisted_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BEFDB000, v0, v1, "No mail provider allowlist exists in server configuration.", v2, v3, v4, v5, v6);
}

void EMBIMIIncomingServerHighLevelDomainIsAllowlisted_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BEFDB000, v0, v1, "Mail provider allowlist in server configuration has invalid type.", v2, v3, v4, v5, v6);
}

void EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BEFDB000, v0, v1, "Mail provider info in server configuration has invalid type.", v2, v3, v4, v5, v6);
}

void EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_3()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BEFDB000, v0, OS_LOG_TYPE_ERROR, "Unable to refresh server configuration for mail provider info.", v1, 2u);
}

void EMBIMIMailProviderDisplayNameForIncomingMailServer_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BEFDB000, v0, v1, "No mail provider info exists in server configuration.", v2, v3, v4, v5, v6);
}

void __defaultReattemptingHandlerForConnection_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "%{public}@: EMConnectionInvalidated error encountered while sending message, will NOT re-attempt on daemon re-launch: %{public}@", v4, v5);
}

void __defaultReattemptingHandlerForConnection_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "%{public}@: error encountered while sending message, will re-attempt on daemon re-launch: %{public}@", v4, v5);
}

void __defaultNonReattemptingHandlerForConnection_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "%{public}@: unhandled error: %{public}@", v4, v5);
}

void __EMPrivacyProxyIsDisabledForNetwork_block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Failed to get service status: %{public}@", buf, 0xCu);
}

uint64_t sub_1BF0A9578()
{
  return MEMORY[0x1F411BD20]();
}

uint64_t sub_1BF0A9588()
{
  return MEMORY[0x1F411BD30]();
}

uint64_t sub_1BF0A9598()
{
  return MEMORY[0x1F411BD50]();
}

uint64_t sub_1BF0A95A8()
{
  return MEMORY[0x1F411BD68]();
}

uint64_t sub_1BF0A95B8()
{
  return MEMORY[0x1F411BD78]();
}

uint64_t sub_1BF0A95C8()
{
  return MEMORY[0x1F411BD80]();
}

uint64_t sub_1BF0A95D8()
{
  return MEMORY[0x1F411BD98]();
}

uint64_t sub_1BF0A95E8()
{
  return MEMORY[0x1F411BDA0]();
}

uint64_t sub_1BF0A95F8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BF0A9608()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BF0A9618()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BF0A9628()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BF0A9638()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BF0A9648()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BF0A9658()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BF0A9668()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BF0A9678()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BF0A9688()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BF0A9698()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BF0A96A8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BF0A96B8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
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

uint64_t CMFBlockListAddItemForAllServices()
{
  return MEMORY[0x1F4112A98]();
}

uint64_t CMFBlockListCopyItemsForAllServicesService()
{
  return MEMORY[0x1F4112AA0]();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x1F4112AA8]();
}

uint64_t CMFBlockListRemoveItemFromAllServices()
{
  return MEMORY[0x1F4112AB0]();
}

uint64_t CMFItemCopyEmailAddress()
{
  return MEMORY[0x1F4112AC0]();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return MEMORY[0x1F4112AD8]();
}

uint64_t CMFItemGetType()
{
  return MEMORY[0x1F4112AE8]();
}

uint64_t CreateCMFItemFromString()
{
  return MEMORY[0x1F4112AF0]();
}

uint64_t ECAllowNetworkActivityButLog()
{
  return MEMORY[0x1F4117850]();
}

uint64_t ECNSStringFromMailboxMailboxType()
{
  return MEMORY[0x1F4117880]();
}

uint64_t EFArraysAreEqual()
{
  return MEMORY[0x1F4117A18]();
}

uint64_t EFAtomicObjectLoad()
{
  return MEMORY[0x1F4117A20]();
}

uint64_t EFAtomicObjectRelease()
{
  return MEMORY[0x1F4117A28]();
}

uint64_t EFAtomicObjectSetIfNil()
{
  return MEMORY[0x1F4117A40]();
}

uint64_t EFComparatorFromSortDescriptors()
{
  return MEMORY[0x1F4117A60]();
}

uint64_t EFDecodeCacheableInstance()
{
  return MEMORY[0x1F4117A98]();
}

uint64_t EFDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F4117AA0]();
}

uint64_t EFEncodeCacheableInstance()
{
  return MEMORY[0x1F4117AA8]();
}

uint64_t EFIsRunningUnitTests()
{
  return MEMORY[0x1F4117AC8]();
}

uint64_t EFIsSeedBuild()
{
  return MEMORY[0x1F4117AD0]();
}

uint64_t EFLogRegisterStateCaptureBlock()
{
  return MEMORY[0x1F4117AD8]();
}

uint64_t EFNonContainerizedHomeDirectory()
{
  return MEMORY[0x1F4117AF0]();
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1F4117B00]();
}

uint64_t EFProtectedDataAvailable()
{
  return MEMORY[0x1F4117B18]();
}

uint64_t EFRegisterContentProtectionObserver()
{
  return MEMORY[0x1F4117B28]();
}

uint64_t EFSetsAreEqual()
{
  return MEMORY[0x1F4117B40]();
}

uint64_t EFStringWithInt64()
{
  return MEMORY[0x1F4117B50]();
}

uint64_t EFStringsAreEqual()
{
  return MEMORY[0x1F4117B68]();
}

uint64_t EFUnregisterContentProtectionObserver()
{
  return MEMORY[0x1F4117B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
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

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x1F40F6AC0]();
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1F40F6B38]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1F40F7190](trust);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1F40F71E8]();
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1F40F7250]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1F4117B90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x1F41814B8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t ef_xpc_activity_register()
{
  return MEMORY[0x1F4117BA0]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint64_t nw_parameters_copy_effective_proxy_config()
{
  return MEMORY[0x1F40F3428]();
}

uint64_t nw_path_copy_parameters()
{
  return MEMORY[0x1F40F3838]();
}

uint64_t nw_proxy_config_is_privacy_proxy()
{
  return MEMORY[0x1F40F3C10]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x1F4181AE0](proto, other);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}