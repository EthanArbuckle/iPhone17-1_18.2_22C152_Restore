uint64_t sub_19B045D30()
{
  uint64_t v0;

  *(void *)(v0 + 16) = objc_msgSend(self, sel_weakObjectsHashTable);
  *(unsigned char *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = MEMORY[0x1E4FBC860];
  return v0;
}

uint64_t type metadata accessor for PHDatabaseStatisticsTracker.State()
{
  return self;
}

uint64_t sub_19B045DA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_19B045DCC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_19B045DF4()
{
  sub_19B045E04(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_19B045E04(void *a1, char a2, uint64_t a3)
{
  objc_msgSend(a1, sel_setTrackSQLiteDatabaseStatistics_, 1);
  if (a2)
  {
    id v6 = objc_msgSend(a1, sel__delegate);
    sub_19B2A9820();
    swift_unknownObjectRelease();
    sub_19B087E40(0, &qword_1E93D59D0);
    if (swift_dynamicCast())
    {
      objc_msgSend(v7, sel_setPhotoKitStatsTracker_, a3);
    }
  }
}

id sub_19B045ED4()
{
  v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState;
  type metadata accessor for PHDatabaseStatisticsTracker.State();
  swift_allocObject();
  v3 = v0;
  uint64_t v4 = sub_19B045D30();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB2DBD68);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v4;
  *(void *)&v1[v2] = v5;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for PHDatabaseStatisticsTracker();
  return objc_msgSendSuper2(&v7, sel_init);
}

void sub_19B046534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_19B049058(_Unwind_Exception *a1)
{
}

void sub_19B04934C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0494B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B049690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B049BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B049EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FastHashForPredicate(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v2 = objc_msgSend(v1, "subpredicates", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v2);
          }
          v5 += _FastHashForPredicate(*(void *)(*((void *)&v16 + 1) + 8 * i));
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v1;
    uint64_t v2 = [v8 leftExpression];
    v9 = [v8 rightExpression];
    uint64_t v10 = [v2 expressionType];
    uint64_t v11 = 100 * [v9 expressionType];
    uint64_t v12 = [v8 comparisonPredicateModifier];
    uint64_t v13 = [v8 predicateOperatorType];

    uint64_t v14 = _FastValueHashForExpression(v2);
    uint64_t v5 = v11 + 1000 * v10 + 10 * v12 + 10000 * v13 + v14 + _FastValueHashForExpression(v9) + 11110;

LABEL_14:
    goto LABEL_15;
  }
  uint64_t v5 = [(id)objc_opt_class() hash];
LABEL_15:

  return v5;
}

uint64_t _FastValueHashForExpression(void *a1)
{
  id v1 = a1;
  if ([v1 expressionType])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v3 = [v1 constantValue];
    uint64_t v2 = [v3 hash];

    uint64_t v4 = [v1 constantValue];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [v1 constantValue];
      objc_super v7 = [v6 firstObject];
      v2 += [v7 hash];
    }
    id v8 = [v1 constantValue];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [v1 constantValue];
      uint64_t v11 = [v10 lastObject];
      v2 += [v11 hash];
    }
  }

  return v2;
}

void sub_19B04C09C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B04C834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B04CD38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B04EEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B04F9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B05123C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

id ph_objc_getAssociatedObject(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  char v5 = sSharedTable();
  uint64_t v6 = [v5 associatedObjectOnObject:v4 forKey:v3];

  return v6;
}

id sSharedTable()
{
  pl_dispatch_once();
  uint64_t v0 = (void *)sSharedTable_pl_once_object_17;

  return v0;
}

void sub_19B0515B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ph_objc_setAssociatedObjectIfNotSet(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = sSharedTable();
  char v9 = [v8 setAssociatedObjectIfNotSet:v5 onObject:v7 forKey:v6];

  return v9;
}

void sub_19B051B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PHPredicateByCombiningPredicatesWithAnd_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = (void *)MEMORY[0x1E4F28BA0];
    v12[0] = v4;
    v12[1] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    char v9 = [v7 andPredicateWithSubpredicates:v8];
  }
  else
  {
    if (v4) {
      id v10 = v4;
    }
    else {
      id v10 = v5;
    }
    char v9 = v10;
  }

  return v9;
}

id PHPredicateByCombiningPredicatesWithOr_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = (void *)MEMORY[0x1E4F28BA0];
    v12[0] = v4;
    v12[1] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    char v9 = [v7 orPredicateWithSubpredicates:v8];
  }
  else
  {
    if (v4) {
      id v10 = v4;
    }
    else {
      id v10 = v5;
    }
    char v9 = v10;
  }

  return v9;
}

void ___presentResourcesFromHintsUntilStop_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, unsigned int a10, unsigned char *a11)
{
  id v16 = a6;
  id v17 = a7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v17) {
    [*(id *)(*(void *)(a1 + 32) + 104) addObject:v17];
  }
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(v18 + 48);
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(unsigned char *)(v18 + 56) = 1;
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
  }
  else
  {
    *(void *)(v18 + 48) = a2;
  }
  uint64_t v20 = [v17 resourceType];
  uint64_t v21 = [v17 resourceVersion];
  uint64_t v22 = [v17 isDerivative];
  if ([(id)objc_opt_class() storeClassID] == 1) {
    *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
  }
  LOWORD(v26) = 0;
  LOWORD(v25) = 256;
  v23 = -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:]([PHResourceChooserListResourceInfo alloc], "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v20, a10, v21, 0, v22, a3, a4, v25, 0, v16, v17, v26);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___presentResourcesFromHintsUntilStop_block_invoke_2;
  aBlock[3] = &unk_1E5845F98;
  v29 = a11;
  id v28 = *(id *)(a1 + 32);
  uint64_t v30 = v19;
  v24 = _Block_copy(aBlock);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32)
                                                                                                + 16)
                                                                                    + 16))();
  if (!*a11) {
    *a11 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
  }
}

BOOL PHImageManagerRecordEnabled()
{
  if (PHImageManagerRecordEnabled_onceToken != -1) {
    dispatch_once(&PHImageManagerRecordEnabled_onceToken, &__block_literal_global_11);
  }
  if (s_tracingDisabled) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = PHImageManagerRecordEnabled_s_enabled == 0;
  }
  return !v0;
}

void sub_19B05A624(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void PHChooserListContinueEnumerating(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (!a2)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHChooserListContinueEnumerating(PHResourceChooserList *__strong _Nonnull, PLResourceChooserListDataSource)");
    [v14 handleFailureInFunction:v15 file:@"PHResourceChooserList.m" lineNumber:744 description:@"PLResourceChooserListDataSourceNone is not allowed when choosing begins."];
  }
  if (*((unsigned char *)v3 + 56) || !_presentResourcesFromHintsUntilStop(v3, a2))
  {
    if ((a2 & 2) == 0)
    {
      (*(void (**)(void))(v3[3] + 16))();
      goto LABEL_27;
    }
    char v19 = 0;
    if (!*((unsigned char *)v3 + 96))
    {
      if (!v3[4]) {
        _fetchNonHintResources(v3);
      }
      if (!v3[10])
      {
        id v4 = (void *)v3[4];
        id v5 = (void *)MEMORY[0x1E4F28F60];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __PHChooserListContinueEnumerating_block_invoke;
        v17[3] = &unk_1E5846028;
        uint64_t v18 = v3;
        id v6 = [v5 predicateWithBlock:v17];
        uint64_t v7 = [v4 filteredArrayUsingPredicate:v6];
        id v8 = (void *)v3[10];
        v3[10] = v7;
      }
      while (1)
      {
        uint64_t v9 = v3[11];
        uint64_t v10 = v3[14];
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v11 = (void *)v3[10];
          if (v10 == 1)
          {
            unint64_t v12 = 0;
            goto LABEL_19;
          }
          unint64_t v12 = [v11 count] - 1;
          if ((v12 & 0x8000000000000000) != 0) {
            goto LABEL_24;
          }
        }
        else
        {
          unint64_t v12 = v10 + v9;
          if (v10 + v9 < 0) {
            goto LABEL_24;
          }
        }
        uint64_t v11 = (void *)v3[10];
LABEL_19:
        if (v12 >= [v11 count])
        {
LABEL_24:
          *((unsigned char *)v3 + 96) = 1;
          break;
        }
        char v16 = 0;
        v3[11] = v12;
        char v13 = _presentFullResourceAtIndex(v3, v12, (uint64_t)&v16);
        if (v16) {
          v3[11] = v9;
        }
        if (v13) {
          goto LABEL_27;
        }
      }
    }
    (*(void (**)(void))(v3[3] + 16))();
    if (v19)
    {
      PHChooserListMoveFirst((uint64_t)v3);
      v3[14] = -1;
      *((unsigned char *)v3 + 56) = 1;
      PHChooserListContinueEnumerating(v3, a2);
    }
  }
LABEL_27:
}

BOOL _presentResourcesFromHintsUntilStop(void *a1, char a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = v3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  if ((a2 & 1) == 0 || v3[8])
  {
    v15 = PLImageManagerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      char v16 = [v4[1] uuid];
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "[RM]: PHResourceChooserList: use of hints not allowed, asset uuid: %{public}@...", buf, 0xCu);
    }
  }
  else
  {
    [v3[1] unorientedSize];
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F8A950];
    uint64_t v10 = [v4[1] imageRequestHints];
    uint64_t v11 = [v4[1] libraryID];
    id v12 = v4[6];
    id v13 = v4[1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = ___presentResourcesFromHintsUntilStop_block_invoke;
    v19[3] = &unk_1E5845FC0;
    uint64_t v21 = &v30;
    uint64_t v14 = v4;
    uint64_t v20 = v14;
    uint64_t v22 = &v26;
    v23 = v24;
    [v9 enumerateImageRequestHintData:v10 assetWidth:(uint64_t)v6 assetHeight:(uint64_t)v8 libraryID:v11 startingOffset:v12 assetID:v13 block:v19];

    if (!*((unsigned char *)v31 + 24)) {
      *((unsigned char *)v14 + 56) = 1;
    }
  }
  BOOL v17 = *((unsigned char *)v27 + 24) != 0;
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v17;
}

void sub_19B05AB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t ___presentResourcesFromHintsUntilStop_block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48);
  **(unsigned char **)(result + 40) = 1;
  *(unsigned char *)(*(void *)(result + 32) + 56) = 0;
  *(void *)(*(void *)(result + 32) + 48) = v1;
  return result;
}

void sub_19B05DE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double PHSanitizeNormalizedCropRect(char *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10 = *MEMORY[0x1E4F1DB28];
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v25)
    || (double v11 = a2 + a4, a4 > 0.0)
    && a5 > 0.0
    && a2 >= 0.0
    && a3 >= 0.0
    && (v11 <= 1.0 ? (BOOL v12 = a3 + a5 <= 1.0) : (BOOL v12 = 0), v12))
  {
    char v13 = 0;
    double v10 = a2;
  }
  else
  {
    double v15 = -a4;
    if (a4 >= 0.0)
    {
      double v15 = a4;
      double v11 = a2;
    }
    double v16 = -a5;
    if (a5 >= 0.0) {
      double v17 = a3;
    }
    else {
      double v17 = a3 + a5;
    }
    if (a5 >= 0.0) {
      double v16 = a5;
    }
    if (v11 >= 0.0) {
      double v18 = -0.0;
    }
    else {
      double v18 = v11;
    }
    double v19 = v15 + v18;
    if (v11 >= 0.0) {
      double v20 = v11;
    }
    else {
      double v20 = 0.0;
    }
    if (v17 >= 0.0) {
      double v21 = v17;
    }
    else {
      double v21 = 0.0;
    }
    if (v17 >= 0.0) {
      double v17 = -0.0;
    }
    double v22 = v16 + v17;
    if (v20 + v19 > 1.0) {
      double v19 = 1.0 - v20;
    }
    if (v21 + v22 > 1.0) {
      double v22 = 1.0 - v21;
    }
    if (v19 > 0.0
      && (v22 > 0.0 ? (BOOL v23 = v20 + v19 <= 1.0) : (BOOL v23 = 0), v23 ? (v24 = v21 + v22 <= 1.0) : (v24 = 0), v24))
    {
      char v13 = 1;
      double v10 = v20;
    }
    else
    {
      char v13 = 1;
    }
  }
  if (a1) {
    *a1 = v13;
  }
  return v10;
}

void PHDecodeImageFromStoreForRequest(void *a1, void *a2, int a3, void *a4, void *a5, double a6, double a7)
{
  id v19 = a1;
  id v13 = a2;
  id v14 = a4;
  id v15 = a5;
  if ([(id)objc_opt_class() storeClassID] == 1)
  {
    double v16 = (CGImage *)[v19 newTableThumbImageForKey:v13];
    (*((void (**)(id, CGImage *, void, void, void))v15 + 2))(v15, v16, 0, 0, 0);

    CGImageRelease(v16);
  }
  else
  {
    double v17 = [v14 asset];
    double v18 = [v13 fileURLForAssetID:v17];
    PHDecodeImageFromURLForRequest(v18, a3, v14, v15, a6, a7);
  }
}

void PHDecodeImageFromURLForRequest(void *a1, int a2, void *a3, void *a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a3;
  id v13 = a4;
  if ([v12 isCancelled])
  {
    (*((void (**)(id, void, void, void, void))v13 + 2))(v13, 0, 0, 0, 0);
  }
  else
  {
    id v14 = [v12 behaviorSpec];
    id v15 = [v12 displaySpec];
    double v16 = objc_alloc_init(PHImageDecoderOptions);
    -[PHImageDecoderOptions setTargetSize:](v16, "setTargetSize:", a5, a6);
    -[PHImageDecoderOptions setContentMode:](v16, "setContentMode:", [v15 contentMode]);
    [v15 normalizedCropRect];
    -[PHImageDecoderOptions setNormalizedCropRect:](v16, "setNormalizedCropRect:");
    -[PHImageDecoderOptions setHighPriority:](v16, "setHighPriority:", ((unint64_t)[v14 loadingOptions] >> 4) & 1);
    -[PHImageDecoderOptions setOptimizeForDrawing:](v16, "setOptimizeForDrawing:", ((unint64_t)[v14 loadingOptions] >> 3) & 1);
    -[PHImageDecoderOptions setWaitUntilComplete:](v16, "setWaitUntilComplete:", [v14 isSynchronous]);
    -[PHImageDecoderOptions setResizeMode:](v16, "setResizeMode:", [v14 resizeMode]);
    -[PHImageDecoderOptions setShouldLoadGainMap:](v16, "setShouldLoadGainMap:", [v14 includeHDRGainMap]);
    -[PHImageDecoderOptions setDecodeAsHDR:](v16, "setDecodeAsHDR:", [v14 decodeAsHDR]);
    [v14 targetHDRHeadroom];
    *(float *)&double v17 = v17;
    [(PHImageDecoderOptions *)v16 setTargetHDRHeadroom:v17];
    double v18 = [v12 asset];
    id v19 = [v18 hdrGain];
    [v19 floatValue];
    -[PHImageDecoderOptions setHdrGain:](v16, "setHdrGain:");

    -[PHImageDecoderOptions setAllowFallbackDecoder:](v16, "setAllowFallbackDecoder:", ([v14 loadingOptions] & 0x20) == 0);
    if (([v14 loadingOptions] & 0x40) != 0)
    {
      double v20 = (void *)MEMORY[0x1E4F8CDF8];
      double v21 = [v11 pathExtension];
      double v22 = [v20 typeWithFilenameExtension:v21];

      if ([v22 conformsToType:*MEMORY[0x1E4F44410]]) {
        [(PHImageDecoderOptions *)v16 setPreferSWDecode:1];
      }
    }
    if (([v14 useLowMemoryMode] & 1) != 0 || (objc_msgSend(v14, "loadingOptions") & 0x80) != 0) {
      [(PHImageDecoderOptions *)v16 setUseLowMemoryMode:1];
    }
    BOOL v23 = off_1E58404A0;
    if (!a2) {
      BOOL v23 = off_1E58404E0;
    }
    BOOL v24 = [(__objc2_class *)*v23 sharedDecoder];
    CGRect v25 = [v12 asset];
    int v26 = [v25 mediaSubtypes];

    if (([v14 decodeAsHDR] & 1) != 0 || (v26 & 0x800000) != 0)
    {
      v27 = PLImageManagerGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_INFO, "[HDR] Using ImageIO decoder for HDR", v30, 2u);
      }

      uint64_t v28 = +[PHImageIODecoder sharedDecoder];

      BOOL v24 = (void *)v28;
    }
    char v29 = [v24 decodeImageFromData:0 orFileURL:v11 options:v16 completion:v13];
    if (([v14 isSynchronous] & 1) == 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 32);
      objc_storeStrong((id *)v12 + 17, v29);
      if ([v12 isCancelled]) {
        [v29 cancel];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v12 + 32);
    }
  }
}

void sub_19B06027C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id _buildCacheKey(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id v11 = (void *)MEMORY[0x1E4F28E78];
  id v12 = [a1 uuid];
  id v13 = [v11 stringWithString:v12];

  if (a2 > 0.0 && a3 > 0.0)
  {
    id v14 = DCIM_NSStringFromCGSize();
    [v13 appendString:v14];
  }
  if (a6 > 0.0 && a7 > 0.0)
  {
    id v15 = DCIM_NSStringFromCGRect();
    [v13 appendString:v15];
  }

  return v13;
}

id _figDecodeOptionsFromContext(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  double v6 = (void *)MEMORY[0x1E4F56298];
  if (!*(unsigned char *)(a1 + 16) && ([*(id *)(a1 + 48) shouldCrop] & 1) == 0 && !*(unsigned char *)(a1 + 20))
  {
    uint64_t v22 = *v6;
    uint64_t v23 = MEMORY[0x1E4F1CC38];
    if (*(uint64_t *)a1 < 1)
    {
      if (a3)
      {
        v97[0] = MEMORY[0x1E4F1CC38];
        uint64_t v64 = *MEMORY[0x1E4F562C0];
        v96[0] = v22;
        v96[1] = v64;
        uint64_t v65 = [NSNumber numberWithUnsignedLong:a2];
        int v26 = (void *)v65;
        uint64_t v66 = *MEMORY[0x1E4F562A0];
        if (*(unsigned char *)(a1 + 17)) {
          uint64_t v67 = v23;
        }
        else {
          uint64_t v67 = MEMORY[0x1E4F1CC28];
        }
        v97[1] = v65;
        v97[2] = v67;
        uint64_t v68 = *MEMORY[0x1E4F562B8];
        v96[2] = v66;
        v96[3] = v68;
        if (*(unsigned char *)(a1 + 21)) {
          uint64_t v69 = v23;
        }
        else {
          uint64_t v69 = MEMORY[0x1E4F1CC28];
        }
        v96[4] = *MEMORY[0x1E4F562E0];
        v97[3] = v69;
        v97[4] = v69;
        v31 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v32 = v97;
        char v33 = v96;
        goto LABEL_75;
      }
      v99[0] = MEMORY[0x1E4F1CC38];
      uint64_t v82 = *MEMORY[0x1E4F562C0];
      v98[0] = v22;
      v98[1] = v82;
      int v26 = [NSNumber numberWithUnsignedLong:a2];
      v99[1] = v26;
      v98[2] = *MEMORY[0x1E4F562D8];
      if (*(void *)(a1 + 8) == 2) {
        uint64_t v83 = 1;
      }
      else {
        uint64_t v83 = 3;
      }
      v72 = [NSNumber numberWithInt:v83];
      uint64_t v84 = *MEMORY[0x1E4F56288];
      v99[2] = v72;
      v99[3] = v23;
      uint64_t v85 = *MEMORY[0x1E4F562A0];
      v98[3] = v84;
      v98[4] = v85;
      uint64_t v86 = MEMORY[0x1E4F1CC28];
      if (*(unsigned char *)(a1 + 17)) {
        uint64_t v87 = v23;
      }
      else {
        uint64_t v87 = MEMORY[0x1E4F1CC28];
      }
      uint64_t v88 = *MEMORY[0x1E4F562B8];
      if (*(unsigned char *)(a1 + 21)) {
        uint64_t v86 = v23;
      }
      v99[4] = v87;
      v99[5] = v86;
      uint64_t v89 = *MEMORY[0x1E4F562E0];
      v98[5] = v88;
      v98[6] = v89;
      v99[6] = v86;
      double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:7];
    }
    else
    {
      if (a3)
      {
        v101[0] = MEMORY[0x1E4F1CC38];
        uint64_t v24 = *MEMORY[0x1E4F562C0];
        v100[0] = v22;
        v100[1] = v24;
        uint64_t v25 = [NSNumber numberWithUnsignedLong:a2];
        int v26 = (void *)v25;
        uint64_t v27 = *MEMORY[0x1E4F562A0];
        if (*(unsigned char *)(a1 + 17)) {
          uint64_t v28 = v23;
        }
        else {
          uint64_t v28 = MEMORY[0x1E4F1CC28];
        }
        v101[1] = v25;
        v101[2] = v28;
        uint64_t v29 = *MEMORY[0x1E4F562B8];
        v100[2] = v27;
        v100[3] = v29;
        if (*(unsigned char *)(a1 + 21)) {
          uint64_t v30 = v23;
        }
        else {
          uint64_t v30 = MEMORY[0x1E4F1CC28];
        }
        v100[4] = *MEMORY[0x1E4F562E0];
        v101[3] = v30;
        v101[4] = v30;
        v31 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v32 = v101;
        char v33 = v100;
LABEL_75:
        double v8 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:5];
LABEL_96:

        goto LABEL_97;
      }
      v103[0] = MEMORY[0x1E4F1CC38];
      uint64_t v70 = *MEMORY[0x1E4F562C0];
      v102[0] = v22;
      v102[1] = v70;
      int v26 = [NSNumber numberWithUnsignedLong:a2];
      v103[1] = v26;
      v102[2] = *MEMORY[0x1E4F562D8];
      if (*(void *)(a1 + 8) == 2) {
        uint64_t v71 = 1;
      }
      else {
        uint64_t v71 = 3;
      }
      v72 = [NSNumber numberWithInt:v71];
      uint64_t v73 = *MEMORY[0x1E4F56288];
      v103[2] = v72;
      v103[3] = v23;
      uint64_t v74 = *MEMORY[0x1E4F562A0];
      v102[3] = v73;
      v102[4] = v74;
      uint64_t v75 = MEMORY[0x1E4F1CC28];
      if (*(unsigned char *)(a1 + 17)) {
        uint64_t v76 = v23;
      }
      else {
        uint64_t v76 = MEMORY[0x1E4F1CC28];
      }
      v103[4] = v76;
      v102[5] = *MEMORY[0x1E4F562A8];
      uint64_t v77 = [NSNumber numberWithInteger:*(void *)a1];
      v78 = (void *)v77;
      uint64_t v79 = *MEMORY[0x1E4F562B8];
      if (*(unsigned char *)(a1 + 21)) {
        uint64_t v80 = v23;
      }
      else {
        uint64_t v80 = v75;
      }
      v103[5] = v77;
      v103[6] = v80;
      uint64_t v81 = *MEMORY[0x1E4F562E0];
      v102[6] = v79;
      v102[7] = v81;
      v103[7] = v80;
      double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:8];
    }
    goto LABEL_96;
  }
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
  double v8 = v7;
  if (*(unsigned char *)(a1 + 20)) {
    [v7 setObject:&unk_1EEB26478 forKeyedSubscript:*MEMORY[0x1E4F56270]];
  }
  if (*(unsigned char *)(a1 + 21))
  {
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F562B8]];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F562E0]];
  }
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v6];
  id v11 = [NSNumber numberWithUnsignedLong:a2];
  [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F562C0]];

  if ((a3 & 1) == 0)
  {
    if (*(void *)(a1 + 8) == 2) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 3;
    }
    id v13 = [NSNumber numberWithInt:v12];
    [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F562D8]];

    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F56288]];
    if (*(uint64_t *)a1 >= 1)
    {
      id v14 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F562A8]];
    }
    if (*(unsigned char *)(a1 + 16)) {
      [v8 setObject:&unk_1EEB26490 forKeyedSubscript:*MEMORY[0x1E4F562B0]];
    }
  }
  if (*(unsigned char *)(a1 + 17)) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CC28];
  }
  [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F562A0]];
  if ([*(id *)(a1 + 48) shouldCrop])
  {
    CFTypeRef cf = 0;
    PFSharedFigDecodeSession();
    int Container = CMPhotoDecompressionSessionCreateContainer();
    if (Container)
    {
      int v17 = Container;
      double v18 = PLImageManagerGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - unable to generate crop rect, error opening container: %ld", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v93 = 0;
      uint64_t v94 = 0;
      int v92 = 1;
      int ImageGeometryForIndex = CMPhotoDecompressionContainerGetImageGeometryForIndex();
      if (ImageGeometryForIndex)
      {
        int v20 = ImageGeometryForIndex;
        DictionaryRepresentation = PLImageManagerGetLog();
        if (os_log_type_enabled(DictionaryRepresentation, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl(&dword_19B043000, DictionaryRepresentation, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - unable to generate crop rect, error determining source image geometry: %ld", buf, 0xCu);
        }
      }
      else
      {
        PLOrientationTransformImageSize();
        double v35 = v34;
        double v37 = v36;
        [*(id *)(a1 + 48) targetSize];
        double v39 = v38;
        double v41 = v40;
        [*(id *)(a1 + 48) normalizedCropRect];
        double v46 = PHGenerateCropRectGivenNormalizedCropRect((unint64_t)v35, (unint64_t)v37, [*(id *)(a1 + 48) contentMode], 0, v39, v41, v42, v43, v44, v45);
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        long long v105 = 0u;
        long long v106 = 0u;
        *(_OWORD *)buf = 0u;
        PLOrientationMakeTransformWithSize();
        memset(&v91, 0, sizeof(v91));
        v109.origin.double x = v46;
        v109.origin.double y = v48;
        v109.size.double width = v50;
        v109.size.double height = v52;
        CGRect v110 = CGRectApplyAffineTransform(v109, &v91);
        double x = v110.origin.x;
        double y = v110.origin.y;
        double width = v110.size.width;
        double height = v110.size.height;
        v57 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F562B0]];

        if (!v57)
        {
          int v58 = ~(int)x + (int)v35 - (((~(int)x + (int)v35) & 0x80000001) == 1);
          v111.origin.double x = x;
          v111.origin.double y = y;
          v111.size.double width = width;
          v111.size.double height = height;
          if (((int)CGRectGetMinX(v111) & 0x80000001) == 1)
          {
            double x = x + -1.0;
            if (width + 1.0 >= (double)v58) {
              double width = (double)v58;
            }
            else {
              double width = width + 1.0;
            }
            v59 = PLImageManagerGetLog();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_19B043000, v59, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect min x along even bounds...", (uint8_t *)&v91, 2u);
            }
          }
          v112.origin.double x = x;
          v112.origin.double y = y;
          v112.size.double width = width;
          v112.size.double height = height;
          if (((int)CGRectGetMaxX(v112) & 0x80000001) == 1)
          {
            if (width + 1.0 >= (double)v58) {
              double width = (double)v58;
            }
            else {
              double width = width + 1.0;
            }
            v60 = PLImageManagerGetLog();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_19B043000, v60, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect max x along even bounds...", (uint8_t *)&v91, 2u);
            }
          }
          int v61 = ~(int)y + (int)v37 - (((~(int)y + (int)v37) & 0x80000001) == 1);
          v113.origin.double x = x;
          v113.origin.double y = y;
          v113.size.double width = width;
          v113.size.double height = height;
          if (((int)CGRectGetMinY(v113) & 0x80000001) == 1)
          {
            double y = y + -1.0;
            if (height + 1.0 >= (double)v61) {
              double height = (double)v61;
            }
            else {
              double height = height + 1.0;
            }
            v62 = PLImageManagerGetLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_19B043000, v62, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect min y along even bounds...", (uint8_t *)&v91, 2u);
            }
          }
          v114.origin.double x = x;
          v114.origin.double y = y;
          v114.size.double width = width;
          v114.size.double height = height;
          if (((int)CGRectGetMaxY(v114) & 0x80000001) == 1)
          {
            if (height + 1.0 >= (double)v61) {
              double height = (double)v61;
            }
            else {
              double height = height + 1.0;
            }
            v63 = PLImageManagerGetLog();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v91.a) = 0;
              _os_log_impl(&dword_19B043000, v63, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - adjusting crop rect max y along even bounds...", (uint8_t *)&v91, 2u);
            }
          }
        }
        v115.origin.double x = x;
        v115.origin.double y = y;
        v115.size.double width = width;
        v115.size.double height = height;
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v115);
        [v8 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F562D0]];
      }

      CFRelease(cf);
    }
  }
LABEL_97:

  return v8;
}

void PHChooserListMoveFirst(uint64_t a1)
{
  *(void *)(a1 + 112) = 1;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  uint64_t v1 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  uint64_t v3 = (id *)(id)a1;

  [v3[13] removeAllObjects];
  id v2 = v3[10];
  v3[10] = 0;

  v3[11] = (id)0x7FFFFFFFFFFFFFFFLL;
  *((unsigned char *)v3 + 96) = 0;
}

double PHGenerateCropRectGivenNormalizedCropRect(unint64_t a1, unint64_t a2, uint64_t a3, int a4, double a5, double a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  double v20 = *MEMORY[0x1E4F1DB28];
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v44.size.double width = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 16);
  v44.size.double height = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 24);
  v43.origin.double x = a7;
  v43.origin.double y = a8;
  v43.size.double width = a9;
  v43.size.double height = a10;
  v44.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v44.origin.double y = v21;
  BOOL v22 = CGRectEqualToRect(v43, v44);
  double v23 = 0.0;
  if (v22) {
    double v24 = 1.0;
  }
  else {
    double v24 = a10;
  }
  if (v22) {
    double v25 = 1.0;
  }
  else {
    double v25 = a9;
  }
  if (v22) {
    double v26 = 0.0;
  }
  else {
    double v26 = a8;
  }
  if (!v22) {
    double v23 = a7;
  }
  double v27 = v23 * (double)a1;
  double v28 = v26 * (double)a2;
  double v29 = v25 * (double)a1;
  double v30 = v24 * (double)a2;
  if (a3 == 1)
  {
    if (!v22 || (a4 & 1) != 0)
    {
      if (a4)
      {
        double v39 = (v30 - a6) * 0.5;
        if (v29 - a5 >= 0.0) {
          double v40 = (v29 - a5) * 0.5;
        }
        else {
          double v40 = 0.0;
        }
        if (v30 - a6 < 0.0) {
          double v39 = 0.0;
        }
        *(CGRect *)&double v27 = CGRectInset(*(CGRect *)&v27, v40, v39);
      }
    }
    else
    {
      PLSizeMake();
      uint64_t v31 = PLSizeMake();
      PLCGSizeScaledToFitSize();
      double v33 = v32;
      double v35 = v34;
      BOOL v36 = v32 == (double)(int)v31;
      double v37 = ((double)(int)v31 - v32) * 0.5;
      double v38 = ((double)SHIDWORD(v31) - v34) * 0.5;
      if (v33 == (double)(int)v31) {
        double v37 = v20;
      }
      if (!v36) {
        double v38 = v21;
      }
      *(CGRect *)&double v27 = CGRectIntegral(*(CGRect *)&v37);
    }
  }

  *(void *)&double result = (unint64_t)CGRectIntegral(*(CGRect *)&v27);
  return result;
}

void sub_19B0655F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id PHQueryForKeyAssetsInAssetCollection_block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  PLPhotoKitGetLog();
  uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  double v5 = v3;
  double v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    uint64_t v12 = "PHQueryForKeyAssetsInAssetCollection_block_invoke_8";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  double v7 = v2[2](v2);
  double v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B066C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B066E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *_fetchTypeForAssetCollectionTypeAndSubtype(uint64_t a1, uint64_t a2)
{
  os_signpost_id_t v4 = 0;
  uint64_t v5 = a1 - 1;
  double v6 = PHFetchTypeMoment;
  switch(v5)
  {
    case 0:
      double v6 = PHFetchTypeAlbum;
      if (a2 == 101) {
        double v6 = PHFetchTypeCloudSharedAlbum;
      }
      goto LABEL_13;
    case 1:
      double v6 = PHFetchTypeSmartAlbum;
      goto LABEL_13;
    case 2:
      goto LABEL_13;
    case 3:
      double v6 = PHFetchTypeMemory;
      goto LABEL_13;
    case 5:
      double v6 = PHFetchTypePhotosHighlight;
      goto LABEL_13;
    case 6:
      double v6 = &PHFetchTypeMomentShare;
      goto LABEL_13;
    case 7:
      double v6 = &PHFetchTypeSuggestion;
      goto LABEL_13;
    case 8:
      double v6 = PHFetchTypeImportSession;
      goto LABEL_13;
    case 9:
      double v6 = PHFetchTypeProject;
      goto LABEL_13;
    case 10:
      double v6 = &PHFetchTypeAssetCollection;
LABEL_13:
      os_signpost_id_t v4 = *v6;
      break;
    default:
      break;
  }
  return v4;
}

void sub_19B0694CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B069844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B069A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B069D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B069EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06A07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06A20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06A39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06A52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06A6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06A84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06A9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06AB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06ACFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06AE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B06B01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _decodeCallback(uint64_t a1, uint64_t a2, int a3, uint64_t a4, CGImage *a5, uint64_t a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if ([*(id *)(a6 + 80) figRequestID] == a2)
    {
      if (a3 == -17105) {
        goto LABEL_25;
      }
      if (!a3)
      {
        *(void *)(a6 + 88) = CGImageRetain(a5);
        goto LABEL_25;
      }
      int v17 = PLImageManagerGetLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      uint64_t v18 = *(void *)(a6 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v18;
      __int16 v33 = 1024;
      int v34 = a3;
      id v19 = "[RM] PHFigDecoder - failed async decode of image at url: %@, status code: %d";
      goto LABEL_21;
    }
    if ([*(id *)(a6 + 80) figGainMapRequestID] == a2 && a3 != -17105)
    {
      if (a3)
      {
        *(unsigned char *)(a6 + 40) = 1;
        int v17 = PLImageManagerGetLog();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
LABEL_22:

          goto LABEL_25;
        }
        uint64_t v20 = *(void *)(a6 + 56);
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = v20;
        __int16 v33 = 1024;
        int v34 = a3;
        id v19 = "[RM] PHFigDecoder - failed async decode of gain map at url: %@, status code: %d";
LABEL_21:
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x12u);
        goto LABEL_22;
      }
      uint64_t v12 = PLImageManagerGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - returned gain map, loading orientation", buf, 2u);
      }

      int v30 = 1;
      Auxiliaryint ImageGeometryForIndex = CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndex();
      if (AuxiliaryImageGeometryForIndex)
      {
        int v14 = AuxiliaryImageGeometryForIndex;
        uint64_t v15 = PLImageManagerGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v32 = v14;
          _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to read aux image orientation, default to Up, %ld", buf, 0xCu);
        }

        int v16 = 1;
      }
      else
      {
        int v16 = v30;
      }
      id v29 = 0;
      _figReadImageProperties(a1, &v29);
      id v21 = v29;
      CFTypeRef v22 = CFRetain(a5);
      *(_DWORD *)(a6 + 44) = v16;
      double v23 = *(void **)(a6 + 104);
      *(void *)(a6 + 96) = v22;
      *(void *)(a6 + 104) = v21;
    }
LABEL_25:
    if (atomic_fetch_add((atomic_uint *volatile)(a6 + 36), 1u) + 1 != *(_DWORD *)(a6 + 32)) {
      return;
    }
    if (a3 != -17105)
    {
      if (!a3 && !*(unsigned char *)(a6 + 40) && *(void *)(a6 + 88))
      {
        uint64_t v24 = *(void *)(a6 + 72);
        if (v24)
        {
          double v25 = *(void (**)(void))(v24 + 16);
LABEL_36:
          v25();
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      if (*(unsigned char *)(a6 + 19))
      {
        double v26 = +[PHImageIODecoder sharedDecoder];
        id v27 = (id)[v26 decodeImageFromData:*(void *)(a6 + 64) orFileURL:*(void *)(a6 + 56) options:*(void *)(a6 + 48) existingRequestHandle:*(void *)(a6 + 80) completion:*(void *)(a6 + 72)];

        goto LABEL_37;
      }
    }
    uint64_t v28 = *(void *)(a6 + 72);
    if (v28)
    {
      double v25 = *(void (**)(void))(v28 + 16);
      goto LABEL_36;
    }
LABEL_37:
    _cleanupContext(a6);
  }
}

void ___loadImageFromStoreAndKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v10 = *(id **)(a1 + 32);
  if (a2)
  {
    [v10[18] setImageRef:a2];
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(*(void *)(a1 + 32) + 144) setIsDerivedFromDeferredPreview:1];
    }
    if (a3) {
      [*(id *)(*(void *)(a1 + 32) + 144) setHighDynamicRangeGainMap:a3 orientation:a4 averagePixelLuminance:v9];
    }
    if (*(unsigned char *)(a1 + 57))
    {
      [*(id *)(*(void *)(a1 + 32) + 144) setDegraded:1];
      if (PHSignpostEventsEnabled_onceToken != -1) {
        dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
      }
      if (PHSignpostEventsEnabled_eventsEnabled)
      {
        uint64_t v11 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v11;
          uint64_t v13 = PLImageManagerGetLog();
          uint64_t v14 = [*(id *)(a1 + 32) managerID];
          int v15 = [*(id *)(a1 + 32) requestID];
          uint64_t v16 = [*(id *)(a1 + 32) requestIndex];
          if (os_signpost_enabled(v13))
          {
            uint64_t v17 = 30;
            if (*(unsigned char *)(a1 + 58)) {
              uint64_t v17 = 31;
            }
            *(_DWORD *)buf = 134218752;
            uint64_t v29 = v14;
            __int16 v30 = 2048;
            uint64_t v31 = v15;
            __int16 v32 = 2048;
            uint64_t v33 = v16;
            __int16 v34 = 2048;
            uint64_t v35 = v17;
            goto LABEL_26;
          }
          goto LABEL_27;
        }
      }
    }
    else
    {
      if (PHSignpostEventsEnabled_onceToken != -1) {
        dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
      }
      if (PHSignpostEventsEnabled_eventsEnabled)
      {
        uint64_t v22 = [*(id *)(a1 + 32) signpostID];
        if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v22;
          uint64_t v13 = PLImageManagerGetLog();
          uint64_t v23 = [*(id *)(a1 + 32) managerID];
          int v24 = [*(id *)(a1 + 32) requestID];
          uint64_t v25 = [*(id *)(a1 + 32) requestIndex];
          if (os_signpost_enabled(v13))
          {
            *(_DWORD *)buf = 134218752;
            uint64_t v29 = v23;
            __int16 v30 = 2048;
            uint64_t v31 = v24;
            __int16 v32 = 2048;
            uint64_t v33 = v25;
            __int16 v34 = 2048;
            uint64_t v35 = 32;
LABEL_26:
            _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_EVENT, v12, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
          }
LABEL_27:
        }
      }
    }
    if (*(unsigned char *)(a1 + 59))
    {
      id v21 = *(id *)(a1 + 40);
      double v26 = [*(id *)(a1 + 32) asset];
      int v27 = [v21 recipeIDForAssetID:v26];

      if (!v27) {
        [*(id *)(a1 + 32) recordMetricsWithMetricsHandler:&__block_literal_global_189];
      }
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (([v10 isCancelled] & 1) == 0)
  {
    uint64_t v18 = PLImageManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [*(id *)(a1 + 32) identifierString];
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v19;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[RM]: %@ Failed to decode image", buf, 0xCu);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v20 = [*(id *)(a1 + 32) requestID];
      id v21 = [*(id *)(a1 + 32) identifierString];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v20, @"[RM]: %@ Failed to decode image", v21 message];
LABEL_31:
    }
  }
LABEL_32:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void ___chooserDidPresentLocallyAvailableBag_block_invoke(id *a1, char a2)
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0 && ![a1[4] isCancelled])
  {
    if ([(id)objc_opt_class() storeClassID] == 1)
    {
      *(_DWORD *)buf = 0;
      LODWORD(v94) = -1;
      id v6 = a1[6];
      [v6 tableType:buf index:&v94];
      double v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v100 = *MEMORY[0x1E4F28228];
      double v8 = [NSString stringWithFormat:@"Failed to decode table thumbnail with type: %ld, index: %ld", *(unsigned int *)buf, (int)v94];
      v101 = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
      uint64_t v10 = objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 7003, v9);
    }
    else
    {
      id v11 = a1[6];
      os_signpost_id_t v12 = [a1[4] asset];
      id v6 = [v11 fileURLForAssetID:v12];

      uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v14 = [v6 path];
      char v15 = [v13 fileExistsAtPath:v14];

      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      if (v15)
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 7001, 0);
      }
      else
      {
        uint64_t v98 = *MEMORY[0x1E4F28228];
        uint64_t v17 = NSString;
        uint64_t v18 = [v6 path];
        id v19 = [v17 stringWithFormat:@"Failed to decode because file does not exist at path: %@", v18];
        v99 = v19;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        uint64_t v10 = objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v20);
      }
    }

    id v21 = PLImageManagerGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [a1[4] identifierString];
      uint64_t v23 = [a1[4] asset];
      int v24 = [v23 uuid];
      uint64_t v25 = [v10 code];
      double v26 = [v10 debugDescription];
      *(_DWORD *)buf = 138413058;
      uint64_t v111 = (uint64_t)v22;
      __int16 v112 = 2112;
      CGRect v113 = v24;
      __int16 v114 = 2048;
      uint64_t v115 = v25;
      __int16 v116 = 2112;
      uint64_t v117 = (uint64_t)v26;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "[RM]: %@ failed to decode for asset: %@, error code: %ld, description: %@", buf, 0x2Au);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v78 = [a1[4] requestID];
      uint64_t v79 = [a1[4] identifierString];
      uint64_t v80 = [a1[4] asset];
      uint64_t v81 = [v80 uuid];
      uint64_t v82 = [v10 code];
      uint64_t v83 = [v10 debugDescription];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v78, @"[RM]: %@ failed to decode for asset: %@, error code: %ld, description: %@", v79, v81, v82, v83 message];
    }
    id v27 = a1[4];
    id v28 = a1[7];
    uint64_t v29 = (id *)v27;
    id v30 = v10;
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      uint64_t v31 = [v29 signpostID];
      if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v32 = v31;
        uint64_t v33 = PLImageManagerGetLog();
        uint64_t v34 = [v29 managerID];
        int v35 = [v29 requestID];
        uint64_t v36 = [v29 requestIndex];
        if (os_signpost_enabled(v33))
        {
          *(_DWORD *)buf = 134218752;
          uint64_t v111 = v34;
          __int16 v112 = 2048;
          CGRect v113 = (void *)v35;
          __int16 v114 = 2048;
          uint64_t v115 = v36;
          __int16 v116 = 2048;
          uint64_t v117 = 36;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v33, OS_SIGNPOST_EVENT, v32, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
        }
      }
    }
    id v37 = v29[19];
    double v38 = [v29 behaviorSpec];
    uint64_t v39 = [v38 choosingPolicy];
    double v40 = [v30 domain];
    if (![v40 isEqualToString:@"PHPhotosErrorDomain"]) {
      goto LABEL_28;
    }
    uint64_t v41 = [v30 code];

    if (v41 != 3303)
    {
      BOOL v42 = 0;
LABEL_31:
      [v29[18] setErrorIfNone:v30];
      if (v39 == 3)
      {
        CGRect v43 = [v37 behaviorSpec];
        if (([v43 onlyUseFetchedAssetPropertiesDuringChoosing] | v42)) {
          int v44 = 0;
        }
        else {
          int v44 = [v38 cannotReturnSmallerImage] ^ 1;
        }

        if [v28 keyIsHintBased] && (v44) {
          goto LABEL_55;
        }
        if (MEMORY[0x19F388C70]())
        {
          if (!v44) {
            goto LABEL_76;
          }
          goto LABEL_55;
        }
      }
      else
      {
        if (MEMORY[0x19F388C70]([v28 keyIsHintBased])) {
          goto LABEL_76;
        }
        LOBYTE(v44) = 0;
      }
      CGFloat v45 = [v28 dataStoreKey];
      double v46 = [v28 assetID];
      double v47 = [v45 validateForAssetID:v46 resourceIdentity:0];

      if ([v47 count])
      {
        int v92 = v38;
        uint64_t v93 = v28;
        char v89 = v44;
        id v90 = v37;
        CGFloat v48 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v47, "count"));
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v49 = v47;
        uint64_t v50 = [v49 countByEnumeratingWithState:&v94 objects:buf count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v95;
          do
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v95 != v52) {
                objc_enumerationMutation(v49);
              }
              v54 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v94 + 1) + 8 * i), "code"));
              [v48 addObject:v54];
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v94 objects:buf count:16];
          }
          while (v51);
        }

        v55 = [v29 asset];
        v56 = [v55 photoLibrary];
        v57 = [v29 asset];
        uint64_t v58 = [v56 objectFetchingManagedObjectContextForObject:v57 propertySet:@"PHAssetPropertySetCore"];

        v59 = (void *)MEMORY[0x1E4F8AB38];
        v60 = [v93 dataStoreKey];
        int v61 = [v93 dataStore];
        v62 = [v29 asset];
        v63 = [v62 objectID];
        CGAffineTransform v91 = (void *)v58;
        uint64_t v64 = [v59 imageRequestResourceForDataStoreKey:v60 store:v61 assetObjectID:v63 context:v58];

        BOOL v65 = v64 != 0;
        if (v64)
        {
          uint64_t v66 = [v29 delegate];
          int v67 = [v66 mediaRequestCanRequestRepair:v29];

          if (v67)
          {
            *(void *)&long long v106 = MEMORY[0x1E4F143A8];
            *((void *)&v106 + 1) = 3221225472;
            uint64_t v107 = ___handleKeyUsageFailureDuringChoosing_block_invoke;
            v108 = &unk_1E5846A10;
            CGRect v109 = v29;
            id v68 = (id)[v109 sendResourceRepairRequestForResource:v64 errorCodes:v48 reply:&v106];
            id v69 = v109;
            char v70 = v89;
            id v28 = v93;
LABEL_53:

            id v37 = v90;
            double v38 = v92;
            goto LABEL_63;
          }
          BOOL v65 = 0;
          id v37 = v90;
          double v38 = v92;
          id v28 = v93;
        }
        else
        {
          uint64_t v73 = PLImageManagerGetLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            uint64_t v74 = [v29 identifierString];
            LODWORD(v106) = 138412290;
            *(void *)((char *)&v106 + 4) = v74;
            _os_log_impl(&dword_19B043000, v73, OS_LOG_TYPE_ERROR, "[RM]: %@ Unable to build resource repair request.", (uint8_t *)&v106, 0xCu);
          }
          double v38 = v92;
          id v28 = v93;
          if (PHImageManagerRecordEnabled())
          {
            uint64_t v88 = [v29 requestID];
            id v69 = [v29 identifierString];
            +[PHImageManagerRequestTracer traceMessageForRequestID:v88, @"[RM]: %@ Unable to build resource repair request.", v69 message];
            char v70 = v89;
            goto LABEL_53;
          }
          BOOL v65 = 0;
          id v37 = v90;
        }
        char v70 = v89;
LABEL_63:

        if ((v70 & 1) == 0)
        {
          if (v65 && ![v29 isSynchronous]) {
            goto LABEL_77;
          }
          goto LABEL_76;
        }
LABEL_64:
        if ([v28 keyIsHintBased])
        {
          uint64_t v75 = PLImageManagerGetLog();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v76 = [v29 identifierString];
            LODWORD(v102) = 138412290;
            *(void *)((char *)&v102 + 4) = v76;
            _os_log_impl(&dword_19B043000, v75, OS_LOG_TYPE_DEBUG, "[RM]: %@ hint based key usage failed (hints may be stale), choosing without hints...", (uint8_t *)&v102, 0xCu);
          }
          if (PHImageManagerRecordEnabled())
          {
            uint64_t v84 = v38;
            uint64_t v85 = [v29 requestID];
            uint64_t v86 = [v29 identifierString];
            uint64_t v87 = v85;
            double v38 = v84;
            +[PHImageManagerRequestTracer traceMessageForRequestID:v87, @"[RM]: %@ hint based key usage failed (hints may be stale), choosing without hints...", v86 message];
          }
          [v37 setAllowHints:0];
        }
        else if (![v29 isSynchronous])
        {
          if (!v65)
          {
            uint64_t v77 = [v29 imageDelegate];
            *(void *)&long long v102 = MEMORY[0x1E4F143A8];
            *((void *)&v102 + 1) = 3221225472;
            v103 = ___handleKeyUsageFailureDuringChoosing_block_invoke_208;
            v104 = &unk_1E5842440;
            id v105 = v37;
            [v77 imageRequest:v29 isRequestingScheduledWorkBlock:&v102];
          }
          goto LABEL_77;
        }
        [v37 presentNextQualifyingResource];
LABEL_77:

        return;
      }

      if (v44)
      {
LABEL_55:
        LOBYTE(v65) = 0;
        goto LABEL_64;
      }
LABEL_76:
      _finishRequest(v29);
      goto LABEL_77;
    }
    double v40 = [v28 dataStore];
    if (![(id)objc_opt_class() storeClassID])
    {
      uint64_t v71 = [v28 dataStoreKey];
      v72 = [v71 keyData];
      BOOL v42 = PLPrimaryDataStoreKeyStrategyFromData() == 4;
    }
    else
    {
LABEL_28:
      BOOL v42 = 0;
    }

    goto LABEL_31;
  }
  [*((id *)a1[4] + 18) clearError];
  if ([a1[4] wantsProgress] && dyld_program_sdk_at_least())
  {
    uint64_t v3 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    [v3 setCompletedUnitCount:1];
    os_signpost_id_t v4 = [a1[4] delegate];
    [v4 mediaRequest:a1[4] didReportProgress:v3];
  }
  id v5 = a1[4];

  _finishRequest(v5);
}

void _cleanupContext(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    uint64_t v3 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    os_signpost_id_t v4 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    id v5 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    id v6 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    CGImageRelease(*(CGImageRef *)(a1 + 88));
    *(void *)(a1 + 88) = 0;
    double v7 = *(const void **)(a1 + 96);
    if (v7) {
      CFRelease(v7);
    }
    double v8 = *(void **)(a1 + 104);
    *(void *)(a1 + 96) = 0;
    *(void *)(a1 + 104) = 0;

    free((void *)a1);
  }
}

void _finishRequest(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  unint64_t v2 = 0x1E93D2000uLL;
  if (([v1[29] shouldLoadDataOrURL] & 1) == 0)
  {
    [v1[18] setExifOrientation:0];
    [v1[18] setUniformTypeIdentifier:0];
  }
  uint64_t v3 = [v1[18] error];
  if ([v1 isCancelled]) {
    goto LABEL_4;
  }
  if (v3)
  {
    os_signpost_id_t v4 = [v3 domain];
    if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v5 = [v3 code];

      if (v5 == 3072)
      {
LABEL_4:
        [v1[18] setCancelled:1];
        goto LABEL_26;
      }
    }
    else
    {
    }
  }
  if ([v1[18] imageRef]) {
    goto LABEL_26;
  }
  id v6 = [v1 behaviorSpec];
  if (([v6 allowPlaceholder] & 1) == 0)
  {
LABEL_25:

    goto LABEL_26;
  }
  double v7 = [v1 behaviorSpec];
  int v8 = [v7 shouldLoadImage];

  if (!v8) {
    goto LABEL_26;
  }
  id v9 = [MEMORY[0x1E4F8AAC0] sharedManager];
  uint64_t v10 = (CGImage *)objc_msgSend(v9, "newPlaceholderImageWithSize:", 1.0, 1.0);

  if (!v10)
  {
    uint64_t v13 = [v1[18] error];

    if (v13) {
      goto LABEL_26;
    }
    uint64_t v14 = PLImageManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      char v15 = [v1 identifierString];
      *(_DWORD *)buf = 138412290;
      double v26 = v15;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "%@ failed to generate placeholder", buf, 0xCu);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v21 = [v1 requestID];
      uint64_t v22 = [v1 identifierString];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v21, @"%@ failed to generate placeholder", v22 message];
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    int v24 = @"Error generating placeholder image";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v6 = objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v17);

    [v1[18] setError:v6];
    goto LABEL_25;
  }
  id v11 = PLImageManagerGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    os_signpost_id_t v12 = [v1 identifierString];
    *(_DWORD *)buf = 138412290;
    double v26 = v12;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "[RM]: %@ delivering placeholder", buf, 0xCu);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v19 = [v1 requestID];
    uint64_t v20 = [v1 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v19, @"[RM]: %@ delivering placeholder", v20 message];

    unint64_t v2 = 0x1E93D2000;
  }
  [*(id *)((char *)v1 + *(int *)(v2 + 3264)) setImageRef:v10];
  CGImageRelease(v10);
  [*(id *)((char *)v1 + *(int *)(v2 + 3264)) setIsPlaceholder:1];
LABEL_26:
  uint64_t v18 = [v1 delegate];
  [v18 mediaRequest:v1 didFinishWithResult:*(id *)((char *)v1 + *(int *)(v2 + 3264))];
}

uint64_t PHErrorIsMediaServerDisconnected()
{
  uint64_t v0 = PLUnderlyingErrorThatHasDomainAndCode();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = (void *)v0;
  unint64_t v2 = PLUnderlyingErrorWithDomain();

  if (!v2) {
    return 0;
  }
  uint64_t v3 = MEMORY[0x19F388A80](v2, &unk_1EEB26F70);

  return v3;
}

void PHChooserListSetSortDescriptor(void *a1, void *a2)
{
  uint64_t v10 = a1;
  id v3 = a2;
  if (([v10[8] isEqual:v3] & 1) == 0)
  {
    objc_storeStrong(v10 + 8, a2);
    id v4 = v10[4];
    if (v4)
    {
      uint64_t v5 = _sortedInfosFromChooserInfos(v4, v10);
      id v6 = v10[4];
      v10[4] = (id)v5;
    }
    id v7 = v10[10];
    if (v7)
    {
      uint64_t v8 = _sortedInfosFromChooserInfos(v7, v10);
      id v9 = v10[10];
      v10[10] = (id)v8;
    }
  }
}

void sub_19B06F368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19B070848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return MEMORY[0x1F41864E8](v1, a1, 0, 0, 0);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_19B0720F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B072DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19B07324C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ph_objc_removeAssociatedObjects(void *a1)
{
  id v1 = a1;
  sSharedTable();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeAllAssociatedObjectsOnObject:v1];
}

void __sSharedTable_block_invoke()
{
  uint64_t v0 = objc_alloc_init(PHAssociatedObjectsTable);
  id v1 = (void *)sSharedTable_pl_once_object_17;
  sSharedTable_pl_once_object_17 = (uint64_t)v0;
}

uint64_t ___loadImageFromStoreAndKey_block_invoke_186(uint64_t a1, void *a2)
{
  return [a2 incrementImageCacheHitCount];
}

void sub_19B075EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B077B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

uint64_t sub_19B077E34(void *a1)
{
  uint64_t v2 = v1;
  id v4 = *(os_unfair_lock_s **)&v1[OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState];
  uint64_t v5 = (uint64_t *)&v4[4];
  id v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_19B0781C0(v5, aBlock);
  os_unfair_lock_unlock(v6);
  LOBYTE(v5) = aBlock[0];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(unsigned char *)(v7 + 24) = (_BYTE)v5;
  *(void *)(v7 + 32) = v2;
  uint64_t v8 = OUTLINED_FUNCTION_4();
  *(void *)(v8 + 16) = sub_19B045DF4;
  *(void *)(v8 + 24) = v7;
  void aBlock[4] = sub_19B045DC8;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19B045DA0;
  aBlock[3] = &block_descriptor_36;
  id v9 = _Block_copy(aBlock);
  id v10 = a1;
  id v11 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBlockAndWait_, v9);
  _Block_release(v9);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v2) {
    __break(1u);
  }
  return result;
}

id newPhotoLibrary(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v12 = 0;
  uint64_t v7 = (void *)[MEMORY[0x1E4F8AA78] newPhotoLibraryWithName:a1 loadedFromBundle:v5 options:0 error:&v12];
  id v8 = v12;
  if (v7)
  {
    id v9 = [v7 managedObjectContext];
    [v6 addManagedObjectContext:v9];
  }
  else
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v5 libraryURL];
      *(_DWORD *)buf = 136446722;
      uint64_t v14 = a1;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
    }
  }

  return v7;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_allocObject();
}

id sub_19B0781C0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *a1;
  id result = objc_msgSend(*(id *)(*a1 + 16), sel_addObject_, v4);
  *a2 = *(unsigned char *)(v5 + 24);
  return result;
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

void sub_19B079228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PHIsExpressionMatchingTypeOrAggregateMatchingType(void *a1, char *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [v3 expressionType];
  if (!v4)
  {
    char v10 = 0;
    BOOL v7 = 1;
    if (!a2) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v4 != 14)
  {
    char v10 = 0;
    BOOL v7 = 0;
    if (!a2) {
      goto LABEL_16;
    }
LABEL_15:
    *a2 = v10;
    goto LABEL_16;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend(v3, "collection", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  BOOL v7 = v6 != 0;
  if (v6)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v9) expressionType])
        {

          BOOL v7 = 0;
          goto LABEL_18;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_18:
  char v10 = 1;
  if (a2) {
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

void sub_19B079630(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x19B07961CLL);
  }
  _Unwind_Resume(a1);
}

void sub_19B07A0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __PHNextImageAndAssetResourceManagerID_block_invoke()
{
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t PHMemoryValidatedMemorySubcategory(uint64_t a1)
{
  uint64_t v1 = 0;
  if (a1 <= 300)
  {
    if ((unint64_t)(a1 - 201) >= 0x12 && (unint64_t)(a1 - 101) >= 3 && a1) {
      return v1;
    }
    return a1;
  }
  if (a1 > 999)
  {
    if ((unint64_t)(a1 - 1000) < 4 || a1 == 1100) {
      return a1;
    }
  }
  else if ((unint64_t)(a1 - 401) < 4 || (unint64_t)(a1 - 301) < 3)
  {
    return a1;
  }
  return v1;
}

uint64_t PHMemoryValidatedMemoryCategory(uint64_t a1)
{
  uint64_t v1 = 0;
  if (a1 > 200)
  {
    if ((unint64_t)(a1 - 201) >= 0x15 && (unint64_t)(a1 - 301) >= 2 && a1 != 401) {
      return v1;
    }
    return a1;
  }
  if ((unint64_t)a1 <= 0x20 && a1 != 22 || (unint64_t)(a1 - 100) < 3) {
    return a1;
  }
  return v1;
}

void sub_19B07D428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __PHImageManagerRecordEnabled_block_invoke()
{
  uint64_t v0 = PLImageManagerGetLog();
  PHImageManagerRecordEnabled_s_enabled = os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);
}

void __PHSignpostEventsEnabled_block_invoke()
{
  uint64_t v0 = getenv("PH_ENABLE_IMAGE_MANAGER_EVENTS");
  if (v0)
  {
    id v1 = [NSString stringWithUTF8String:v0];
    PHSignpostEventsEnabled_eventsEnabled = [v1 BOOLValue];
  }
}

void __sReadUserDefaults_block_invoke()
{
  if (MEMORY[0x19F388B10]())
  {
    id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    sIsLoggingDisabled = [v0 BOOLForKey:@"com.apple.photos.performanceLogsDisabled"];
    sAreBacktracesEnabled = [v0 BOOLForKey:@"com.apple.photos.performanceLogsEnableBacktraces"];
  }
}

void sub_19B082F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForKeyAssetsInSuggestion_block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    long long v12 = "PHQueryForKeyAssetsInSuggestion_block_invoke_6";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  BOOL v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B0843A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B084534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0846C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B084854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0849E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B084B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B084D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B084E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B085024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0851B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_19B0851E0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t type metadata accessor for PHDatabaseStatisticsTracker()
{
  return self;
}

void sub_19B085830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B08669C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B086AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHChange.changeDetails<A>(for:)(uint64_t a1)
{
  id result = objc_msgSend(v1, sel_changeDetailsForObject_, a1);
  if (result)
  {
    uint64_t v3 = self;
    return (id)OUTLINED_FUNCTION_0(v3);
  }
  return result;
}

id PHChange.changeDetails<A>(for:)()
{
  uint64_t v1 = self;
  id result = objc_msgSend(v0, sel_changeDetailsForFetchResult_, OUTLINED_FUNCTION_0(v1));
  if (result)
  {
    uint64_t v3 = self;
    return (id)OUTLINED_FUNCTION_0(v3);
  }
  return result;
}

void type metadata accessor for PHPhotosError(uint64_t a1)
{
}

uint64_t sub_19B086C08(uint64_t a1)
{
  uint64_t v2 = sub_19B087174(&qword_1E93D58B0, type metadata accessor for PHPhotosError);

  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_19B086C74(uint64_t a1)
{
  uint64_t v2 = sub_19B087174(&qword_1E93D58B0, type metadata accessor for PHPhotosError);

  return MEMORY[0x1F40E6E10](a1, v2);
}

uint64_t sub_19B086CE4(uint64_t a1)
{
  uint64_t v2 = sub_19B087174((unint64_t *)&qword_1E93D58E8, type metadata accessor for PHPhotosError);

  return MEMORY[0x1F40E4480](a1, v2);
}

id sub_19B086D50()
{
  return *v0;
}

uint64_t sub_19B086D58@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_19B086D64()
{
  return sub_19B2A9790();
}

uint64_t sub_19B086D74(uint64_t a1)
{
  uint64_t v2 = sub_19B087174((unint64_t *)&qword_1E93D58E8, type metadata accessor for PHPhotosError);

  return MEMORY[0x1F40E44F0](a1, v2);
}

uint64_t sub_19B086DE0(uint64_t a1)
{
  uint64_t v2 = sub_19B087174((unint64_t *)&qword_1E93D58E8, type metadata accessor for PHPhotosError);

  return MEMORY[0x1F40E44A8](a1, v2);
}

uint64_t sub_19B086E4C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_19B087174((unint64_t *)&qword_1E93D58E8, type metadata accessor for PHPhotosError);
  id v5 = a1;

  return MEMORY[0x1F40E4498](v5, a2, v4);
}

uint64_t sub_19B086EDC()
{
  return sub_19B086EE4(*v0);
}

uint64_t sub_19B086EE4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_19B2A9810();

  return v2;
}

uint64_t sub_19B086F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_19B087174((unint64_t *)&qword_1E93D58E8, type metadata accessor for PHPhotosError);

  return MEMORY[0x1F40E44D8](a1, a2, v4);
}

uint64_t sub_19B086F94()
{
  return sub_19B2A9910();
}

void sub_19B086FF4(uint64_t a1@<X8>)
{
  sub_19B087028();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_19B087030@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_19B087060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_19B087174((unint64_t *)&qword_1E93D58E8, type metadata accessor for PHPhotosError);

  return MEMORY[0x1F40E44B8](a1, a2, a3, v6);
}

uint64_t sub_19B0870E4()
{
  return sub_19B087174(&qword_1E93D58A0, type metadata accessor for PHPhotosError);
}

uint64_t sub_19B08712C()
{
  return sub_19B087174(&qword_1E93D58A8, type metadata accessor for PHPhotosError);
}

uint64_t sub_19B087174(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_19B0871BC()
{
  return sub_19B087174(&qword_1E93D58B0, type metadata accessor for PHPhotosError);
}

uint64_t sub_19B087204()
{
  return sub_19B087174(&qword_1E93D58B8, type metadata accessor for PHPhotosError);
}

uint64_t sub_19B08724C()
{
  return sub_19B087174(&qword_1E93D58C0, type metadata accessor for PHPhotosError);
}

uint64_t sub_19B087294()
{
  return sub_19B087174(&qword_1E93D58C8, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_19B0872F0()
{
  return sub_19B087174(&qword_1E93D58D0, type metadata accessor for Code);
}

unint64_t sub_19B08733C()
{
  unint64_t result = qword_1E93D58D8;
  if (!qword_1E93D58D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E93D58D8);
  }
  return result;
}

uint64_t sub_19B087388()
{
  return sub_19B087174(&qword_1E93D58E0, type metadata accessor for Code);
}

uint64_t sub_19B0873D0()
{
  return sub_19B087174((unint64_t *)&qword_1E93D58E8, type metadata accessor for PHPhotosError);
}

BOOL sub_19B087418(uint64_t *a1, uint64_t *a2)
{
  return sub_19B087424(*a1, *a2);
}

BOOL sub_19B087424(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)()
{
  id v1 = (void *)sub_19B2A97D0();
  id v2 = objc_msgSend(v0, sel_cloudIdentifierMappingsForLocalIdentifiers_, v1);

  sub_19B087E40(0, &qword_1E93D58F8);
  uint64_t v3 = sub_19B2A9760();

  sub_19B087BA0(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t PHPhotoLibrary.localIdentifierMappings(for:)()
{
  sub_19B087E40(0, &qword_1E93D5900);
  id v1 = (void *)sub_19B2A97D0();
  id v2 = objc_msgSend(v0, sel_localIdentifierMappingsForCloudIdentifiers_, v1);

  sub_19B087E40(0, &qword_1E93D5908);
  sub_19B087E7C();
  uint64_t v3 = sub_19B2A9760();

  if ((v3 & 0xC000000000000001) != 0) {
    uint64_t v4 = sub_19B0878CC();
  }
  else {
    sub_19B087EDC(v3);
  }
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_19B0875E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D5920);
  uint64_t v2 = sub_19B2A98A0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_19B08851C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_19B08770C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int v11 = (uint64_t *)(v3[6] + 16 * result);
    *int v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_19B088584(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_19B08770C(uint64_t a1, uint64_t a2)
{
  sub_19B2A9900();
  sub_19B2A97A0();
  uint64_t v4 = sub_19B2A9910();

  return sub_19B087784(a1, a2, v4);
}

unint64_t sub_19B087784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_19B2A98C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_19B2A98C0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_19B2A98C0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_19B0878CC()
{
  if (sub_19B2A9850())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D5918);
    uint64_t v0 = sub_19B2A98A0();
  }
  else
  {
    uint64_t v0 = MEMORY[0x1E4FBC868];
  }
  uint64_t v24 = v0;
  sub_19B2A9840();
  swift_unknownObjectRetain();
  uint64_t v1 = sub_19B2A9860();
  if (v1)
  {
    uint64_t v3 = (void *)v1;
    uint64_t v4 = v2;
    sub_19B087E40(0, &qword_1E93D5900);
    while (1)
    {
      swift_dynamicCast();
      uint64_t v22 = v4;
      sub_19B087E40(0, &qword_1E93D5908);
      swift_dynamicCast();
      id v5 = (id)sub_19B088468(v3);
      uint64_t v7 = v6;
      if (v6 || (id v5 = objc_msgSend(v3, sel_error)) != 0)
      {
        id v8 = v5;
      }
      else
      {
        type metadata accessor for PHPhotosError(0);
        sub_19B0875E0(MEMORY[0x1E4FBC860]);
        sub_19B0884CC();
        sub_19B2A9750();
        id v8 = v22;
      }

      uint64_t v0 = v24;
      unint64_t v9 = *(void *)(v24 + 16);
      if (*(void *)(v24 + 24) <= v9)
      {
        sub_19B08815C(v9 + 1, 1);
        uint64_t v0 = v24;
      }
      uint64_t result = sub_19B2A9800();
      uint64_t v11 = v0 + 64;
      uint64_t v12 = -1 << *(unsigned char *)(v0 + 32);
      unint64_t v13 = result & ~v12;
      unint64_t v14 = v13 >> 6;
      if (((-1 << v13) & ~*(void *)(v0 + 64 + 8 * (v13 >> 6))) == 0) {
        break;
      }
      unint64_t v15 = __clz(__rbit64((-1 << v13) & ~*(void *)(v0 + 64 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
LABEL_20:
      *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v0 + 48) + 8 * v15) = v23;
      uint64_t v20 = *(void *)(v0 + 56) + 24 * v15;
      *(void *)uint64_t v20 = v8;
      *(void *)(v20 + 8) = v7;
      *(unsigned char *)(v20 + 16) = v7 == 0;
      ++*(void *)(v0 + 16);
      uint64_t v3 = (void *)sub_19B2A9860();
      uint64_t v4 = v21;
      if (!v3) {
        goto LABEL_23;
      }
    }
    char v16 = 0;
    unint64_t v17 = (unint64_t)(63 - v12) >> 6;
    while (++v14 != v17 || (v16 & 1) == 0)
    {
      BOOL v18 = v14 == v17;
      if (v14 == v17) {
        unint64_t v14 = 0;
      }
      v16 |= v18;
      uint64_t v19 = *(void *)(v11 + 8 * v14);
      if (v19 != -1)
      {
        unint64_t v15 = __clz(__rbit64(~v19)) + (v14 << 6);
        goto LABEL_20;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_23:
    swift_release();
    return v0;
  }
  return result;
}

void sub_19B087BA0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D5930);
  uint64_t v2 = sub_19B2A9880();
  uint64_t v3 = (void *)v2;
  int64_t v4 = 0;
  uint64_t v30 = a1;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v27 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v5;
  int64_t v28 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v29 = v2 + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v9 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v4 << 6))
  {
    unint64_t v14 = (uint64_t *)(*(void *)(v30 + 48) + 16 * i);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    unint64_t v17 = *(void **)(*(void *)(v30 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    id v18 = v17;
    id v19 = objc_msgSend(v18, sel_cloudIdentifier);
    if (v19)
    {

      id v20 = v19;
    }
    else
    {
      id v21 = objc_msgSend(v18, sel_error);
      if (v21)
      {
        id v20 = v21;
      }
      else
      {
        type metadata accessor for PHPhotosError(0);
        sub_19B0875E0(MEMORY[0x1E4FBC860]);
        sub_19B0884CC();
        sub_19B2A9750();
        id v20 = v31;
      }
    }
    *(void *)(v29 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v22 = (void *)(v3[6] + 16 * i);
    *uint64_t v22 = v16;
    v22[1] = v15;
    uint64_t v23 = v3[7] + 16 * i;
    *(void *)uint64_t v23 = v20;
    *(unsigned char *)(v23 + 8) = v19 == 0;
    uint64_t v24 = v3[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v3[2] = v26;
    if (v8) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_31;
    }
    if (v11 >= v28) {
      return;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v28) {
        return;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v28) {
          return;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v4);
        if (!v12) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v8 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v28) {
    return;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v28) {
      return;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_19;
    }
  }
LABEL_32:
  __break(1u);
}

uint64_t sub_19B087E40(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_19B087E7C()
{
  unint64_t result = qword_1E93D5910;
  if (!qword_1E93D5910)
  {
    sub_19B087E40(255, &qword_1E93D5900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E93D5910);
  }
  return result;
}

void sub_19B087EDC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D5918);
  uint64_t v2 = sub_19B2A9880();
  uint64_t v3 = (void *)v2;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v25 = a1;
  uint64_t v26 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v5;
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v28 = v2 + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v9 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v4 << 6))
  {
    unint64_t v14 = *(void **)(*(void *)(a1 + 56) + 8 * i);
    id v15 = *(id *)(*(void *)(a1 + 48) + 8 * i);
    id v16 = v14;
    id v17 = (id)sub_19B088468(v16);
    uint64_t v19 = v18;
    if (v18 || (id v17 = objc_msgSend(v16, sel_error)) != 0)
    {
      id v20 = v17;
    }
    else
    {
      type metadata accessor for PHPhotosError(0);
      sub_19B0875E0(MEMORY[0x1E4FBC860]);
      sub_19B0884CC();
      a1 = v25;
      sub_19B2A9750();
      id v20 = v29;
    }

    *(void *)(v28 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(void *)(v3[6] + 8 * i) = v15;
    uint64_t v21 = v3[7] + 24 * i;
    *(void *)uint64_t v21 = v20;
    *(void *)(v21 + 8) = v19;
    *(unsigned char *)(v21 + 16) = v19 == 0;
    uint64_t v22 = v3[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v3[2] = v24;
    if (v8) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_29;
    }
    if (v11 >= v27) {
      return;
    }
    unint64_t v12 = *(void *)(v26 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v27) {
        return;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v27) {
          return;
        }
        unint64_t v12 = *(void *)(v26 + 8 * v4);
        if (!v12) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v8 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v27) {
    return;
  }
  unint64_t v12 = *(void *)(v26 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v27) {
      return;
    }
    unint64_t v12 = *(void *)(v26 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_19;
    }
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_19B08815C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D5918);
  char v38 = a2;
  uint64_t v6 = sub_19B2A9890();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    int v35 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    id v37 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = *(void **)(*(void *)(v5 + 48) + 8 * i);
      uint64_t v20 = *(void *)(v5 + 56) + 24 * i;
      uint64_t v21 = *(void **)v20;
      uint64_t v22 = *(void *)(v20 + 8);
      char v23 = *(unsigned char *)(v20 + 16);
      if ((v38 & 1) == 0)
      {
        id v24 = v19;
        sub_19B088594(v21, v22, v23);
      }
      uint64_t result = sub_19B2A9800();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) == 0)
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          BOOL v31 = v27 == v30;
          if (v27 == v30) {
            unint64_t v27 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v11 + 8 * v27);
          if (v32 != -1)
          {
            unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      *(void *)(*(void *)(v7 + 48) + 8 * v28) = v19;
      uint64_t v33 = *(void *)(v7 + 56) + 24 * v28;
      *(void *)uint64_t v33 = v21;
      *(void *)(v33 + 8) = v22;
      *(unsigned char *)(v33 + 16) = v23;
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_39;
      }
      if (v16 >= v36) {
        goto LABEL_32;
      }
      unint64_t v17 = v37[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v36) {
          goto LABEL_32;
        }
        unint64_t v17 = v37[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v36)
          {
LABEL_32:
            swift_release();
            uint64_t v3 = v35;
            if (v38)
            {
              uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
              if (v34 >= 64) {
                sub_19B08844C(0, (unint64_t)(v34 + 63) >> 6, v37);
              }
              else {
                *id v37 = -1 << v34;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v37[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_40;
              }
              if (v13 >= v36) {
                goto LABEL_32;
              }
              unint64_t v17 = v37[v13];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_18:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_19B08844C(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_19B088468(void *a1)
{
  id v1 = objc_msgSend(a1, sel_localIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_19B2A9790();

  return v3;
}

unint64_t sub_19B0884CC()
{
  unint64_t result = qword_1E93D58E8;
  if (!qword_1E93D58E8)
  {
    type metadata accessor for PHPhotosError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E93D58E8);
  }
  return result;
}

uint64_t sub_19B08851C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D5928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_19B088584(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_19B088594(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t PHPersistentChangeFetchResult.Iterator.__allocating_init(fetchResult:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(a1);
  return v2;
}

uint64_t PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(void *a1)
{
  *(void *)(v1 + 24) = a1;
  *(void *)(v1 + 16) = objc_msgSend(a1, sel_iteratorForPersistentChangeEnumeration);
  return v1;
}

PHPersistentChange_optional __swiftcall PHPersistentChangeFetchResult.Iterator.next()()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (objc_msgSend(v1, sel_hasMoreTransactions)) {
    uint64_t v5 = (objc_class *)objc_msgSend(*(id *)(v0 + 24), sel_nextPersistentChangeWithIterator_, v1);
  }
  else {
    uint64_t v5 = 0;
  }
  result.value._changeToken = v3;
  result.value._change = v2;
  result.value.super.isa = v5;
  result.is_nil = v4;
  return result;
}

uint64_t PHPersistentChangeFetchResult.Iterator.deinit()
{
  return v0;
}

uint64_t PHPersistentChangeFetchResult.Iterator.__deallocating_deinit()
{
  PHPersistentChangeFetchResult.Iterator.deinit();

  return MEMORY[0x1F4186488](v0, 32, 7);
}

unint64_t sub_19B0886CC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
  *a1 = result;
  return result;
}

uint64_t PHPersistentChangeFetchResult.makeIterator()()
{
  type metadata accessor for PHPersistentChangeFetchResult.Iterator();
  uint64_t v1 = swift_allocObject();
  PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(v0);
  return v1;
}

uint64_t type metadata accessor for PHPersistentChangeFetchResult.Iterator()
{
  return self;
}

unint64_t sub_19B088760()
{
  unint64_t result = qword_1E93D5938;
  if (!qword_1E93D5938)
  {
    type metadata accessor for PHPersistentChangeFetchResult.Iterator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E93D5938);
  }
  return result;
}

void sub_19B0887AC(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = PHPersistentChangeFetchResult.makeIterator()();

  *a1 = v4;
}

uint64_t sub_19B0887EC()
{
  return 2;
}

uint64_t sub_19B0887F4()
{
  return sub_19B088818();
}

uint64_t sub_19B088818()
{
  uint64_t v1 = sub_19B088948(v0);

  return v1;
}

uint64_t sub_19B088848()
{
  return sub_19B08886C();
}

uint64_t sub_19B088870()
{
  return sub_19B2A97C0();
}

uint64_t method lookup function for PHPersistentChangeFetchResult.Iterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PHPersistentChangeFetchResult.Iterator);
}

uint64_t dispatch thunk of PHPersistentChangeFetchResult.Iterator.__allocating_init(fetchResult:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

unint64_t sub_19B088908()
{
  unint64_t result = qword_1E93D5940;
  if (!qword_1E93D5940)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E93D5940);
  }
  return result;
}

uint64_t sub_19B088948(void *a1)
{
  type metadata accessor for PHPersistentChangeFetchResult.Iterator();
  swift_initStackObject();
  PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(a1);
  uint64_t result = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
  uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(MEMORY[0x1E4FBC860] + 32);
    while (1)
    {
      if (!v5)
      {
        unint64_t v7 = v3[3];
        if ((uint64_t)((v7 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
        if (v8 <= 1) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v8;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D5948);
        unint64_t v10 = (void *)swift_allocObject();
        uint64_t v11 = (uint64_t)(_swift_stdlib_malloc_size(v10) - 32) / 8;
        v10[2] = v9;
        v10[3] = (2 * v11) | 1;
        unint64_t v12 = (unint64_t)(v10 + 4);
        unint64_t v13 = v3[3];
        unint64_t v14 = v13 >> 1;
        if (v3[2])
        {
          if (v10 != v3 || v12 >= (unint64_t)&v3[v14 + 4]) {
            memmove(v10 + 4, v3 + 4, 8 * v14);
          }
          v3[2] = 0;
        }
        uint64_t v6 = (uint64_t *)(v12 + 8 * v14);
        uint64_t v5 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - (v13 >> 1);
        uint64_t result = swift_release();
        uint64_t v3 = v10;
      }
      BOOL v16 = __OFSUB__(v5--, 1);
      if (v16) {
        break;
      }
      *v6++ = v4;
      uint64_t result = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
      uint64_t v4 = result;
      if (!result) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v5 = 0;
LABEL_21:
  uint64_t result = swift_release();
  unint64_t v17 = v3[3];
  if (v17 < 2) {
    return (uint64_t)v3;
  }
  unint64_t v18 = v17 >> 1;
  BOOL v16 = __OFSUB__(v18, v5);
  unint64_t v19 = v18 - v5;
  if (!v16)
  {
    v3[2] = v19;
    return (uint64_t)v3;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_19B088AC4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for PHPersistentChangeFetchResult.Iterator();
  uint64_t v8 = swift_allocObject();
  uint64_t result = PHPersistentChangeFetchResult.Iterator.init(fetchResult:)(v4);
  uint64_t v10 = 0;
  if (!a2 || !a3)
  {
LABEL_9:
    *a1 = v8;
    return v10;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unint64_t v11 = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
    uint64_t v10 = 0;
    if (v11)
    {
      while (1)
      {
        *(void *)(a2 + 8 * v10) = v11;
        if (a3 - 1 == v10) {
          break;
        }
        unint64_t v11 = (unint64_t)PHPersistentChangeFetchResult.Iterator.next()();
        ++v10;
        if (!v11) {
          goto LABEL_9;
        }
      }
      uint64_t v10 = a3;
    }
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_19B088B6C()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_19B088B94()
{
  uint64_t v0 = sub_19B088B6C();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_19B088BF8()
{
  OUTLINED_FUNCTION_3(OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  OUTLINED_FUNCTION_2();
  sub_19B088C74(v2, v3);
  os_unfair_lock_unlock(v1);
  uint64_t v4 = sub_19B088CF4(0, v6, v0);
  swift_bridgeObjectRelease();
  return v4;
}

void sub_19B088C74(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*(id *)(*(void *)a1 + 16), sel_allObjects);
  sub_19B087E40(0, &qword_1E93D59D8);
  uint64_t v4 = sub_19B2A97E0();

  *a2 = v4;
}

uint64_t sub_19B088CF4(uint64_t a1, unint64_t a2, void *a3)
{
  if (a2 >> 62) {
    goto LABEL_13;
  }
  uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_19B2A9870())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x19F387D40](v7 - 4, a2) : *(id *)(a2 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v11 = sub_19B088DF8();

      BOOL v12 = __OFADD__(a1, v11);
      a1 += v11;
      if (v12) {
        goto LABEL_12;
      }
      ++v7;
      if (v10 == v6) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_10:

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_19B088DF8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E93D59E0);
  sub_19B2A97F0();
  if (v4)
  {
    id v0 = v4;
    uint64_t v1 = (uint64_t)objc_msgSend(v0, sel_pageSize);
    uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_totalCachePages);

    uint64_t result = v1 * v2;
    if ((unsigned __int128)(v1 * (__int128)v2) >> 64 == (v1 * v2) >> 63) {
      return result;
    }
    __break(1u);
  }
  return 0;
}

id sub_19B088EB4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(a1, sel_databaseStatistics);
  *a2 = result;
  return result;
}

void sub_19B088EF4()
{
  OUTLINED_FUNCTION_3(OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  OUTLINED_FUNCTION_2();
  sub_19B08917C(v2, v3);
  os_unfair_lock_unlock(v1);
  uint64_t isEscapingClosureAtFileLocation = aBlock[0];
  if (aBlock[0] >> 62) {
    goto LABEL_12;
  }
  uint64_t v5 = *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      unint64_t v17 = isEscapingClosureAtFileLocation & 0xC000000000000001;
      uint64_t v8 = isEscapingClosureAtFileLocation;
      while (1)
      {
        id v9 = v17
           ? (id)MEMORY[0x19F387D40](v7, isEscapingClosureAtFileLocation)
           : *(id *)(isEscapingClosureAtFileLocation + 8 * v7 + 32);
        uint64_t v10 = v9;
        uint64_t v11 = OUTLINED_FUNCTION_4();
        *(void *)(v11 + 16) = v10;
        *(void *)(v11 + 24) = v0;
        id v12 = v10;
        id v13 = v0;
        sub_19B08A000((uint64_t)v6);
        uint64_t v14 = OUTLINED_FUNCTION_4();
        *(void *)(v14 + 16) = sub_19B08A054;
        *(void *)(v14 + 24) = v11;
        void aBlock[4] = sub_19B045DC8;
        aBlock[5] = v14;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_19B045DA0;
        aBlock[3] = &block_descriptor_26;
        id v15 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v12, sel_performBlockAndWait_, v15);

        _Block_release(v15);
        uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (isEscapingClosureAtFileLocation) {
          break;
        }
        ++v7;
        uint64_t v6 = sub_19B08A054;
        uint64_t isEscapingClosureAtFileLocation = v8;
        if (v5 == v7)
        {
          swift_bridgeObjectRelease();
          BOOL v16 = sub_19B08A054;
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_19B2A9870();
      swift_bridgeObjectRelease();
      if (!v5) {
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    BOOL v16 = 0;
LABEL_14:
    sub_19B08A000((uint64_t)v16);
  }
}

void sub_19B08917C(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_19B089198(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(a1, sel__delegate);
  sub_19B2A9820();
  swift_unknownObjectRelease();
  sub_19B087E40(0, &qword_1E93D59D0);
  if (swift_dynamicCast())
  {
    objc_msgSend(v4, sel_setPhotoKitStatsTracker_, a2);
  }
}

void sub_19B089288()
{
  OUTLINED_FUNCTION_1(OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  OUTLINED_FUNCTION_2();
  sub_19B0894FC(v1, v2);
  os_unfair_lock_unlock(v0);
  uint64_t v3 = aBlock[0];
  if (aBlock[0] >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (v4 >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      while (1)
      {
        id v7 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x19F387D40](v6, v3) : *(id *)(v3 + 8 * v6 + 32);
        uint64_t v8 = v7;
        uint64_t v9 = swift_allocObject();
        *(void *)(v9 + 16) = v8;
        id v10 = v8;
        sub_19B08A000((uint64_t)v5);
        uint64_t v11 = OUTLINED_FUNCTION_4();
        *(void *)(v11 + 16) = sub_19B089FF8;
        *(void *)(v11 + 24) = v9;
        void aBlock[4] = sub_19B045DCC;
        aBlock[5] = v11;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_19B045DA0;
        aBlock[3] = &block_descriptor;
        id v12 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v10, sel_performBlockAndWait_, v12);

        _Block_release(v12);
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (isEscapingClosureAtFileLocation) {
          break;
        }
        ++v6;
        uint64_t v5 = sub_19B089FF8;
        if (v4 == v6)
        {
          swift_bridgeObjectRelease();
          uint64_t v14 = sub_19B089FF8;
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_19B2A9870();
      swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v14 = 0;
LABEL_14:
    sub_19B08A000((uint64_t)v14);
  }
}

void sub_19B0894FC(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_19B089518(uint64_t *a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  *(unsigned char *)(v4 + 24) = a2;
  id v5 = objc_msgSend(*(id *)(v4 + 16), sel_allObjects);
  sub_19B087E40(0, &qword_1E93D59D8);
  uint64_t v6 = sub_19B2A97E0();

  *a3 = v6;
}

void sub_19B08959C(void *a1)
{
  id v1 = objc_msgSend(a1, sel__delegate);
  sub_19B2A9820();
  swift_unknownObjectRelease();
  sub_19B087E40(0, &qword_1E93D59D0);
  if (swift_dynamicCast())
  {
    objc_msgSend(v2, sel_setPhotoKitStatsTracker_, 0);
  }
}

uint64_t sub_19B0896E8()
{
  OUTLINED_FUNCTION_1(OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  OUTLINED_FUNCTION_2();
  sub_19B08973C(v1, v2);
  os_unfair_lock_unlock(v0);
  return v4;
}

uint64_t sub_19B08973C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)a1 + 32);
  return swift_bridgeObjectRetain();
}

void sub_19B089760()
{
  OUTLINED_FUNCTION_1(OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState);
  OUTLINED_FUNCTION_2();
  sub_19B0897B8(v1);

  os_unfair_lock_unlock(v0);
}

uint64_t sub_19B0897B8(uint64_t a1)
{
  *(void *)(*(void *)a1 + 32) = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

void sub_19B089840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = *(os_unfair_lock_s **)&v5[OBJC_IVAR____TtC6Photos27PHDatabaseStatisticsTracker_lockedState];
  uint64_t v8 = (uint64_t *)&v7[4];
  uint64_t v9 = v7 + 6;
  os_unfair_lock_lock(v7 + 6);
  OUTLINED_FUNCTION_2();
  sub_19B0899AC(v10, v11);
  os_unfair_lock_unlock(v9);
  if (v16 == 1)
  {
    sub_19B0899BC(a5, v5);
    id v12 = self;
    id v13 = (void *)sub_19B2A9780();
    uint64_t v14 = (void *)sub_19B2A97D0();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v12, sel_bindSelectString_bindValueStrings_, v13, v14);

    sub_19B2A9790();
    MEMORY[0x1F4188790]();
    os_unfair_lock_lock(v9);
    sub_19B089CB4(v8);
    os_unfair_lock_unlock(v9);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_19B0899AC@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*(void *)result + 24);
  return result;
}

uint64_t sub_19B0899BC(uint64_t a1, void *a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v16 = MEMORY[0x1E4FBC860];
    sub_19B089DD0(0, v2, 0);
    uint64_t v4 = v16;
    id v5 = (void *)(a1 + 32);
    uint64_t v6 = self;
    do
    {
      __swift_project_boxed_opaque_existential_0(v5, v5[3]);
      id v7 = objc_msgSend(v6, sel_stringFromBindVariable_withTypePrefix_, sub_19B2A98B0(), 0);
      uint64_t v8 = sub_19B2A9790();
      uint64_t v10 = v9;
      swift_unknownObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_19B089DD0(0, *(void *)(v16 + 16) + 1, 1);
      }
      unint64_t v12 = *(void *)(v16 + 16);
      unint64_t v11 = *(void *)(v16 + 24);
      if (v12 >= v11 >> 1) {
        sub_19B089DD0((char *)(v11 > 1), v12 + 1, 1);
      }
      *(void *)(v16 + 16) = v12 + 1;
      uint64_t v13 = v16 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
      v5 += 4;
      --v2;
    }
    while (v2);
  }
  else
  {

    return MEMORY[0x1E4FBC860];
  }
  return v4;
}

char *sub_19B089B40(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  swift_bridgeObjectRetain();
  sub_19B089EF0();
  uint64_t v6 = *(char **)(*(void *)(v5 + 32) + 16);
  id result = sub_19B089F3C(v6);
  uint64_t v8 = *(void *)(v5 + 32);
  *(void *)(v8 + 16) = v6 + 1;
  uint64_t v9 = v8 + 16 * (void)v6;
  *(void *)(v9 + 32) = a2;
  *(void *)(v9 + 40) = a3;
  return result;
}

id sub_19B089C70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PHDatabaseStatisticsTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_19B089CB4(uint64_t *a1)
{
  return sub_19B089B40(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

char *sub_19B089CD0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D59C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_19B089DD0(char *a1, int64_t a2, char a3)
{
  id result = sub_19B089DF0(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

char *sub_19B089DF0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E93D59C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_19B089EF0()
{
  uint64_t v1 = *v0;
  id result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *id v0 = v1;
  if (!result)
  {
    id result = sub_19B089CD0(result, *((void *)v1 + 2) + 1, 1, v1);
    *id v0 = result;
  }
  return result;
}

char *sub_19B089F3C(char *result)
{
  unint64_t v2 = *((void *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    id result = sub_19B089CD0((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    char *v1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_19B089FC0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_19B089FF8()
{
  sub_19B08959C(*(void **)(v0 + 16));
}

uint64_t sub_19B08A000(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_19B08A014()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_19B08A054()
{
  sub_19B089198(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

id sub_19B08A060@<X0>(void *a1@<X8>)
{
  return sub_19B088EB4(*(void **)(v1 + 16), a1);
}

uint64_t sub_19B08A07C()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void OUTLINED_FUNCTION_1(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + a1);
  os_unfair_lock_lock(v3 + 6);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + a1);
  os_unfair_lock_lock(v3 + 6);
}

void ph_objc_setAssociatedObject(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  sSharedTable();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setAssociatedObject:v5 onObject:v7 forKey:v6];
}

void sub_19B08DAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B08E410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

__CFString *PHSocialGroupVerifiedTypeDescription(int a1)
{
  if ((a1 + 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E5841C18[a1 + 1];
  }
}

void sub_19B098D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B098EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B09A0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B09A418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_19B09AEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B09B2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PLStringForSearchEntityCategoryType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x11) {
    return @"PHSearchEntityCategoryTypeUndefined";
  }
  else {
    return off_1E5841E10[a1 - 1];
  }
}

__CFString *PLDebugStringForSearchSuggestionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"PHSearchSuggestionTypeUndefined";
  }
  else {
    return off_1E5841EA0[a1 - 1];
  }
}

__CFString *PLDebugStringForSearchEntityType(uint64_t a1)
{
  id result = @"PHSearchEntityTypeUndefined";
  if (a1 <= 1529)
  {
    if (a1 <= 1099)
    {
      switch(a1)
      {
        case 1:
          id result = @"PHSearchEntityTypeAOI";
          break;
        case 2:
          id result = @"PHSearchEntityTypeThoroughfare";
          break;
        case 3:
          id result = @"PHSearchEntityTypeSubLocality";
          break;
        case 4:
          id result = @"PHSearchEntityTypeLargeAOI";
          break;
        case 5:
          id result = @"PHSearchEntityTypeLocality";
          break;
        case 6:
          id result = @"PHSearchEntityTypeSuperLocality";
          break;
        case 7:
          id result = @"PHSearchEntityTypeSubAdministrativeArea";
          break;
        case 8:
          id result = @"PHSearchEntityTypeSubAdministrativeLocality";
          break;
        case 9:
          id result = @"PHSearchEntityTypeSuperAOI";
          break;
        case 10:
          id result = @"PHSearchEntityTypeAdministrativeArea";
          break;
        case 11:
          id result = @"PHSearchEntityTypeAdministrativeAreaCode";
          break;
        case 12:
          id result = @"PHSearchEntityTypeCountry";
          break;
        case 13:
          id result = @"PHSearchEntityTypeCountryCode";
          break;
        case 14:
          id result = @"PHSearchEntityTypeMegaAOI";
          break;
        default:
          switch(a1)
          {
            case 1000:
              id result = @"PHSearchEntityTypeHome";
              break;
            case 1001:
              id result = @"PHSearchEntityTypeWork";
              break;
            case 1002:
              id result = @"PHSearchEntityTypePlaceAnnotation";
              break;
            case 1003:
              id result = @"PHSearchEntityTypePOI";
              break;
            case 1004:
              id result = @"PHSearchEntityTypeROI";
              break;
            default:
              return result;
          }
          break;
      }
      return result;
    }
    if (a1 <= 1299)
    {
      switch(a1)
      {
        case 1200:
          id result = @"PHSearchEntityTypeKeyword";
          break;
        case 1201:
          id result = @"PHSearchEntityTypeTitle";
          break;
        case 1202:
          id result = @"PHSearchEntityTypeDescription";
          break;
        case 1203:
          id result = @"PHSearchEntityTypeOCRText";
          break;
        case 1204:
          id result = @"PHSearchEntityTypeOCRTextFound";
          break;
        default:
          switch(a1)
          {
            case 1100:
              id result = @"PHSearchEntityTypeMonth";
              break;
            case 1101:
              id result = @"PHSearchEntityTypeYear";
              break;
            case 1102:
              id result = @"PHSearchEntityTypeHoliday";
              break;
            case 1103:
              id result = @"PHSearchEntityTypeSeason";
              break;
            default:
              return result;
          }
          break;
      }
      return result;
    }
    if (a1 <= 1399)
    {
      uint64_t v3 = @"PHSearchEntityTypeContributor";
      uint64_t v21 = @"PHSearchEntityTypePet";
      if (a1 != 1330) {
        uint64_t v21 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1320) {
        uint64_t v3 = v21;
      }
      id v6 = @"PHSearchEntityTypePerson";
      uint64_t v22 = @"PHSearchEntityTypeSocialGroup";
      if (a1 != 1310) {
        uint64_t v22 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1300) {
        id v6 = v22;
      }
      BOOL v10 = __OFSUB__(a1, 1319);
      BOOL v8 = a1 == 1319;
      BOOL v9 = a1 - 1319 < 0;
    }
    else
    {
      uint64_t v3 = @"PHSearchEntityTypeScene";
      uint64_t v14 = @"PHSearchEntityTypeParseRichLabelKGID";
      id v15 = @"PHSearchEntityTypePrivateEncryptedComputeKGID";
      if (a1 != 1520) {
        id v15 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1510) {
        uint64_t v14 = v15;
      }
      if (a1 != 1500) {
        uint64_t v3 = v14;
      }
      id v6 = @"PHSearchEntityTypeAlbumTitle";
      uint64_t v16 = @"PHSearchEntityTypeMemoryTitle";
      if (a1 != 1401) {
        uint64_t v16 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1400) {
        id v6 = v16;
      }
      BOOL v10 = __OFSUB__(a1, 1499);
      BOOL v8 = a1 == 1499;
      BOOL v9 = a1 - 1499 < 0;
    }
LABEL_79:
    if (v9 ^ v10 | v8) {
      return v6;
    }
    else {
      return v3;
    }
  }
  if (a1 <= 1899)
  {
    if (a1 <= 1699)
    {
      uint64_t v3 = @"PHSearchEntityTypeMeaning";
      uint64_t v17 = @"PHSearchEntityTypeTrip";
      if (a1 != 1610) {
        uint64_t v17 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1600) {
        uint64_t v3 = v17;
      }
      id v6 = @"PHSearchEntityTypePrivateEncryptedComputeMUID";
      unint64_t v18 = @"PHSearchEntityTypePrivateEncryptedComputeAMP";
      if (a1 != 1540) {
        unint64_t v18 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1530) {
        id v6 = v18;
      }
      BOOL v10 = __OFSUB__(a1, 1599);
      BOOL v8 = a1 == 1599;
      BOOL v9 = a1 - 1599 < 0;
    }
    else
    {
      uint64_t v3 = @"PHSearchEntityTypePublicEventName";
      uint64_t v4 = @"PHSearchEntityTypePublicEventPerformer";
      id v5 = @"PHSearchEntityTypePublicEventCategory";
      if (a1 != 1802) {
        id v5 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1801) {
        uint64_t v4 = v5;
      }
      if (a1 != 1800) {
        uint64_t v3 = v4;
      }
      id v6 = @"PHSearchEntityTypeBusinessName";
      id v7 = @"PHSearchEntityTypeBusinessCategory";
      if (a1 != 1701) {
        id v7 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 1700) {
        id v6 = v7;
      }
      BOOL v10 = __OFSUB__(a1, 1799);
      BOOL v8 = a1 == 1799;
      BOOL v9 = a1 - 1799 < 0;
    }
    goto LABEL_79;
  }
  if (a1 > 1999)
  {
    if (a1 <= 2399)
    {
      uint64_t v3 = @"PHSearchEntityTypeImportedByAppName";
      unint64_t v19 = @"PHSearchEntityTypeCameraMakeAndModel";
      if (a1 != 2300) {
        unint64_t v19 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 2200) {
        uint64_t v3 = v19;
      }
      id v6 = @"PHSearchEntityTypeFavorite";
      uint64_t v20 = @"PHSearchEntityTypeFilename";
      if (a1 != 2100) {
        uint64_t v20 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 2000) {
        id v6 = v20;
      }
      BOOL v10 = __OFSUB__(a1, 2199);
      BOOL v8 = a1 == 2199;
      BOOL v9 = a1 - 2199 < 0;
    }
    else
    {
      uint64_t v3 = @"PHSearchEntityTypeAudioClassification";
      size_t v11 = @"PHSearchEntityTypeHumanAction";
      unint64_t v12 = @"PHSearchEntityTypeDate";
      if (a1 != 2700) {
        unint64_t v12 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 2600) {
        size_t v11 = v12;
      }
      if (a1 != 2500) {
        uint64_t v3 = v11;
      }
      id v6 = @"PHSearchEntityTypeSharedLibrary";
      uint64_t v13 = @"PHSearchEntityTypePersonalLibrary";
      if (a1 != 2401) {
        uint64_t v13 = @"PHSearchEntityTypeUndefined";
      }
      if (a1 != 2400) {
        id v6 = v13;
      }
      BOOL v10 = __OFSUB__(a1, 2499);
      BOOL v8 = a1 == 2499;
      BOOL v9 = a1 - 2499 < 0;
    }
    goto LABEL_79;
  }
  switch(a1)
  {
    case 1900:
      id result = @"PHSearchEntityTypeImage";
      break;
    case 1901:
      id result = @"PHSearchEntityTypeVideo";
      break;
    case 1902:
      id result = @"PHSearchEntityTypeRaw";
      break;
    case 1903:
      id result = @"PHSearchEntityTypeCinematicVideo";
      break;
    case 1904:
      id result = @"PHSearchEntityTypeProRes";
      break;
    case 1905:
      id result = @"PHSearchEntityTypeSlomo";
      break;
    case 1906:
      id result = @"PHSearchEntityTypeLivePhoto";
      break;
    case 1907:
      id result = @"PHSearchEntityTypeScreenshot";
      break;
    case 1908:
      id result = @"PHSearchEntityTypePanorama";
      break;
    case 1909:
      id result = @"PHSearchEntityTypeTimelapse";
      break;
    case 1910:
      id result = @"PHSearchEntityTypeScreenRecording";
      break;
    case 1911:
      id result = @"PHSearchEntityTypeLongExposure";
      break;
    case 1912:
      id result = @"PHSearchEntityTypeAnimated";
      break;
    case 1913:
      id result = @"PHSearchEntityTypeBurst";
      break;
    case 1914:
      id result = @"PHSearchEntityTypePortrait";
      break;
    case 1915:
      id result = @"PHSearchEntityTypeSelfie";
      break;
    case 1916:
      id result = @"PHSearchEntityTypeActionCam";
      break;
    case 1917:
      id result = @"PHSearchEntityTypeLivePortrait";
      break;
    case 1918:
      id result = @"PHSearchEntityTypeSpatial";
      break;
    default:
      return result;
  }
  return result;
}

__CFString *PLDebugStringForSearchQuerySuggestionType(uint64_t a1)
{
  uint64_t v1 = @"PHSearchQuerySuggestionTypeUndefined";
  if (a1 == 1) {
    uint64_t v1 = @"PHSearchQuerySuggestionTypeInitial";
  }
  if (a1 == 2) {
    return @"PHSearchQuerySuggestionTypeRecent";
  }
  else {
    return v1;
  }
}

__CFString *PLDebugStringForAmbiguityType(uint64_t a1)
{
  uint64_t v1 = @"PHSearchAmbiguityTypeNone";
  if (a1 == 1) {
    uint64_t v1 = @"PHSearchAmbiguityTypePartiallyAmbiguous";
  }
  if (a1 == 2) {
    return @"PHSearchAmbiguityTypeFullyAmbiguous";
  }
  else {
    return v1;
  }
}

void sub_19B09EF84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0A07E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1378(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1379(uint64_t a1)
{
}

void sub_19B0A2F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39)
{
  _Unwind_Resume(a1);
}

void sub_19B0A5CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19B0A5FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0A64A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_19B0A6B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19B0A6DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0A8340(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0A9058(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0A90C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0A9138(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0A91A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0A9218(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0A9DF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B0AC2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  objc_sync_exit(v69);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose((const void *)(v70 - 256), 8);
  _Block_object_dispose((const void *)(v70 - 208), 8);
  _Block_object_dispose((const void *)(v70 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2005(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2006(uint64_t a1)
{
}

void sub_19B0ADE18(_Unwind_Exception *a1)
{
}

void __WriteStackshot(void *a1)
{
  id v3 = a1;
  int v1 = MEMORY[0x19F388B10]();
  uint64_t v2 = v3;
  if (v1)
  {
    if (__WriteStackshot_onceToken != -1) {
      dispatch_once(&__WriteStackshot_onceToken, &__block_literal_global_377);
    }
    uint64_t v2 = v3;
    if (__WriteStackshot_PHWriteStackshotReport)
    {
      __WriteStackshot_PHWriteStackshotReport(v3, 3134986837);
      uint64_t v2 = v3;
    }
  }
}

void sub_19B0B2294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__2418(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2419(uint64_t a1)
{
}

id PHAssetExportRequestCopyFileURL(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    char v23 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
    [v22 handleFailureInFunction:v23, @"PHAssetExportRequest.m", 362, @"Invalid parameter not satisfying: %@", @"fileURL" file lineNumber description];

    if (v8)
    {
LABEL_3:
      if (v9) {
        goto LABEL_4;
      }
LABEL_20:
      unint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v27 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
      [v26 handleFailureInFunction:v27, @"PHAssetExportRequest.m", 364, @"Invalid parameter not satisfying: %@", @"filename" file lineNumber description];

      if (a4) {
        goto LABEL_5;
      }
      goto LABEL_21;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
  [v24 handleFailureInFunction:v25, @"PHAssetExportRequest.m", 363, @"Invalid parameter not satisfying: %@", @"outputDirectory" file lineNumber description];

  if (!v9) {
    goto LABEL_20;
  }
LABEL_4:
  if (a4) {
    goto LABEL_5;
  }
LABEL_21:
  unint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
  char v29 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PHAssetExportRequestCopyFileURL(NSURL *__strong, NSURL *__strong, NSString *__strong, NSError *__autoreleasing *)");
  [v28 handleFailureInFunction:v29, @"PHAssetExportRequest.m", 365, @"Invalid parameter not satisfying: %@", @"error" file lineNumber description];

LABEL_5:
  id v31 = 0;
  int v10 = PHAssetExportRequestCreateOutputDirectory(v8, &v31);
  id v11 = v31;
  if (v10)
  {
    unint64_t v12 = [v7 pathExtension];
    uint64_t v13 = [v9 stringByAppendingPathExtension:v12];

    uint64_t v14 = [v8 URLByAppendingPathComponent:v13 isDirectory:0];
    if ([v7 isEqual:v14])
    {
      id v15 = v7;
      id v16 = v11;
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v30 = v11;
      int v18 = [v17 copyItemAtURL:v7 toURL:v14 error:&v30];
      id v16 = v30;

      if (v18)
      {
        id v15 = v14;
      }
      else
      {
        unint64_t v19 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v16;
          _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to copy file: %@", buf, 0xCu);
        }

        id v15 = 0;
      }
    }

    id v11 = v16;
  }
  else
  {
    id v15 = 0;
  }
  id v20 = v11;
  *a4 = v20;

  return v15;
}

uint64_t PHAssetExportRequestCreateOutputDirectory(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    int v10 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PHAssetExportRequestCreateOutputDirectory(NSURL *__strong, NSError *__autoreleasing *)");
    [v9 handleFailureInFunction:v10, @"PHAssetExportRequest.m", 348, @"Invalid parameter not satisfying: %@", @"outputDirectory" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  unint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PHAssetExportRequestCreateOutputDirectory(NSURL *__strong, NSError *__autoreleasing *)");
  [v11 handleFailureInFunction:v12, @"PHAssetExportRequest.m", 349, @"Invalid parameter not satisfying: %@", @"error" file lineNumber description];

LABEL_3:
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  uint64_t v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v6 = v13;

  if ((v5 & 1) == 0)
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to create output directory: %@", buf, 0xCu);
    }

    *a2 = v6;
  }

  return v5;
}

id PHAssetExportRequestFilenameForAsset(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [a2 customFilenameBase];
  uint64_t v5 = [v4 length];
  [v3 fetchPropertySetsIfNeeded];
  if (v5)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 originalMetadataProperties];
      id v8 = [v7 originalFilename];
      int v16 = 138478083;
      uint64_t v17 = (uint64_t)v8;
      __int16 v18 = 2114;
      unint64_t v19 = v4;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset's original filename is '%{private}@', but using custom filename base (supplied in options): %{public}@", (uint8_t *)&v16, 0x16u);
    }
LABEL_4:

    id v9 = v4;
    goto LABEL_6;
  }
  int v10 = [v3 originalMetadataProperties];
  id v11 = [v10 originalFilename];
  id v9 = [v11 stringByDeletingPathExtension];

  if (![v9 length])
  {
    id v13 = [v3 filename];
    uint64_t v4 = [v13 stringByDeletingPathExtension];

    if ([v4 length])
    {
      id v6 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138543362;
        uint64_t v17 = (uint64_t)v4;
        _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Asset's original filename is nil/empty, so using the library filename as name: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v15 = [v14 UUIDString];

      id v6 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Asset's original filename and filename are both nil/empty, so using a new UUID as name: %{public}@", (uint8_t *)&v16, 0xCu);
      }
      uint64_t v4 = (void *)v15;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v9;
}

uint64_t PHAssetExportRequestCanCreateLivePhotoBundleForAssetWithOptions(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v5 playbackStyle];
  if (![v5 isMediaSubtype:8] || v8 == 3)
  {
    if (v8 != 3)
    {
LABEL_7:
      uint64_t v9 = 0;
      goto LABEL_8;
    }
  }
  else if (([v7 shouldExportUnmodifiedOriginalResources] & 1) == 0)
  {
    goto LABEL_7;
  }
  if ([v7 treatLivePhotoAsStill]) {
    goto LABEL_7;
  }
  id v11 = [v6 objectForKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];

  if (v11) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [v5 isIncompleteLivePhotoMissingVideoComplement] ^ 1;
  }
LABEL_8:

  return v9;
}

uint64_t PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_11:
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata * _Nullable __strong, CLLocation * _Nullable __autoreleasing * _Nullable)");
    [v18 handleFailureInFunction:v19, @"PHAssetExportRequest.m", 552, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    uint64_t v12 = 0;
    if (!PHAssetCanPerformAdditionalProcessingOnAsset(0, v8)) {
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  int v16 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata * _Nullable __strong, CLLocation * _Nullable __autoreleasing * _Nullable)");
  [v16 handleFailureInFunction:v17, @"PHAssetExportRequest.m", 551, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

  if (!v7) {
    goto LABEL_11;
  }
LABEL_3:
  if ((PHAssetCanPerformAdditionalProcessingOnAsset(v7, v8) & 1) == 0)
  {
    uint64_t v12 = 0;
    goto LABEL_9;
  }
LABEL_4:
  int v10 = [v7 location];
  if ([v8 locationComparisonStrategy] == 2)
  {
    id v11 = v10;
  }
  else
  {
    PHAssetOriginalLocationForAsset(v7, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = v11;
  int matched = _LocationsMatchUsingComparisonStrategy(v10, v11, [v8 locationComparisonStrategy]);
  uint64_t v12 = PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(@"location", v7, [v8 shouldStripLocation], objc_msgSend(v8, "forceLocationMetadataBaking"), v10, v13, matched, a4);

LABEL_9:
  return v12;
}

uint64_t PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
    [v18 handleFailureInFunction:v19, @"PHAssetExportRequest.m", 577, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    uint64_t v14 = 0;
    if (!PHAssetCanPerformAdditionalProcessingOnAsset(0, v8)) {
      goto LABEL_11;
    }
    goto LABEL_4;
  }
  int v16 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
  [v16 handleFailureInFunction:v17, @"PHAssetExportRequest.m", 576, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  if ((PHAssetCanPerformAdditionalProcessingOnAsset(v7, v8) & 1) == 0)
  {
    uint64_t v14 = 0;
    goto LABEL_11;
  }
LABEL_4:
  int v10 = [v7 descriptionProperties];
  id v11 = [v10 assetDescription];

  uint64_t v12 = PHAssetOriginalCaptionForAsset(v7, v9);
  if (PLObjectIsEqual())
  {
    BOOL v13 = 1;
  }
  else if ([v11 length])
  {
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [v12 length] == 0;
  }
  uint64_t v14 = PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(@"caption", v7, [v8 shouldStripCaption], objc_msgSend(v8, "forceCaptionMetadataBaking"), v11, v12, v13, a4);

LABEL_11:
  return v14;
}

uint64_t PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v18 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
    [v17 handleFailureInFunction:v18, @"PHAssetExportRequest.m", 599, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    uint64_t v13 = 0;
    if (!PHAssetCanPerformAdditionalProcessingOnAsset(0, v8)) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  int v16 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable, NSString * _Nullable __autoreleasing * _Nullable)");
  [v15 handleFailureInFunction:v16, @"PHAssetExportRequest.m", 598, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

  if (!v7) {
    goto LABEL_8;
  }
LABEL_3:
  if ((PHAssetCanPerformAdditionalProcessingOnAsset(v7, v8) & 1) == 0)
  {
    uint64_t v13 = 0;
    goto LABEL_6;
  }
LABEL_4:
  int v10 = [v7 descriptionProperties];
  id v11 = [v10 accessibilityDescription];

  uint64_t v12 = PHAssetOriginalAccessibilityDescriptionForAsset(v7, v9);
  LODWORD(v10) = PLObjectIsEqual();
  uint64_t v13 = PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(@"accessibility description", v7, [v8 shouldStripAccessibilityDescription], objc_msgSend(v8, "forceAccessibilityDescriptionMetadataBaking"), v11, v12, (BOOL)v10, a4);

LABEL_6:
  return v13;
}

id PHAssetExportRequestCustomDateForAssetWithOptions(void *a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (([v5 isCloudSharedAsset] & 1) != 0
    || !PHAssetCanPerformAdditionalProcessingOnAsset(v5, v6))
  {
    id v13 = 0;
    goto LABEL_46;
  }
  [v5 fetchPropertySetsIfNeeded];
  id v7 = [v5 originalMetadataProperties];
  id v8 = [v7 timeZone];

  id v9 = [v5 originalMetadataProperties];
  int v10 = [v9 timeZone];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  uint64_t v14 = v12;

  uint64_t v15 = [v5 creationDate];
  id v46 = 0;
  int v16 = [v5 originalCreationDateWithTimeZone:&v46];
  CGFloat v45 = (__CFString *)v46;
  uint64_t v17 = PLPhotoKitGetLog();
  __int16 v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = [v5 isVideo];
      uint64_t v20 = @"image";
      *(_DWORD *)buf = 138543875;
      if (v19) {
        uint64_t v20 = @"video";
      }
      CGFloat v48 = v20;
      __int16 v49 = 2113;
      id v50 = v16;
      __int16 v51 = 2113;
      uint64_t v52 = v45;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] Parsed original %{public}@ metadata creation date: %{private}@, with timezone: %{private}@", buf, 0x20u);
    }

    BOOL v21 = _CreationDatesInLibraryAndOriginalMetadataAreSame(v15, v16);
    char v22 = v21;
    if (v8)
    {
      if (v21)
      {
        uint64_t v23 = [v14 secondsFromGMTForDate:v15];
        uint64_t v24 = [(__CFString *)v45 secondsFromGMTForDate:v16];
        char v25 = [v14 isEqualToTimeZone:v45];
        if (v23 == v24) {
          char v22 = 1;
        }
        else {
          char v22 = v25;
        }
      }
LABEL_22:
      unint64_t v28 = &stru_1EEAC1950;
      goto LABEL_26;
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = [v5 isVideo];
      unint64_t v27 = @"image";
      if (v26) {
        unint64_t v27 = @"video";
      }
      *(_DWORD *)buf = 138412546;
      CGFloat v48 = v27;
      __int16 v49 = 2114;
      id v50 = v5;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Couldn't extract creation date from %@ asset: %{public}@", buf, 0x16u);
    }

    char v22 = 0;
    if (v8) {
      goto LABEL_22;
    }
  }
  char v29 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [v5 uuid];
    *(_DWORD *)buf = 138543362;
    CGFloat v48 = v30;
    _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Library does not have explicit timezone saved for asset %{public}@, so skipping explicit time zone comparison", buf, 0xCu);
  }
  unint64_t v28 = @"Not available, so using default: ";
LABEL_26:
  id v31 = v14;
  uint64_t v32 = [NSString stringWithFormat:@"%@ (TimeZone: %@%@)", v15, v14, v28];
  int v44 = [NSString stringWithFormat:@"%@ (TimeZone: %@)", v16, v45];
  int v33 = [v6 forceDateTimeMetadataBaking];
  uint64_t v34 = PLPhotoKitGetLog();
  int v35 = v34;
  if (v33)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v36 = [v5 uuid];
      *(_DWORD *)buf = 138478083;
      CGFloat v48 = v32;
      __int16 v49 = 2114;
      id v50 = v36;
      id v37 = "[PHAssetExportRequest] Based on internal debug settings, forcing creation date to be baked in, even though t"
            "he library and original creation date (%{private}@) are the same for asset: %{public}@.";
      char v38 = v35;
      uint32_t v39 = 22;
LABEL_41:
      _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
    }
  }
  else
  {
    if (v22)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        if ([v5 isVideo]) {
          double v40 = @"video";
        }
        else {
          double v40 = @"image";
        }
        uint64_t v41 = [v5 uuid];
        *(_DWORD *)buf = 138543618;
        CGFloat v48 = v40;
        __int16 v49 = 2114;
        id v50 = v41;
        _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] Creation date in library is same as original creation date for %{public}@ asset: %{public}@. No need for a custom date.", buf, 0x16u);
      }
      id v13 = 0;
      goto LABEL_45;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      if ([v5 isVideo]) {
        BOOL v42 = @"video";
      }
      else {
        BOOL v42 = @"image";
      }
      int64_t v36 = [v5 uuid];
      *(_DWORD *)buf = 138478851;
      CGFloat v48 = v32;
      __int16 v49 = 2113;
      id v50 = v44;
      __int16 v51 = 2114;
      uint64_t v52 = v42;
      __int16 v53 = 2114;
      v54 = v36;
      __int16 v55 = 2113;
      v56 = v32;
      id v37 = "[PHAssetExportRequest] Creation date in library (%{private}@) is different from original creation date (%{pr"
            "ivate}@) for %{public}@ asset: %{public}@. Setting custom creation date to: %{private}@";
      char v38 = v35;
      uint32_t v39 = 52;
      goto LABEL_41;
    }
  }

  if (a3) {
    *a3 = v31;
  }
  id v13 = v15;
LABEL_45:

LABEL_46:

  return v13;
}

void PHAssetExportRequestPerformMediaConversion(void *a1, uint64_t a2, char a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v21 = a1;
  id v22 = a5;
  id v64 = a6;
  id v62 = a7;
  id v66 = a9;
  id v65 = a11;
  id v63 = a12;
  id v23 = a13;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  unint64_t v27 = a18;
  if (v21)
  {
    if (v23) {
      goto LABEL_3;
    }
  }
  else
  {
    CGFloat v48 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v49 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    [v48 handleFailureInFunction:v49, @"PHAssetExportRequest.m", 891, @"Invalid parameter not satisfying: %@", @"source" file lineNumber description];

    if (v23)
    {
LABEL_3:
      if (v24) {
        goto LABEL_4;
      }
      goto LABEL_43;
    }
  }
  id v50 = [MEMORY[0x1E4F28B00] currentHandler];
  __int16 v51 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  [v50 handleFailureInFunction:v51, @"PHAssetExportRequest.m", 892, @"Invalid parameter not satisfying: %@", @"progress" file lineNumber description];

  if (v24)
  {
LABEL_4:
    if (v25) {
      goto LABEL_5;
    }
LABEL_44:
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v55 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    [v54 handleFailureInFunction:v55, @"PHAssetExportRequest.m", 894, @"Invalid parameter not satisfying: %@", @"filename" file lineNumber description];

    if (v27) {
      goto LABEL_6;
    }
    goto LABEL_45;
  }
LABEL_43:
  uint64_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
  __int16 v53 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  [v52 handleFailureInFunction:v53, @"PHAssetExportRequest.m", 893, @"Invalid parameter not satisfying: %@", @"outputDirectory" file lineNumber description];

  if (!v25) {
    goto LABEL_44;
  }
LABEL_5:
  if (v27) {
    goto LABEL_6;
  }
LABEL_45:
  v56 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v57 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformMediaConversion(PHMediaFormatConversionSource *__strong, BOOL, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, NSDate * _Nullable __strong, NSTimeZone * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, NSString * _Nullable __strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  [v56 handleFailureInFunction:v57, @"PHAssetExportRequest.m", 895, @"Invalid parameter not satisfying: %@", @"completionHandler" file lineNumber description];

LABEL_6:
  unint64_t v28 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    char v29 = [v21 fileURL];
    [v29 pathExtension];
    v31 = id v30 = v26;
    int v32 = [v21 isVideo];
    int v33 = @"image";
    if (v32) {
      int v33 = @"video";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v74 = v31;
    __int16 v75 = 2114;
    uint64_t v76 = v33;
    _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Requesting conversion of %{public}@ %{public}@ resource", buf, 0x16u);

    id v26 = v30;
  }

  if (a3) {
    [MEMORY[0x1E4F8CC30] legacyCapabilities];
  }
  else {
  uint64_t v34 = [MEMORY[0x1E4F8CC30] capabilitiesForCurrentDevice];
  }
  id v72 = 0;
  int v35 = [MEMORY[0x1E4F748F8] requestForSource:v21 destinationCapabilities:v34 error:&v72];
  id v36 = v72;
  if (!v35)
  {
    v27[2](v27, 0, v36);
    goto LABEL_40;
  }
  if (v26)
  {
    [v35 setLivePhotoPairingIdentifier:v26];
    [v35 setLivePhotoPairingIdentifierBehavior:3];
  }
  if (a4 == 2 && v22)
  {
    id v37 = v35;
    uint64_t v38 = 2;
    id v39 = v22;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_23;
    }
    id v37 = v35;
    uint64_t v38 = 1;
    id v39 = 0;
  }
  [v37 setLocationMetadataBehavior:v38 withLocation:v39];
LABEL_23:
  id v61 = v22;
  if (v64) {
    [v35 setCreationDateMetadataBehavior:2 withCreationDate:v64 inTimeZone:v62];
  }
  if (a8 == 2 && v66)
  {
    double v40 = v35;
    uint64_t v41 = 2;
    id v42 = v66;
LABEL_30:
    [v40 setCaptionMetadataBehavior:v41 withCaption:v42];
    goto LABEL_31;
  }
  if (a8 == 1)
  {
    double v40 = v35;
    uint64_t v41 = 1;
    id v42 = 0;
    goto LABEL_30;
  }
LABEL_31:
  if (a10 == 2 && v65)
  {
    CGRect v43 = v35;
    uint64_t v44 = 2;
    id v45 = v65;
LABEL_36:
    [v43 setAccessibilityDescriptionMetadataBehavior:v44 withAccessibilityDescription:v45];
    goto LABEL_37;
  }
  if (a10 == 1)
  {
    CGRect v43 = v35;
    uint64_t v44 = 1;
    id v45 = 0;
    goto LABEL_36;
  }
LABEL_37:
  if (v63) {
    objc_msgSend(v35, "setVideoExportPreset:");
  }
  id v46 = [v35 progress];
  [v23 addChild:v46 withPendingUnitCount:a14];

  double v47 = PHAssetExportRequestMediaFormatConversionManager();
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __PHAssetExportRequestPerformMediaConversion_block_invoke;
  v67[3] = &unk_1E5848948;
  id v68 = v35;
  id v69 = v24;
  id v70 = v25;
  uint64_t v71 = v27;
  [v47 enqueueConversionRequest:v68 completionHandler:v67];

  id v22 = v61;
LABEL_40:
}

uint64_t PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong)");
    [v12 handleFailureInFunction:v13, @"PHAssetExportRequest.m", 773, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong)");
    [v14 handleFailureInFunction:v15, @"PHAssetExportRequest.m", 774, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

    goto LABEL_3;
  }
  if (!v4) {
    goto LABEL_9;
  }
LABEL_3:
  if ([v5 flattenSlomoVideos] && objc_msgSend(v3, "isHighFrameRateVideo"))
  {
    [v3 fetchPropertySetsIfNeeded];
    id v6 = [v3 adjustmentProperties];
    id v7 = (void *)MEMORY[0x1E4F8CE18];
    id v8 = [v6 formatIdentifier];
    id v9 = [v6 formatVersion];
    uint64_t v10 = [v7 isRecognizedSlowMotionFormatWithIdentifier:v8 version:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void PHAssetExportRequestPerformSlomoFlattening(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, char a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  v96[1] = *MEMORY[0x1E4F143B8];
  id v22 = a1;
  id v23 = a2;
  id v24 = a3;
  id v85 = a5;
  id v86 = a6;
  id v25 = a7;
  id v84 = a8;
  id v81 = a11;
  id v26 = a13;
  id v27 = a15;
  id v28 = a16;
  if (v22)
  {
    if (v23) {
      goto LABEL_3;
    }
  }
  else
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v56 = id v55 = v25;
    [v54 handleFailureInFunction:v56, @"PHAssetExportRequest.m", 788, @"Invalid parameter not satisfying: %@", @"videoURL" file lineNumber description];

    id v25 = v55;
    if (v23) {
      goto LABEL_3;
    }
  }
  uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v59 = id v58 = v25;
  [v57 handleFailureInFunction:v59, @"PHAssetExportRequest.m", 789, @"Invalid parameter not satisfying: %@", @"adjustmentsURL" file lineNumber description];

  id v25 = v58;
LABEL_3:
  char v29 = v85;
  if (!v24)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v62 = id v61 = v25;
    [v60 handleFailureInFunction:v62, @"PHAssetExportRequest.m", 790, @"Invalid parameter not satisfying: %@", @"progress" file lineNumber description];

    id v25 = v61;
  }
  if (a4)
  {
    if (v85) {
      goto LABEL_7;
    }
  }
  else
  {
    id v63 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v65 = id v64 = v25;
    [v63 handleFailureInFunction:v65, @"PHAssetExportRequest.m", 791, @"Invalid parameter not satisfying: %@", @"unitCount" file lineNumber description];

    id v25 = v64;
    if (v85) {
      goto LABEL_7;
    }
  }
  id v66 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  v68 = id v67 = v25;
  [v66 handleFailureInFunction:v68, @"PHAssetExportRequest.m", 792, @"Invalid parameter not satisfying: %@", @"outputDirectory" file lineNumber description];

  id v25 = v67;
LABEL_7:
  if (!v86)
  {
    id v69 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v71 = id v70 = v25;
    [v69 handleFailureInFunction:v71, @"PHAssetExportRequest.m", 793, @"Invalid parameter not satisfying: %@", @"filename" file lineNumber description];

    id v25 = v70;
  }
  uint64_t v80 = (void (**)(void, void, void))v28;
  if (!v28)
  {
    id v72 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformSlomoFlattening(NSURL *__strong, NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, NSString *__strong, NSString *__strong, BOOL, PHAssetExportRequestMetadataOperation, CLLocation * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, PHAssetExportRequestMetadataOperation, NSString * _Nullable __strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    v74 = id v73 = v25;
    [v72 handleFailureInFunction:v74, @"PHAssetExportRequest.m", 794, @"Invalid parameter not satisfying: %@", @"completionHandler" file lineNumber description];

    id v25 = v73;
  }
  id v95 = 0;
  int v30 = PHAssetExportRequestCreateOutputDirectory(v85, &v95);
  id v31 = v95;
  if (v30)
  {
    id v75 = v31;
    id v76 = v26;
    id v79 = v24;
    int v32 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", 0x7FFFFFFFFFFFFFFFLL);
    id v78 = v23;
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F8CE18]) initWithURL:v23];
    id v83 = v22;
    id v34 = v22;
    int v35 = (void *)v33;
    id v36 = [MEMORY[0x1E4F8CD78] remakerOperationWithInputType:3 videoURL:v34 imageURL:0 adjustmentData:v33];
    id v37 = objc_alloc_init(MEMORY[0x1E4F8CD80]);
    [v37 setOutputDirectoryURL:v85];
    [v37 setOutputFilename:v86];
    id v77 = v25;
    if (v25)
    {
      [v37 setExportPreset:v25];
      id v38 = v84;
      id v39 = v81;
    }
    else
    {
      id v39 = v81;
      if (a9) {
        uint64_t v44 = (void *)MEMORY[0x1E4F156E8];
      }
      else {
        uint64_t v44 = (void *)MEMORY[0x1E4F15758];
      }
      [v37 setExportPreset:*v44];
      id v38 = v84;
    }
    [v37 setExportFileType:v38];
    [v37 setShouldStripLocation:a10 == 1];
    if ([v37 shouldStripLocation]) {
      id v45 = 0;
    }
    else {
      id v45 = v39;
    }
    [v37 setCustomLocation:v45];
    [v37 setShouldStripCaption:a12 == 1];
    uint64_t v41 = v76;
    if ([v37 shouldStripCaption]) {
      id v46 = 0;
    }
    else {
      id v46 = v76;
    }
    [v37 setCustomCaption:v46];
    [v37 setShouldStripAccessibilityDescription:a14 == 1];
    if ([v37 shouldStripAccessibilityDescription]) {
      id v47 = v27;
    }
    else {
      id v47 = 0;
    }
    [v37 setCustomAccessibilityLabel:v47];
    CGFloat v48 = (void *)MEMORY[0x1E4F8CD70];
    v96[0] = v36;
    __int16 v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
    id v50 = [v48 remakerWithOperations:v49 options:v37];

    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __PHAssetExportRequestPerformSlomoFlattening_block_invoke;
    v93[3] = &unk_1E5848578;
    id v94 = v50;
    id v51 = v50;
    [v32 setCancellationHandler:v93];
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __PHAssetExportRequestPerformSlomoFlattening_block_invoke_2;
    v91[3] = &unk_1E5842188;
    id v92 = v32;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __PHAssetExportRequestPerformSlomoFlattening_block_invoke_3;
    v87[3] = &unk_1E5844D20;
    double v40 = v80;
    id v89 = v92;
    id v90 = v80;
    id v88 = v36;
    id v52 = v92;
    id v53 = v36;
    [v51 remakeWithProgressHandler:v91 completionHandler:v87];

    id v22 = v83;
    id v23 = v78;
    id v24 = v79;
    CGRect v43 = v39;
    char v29 = v85;
    id v25 = v77;
    id v42 = v75;
  }
  else
  {
    double v40 = v80;
    uint64_t v41 = v26;
    id v42 = v31;
    ((void (**)(void, void, id))v80)[2](v80, 0, v31);
    CGRect v43 = v81;
  }
}

void PHAssetExportRequestPerformGifConversion(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    id v23 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    [v22 handleFailureInFunction:v23, @"PHAssetExportRequest.m", 844, @"Invalid parameter not satisfying: %@", @"videoURL" file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (a3) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  id v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  [v24 handleFailureInFunction:v25, @"PHAssetExportRequest.m", 845, @"Invalid parameter not satisfying: %@", @"progress" file lineNumber description];

  if (a3)
  {
LABEL_4:
    if (v13) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  id v26 = [MEMORY[0x1E4F28B00] currentHandler];
  id v27 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  [v26 handleFailureInFunction:v27, @"PHAssetExportRequest.m", 846, @"Invalid parameter not satisfying: %@", @"unitCount" file lineNumber description];

  if (v13)
  {
LABEL_5:
    if (v14) {
      goto LABEL_6;
    }
LABEL_15:
    int v30 = [MEMORY[0x1E4F28B00] currentHandler];
    id v31 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
    [v30 handleFailureInFunction:v31, @"PHAssetExportRequest.m", 848, @"Invalid parameter not satisfying: %@", @"filename" file lineNumber description];

    if (v15) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_14:
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  char v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  [v28 handleFailureInFunction:v29, @"PHAssetExportRequest.m", 847, @"Invalid parameter not satisfying: %@", @"outputDirectory" file lineNumber description];

  if (!v14) {
    goto LABEL_15;
  }
LABEL_6:
  if (v15) {
    goto LABEL_7;
  }
LABEL_16:
  int v32 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v33 = objc_msgSend(NSString, "stringWithUTF8String:", "void PHAssetExportRequestPerformGifConversion(NSURL *__strong, NSProgress *__strong, int64_t, NSURL *__strong, NSString *__strong, void (^__strong)(NSURL * _Nullable __strong, NSError * _Nullable __strong))");
  [v32 handleFailureInFunction:v33, @"PHAssetExportRequest.m", 849, @"Invalid parameter not satisfying: %@", @"completionHandler" file lineNumber description];

LABEL_7:
  id v36 = 0;
  int v16 = PHAssetExportRequestCreateOutputDirectory(v13, &v36);
  id v17 = v36;
  if (v16)
  {
    __int16 v18 = [v14 stringByAppendingPathExtension:@"GIF"];
    int v19 = [v13 URLByAppendingPathComponent:v18];
    uint64_t v20 = (void *)MEMORY[0x1E4F59AD8];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __PHAssetExportRequestPerformGifConversion_block_invoke;
    v34[3] = &unk_1E5847230;
    id v35 = v15;
    id v21 = [v20 generateGIFForVideoAtURL:v11 destinationURL:v19 completionHandler:v34];
    [v12 addChild:v21 withPendingUnitCount:a3];
  }
  else
  {
    (*((void (**)(id, void, id))v15 + 2))(v15, 0, v17);
  }
}

uint64_t __PHAssetExportRequestPerformGifConversion_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __PHAssetExportRequestPerformSlomoFlattening_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelRemaking];
}

uint64_t __PHAssetExportRequestPerformSlomoFlattening_block_invoke_2(uint64_t result, double a2)
{
  if (a2 < 1.0) {
    return objc_msgSend(*(id *)(result + 32), "setCompletedUnitCount:", vcvtd_n_s64_f64(a2, 0x3FuLL));
  }
  return result;
}

uint64_t __PHAssetExportRequestPerformSlomoFlattening_block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1[6];
  id v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = [v5 videoOutputURL];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v6);

  id v8 = (void *)a1[5];

  return [v8 setCompletedUnitCount:0x7FFFFFFFFFFFFFFFLL];
}

id PHAssetExportRequestError(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x1E4F28A50];
    v9[0] = v3;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHAssetExportRequestErrorDomain" code:a1 userInfo:v5];

  return v6;
}

id PHAssetExportRequestMediaFormatConversionManager()
{
  if (PHAssetExportRequestMediaFormatConversionManager_predicate != -1) {
    dispatch_once(&PHAssetExportRequestMediaFormatConversionManager_predicate, &__block_literal_global_405);
  }
  uint64_t v0 = (void *)PHAssetExportRequestMediaFormatConversionManager__conversionManager;

  return v0;
}

void __PHAssetExportRequestPerformMediaConversion_block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status] == 4)
  {
    uint64_t v2 = [*(id *)(a1 + 32) destination];
    id v3 = [v2 fileURL];

    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    id v11 = 0;
    id v6 = PHAssetExportRequestCopyFileURL(v3, v4, v5, &v11);
    id v7 = v11;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v9 = [*(id *)(a1 + 32) destination];

    [v9 removeTemporaryFiles];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    id v10 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v10);
  }
}

void __PHAssetExportRequestMediaFormatConversionManager_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F748F0]);
  int v1 = (void *)PHAssetExportRequestMediaFormatConversionManager__conversionManager;
  PHAssetExportRequestMediaFormatConversionManager__conversionManager = (uint64_t)v0;
}

uint64_t PHAssetCanPerformAdditionalProcessingOnAsset(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v4 disableMetadataCorrections])
  {
    id v5 = PLPhotoKitGetLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_38:
      uint64_t v10 = 0;
      goto LABEL_39;
    }
    id v6 = [v3 uuid];
    int v25 = 138543362;
    id v26 = v6;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Metadata corrections are disabled for this exporting asset %{public}@, so skipping processing operations like metadata corrections.", (uint8_t *)&v25, 0xCu);
LABEL_37:

    goto LABEL_38;
  }
  id v5 = [v3 uniformTypeIdentifier];
  if ([v3 mediaType] == 1)
  {
    if (PHAssetCanPerformAdditionalProcessingOnAsset_onceToken != -1) {
      dispatch_once(&PHAssetCanPerformAdditionalProcessingOnAsset_onceToken, &__block_literal_global_2451);
    }
    if (([(id)PHAssetCanPerformAdditionalProcessingOnAsset_supportedReadableImageFormats containsObject:v5] & 1) == 0)
    {
      id v6 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      id v7 = [v3 uuid];
      int v25 = 138543618;
      id v26 = v7;
      __int16 v27 = 2114;
      id v28 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is not a supported readable format (%{public}@) for remaking, skipping processing operations like metadata corrections", (uint8_t *)&v25, 0x16u);
      goto LABEL_36;
    }
    id v6 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v5];
    if ([v6 conformsToType:*MEMORY[0x1E4F443D0]])
    {
      id v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v3 uuid];
        int v25 = 138543362;
        id v26 = v8;
        id v9 = "[PHAssetExportRequest] Asset %{public}@ is a GIF, so skipping processing operations like metadata corrections";
LABEL_29:
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v25, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if ([v6 conformsToType:*MEMORY[0x1E4F44460]])
    {
      int v11 = [v4 allowMetadataConversionsForPNG];
      id v7 = PLPhotoKitGetLog();
      BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (!v11)
      {
        if (v12)
        {
          uint64_t v8 = [v3 uuid];
          int v25 = 138543362;
          id v26 = v8;
          id v9 = "[PHAssetExportRequest] Asset %{public}@ is a PNG, so skipping processing operations like metadata corrections";
          goto LABEL_29;
        }
LABEL_36:

        goto LABEL_37;
      }
      if (v12)
      {
        id v13 = [v3 uuid];
        int v25 = 138543362;
        id v26 = v13;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a PNG, allowing metadata corrections", (uint8_t *)&v25, 0xCu);
      }
    }
    id v14 = [v3 originalFilename];
    id v15 = [v14 pathExtension];
    id v7 = [v15 uppercaseString];

    uint64_t v16 = [MEMORY[0x1E4F8CDF8] panasonicRAWImageType];
    if (v16)
    {
      id v17 = (void *)v16;
      __int16 v18 = [MEMORY[0x1E4F8CDF8] panasonicRAWImageType];
      if ([v6 conformsToType:v18])
      {
        int v19 = [v7 isEqualToString:@"RAW"];

        if (v19)
        {
          uint64_t v8 = PLPhotoKitGetLog();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
LABEL_35:

            goto LABEL_36;
          }
          uint64_t v20 = [v3 uuid];
          id v21 = [v3 originalFilename];
          int v25 = 138543618;
          id v26 = v20;
          __int16 v27 = 2114;
          id v28 = v21;
          _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ (Filename: %{public}@) is a Panasonic RAW image, which is unsupported. Skipping metadata corrections.", (uint8_t *)&v25, 0x16u);

LABEL_34:
          goto LABEL_35;
        }
      }
      else
      {
      }
    }
    id v22 = [MEMORY[0x1E4F8CDF8] heicSequenceType];
    int v23 = [v6 conformsToType:v22];

    if (v23)
    {
      uint64_t v8 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      uint64_t v20 = [v3 uuid];
      int v25 = 138543362;
      id v26 = v20;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a HEICS, so skipping processing operations like metadata corrections", (uint8_t *)&v25, 0xCu);
      goto LABEL_34;
    }

LABEL_41:
    uint64_t v10 = 1;
    goto LABEL_39;
  }
  if ([v3 mediaType] != 2) {
    goto LABEL_41;
  }
  if (PHAssetCanPerformAdditionalProcessingOnAsset_onceToken_332 != -1) {
    dispatch_once(&PHAssetCanPerformAdditionalProcessingOnAsset_onceToken_332, &__block_literal_global_335);
  }
  uint64_t v10 = [(id)PHAssetCanPerformAdditionalProcessingOnAsset_supportedWriteableMovieFormats containsObject:v5];
LABEL_39:

  return v10;
}

BOOL _CreationDatesInLibraryAndOriginalMetadataAreSame(void *a1, void *a2)
{
  id v3 = a2;
  [a1 timeIntervalSince1970];
  double v5 = v4;
  [v3 timeIntervalSince1970];
  double v7 = v6;

  double v8 = v5 - v7;
  if (v5 - v7 < 0.0) {
    double v8 = -(v5 - v7);
  }
  return v8 <= 5.0;
}

void __PHAssetCanPerformAdditionalProcessingOnAsset_block_invoke_333()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = [MEMORY[0x1E4F16590] composition];
  id v13 = objc_msgSend(MEMORY[0x1E4F16360], "exportSessionWithAsset:presetName:");
  id v0 = [v13 supportedFileTypes];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = *MEMORY[0x1E4F44448];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v8];
        int v10 = [v9 conformsToType:v6];

        if (v10) {
          [v1 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  uint64_t v11 = [v1 copy];
  BOOL v12 = (void *)PHAssetCanPerformAdditionalProcessingOnAsset_supportedWriteableMovieFormats;
  PHAssetCanPerformAdditionalProcessingOnAsset_supportedWriteableMovieFormats = v11;
}

void __PHAssetCanPerformAdditionalProcessingOnAsset_block_invoke()
{
  CFArrayRef v0 = CGImageSourceCopyTypeIdentifiers();
  id v1 = (void *)PHAssetCanPerformAdditionalProcessingOnAsset_supportedReadableImageFormats;
  PHAssetCanPerformAdditionalProcessingOnAsset_supportedReadableImageFormats = (uint64_t)v0;
}

uint64_t PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(void *a1, void *a2, int a3, int a4, void *a5, void *a6, BOOL a7, void *a8)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  id v16 = a2;
  id v17 = a5;
  id v18 = a6;
  if (!v16)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    id v22 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestMetadataOperation PHAssetExportRequestMetadataOperationComparingLibraryAndOriginalValuesForAsset(NSString *__strong, PHAsset *__strong, BOOL, BOOL, NSObject<NSCopying> *__strong, NSObject<NSCopying> *__strong, BOOL, NSObject<NSCopying> * _Nullable __autoreleasing * _Nullable)");
    [v21 handleFailureInFunction:v22, @"PHAssetExportRequest.m", 617, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    if (v17 && a4)
    {
      int v23 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v16 uuid];
        *(_DWORD *)buf = 138543362;
        id v29 = v24;
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Based on internal debug settings, forcing caption to be baked in, even if the library and original caption are the same for asset: %{public}@.", buf, 0xCu);
      }
      if (!a8) {
        goto LABEL_16;
      }
    }
    else
    {
      if (!v17 || a7) {
        goto LABEL_4;
      }
      if (!a8)
      {
LABEL_16:
        uint64_t v20 = @"Bake in Library Value";
        uint64_t v19 = 2;
        goto LABEL_17;
      }
    }
    *a8 = (id)[v17 copy];
    goto LABEL_16;
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  a7 = v18 == 0;
LABEL_4:
  if (a8) {
    *a8 = 0;
  }
  uint64_t v19 = !a7;
  if (a7) {
    uint64_t v20 = @"Do nothing";
  }
  else {
    uint64_t v20 = @"Strip Metadata";
  }
LABEL_17:
  int v25 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [v16 uuid];
    *(_DWORD *)buf = 138544387;
    id v29 = v15;
    __int16 v30 = 2114;
    id v31 = v26;
    __int16 v32 = 2114;
    uint64_t v33 = v20;
    __int16 v34 = 2113;
    id v35 = v17;
    __int16 v36 = 2113;
    id v37 = v18;
    _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Metadata behavior for \"%{public}@\" for asset ID %{public}@ is to: [%{public}@]. Library value '%{private}@' Original value: '%{private}@'", buf, 0x34u);
  }
  return v19;
}

uint64_t _LocationsMatchUsingComparisonStrategy(void *a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v5 == v6) {
    goto LABEL_7;
  }
  if (!a3)
  {
    [v5 coordinate];
    double v9 = v8;
    double v11 = v10;
    [v6 coordinate];
    double v13 = v12;
    double v15 = v14;
    if ((PHAssetLocationCoordinatesAreEqual(v9, v11, v12, v14) & 1) == 0)
    {
      id v16 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134284289;
        double v19 = v9;
        __int16 v20 = 2049;
        double v21 = v13;
        __int16 v22 = 2049;
        double v23 = v11;
        __int16 v24 = 2049;
        double v25 = v15;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Mismatch in Latitude (library: %{private}.8f, original: %{private}.8f), or Longitude (library: %{private}.8f, original: %{private}.8f).", (uint8_t *)&v18, 0x2Au);
      }

      goto LABEL_11;
    }
LABEL_7:
    uint64_t v7 = 1;
    goto LABEL_12;
  }
  if (a3 == 2) {
    goto LABEL_7;
  }
  if (a3 != 1)
  {
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = [v5 isEqual:v6];
LABEL_12:

  return v7;
}

void sub_19B0B7FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t PHAssetExportRequestProcessingRequiredForAssetWithOptions(void *a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5)
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PHAssetExportRequestProcessingRequiredForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable)");
    [v25 handleFailureInFunction:v26, @"PHAssetExportRequest.m", 394, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
LABEL_26:
    __int16 v27 = [MEMORY[0x1E4F28B00] currentHandler];
    id v28 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PHAssetExportRequestProcessingRequiredForAssetWithOptions(PHAsset *__strong _Nonnull, PHAssetExportRequestOptions *__strong _Nonnull, PFMetadata *__strong _Nullable)");
    [v27 handleFailureInFunction:v28, @"PHAssetExportRequest.m", 395, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_26;
  }
LABEL_3:
  double v8 = (void *)MEMORY[0x1E4F8CDF8];
  double v9 = [v5 uniformTypeIdentifier];
  __int16 v32 = [v8 typeWithIdentifier:v9];

  uint64_t v10 = PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(v5, v6, v7, 0);
  uint64_t v11 = PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(v5, v6, v7, 0);
  uint64_t v12 = PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(v5, v6, v7, 0);
  double v13 = PHAssetExportRequestCustomDateForAssetWithOptions(v5, v6, 0);
  int v14 = PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(v5, v6);
  double v15 = [v6 videoExportPreset];

  int v30 = v14;
  if (([v6 includeAllAssetResources] & 1) != 0
    || ([v6 shouldExportUnmodifiedOriginalResources] & 1) != 0)
  {
    int v16 = 0;
    char v31 = 0;
  }
  else if ([v6 variant] == 2)
  {
    int v16 = 1;
    char v31 = 1;
  }
  else
  {
    if ([v6 variant] == 3) {
      char v24 = 1;
    }
    else {
      char v24 = v14;
    }
    if (v15) {
      char v24 = 1;
    }
    if (v10) {
      char v24 = 1;
    }
    if (v11) {
      char v24 = 1;
    }
    if (v12) {
      char v24 = 1;
    }
    if (v13) {
      char v24 = 1;
    }
    char v31 = v24;
    int v16 = 1;
  }
  id v17 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [v5 uuid];
    id v29 = v7;
    uint64_t v19 = [v6 variant];
    uint64_t v20 = [v6 videoExportPreset];
    uint64_t v21 = v11;
    __int16 v22 = (void *)v20;
    *(_DWORD *)buf = 138545923;
    __int16 v34 = v18;
    __int16 v35 = 1024;
    int v36 = v31 & 1;
    __int16 v37 = 2048;
    uint64_t v38 = v10;
    __int16 v39 = 2048;
    uint64_t v40 = v21;
    __int16 v41 = 2048;
    uint64_t v42 = v12;
    __int16 v43 = 2113;
    uint64_t v44 = v13;
    __int16 v45 = 1024;
    int v46 = v16;
    __int16 v47 = 2048;
    uint64_t v48 = v19;
    id v7 = v29;
    __int16 v49 = 1024;
    int v50 = v30;
    __int16 v51 = 2114;
    uint64_t v52 = v20;
    __int16 v53 = 2114;
    v54 = v32;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Export request processing required for asset %{public}@: %{BOOL}d (metadataOperationLocation=%td, metadataOperationCaption=%td, metadataOperationCaptionAccessibilityDescription=%td, metadataChangeCustomDate=%{private}@, producingNewFilesForExport=%{BOOL}d, options.variant=%td, requiresSloMoFlattening=%{BOOL}d, videoExportPreset=%{public}@, type = %{public}@)", buf, 0x64u);
  }
  return v31 & 1;
}

__CFString *PHAssetExportRequestStateDebugDescription(unint64_t a1)
{
  if (a1 > 6) {
    return @"unknown";
  }
  else {
    return off_1E58422D0[a1];
  }
}

__CFString *PHAssetExportRequestAssetAvailabilityDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"unknown";
  }
  else {
    return off_1E5842298[a1];
  }
}

uint64_t PHAssetExportRequestPassthroughConversionIsSupportedByType(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (PHAssetExportRequestPassthroughConversionIsSupportedByType_predicate != -1) {
    dispatch_once(&PHAssetExportRequestPassthroughConversionIsSupportedByType_predicate, &__block_literal_global_413);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)PHAssetExportRequestPassthroughConversionIsSupportedByType_typesSupportingPassThroughConversion;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v7 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", v1, (void)v9);
        LOBYTE(v6) = [v7 conformsToType:v6];

        if (v6)
        {
          uint64_t v3 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

void __PHAssetExportRequestPassthroughConversionIsSupportedByType_block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F44568];
  v3[0] = *MEMORY[0x1E4F44410];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F44490];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  id v2 = (void *)PHAssetExportRequestPassthroughConversionIsSupportedByType_typesSupportingPassThroughConversion;
  PHAssetExportRequestPassthroughConversionIsSupportedByType_typesSupportingPassThroughConversion = v1;
}

uint64_t PHOptionalVALocationAnalysisVersion(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 vaLocationAnalysisVersion];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t PHMediaAnalysisImageVersionUsingFallback(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    __int16 v2 = [v1 mediaAnalysisImageVersion];
  }
  else if (objc_opt_respondsToSelector())
  {
    unint64_t v3 = [v1 mediaAnalysisVersion];
    __int16 v2 = v3;
    if (v3 >= 0x8000)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"int16_t PHMediaAnalysisImageVersionUsingFallback(__strong id<PHMediaProcessingAlgorithmVersionProvider>)"];
      [v4 handleFailureInFunction:v5, @"PHPhotoLibrary+MediaProcessing.m", 256, @"Invalid parameter not satisfying: %@", @"mediaAnalysisVersion <= INT16_MAX" file lineNumber description];
    }
  }
  else
  {
    __int16 v2 = 0;
  }

  return v2;
}

uint64_t PHOptionalCaptionGenerationVersion(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 captionGenerationVersion];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *PHMediaProcessingDescriptionForTaskID(uint64_t a1)
{
  uint64_t v4 = @"unknown";
  switch(a1)
  {
    case 0:
      goto LABEL_61;
    case 1:
      uint64_t v4 = @"MediaAnalysisVideo";
      break;
    case 2:
      uint64_t v4 = @"SceneAnalysis";
      break;
    case 3:
      uint64_t v4 = @"FaceAnalysis";
      break;
    case 4:
      uint64_t v4 = @"EffectsAnalysis";
      break;
    case 5:
      uint64_t v4 = @"Sceneprint";
      break;
    case 6:
      uint64_t v4 = @"VideoStabilization";
      break;
    case 7:
      uint64_t v4 = @"MultiWorkerAnalysis";
      break;
    case 8:
      uint64_t v4 = @"QuickFaceIdentification";
      break;
    case 9:
      uint64_t v4 = @"EmbeddingAnalysis";
      break;
    case 10:
      uint64_t v4 = @"OCRAnalysis";
      break;
    case 11:
      uint64_t v4 = @"MovieHighlightProcessing";
      break;
    case 12:
      uint64_t v4 = @"VisualSearchAnalysis";
      break;
    case 13:
      uint64_t v4 = @"FilesystemAnalysis";
      break;
    case 14:
      uint64_t v4 = @"FilesystemVideoAnalysis";
      break;
    case 15:
      uint64_t v4 = @"VideoCaptionAnalysis";
      break;
    case 16:
      uint64_t v4 = @"PECAnalysis";
      break;
    case 17:
      uint64_t v4 = @"MediaAnalysisImage";
      break;
    case 18:
      uint64_t v4 = @"PECLocationAnalysis";
      break;
    default:
      if (a1 == 0x7FFFFFFF)
      {
        uint64_t v4 = @"UnifiedAnalysis";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"unknown:%tu", a1);
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_61:
      }
      break;
  }
  return v4;
}

void *PHMediaProcessingAllKnownTaskIDs()
{
  return &unk_1EEB26820;
}

void *PHMediaProcessingAllKnownTaskPriorities()
{
  return &unk_1EEB26838;
}

void sub_19B0BD4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B0BDA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2849(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2850(uint64_t a1)
{
}

uint64_t _loadURLIntoResult(int a1, int a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v11 = a3;
  id v12 = a4;
  double v13 = a6;
  uint64_t v14 = v13;
  if ((a1 & 1) == 0 && (a2 & 1) == 0)
  {
    double v15 = PLImageManagerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      char v31 = "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)";
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "%s called with no options to load, will no op", buf, 0xCu);
    }

    if (PHImageManagerRecordEnabled()) {
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", [v14 requestID], @"%s called with no options to load, will no op", "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)");
    }
    uint64_t v16 = 1;
    goto LABEL_35;
  }
  if (v11)
  {
    if (a1) {
      [v13[18] setImageURL:v11];
    }
    if (a2)
    {
      id v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
      [v14[18] setImageData:v17];
      if (!v17)
      {
        uint64_t v16 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      id v17 = 0;
    }
    if (v12 && a5 != -1)
    {
      id v19 = v14[18];
      uint64_t v20 = [NSNumber numberWithInteger:a5];
      [v19 setExifOrientation:v20];

      [v14[18] setUniformTypeIdentifier:v12];
LABEL_33:
      uint64_t v16 = 1;
      goto LABEL_34;
    }
    uint64_t v21 = [v14 behaviorSpec];
    char v22 = [v21 onlyUseFetchedAssetPropertiesDuringChoosing];

    if (v22) {
      goto LABEL_33;
    }
    if (v17)
    {
      char v23 = PLGetOrientationAndUntransformedSizeFromImageData();
      id v24 = 0;
      if (v23)
      {
LABEL_26:
        id v25 = v14[18];
        uint64_t v26 = [NSNumber numberWithInteger:0];
        [v25 setExifOrientation:v26];

        [v14[18] setUniformTypeIdentifier:v24];
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      int v27 = PLGetOrientationAndUntransformedSizeFromImageURL();
      id v24 = 0;
      if (v27) {
        goto LABEL_26;
      }
    }
    id v28 = PLImageManagerGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      char v31 = v11;
      _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_ERROR, "Reading image metadata failed for resource at URL: %@", buf, 0xCu);
    }

    if (PHImageManagerRecordEnabled()) {
      +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", [v14 requestID], @"Reading image metadata failed for resource at URL: %@", v11);
    }
    goto LABEL_32;
  }
  int v18 = PLImageManagerGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    char v31 = "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)";
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "%s called with nil URL", buf, 0xCu);
  }

  if (PHImageManagerRecordEnabled()) {
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", [v14 requestID], @"%s called with nil URL", "BOOL _loadURLIntoResult(BOOL, BOOL, NSURL *__strong, NSString *__strong, PLOrientation, PHImageRequest *__strong)");
  }
  uint64_t v16 = 0;
LABEL_35:

  return v16;
}

void ___chooserDidPresentResourceIdentity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  long long v9 = (id *)(a1 + 40);
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained handleAvailabilityChangeForResource:*(void *)(a1 + 32) url:v12 info:v11 error:v10];
}

uint64_t ___chooserDidPresentResourceIdentity_block_invoke(uint64_t a1, void *a2)
{
  return [a2 incrementImageCacheMissCount];
}

void ___handleKeyUsageFailureDuringChoosing_block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLImageManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) identifierString];
    uint64_t v6 = (void *)v5;
    id v7 = @"N";
    if (a2) {
      id v7 = @"Y";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEBUG, "[RM]: %@ Result of repair attempt: %@. Retrying request w/o hints...", buf, 0x16u);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v9 = [*(id *)(a1 + 32) requestID];
    uint64_t v10 = [*(id *)(a1 + 32) identifierString];
    id v11 = (void *)v10;
    id v12 = @"N";
    if (a2) {
      id v12 = @"Y";
    }
    +[PHImageManagerRequestTracer traceMessageForRequestID:v9, @"[RM]: %@ Result of repair attempt: %@. Retrying request w/o hints...", v10, v12 message];
  }
  if (([*(id *)(a1 + 32) isSynchronous] & 1) == 0)
  {
    [*(id *)(a1 + 32) configureWithError:0];
    double v8 = [*(id *)(a1 + 32) delegate];
    [v8 mediaRequest:*(void *)(a1 + 32) didRequestRetryWithHintsAllowed:0];
  }
}

uint64_t ___handleKeyUsageFailureDuringChoosing_block_invoke_208(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentNextQualifyingResource];
}

void sub_19B0C0748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3326(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3327(uint64_t a1)
{
}

void sub_19B0C1844(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19B0C5268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3921(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3922(uint64_t a1)
{
}

void sub_19B0C5FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t _AssetAvailabilityForAssetWithOptions(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestAssetAvailability _AssetAvailabilityForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong, PHResourceLocalAvailabilityRequest *__strong, NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,id> * _Nullable __autoreleasing * _Nullable)");
    [v16 handleFailureInFunction:v17, @"PHInternalAssetExportRequest.m", 281, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  __int16 v15 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestAssetAvailability _AssetAvailabilityForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong, PHResourceLocalAvailabilityRequest *__strong, NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,id> * _Nullable __autoreleasing * _Nullable)");
  [v14 handleFailureInFunction:v15, @"PHInternalAssetExportRequest.m", 280, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

  if (!v8) {
    goto LABEL_9;
  }
LABEL_3:
  if (v9) {
    goto LABEL_4;
  }
LABEL_10:
  int v18 = [MEMORY[0x1E4F28B00] currentHandler];
  id v19 = objc_msgSend(NSString, "stringWithUTF8String:", "PHAssetExportRequestAssetAvailability _AssetAvailabilityForAssetWithOptions(PHAsset *__strong, PHAssetExportRequestOptions *__strong, PHResourceLocalAvailabilityRequest *__strong, NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,id> * _Nullable __autoreleasing * _Nullable)");
  [v18 handleFailureInFunction:v19, @"PHInternalAssetExportRequest.m", 282, @"Invalid parameter not satisfying: %@", @"resourceRetrievalRequest" file lineNumber description];

LABEL_4:
  uint64_t v10 = _PHResourceLocalAvailabilityRequestOptionsFromPHAssetExportRequestOptions(v8);
  uint64_t v11 = [v9 resourceAvailabilityForOptions:v10 resourceInfo:a4];
  if (v11 == 2) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = v11 == 1;
  }

  return v12;
}

PHResourceLocalAvailabilityRequestOptions *_PHResourceLocalAvailabilityRequestOptionsFromPHAssetExportRequestOptions(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  -[PHResourceLocalAvailabilityRequestOptions setTreatLivePhotoAsStill:](v2, "setTreatLivePhotoAsStill:", [v1 treatLivePhotoAsStill]);
  -[PHResourceLocalAvailabilityRequestOptions setDontAllowRAW:](v2, "setDontAllowRAW:", [v1 dontAllowRAW]);
  -[PHResourceLocalAvailabilityRequestOptions setIncludeAllAssetResources:](v2, "setIncludeAllAssetResources:", [v1 includeAllAssetResources]);
  -[PHResourceLocalAvailabilityRequestOptions setIncludeOriginalResourcesOnly:](v2, "setIncludeOriginalResourcesOnly:", [v1 shouldExportUnmodifiedOriginalResources]);
  unint64_t v3 = [v1 resultHandlerQueue];

  [(PHResourceLocalAvailabilityRequestOptions *)v2 setResultHandlerQueue:v3];
  [(PHResourceLocalAvailabilityRequestOptions *)v2 setAllowMissingVideoComplement:1];

  return v2;
}

id _ResourceInfoToFileURLs(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = [NSString stringWithUTF8String:"NSDictionary<PHAssetExportRequestFileURLKey,NSURL *> *_ResourceInfoToFileURLs(NSDictionary<PHResourceLocalAvailabilityRequestResourceInfoKey,NSURL *> *__strong)"];
    [v12 handleFailureInFunction:v13, @"PHInternalAssetExportRequest.m", 292, @"Invalid parameter not satisfying: %@", @"resourceInfo" file lineNumber description];
  }
  if (_ResourceInfoToFileURLs_onceToken != -1) {
    dispatch_once(&_ResourceInfoToFileURLs_onceToken, &__block_literal_global_4228);
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [(id)_ResourceInfoToFileURLs_fileURLKeysFromResourceInfoKeys objectForKeyedSubscript:v8];
        if (v9)
        {
          uint64_t v10 = [v3 objectForKeyedSubscript:v8];
          [v2 setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t _PreflightMediaConversion(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v16 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _PreflightMediaConversion(PHMediaFormatConversionSource *__strong, NSString * _Nullable __autoreleasing * _Nonnull, NSError * _Nullable __autoreleasing * _Nullable)");
    [v15 handleFailureInFunction:v16, @"PHInternalAssetExportRequest.m", 48, @"Invalid parameter not satisfying: %@", @"compatibleUTI" file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F8CC30] legacyCapabilities];
  id v17 = 0;
  id v7 = [MEMORY[0x1E4F748F8] requestForSource:v5 destinationCapabilities:v6 error:&v17];
  id v8 = v17;
  if (!v7) {
    goto LABEL_6;
  }
  id v9 = PHAssetExportRequestMediaFormatConversionManager();
  [v9 preflightConversionRequest:v7];

  if ([v7 status] == 5)
  {
    uint64_t v10 = [v7 error];

    id v8 = (id)v10;
LABEL_6:
    *a2 = 0;
    if (a3)
    {
      id v8 = v8;
      uint64_t v11 = 0;
      id v12 = 0;
      *a3 = v8;
    }
    else
    {
      uint64_t v11 = 0;
      id v12 = 0;
    }
    goto LABEL_13;
  }
  if ([v7 backwardsCompatibilityStatus] == 2)
  {
    double v13 = [v7 outputFileType];
  }
  else
  {
    double v13 = 0;
  }
  id v12 = v13;
  *a2 = v12;
  uint64_t v11 = 1;
LABEL_13:

  return v11;
}

void sub_19B0CBE48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

uint64_t PHVideoComplementVisibilityStateIsHidden(char a1)
{
  return a1 & 1;
}

uint64_t PHVideoComplementVisibilityStateIsExplicit(unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t PHVideoComplementVisibilityStateIsEvaluated(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t PHVideoComplementVisibilityStateHasFullEditingSupport(unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t PHVideoComplementVisibilityStateIsPlayable(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F8A950] isVideoComplementVisibilityStatePlayable:a1 hasAdjustments:a2];
}

BOOL PHVideoComplementVisibilityStateSupportsVariationChanges(char a1)
{
  return (a1 & 0xD) != 1;
}

uint64_t PHImportConcurrencyLimit()
{
  if (PHImportConcurrencyLimit_onceToken != -1) {
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4867);
  }
  return PHImportConcurrencyLimit_concurrencyLimit;
}

double __PHImportConcurrencyLimit_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  PHImportConcurrencyLimit_concurrencyLimit = [v0 integerForKey:@"DebugImportConcurrency"];

  if (!PHImportConcurrencyLimit_concurrencyLimit)
  {
    size_t v3 = 8;
    unint64_t v4 = 0;
    if (!sysctlbyname("hw.physicalcpu_max", &v4, &v3, 0, 0))
    {
      unint64_t v2 = v4;
      if (!v4) {
        unint64_t v2 = 2;
      }
      double result = (double)v2 * 0.5 + (double)v2;
      PHImportConcurrencyLimit_concurrencyLimit = (uint64_t)result;
    }
  }
  return result;
}

void PHImportDumpCGImageToURL(CGImage *a1, void *a2)
{
  size_t v3 = (void *)*MEMORY[0x1E4F44410];
  CFURLRef v4 = a2;
  id v5 = [v3 identifier];
  uint64_t v6 = CGImageDestinationCreateWithURL(v4, v5, 1uLL, 0);

  if (v6)
  {
    CGImageDestinationAddImage(v6, a1, 0);
    CGImageDestinationFinalize(v6);
    CFRelease(v6);
  }
}

void PHImportDispatchApply(unint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a1 < 2 || (unint64_t v9 = a2 - 1, a2 <= 1))
  {
    if (a1)
    {
      uint64_t v15 = 0;
      do
      {
        if (v7 && v7[8]) {
          break;
        }
        v8[2](v8, v15++);
      }
      while (a1 != v15);
    }
  }
  else
  {
    uint64_t v10 = dispatch_group_create();
    uint64_t v21 = 0;
    qos_class_t v11 = qos_class_self();
    id v12 = dispatch_get_global_queue(v11, 0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __PHImportDispatchApply_block_invoke;
    aBlock[3] = &unk_1E58427D8;
    uint64_t v19 = &v21;
    unint64_t v20 = a1;
    int v18 = v8;
    double v13 = v7;
    id v17 = v13;
    long long v14 = (void (**)(void))_Block_copy(aBlock);
    do
    {
      if (v13 && v13[8]) {
        break;
      }
      dispatch_group_async(v10, v12, v14);
      --v9;
    }
    while (v9);
    v14[2](v14);
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
}

uint64_t __PHImportDispatchApply_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  do
  {
    unint64_t add_explicit = atomic_fetch_add_explicit(*(atomic_ullong *volatile *)(v1 + 48), 1uLL, memory_order_relaxed);
    if (add_explicit < *(void *)(v1 + 56)) {
      double result = (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
    }
    uint64_t v3 = *(void *)(v1 + 32);
  }
  while ((!v3 || !*(unsigned char *)(v3 + 8)) && add_explicit < *(void *)(v1 + 56));
  return result;
}

__CFString *stringForTrashedMask(uint64_t a1)
{
  double result = 0;
  if (a1 > 255)
  {
    uint64_t v3 = @"AdjustmentBasePairedVideoTrashed";
    CFURLRef v4 = @"DiagnosticFileTrashed";
    id v5 = @"AdjutmentSecondaryDataTrashed";
    if (a1 != 0x10000) {
      id v5 = 0;
    }
    if (a1 != 0x8000) {
      CFURLRef v4 = v5;
    }
    if (a1 != 0x4000) {
      uint64_t v3 = v4;
    }
    uint64_t v6 = @"PairedVideoTrashed";
    id v7 = @"XMPTrashed";
    if (a1 != 0x2000) {
      id v7 = 0;
    }
    if (a1 != 4096) {
      uint64_t v6 = v7;
    }
    if (a1 < 0x4000) {
      uint64_t v3 = v6;
    }
    id v8 = @"AdjustedPairedVideoTrashed";
    unint64_t v9 = @"AlternateImageTrashed";
    if (a1 != 2048) {
      unint64_t v9 = 0;
    }
    if (a1 != 1024) {
      id v8 = v9;
    }
    uint64_t v10 = @"AdjustmentBaseVideoTrashed";
    qos_class_t v11 = @"AudioTrashed";
    if (a1 != 512) {
      qos_class_t v11 = 0;
    }
    if (a1 != 256) {
      uint64_t v10 = v11;
    }
    if (a1 <= 1023) {
      id v8 = v10;
    }
    if (a1 <= 4095) {
      return v8;
    }
    else {
      return v3;
    }
  }
  else if (a1 > 15)
  {
    if (a1 > 63)
    {
      id v12 = @"AdjustmentBasePhotoTrashed";
      if (a1 != 128) {
        id v12 = 0;
      }
      if (a1 == 64) {
        return @"OriginalAdjustmentDataTrashed";
      }
      else {
        return v12;
      }
    }
    else if (a1 == 16 || a1 == 32)
    {
      return &stru_1EEAC1950;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        double result = @"Untrashed";
        break;
      case 1:
        double result = @"OriginalTrashed";
        break;
      case 2:
        double result = @"AdjutmentDataTrashed";
        break;
      case 4:
        double result = @"AdjustedImageTrashed";
        break;
      case 8:
        double result = @"AdjustedVideoTrashed";
        break;
      default:
        return result;
    }
  }
  return result;
}

__CFString *PHDebugStringForSearchResultType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"PHSearchResultTypeUndefined";
  }
  else {
    return off_1E5842868[a1 - 1];
  }
}

__CFString *PHDebugStringForSearchResultRetrievalType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"PHSearchResultRetrievalTypeUndefined";
  }
  else {
    return off_1E5842888[a1 - 1];
  }
}

__CFString *PHHumanReadableStringForSearchResultMatchType(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E58428A0[a1];
  }
}

__CFString *PHHumanReadableStringForSearchResultType(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E58428C0[a1];
  }
}

__CFString *PHHumanReadableStringForSearchResultRetrievalType(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E58428E8[a1];
  }
}

void sub_19B0D1B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__5517(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5518(uint64_t a1)
{
}

void sub_19B0D2630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Unwind_Resume(a1);
}

void sub_19B0D3738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL createObjectChangeRequestsFromXPCObject(void *a1, void *a2, const char *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a4;
  unint64_t v9 = xpc_dictionary_get_value(a2, a3);
  if (v9)
  {
    uint64_t v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      long long v16 = a3;
      __int16 v17 = 2112;
      int v18 = v9;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "##### %s: %@", buf, 0x16u);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __createObjectChangeRequestsFromXPCObject_block_invoke;
    void v12[3] = &unk_1E5848340;
    id v13 = v7;
    id v14 = v8;
    xpc_array_apply(v9, v12);
  }
  return v9 != 0;
}

uint64_t __createObjectChangeRequestsFromXPCObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = +[PHChangeRequestHelper changeRequestWithXPCDict:a3 request:*(void *)(a1 + 32) clientAuthorization:*(void *)(a1 + 40)];
  return 1;
}

void sub_19B0D4434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void addObjectChangeRequests(void *a1, void *a2, const char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if ([v5 count])
  {
    xpc_object_t v7 = xpc_array_create(0, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
          xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v13, "encodeToXPCDict:", v14, (void)v15);
          xpc_array_append_value(v7, v14);

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    xpc_dictionary_set_value(v6, a3, v7);
  }
}

void sub_19B0D847C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6586(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6587(uint64_t a1)
{
}

void sub_19B0D85E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0D8734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0D88C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0D8A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0D8B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0D8CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0D8F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DA480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DA6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DAB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B0DB74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DE958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DEAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DEBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DED48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DEE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DEFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DF138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DF268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DF3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DF56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DF6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DF80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DF95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DFAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DFC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DFDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0DFF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0E0040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0E0134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0E15DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0E16D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0E180C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0E191C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0E49B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7035(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7036(uint64_t a1)
{
}

void sub_19B0E58F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_19B0E5FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19B0E7088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19B0E7DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19B0E9DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

__CFString *PHQuestionOptionsDebugDescription(uint64_t a1)
{
  if (!a1)
  {
    unint64_t v2 = @"<none>";
    goto LABEL_35;
  }
  int v1 = a1;
  if (a1 == 533075965)
  {
    unint64_t v2 = @"<all>";
    goto LABEL_35;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = v4;
  if (v1) {
    [v4 addObject:@"contact-matching"];
  }
  if ((v1 & 2) != 0) {
    [v5 addObject:@"contact-merging"];
  }
  if ([v5 count])
  {
    id v6 = NSString;
    xpc_object_t v7 = [v5 componentsJoinedByString:@", "];
    id v8 = [v6 stringWithFormat:@"person:(%@)", v7];
    [v3 addObject:v8];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = v9;
  if ((v1 & 4) != 0)
  {
    [v9 addObject:@"meaning"];
    if ((v1 & 8) == 0)
    {
LABEL_13:
      if ((v1 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_40;
    }
  }
  else if ((v1 & 8) == 0)
  {
    goto LABEL_13;
  }
  [v10 addObject:@"business-item"];
  if ((v1 & 0x10) == 0)
  {
LABEL_14:
    if ((v1 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v10 addObject:@"relationship"];
  if ((v1 & 0x20) == 0)
  {
LABEL_15:
    if ((v1 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v10 addObject:@"public-event"];
  if ((v1 & 0x40) == 0)
  {
LABEL_16:
    if ((v1 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v10 addObject:@"holiday"];
  if ((v1 & 0x80) == 0)
  {
LABEL_17:
    if ((v1 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v10 addObject:@"frequent-location"];
  if ((v1 & 0x100) == 0)
  {
LABEL_18:
    if ((v1 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v10 addObject:@"wallpaper"];
  if ((v1 & 0x200) == 0)
  {
LABEL_19:
    if ((v1 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v10 addObject:@"age-category"];
  if ((v1 & 0x400) == 0)
  {
LABEL_20:
    if ((v1 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v10 addObject:@"memory-quality"];
  if ((v1 & 0x800) == 0)
  {
LABEL_21:
    if ((v1 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v10 addObject:@"trip-key-asset"];
  if ((v1 & 0x1000) == 0)
  {
LABEL_22:
    if ((v1 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v10 addObject:@"pet"];
  if ((v1 & 0x2000) == 0)
  {
LABEL_23:
    if ((v1 & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v10 addObject:@"featured-photo"];
  if ((v1 & 0x4000) == 0)
  {
LABEL_24:
    if ((v1 & 0x8000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v10 addObject:@"memory-music-quality"];
  if ((v1 & 0x8000) == 0)
  {
LABEL_25:
    if ((v1 & 0x10000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v10 addObject:@"memory-music-energy"];
  if ((v1 & 0x10000) == 0)
  {
LABEL_26:
    if ((v1 & 0x20000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v10 addObject:@"social-groups"];
  if ((v1 & 0x20000) == 0)
  {
LABEL_27:
    if ((v1 & 0x40000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v10 addObject:@"syndicated-assets"];
  if ((v1 & 0x40000) == 0)
  {
LABEL_28:
    if ((v1 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v10 addObject:@"person-activity-meaning"];
  if ((v1 & 0x80000) == 0)
  {
LABEL_29:
    if ((v1 & 0x100000) == 0) {
      goto LABEL_30;
    }
LABEL_56:
    [v10 addObject:@"shared-library-start"];
    if ((v1 & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_55:
  [v10 addObject:@"shared-library-assets"];
  if ((v1 & 0x100000) != 0) {
    goto LABEL_56;
  }
LABEL_30:
  if ((v1 & 0x200000) != 0) {
LABEL_31:
  }
    [v10 addObject:@"camera-library-switch"];
LABEL_32:
  if ([v10 count])
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [v10 componentsJoinedByString:@", "];
    id v13 = [v11 stringWithFormat:@"survey:(%@)", v12];
    [v3 addObject:v13];
  }
  xpc_object_t v14 = NSString;
  long long v15 = [v3 componentsJoinedByString:@", "];
  unint64_t v2 = [v14 stringWithFormat:@"<%@>", v15];

LABEL_35:

  return v2;
}

id PHStringFromPHAdjustmentStyleCastShort(int a1)
{
  if (a1 <= 15)
  {
    if ((a1 - 1) > 0xE) {
      int v1 = @"PHAdjustmentStyleCastNone";
    }
    else {
      int v1 = off_1E5842D08[a1 - 1];
    }
  }
  else
  {
    int v1 = @"Unknown Style Cast";
  }
  unint64_t v2 = -[__CFString substringFromIndex:](v1, "substringFromIndex:", [@"PHAdjustmentStyleCast" length]);
  id v3 = [v2 lowercaseString];

  return v3;
}

__CFString *PHStringFromCloudResourcePrefetchMode(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E5842D80[a1];
  }
}

__CFString *PHStringFromAnalysisCoordinatorFeature(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      double result = @"PHAnalysisCoordinatorFeatureMemoriesCreation";
      break;
    case 2:
      double result = @"PHAnalysisCoordinatorFeatureSearchIndexing";
      break;
    case 3:
      double result = @"PHAnalysisCoordinatorFeatureSearchUI";
      break;
    case 4:
      double result = @"PHAnalysisCoordinatorFeaturePeopleAlbum";
      break;
    case 5:
      double result = @"PHAnalysisCoordinatorFeatureInfoPanel";
      break;
    case 6:
      double result = @"PHAnalysisCoordinatorFeatureGlobalProcessing";
      break;
    default:
      if (a1 == 100) {
        double result = @"PHAnalysisCoordinatorFeatureUnitTest";
      }
      else {
        double result = @"PHAnalysisCoordinatorFeatureNone";
      }
      break;
  }
  return result;
}

CGImage *_createDecodedImageUsingImageIOWithFileUrlOrData(void *a1, void *a2, void *a3, uint64_t a4, int a5, int a6, uint64_t *a7, int *a8, void *a9)
{
  v88[3] = *MEMORY[0x1E4F143B8];
  id v16 = a1;
  CFURLRef v17 = a2;
  CFDataRef v18 = a3;
  CFDataRef v19 = v18;
  if (v18)
  {
    CGImageSourceRef v20 = CGImageSourceCreateWithData(v18, 0);
  }
  else
  {
    if (!v17) {
      goto LABEL_14;
    }
    CGImageSourceRef v20 = CGImageSourceCreateWithURL(v17, 0);
  }
  uint64_t v21 = v20;
  if (v20)
  {
    int v83 = a6;
    uint64_t v82 = a8;
    id v84 = a7;
    char v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v23 = MEMORY[0x1E4F1CC38];
    [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FE28]];
    [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2FE48]];
    if (a4 >= 1)
    {
      if ([v16 shouldCrop])
      {
        [v16 normalizedCropRect];
        if (!CGRectEqualToRect(v89, *MEMORY[0x1E4F1DB28]))
        {
          [v16 normalizedCropRect];
          double Width = CGRectGetWidth(v92);
          [v16 normalizedCropRect];
          double Height = CGRectGetHeight(v93);
          if (Width >= Height) {
            double Height = Width;
          }
          double v31 = (double)a4 / Height;
LABEL_67:
          id v81 = [NSNumber numberWithInteger:(uint64_t)v31];
          [v22 setObject:v81 forKeyedSubscript:*MEMORY[0x1E4F2FF68]];

          if (!a5) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        PrimaryImageIndedouble x = CGImageSourceGetPrimaryImageIndex(v21);
        ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v21, PrimaryImageIndex, (CFDictionaryRef)*MEMORY[0x1E4F1D260]);
        if (ImageAtIndex)
        {
          uint64_t v26 = ImageAtIndex;
          size_t v27 = CGImageGetWidth(ImageAtIndex);
          size_t v28 = CGImageGetHeight(v26);
          CGImageRelease(v26);
          [v16 targetSize];
          DCIM_sizeScaleToFillSize();
          if (v27 <= v28) {
            unint64_t v30 = v28;
          }
          else {
            unint64_t v30 = v27;
          }
          double v31 = v29 * (double)v30;
          goto LABEL_67;
        }
        uint64_t v33 = PLImageManagerGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_ERROR, "[RM]: PHImageIODecoder - unable to get image from CGImageSourceCreateImageAtIndex to determine source image dimensions", buf, 2u);
        }
      }
      else
      {
        uint64_t v33 = [NSNumber numberWithInteger:a4];
        [v22 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F2FF68]];
      }
    }
    if (!a5)
    {
LABEL_21:
      int v34 = [v16 decodeAsHDR];
      uint64_t v35 = *MEMORY[0x1E4F2FE58];
      if (v34)
      {
        [v22 setObject:*MEMORY[0x1E4F2FE68] forKeyedSubscript:v35];
        v87[0] = *MEMORY[0x1E4F2FFB0];
        int v36 = NSNumber;
        [v16 targetHDRHeadroom];
        __int16 v37 = objc_msgSend(v36, "numberWithFloat:");
        v88[0] = v37;
        v87[1] = *MEMORY[0x1E4F2F348];
        uint64_t v38 = NSNumber;
        [v16 hdrGain];
        __int16 v39 = objc_msgSend(v38, "numberWithFloat:");
        v87[2] = *MEMORY[0x1E4F2F360];
        v88[1] = v39;
        v88[2] = v23;
        uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:3];
        [v22 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F2FE60]];
      }
      else
      {
        [v22 setObject:*MEMORY[0x1E4F2FE70] forKeyedSubscript:v35];
      }
      __int16 v41 = v84;
      size_t v42 = CGImageSourceGetPrimaryImageIndex(v21);
      ThumbnailAtIndedouble x = CGImageSourceCreateThumbnailAtIndex(v21, v42, (CFDictionaryRef)v22);
      if ([v16 shouldCrop])
      {
        size_t v43 = CGImageGetWidth(ThumbnailAtIndex);
        size_t v44 = CGImageGetHeight(ThumbnailAtIndex);
        [v16 targetSize];
        double v46 = v45;
        double v48 = v47;
        [v16 normalizedCropRect];
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        CGFloat v54 = v53;
        CGFloat v56 = v55;
        uint64_t v57 = [v16 contentMode];
        v90.origin.double x = v50;
        v90.origin.double y = v52;
        v90.size.double width = v54;
        v90.size.double height = v56;
        BOOL v58 = CGRectEqualToRect(v90, *MEMORY[0x1E4F1DB28]);
        double v59 = 0.0;
        if (v58) {
          double v60 = 1.0;
        }
        else {
          double v60 = v56;
        }
        if (v58) {
          double v61 = 1.0;
        }
        else {
          double v61 = v54;
        }
        if (v58) {
          double v62 = 0.0;
        }
        else {
          double v62 = v52;
        }
        if (v58) {
          double v63 = 0.0;
        }
        else {
          double v63 = v50;
        }
        double v64 = v63 * (double)v43;
        double v65 = v62 * (double)v44;
        double v66 = v61 * (double)v43;
        double v67 = v60 * (double)v44;
        if (v57 == 1)
        {
          if (v66 - v46 >= 0.0) {
            double v68 = (v66 - v46) * 0.5;
          }
          else {
            double v68 = 0.0;
          }
          if (v67 - v48 >= 0.0) {
            double v59 = (v67 - v48) * 0.5;
          }
          *(CGRect *)&double v64 = CGRectInset(*(CGRect *)&v64, v68, v59);
        }
        CGRect v91 = CGRectIntegral(*(CGRect *)&v64);
        CGImageRef v69 = CGImageCreateWithImageInRect(ThumbnailAtIndex, v91);
        CGImageRelease(ThumbnailAtIndex);
        ThumbnailAtIndedouble x = v69;
      }
      else if (CGImageGetImageProvider())
      {
        uint64_t v70 = CGImageProviderCopyIOSurface();
        if (v70)
        {
          uint64_t v71 = (const void *)v70;
          uint64_t v72 = CGImageCreateFromIOSurface();
          if (v72)
          {
            id v73 = (CGImage *)v72;
            CGImageRelease(ThumbnailAtIndex);
            ThumbnailAtIndedouble x = v73;
          }
          __int16 v41 = v84;
          CFRelease(v71);
        }
      }
      if (v41 && v83 && ThumbnailAtIndex)
      {
        uint64_t v74 = PLImageManagerGetLog();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v74, OS_LOG_TYPE_DEBUG, "[RM]: PHImageIODecoder - starting aux image decode", buf, 2u);
        }

        uint64_t GainMapFromImageSource = _createGainMapFromImageSource(v21, v82, a9);
        if (!GainMapFromImageSource)
        {
          id v76 = PLImageManagerGetLog();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            id v77 = @"data";
            if (!v19) {
              id v77 = (__CFString *)v17;
            }
            *(_DWORD *)buf = 138412290;
            id v86 = v77;
            _os_log_impl(&dword_19B043000, v76, OS_LOG_TYPE_ERROR, "[RM]: PHImageIODecoder - Failed to load aux image from %@", buf, 0xCu);
          }
        }
        *__int16 v41 = GainMapFromImageSource;
      }
      CFRelease(v21);
      goto LABEL_63;
    }
LABEL_20:
    [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FF30]];
    goto LABEL_21;
  }
LABEL_14:
  char v22 = PLImageManagerGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "[RM]: PHImageIODecoder - Unable to create image source", buf, 2u);
  }
  ThumbnailAtIndedouble x = 0;
LABEL_63:

  return ThumbnailAtIndex;
}

uint64_t _createGainMapFromImageSource(CGImageSource *a1, int *a2, void *a3)
{
  PrimaryImageIndedouble x = CGImageSourceGetPrimaryImageIndex(a1);
  CFDictionaryRef v7 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a1, PrimaryImageIndex, (CFStringRef)*MEMORY[0x1E4F2F3C0]);
  if (!v7) {
    return 0;
  }
  CFDictionaryRef v8 = v7;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithImageSource:a1 contentType:0 options:13 timeZoneLookup:0 cacheImageSource:0];
  uint64_t v10 = v9;
  if (!v9)
  {
    xpc_object_t v14 = PLImageManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Unable to check for gain map's average pixel luminance", v16, 2u);
    }

    uint64_t v11 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [v9 hdrGainMapPercentageValue];
  if (![v10 orientation])
  {
LABEL_9:
    int v12 = 1;
    goto LABEL_10;
  }
  int v12 = [v10 orientation];
LABEL_10:
  uint64_t v13 = [MEMORY[0x1E4F8CC38] createPixelBufferFromAuxiliaryImageInfo:v8];
  CFRelease(v8);
  if (a2) {
    *a2 = v12;
  }
  if (a3) {
    *a3 = v11;
  }

  return v13;
}

id PHCollectionPresentationHintsStringsFromSocialRelationships(char a1)
{
  unint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  if (a1)
  {
    id v3 = [@"PHCollectionPresentationHintsSocialRelationshipsFamily" stringByReplacingOccurrencesOfString:@"PHCollectionPresentationHintsSocialRelationships" withString:&stru_1EEAC1950];
    [v2 addObject:v3];
  }
  if ((a1 & 2) != 0)
  {
    id v4 = [@"PHCollectionPresentationHintsSocialRelationshipsFriends" stringByReplacingOccurrencesOfString:@"PHCollectionPresentationHintsSocialRelationships" withString:&stru_1EEAC1950];
    [v2 addObject:v4];
  }

  return v2;
}

id PHCollectionPresentationHintsStringFromTripType(uint64_t a1)
{
  int v1 = @"PHCollectionPresentationHintsTripTypeUnknown";
  if (a1 == 1) {
    int v1 = @"PHCollectionPresentationHintsTripTypeTrip";
  }
  if (a1 == 2) {
    unint64_t v2 = @"PHCollectionPresentationHintsTripTypeRecurringTrip";
  }
  else {
    unint64_t v2 = v1;
  }
  id v3 = [(__CFString *)v2 stringByReplacingOccurrencesOfString:@"PHCollectionPresentationHintsTripType" withString:&stru_1EEAC1950];

  return v3;
}

id PHCollectionPresentationHintsStringFromQualityCategory(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    int v1 = @"PHCollectionPresentationHintsQualityCategoryNone";
  }
  else {
    int v1 = off_1E5842DD8[a1 - 1];
  }
  unint64_t v2 = [(__CFString *)v1 stringByReplacingOccurrencesOfString:@"PHCollectionPresentationHintsQualityCategory" withString:&stru_1EEAC1950];

  return v2;
}

void sub_19B0EF39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8502(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8503(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__8690(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8691(uint64_t a1)
{
}

void sub_19B0F1734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19B0F5600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

id PLObjectIDOrUUIDFromPHObject(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 objectID];

  if (v2) {
    [v1 objectID];
  }
  else {
  id v3 = [v1 uuid];
  }

  return v3;
}

void sub_19B0F8BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9215(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9216(uint64_t a1)
{
}

void sub_19B0FA300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19B0FB6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B0FBAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __cpl_dispatch_async_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x19F389B10]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_19B101A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9936(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9937(uint64_t a1)
{
}

void sub_19B102360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1028E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19B103D80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 224));
  _Unwind_Resume(a1);
}

void sub_19B104CA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 184));
  _Unwind_Resume(a1);
}

void sub_19B105D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B106D38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_19B107654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19B10A478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10661(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10662(uint64_t a1)
{
}

void sub_19B10A75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B10AA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PHShortDescriptionForPhotosHighlightKind(unsigned int a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5843478[a1];
  }
}

__CFString *PHShortDescriptionForPhotosHighlightType(unsigned int a1)
{
  if (a1 > 7) {
    return @"Unknown";
  }
  else {
    return off_1E5843498[a1];
  }
}

uint64_t PHDescriptionForPhotosHighlightCategory()
{
  return MEMORY[0x1F413F4E8]();
}

__CFString *PHShortDescriptionForPhotosHighlightCategory(int a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 1) {
    uint64_t v1 = @"Recent";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Default";
  }
}

__CFString *PHShortDescriptionForPhotosHighlightEnrichmentState(unsigned int a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E58434D8[a1];
  }
}

__CFString *PHShortDescriptionForPhotosHighlightVisibilityState(__int16 a1)
{
  if ((unsigned __int16)(a1 - 1) > 3u) {
    return @"Not Visibile";
  }
  else {
    return off_1E5843500[(unsigned __int16)(a1 - 1)];
  }
}

__CFString *PHDescriptionForSharingComposition(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5843520[a1];
  }
}

__CFString *PHDescriptionForSharingFilter(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5843538[a1];
  }
}

uint64_t PHPhotosHighlightVisibilityStateIsVisibleInMonth()
{
  return MEMORY[0x1F413F6C0]();
}

void sub_19B10C62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10856(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10857(uint64_t a1)
{
}

void sub_19B10CC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B10D7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11023(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11024(uint64_t a1)
{
}

void sub_19B10D9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B10DE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHErrorIsXPCConnectionInvalidOrInterrupted(void *a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F59778];
  v7[0] = *MEMORY[0x1E4F281F8];
  v7[1] = v1;
  v8[0] = &unk_1EEB268F8;
  v8[1] = &unk_1EEB26910;
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  id v4 = [v2 dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v5 = MEMORY[0x19F388A80](v3, v4);

  return v5;
}

uint64_t PHErrorIsGenerateAdjustmentFileNotFound()
{
  return PLErrorOrUnderlyingErrorHasDomainAndCode();
}

id PHPublicImageManagerErrorFromError(void *a1)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (PHErrorIsMediaServerDisconnected())
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F28A50];
    v8[0] = *MEMORY[0x1E4F28228];
    v8[1] = v4;
    v9[0] = @"Media server disconnected";
    v9[1] = v1;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    uint64_t v2 = [v3 errorWithDomain:@"PHPhotosErrorDomain" code:3301 userInfo:v5];
  }
  id v6 = PHPublicErrorFromError(v2);

  return v6;
}

id PHDescriptionsForResourceTypes(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        CFDictionaryRef v8 = _PHAssetResourceTypeDescription(objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "integerValue", (void)v10));
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

__CFString *_PHAssetResourceTypeDescription(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  double result = @"photo";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      double result = @"video";
      break;
    case 2:
      double result = @"audio";
      break;
    case 3:
      double result = @"photo_alt";
      break;
    case 4:
      double result = @"photo_full";
      break;
    case 5:
      double result = @"video_full";
      break;
    case 6:
      double result = @"adjustment";
      break;
    case 7:
      double result = @"photo_base";
      break;
    case 8:
      double result = @"video_cmpl";
      break;
    case 9:
      double result = @"video_cmpl_full";
      break;
    case 10:
      double result = @"video_cmpl_base";
      break;
    case 11:
      double result = @"video_base";
      break;
    case 12:
      double result = @"photo_over";
      break;
    case 13:
      double result = @"video_over";
      break;
    case 14:
      double result = @"video_cmpl_over";
      break;
    case 15:
      double result = @"original_adjustment";
      break;
    case 16:
      double result = @"xmp";
      break;
    case 17:
      double result = @"slm";
      break;
    case 18:
      double result = @"photo_proxy";
      break;
    case 19:
      double result = @"photo_alchemist";
      break;
    default:
      switch((unint64_t)@"photo")
      {
        case 'e':
          double result = @"tablethumb";
          break;
        case 'f':
          double result = @"masterthumb";
          break;
        case 'g':
          double result = @"derivative";
          break;
        case 'h':
          double result = @"mediametadata_orig";
          break;
        case 'i':
          double result = @"mediametadata_curr";
          break;
        case 'j':
          double result = @"video_metadata";
          break;
        case 'k':
          double result = @"deferred_preview_img";
          break;
        case 'l':
          double result = @"adjustment_blob";
          break;
        case 'm':
          double result = @"wallpaper_comp";
          break;
        case 'n':
          double result = @"adjustment_2nd";
          break;
        case 'p':
          double result = @"compute_sync";
          break;
        case 'r':
          double result = @"generative_playground_face_resources";
          break;
        default:
          double result = @"unknown";
          break;
      }
      break;
  }
  return result;
}

__CFString *PHAssetResourceAnalysisTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"small";
  }
  else {
    return off_1E5843638[a1 - 1];
  }
}

id PHUniformTypesForResourceType(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 1:
    case 4:
    case 5:
    case 8:
    case 13:
    case 19:
    case 20:
      uint64_t v1 = [MEMORY[0x1E4F8CDF8] supportedImageTypes];
      break;
    case 2:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
      uint64_t v1 = [MEMORY[0x1E4F8CDF8] supportedMovieTypes];
      break;
    case 3:
      uint64_t v1 = [MEMORY[0x1E4F8CDF8] supportedAudioTypes];
      break;
    case 7:
    case 16:
    case 17:
    case 18:
      goto LABEL_6;
    default:
      uint64_t v1 = 0;
      unint64_t v3 = a1 - 108;
      if (v3 <= 6 && ((1 << v3) & 0x57) != 0)
      {
LABEL_6:
        v5[0] = *MEMORY[0x1E4F44378];
        uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
      }
      break;
  }

  return v1;
}

uint64_t PHUniformTypeConformsToResourceType(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = PHUniformTypesForResourceType(a2);
  uint64_t v5 = [MEMORY[0x1E4F8CDF8] type:v3 conformsToOneOfTypes:v4];

  return v5;
}

uint64_t PHIsImageAssetResourceType(unint64_t a1)
{
  uint64_t result = 1;
  if (a1 <= 0x14)
  {
    if (((1 << a1) & 0x1DECC) != 0) {
      return 0;
    }
    if (((1 << a1) & 0x182132) != 0) {
      return result;
    }
  }
  unint64_t v3 = a1 - 107;
  if (v3 > 7 || ((1 << v3) & 0xAE) != 0 || v3) {
    return 0;
  }
  return result;
}

BOOL PHIsVideoAssetResourceType(unint64_t a1)
{
  return a1 <= 0x14 && ((1 << a1) & 0x1921BA) == 0 && ((1 << a1) & 0xDE44) != 0;
}

BOOL PHAssetResourceTypeClientCanAppendToOrDeleteFromAsset(uint64_t a1)
{
  return a1 == 20 || a1 == 114 || a1 == 109;
}

uint64_t ResourceRecipeIDForDeletableAssetResourceType(uint64_t a1)
{
  if (a1 == 109) {
    int v1 = 327687;
  }
  else {
    int v1 = 0;
  }
  if (a1 == 114) {
    unsigned int v2 = 327693;
  }
  else {
    unsigned int v2 = v1;
  }
  if (a1 == 20) {
    return 66137;
  }
  else {
    return v2;
  }
}

id PathForDeletableAssetResourceType(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  switch(a2)
  {
    case 20:
      uint64_t v5 = [v3 pathForAlchemistImage];
      goto LABEL_7;
    case 114:
      uint64_t v5 = [v3 pathForGenerativePlaygroundFaceResourcesFile];
      goto LABEL_7;
    case 109:
      uint64_t v5 = [v3 pathForWallpaperComputeResourcesFile];
LABEL_7:
      uint64_t v6 = (void *)v5;
      goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

void sub_19B1131C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11839(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11840(uint64_t a1)
{
}

void sub_19B113950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12080(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12081(uint64_t a1)
{
}

void sub_19B113DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B114038(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19B115050(_Unwind_Exception *a1)
{
}

id _FetchableResourcesForAsset(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = +[PHAssetResource assetResourcesForAsset:v3 includeDerivatives:a2];
  if ([v3 isVideo])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "type", (void)v13) != 106) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

void sub_19B11551C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t AssetResourceIsReallyLocallyAvailable(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 isLocallyAvailable])
  {
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  uint64_t v2 = [v1 privateFileURL];
  char v3 = [v2 checkResourceIsReachableAndReturnError:0];

  if ((v3 & 1) == 0)
  {
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v1;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Asset resource %@ claims to be locally available, but it's fileURL is not on disk. Treating as NOT available.", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_7;
  }
  uint64_t v4 = 1;
LABEL_8:

  return v4;
}

void sub_19B115DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 216), 8);
  _Unwind_Resume(a1);
}

uint64_t _AssetVersionFromRequestOptions(void *a1)
{
  id v1 = a1;
  if ([v1 includeAllAssetResources])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 includeOriginalResourcesOnly])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_19B11639C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(v27);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v28 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_19B1167D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19B117204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, id *a14)
{
  objc_destroyWeak(location);
  objc_destroyWeak(v14);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)&STACK[0x218]);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose((const void *)(v15 - 224), 8);
  _Block_object_dispose((const void *)(v15 - 192), 8);
  _Unwind_Resume(a1);
}

id _PHResourceLocalAvailabilityRequestError(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = v7;
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHResourceLocalAvailabilityRequestErrorDomain" code:a1 userInfo:v8];

  return v9;
}

__CFString *_PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown resource availability type: %ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5843B78[a1];
  }

  return v1;
}

void sub_19B11814C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_19B11867C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1192B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1199D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B11BA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_PHResourceLocalAvailabilityRequestResourceTypeDescription(unint64_t a1)
{
  if (a1 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown resource type %ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5843BB0[a1];
  }

  return v1;
}

void sub_19B11C520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PHFullScreenSizeForScreen(void *a1, void *a2)
{
  id v3 = a1;
  DCIM_boundsFromScreen();
  DCIM_scaleFromScreen();

  if (a2) {
    *a2 = 0;
  }
}

void sub_19B120838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12540(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12541(uint64_t a1)
{
}

void sub_19B1211F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B12151C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B121864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PHMemoryPendingStateDescription(unsigned int a1)
{
  if (a1 > 3) {
    return &stru_1EEAC1950;
  }
  else {
    return off_1E5843D78[a1];
  }
}

__CFString *PHMemoryCreationTypeDescription(int a1)
{
  id v1 = @"?";
  if (a1 == 1) {
    id v1 = @"Generative";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Default";
  }
}

BOOL PHMemoryCategoryIsDisabled(unint64_t a1)
{
  if (a1 > 0x64) {
    return 1;
  }
  BOOL result = 1;
  if (a1 > 0x20 || ((1 << a1) & 0x100008824) == 0) {
    return a1 == 100;
  }
  return result;
}

uint64_t PHMemoryFeaturedStateFromPLMemoryFeaturedState(uint64_t result)
{
  if (result >= 3) {
    return -1;
  }
  else {
    return result;
  }
}

uint64_t PLMemoryFeaturedStateFromPHMemoryFeaturedState(unint64_t a1)
{
  if (a1 >= 3) {
    return -1;
  }
  else {
    return (__int16)a1;
  }
}

void sub_19B125AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13014(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13015(uint64_t a1)
{
}

void sub_19B125F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B12637C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHMomentAggregationScoreFromAggregationScoreType()
{
  return MEMORY[0x1F413F648]();
}

uint64_t PHMomentDescriptionForProcessedLocationType()
{
  return MEMORY[0x1F413F650]();
}

void sub_19B12F2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sShortObjectID_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pl_shortURI");
}

void sub_19B130BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__13879(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13880(uint64_t a1)
{
}

void sub_19B131B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_19B131DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B13316C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19B133394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1336B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _addOIDsWithEntityNames(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v12 entity];
        long long v14 = [v13 name];
        int v15 = [v7 containsObject:v14];

        if (v15) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void sub_19B135FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_19B136500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B1365C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void copyPropertiesFromObjectAToObjectB(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int outCount = 0;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = class_copyPropertyList(v5, &outCount);
  unsigned int v14 = 0;
  id v7 = (objc_class *)objc_opt_class();
  class_copyPropertyList(v7, &v14);
  if (outCount != v14) {
    __assert_rtn("copyPropertiesFromObjectAToObjectB", "PHAssetCreationRequest.m", 223, "matched");
  }
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = property_getName(v6[i]);
      if (Name)
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", Name, objc_msgSend(NSString, "defaultCStringEncoding"));
        uint64_t v11 = [v3 valueForKey:v10];
        uint64_t v12 = [v11 BOOLValue];

        long long v13 = [NSNumber numberWithBool:v12];
        [v4 setValue:v13 forKeyPath:v10];
      }
    }
  }
  free(v6);
}

void sub_19B13CE60(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __CFString *a16, int buf, long long a18)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(a1);
    long long v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      buf = 138543618;
      WORD2(a1_Block_object_dispose(&STACK[0x290], 8) = 2112;
      *(void *)((char *)&a18 + 6) = v18;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Failed to validate UUID '%{public}@' is well formed, exception %@", (uint8_t *)&buf, 0x16u);
    }

    CGImageSourceRef v20 = (void *)MEMORY[0x1E4F28C58];
    a15 = *MEMORY[0x1E4F28228];
    a16 = @"Malformed UUID";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a16 forKeys:&a15 count:1];
    [v20 errorWithDomain:@"PHPhotosErrorDomain" code:3140 userInfo:v21];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x19B13CB88);
  }
  _Unwind_Resume(a1);
}

void sub_19B13DF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 224), 8);
  _Block_object_dispose((const void *)(v47 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14582(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14583(uint64_t a1)
{
}

void sub_19B142E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19B1466D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B146DF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_19B147634(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19B14829C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19B14937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_19B14B0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19B14C0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id PHImageDataFromImageAsScreenshot(void *a1, int a2)
{
  id v3 = a1;
  id v4 = (CGImage *)DCIM_CGImageRefFromPLImage();
  if (a2 && v4)
  {
    id v5 = CGImageGetUTType(v4);
    if (!v5
      || ([MEMORY[0x1E4F442D8] typeWithIdentifier:v5],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 conformsToType:*MEMORY[0x1E4F44460]],
          v6,
          (v7 & 1) == 0))
    {
      uint64_t v8 = (void *)DCIM_newPNGRepresentationWithPLImage();
      uint64_t v9 = (void *)DCIM_newPLImageWithData();
      if (v9) {
        DCIM_CGImageRefFromPLImage();
      }
    }
  }
  MEMORY[0x19F388500](v3);
  PLExifOrientationFromImageOrientation();
  uint64_t v10 = imageDataFromImageRef();

  return v10;
}

uint64_t _PrimaryPLResourceTypeForPrimaryPHResourceType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF) {
    return 31;
  }
  else {
    return dword_19B2CC9C0[a1 - 1];
  }
}

void sub_19B150F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id resourceIdentifierForURL(void *a1)
{
  id v6 = 0;
  int v1 = [a1 getResourceValue:&v6 forKey:*MEMORY[0x1E4F1C5A0] error:0];
  id v2 = v6;
  id v3 = v2;
  id v4 = 0;
  if (v1) {
    id v4 = v2;
  }

  return v4;
}

void sub_19B155FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1560B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19B15820C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1587A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16238(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16239(uint64_t a1)
{
}

void sub_19B158D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B15919C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B159DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t PHSearchSuggestionCategoriesTypeForPLSearchSuggestionCategoriesType(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0x29) {
    return 0;
  }
  return result;
}

uint64_t PLSearchSuggestionCategoriesTypeForPHSearchSuggestionCategoriesType(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0x29) {
    return 0;
  }
  return result;
}

__CFString *PLDebugStringForPHSearchSuggestionCategoriesType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x29) {
    return @"PHSearchSuggestionCategoriesTypeUndefined";
  }
  else {
    return off_1E5844490[a1 - 1];
  }
}

void sub_19B15C7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B15F12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17175(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17176(uint64_t a1)
{
}

void __PHDeviceSupportsRAW_block_invoke()
{
  id v0 = MTLCreateSystemDefaultDevice();
  PHDeviceSupportsRAW_deviceSupportsRAW = [v0 supportsFeatureSet:3];
}

uint64_t PHDeviceSupportsRAW()
{
  if (PHDeviceSupportsRAW_onceToken != -1) {
    dispatch_once(&PHDeviceSupportsRAW_onceToken, &__block_literal_global_18412);
  }
  return PHDeviceSupportsRAW_deviceSupportsRAW;
}

uint64_t _PHAssetResourceIsTopClassResource(void *a1)
{
  id v1 = a1;
  id v2 = [v1 dataStore];
  int v3 = [(id)objc_opt_class() storeClassID];

  if (v3 == 2)
  {
    [v1 dataStoreSubtype];
    IsHighestQualitdouble y = PLSharedStreamsResourceTypeIsHighestQuality();
  }
  else
  {
    IsHighestQualitdouble y = ([v1 isDerivative] & 1) == 0
                    && [v1 recipeID] != 65946
                    && [v1 recipeID] != 65948
                    || [v1 resourceType] == 9;
  }

  return IsHighestQuality;
}

id _PHAssetResourceOriginalFilenameFromBasePlusUTI(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x1E4F8A950] preferredFileExtensionForType:v4];
  id v6 = v3;
  char v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 stringByAppendingPathExtension:v5];
  }
  else
  {
    uint64_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Unknown file extension for uti: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v8 = v7;
  }

  return v8;
}

id _PHAssetResourceOriginalFilenameFromBasePlusAsset(void *a1, void *a2, int a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = v5;
  uint64_t v8 = [v6 originalFilename];
  uint64_t v9 = [v8 pathExtension];

  if (v9)
  {
    uint64_t v10 = [v6 originalFilename];
    int v11 = [v10 pathExtension];
    id v12 = v11;
    if (a3)
    {
      uint64_t v13 = [v11 lowercaseString];

      id v12 = (void *)v13;
    }

    uint64_t v14 = [v7 stringByAppendingPathExtension:v12];
  }
  else
  {
    int v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v6 originalFilename];
      int v18 = 138543362;
      long long v19 = v16;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "Asset original filename %{public}@ has no path extension", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v14 = v7;
  }

  return v14;
}

void sub_19B17D9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18764(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18765(uint64_t a1)
{
}

void sub_19B17FEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18929(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18930(uint64_t a1)
{
}

void sub_19B18037C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19231(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19232(uint64_t a1)
{
}

void sub_19B1806F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19B181BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B182014(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19B1846F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B184964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B184DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B184FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1860B4(_Unwind_Exception *a1)
{
}

void sub_19B18754C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id PHStringForMemoryMood(__int16 a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:@"Dreamy"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"Sentimental"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 addObject:@"Gentle"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 addObject:@"Chill"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 addObject:@"Neutral"];
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 addObject:@"Happy"];
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 addObject:@"Uplifting"];
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 addObject:@"Epic"];
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  [v3 addObject:@"Club"];
  if ((a1 & 0x200) != 0) {
LABEL_11:
  }
    [v3 addObject:@"Extreme"];
LABEL_12:
  id v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

uint64_t PHMemoryMoodForString(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = [v1 componentsSeparatedByString:@", "];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (!v3) {
      goto LABEL_30;
    }
    uint64_t v4 = v3;
    id v10 = v1;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isEqualToString:@"Dreamy"])
        {
          v5 |= 1uLL;
        }
        else if ([v8 isEqualToString:@"Sentimental"])
        {
          v5 |= 2uLL;
        }
        else if ([v8 isEqualToString:@"Gentle"])
        {
          v5 |= 4uLL;
        }
        else if ([v8 isEqualToString:@"Chill"])
        {
          v5 |= 8uLL;
        }
        else if ([v8 isEqualToString:@"Neutral"])
        {
          v5 |= 0x10uLL;
        }
        else if ([v8 isEqualToString:@"Happy"])
        {
          v5 |= 0x20uLL;
        }
        else if ([v8 isEqualToString:@"Uplifting"])
        {
          v5 |= 0x40uLL;
        }
        else if ([v8 isEqualToString:@"Epic"])
        {
          v5 |= 0x80uLL;
        }
        else if ([v8 isEqualToString:@"Club"])
        {
          v5 |= 0x100uLL;
        }
        else if ([v8 isEqualToString:@"Extreme"])
        {
          v5 |= 0x200uLL;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
    id v1 = v10;
    if (!v5)
    {
LABEL_30:
      if ([v1 isEqualToString:@"Party"])
      {
        uint64_t v5 = 256;
      }
      else if ([v1 isEqualToString:@"Action"])
      {
        uint64_t v5 = 512;
      }
      else
      {
        uint64_t v5 = [v1 isEqualToString:@"Ethereal"];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id PHFetchDictionaryAccessingMutableCopy(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)[v1 mutableCopy];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 mutableAccessingCopy];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v3 = v2;

  return v3;
}

uint64_t __Block_byref_object_copy__19681(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19682(uint64_t a1)
{
}

void sub_19B189DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20217(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20218(uint64_t a1)
{
}

void sub_19B18A194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_19B18B9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_64n4_8_s0(uint64_t a1)
{
}

id __copy_helper_block_e8_64n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 64);
  *(void *)(a1 + 64) = result;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return result;
}

void sub_19B18C41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_19B18C994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B18DDF0(_Unwind_Exception *a1)
{
}

BOOL -[PHPhotoLibrary performChangesAndWait:error:](PHPhotoLibrary *self, SEL a2, dispatch_block_t changeBlock, NSError **error)
{
  id v6 = changeBlock;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PHPhotoLibrary_performChangesAndWait_error___block_invoke;
  aBlock[3] = &unk_1E5844D98;
  id v12 = v6;
  id v7 = v6;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performChangesAndWait:");
  LOBYTE(error) = -[PHPhotoLibrary _performCancellableChangesAndWait:withInstrumentation:error:]((uint64_t)self, v8, v9, (uint64_t)error);

  return (char)error;
}

void sub_19B18F818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void -[PHPhotoLibrary performChanges:completionHandler:](PHPhotoLibrary *self, SEL a2, dispatch_block_t changeBlock, void *completionHandler)
{
  id v6 = changeBlock;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PHPhotoLibrary_performChanges_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5844D98;
  id v12 = v6;
  id v7 = v6;
  uint64_t v8 = completionHandler;
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = +[PHPerformChangesInstrumentation startPeformChangesWithName:]((uint64_t)PHPerformChangesInstrumentation, "performChanges:");
  -[PHPhotoLibrary _performCancellableChanges:withInstrumentation:completionHandler:]((uint64_t)self, v9, v10, v8);
}

void __PLIsScreenShotOrScreenRecordingClient_block_invoke()
{
  PLBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  if (([v0 isEqual:@"com.apple.springboard"] & 1) != 0
    || [v0 isEqual:@"com.apple.replayd"])
  {
    PLIsScreenShotOrScreenRecordingClient_sIsScreenShotOrScreenRecordingClient = 1;
  }
}

void sub_19B192010(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B192AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1933C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B194324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B194710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B195058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B195D34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _classNameCompare(objc_class *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = NSStringFromClass(a1);
  uint64_t v5 = NSStringFromClass(v3);

  uint64_t v6 = [v4 caseInsensitiveCompare:v5];
  return v6;
}

void sub_19B196960(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_19B197408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B197624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B197B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHAuthorizationStatusFromPhotosAccessAllowedResult(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return qword_19B2CCB10[a1];
  }
}

__CFString *PHStringFromAuthorizationStatus(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"not determined";
  }
  else {
    return off_1E5844F98[a1 - 1];
  }
}

BOOL PHShouldAllowAccessWithAuthorizationStatus(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t PHAccessLevelFromPLPhotosAccessScopeOptions(uint64_t a1)
{
  if (a1 == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

void sub_19B199744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20820(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20821(uint64_t a1)
{
}

void sub_19B19A948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21007(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21008(uint64_t a1)
{
}

void sub_19B19AF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PHAssetMediaAnalysisStringsWithMultipleAudioClassifications(int a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a1 >= 1)
    {
      LOWORD(v3) = 1;
      do
      {
        if (((unsigned __int16)v3 & (unsigned __int16)a1) != 0)
        {
          uint64_t v4 = PHAssetMediaAnalysisStringWithSingleAudioClassification((__int16)v3);
          [v2 addObject:v4];
        }
        int v3 = (__int16)(2 * v3);
      }
      while (v3 <= a1 && v3 != 0);
    }
  }
  else
  {
    v7[0] = @"None";
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }

  return v2;
}

__CFString *PHAssetMediaAnalysisStringWithSingleAudioClassification(int a1)
{
  id result = @"None";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      id result = @"Applause";
      break;
    case 2:
      id result = @"Babble";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      id result = @"Cheering";
      break;
    case 8:
      id result = @"Laughter";
      break;
    default:
      if (a1 == 16)
      {
        id result = @"Speech";
      }
      else if (a1 == 32)
      {
        id result = @"Music";
      }
      else
      {
LABEL_6:
        id result = @"Unknown";
      }
      break;
  }
  return result;
}

void sub_19B19F428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Unwind_Resume(a1);
}

void sub_19B1A07F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1A237C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19B1A2DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1A329C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _assetSubtypeForMediaSubtypes(uint64_t a1)
{
  int64_t v1 = a1 & 0xFFFFFFFFFF6FFCADLL;
  if ((a1 & 0xFFFFFFFFFF6FFCADLL) == 0x400000) {
    int v2 = 104;
  }
  else {
    int v2 = 0;
  }
  if (v1 == 0x80000) {
    unsigned int v3 = 103;
  }
  else {
    unsigned int v3 = v2;
  }
  if (v1 == 0x40000) {
    int v4 = 102;
  }
  else {
    int v4 = 0;
  }
  if (v1 == 0x20000) {
    int v5 = 101;
  }
  else {
    int v5 = v4;
  }
  if (v1 < 0x80000) {
    unsigned int v3 = v5;
  }
  if (v1 == 0x10000) {
    int v6 = 100;
  }
  else {
    int v6 = 0;
  }
  if (v1 == 8) {
    unsigned int v7 = 2;
  }
  else {
    unsigned int v7 = v6;
  }
  if (v1 == 4) {
    int v8 = 10;
  }
  else {
    int v8 = 0;
  }
  if (v1 == 1) {
    int v9 = 1;
  }
  else {
    int v9 = v8;
  }
  if (v1 <= 7) {
    unsigned int v7 = v9;
  }
  if (v1 < 0x20000) {
    return v7;
  }
  else {
    return v3;
  }
}

void sub_19B1A492C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1A4AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1AC4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1ACA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1AD204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _IsOriginalKnownUnsupportedFormatForAsset(void *a1, char a2, void *a3)
{
  id v5 = a1;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__21007;
  uint64_t v23 = __Block_byref_object_dispose__21008;
  id v24 = (id)MEMORY[0x1E4F1CC08];
  int v6 = objc_msgSend(v5, "pl_photoLibrary");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___IsOriginalKnownUnsupportedFormatForAsset_block_invoke;
  void v12[3] = &unk_1E5845410;
  id v7 = v5;
  id v13 = v7;
  id v8 = v6;
  char v17 = a2;
  id v14 = v8;
  uint64_t v15 = &v25;
  BOOL v18 = a3 != 0;
  uint64_t v16 = &v19;
  [v8 performBlockAndWait:v12];
  int v9 = v26;
  if (a3 && *((unsigned char *)v26 + 24))
  {
    *a3 = (id) v20[5];
    int v9 = v26;
  }
  uint64_t v10 = *((unsigned __int8 *)v9 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void sub_19B1ADBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19B1ADEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1AE228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1AE5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1B05CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19B1B0B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19B1B1F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1B2290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _PHAllAssetMediaSubtypes()
{
  id v0 = [MEMORY[0x1E4F1CA48] array];
  [v0 addObject:&unk_1EEB257D0];
  [v0 addObject:&unk_1EEB257E8];
  [v0 addObject:&unk_1EEB25800];
  [v0 addObject:&unk_1EEB25818];
  [v0 addObject:&unk_1EEB25830];
  [v0 addObject:&unk_1EEB25848];
  [v0 addObject:&unk_1EEB25860];
  [v0 addObject:&unk_1EEB25878];
  [v0 addObject:&unk_1EEB25890];
  [v0 addObject:&unk_1EEB258A8];
  [v0 addObject:&unk_1EEB258C0];
  [v0 addObject:&unk_1EEB258D8];
  [v0 addObject:&unk_1EEB258F0];
  [v0 addObject:&unk_1EEB25908];
  [v0 addObject:&unk_1EEB25920];
  [v0 addObject:&unk_1EEB25938];
  [v0 addObject:&unk_1EEB25950];
  int64_t v1 = (void *)[v0 copy];

  return v1;
}

__CFString *PHAssetMediaTypeDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E58454F0[a1 - 1];
  }
}

id PHAssetMediaSubtypesDebugDescription(uint64_t a1)
{
  return +[PHAsset descriptionForMediaSubtypes:a1];
}

__CFString *PHAssetPlaybackVariationDebugDescription(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_1E5845430[a1];
  }
}

__CFString *PHAssetPlaybackStyleDebugDescription(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E5845450[a1];
  }
}

__CFString *PHOriginalChoiceDebugDescription(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_1E5845480[a1];
  }
}

uint64_t PHAssetDeferredProcessingInvalidatesContentWhenCompleted(unsigned int a1)
{
  return (a1 > 0xB) | (0x40Eu >> a1) & 1;
}

BOOL PHAssetVideoDeferredProcessingInvalidatesContentWhenCompleted(int a1)
{
  return a1 == 1;
}

unint64_t _assetKindForMediaType(unint64_t a1)
{
  unint64_t v1 = 0x2000100000003uLL >> (16 * a1);
  if (a1 >= 4) {
    LOBYTE(v1) = 3;
  }
  return v1 & 3;
}

unint64_t PLVariationSuggestionTypeStatesFromPHStatesAndType(char a1, uint64_t a2)
{
  if (a2) {
    return (unint64_t)(a1 & 0x3F) << (6 * a2 - 6);
  }
  else {
    return 0;
  }
}

uint64_t PHVariationSuggestionStatesFromPLStatesAndType(unint64_t a1, uint64_t a2)
{
  if (a2) {
    return (a1 >> (6 * a2 - 6)) & 0x3F;
  }
  else {
    return 0;
  }
}

__CFString *PHAssetSourceTypeStringWithSourceType(uint64_t a1)
{
  if (a1 > 15)
  {
    switch(a1)
    {
      case 16:
        return @"Alternate";
      case 32:
        return @"Guest";
      case 64:
        return @"CompanionSynced";
      default:
        return @"unknown";
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        id result = @"None";
        break;
      case 1:
        id result = @"UserLibrary";
        break;
      case 2:
        id result = @"CloudShared";
        break;
      case 4:
        id result = @"iTunesSynced";
        break;
      case 8:
        id result = @"MomentShared";
        break;
      default:
        return @"unknown";
    }
  }
  return result;
}

uint64_t PHAssetMediaAnalysisDataWithColorNormalizationDictionaryAndRevision()
{
  return MEMORY[0x1F4140890]();
}

__CFString *PHAssetImportSourceDescription(unint64_t a1)
{
  if (a1 > 0xE) {
    return @"Unknown Import Source Value";
  }
  else {
    return off_1E5845508[a1];
  }
}

uint64_t CPLMasterImportSourceFromPHAssetImportSource(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 0xE) {
    return (__int16)a1;
  }
  else {
    return 0;
  }
}

__CFString *PHAdjustmentBaseVersionDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"unknown";
  }
  else {
    return off_1E5845588[a1];
  }
}

void sub_19B1B9CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1B9F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t PHNextImageAndAssetResourceManagerID()
{
  if (PHNextImageAndAssetResourceManagerID_onceToken != -1) {
    dispatch_once(&PHNextImageAndAssetResourceManagerID_onceToken, &__block_literal_global_22759);
  }
  return atomic_fetch_add((atomic_ullong *volatile)&PHNextImageAndAssetResourceManagerID_managerID, 1uLL);
}

void sub_19B1BAAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1BB3B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  _Block_object_dispose((const void *)(v4 - 192), 8);
  _Block_object_dispose((const void *)(v4 - 144), 8);
  objc_destroyWeak((id *)(v4 - 112));

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22849(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22850(uint64_t a1)
{
}

void __destroy_helper_block_e8_72n4_8_s0(uint64_t a1)
{
}

id __copy_helper_block_e8_72n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 72);
  *(void *)(a1 + 72) = result;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return result;
}

void sub_19B1BB9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19B1BC010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1BC340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1BC55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1BC7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1BCB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1BCDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_48n4_8_s0(uint64_t a1)
{
}

id __copy_helper_block_e8_48n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 48);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x270], 8) = result;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return result;
}

void sub_19B1BD690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1BD854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B1BDC00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  _Block_object_dispose((const void *)(v4 - 192), 8);
  _Block_object_dispose((const void *)(v4 - 144), 8);
  objc_destroyWeak((id *)(v4 - 112));

  _Unwind_Resume(a1);
}

void sub_19B1C5318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23730(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23731(uint64_t a1)
{
}

void sub_19B1D26AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1D6F94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25201(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25202(uint64_t a1)
{
}

void sub_19B1D9044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1D9AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19B1DA874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1DD330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25730(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25731(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__26096(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26097(uint64_t a1)
{
}

void sub_19B1E1DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1E1F14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B1E2DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26386(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26387(uint64_t a1)
{
}

void sub_19B1E4F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1E564C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1E5B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1E62FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19B1E72FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B1E788C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

__CFString *PHPersonTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E5845E40[a1 + 1];
  }
}

__CFString *PHPersonVerifiedTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 4) {
    return @"unknown";
  }
  else {
    return off_1E5845E58[a1 + 2];
  }
}

__CFString *PHDetectionTypeDescription(int a1)
{
  if ((a1 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E5845E80[a1 - 1];
  }
}

__CFString *PHPersonAgeTypeDescription(int a1)
{
  if ((a1 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E5845EA0[(unsigned __int16)(a1 - 1)];
  }
}

__CFString *PHDescriptionForUtilityCollectionType(int a1)
{
  if ((a1 - 1) > 5) {
    return @"None";
  }
  else {
    return off_1E5845F60[(unsigned __int16)(a1 - 1)];
  }
}

void _fetchNonHintResources(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  if (_fetchNonHintResources_s_onceToken != -1) {
    dispatch_once(&_fetchNonHintResources_s_onceToken, &__block_literal_global_219);
  }
  int v2 = PLImageManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v3 = [v1[1] uuid];
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEBUG, "[RM]: PHResourceChooserList: Fetching non-hint resources for asset with uuid: %{public}@...", buf, 0xCu);
  }
  id v4 = v1[9];
  if (!v4)
  {
    uint64_t v5 = [v1[1] managedObjectContextForFetchingResources];
    id v6 = v1[9];
    v1[9] = (id)v5;

    id v4 = v1[9];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = ___fetchNonHintResources_block_invoke_227;
  void v8[3] = &unk_1E5848578;
  int v9 = v1;
  id v7 = v1;
  [v4 performBlockAndWait:v8];
}

uint64_t __PHChooserListContinueEnumerating_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dataStoreKey];

  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 104);
    id v6 = [v3 dataStoreKey];
    uint64_t v7 = [v5 containsObject:v6] ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t _presentFullResourceAtIndex(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)a1[10];
  id v6 = a1;
  uint64_t v7 = [v5 objectAtIndexedSubscript:a2];
  char v14 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___presentFullResourceAtIndex_block_invoke;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  v13[4] = a3;
  id v8 = _Block_copy(v13);
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[14];

  uint64_t v11 = (*(uint64_t (**)(uint64_t, void *, BOOL, char *, void *))(v9 + 16))(v9, v7, v10 == -1, &v14, v8);
  return v11;
}

uint64_t ___presentFullResourceAtIndex_block_invoke(uint64_t result)
{
  **(unsigned char **)(result + 32) = 1;
  return result;
}

void ___fetchNonHintResources_block_invoke_227(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 57) || *(unsigned char *)(v2 + 56) && *(void *)(v2 + 112) == 1)
  {
    int v3 = [*(id *)(v2 + 8) hasAdjustments];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    int v3 = 1;
  }
  uint64_t v4 = [*(id *)(v2 + 8) isWalrusEnabled];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v14 = 0;
  id v6 = fetchResourcesForChoosing(v5, v3, v4, (void *)_fetchNonHintResources_s_predicate, (uint64_t)&v14);
  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = _sortedInfosFromChooserInfos(v6, *(void **)(a1 + 32));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(NSObject **)(v9 + 32);
    *(void *)(v9 + 32) = v8;
  }
  else
  {
    uint64_t v10 = PLImageManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) uuid];
      uint64_t v12 = [v7 code];
      uint64_t v13 = [v7 domain];
      *(_DWORD *)buf = 138544130;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      char v22 = v13;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "[RM]: PHResourceChooserList: unable to execute fetch request for persisted resources for asset with uuid: %{public}@, error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);
    }
  }
}

id fetchResourcesForChoosing(void *a1, int a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a4;
  uint64_t v36 = a5;
  if (fetchResourcesForChoosing_s_onceToken != -1) {
    dispatch_once(&fetchResourcesForChoosing_s_onceToken, &__block_literal_global_211);
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = [v9 managedObjectContextForFetchingResources];
  unint64_t v13 = 0x1E4F8A000uLL;
  int v37 = a2;
  if (a2)
  {
    id v14 = (void *)MEMORY[0x1E4F8A950];
    uint64_t v15 = [v9 objectID];
    uint64_t v40 = [v14 assetWithObjectID:v15 inManagedObjectContext:v12];

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    __int16 v17 = v16;
    if (v10) {
      [v16 addObject:v10];
    }
    id v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
    __int16 v19 = [v40 nonPersistedResources];
    uint64_t v20 = [v19 filteredArrayUsingPredicate:v18];

    __int16 v21 = objc_msgSend(v20, "_pl_map:", &__block_literal_global_215);
    [v11 addObjectsFromArray:v21];

    unint64_t v13 = 0x1E4F8A000;
  }
  else
  {
    id v18 = 0;
    uint64_t v40 = 0;
  }
  char v22 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = *(void **)(v13 + 2384);
  id v24 = [v9 objectID];
  uint64_t v39 = v10;
  uint64_t v25 = [v23 fetchRequestForResourcesWithObjectID:v24 versions:0 allowDerivatives:1 excludeDynamicCPLResources:a3 additionalPredicate:v10 relationshipKeyPathsForPrefetching:0];

  [v25 setResultType:2];
  [v25 setPropertiesToFetch:fetchResourcesForChoosing_s_propertiesToFetch];
  uint64_t v38 = v12;
  uint64_t v26 = [v12 executeFetchRequest:v25 error:v36];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        double v31 = _resourceInfoFromResultDict(*(void **)(*((void *)&v41 + 1) + 8 * i), v9);
        if (v31) {
          [v22 addObject:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v28);
  }
  [v11 addObjectsFromArray:v22];
  if (v37)
  {
    uint64_t v32 = [v40 virtualResourcesThatReplaceMissingPersistedResources:v22];
    uint64_t v33 = [v32 filteredArrayUsingPredicate:v18];

    int v34 = objc_msgSend(v33, "_pl_map:", &__block_literal_global_217_27487);
    [v11 addObjectsFromArray:v34];
  }

  return v11;
}

id _sortedInfosFromChooserInfos(void *a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  if (_sortedInfosFromChooserInfos_s_onceToken != -1) {
    dispatch_once(&_sortedInfosFromChooserInfos_s_onceToken, &__block_literal_global_27474);
  }
  if (v4[8])
  {
    v28[0] = v4[8];
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v6 = [v5 arrayByAddingObjectsFromArray:_sortedInfosFromChooserInfos_s_defaultSortDescriptors];
  }
  else
  {
    id v6 = (id)_sortedInfosFromChooserInfos_s_defaultSortDescriptors;
  }
  id v7 = [v3 sortedArrayUsingDescriptors:v6];

  if ([v7 indexOfObjectPassingTest:&__block_literal_global_170] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v7;
  }
  else
  {
    char v22 = v4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v18 = [v17 resourceType];
          __int16 v19 = v9;
          if (v18 != 4)
          {
            int v20 = [v17 localAvailability];
            __int16 v19 = v8;
            if (v20 <= 0)
            {
              if ((int)[v17 localAvailabilityTarget] <= 0) {
                __int16 v19 = v11;
              }
              else {
                __int16 v19 = v10;
              }
            }
          }
          [v19 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    [v8 addObjectsFromArray:v10];
    [v8 addObjectsFromArray:v9];
    [v8 addObjectsFromArray:v11];

    uint64_t v4 = v22;
  }

  return v8;
}

BOOL ___sortedInfosFromChooserInfos_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 resourceType] == 4;
}

void ___sortedInfosFromChooserInfos_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localAvailability" ascending:0];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"qualitySortValue" ascending:1];
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  id v3 = (void *)_sortedInfosFromChooserInfos_s_defaultSortDescriptors;
  _sortedInfosFromChooserInfos_s_defaultSortDescriptors = v2;
}

PHResourceChooserListResourceInfo *_resourceInfoFromResultDict(void *a1, void *a2)
{
  id v3 = a1;
  id v47 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___resourceInfoFromResultDict_block_invoke;
    block[3] = &unk_1E5848578;
    id v49 = v4;
    if (_resourceInfoFromResultDict_s_onceToken != -1) {
      dispatch_once(&_resourceInfoFromResultDict_s_onceToken, block);
    }
    uint64_t v5 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_dataStoreClassID];
    [v5 integerValue];

    id v6 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_dataStoreSubtype];
    uint64_t v7 = [v6 integerValue];

    id v8 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_localAvailabilityTarget];
    __int16 v45 = [v8 integerValue];

    id v9 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_resourceType];
    uint64_t v44 = [v9 integerValue];

    id v10 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_version];
    uint64_t v46 = [v10 integerValue];

    id v11 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_recipeID];
    uint64_t v12 = [v11 integerValue];

    uint64_t v13 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_utiConformanceHint];
    __int16 v14 = [v13 integerValue];

    uint64_t v15 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_width];
    uint64_t v43 = [v15 longLongValue];

    uint64_t v16 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_height];
    uint64_t v42 = [v16 longLongValue];

    __int16 v17 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_compactUTI];
    int v18 = [v4 valueAtIndex:_resourceInfoFromResultDict_s_index_dataStoreKeyData];
  }
  else
  {
    __int16 v19 = [v3 objectForKeyedSubscript:@"dataStoreClassID"];
    [v19 integerValue];

    int v20 = [v3 objectForKeyedSubscript:@"dataStoreSubtype"];
    uint64_t v7 = [v20 integerValue];

    __int16 v21 = [v3 objectForKeyedSubscript:@"localAvailabilityTarget"];
    __int16 v45 = [v21 integerValue];

    char v22 = [v3 objectForKeyedSubscript:@"resourceType"];
    uint64_t v44 = [v22 integerValue];

    long long v23 = [v3 objectForKeyedSubscript:@"version"];
    uint64_t v46 = [v23 integerValue];

    long long v24 = [v3 objectForKeyedSubscript:@"recipeID"];
    uint64_t v12 = [v24 integerValue];

    long long v25 = [v3 objectForKeyedSubscript:@"utiConformanceHint"];
    __int16 v14 = [v25 integerValue];

    long long v26 = [v3 objectForKeyedSubscript:@"unorientedWidth"];
    uint64_t v43 = [v26 longLongValue];

    uint64_t v27 = [v3 objectForKeyedSubscript:@"unorientedHeight"];
    uint64_t v42 = [v27 longLongValue];

    __int16 v17 = [v3 objectForKeyedSubscript:@"compactUTI"];
    int v18 = [v3 objectForKeyedSubscript:@"dataStoreKeyData"];
  }
  uint64_t v28 = [v47 libraryID];
  uint64_t v29 = PLDataStoreForClassIDAndLibraryID();
  if (v18)
  {
    unint64_t v30 = objc_msgSend(v29, "keyFromKeyStruct:", objc_msgSend(v18, "bytes"));
  }
  else
  {
    unint64_t v30 = 0;
  }
  double v31 = [MEMORY[0x1E4F8AC60] utiWithCompactRepresentation:v17 conformanceHint:v14];
  uint64_t v32 = [v31 isPrimaryImageFormat];
  unsigned __int8 v33 = [v29 dataStoreSubtypeIsDownloadable:v7];
  [v31 isLosslessEncoding];
  PLIsResourceMarkedFullSizeFromRecipeID();
  if (![v47 hasAdjustments] || v46) {
    [v47 unorientedSize];
  }
  else {
    [v47 originalUnorientedSize];
  }
  double v36 = 0.0;
  if (v34 * v35 > 0.0)
  {
    float v37 = v34 * v35;
    double v36 = (float)((float)(v43 * v42) / v37);
  }
  LOWORD(v41) = v45;
  LOWORD(v40) = v33;
  uint64_t v38 = -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:]([PHResourceChooserListResourceInfo alloc], "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v44, v12, v46, PLQualitySortValueFromResourceDimensions(), v12 & 1, v32, v36, v40, v31, v29, v30, v41);

  return v38;
}

PHResourceChooserListResourceInfo *__fetchResourcesForChoosing_block_invoke_3(uint64_t a1, void *a2)
{
  return _resourceInfoFromVirtualResource(a2);
}

PHResourceChooserListResourceInfo *_resourceInfoFromVirtualResource(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 uniformTypeIdentifier];
  unsigned int v19 = [v2 isPrimaryImageFormat];

  unsigned int v18 = [v1 resourceType];
  HIDWORD(v17) = [v1 version];
  uint64_t v3 = [v1 isDerivative];
  id v4 = [v1 dataStore];
  uint64_t v5 = [v1 dataStoreKey];
  __int16 v6 = [v1 localAvailabilityTarget];
  [v1 scale];
  float v8 = v7;
  unsigned __int8 v9 = objc_msgSend(v4, "dataStoreSubtypeIsDownloadable:", objc_msgSend(v1, "dataStoreSubtype"));
  uint64_t v10 = [v1 recipeID];
  id v11 = [PHResourceChooserListResourceInfo alloc];
  uint64_t v12 = [v1 qualitySortValue];
  uint64_t v13 = [v1 uniformTypeIdentifier];

  LOWORD(v17) = v6;
  LOWORD(v16) = v9;
  __int16 v14 = -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:](v11, "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v18, v10, HIDWORD(v17), v12, v3, v19, v8, v16, v13, v4, v5, v17);

  return v14;
}

void ___resourceInfoFromResultDict_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mapping];
  [v1 indexForKey:@"objectID"];
  _resourceInfoFromResultDict_s_index_recipeID = [v1 indexForKey:@"recipeID"];
  _resourceInfoFromResultDict_s_index_resourceType = [v1 indexForKey:@"resourceType"];
  _resourceInfoFromResultDict_s_index_version = [v1 indexForKey:@"version"];
  _resourceInfoFromResultDict_s_index_compactUTI = [v1 indexForKey:@"compactUTI"];
  _resourceInfoFromResultDict_s_index_utiConformanceHint = [v1 indexForKey:@"utiConformanceHint"];
  _resourceInfoFromResultDict_s_index_double width = [v1 indexForKey:@"unorientedWidth"];
  _resourceInfoFromResultDict_s_index_double height = [v1 indexForKey:@"unorientedHeight"];
  _resourceInfoFromResultDict_s_index_dataStoreClassID = [v1 indexForKey:@"dataStoreClassID"];
  _resourceInfoFromResultDict_s_index_dataStoreSubtype = [v1 indexForKey:@"dataStoreSubtype"];
  _resourceInfoFromResultDict_s_index_dataStoreKeyData = [v1 indexForKey:@"dataStoreKeyData"];
  _resourceInfoFromResultDict_s_index_localAvailabilityTarget = [v1 indexForKey:@"localAvailabilityTarget"];
}

PHResourceChooserListResourceInfo *__fetchResourcesForChoosing_block_invoke_2(uint64_t a1, void *a2)
{
  return _resourceInfoFromVirtualResource(a2);
}

void __fetchResourcesForChoosing_block_invoke()
{
  v2[13] = *MEMORY[0x1E4F143B8];
  v2[0] = @"objectID";
  v2[1] = @"recipeID";
  v2[2] = @"resourceType";
  v2[3] = @"version";
  v2[4] = @"compactUTI";
  v2[5] = @"utiConformanceHint";
  v2[6] = @"unorientedWidth";
  v2[7] = @"unorientedHeight";
  v2[8] = @"dataStoreClassID";
  v2[9] = @"dataStoreSubtype";
  v2[10] = @"dataStoreKeyData";
  v2[11] = @"localAvailability";
  v2[12] = @"localAvailabilityTarget";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:13];
  id v1 = (void *)fetchResourcesForChoosing_s_propertiesToFetch;
  fetchResourcesForChoosing_s_propertiesToFetch = v0;
}

void ___fetchNonHintResources_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND %K != %d", @"utiConformanceHint", &unk_1EEB26B38, @"resourceType", 10];
  id v1 = (void *)_fetchNonHintResources_s_predicate;
  _fetchNonHintResources_s_predicate = v0;
}

uint64_t PHChooserListLookAheadForNonHintResourcePassingTest(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * i)))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

void sub_19B1ED5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 192), 8);
  _Block_object_dispose((const void *)(v32 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27816(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27817(uint64_t a1)
{
}

void sub_19B1EE330(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B1EE678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19B1EF664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_19B1F2660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B1F3150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  objc_destroyWeak(v30);

  objc_destroyWeak((id *)(v31 - 128));
  _Unwind_Resume(a1);
}

void sub_19B1F3DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id location,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v72 - 160), 8);

  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_104n4_8_s0(uint64_t a1)
{
}

id __copy_helper_block_e8_104n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 104);
  *(void *)(a1 + 104) = result;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return result;
}

void sub_19B1F49F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_56n4_8_s0(uint64_t a1)
{
}

id __copy_helper_block_e8_56n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 56);
  *(void *)(a1 + 56) = result;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return result;
}

id getCKMediaItemMakerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKMediaItemMakerClass_softClass;
  uint64_t v7 = getCKMediaItemMakerClass_softClass;
  if (!getCKMediaItemMakerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKMediaItemMakerClass_block_invoke;
    v3[3] = &unk_1E58463A8;
    void v3[4] = &v4;
    __getCKMediaItemMakerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19B1F73D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKMediaItemMakerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __CloudKitLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E58463C8;
    uint64_t v8 = 0;
    CloudKitLibraryCore_frameworkLibrardouble y = _sl_dlopen();
  }
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *CloudKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PHImageManager+VideoUtilities.m", 31, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CKMediaItemMaker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getCKMediaItemMakerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PHImageManager+VideoUtilities.m", 32, @"Unable to find class %s", "CKMediaItemMaker");

LABEL_10:
    __break(1u);
  }
  getCKMediaItemMakerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrardouble y = result;
  return result;
}

uint64_t PHCloudResourcePrefetchModeForPLCloudResourcePrefetchMode(uint64_t a1)
{
  if (a1 == 1) {
    return 2;
  }
  else {
    return a1 == 0;
  }
}

uint64_t PLCloudResourcePrefetchModeForPHCloudResourcePrefetchMode(int a1)
{
  uint64_t v1 = 1;
  if (a1 != 2) {
    uint64_t v1 = 2;
  }
  if (a1 == 1) {
    return 0;
  }
  else {
    return v1;
  }
}

id PHAssetOriginalMetadataOfAsset(void *a1)
{
  id v1 = a1;
  if ([v1 isVideo])
  {
    uint64_t v2 = [v1 originalAVAssetOrProxy];
    id v3 = objc_alloc(MEMORY[0x1E4F8CC48]);
    uint64_t v4 = [v1 photoLibrary];
    uint64_t v5 = [v4 photoLibraryBundle];
    uint64_t v6 = [v5 timeZoneLookup];
    long long v7 = (void *)[v3 initWithAVAsset:v2 options:12 timeZoneLookup:v6];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v2 = [v1 originalImageProperties];
  if (v2)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F8CC48]);
    uint64_t v9 = (void *)MEMORY[0x1E4F8CDF8];
    uint64_t v4 = [v1 uniformTypeIdentifier];
    uint64_t v5 = [v9 typeWithIdentifier:v4];
    uint64_t v6 = [v1 photoLibrary];
    long long v10 = [v6 photoLibraryBundle];
    uint64_t v11 = [v10 timeZoneLookup];
    long long v7 = (void *)[v8 initWithImageProperties:v2 contentType:v5 timeZoneLookup:v11];

    goto LABEL_5;
  }
  long long v7 = 0;
LABEL_7:

  return v7;
}

id PHAssetOriginalLocationForAsset(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    PHAssetOriginalMetadataOfAsset(v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      id v10 = 0;
      goto LABEL_9;
    }
  }
  long long v7 = [v6 gpsLocation];
  id v8 = v7;
  if (v7
    && (uint64_t v9 = (void *)MEMORY[0x1E4F8A930],
        [v7 coordinate],
        objc_msgSend(v9, "canUseCoordinate:")))
  {
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

LABEL_9:

  return v10;
}

id PHAssetOriginalCaptionForAsset(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
LABEL_4:
    long long v7 = [v6 captionAbstract];
    goto LABEL_5;
  }
  PHAssetOriginalMetadataOfAsset(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    goto LABEL_4;
  }
  long long v7 = 0;
LABEL_5:

  return v7;
}

id PHAssetOriginalAccessibilityDescriptionForAsset(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
LABEL_4:
    long long v7 = [v6 artworkContentDescription];
    goto LABEL_5;
  }
  PHAssetOriginalMetadataOfAsset(v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    goto LABEL_4;
  }
  long long v7 = 0;
LABEL_5:

  return v7;
}

uint64_t PHAssetLocationCoordinatesAreEqual(double a1, double a2, double a3, double a4)
{
  int v8 = objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:");
  int v9 = objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:", a3, a4);
  if ((v8 & 1) == 0 && !v9) {
    return 1;
  }
  if (v8 != v9) {
    return 0;
  }
  BOOL v11 = vabdd_f64(a1, a3) < 0.00000001;
  return vabdd_f64(a2, a4) < 0.00000001 && v11;
}

id PHAssetAVMetadataItemDateFormatter()
{
  if (PHAssetAVMetadataItemDateFormatter_onceToken != -1) {
    dispatch_once(&PHAssetAVMetadataItemDateFormatter_onceToken, &__block_literal_global_28666);
  }
  uint64_t v0 = (void *)PHAssetAVMetadataItemDateFormatter_dateFormatter;

  return v0;
}

uint64_t __PHAssetAVMetadataItemDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  id v1 = (void *)PHAssetAVMetadataItemDateFormatter_dateFormatter;
  PHAssetAVMetadataItemDateFormatter_dateFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)PHAssetAVMetadataItemDateFormatter_dateFormatter;

  return [v2 setFormatOptions:1907];
}

id PHAssetDateAndTimeZoneFromISO8601DateString(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = PHAssetAVMetadataItemDateFormatter();
  uint64_t v5 = [v4 dateFromString:v3];
  id v6 = (void *)v5;
  if (a2 && v5)
  {
    if (([v3 hasSuffix:@"Z"] & 1) != 0
      || [v3 hasSuffix:@"z"])
    {
      long long v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    }
    else
    {
      if (PHAssetDateAndTimeZoneFromISO8601DateString_onceToken != -1) {
        dispatch_once(&PHAssetDateAndTimeZoneFromISO8601DateString_onceToken, &__block_literal_global_37);
      }
      int v8 = objc_msgSend((id)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixWithColonsRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
      if (v8
        || (objc_msgSend((id)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")), (int v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v9 = [v8 rangeAtIndex:1];
        BOOL v11 = objc_msgSend(v3, "substringWithRange:", v9, v10);
        uint64_t v12 = [v8 rangeAtIndex:2];
        uint64_t v14 = objc_msgSend(v3, "substringWithRange:", v12, v13);
        uint64_t v15 = [v8 rangeAtIndex:3];
        uint64_t v17 = objc_msgSend(v3, "substringWithRange:", v15, v16);
        int v18 = [v11 isEqualToString:@"-"];
        int v19 = [v14 intValue];
        int v20 = [v17 intValue];
        if (!v18 || v19 || v20)
        {
          if (v18) {
            uint64_t v22 = -(3600 * v19 + 60 * v20);
          }
          else {
            uint64_t v22 = 3600 * v19 + 60 * v20;
          }
          uint64_t v21 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v22];
        }
        else
        {
          uint64_t v21 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
        }
        long long v7 = (void *)v21;
      }
      else
      {
        int v8 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138477827;
          id v26 = v3;
          _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "[PHAsset_MetadataUtilities] Could not parse timezone from original movie date string: %{private}@", (uint8_t *)&v25, 0xCu);
        }
        long long v7 = 0;
      }
    }
  }
  else
  {
    if (!a2) {
      goto LABEL_23;
    }
    long long v7 = 0;
  }
  id v23 = v7;
  *a2 = v23;

LABEL_23:

  return v6;
}

void __PHAssetDateAndTimeZoneFromISO8601DateString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(-|\\+)(\\d\\d):(\\d\\d)$" options:0 error:0];
  id v1 = (void *)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixWithColonsRegex;
  PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixWithColonsRegedouble x = v0;

  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(-|\\+)(\\d\\d)(\\d\\d)$" options:0 error:0];
  id v3 = (void *)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixRegex;
  PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixRegedouble x = v2;
}

void sub_19B1FC3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28940(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28941(uint64_t a1)
{
}

__CFString *PHStringFromFeatureAvailabilityState(uint64_t a1)
{
  id v1 = @"Feature Availability Unknown";
  if (a1 == 1) {
    id v1 = @"Feature Is Available";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Feature Not Available";
  }
}

uint64_t __Block_byref_object_copy__29868(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29869(uint64_t a1)
{
}

__CFString *PHLibraryScopeExitStateDebugDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"unknown";
  }
  else {
    return off_1E58466D0[a1];
  }
}

void sub_19B20B7B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B20BDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v65 - 232), 8);
  _Block_object_dispose((const void *)(v65 - 176), 8);
  objc_destroyWeak((id *)(v65 - 184));

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31194(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31195(uint64_t a1)
{
}

void __destroy_helper_block_e8_112n4_8_s0(uint64_t a1)
{
}

id __copy_helper_block_e8_112n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 112);
  *(void *)(a1 + 112) = result;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return result;
}

void sub_19B20F314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_19B20F6D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_19B210E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31690(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31691(uint64_t a1)
{
}

void sub_19B211F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

__CFString *_descriptionForPHImageRequestResultPhase(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"none";
  }
  else {
    return off_1E5846990[a1 - 1];
  }
}

void sub_19B2158C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__32307(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32308(uint64_t a1)
{
}

void sub_19B216A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PHLocalIdentifierWithUUIDAndCode(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@%@%@", a1, @"/L0/", a2];
}

void sub_19B219530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33157(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33158(uint64_t a1)
{
}

id PHObjectReferenceDictionariesForReferences(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "representedType", (void)v12);
        uint64_t v10 = [v8 dictionaryForReferenceType:v9];
        [v10 setObject:v9 forKeyedSubscript:@"representedType"];
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

id PHObjectReferencesForDictionaries(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          long long v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"representedType", (void)v15);
          long long v13 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "objectForKeyedSubscript:", v12)), "initWithDictionary:referenceType:", v11, v12);
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id PHLocalIdentifierForObjectReferencesAndLibrary(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PHObjectReference filteredObjectReferences:a1 inPhotoLibrary:a2];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "localIdentifier", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

id PHCollectionReferenceFetchCollectionsForReferences(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v29 = a3;
  id v28 = a4;
  uint64_t v8 = +[PHObjectReference filteredObjectReferences:a1 inPhotoLibrary:v7];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = [MEMORY[0x1E4F28E60] indexSet];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v18 transient])
        {
          int v19 = [v18 _transientCollectionInLibrary:v7];
          if (v19)
          {
            [v9 addObject:v19];
            [v11 addIndex:v15++];
          }
        }
        else
        {
          uint64_t v20 = [v18 localIdentifier];
          [v10 addObject:v20];

          ++v15;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  if ([v10 count])
  {
    uint64_t v21 = v28;
    uint64_t v22 = (*((void (**)(id, void *))v28 + 2))(v28, v10);
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v21 = v28;
  }
  if ([v9 count])
  {
    if ([v22 count])
    {
      id v23 = (void *)MEMORY[0x1E4F1CA48];
      long long v24 = [v22 fetchedObjects];
      id v25 = [v23 arrayWithArray:v24];

      [v25 insertObjects:v9 atIndexes:v11];
    }
    else
    {
      id v25 = v9;
    }
    id v26 = [[PHManualFetchResult alloc] initWithObjects:v25 photoLibrary:v7 fetchType:v29 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

    uint64_t v22 = v26;
  }

  return v22;
}

void sub_19B21C7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__33405(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33406(uint64_t a1)
{
}

void sub_19B21DAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_19B221EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id obj)
{
}

void sub_19B222518(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19B222C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B222DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B222F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2230D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B223264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2233F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B223584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B223714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2238A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B223A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B223BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B223D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B223EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22408C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22421C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInOtherSmartAlbum_block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInOtherSmartAlbum_block_invoke_19";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B22456C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2246FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22488C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B224A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B224BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B224D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B224ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22505C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2251EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22537C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22550C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22569C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22582C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2259BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B225B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B225CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B225E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B225FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22618C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22631C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2264AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22663C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2267CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22695C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B226AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B226C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B226E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B226F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22712C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2272BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22744C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2275DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22776C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2278FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncFolder_block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetInAlbumKind_1WaySyncFolder_block_invoke_38";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B227A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncLibraryAlbum_block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetInAlbumKind_1WaySyncLibraryAlbum_block_invoke_37";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B227C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncEvent_block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetInAlbumKind_1WaySyncEvent_block_invoke_36";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B227DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1WaySyncAlbum_block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetInAlbumKind_1WaySyncAlbum_block_invoke_35";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B227F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2280CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22825C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2283EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22857C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22870C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22889C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B228A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B228BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B228D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetInAlbumKind_1stSpecial_block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetInAlbumKind_1stSpecial_block_invoke_25";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B228EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22906C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B2291FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22938C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22951C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34436(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34437(uint64_t a1)
{
}

__CFString *_fetchTypeForCollectionListTypeAndSubtype(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = *off_1E5846E58[a1 - 1];
  }
  return v2;
}

id PHQueryForCollectionsInFolder_block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForCollectionsInFolder_block_invoke_5";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B22ECF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInSmartFolderFavoriteMemories_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForCollectionsInSmartFolderFavoriteMemories_block_invoke_4";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B22EE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInSmartFolderFaces_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForCollectionsInSmartFolderFaces_block_invoke_3";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B22F014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInSmartFolderEvents_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForCollectionsInSmartFolderEvents_block_invoke_2";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B22F1A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForCollectionsInMomentList_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForCollectionsInMomentList_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B22F334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B22F810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B230C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___fetchTypeForLocalIdentifierCode_block_invoke()
{
  v21[17] = *MEMORY[0x1E4F143B8];
  int v19 = +[PHAsset identifierCode];
  v20[0] = v19;
  v21[0] = @"PHAsset";
  long long v18 = +[PHCollectionList identifierCode];
  v20[1] = v18;
  v21[1] = @"PHCollectionList";
  long long v17 = +[PHMomentList identifierCode];
  v20[2] = v17;
  v21[2] = @"PHMomentList";
  uint64_t v16 = +[PHAssetCollection identifierCode];
  v20[3] = v16;
  v21[3] = @"PHAssetCollection";
  uint64_t v15 = +[PHMoment identifierCode];
  v20[4] = v15;
  v21[4] = @"PHMoment";
  uint64_t v14 = +[PHPerson identifierCode];
  v20[5] = v14;
  v21[5] = @"PHPerson";
  uint64_t v13 = +[PHFace identifierCode];
  v20[6] = v13;
  v21[6] = @"PHFace";
  id v12 = +[PHFaceGroup identifierCode];
  v20[7] = v12;
  v21[7] = @"PHFaceGroup";
  uint64_t v0 = +[PHSocialGroup identifierCode];
  v20[8] = v0;
  v21[8] = @"PHSocialGroup";
  uint64_t v1 = +[PHMemory identifierCode];
  v20[9] = v1;
  v21[9] = @"PHMemory";
  uint64_t v2 = +[PHPhotosHighlight identifierCode];
  v20[10] = v2;
  v21[10] = @"PHPhotosHighlight";
  id v3 = +[PHMomentShare identifierCode];
  v20[11] = v3;
  v21[11] = @"PHMomentShare";
  os_signpost_id_t v4 = +[PHLibraryScope identifierCode];
  v20[12] = v4;
  v21[12] = @"PHLibraryScope";
  uint64_t v5 = +[PHShareParticipant identifierCode];
  v20[13] = v5;
  v21[13] = @"PHShareParticipant";
  uint64_t v6 = +[PHSuggestion identifierCode];
  v20[14] = v6;
  v21[14] = @"PHSuggestion";
  id v7 = +[PHImportSession identifierCode];
  v20[15] = v7;
  v21[15] = @"PHImportSession";
  uint64_t v8 = +[PHProject identifierCode];
  v20[16] = v8;
  v21[16] = @"PHProject";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:17];
  uint64_t v10 = [v9 copy];
  int v11 = (void *)_fetchTypeForLocalIdentifierCode_pl_once_object_26;
  _fetchTypeForLocalIdentifierCode_pl_once_object_26 = v10;
}

id PHQueryForKeySharingSuggestionAssetsInHighlight_block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForKeySharingSuggestionAssetsInHighlight_block_invoke_9";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B233190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForKeyAssetsInMomentShare_block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForKeyAssetsInMomentShare_block_invoke_7";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B233320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B233E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _predicateForAssetsInSharedLibrarySharingSuggestionWithOptions(void *a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (([v1 isSharingSuggestion] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    int v11 = objc_msgSend(NSString, "stringWithUTF8String:", "NSPredicate *_predicateForAssetsInSharedLibrarySharingSuggestionWithOptions(PHPhotosHighlight *__strong, PHFetchOptions *__strong)");
    [v10 handleFailureInFunction:v11, @"PHQuery.m", 3007, @"Invalid parameter not satisfying: %@", @"highlight.isSharingSuggestion" file lineNumber description];
  }
  uint64_t v2 = [v1 objectID];
  unsigned int v3 = [v1 kind];

  if (v3 > 3)
  {
    os_signpost_id_t v4 = 0;
  }
  else
  {
    os_signpost_id_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", off_1E5846DD8[v3], v2);
  }
  uint64_t v5 = [MEMORY[0x1E4F8A950] predicateToIncludeSharedLibrarySharingSuggestionsAssets];
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v4;
  v12[1] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v8 = [v6 andPredicateWithSubpredicates:v7];

  return v8;
}

id _predicateForAssetsInPhotosHighlightWithOptions(void *a1, void *a2)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 objectID];
  int v6 = [v4 highlightCurationType];
  if (v6 == 2)
  {
    unsigned int v10 = [v3 kind];
    uint64_t v8 = 1;
    if (v10 < 3)
    {
      uint64_t v9 = @"highlightBeingExtendedAssets = %@";
      goto LABEL_17;
    }
    if (v10 == 3)
    {
      uint64_t v8 = 0;
      uint64_t v9 = @"dayGroupHighlightBeingExtendedAssets = %@";
      goto LABEL_17;
    }
  }
  else if (v6 == 1)
  {
    unsigned int v11 = [v3 kind];
    uint64_t v8 = 1;
    if (v11 < 3)
    {
      uint64_t v9 = @"highlightBeingSummaryAssets = %@";
      goto LABEL_17;
    }
    if (v11 == 3)
    {
      uint64_t v9 = @"dayGroupHighlightBeingSummaryAssets = %@";
      goto LABEL_17;
    }
  }
  else
  {
    if (v6)
    {
      id v12 = 0;
      uint64_t v8 = 1;
      goto LABEL_19;
    }
    unsigned int v7 = [v3 kind];
    uint64_t v8 = 1;
    if (v7 < 3)
    {
      uint64_t v9 = @"highlightBeingAssets = %@";
LABEL_17:
      id v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v9, v5);
      goto LABEL_19;
    }
    if (v7 == 3)
    {
      uint64_t v9 = @"dayGroupHighlightBeingAssets = %@";
      goto LABEL_17;
    }
  }
  id v12 = 0;
LABEL_19:
  if ([v3 isSharingSuggestion])
  {
    uint64_t v13 = [MEMORY[0x1E4F8A950] predicateToIncludeSharedLibrarySharingSuggestionsAssets];
  }
  else
  {
    int v14 = [v4 sharingFilter];
    if (v14 == 1)
    {
      uint64_t v13 = [MEMORY[0x1E4F8A950] predicateToIncludeSharedLibraryAssetsAllowingIndexingOnParticipationState:v8];
    }
    else
    {
      if (v14)
      {
        id v15 = 0;
        goto LABEL_30;
      }
      uint64_t v13 = [MEMORY[0x1E4F8A950] predicateToIncludePrivateLibraryAssetsAllowingIndexingOnParticipationState:v8];
    }
  }
  id v15 = v13;
  if (v13)
  {
    if (v12)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28BA0];
      v20[0] = v12;
      v20[1] = v13;
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      uint64_t v18 = [v16 andPredicateWithSubpredicates:v17];

      id v12 = (void *)v18;
    }
    else
    {
      id v15 = v13;
      id v12 = v15;
    }
  }
LABEL_30:

  return v12;
}

id PHQueryForAssetsInImportSession_block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInImportSession_block_invoke_16";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B234D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInSuggestion_block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInSuggestion_block_invoke_15";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B234F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInPhotosHighlight_block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInPhotosHighlight_block_invoke_13";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B235094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInSharedLibrarySuggestion_block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInSharedLibrarySuggestion_block_invoke_14";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B235224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInUserSmartAlbum_block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInUserSmartAlbum_block_invoke_18";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B2353B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInMemory_block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInMemory_block_invoke_12";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B235544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInMomentShare_block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInMomentShare_block_invoke_11";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B2356D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInMoment_block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInMoment_block_invoke_10";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B235864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInConversation_block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInConversation_block_invoke_17";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B237290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryForAssetsInSearchIndex_block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a2;
  PLPhotoKitGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = v3;
  int v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v11 = 136315138;
    id v12 = "PHQueryForAssetsInSearchIndex_block_invoke_20";
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "QueryIdentificationBlock", "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = v2[2](v2);
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v9, OS_SIGNPOST_INTERVAL_END, v4, "QueryIdentificationBlock", (const char *)&unk_19B30018E, (uint8_t *)&v11, 2u);
  }

  return v7;
}

void sub_19B237420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PHQueryTransformExpressionConstantValue(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  os_signpost_id_t v4 = a2;
  if ([v3 conformsToProtocol:&unk_1EEB2F3E0])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    ((void (**)(id, id))v4)[2](v4, v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void sub_19B237E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose((const void *)(v68 - 216), 8);
  _Block_object_dispose((const void *)(v68 - 168), 8);
  _Block_object_dispose((const void *)(v68 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34936(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34937(uint64_t a1)
{
}

void sub_19B239084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B23957C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

id OutboundURLForURL(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)MEMORY[0x1E4F8B9D0];
    id v2 = a1;
    id v3 = [v1 alloc];
    os_signpost_id_t v4 = [v2 path];
    id v5 = PLGetSandboxExtensionToken();
    id v6 = (void *)[v3 initWithURL:v2 sandboxExtensionToken:v5 consume:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_19B23B080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19B23F64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B2426A8(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__36140(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36141(uint64_t a1)
{
}

void sub_19B24588C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_19B248A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36690(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36691(uint64_t a1)
{
}

void sub_19B249458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PHSuggestionStringWithSubtype(int a1)
{
  id result = @"Unknown Subtype";
  if (a1 > 679)
  {
    if (a1 <= 900)
    {
      if (a1 > 701)
      {
        switch(a1)
        {
          case 801:
            id result = @"Ambient Nature";
            break;
          case 802:
            id result = @"Ambient City";
            break;
          case 803:
            id result = @"Ambient Pet";
            break;
          case 804:
            id result = @"Ambient People";
            break;
          default:
            id v3 = @"Widget Favorites Smart Album";
            os_signpost_id_t v4 = @"Widget Depth Effect Smart Album";
            if (a1 != 703) {
              os_signpost_id_t v4 = @"Unknown Subtype";
            }
            BOOL v6 = a1 == 702;
            goto LABEL_47;
        }
      }
      else
      {
        uint64_t v7 = @"Wallpaper Favorites Smart Album";
        uint64_t v8 = @"Widget User Album";
        if (a1 != 701) {
          uint64_t v8 = @"Unknown Subtype";
        }
        if (a1 != 682) {
          uint64_t v7 = v8;
        }
        uint64_t v9 = @"Wallpaper Settling Effect";
        uint64_t v10 = @"Wallpaper User Album";
        if (a1 != 681) {
          uint64_t v10 = @"Unknown Subtype";
        }
        if (a1 != 680) {
          uint64_t v9 = v10;
        }
        if (a1 <= 681) {
          return v9;
        }
        else {
          return v7;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 901:
          id result = @"Wallpaper Me";
          break;
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
          return result;
        case 910:
          id result = @"Collection Person";
          break;
        case 911:
          id result = @"Collection Pet";
          break;
        case 912:
          id result = @"Collection Album";
          break;
        case 913:
          id result = @"Collection Trip";
          break;
        case 914:
          id result = @"Collection Memory";
          break;
        case 915:
          id result = @"Collection Event";
          break;
        case 916:
          id result = @"Collection Group";
          break;
        case 917:
          id result = @"Collection Media Type";
          break;
        default:
          id v3 = @"Camera Styleable Me";
          os_signpost_id_t v4 = @"Camera Styleable People";
          if (a1 != 1202) {
            os_signpost_id_t v4 = @"Unknown Subtype";
          }
          BOOL v6 = a1 == 1201;
          goto LABEL_47;
      }
    }
  }
  else if (a1 > 400)
  {
    if (a1 <= 600)
    {
      id v3 = @"On this Day";
      os_signpost_id_t v4 = @"Outstander";
      id v5 = @"Long Tail";
      if (a1 != 502) {
        id v5 = @"Unknown Subtype";
      }
      if (a1 != 501) {
        os_signpost_id_t v4 = v5;
      }
      BOOL v6 = a1 == 401;
LABEL_47:
      if (v6) {
        return v3;
      }
      else {
        return v4;
      }
    }
    switch(a1)
    {
      case 601:
        id result = @"Locket";
        break;
      case 602:
        id result = @"Wallpaper Top People";
        break;
      case 603:
        id result = @"Wallpaper Top Pet";
        break;
      case 604:
        id result = @"Wallpaper Top Landscape";
        break;
      case 605:
        id result = @"Wallpaper Top Cityscape";
        break;
      default:
        switch(a1)
        {
          case 652:
            id result = @"Wallpaper People";
            break;
          case 653:
            id result = @"Wallpaper Pet";
            break;
          case 654:
            id result = @"Wallpaper Landscape";
            break;
          case 655:
            id result = @"Wallpaper Cityscape";
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    if (a1 <= 300)
    {
      if (a1 > 200)
      {
        switch(a1)
        {
          case 201:
            id result = @"Loop";
            break;
          case 202:
            id result = @"Long Exposure";
            break;
          case 203:
            id result = @"Bounce";
            break;
          case 204:
            id result = @"Portrait Studio Light";
            break;
          default:
            return result;
        }
        return result;
      }
      id v3 = @"Moment Share";
      os_signpost_id_t v4 = @"Collection Share";
      int v11 = @"Ongoing Collection Share";
      if (a1 != 103) {
        int v11 = @"Unknown Subtype";
      }
      if (a1 != 102) {
        os_signpost_id_t v4 = v11;
      }
      BOOL v6 = a1 == 101;
      goto LABEL_47;
    }
    switch(a1)
    {
      case 301:
        id result = @"Favorite";
        break;
      case 302:
        id result = @"Edit";
        break;
      case 303:
        id result = @"Aesthetics";
        break;
      case 304:
        id result = @"Person Centric";
        break;
      case 305:
        id result = @"Social Group Centric";
        break;
      case 306:
        id result = @"Recent Syndicated Asset";
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t PHSuggestionSubtypeForCPLSuggestionSubtype(uint64_t a1)
{
  uint64_t v1 = 0;
  if ((int)a1 > 679)
  {
    if ((int)a1 <= 900)
    {
      if ((int)a1 > 701)
      {
        switch((int)a1)
        {
          case 801:
          case 802:
          case 803:
          case 804:
LABEL_59:
            uint64_t v1 = a1;
            break;
          default:
            if (a1 == 703) {
              LODWORD(v1) = 703;
            }
            else {
              LODWORD(v1) = 0;
            }
            BOOL v2 = a1 == 702;
            goto LABEL_55;
        }
        return v1;
      }
      if (a1 == 701) {
        LODWORD(v1) = 701;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 682) {
        LODWORD(v1) = 682;
      }
      if (a1 == 681) {
        unsigned int v3 = 681;
      }
      else {
        unsigned int v3 = 0;
      }
      if (a1 == 680) {
        unsigned int v3 = 680;
      }
      BOOL v4 = (int)a1 <= 681;
    }
    else
    {
      if ((int)a1 <= 1100)
      {
        switch((int)a1)
        {
          case 901:
          case 910:
          case 911:
          case 912:
          case 913:
          case 914:
          case 915:
          case 916:
          case 917:
            goto LABEL_59;
          default:
            return v1;
        }
        return v1;
      }
      if (a1 == 1202) {
        LODWORD(v1) = 1202;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 1201) {
        LODWORD(v1) = 1201;
      }
      if (a1 == 1102) {
        unsigned int v3 = 1102;
      }
      else {
        unsigned int v3 = 0;
      }
      if (a1 == 1101) {
        unsigned int v3 = 1101;
      }
      BOOL v4 = (int)a1 <= 1200;
    }
    if (v4) {
      return v3;
    }
    else {
      return v1;
    }
  }
  if ((int)a1 > 400)
  {
    if ((int)a1 <= 600)
    {
      if (a1 == 502) {
        LODWORD(v1) = 502;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 501) {
        LODWORD(v1) = 501;
      }
      BOOL v2 = a1 == 401;
      goto LABEL_55;
    }
    switch((int)a1)
    {
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
        goto LABEL_59;
      default:
        switch((int)a1)
        {
          case 652:
          case 653:
          case 654:
          case 655:
            goto LABEL_59;
          default:
            return v1;
        }
    }
  }
  else
  {
    if ((int)a1 <= 300)
    {
      if ((int)a1 > 200)
      {
        switch((int)a1)
        {
          case 201:
          case 202:
          case 203:
          case 204:
            goto LABEL_59;
          default:
            return v1;
        }
        return v1;
      }
      if (a1 == 103) {
        LODWORD(v1) = 103;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 102) {
        LODWORD(v1) = 102;
      }
      BOOL v2 = a1 == 101;
LABEL_55:
      if (v2) {
        return a1;
      }
      else {
        return v1;
      }
    }
    switch((int)a1)
    {
      case 301:
      case 302:
      case 303:
      case 304:
      case 305:
      case 306:
        goto LABEL_59;
      default:
        return v1;
    }
  }
  return v1;
}

uint64_t PHSuggestionTypeForCPLSuggestionType(uint64_t result)
{
  if ((result - 1) >= 0xB) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t CPLSuggestionTypeForPHSuggestionType(uint64_t result)
{
  if ((result - 1) >= 0xB) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t CPLSuggestionSubtypeForPHSuggestionSubtype(uint64_t a1)
{
  uint64_t v1 = 0;
  if ((int)a1 > 679)
  {
    if ((int)a1 <= 900)
    {
      if ((int)a1 > 701)
      {
        switch((int)a1)
        {
          case 801:
          case 802:
          case 803:
          case 804:
LABEL_59:
            uint64_t v1 = a1;
            break;
          default:
            if (a1 == 703) {
              LODWORD(v1) = 703;
            }
            else {
              LODWORD(v1) = 0;
            }
            BOOL v2 = a1 == 702;
            goto LABEL_55;
        }
        return v1;
      }
      if (a1 == 701) {
        LODWORD(v1) = 701;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 682) {
        LODWORD(v1) = 682;
      }
      if (a1 == 681) {
        unsigned int v3 = 681;
      }
      else {
        unsigned int v3 = 0;
      }
      if (a1 == 680) {
        unsigned int v3 = 680;
      }
      BOOL v4 = (int)a1 <= 681;
    }
    else
    {
      if ((int)a1 <= 1100)
      {
        switch((int)a1)
        {
          case 901:
          case 910:
          case 911:
          case 912:
          case 913:
          case 914:
          case 915:
          case 916:
          case 917:
            goto LABEL_59;
          default:
            return v1;
        }
        return v1;
      }
      if (a1 == 1202) {
        LODWORD(v1) = 1202;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 1201) {
        LODWORD(v1) = 1201;
      }
      if (a1 == 1102) {
        unsigned int v3 = 1102;
      }
      else {
        unsigned int v3 = 0;
      }
      if (a1 == 1101) {
        unsigned int v3 = 1101;
      }
      BOOL v4 = (int)a1 <= 1200;
    }
    if (v4) {
      return v3;
    }
    else {
      return v1;
    }
  }
  if ((int)a1 > 400)
  {
    if ((int)a1 <= 600)
    {
      if (a1 == 502) {
        LODWORD(v1) = 502;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 501) {
        LODWORD(v1) = 501;
      }
      BOOL v2 = a1 == 401;
      goto LABEL_55;
    }
    switch((int)a1)
    {
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
        goto LABEL_59;
      default:
        switch((int)a1)
        {
          case 652:
          case 653:
          case 654:
          case 655:
            goto LABEL_59;
          default:
            return v1;
        }
    }
  }
  else
  {
    if ((int)a1 <= 300)
    {
      if ((int)a1 > 200)
      {
        switch((int)a1)
        {
          case 201:
          case 202:
          case 203:
          case 204:
            goto LABEL_59;
          default:
            return v1;
        }
        return v1;
      }
      if (a1 == 103) {
        LODWORD(v1) = 103;
      }
      else {
        LODWORD(v1) = 0;
      }
      if (a1 == 102) {
        LODWORD(v1) = 102;
      }
      BOOL v2 = a1 == 101;
LABEL_55:
      if (v2) {
        return a1;
      }
      else {
        return v1;
      }
    }
    switch((int)a1)
    {
      case 301:
      case 302:
      case 303:
      case 304:
      case 305:
      case 306:
        goto LABEL_59;
      default:
        return v1;
    }
  }
  return v1;
}

uint64_t PHSuggestionStateForCPLSuggestionState(uint64_t result)
{
  if ((result - 1) >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t CPLSuggestionStateForPHSuggestionState(uint64_t result)
{
  if ((result - 1) >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t PHSuggestionNotificationStateForCPLSuggestionNotificationState(int a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t CPLSuggestionNotificationStateForPHSuggestionNotificationState(int a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

BOOL PHSuggestionFeaturedStateForPLSuggestionFeaturedState(int a1)
{
  return a1 != 0;
}

BOOL PLSuggestionFeaturedStateForPHSuggestionFeaturedState(int a1)
{
  return a1 != 0;
}

__CFString *PHSuggestionStringWithType(int a1)
{
  if ((a1 - 1) > 0xA) {
    return @"Unknown Type";
  }
  else {
    return off_1E5847408[(unsigned __int16)(a1 - 1)];
  }
}

__CFString *PHSuggestionStateStringWithState(unsigned int a1)
{
  if (a1 > 4) {
    return @"Unknown State";
  }
  else {
    return off_1E5847460[a1];
  }
}

__CFString *PHSuggestionNotificationStateStringWithNotificationState(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown State";
  }
  else {
    return off_1E5847488[a1];
  }
}

__CFString *PHSuggestionFeaturedStateStringWithFeaturedState(int a1)
{
  uint64_t v1 = @"Unknown State";
  if (a1 == 1) {
    uint64_t v1 = @"Currently Featured";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Not Featured";
  }
}

__CFString *PHAssetSyndicationEligibilityShortDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 6) > 8) {
    return @"Unknown";
  }
  else {
    return off_1E58474C8[a1 + 6];
  }
}

__CFString *PHAssetSyndicationEligibilityDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 6) > 8) {
    return @"Unknown";
  }
  else {
    return off_1E5847510[a1 + 6];
  }
}

id PHAssetMediaAnalysisSyndicationProcessingValueDescription(int a1)
{
  BOOL v2 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v3 = v2;
  if (!a1)
  {
    BOOL v4 = @"None";
LABEL_34:
    [v3 addObject:v4];
    goto LABEL_35;
  }
  if (a1)
  {
    [v2 addObject:@"No Moment For Date"];
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_21;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v3 addObject:@"Time"];
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 addObject:@"No Location"];
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 addObject:@"Location Too Far"];
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 addObject:@"Location"];
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 addObject:@"Owner Face"];
  if ((a1 & 0x40) == 0)
  {
LABEL_9:
    if ((a1 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 addObject:@"Face"];
  if ((a1 & 0x80) == 0)
  {
LABEL_10:
    if ((a1 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 addObject:@"Moment Previously Matched"];
  if ((a1 & 0x100) == 0)
  {
LABEL_11:
    if ((a1 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 addObject:@"Detected As Duplicate"];
  if ((a1 & 0x200) == 0)
  {
LABEL_12:
    if ((a1 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 addObject:@"Pet"];
  if ((a1 & 0x400) == 0)
  {
LABEL_13:
    if ((a1 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 addObject:@"CoreRoutine"];
  if ((a1 & 0x800) == 0)
  {
LABEL_14:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 addObject:@"Significant Location"];
  if ((a1 & 0x1000) == 0)
  {
LABEL_15:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_16;
    }
LABEL_32:
    [v3 addObject:@"Sceneprint"];
    if ((a1 & 0x4000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
LABEL_31:
  [v3 addObject:@"SavedGuestAsset"];
  if ((a1 & 0x2000) != 0) {
    goto LABEL_32;
  }
LABEL_16:
  if ((a1 & 0x4000) != 0)
  {
LABEL_33:
    BOOL v4 = @"Child";
    goto LABEL_34;
  }
LABEL_35:
  id v5 = [v3 componentsJoinedByString:@", "];

  return v5;
}

__CFString *PHAssetSyndicationProcessingVersionDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v4 = @"Not processed for guest inference";
  }
  else
  {
    unsigned int v3 = @"(final)";
    if ((a1 & 0x10000) == 0) {
      unsigned int v3 = @"(need face processing)";
    }
    BOOL v4 = [NSString stringWithFormat:@"v.%llu %@", a1 & 0xFFFFFFFFFFFEFFFFLL, v3, v1];
  }
  return v4;
}

uint64_t PHAssetSyndicationProcessingVersionWithFacesProcessed(uint64_t a1)
{
  return a1 | 0x10000;
}

uint64_t PHAssetSyndicationProcessingCurrentVersionForAsset(void *a1)
{
  uint64_t v1 = [a1 faceAdjustmentVersion];

  if (v1) {
    return 65556;
  }
  else {
    return 20;
  }
}

__CFString *PHSearchQueryResultTypesDescription(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v3 = v2;
  if (a1) {
    [v2 addObject:@"asset"];
  }
  if ((a1 & 2) != 0) {
    [v3 addObject:@"collection"];
  }
  if ([v3 count])
  {
    BOOL v4 = [v3 componentsJoinedByString:@"|"];
  }
  else
  {
    BOOL v4 = @"invalid";
  }

  return v4;
}

void sub_19B258AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PHStringForMemoryCurationLength(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E5847800[a1];
  }
}

uint64_t PHMemoryCurationLengthForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Custom"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Short"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Medium"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Long"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 2;
  }

  return v2;
}

__CFString *PHShareStatusDebugDescription(int a1)
{
  if ((a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E58478A0[(unsigned __int16)(a1 - 1)];
  }
}

__CFString *PHShareParticipantPermissionDebugDescription(int a1)
{
  if ((a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E58478B8[a1 - 1];
  }
}

__CFString *PHShareTrashedStateDebugDescription(int a1)
{
  id v1 = @"unknown";
  if (a1 == 1) {
    id v1 = @"trashed";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"not trashed";
  }
}

__CFString *PHSharePublishStateDebugDescription(int a1)
{
  if ((a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E58478D0[a1 - 1];
  }
}

void sub_19B25D590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19B25D9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40430(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40431(uint64_t a1)
{
}

void sub_19B25DD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B25DDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B25DF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B25F14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40842(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40843(uint64_t a1)
{
}

void sub_19B260740(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19B26089C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B2609A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B260B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B264D50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41070(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41071(uint64_t a1)
{
}

void sub_19B266018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19B26648C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B266B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B267794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__41289(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41290(uint64_t a1)
{
}

uint64_t PHErrorAllowsInternalErrors()
{
  uint64_t result = MEMORY[0x19F388B10]();
  if (result)
  {
    if (PHErrorSuppressInternalErrors_onceToken != -1) {
      dispatch_once(&PHErrorSuppressInternalErrors_onceToken, &__block_literal_global_89_41898);
    }
    return PHErrorSuppressInternalErrors_suppressInternalErrors == 0;
  }
  return result;
}

void __PHErrorSuppressInternalErrors_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  PHErrorSuppressInternalErrors_suppressInternalErrors = [v0 BOOLForKey:@"com.apple.photos.backend.SuppressInternalErrors"];

  if (PHErrorSuppressInternalErrors_suppressInternalErrors)
  {
    uint64_t v1 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl(&dword_19B043000, v1, OS_LOG_TYPE_DEFAULT, "##### Suppressing internal errors", v2, 2u);
    }
  }
}

__CFString *NSStringFromPHErrorCode(uint64_t a1)
{
  if (a1 > 3209)
  {
    switch(a1)
    {
      case 3300:
        return @"PHPhotosErrorChangeNotSupported";
      case 3301:
        return @"PHPhotosErrorOperationInterrupted";
      case 3302:
        return @"PHPhotosErrorInvalidResource";
      case 3303:
        return @"PHPhotosErrorMissingResource";
      case 3304:
      case 3307:
      case 3308:
      case 3309:
        goto LABEL_26;
      case 3305:
        return @"PHPhotosErrorNotEnoughSpace";
      case 3306:
        return @"PHPhotosErrorRequestNotSupportedForAsset";
      case 3310:
        return @"PHPhotosErrorAccessRestricted";
      case 3311:
        return @"PHPhotosErrorAccessUserDenied";
      default:
        if (a1 == 3210)
        {
          uint64_t result = @"PHPhotosErrorPersistentChangeDetailsUnavailable";
        }
        else
        {
          if (a1 != 5423) {
            goto LABEL_26;
          }
LABEL_21:
          uint64_t result = @"PHPhotosErrorLibraryInFileProviderSyncRoot";
        }
        break;
    }
  }
  else
  {
    if (a1 > 3141)
    {
      if (a1 > 3200)
      {
        if (a1 == 3201) {
          return @"PHPhotosErrorIdentifierNotFound";
        }
        if (a1 == 3202) {
          return @"PHPhotosErrorMultipleIdentifiersFound";
        }
      }
      else
      {
        if (a1 == 3142) {
          return @"PHPhotosErrorRelinquishingLibraryBundleToWriter";
        }
        if (a1 == 3143) {
          return @"PHPhotosErrorSwitchingSystemPhotoLibrary";
        }
      }
    }
    else if (a1 > 3104)
    {
      if (a1 == 3105) {
        return @"PHPhotosErrorPersistentChangeTokenExpired";
      }
      if (a1 == 3114) {
        return @"PHPhotosErrorLibraryVolumeOffline";
      }
    }
    else
    {
      if (a1 == -1) {
        return @"PHPhotosErrorInternalError";
      }
      if (a1 == 3072) {
        return @"PHPhotosErrorUserCancelled";
      }
    }
LABEL_26:
    if (a1 <= 5100)
    {
      if (a1 > 3306)
      {
        if (a1 > 4200)
        {
          if (a1 <= 4300)
          {
            if (a1 == 4201) {
              return @"PHPhotosErrorNoData";
            }
            if (a1 == 4202) {
              return @"PHPhotosErrorJobQueueFull";
            }
          }
          else
          {
            switch(a1)
            {
              case 4301:
                return @"PHPhotosErrorUnknownState";
              case 4302:
                return @"PHPhotosErrorInvalidState";
              case 4303:
                return @"PHPhotosErrorTerminationImminent";
            }
          }
        }
        else if (a1 <= 4100)
        {
          if (a1 == 3307) {
            return @"PHPhotosErrorObjectStale";
          }
          if (a1 == 3311) {
            return @"PHPhotosErrorAccessUserDenied";
          }
        }
        else
        {
          switch(a1)
          {
            case 4101:
              return @"PHPhotosErrorXPCConnectionReplyInvalid";
            case 4102:
              return @"PHPhotosErrorXPCConnectionReplyTimeout";
            case 4103:
              return @"PHPhotosErrorXPC";
          }
        }
        return @"unknown";
      }
      switch(a1)
      {
        case 3103:
          uint64_t result = @"PHPhotosErrorReadFailure";
          break;
        case 3104:
          uint64_t result = @"PHPhotosErrorWriteFailure";
          break;
        case 3105:
        case 3113:
        case 3114:
        case 3142:
        case 3143:
        case 3148:
        case 3171:
        case 3172:
        case 3173:
        case 3174:
        case 3175:
        case 3176:
        case 3177:
        case 3178:
        case 3179:
        case 3180:
        case 3181:
        case 3182:
        case 3183:
        case 3184:
        case 3185:
        case 3186:
        case 3187:
        case 3188:
        case 3189:
        case 3190:
        case 3191:
        case 3192:
        case 3193:
        case 3194:
        case 3195:
        case 3196:
        case 3197:
        case 3198:
        case 3199:
        case 3200:
        case 3201:
        case 3202:
          return @"unknown";
        case 3106:
          uint64_t result = @"PHPhotosErrorLibraryNeedsUpgrade";
          break;
        case 3107:
          uint64_t result = @"PHPhotosErrorLibraryDirectoryAlreadyExists";
          break;
        case 3108:
          uint64_t result = @"PHPhotosErrorLibraryDirectoryDoesNotExist";
          break;
        case 3109:
          uint64_t result = @"PHPhotosErrorLibraryNotOpen";
          break;
        case 3110:
          uint64_t result = @"PHPhotosErrorNotFound";
          break;
        case 3111:
          uint64_t result = @"PHPhotosErrorForbidden";
          break;
        case 3112:
          uint64_t result = @"PHPhotosErrorDatabaseLoadFailed";
          break;
        case 3115:
          uint64_t result = @"PHPhotosErrorNoSSBAvailable";
          break;
        case 3116:
          uint64_t result = @"PHPhotosErrorPostMigration";
          break;
        case 3117:
          uint64_t result = @"PHPhotosErrorSectionData";
          break;
        case 3118:
          uint64_t result = @"PHPhotosErrorCoreData";
          break;
        case 3119:
          uint64_t result = @"PHPhotosErrorDirectoryCreation";
          break;
        case 3120:
          uint64_t result = @"PHPhotosErrorDirectoryMove";
          break;
        case 3121:
          uint64_t result = @"PHPhotosErrorFileClone";
          break;
        case 3122:
          uint64_t result = @"PHPhotosErrorFileCloneUnsupported";
          break;
        case 3123:
          uint64_t result = @"PHPhotosErrorFileMove";
          break;
        case 3124:
          uint64_t result = @"PHPhotosErrorModelCreation";
          break;
        case 3125:
          uint64_t result = @"PHPhotosErrorModelMigration";
          break;
        case 3126:
          uint64_t result = @"PHPhotosErrorUnsupported";
          break;
        case 3127:
          uint64_t result = @"PHPhotosErrorLibraryClone";
          break;
        case 3128:
          uint64_t result = @"PHPhotosErrorMigrationCancelled";
          break;
        case 3129:
          uint64_t result = @"PHPhotosErrorFailedToOpenLibrary";
          break;
        case 3130:
          uint64_t result = @"PHPhotosErrorMigrationPhase";
          break;
        case 3131:
          uint64_t result = @"PHPhotosErrorNewerSchema";
          break;
        case 3132:
          uint64_t result = @"PHPhotosErrorNoConnectionInterrupted";
          break;
        case 3133:
          uint64_t result = @"PHPhotosErrorNoConnectionInvalidated";
          break;
        case 3134:
          uint64_t result = @"PHPhotosErrorNoDelegate";
          break;
        case 3135:
          uint64_t result = @"PHPhotosErrorNoURLBookmark";
          break;
        case 3136:
          uint64_t result = @"PHPhotosErrorObtainPIDLockFail";
          break;
        case 3137:
          uint64_t result = @"PHPhotosErrorPreMigrationPhase";
          break;
        case 3138:
          uint64_t result = @"PHPhotosErrorResumeFailed";
          break;
        case 3139:
          uint64_t result = @"PHPhotosErrorTimeout";
          break;
        case 3140:
          uint64_t result = @"PHPhotosErrorValidationIssue";
          break;
        case 3141:
          uint64_t result = @"PHPhotosErrorException";
          break;
        case 3144:
          uint64_t result = @"PHPhotosErrorDeletionCheck";
          break;
        case 3145:
          uint64_t result = @"PHPhotosErrorRebuildRequested";
          break;
        case 3146:
          uint64_t result = @"PHPhotosErrorShutdownRequested";
          break;
        case 3147:
          uint64_t result = @"PHPhotosErrorNoCloudPhotoLibraryManager";
          break;
        case 3149:
          uint64_t result = @"PHPhotosErrorLegacyUpgradeFailed";
          break;
        case 3150:
          uint64_t result = @"PHPhotosErrorMissingDatabaseFiles";
          break;
        case 3151:
          uint64_t result = @"PHPhotosErrorMigrationInProgress";
          break;
        case 3152:
          uint64_t result = @"PHPhotosErrorMigrationRebuild";
          break;
        case 3153:
          uint64_t result = @"PHPhotosErrorMigrationAquireFSReservation";
          break;
        case 3154:
          uint64_t result = @"PHPhotosErrorMigrationAquirePIDLock";
          break;
        case 3155:
          uint64_t result = @"PHPhotosErrorMigrationPLMUInternal";
          break;
        case 3156:
          uint64_t result = @"PHPhotosErrorMigrationLithiumInternal";
          break;
        case 3157:
          uint64_t result = @"PHPhotosErrorMigrationUnknownLibraryType";
          break;
        case 3158:
          uint64_t result = @"PHPhotosErrorClientNormalClose";
          break;
        case 3159:
          uint64_t result = @"PHPhotosErrorClientDealloc";
          break;
        case 3160:
          uint64_t result = @"PHPhotosErrorClientRequestedCloseAndDeleteLibrary";
          break;
        case 3161:
          uint64_t result = @"PHPhotosErrorLibraryFilesystemDeleteFailed";
          break;
        case 3162:
          uint64_t result = @"PHPhotosErrorServiceSandboxExtensionConsumeFailed";
          break;
        case 3163:
          uint64_t result = @"PHPhotosErrorServiceSandboxExtensionCreateFailed";
          break;
        case 3164:
          uint64_t result = @"PHPhotosErrorNetworkAccessRequired";
          break;
        case 3165:
          uint64_t result = @"PHPhotosErrorClientRequestedCloseLibrary";
          break;
        case 3166:
          uint64_t result = @"PHPhotosErrorDataVaultRequiresClientSandboxOrEntitlement";
          break;
        case 3167:
          uint64_t result = @"PHPhotosErrorOperationCancelled";
          break;
        case 3168:
          uint64_t result = @"PHPhotosErrorUnsupportedLegacyLibrary";
          break;
        case 3169:
          uint64_t result = @"PHPhotosErrorNetworkError";
          break;
        case 3170:
          uint64_t result = @"PHPhotosErrorNetworkIsConstrained";
          break;
        case 3203:
          uint64_t result = @"PHPhotosErrorUnsupportedIdentifier";
          break;
        case 3204:
          uint64_t result = @"PHPhotosErrorIdentifierReservationLimitExceeded";
          break;
        default:
          if (a1) {
            return @"unknown";
          }
          uint64_t result = @"PHPhotosErrorNone";
          break;
      }
    }
    else if (a1 <= 6000)
    {
      if (a1 > 5599)
      {
        switch(a1)
        {
          case 5600:
            return @"PHPhotosErrorFailedToCreateDefaultDirectories";
          case 5601:
            return @"PHPhotosErrorInvalidFileIdentifier";
          case 5602:
            return @"PHPhotosErrorMissingLibraryBundle";
        }
        return @"unknown";
      }
      switch(a1)
      {
        case 5401:
          uint64_t result = @"PHPhotosErrorDatabaseOpenError";
          break;
        case 5402:
          uint64_t result = @"PHPhotosErrorInvalidURL";
          break;
        case 5403:
          uint64_t result = @"PHPhotosErrorLibraryInTrash";
          break;
        case 5404:
          uint64_t result = @"PHPhotosErrorNoPermission";
          break;
        case 5405:
          uint64_t result = @"PHPhotosErrorReadOnlyFilesystem";
          break;
        case 5406:
          uint64_t result = @"PHPhotosErrorSandboxNoPermission";
          break;
        case 5407:
          uint64_t result = @"PHPhotosErrorUnsupportedFilesystem";
          break;
        case 5408:
          uint64_t result = @"PHPhotosErrorPLMUUpgradeCompleted";
          break;
        case 5409:
          uint64_t result = @"PHPhotosErrorLibraryUnsupported";
          break;
        case 5410:
          uint64_t result = @"PHPhotosErrorLibraryTooNew";
          break;
        case 5411:
          uint64_t result = @"PHPhotosErrorLibraryRequiresMigration";
          break;
        case 5412:
          uint64_t result = @"PHPhotosErrorLightweightMigrationFailed";
          break;
        case 5413:
          uint64_t result = @"PHPhotosErrorLibraryCannotOpen";
          break;
        case 5414:
          uint64_t result = @"PHPhotosErrorDatabaseIsLocked";
          break;
        case 5415:
          uint64_t result = @"PHPhotosErrorLibraryTooOld";
          break;
        case 5416:
          uint64_t result = @"PHPhotosErrorLibraryVolumeUnmountRequested";
          break;
        case 5417:
          uint64_t result = @"PHPhotosErrorDatabaseIsCorrupt";
          break;
        case 5418:
          uint64_t result = @"PHPhotosErrorMigrationMissingRebuildData";
          break;
        case 5419:
          uint64_t result = @"PHPhotosErrorStagedMigrationFailed";
          break;
        case 5420:
          uint64_t result = @"PHPhotosErrorBackgroundMigrationFailed";
          break;
        case 5421:
          uint64_t result = @"PHPhotosErrorLibraryInTimeMachineBackupLocation";
          break;
        case 5422:
          uint64_t result = @"PHPhotosErrorUserPreventedRebuild";
          break;
        case 5423:
          goto LABEL_21;
        case 5424:
          uint64_t result = @"PHPhotosErrorMismatchURL";
          break;
        case 5425:
          uint64_t result = @"PHPhotosErrorExistingIdentifier";
          break;
        case 5426:
          uint64_t result = @"PHPhotosErrorLibraryCreationFailed";
          break;
        default:
          switch(a1)
          {
            case 5101:
              uint64_t result = @"PHPhotosErrorClientNotEntitled";
              break;
            case 5102:
              uint64_t result = @"PHPhotosErrorNotAuthorized";
              break;
            case 5103:
              uint64_t result = @"PHPhotosErrorBookmarkResolutionFailed";
              break;
            case 5104:
              uint64_t result = @"PHPhotosErrorClientSandboxExtensionConsumeFailed";
              break;
            case 5105:
              uint64_t result = @"PHPhotosErrorClientSandboxExtensionCreateFailed";
              break;
            case 5106:
              uint64_t result = @"PHPhotosErrorNoPersistentStores";
              break;
            case 5107:
              uint64_t result = @"PHPhotosErrorMultiLibraryService";
              break;
            default:
              return @"unknown";
          }
          break;
      }
    }
    else if (a1 <= 6300)
    {
      switch(a1)
      {
        case 6001:
          uint64_t result = @"PHPhotosErrorShareNetworkError";
          break;
        case 6002:
          uint64_t result = @"PHPhotosErrorShareInvalidShareURL";
          break;
        case 6003:
          uint64_t result = @"PHPhotosErrorShareNotFound";
          break;
        case 6004:
          uint64_t result = @"PHPhotosErrorShareTrashed";
          break;
        case 6005:
          uint64_t result = @"PHPhotosErrorShareInvalidAction";
          break;
        case 6006:
          uint64_t result = @"PHPhotosErrorShareCPLClosed";
          break;
        case 6007:
          uint64_t result = @"PHPhotosErrorShareCPLExitMode";
          break;
        case 6008:
          uint64_t result = @"PHPhotosErrorShareQuotaExceeded";
          break;
        case 6009:
          uint64_t result = @"PHPhotosErrorShareBusy";
          break;
        case 6010:
          uint64_t result = @"PHPhotosErrorShareForbidden";
          break;
        case 6011:
          uint64_t result = @"PHPhotosErrorShareTooManyParticipants";
          break;
        case 6012:
          uint64_t result = @"PHPhotosErrorShareCloudNotAuthenticated";
          break;
        default:
          switch(a1)
          {
            case 6201:
              uint64_t result = @"PHPhotosErrorLibraryImportUnknown";
              break;
            case 6202:
              uint64_t result = @"PHPhotosErrorLibraryImportInvalid";
              break;
            case 6203:
              uint64_t result = @"PHPhotosErrorLibraryImportNeedsMigration";
              break;
            case 6204:
              uint64_t result = @"PHPhotosErrorLibraryImportNeedsForceRepair";
              break;
            case 6205:
              uint64_t result = @"PHPhotosErrorLibraryImportNeedsTimeMachineRestore";
              break;
            case 6206:
              uint64_t result = @"PHPhotosErrorLibraryImportNeedsDisableCPL";
              break;
            case 6207:
              uint64_t result = @"PHPhotosErrorLibraryImportNeedsDisabledCPLCleanupCompletion";
              break;
            case 6208:
              uint64_t result = @"PHPhotosErrorLibraryImportProcessingError";
              break;
            case 6209:
              uint64_t result = @"PHPhotosErrorLibraryImportIsLegacyLibrary";
              break;
            default:
              if (a1 != 6100) {
                return @"unknown";
              }
              uint64_t result = @"PHPhotosErrorSpotlightSearchTimeout";
              break;
          }
          break;
      }
    }
    else
    {
      if (a1 <= 8000)
      {
        if (a1 > 7400)
        {
          switch(a1)
          {
            case 7401:
              uint64_t result = @"PHPhotosErrorSocialGroupAlreadyExists";
              break;
            case 7402:
              uint64_t result = @"PHPhotosErrorSocialGroupInvalidKeyAsset";
              break;
            case 7403:
              uint64_t result = @"PHPhotosErrorSocialGroupOrderNegative";
              break;
            case 7404:
              uint64_t result = @"PHPhotosErrorSocialGroupNeedsAtLeastTwoPersons";
              break;
            case 7405:
              uint64_t result = @"PHPhotosErrorSocialGroupApproveRejectedMemberByNonUser";
              break;
            case 7406:
              uint64_t result = @"PHPhotosErrorSocialGroupNeedsCommonAsset";
              break;
            case 7407:
              uint64_t result = @"PHPhotosErrorSocialGroupRemoveMemberByNonUser";
              break;
            case 7408:
              uint64_t result = @"PHPhotosErrorSocialGroupMemberNotFound";
              break;
            case 7409:
              uint64_t result = @"PHPhotosErrorSocialGroupOverrideUserPickedKeyAssetByNonUser";
              break;
            default:
              return @"unknown";
          }
          return result;
        }
        switch(a1)
        {
          case 6301:
            return @"PHPhotosErrorPersonMissingKeyFace";
          case 7001:
            return @"PHPhotosErrorImageManagerResourceDecodeError";
          case 7003:
            return @"PHPhotosErrorImageManagerTableThumbDecodeError";
        }
        return @"unknown";
      }
      if (a1 <= 8499)
      {
        if (a1 == 8001) {
          return @"PHPhotosErrorAssetLimitExceeded";
        }
        if (a1 == 8002) {
          return @"PHPhotosErrorUnknownTaskID";
        }
        return @"unknown";
      }
      switch(a1)
      {
        case 8500:
          uint64_t result = @"PHPhotosErrorSharedLibraryExceedsMaxLibraries";
          break;
        case 8501:
          uint64_t result = @"PHPhotosErrorSharedLibraryBlockedInExit";
          break;
        case 8502:
          uint64_t result = @"PHPhotosErrorManagedAppleIDRestricted";
          break;
        case 8503:
          uint64_t result = @"PHPhotosErrorU13Restricted";
          break;
        case 8504:
          uint64_t result = @"PHPhotosErrorShareRegionUnsupported";
          break;
        case 8505:
          uint64_t result = @"PHPhotosErrorSharedLibraryIsOwned";
          break;
        case 8506:
          uint64_t result = @"PHPhotosErrorSharedLibraryDoesNotHaveACurrentUser";
          break;
        case 8507:
          uint64_t result = @"PHPhotosErrorInvalidEmailAddress";
          break;
        default:
          if (a1 != 9999) {
            return @"unknown";
          }
          uint64_t result = @"PHPhotosErrorFeatureDisabled";
          break;
      }
    }
  }
  return result;
}

id PHErrorFromPLError(void *a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    uint64_t v7 = 0;
    goto LABEL_17;
  }
  unsigned int v3 = [v1 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F8C500]];

  if (v4)
  {
    uint64_t v5 = [v2 code];
    uint64_t v6 = -1;
    if (v5 > 46200)
    {
      if (v5 > 46799)
      {
        if (v5 <= 72000)
        {
          if (v5 <= 47001)
          {
            switch(v5)
            {
              case 46800:
                uint64_t v6 = 5600;
                break;
              case 46801:
                uint64_t v6 = 5601;
                break;
              case 46802:
                uint64_t v6 = 5602;
                break;
            }
          }
          else if (v5 > 47015)
          {
            if (v5 == 47016)
            {
              uint64_t v6 = 3302;
            }
            else if (v5 == 47018)
            {
              uint64_t v6 = 3164;
            }
          }
          else if (v5 == 47002)
          {
            uint64_t v6 = 3072;
          }
          else if (v5 == 47006)
          {
            uint64_t v6 = 3303;
          }
        }
        else if (v5 > 73000)
        {
          switch(v5)
          {
            case 73001:
              uint64_t v6 = 6301;
              break;
            case 81001:
              uint64_t v6 = 8505;
              break;
            case 81003:
              uint64_t v6 = 8506;
              break;
          }
        }
        else
        {
          switch(v5)
          {
            case 72001:
              uint64_t v6 = 6201;
              break;
            case 72002:
              uint64_t v6 = 6202;
              break;
            case 72003:
              uint64_t v6 = 6203;
              break;
            case 72004:
              uint64_t v6 = 6204;
              break;
            case 72005:
              uint64_t v6 = 6205;
              break;
            case 72006:
              uint64_t v6 = 6206;
              break;
            case 72007:
              uint64_t v6 = 6207;
              break;
            case 72008:
              uint64_t v6 = 6208;
              break;
            case 72009:
              uint64_t v6 = 6209;
              break;
            default:
              goto LABEL_15;
          }
        }
      }
      else if (v5 <= 46500)
      {
        switch(v5)
        {
          case 46301:
            uint64_t v6 = 3118;
            break;
          case 46302:
            uint64_t v6 = 3119;
            break;
          case 46303:
            uint64_t v6 = 3120;
            break;
          case 46304:
            uint64_t v6 = 3121;
            break;
          case 46305:
            uint64_t v6 = 3122;
            break;
          case 46306:
            uint64_t v6 = 3123;
            break;
          case 46307:
            uint64_t v6 = 3124;
            break;
          case 46308:
            uint64_t v6 = 3125;
            break;
          case 46309:
            uint64_t v6 = 3126;
            break;
          case 46310:
            uint64_t v6 = 3127;
            break;
          case 46311:
            uint64_t v6 = 5408;
            break;
          case 46312:
            uint64_t v6 = 3128;
            break;
          case 46313:
            uint64_t v6 = 3168;
            break;
          default:
            uint64_t v26 = 46201;
            uint64_t v27 = 3203;
            BOOL v28 = v5 == 46202;
            uint64_t v29 = 3204;
LABEL_82:
            if (!v28) {
              uint64_t v29 = -1;
            }
            if (v5 == v26) {
              uint64_t v6 = v27;
            }
            else {
              uint64_t v6 = v29;
            }
            break;
        }
      }
      else
      {
        switch(v5)
        {
          case 46501:
            uint64_t v6 = 3129;
            break;
          case 46502:
            goto LABEL_88;
          case 46503:
            uint64_t v6 = 3130;
            break;
          case 46504:
            uint64_t v6 = 3131;
            break;
          case 46505:
            uint64_t v6 = 3132;
            break;
          case 46506:
            uint64_t v6 = 3133;
            break;
          case 46507:
            uint64_t v6 = 3134;
            break;
          case 46508:
            uint64_t v6 = 3135;
            break;
          case 46509:
            uint64_t v6 = 3136;
            break;
          case 46510:
            uint64_t v6 = 3137;
            break;
          case 46511:
            uint64_t v6 = 3138;
            break;
          case 46512:
            uint64_t v6 = 3139;
            break;
          case 46513:
            uint64_t v6 = 3140;
            break;
          case 46514:
            uint64_t v6 = 3141;
            break;
          case 46515:
            uint64_t v6 = 3144;
            break;
          case 46516:
            uint64_t v6 = 3305;
            break;
          case 46517:
            uint64_t v6 = 3149;
            break;
          case 46518:
            uint64_t v6 = 3150;
            break;
          case 46519:
            uint64_t v6 = 3151;
            break;
          case 46520:
            uint64_t v6 = 3152;
            break;
          case 46521:
            uint64_t v6 = 3153;
            break;
          case 46522:
            uint64_t v6 = 3154;
            break;
          case 46523:
            uint64_t v6 = 3155;
            break;
          case 46524:
            uint64_t v6 = 3156;
            break;
          case 46525:
            uint64_t v6 = 3157;
            break;
          case 46526:
            uint64_t v6 = 5417;
            break;
          case 46527:
            uint64_t v6 = 5418;
            break;
          default:
            goto LABEL_15;
        }
      }
    }
    else if (v5 > 45001)
    {
      if (v5 > 46100)
      {
        switch(v5)
        {
          case 46101:
            uint64_t v6 = 5401;
            break;
          case 46102:
            uint64_t v6 = 5402;
            break;
          case 46103:
            uint64_t v6 = 5403;
            break;
          case 46104:
            uint64_t v6 = 5404;
            break;
          case 46105:
            uint64_t v6 = 5405;
            break;
          case 46106:
            uint64_t v6 = 5406;
            break;
          case 46107:
            uint64_t v6 = 5407;
            break;
          case 46108:
            uint64_t v6 = 3117;
            break;
          case 46109:
            uint64_t v6 = 5424;
            break;
          case 46110:
            uint64_t v6 = 5425;
            break;
          case 46111:
            uint64_t v6 = 3201;
            break;
          default:
            goto LABEL_15;
        }
      }
      else
      {
        switch(v5)
        {
          case 45998:
          case 45999:
            uint64_t v6 = 9999;
            break;
          case 46000:
            goto LABEL_15;
          case 46001:
            uint64_t v6 = 5409;
            break;
          case 46002:
            goto LABEL_96;
          case 46003:
            uint64_t v6 = 3116;
            break;
          case 46004:
LABEL_95:
            uint64_t v6 = 5103;
            break;
          case 46005:
            uint64_t v6 = 5106;
            break;
          case 46006:
            uint64_t v6 = 5410;
            break;
          case 46007:
            uint64_t v6 = 5411;
            break;
          case 46008:
            uint64_t v6 = 5412;
            break;
          case 46009:
            uint64_t v6 = 5413;
            break;
          case 46010:
            uint64_t v6 = 5414;
            break;
          case 46011:
            uint64_t v6 = 5415;
            break;
          case 46012:
            uint64_t v6 = 5416;
            break;
          case 46013:
            uint64_t v6 = 5419;
            break;
          case 46014:
            uint64_t v6 = 5420;
            break;
          case 46015:
            uint64_t v6 = 5421;
            break;
          case 46016:
            uint64_t v6 = 5422;
            break;
          case 46017:
            uint64_t v6 = 5423;
            break;
          case 46018:
            uint64_t v6 = 5426;
            break;
          case 46019:
          case 46020:
LABEL_79:
            uint64_t v6 = 3146;
            break;
          default:
            uint64_t v26 = 45002;
            uint64_t v27 = 3311;
            BOOL v28 = v5 == 45702;
            uint64_t v29 = 3300;
            goto LABEL_82;
        }
      }
    }
    else if (v5 > 42000)
    {
      if (v5 > 43002)
      {
        if (v5 > 44003)
        {
          if (v5 == 44004)
          {
            uint64_t v6 = 5105;
          }
          else if (v5 == 45001)
          {
            uint64_t v6 = 3112;
          }
        }
        else if (v5 == 43003)
        {
          uint64_t v6 = 4303;
        }
        else if (v5 == 44003)
        {
          uint64_t v6 = 5104;
        }
      }
      else if (v5 > 43000)
      {
        if (v5 == 43001) {
LABEL_96:
        }
          uint64_t v6 = 4301;
        else {
LABEL_88:
        }
          uint64_t v6 = 4302;
      }
      else if (v5 == 42001)
      {
        uint64_t v6 = 4201;
      }
      else if (v5 == 42002)
      {
        uint64_t v6 = 4202;
      }
    }
    else
    {
      switch(v5)
      {
        case 41002:
          uint64_t v6 = 4103;
          break;
        case 41004:
          uint64_t v6 = 3110;
          break;
        case 41005:
          uint64_t v6 = 3111;
          break;
        case 41006:
          uint64_t v6 = 3103;
          break;
        case 41007:
          uint64_t v6 = 3104;
          break;
        case 41009:
          uint64_t v6 = 5101;
          break;
        case 41010:
        case 41011:
          uint64_t v6 = 5102;
          break;
        case 41012:
          uint64_t v6 = 3109;
          break;
        case 41013:
          uint64_t v6 = 3106;
          break;
        case 41014:
          goto LABEL_95;
        case 41015:
          uint64_t v6 = 3108;
          break;
        case 41017:
          uint64_t v6 = 3115;
          break;
        case 41018:
          uint64_t v6 = 3142;
          break;
        case 41019:
          uint64_t v6 = 3143;
          break;
        case 41020:
          uint64_t v6 = 3145;
          break;
        case 41021:
          goto LABEL_79;
        case 41022:
          uint64_t v6 = 3147;
          break;
        case 41023:
          uint64_t v6 = 3158;
          break;
        case 41024:
          uint64_t v6 = 3159;
          break;
        case 41025:
          uint64_t v6 = 3160;
          break;
        case 41026:
          uint64_t v6 = 3161;
          break;
        case 41027:
          uint64_t v6 = 3162;
          break;
        case 41028:
          uint64_t v6 = 3163;
          break;
        case 41029:
          uint64_t v6 = 3165;
          break;
        case 41030:
          uint64_t v6 = 3166;
          break;
        case 41031:
          uint64_t v6 = 3167;
          break;
        default:
          goto LABEL_15;
      }
    }
    goto LABEL_15;
  }
  uint64_t v8 = [v2 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F8C520]];

  if (v9)
  {
    uint64_t v10 = [v2 code];
    uint64_t v11 = 3169;
    if (v10 != 9) {
      uint64_t v11 = -1;
    }
    if (v10 == 6) {
      uint64_t v6 = 3164;
    }
    else {
      uint64_t v6 = v11;
    }
    goto LABEL_15;
  }
  uint64_t v14 = [v2 domain];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F59778]];

  if (!v15)
  {
    uint64_t v17 = [v2 domain];
    int v18 = [v17 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (v18)
    {
      if ([v2 code] != -1009 || !dyld_program_sdk_at_least())
      {
        int v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F28A50];
        v33[0] = v2;
        uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v21 = (void **)v33;
        uint64_t v22 = &v32;
LABEL_51:
        id v25 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
        uint64_t v7 = [v19 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v25];

        goto LABEL_17;
      }
    }
    else
    {
      id v23 = [v2 domain];
      int v24 = [v23 isEqualToString:@"PHPhotosErrorDomain"];

      if (!v24)
      {
        int v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *MEMORY[0x1E4F28A50];
        long long v31 = v2;
        uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v21 = &v31;
        uint64_t v22 = &v30;
        goto LABEL_51;
      }
    }
    id v12 = v2;
    goto LABEL_16;
  }
  uint64_t v16 = [v2 code];
  if (v16 <= 81)
  {
    if ((unint64_t)(v16 - 80) < 2)
    {
      if (dyld_program_sdk_at_least()) {
        uint64_t v6 = 3169;
      }
      else {
        uint64_t v6 = -1;
      }
      goto LABEL_15;
    }
    if (v16 == 51)
    {
      uint64_t v6 = 3306;
      goto LABEL_15;
    }
    goto LABEL_66;
  }
  if (v16 != 82)
  {
    if (v16 == 1013)
    {
      uint64_t v6 = 3170;
LABEL_15:
      _PHErrorByCopyingUserInfoFromError(v2, v6);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      uint64_t v7 = v12;
      goto LABEL_17;
    }
LABEL_66:
    uint64_t v6 = -1;
    goto LABEL_15;
  }
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_66;
  }
  uint64_t v7 = PLUnderlyingErrorThatHasDomainAndCode();
  if (!v7) {
    goto LABEL_66;
  }
LABEL_17:

  return v7;
}

id _PHErrorByCopyingUserInfoFromError(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = [v3 userInfo];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  [v6 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

  uint64_t v7 = *MEMORY[0x1E4F28228];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];

  if (!v8)
  {
    int v9 = NSStringFromPHErrorCode(a2);
    [v6 setObject:v9 forKeyedSubscript:v7];
  }
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:a2 userInfo:v6];

  return v10;
}

id PHNetworkAccessAllowedRequiredError()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"Retry with networkAccessAllowed = YES";
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = objc_msgSend(v0, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3164, v1);

  return v2;
}

id PHStreamingDeniedError()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28228];
  v5[0] = @"Retry with streamingAllowed = NO";
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = objc_msgSend(v0, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3306, v1);

  return v2;
}

id PHPublicErrorFromError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  id v3 = [v1 domain];
  if (![v3 isEqualToString:*MEMORY[0x1E4F59778]])
  {

    goto LABEL_8;
  }
  if ([v2 code] != 1005)
  {
    uint64_t v5 = [v2 code];

    if (v5 == 1006) {
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v6 = [v2 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v7 = [v2 code];

      if (v7 == 3072) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    int v9 = PHErrorFromPLError(v2);
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = [v9 domain];
    uint64_t v13 = [v9 code];
    uint64_t v14 = [v9 userInfo];
    uint64_t v4 = objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", v11, v13, v14);

    goto LABEL_13;
  }

LABEL_10:
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  int v9 = [v2 domain];
  uint64_t v10 = [v2 code];
  uint64_t v11 = [v2 userInfo];
  uint64_t v4 = objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", v9, v10, v11);
LABEL_13:

LABEL_14:

  return v4;
}

void sub_19B26FF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42548(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42549(uint64_t a1)
{
}

void sub_19B270E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19B2726B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B272918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B2737FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42932(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42933(uint64_t a1)
{
}

void sub_19B277914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t __Block_byref_object_copy__43404(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43405(uint64_t a1)
{
}

void sub_19B277E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43698(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43699(uint64_t a1)
{
}

id _objectIDForObject(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 objectID];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_19B27A4A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19B27A800(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19B27C188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__44067(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__44068(uint64_t a1)
{
}

uint64_t PLImageManagerRecordEnabled()
{
  if (PLImageManagerRecordEnabled_onceToken != -1) {
    dispatch_once(&PLImageManagerRecordEnabled_onceToken, &__block_literal_global_44193);
  }
  return PLImageManagerRecordEnabled_s_enabled;
}

void __PLImageManagerRecordEnabled_block_invoke()
{
  uint64_t v0 = PLImageManagerGetLog();
  PLImageManagerRecordEnabled_s_enabled = os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);
}

void sub_19B27F224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__44562(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__44563(uint64_t a1)
{
}

void sub_19B27FCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_19B28000C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B281CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B2828D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B283198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t hasValidFullSizePhoto(unsigned int a1)
{
  if ((a1 & 2) != 0 && (a1 & 0x45044) != 0x45044)
  {
    if ((a1 & 0x80) == 0) {
      return 0;
    }
    return (a1 >> 5) & 1;
  }
  uint64_t v1 = 0;
  if ((~a1 & 0x84) == 0 && (a1 & 0x2AE0A) != 0x2AE0A) {
    return (a1 >> 5) & 1;
  }
  return v1;
}

void sub_19B287084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PHSignpostEventsEnabled()
{
  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  return PHSignpostEventsEnabled_eventsEnabled;
}

uint64_t PHImageManagerSignpostRequestStateFromRecipeID(int a1)
{
  if (a1 <= 131074)
  {
    int v2 = a1 - 65737;
    uint64_t result = 70;
    switch(v2)
    {
      case 0:
        return result;
      case 2:
        uint64_t result = 71;
        break;
      case 4:
        uint64_t result = 72;
        break;
      case 6:
        uint64_t result = 73;
        break;
      default:
        return 51;
    }
  }
  else if (a1 > 131271)
  {
    switch(a1)
    {
      case 131272:
        return 100;
      case 131275:
        return 101;
      case 131277:
        return 102;
      default:
        return 51;
    }
  }
  else
  {
    switch(a1)
    {
      case 131075:
        uint64_t result = 80;
        break;
      case 131077:
        uint64_t result = 81;
        break;
      case 131079:
        uint64_t result = 82;
        break;
      case 131081:
        uint64_t result = 83;
        break;
      default:
        return 51;
    }
  }
  return result;
}

uint64_t PHFetchSignpostsEnabled()
{
  return kdebug_is_enabled();
}

void sub_19B28AFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B28B1C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19B28B3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45666(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__45667(uint64_t a1)
{
}

void sub_19B28DE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45870(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__45871(uint64_t a1)
{
}

void sub_19B28F0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__46079(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__46080(uint64_t a1)
{
}

void sub_19B28F728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__46116(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__46117(uint64_t a1)
{
}

__CFString *PHChoosingPolicyName(unint64_t a1)
{
  if (a1 > 4) {
    return @"best";
  }
  else {
    return off_1E5848458[a1];
  }
}

uint64_t _indexOfGainMapInContainer(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  AuxiliaryImageCountForIndedouble x = CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndex();
  if (AuxiliaryImageCountForIndex)
  {
    uint64_t v4 = AuxiliaryImageCountForIndex;
    uint64_t v5 = PLImageManagerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = (int)v4;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to get aux image count, %ld", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a2) {
    *a2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

uint64_t _auxImageOrientation()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  Auxiliaryint ImageGeometryForIndex = CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndex();
  if (!AuxiliaryImageGeometryForIndex) {
    return 1;
  }
  int v1 = AuxiliaryImageGeometryForIndex;
  int v2 = PLImageManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v5 = v1;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to read aux image orientation, default to Up, %ld", buf, 0xCu);
  }

  return 1;
}

void _figReadImageProperties(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = CMPhotoDecompressionContainerCopyImagePropertiesForIndex();
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = PLImageManagerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = v4;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to read image properties, %ld", buf, 0xCu);
    }

    uint64_t v6 = 0;
    if (a2)
    {
LABEL_5:
      *a2 = [v6 hdrGainMapPercentageValue];
    }
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithImageProperties:0 contentType:0 timeZoneLookup:0];
    if (!v6)
    {
      uint64_t v7 = PLImageManagerGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - Failed to read gain map average pixel luminance", buf, 2u);
      }
    }
    CFRelease(0);
    if (a2) {
      goto LABEL_5;
    }
  }
}

uint64_t PHRequestRetryTypeForRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (PHErrorIsXPCConnectionInvalidOrInterrupted(v4))
  {
    uint64_t v5 = 2;
  }
  else
  {
    if (!PLErrorOrUnderlyingErrorHasDomainAndCode())
    {
      uint64_t v5 = 0;
      goto LABEL_9;
    }
    uint64_t v5 = 3;
  }
  if ((unint64_t)[v3 fetchIncrementRetryAttemptCount] > 2) {
    uint64_t v5 = 1;
  }
LABEL_9:

  return v5;
}

void sub_19B2940D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 176), 8);
  _Block_object_dispose((const void *)(v36 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__47118(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__47119(uint64_t a1)
{
}

__CFString *_PHDownloadIntentName(unint64_t a1)
{
  if (a1 >= 0xD)
  {
    int v2 = [NSNumber numberWithInteger:a1];
    int v1 = [v2 stringValue];
  }
  else
  {
    int v1 = off_1E5848BA8[a1];
  }

  return v1;
}

__CFString *_PHDownloadPriorityName(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      int v1 = @"preload";
    }
    else
    {
      int v2 = [NSNumber numberWithInteger:a1];
      int v1 = [v2 stringValue];
    }
  }
  else
  {
    int v1 = @"on-demand";
  }

  return v1;
}

__CFString *_PHStreamingVideoIntentName(unint64_t a1)
{
  if (a1 >= 7)
  {
    int v2 = [NSNumber numberWithInteger:a1];
    int v1 = [v2 stringValue];
  }
  else
  {
    int v1 = off_1E5848B70[a1];
  }

  return v1;
}

uint64_t ___getNextLayoutID_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int v1 = (void *)s_availableLayoutIDs;
  s_availableLayoutIDs = (uint64_t)v0;

  int v2 = (void *)s_availableLayoutIDs;

  return objc_msgSend(v2, "addIndexesInRange:", 1, 100);
}

void sub_19B29A824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__48264(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48265(uint64_t a1)
{
}

uint64_t _getNextLayoutID()
{
  if (_getNextLayoutID_onceToken != -1) {
    dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  uint64_t v0 = [(id)s_availableLayoutIDs firstIndex];
  if (v0 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v1 = 101;
  }
  else
  {
    uint64_t v1 = v0;
    [(id)s_availableLayoutIDs removeIndex:v0];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  return v1;
}

uint64_t PHRequestOptionsDownloadIntentIsExplicitUserAction(unint64_t a1)
{
  return (a1 < 0xD) & (0x238u >> a1);
}

void sub_19B29F7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__48564(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48565(uint64_t a1)
{
}

void sub_19B2A1C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

unint64_t PFAssetBundleMediaTypeFromPHAssetMediaType(unint64_t result)
{
  if (result >= 4) {
    return 1;
  }
  return result;
}

uint64_t PFAssetBundleMediaSubtypesFromPHAssetMediaSubtypes(unint64_t a1)
{
  return (a1 >> 1) & 0x20 | a1 & 0x3F031F | (((a1 >> 10) & 1) << 22);
}

uint64_t PFAssetBundlePlaybackStyleFromPHAssetPlaybackStyle(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5) {
    return 0;
  }
  return result;
}

uint64_t PFAssetBundlePlaybackVariationFromPHAssetPlaybackVariation(int a1)
{
  if ((a1 - 1) < 3) {
    return (unsigned __int16)(a1 - 1) + 1;
  }
  else {
    return 0;
  }
}

uint64_t PFAssetBundleVideoComplementVisibilityStateFromPHVideoComplementVisibilityState(char a1)
{
  return a1 & 0xF;
}

void sub_19B2A31B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19B2A4678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t _oidsContainEntity(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "entity", (void)v12);
        char v10 = [v9 isKindOfEntity:v4];

        if (v10)
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __Block_byref_object_copy__49293(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__49294(uint64_t a1)
{
}

void sub_19B2A4C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19B2A58F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_19B2A69BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

uint64_t sub_19B2A9750()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_19B2A9760()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_19B2A9770()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_19B2A9780()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_19B2A9790()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_19B2A97A0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_19B2A97B0()
{
  return MEMORY[0x1F4183C08]();
}

uint64_t sub_19B2A97C0()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_19B2A97D0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_19B2A97E0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_19B2A97F0()
{
  return MEMORY[0x1F40D7060]();
}

uint64_t sub_19B2A9800()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_19B2A9810()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_19B2A9820()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_19B2A9830()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_19B2A9840()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_19B2A9850()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_19B2A9860()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_19B2A9870()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_19B2A9880()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_19B2A9890()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_19B2A98A0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_19B2A98B0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_19B2A98C0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_19B2A98F0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_19B2A9900()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_19B2A9910()
{
  return MEMORY[0x1F4185EF8]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
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

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8A0](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x1F40DA9B0](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageIsDecodable()
{
  return MEMORY[0x1F40E9788]();
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x1F40DA9F8]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9908](isrc, index, auxiliaryImageDataType);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9930](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9958]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E9A00](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x1F40DAB18]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x1F40DB590]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CMPhotoDecompressionContainerCancelAsyncRequest()
{
  return MEMORY[0x1F410D710]();
}

uint64_t CMPhotoDecompressionContainerCopyAuxiliaryImageTypeURNForIndex()
{
  return MEMORY[0x1F410D748]();
}

uint64_t CMPhotoDecompressionContainerCopyImagePropertiesForIndex()
{
  return MEMORY[0x1F410D790]();
}

uint64_t CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex()
{
  return MEMORY[0x1F410D7C0]();
}

uint64_t CMPhotoDecompressionContainerDecodeAuxiliaryImageForIndexAsyncF()
{
  return MEMORY[0x1F410D820]();
}

uint64_t CMPhotoDecompressionContainerDecodeImageForIndexAsyncF()
{
  return MEMORY[0x1F410D830]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndex()
{
  return MEMORY[0x1F410D850]();
}

uint64_t CMPhotoDecompressionContainerGetAuxiliaryImageGeometryForIndex()
{
  return MEMORY[0x1F410D868]();
}

uint64_t CMPhotoDecompressionContainerGetImageGeometryForIndex()
{
  return MEMORY[0x1F410D8B0]();
}

uint64_t CMPhotoDecompressionCreateCGImageForIndex()
{
  return MEMORY[0x1F410D918]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1F410D968]();
}

uint64_t CMPhotoDecompressionSessionReserveRequestID()
{
  return MEMORY[0x1F410D998]();
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

uint64_t CPAnalyticsLog()
{
  return MEMORY[0x1F410DBC8]();
}

uint64_t CPLPrimaryScopeIdentifierForCurrentUniverse()
{
  return MEMORY[0x1F4111F68]();
}

uint64_t CPLStatusFromPathManager()
{
  return MEMORY[0x1F413F400]();
}

uint64_t DCIM_CGImageRefFromPLImage()
{
  return MEMORY[0x1F413F940]();
}

uint64_t DCIM_NSStringFromCGRect()
{
  return MEMORY[0x1F413F958]();
}

uint64_t DCIM_NSStringFromCGSize()
{
  return MEMORY[0x1F413F960]();
}

uint64_t DCIM_NSValueFromCGRect()
{
  return MEMORY[0x1F413F968]();
}

uint64_t DCIM_NSValueFromCGSize()
{
  return MEMORY[0x1F413F970]();
}

uint64_t DCIM_NSValueToCGRect()
{
  return MEMORY[0x1F413F978]();
}

uint64_t DCIM_NSValueToCGSize()
{
  return MEMORY[0x1F413F980]();
}

uint64_t DCIM_applicationDidReceiveMemoryWarningNotificationName()
{
  return MEMORY[0x1F413F998]();
}

uint64_t DCIM_boundsFromScreen()
{
  return MEMORY[0x1F413F9C8]();
}

uint64_t DCIM_newPLImageWithCGImage()
{
  return MEMORY[0x1F413FA00]();
}

uint64_t DCIM_newPLImageWithContentsOfFile()
{
  return MEMORY[0x1F413FA08]();
}

uint64_t DCIM_newPLImageWithContentsOfFileURL()
{
  return MEMORY[0x1F413FA10]();
}

uint64_t DCIM_newPLImageWithData()
{
  return MEMORY[0x1F413FA18]();
}

uint64_t DCIM_newPLImageWithStoredJPEGData()
{
  return MEMORY[0x1F413FA28]();
}

uint64_t DCIM_newPNGRepresentationWithPLImage()
{
  return MEMORY[0x1F413FA30]();
}

uint64_t DCIM_newResizablePLImageWithCGImage()
{
  return MEMORY[0x1F413FA38]();
}

uint64_t DCIM_orientationFromPLImage()
{
  return MEMORY[0x1F413FA40]();
}

uint64_t DCIM_scaleFromScreen()
{
  return MEMORY[0x1F413FA60]();
}

uint64_t DCIM_scaleImageFromURL()
{
  return MEMORY[0x1F413FA68]();
}

uint64_t DCIM_sizeFromPLImage()
{
  return MEMORY[0x1F413FA70]();
}

uint64_t DCIM_sizeScale()
{
  return MEMORY[0x1F413FA78]();
}

uint64_t DCIM_sizeScaleToFillSize()
{
  return MEMORY[0x1F413FA80]();
}

uint64_t DCIM_sizeScaleToFitSize()
{
  return MEMORY[0x1F413FA88]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSHashRemove(NSHashTable *table, const void *pointer)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x1F40E7220](aString);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x1F4140660]();
}

uint64_t PFDeviceLockScreenFocusAreaRectNormalized()
{
  return MEMORY[0x1F4140668]();
}

uint64_t PFDeviceScreenSize()
{
  return MEMORY[0x1F4140678]();
}

uint64_t PFFigCopyImageDataToURLWithUpdatedProperties()
{
  return MEMORY[0x1F4140698]();
}

uint64_t PFFigGetImageSourceImageIndexForContainerItemID()
{
  return MEMORY[0x1F41406D0]();
}

uint64_t PFIsLivePhotoBundleType()
{
  return MEMORY[0x1F41406F8]();
}

uint64_t PFMap()
{
  return MEMORY[0x1F413F338]();
}

uint64_t PFMethodNotImplementedException()
{
  return MEMORY[0x1F413F340]();
}

uint64_t PFMutableArrayShuffleWithRandomNumberGenerator()
{
  return MEMORY[0x1F4140708]();
}

uint64_t PFOrientationInverse()
{
  return MEMORY[0x1F4140710]();
}

uint64_t PFReadPairingIdentifierFromImageAtPath()
{
  return MEMORY[0x1F4140798]();
}

uint64_t PFSceneTaxonomyNodeDetectorsCount()
{
  return MEMORY[0x1F41407B0]();
}

uint64_t PFSceneTaxonomyNodeName()
{
  return MEMORY[0x1F41407E8]();
}

uint64_t PFSceneTaxonomyNodeNetworkId()
{
  return MEMORY[0x1F41407F0]();
}

uint64_t PFSceneTaxonomyNodeSearchThreshold()
{
  return MEMORY[0x1F41407F8]();
}

uint64_t PFSceneTaxonomyNodeVisitDetectors()
{
  return MEMORY[0x1F4140808]();
}

uint64_t PFSharedFigDecodeSession()
{
  return MEMORY[0x1F4140818]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x1F413F388]();
}

uint64_t PFStoryColorGradeKindDefaultForColorGradeCategory()
{
  return MEMORY[0x1F4140848]();
}

uint64_t PFStoryColorGradeKindToString()
{
  return MEMORY[0x1F4140850]();
}

uint64_t PFStoryTitleCategoryGetSerializedTitleCategory()
{
  return MEMORY[0x1F41408B0]();
}

uint64_t PFStoryValidatedTitleCategory()
{
  return MEMORY[0x1F41408B8]();
}

uint64_t PFStringFromDateTimeZoneFormat()
{
  return MEMORY[0x1F41408C0]();
}

uint64_t PFVideoComplementMetadataForVideoAVAssetWithKnownValues()
{
  return MEMORY[0x1F41408E0]();
}

uint64_t PFVideoComplementMetadataForVideoAtPath()
{
  return MEMORY[0x1F41408E8]();
}

uint64_t PLAbstractMethodException()
{
  return MEMORY[0x1F413FAA8]();
}

uint64_t PLApproximateResourceSizeFromScale()
{
  return MEMORY[0x1F413F418]();
}

uint64_t PLArrayFromEnumeration()
{
  return MEMORY[0x1F413F420]();
}

uint64_t PLArrayFromXPCDictionary()
{
  return MEMORY[0x1F413FAF0]();
}

uint64_t PLArrayFromXPCObject()
{
  return MEMORY[0x1F413FAF8]();
}

uint64_t PLAssetAnalysisGetLog()
{
  return MEMORY[0x1F413FB00]();
}

uint64_t PLAssetImportGetLog()
{
  return MEMORY[0x1F413FB20]();
}

uint64_t PLAssetKindPredicateForTaskID()
{
  return MEMORY[0x1F413F428]();
}

uint64_t PLAttachmentIndexFromMessagesSyndicationID()
{
  return MEMORY[0x1F413F430]();
}

uint64_t PLAvailabilityRequestGetLog()
{
  return MEMORY[0x1F413FB38]();
}

uint64_t PLBackendGetLog()
{
  return MEMORY[0x1F413FB40]();
}

uint64_t PLBackendSharingGetLog()
{
  return MEMORY[0x1F413FB48]();
}

uint64_t PLBundleIdentifier()
{
  return MEMORY[0x1F413FB68]();
}

uint64_t PLCGRectIsNormalized()
{
  return MEMORY[0x1F413FB70]();
}

uint64_t PLCGSizeScaledToFitSize()
{
  return MEMORY[0x1F413FB78]();
}

uint64_t PLCacheMetricsCollectorGetLog()
{
  return MEMORY[0x1F413FB90]();
}

uint64_t PLChangeHandlingGetLog()
{
  return MEMORY[0x1F413FBC0]();
}

uint64_t PLConvertMercuryUUIDString()
{
  return MEMORY[0x1F413FC10]();
}

uint64_t PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers()
{
  return MEMORY[0x1F413F4A8]();
}

uint64_t PLCreateCGImageFromIOSurface()
{
  return MEMORY[0x1F413FC18]();
}

uint64_t PLCreateIOSurfaceFromXPCDictionary()
{
  return MEMORY[0x1F413FC38]();
}

uint64_t PLCreateImageWithFormatFromImage()
{
  return MEMORY[0x1F413FC48]();
}

uint64_t PLCreateShortLivedPhotoLibraryWithPhotoLibraryURL()
{
  return MEMORY[0x1F413F4B8]();
}

uint64_t PLCreateShortLivedWellKnownPhotoLibrary()
{
  return MEMORY[0x1F413F4C0]();
}

uint64_t PLDataFromManagedObjectID()
{
  return MEMORY[0x1F413FC80]();
}

uint64_t PLDataFromXPCDataObject()
{
  return MEMORY[0x1F413FC88]();
}

uint64_t PLDataFromXPCDictionary()
{
  return MEMORY[0x1F413FC90]();
}

uint64_t PLDataStoreForClassIDAndLibraryID()
{
  return MEMORY[0x1F413F4D0]();
}

uint64_t PLDataStoreHasClassID()
{
  return MEMORY[0x1F413F4D8]();
}

uint64_t PLDateFromXPCDictionary()
{
  return MEMORY[0x1F413FC98]();
}

uint64_t PLDateFromXPCObject()
{
  return MEMORY[0x1F413FCA0]();
}

uint64_t PLDebugStringForSearchIndexCategory()
{
  return MEMORY[0x1F413F4E0]();
}

uint64_t PLDescriptionForPhotosHighlightKind()
{
  return MEMORY[0x1F413F4F0]();
}

uint64_t PLDescriptionForPhotosHighlightType()
{
  return MEMORY[0x1F413F4F8]();
}

uint64_t PLDictionaryFromXPCDictionary()
{
  return MEMORY[0x1F413FCC8]();
}

uint64_t PLDictionaryFromXPCObject()
{
  return MEMORY[0x1F413FCD0]();
}

uint64_t PLDiffArrays()
{
  return MEMORY[0x1F413F510]();
}

uint64_t PLErrorOrUnderlyingErrorHasDomainAndCode()
{
  return MEMORY[0x1F413FD10]();
}

uint64_t PLErrorOrUnderlyingErrorMatchesCodesByDomain()
{
  return MEMORY[0x1F413FD18]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x1F413FD20]();
}

uint64_t PLExifOrientationSwapsWidthAndHeight()
{
  return MEMORY[0x1F413FD28]();
}

uint64_t PLFetchPerformanceGetLog()
{
  return MEMORY[0x1F413FD30]();
}

uint64_t PLGatekeeperXPCGetLog()
{
  return MEMORY[0x1F413FD48]();
}

uint64_t PLGetOrientationAndUntransformedSizeFromImageData()
{
  return MEMORY[0x1F413F530]();
}

uint64_t PLGetOrientationAndUntransformedSizeFromImageURL()
{
  return MEMORY[0x1F413F538]();
}

uint64_t PLGetSandboxExtensionToken()
{
  return MEMORY[0x1F413FD50]();
}

uint64_t PLGetSandboxExtensionTokenIfPossible()
{
  return MEMORY[0x1F413FD60]();
}

uint64_t PLHasInternalDiagnostics()
{
  return MEMORY[0x1F413FD88]();
}

uint64_t PLImageManagerGetLog()
{
  return MEMORY[0x1F413FDA8]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x1F413FDB8]();
}

uint64_t PLImportGetLog()
{
  return MEMORY[0x1F413FDD8]();
}

uint64_t PLImportantFetchGetLog()
{
  return MEMORY[0x1F413FDE0]();
}

uint64_t PLInternalPredicateForMediaProcessingTaskID()
{
  return MEMORY[0x1F413F558]();
}

uint64_t PLIsAssetsd()
{
  return MEMORY[0x1F413FE00]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x1F413FE10]();
}

uint64_t PLIsErrorEqualToCode()
{
  return MEMORY[0x1F413FE58]();
}

uint64_t PLIsErrorFileNotFound()
{
  return MEMORY[0x1F413FE60]();
}

uint64_t PLIsErrorOrUnderlyingErrorFileNotFound()
{
  return MEMORY[0x1F413FE70]();
}

uint64_t PLIsErrorXPCConnectionInvalid()
{
  return MEMORY[0x1F413FE80]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x1F413FE88]();
}

uint64_t PLIsForegroundApplication()
{
  return MEMORY[0x1F413FE90]();
}

uint64_t PLIsInternalTool()
{
  return MEMORY[0x1F413FE98]();
}

uint64_t PLIsLimitedLibraryClient()
{
  return MEMORY[0x1F413FEA0]();
}

uint64_t PLIsMobileSlideShow()
{
  return MEMORY[0x1F413FEC0]();
}

uint64_t PLIsPhotoanalysisd()
{
  return MEMORY[0x1F413FEF0]();
}

uint64_t PLIsPhotosAppAnyPlatform()
{
  return MEMORY[0x1F413FF00]();
}

uint64_t PLIsProcessWithAppleBundleIdentifier()
{
  return MEMORY[0x1F413FF20]();
}

uint64_t PLIsResourceMarkedFullSizeFromRecipeID()
{
  return MEMORY[0x1F413F568]();
}

uint64_t PLIsXcTest()
{
  return MEMORY[0x1F413FF80]();
}

uint64_t PLLibraryBundleGetLog()
{
  return MEMORY[0x1F413FF98]();
}

uint64_t PLLibraryIDFromPathManager()
{
  return MEMORY[0x1F413FFA0]();
}

uint64_t PLLibraryScopeAssetGetAddToSharedZoneStateFromShareStateValue()
{
  return MEMORY[0x1F413F578]();
}

uint64_t PLLibraryScopeAssetGetRejectedByPhotosSuggesterFromShareStateValue()
{
  return MEMORY[0x1F413F588]();
}

uint64_t PLLibraryScopeAssetGetSuggestedByClientTypeFromShareStateValue()
{
  return MEMORY[0x1F413F590]();
}

uint64_t PLLibraryScopeAssetGetUserManuallyRejectedStateFromShareStateValue()
{
  return MEMORY[0x1F413F5A0]();
}

uint64_t PLLibraryScopeAssetRemoveSuggestedByClientType()
{
  return MEMORY[0x1F413F5A8]();
}

uint64_t PLLibraryScopeAssetResetValues()
{
  return MEMORY[0x1F413F5B0]();
}

uint64_t PLLibraryScopeAssetSetAddToSharedZoneState()
{
  return MEMORY[0x1F413F5B8]();
}

uint64_t PLLibraryScopeAssetSetPhotosSuggesterRejectedState()
{
  return MEMORY[0x1F413F5C0]();
}

uint64_t PLLibraryScopeAssetSetSuggestedByClientType()
{
  return MEMORY[0x1F413F5C8]();
}

uint64_t PLLibraryScopeAssetSetUserManuallyAddedState()
{
  return MEMORY[0x1F413F5D0]();
}

uint64_t PLLibraryScopeAssetSetUserManuallyRejectedState()
{
  return MEMORY[0x1F413F5D8]();
}

uint64_t PLLivePhotoPlaybackGetLog()
{
  return MEMORY[0x1F413FFB8]();
}

uint64_t PLLocalizedFrameworkString()
{
  return MEMORY[0x1F413FFC8]();
}

uint64_t PLLocalizedNameWithFirstAndLastName()
{
  return MEMORY[0x1F413FFE8]();
}

uint64_t PLMakeIndicatorFileExistAtPath()
{
  return MEMORY[0x1F4140000]();
}

uint64_t PLManagedAssetDecodeFaceRegions()
{
  return MEMORY[0x1F413F5F8]();
}

uint64_t PLManagedAssetDeferredProcessingNeededDescription()
{
  return MEMORY[0x1F413F600]();
}

uint64_t PLManagedAssetDeferredProcessingNeededRequiresImmediateProcessing()
{
  return MEMORY[0x1F413F608]();
}

uint64_t PLManagedAssetDeferredProcessingNeededRequiresPhotoFinalization()
{
  return MEMORY[0x1F413F610]();
}

uint64_t PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewState()
{
  return MEMORY[0x1F413F618]();
}

uint64_t PLManagedAssetPredicateToFetchAllAssetsInLibraryScopePreviewStateWithSuggestedByClientType()
{
  return MEMORY[0x1F413F620]();
}

uint64_t PLManagedAssetPredicateToFetchAssetsSuggestedForSharing()
{
  return MEMORY[0x1F413F628]();
}

uint64_t PLManagedAssetVideoDeferredProcessingNeededRequiresVideoFinalization()
{
  return MEMORY[0x1F413F638]();
}

uint64_t PLManagedObjectIDFromData()
{
  return MEMORY[0x1F4140008]();
}

uint64_t PLManagedObjectIDFromXPCValue()
{
  return MEMORY[0x1F4140010]();
}

uint64_t PLMemoriesAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1F413F640]();
}

uint64_t PLMemoriesGetLog()
{
  return MEMORY[0x1F4140018]();
}

uint64_t PLMethodNotImplementedException()
{
  return MEMORY[0x1F4140020]();
}

uint64_t PLMillisecondDateFormatter()
{
  return MEMORY[0x1F4140030]();
}

uint64_t PLNormalizedCGRectToInt64()
{
  return MEMORY[0x1F4140050]();
}

uint64_t PLObjectIsEqual()
{
  return MEMORY[0x1F4140060]();
}

uint64_t PLOptimizedInternalPredicateForMediaProcessingTaskID()
{
  return MEMORY[0x1F413F658]();
}

uint64_t PLOrientationInverse()
{
  return MEMORY[0x1F413F670]();
}

uint64_t PLOrientationIsValid()
{
  return MEMORY[0x1F413F678]();
}

uint64_t PLOrientationMakeTransformWithSize()
{
  return MEMORY[0x1F413F680]();
}

uint64_t PLOrientationTransformImageSize()
{
  return MEMORY[0x1F413F690]();
}

uint64_t PLPTPGetLog()
{
  return MEMORY[0x1F4140078]();
}

uint64_t PLPhotoEditGetLog()
{
  return MEMORY[0x1F41400B8]();
}

uint64_t PLPhotoKitGetLog()
{
  return MEMORY[0x1F41400C0]();
}

uint64_t PLPhotoKitIngestGetLog()
{
  return MEMORY[0x1F41400C8]();
}

uint64_t PLPhotoLibraryIdentifierDecodeIdentifierPropertiesFromArchivalStringRepresentation()
{
  return MEMORY[0x1F413F6A0]();
}

uint64_t PLPhotoLibraryIdentifierEncodeArchivalStringRepresentationFromIdentifierProperties()
{
  return MEMORY[0x1F413F6A8]();
}

uint64_t PLPhotoLibraryServicesFrameworkBundle()
{
  return MEMORY[0x1F41400E0]();
}

uint64_t PLPhotoSharingGetLog()
{
  return MEMORY[0x1F41400F0]();
}

uint64_t PLPhotosAccessAllowed()
{
  return MEMORY[0x1F41400F8]();
}

uint64_t PLPhotosHighlightTypeIsConsideredTrip()
{
  return MEMORY[0x1F413F6B8]();
}

uint64_t PLPhotosObjectLifecycleGetLog()
{
  return MEMORY[0x1F4140110]();
}

uint64_t PLPhotosSearchGetLog()
{
  return MEMORY[0x1F4140120]();
}

uint64_t PLPhotosStatusGetLog()
{
  return MEMORY[0x1F4140128]();
}

uint64_t PLPlatformEagerlyFetchFaceRegions()
{
  return MEMORY[0x1F4140170]();
}

uint64_t PLPlatformExtendedAttributesSupported()
{
  return MEMORY[0x1F4140178]();
}

uint64_t PLPlatformPhotosAccessLoggingSupported()
{
  return MEMORY[0x1F41401C0]();
}

uint64_t PLPreviewImageAndDurationForVideoAtPath()
{
  return MEMORY[0x1F413F6D0]();
}

uint64_t PLPrimaryDataStoreKeyStrategyFromData()
{
  return MEMORY[0x1F413F6D8]();
}

uint64_t PLPrimaryResourceDataStoreReferenceFileURL()
{
  return MEMORY[0x1F413F6E0]();
}

uint64_t PLProcessingPredicateForTaskID()
{
  return MEMORY[0x1F413F6E8]();
}

uint64_t PLQualitySortValueFromResourceDimensions()
{
  return MEMORY[0x1F413F6F8]();
}

uint64_t PLResetMediaProcessingStateOnAsset()
{
  return MEMORY[0x1F413F730]();
}

uint64_t PLResourceIdentityShortDescription()
{
  return MEMORY[0x1F413F738]();
}

uint64_t PLResourceIsDerivedFromDeferredProcessingPreviewImage()
{
  return MEMORY[0x1F413F740]();
}

uint64_t PLResourceRecipeIDDescription()
{
  return MEMORY[0x1F413F758]();
}

uint64_t PLResourceRecipeIDIsCPLImageDerivative()
{
  return MEMORY[0x1F413F760]();
}

uint64_t PLResourceRecipeIDIsValidForFullSizeRenderVirtualResource()
{
  return MEMORY[0x1F413F768]();
}

uint64_t PLResourceRecipeIsFullSizeDeferredProcessingPreview()
{
  return MEMORY[0x1F413F770]();
}

uint64_t PLResultWithUnfairLock()
{
  return MEMORY[0x1F4140258]();
}

uint64_t PLRunWithUnfairLock()
{
  return MEMORY[0x1F4140260]();
}

uint64_t PLSAggregateDictionaryAddValueForScalarKey()
{
  return MEMORY[0x1F413F790]();
}

uint64_t PLSafeEntityForNameInManagedObjectContext()
{
  return MEMORY[0x1F413F7D0]();
}

uint64_t PLSafeInsertNewObjectForEntityForNameInManagedObjectContext()
{
  return MEMORY[0x1F413F7D8]();
}

uint64_t PLSafeResultWithUnfairLock()
{
  return MEMORY[0x1F4140268]();
}

uint64_t PLSafeRunWithUnfairLock()
{
  return MEMORY[0x1F4140270]();
}

uint64_t PLSearchBackendInitialSuggestionsGetLog()
{
  return MEMORY[0x1F41402C0]();
}

uint64_t PLSearchBackendQueryGetLog()
{
  return MEMORY[0x1F41402F0]();
}

uint64_t PLSearchBackendRecentSuggestionsGetLog()
{
  return MEMORY[0x1F41402F8]();
}

uint64_t PLSearchBackendResultProcessingGetLog()
{
  return MEMORY[0x1F4140300]();
}

uint64_t PLSearchBackendSceneTaxonomyGetLog()
{
  return MEMORY[0x1F4140308]();
}

uint64_t PLSearchContributorUUIDFromLookupIdentifier()
{
  return MEMORY[0x1F413F7F0]();
}

uint64_t PLSearchFileProtectionTypes()
{
  return MEMORY[0x1F413F7F8]();
}

uint64_t PLSearchHumanActionIdentifierFromLookupIdentifier()
{
  return MEMORY[0x1F413F808]();
}

uint64_t PLSearchJSONForCSEmbedding()
{
  return MEMORY[0x1F413F830]();
}

uint64_t PLSearchNaturalLanguageInitialSuggestionsSupportedForLocale()
{
  return MEMORY[0x1F413F850]();
}

uint64_t PLSearchSceneIdentifierFromLookupIdentifier()
{
  return MEMORY[0x1F413F858]();
}

uint64_t PLSearchSemanticSearchQueriesSupported()
{
  return MEMORY[0x1F413F868]();
}

uint64_t PLSearchSuggestionCategoriesTypeForSearchIndexCategory()
{
  return MEMORY[0x1F413F878]();
}

uint64_t PLSearchUIQueryGetLog()
{
  return MEMORY[0x1F4140328]();
}

uint64_t PLSearchableIdentifierFromMessagesSyndicationID()
{
  return MEMORY[0x1F413F880]();
}

uint64_t PLSearchableUniqueIdentifierHashFromSearchableIdentifier()
{
  return MEMORY[0x1F413F888]();
}

uint64_t PLSendCoreAnalyticEvent()
{
  return MEMORY[0x1F4140330]();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return MEMORY[0x1F4140340]();
}

uint64_t PLSharedStreamsResourceTypeIsHighestQuality()
{
  return MEMORY[0x1F413F8A0]();
}

uint64_t PLShortDescriptionForWorkerType()
{
  return MEMORY[0x1F413F8A8]();
}

uint64_t PLShortObjectIDFromURL()
{
  return MEMORY[0x1F413F8B0]();
}

uint64_t PLShortStringFromQoSClass()
{
  return MEMORY[0x1F4140398]();
}

uint64_t PLShouldBoostLogLevelForResourceRecipeID()
{
  return MEMORY[0x1F413F8B8]();
}

uint64_t PLShouldConstructDisplayNameForAppBundle()
{
  return MEMORY[0x1F413F8C0]();
}

uint64_t PLSizeMake()
{
  return MEMORY[0x1F41403B8]();
}

uint64_t PLSplitToCGRectFromInt64()
{
  return MEMORY[0x1F41403C0]();
}

uint64_t PLSplitToDoubleFromInt64()
{
  return MEMORY[0x1F41403C8]();
}

uint64_t PLStringFromQoSClass()
{
  return MEMORY[0x1F4140410]();
}

uint64_t PLStringFromXPCDictionary()
{
  return MEMORY[0x1F4140430]();
}

uint64_t PLStringUUIDComponents()
{
  return MEMORY[0x1F413F8D0]();
}

uint64_t PLSyndicatedDisplayNameForAppBundle()
{
  return MEMORY[0x1F413F8D8]();
}

uint64_t PLSyndicationGetLog()
{
  return MEMORY[0x1F4140450]();
}

uint64_t PLTableThumbnailRecipeIDFromFormatID()
{
  return MEMORY[0x1F413F8E8]();
}

uint64_t PLThumbnailsGetLog()
{
  return MEMORY[0x1F4140460]();
}

uint64_t PLURLFromXPCDictionary()
{
  return MEMORY[0x1F4140498]();
}

uint64_t PLUUIDFromLocalMercuryLocalIdentifier()
{
  return MEMORY[0x1F41404B0]();
}

uint64_t PLUnderlyingErrorThatHasDomainAndCode()
{
  return MEMORY[0x1F41404C0]();
}

uint64_t PLUnderlyingErrorWithDomain()
{
  return MEMORY[0x1F41404C8]();
}

uint64_t PLUpNextGetLog()
{
  return MEMORY[0x1F41404D8]();
}

uint64_t PLUserFeedbackGetLog()
{
  return MEMORY[0x1F41404E8]();
}

uint64_t PLValidatedSavedAssetTypeApplies()
{
  return MEMORY[0x1F4140508]();
}

uint64_t PLValidatedSavedAssetTypeDescription()
{
  return MEMORY[0x1F4140510]();
}

uint64_t PLVideoResourceDescription()
{
  return MEMORY[0x1F413F8F0]();
}

uint64_t PLWriteImageWithEmbeddedThumbnailToPath()
{
  return MEMORY[0x1F413F8F8]();
}

uint64_t PLXPCArrayAppendManagedObjectID()
{
  return MEMORY[0x1F4140530]();
}

uint64_t PLXPCDictionarySetArray()
{
  return MEMORY[0x1F4140538]();
}

uint64_t PLXPCDictionarySetData()
{
  return MEMORY[0x1F4140540]();
}

uint64_t PLXPCDictionarySetDate()
{
  return MEMORY[0x1F4140548]();
}

uint64_t PLXPCDictionarySetDictionary()
{
  return MEMORY[0x1F4140550]();
}

uint64_t PLXPCDictionarySetIOSurface()
{
  return MEMORY[0x1F4140558]();
}

uint64_t PLXPCDictionarySetManagedObjectID()
{
  return MEMORY[0x1F4140560]();
}

uint64_t PLXPCDictionarySetString()
{
  return MEMORY[0x1F4140568]();
}

uint64_t PLXPCDictionarySetURL()
{
  return MEMORY[0x1F4140570]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1F413F3B0]();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1F417E000]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1F417E040]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1F417E080]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1F417E0A8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1F417E110]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1F417E118]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1F417E120]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1F417E148]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1F417E158]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x1F417E180]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1F417E1E0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1F417E1E8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1F417E1F0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1F417E1F8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1F417E208]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1F417E210]();
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x1F4181580](cls, sel);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BC0](crc, buf, *(void *)&len);
}

uint64_t diffOrderedSets()
{
  return MEMORY[0x1F413F900]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1F40CBE28]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void exit(int a1)
{
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1F40CC310](a1, a2, *(void *)&a3);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t imageDataFromImageRef()
{
  return MEMORY[0x1F413F908]();
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1F40CC6F0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pl_dispatch_async()
{
  return MEMORY[0x1F41405A8]();
}

uint64_t pl_dispatch_once()
{
  return MEMORY[0x1F41405D0]();
}

uint64_t pl_dispatch_source_set_event_handler()
{
  return MEMORY[0x1F41405E8]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x1F41405F0]();
}

uint64_t pl_notify_register_dispatch()
{
  return MEMORY[0x1F4140600]();
}

uint64_t pl_result_with_autoreleasepool()
{
  return MEMORY[0x1F4140610]();
}

uint64_t plsGreenTeaEnabled()
{
  return MEMORY[0x1F413F918]();
}

uint64_t plslogGreenTea()
{
  return MEMORY[0x1F413F928]();
}

uint64_t plslogGreenTeaReadingPhotosOrVideos()
{
  return MEMORY[0x1F413F930]();
}

uint64_t plslogGreenTeaTransmittingPhotosOrVideos()
{
  return MEMORY[0x1F413F938]();
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1F40CDB90](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file_to_self()
{
  return MEMORY[0x1F40CDE18]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
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

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1F40CED30]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEA0](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
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

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}