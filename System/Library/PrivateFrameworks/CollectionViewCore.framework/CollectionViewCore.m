void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_20BE20E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20BE20F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<_NSRange>::__assign_with_size[abi:nn180100]<_NSRange*,_NSRange*>(void *result, char *__src, char *a3, unint64_t a4)
{
  v6 = __src;
  v7 = result;
  uint64_t v8 = result[2];
  v9 = (char *)*result;
  if (a4 > (v8 - *result) >> 4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60) {
      goto LABEL_23;
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    unint64_t v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v10;
    if (v11 >> 60) {
LABEL_23:
    }
      abort();
    result = std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v11);
    v9 = (char *)result;
    void *v7 = result;
    v7[1] = result;
    v7[2] = &result[2 * v12];
    size_t v13 = a3 - v6;
    if (v13) {
      result = memmove(result, v6, v13);
    }
    v14 = (void **)(v7 + 1);
    goto LABEL_22;
  }
  v14 = (void **)(result + 1);
  v15 = (unsigned char *)result[1];
  unint64_t v16 = (v15 - v9) >> 4;
  if (v16 >= a4)
  {
    size_t v13 = a3 - __src;
    if (a3 == __src) {
      goto LABEL_22;
    }
    v18 = (void *)*result;
LABEL_21:
    result = memmove(v18, __src, v13);
    goto LABEL_22;
  }
  v17 = &__src[16 * v16];
  if (v15 != v9)
  {
    result = memmove((void *)*result, __src, v15 - v9);
    v9 = (char *)*v14;
  }
  size_t v13 = a3 - v17;
  if (v13)
  {
    v18 = v9;
    __src = v17;
    goto LABEL_21;
  }
LABEL_22:
  void *v14 = &v9[v13];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(16 * a1);
}

uint64_t CVCIs__NSOrderedSetI(void *a1)
{
  id v1 = a1;
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  }
  if (qword_26AA4C098) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t __objectEqual(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [(id)v3 isEqual:v4];
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

void _CVCDirectionalInsetsForInsetsAlongAxis(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v1 = [MEMORY[0x263F08690] currentHandler];
    v2 = objc_msgSend(NSString, "stringWithUTF8String:", "CVCDirectionalEdgeInsets _CVCDirectionalInsetsForInsetsAlongAxis(CVCDirectionalEdgeInsets, CVCAxis)");
    [v1 handleFailureInFunction:v2 file:@"CollectionViewCoreGeometry.m" lineNumber:25 description:@"Unknown axis provided."];
  }
}

void _UIDiffableDataSourceInsertIdentifiersAtIndex(void *a1, void *a2, unint64_t a3, int a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  if ([v7 count] < a3)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIDiffableDataSourceInsertIdentifiersAtIndex(NSMutableOrderedSet *__strong _Nonnull, NSOrderedSet *__strong _Nonnull, NSUInteger, BOOL)");
    [v18 handleFailureInFunction:v19, @"_UIDiffableDataSourceState.m", 109, @"Invalid parameter not satisfying: %@", @"insertionIndex <= identifiers.count" file lineNumber description];
  }
  uint64_t v9 = [v7 count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = a3 - v9;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        unint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        if (([v10 containsObject:v16] & 1) == 0)
        {
          if ([v16 isEqual:v16]) {
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(v16, a4);
          }
          else {
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(v16, a4);
          }
        }
        objc_msgSend(v7, "insertObject:atIndex:", v16, v13 + objc_msgSend(v7, "count"));
        ++v15;
      }
      while (v12 != v15);
      uint64_t v17 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v12 = v17;
    }
    while (v17);
  }
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

void sub_20BE2277C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _compLayoutLog()
{
  if (qword_26AA4C088 != -1) {
    dispatch_once(&qword_26AA4C088, &__block_literal_global);
  }
  v0 = (void *)_MergedGlobals_22;
  return v0;
}

void sub_20BE24870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20BE24F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BE252C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20BE25338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _UIDataSourceSnapshotterCommonInit(void *a1, void *a2, void *a3)
{
  v27 = a1;
  unint64_t v5 = a2;
  id v6 = a3;
  if (v5 | (unint64_t)v6)
  {
    if (v5)
    {
      int64_t v7 = [(id)v5 _dataSourceNumberOfSections];
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIDataSourceSnapshotterCommonInit(_UIDataSourceSnapshotter *__strong, __strong id<_UICollectionDataSourceBackedView>, __strong _UIDataSourceSnapshotterSectionCountsProvider)");
    [v8 handleFailureInFunction:v9, @"_UIDataSourceSnapshotter.mm", 94, @"Invalid parameter not satisfying: %@", @"dataSourceBackedView != nil || sectionCountsProvider != nil" file lineNumber description];
  }
  int64_t v7 = (*((uint64_t (**)(id, uint64_t))v6 + 2))(v6, -1);
LABEL_6:
  int64_t v10 = v7;
  if (v7 >= 1)
  {
    uint64_t v11 = v27 + 1;
    std::vector<_NSRange>::reserve(v27 + 1, v7);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      if (v5) {
        uint64_t v14 = [(id)v5 _dataSourceNumberOfItemsInSection:v12];
      }
      else {
        uint64_t v14 = (*((uint64_t (**)(id, uint64_t))v6 + 2))(v6, v12);
      }
      uint64_t v15 = v14;
      uint64_t v17 = (char *)v27[2];
      unint64_t v16 = (unint64_t)v27[3];
      if ((unint64_t)v17 >= v16)
      {
        v19 = (char *)*v11;
        uint64_t v20 = (v17 - (unsigned char *)*v11) >> 4;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60) {
          abort();
        }
        uint64_t v22 = v16 - (void)v19;
        if (v22 >> 3 > v21) {
          unint64_t v21 = v22 >> 3;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v23);
          v19 = (char *)v27[1];
          uint64_t v17 = (char *)v27[2];
        }
        else
        {
          uint64_t v24 = 0;
        }
        uint64_t v25 = (void *)(v23 + 16 * v20);
        *uint64_t v25 = v13;
        v25[1] = v15;
        v26 = v25;
        if (v17 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
            v26 -= 2;
            v17 -= 16;
          }
          while (v17 != v19);
          v19 = (char *)*v11;
        }
        v18 = v25 + 2;
        v27[1] = v26;
        v27[2] = v25 + 2;
        v27[3] = (void *)(v23 + 16 * v24);
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        *(void *)uint64_t v17 = v13;
        *((void *)v17 + 1) = v14;
        v18 = v17 + 16;
      }
      v27[2] = v18;
      v13 += v15;
      ++v12;
    }
    while (v12 != v10);
  }
}

void sub_20BE25594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::vector<_NSRange>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      abort();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v4 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(a2);
    unint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF0];
    int64_t v7 = &v4[16 * v6];
    uint64_t v9 = (char *)*a1;
    id v8 = (char *)a1[1];
    int64_t v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        *((_OWORD *)v10 - 1) = *((_OWORD *)v8 - 1);
        v10 -= 16;
        v8 -= 16;
      }
      while (v8 != v9);
      id v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

double _CVCRectAnchorPointForUnitAnchorPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  double v11 = MinX + a5 * CGRectGetWidth(v13);
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  CGRectGetHeight(v15);
  return v11;
}

CGFloat _CVCRectAdjustWithAnchorPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9 = (a5 + -0.5) * CGRectGetWidth(*(CGRect *)&a1);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetHeight(v11);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetWidth(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetHeight(v13);
  return a1 - v9;
}

void sub_20BE270CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _UIDiffableDataSourceApplyInsertUpdate(void *a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  v104 = v10;
  v105 = v9;
  v103 = v11;
  v106 = v12;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v18 handleFailureInFunction:v19, @"_UIDiffableDataSourceUpdate.m", 191, @"Invalid parameter not satisfying: %@", @"update" file lineNumber description];

    id v9 = 0;
    id v11 = v103;
    if (v10)
    {
LABEL_3:
      if (v11) {
        goto LABEL_4;
      }
LABEL_14:
      uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
      unint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v22 handleFailureInFunction:v23, @"_UIDiffableDataSourceUpdate.m", 193, @"Invalid parameter not satisfying: %@", @"itemIdentifiers" file lineNumber description];

      id v9 = v105;
      id v11 = v103;
      if (v12) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
  unint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  [v20 handleFailureInFunction:v21, @"_UIDiffableDataSourceUpdate.m", 192, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" file lineNumber description];

  id v9 = v105;
  id v11 = v103;
  if (!v103) {
    goto LABEL_14;
  }
LABEL_4:
  if (v12) {
    goto LABEL_5;
  }
LABEL_15:
  uint64_t v24 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  [v24 handleFailureInFunction:v25, @"_UIDiffableDataSourceUpdate.m", 194, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot" file lineNumber description];

  id v9 = v105;
  id v11 = v103;
LABEL_5:
  uint64_t v13 = [v12 numberOfItems];
  if (v13 != [v11 count])
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    v27 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v26 handleFailureInFunction:v27, @"_UIDiffableDataSourceUpdate.m", 195, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot.numberOfItems == itemIdentifiers.count" file lineNumber description];

    id v9 = v105;
    id v11 = v103;
  }
  uint64_t v14 = [v12 numberOfSections];
  if (v14 != [v10 count])
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v28 handleFailureInFunction:v29, @"_UIDiffableDataSourceUpdate.m", 196, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot.numberOfSections == sectionIdentifiers.count" file lineNumber description];

    id v9 = v105;
    id v11 = v103;
  }
  if ([v9 action])
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    v31 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v30 handleFailureInFunction:v31, @"_UIDiffableDataSourceUpdate.m", 197, @"Invalid parameter not satisfying: %@", @"update.action == _CVCCollectionUpdateActionInsert" file lineNumber description];

    id v9 = v105;
    id v11 = v103;
    if (a5) {
      goto LABEL_11;
    }
  }
  else if (a5)
  {
LABEL_11:
    id v15 = objc_alloc(MEMORY[0x263EFF980]);
    unint64_t v16 = [v9 identifiers];
    uint64_t v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

    v108 = (void *)v17;
    id v102 = (id)v17;
    id v9 = v105;
    id v11 = v103;
    goto LABEL_18;
  }
  v108 = 0;
  id v102 = (id)MEMORY[0x263EFFA68];
LABEL_18:
  if ([v9 isSectionOperation])
  {
    v32 = [v9 destinationIdentifier];
    v33 = v104;
    if (v32) {
      uint64_t v34 = [v104 indexOfObject:v32];
    }
    else {
      uint64_t v34 = [v104 count];
    }
    unint64_t v64 = v34;
    if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v80 = [MEMORY[0x263F08690] currentHandler];
      v81 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v80 handleFailureInFunction:v81, @"_UIDiffableDataSourceUpdate.m", 206, @"Invalid parameter not satisfying: %@", @"insertIndex != NSNotFound" file lineNumber description];

      v33 = v104;
    }
    if ([v105 relativePosition] == 1 && v64 < objc_msgSend(v33, "count")) {
      ++v64;
    }
    v65 = [v105 identifiers];
    uint64_t v66 = [v65 count];

    v67 = v12;
    if (v66 >= 1)
    {
      unint64_t v68 = v64;
      do
      {
        [v67 _insertSection:v68 withInitialCount:0];
        if (a5)
        {
          v69 = [MEMORY[0x263F088C8] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:v68];
          _CVCUpdateItemAlloc();
          v70 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithInitialIndexPath:0 finalIndexPath:v69 updateAction:0];
          [v108 addObject:v70];

          v67 = v12;
        }
        ++v68;
        --v66;
      }
      while (v66);
    }
    v71 = (void *)[v104 copy];
    uint64_t v72 = [v104 count];
    v73 = [v105 identifiers];
    _UIDiffableDataSourceInsertIdentifiersAtIndex(v104, v73, v64, 0);

    uint64_t v74 = [v104 count];
    v75 = [v105 identifiers];
    uint64_t v76 = v74 - v72;
    uint64_t v77 = [v75 count];

    if (v76 != v77)
    {
      id v82 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      v83 = [v105 identifiers];
      uint64_t v84 = [v83 countByEnumeratingWithState:&v134 objects:v140 count:16];
      if (v84)
      {
        uint64_t v85 = *(void *)v135;
        do
        {
          for (uint64_t i = 0; i != v84; ++i)
          {
            if (*(void *)v135 != v85) {
              objc_enumerationMutation(v83);
            }
            uint64_t v87 = *(void *)(*((void *)&v134 + 1) + 8 * i);
            if ([v71 containsObject:v87]) {
              [v82 addObject:v87];
            }
          }
          uint64_t v84 = [v83 countByEnumeratingWithState:&v134 objects:v140 count:16];
        }
        while (v84);
      }

      if ([v82 count]) {
        BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(v82, 0);
      }
      _UIDiffableDataSourceValidateIdentifiers(v104, 0);
      v88 = [v105 identifiers];
      _UIDiffableDataSourceValidateIdentifiers(v88, 0);
    }
  }
  else
  {
    uint64_t v128 = 0;
    v129 = &v128;
    uint64_t v130 = 0x3032000000;
    v131 = __Block_byref_object_copy__0;
    v132 = __Block_byref_object_dispose__0;
    id v133 = 0;
    v124[0] = MEMORY[0x263EF8330];
    v124[1] = 3221225472;
    v124[2] = ___UIDiffableDataSourceApplyInsertUpdate_block_invoke;
    v124[3] = &unk_2640B2E30;
    v127 = &v128;
    id v35 = v11;
    id v125 = v35;
    id v36 = v9;
    id v126 = v36;
    uint64_t v37 = MEMORY[0x21053FCB0](v124);
    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = ___UIDiffableDataSourceApplyInsertUpdate_block_invoke_2;
    v117[3] = &unk_2640B2E58;
    id v38 = v36;
    id v118 = v38;
    id v96 = v104;
    id v119 = v96;
    id v39 = (id)v37;
    id v122 = v39;
    id v107 = v12;
    id v120 = v107;
    id v40 = v35;
    id v121 = v40;
    v123 = &v128;
    v101 = (uint64_t (**)(void))MEMORY[0x21053FCB0](v117);
    v41 = (void *)[v40 copy];
    v100 = (void *)[v107 copy];
    uint64_t v42 = v101[2]();
    v43 = [v38 identifiers];
    LOBYTE(v37) = v42 == [v43 count];

    if ((v37 & 1) == 0)
    {
      id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
      v94 = v40;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      v45 = [v38 identifiers];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v113 objects:v139 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v114;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v114 != v47) {
              objc_enumerationMutation(v45);
            }
            uint64_t v49 = *(void *)(*((void *)&v113 + 1) + 8 * j);
            if ([v41 containsObject:v49]) {
              [v44 addObject:v49];
            }
          }
          uint64_t v46 = [v45 countByEnumeratingWithState:&v113 objects:v139 count:16];
        }
        while (v46);
      }

      id v40 = v94;
      if ([v44 count]) {
        BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(v44, 1);
      }
      [v94 removeAllObjects];
      _UIDiffableDataSourceInsertIdentifiersAtIndex(v94, v41, 0, 1);
      v50 = (void *)v129[5];
      v129[5] = 0;

      [v107 _resetToStateOfSnapshotter:v100];
      v51 = [[_UIDiffableDataSourceUpdate alloc] initWithItemIdentifiers:v44 action:1];
      v52 = _UIDiffableDataSourceApplyDeleteUpdate(v51, v96, v94, v107, a5);
      if (a5) {
        [v108 addObjectsFromArray:v52];
      }
      uint64_t v42 = v101[2]();
    }
    v53 = [v38 identifiers];
    BOOL v54 = v42 == [v53 count];

    if (!v54)
    {
      _UIDiffableDataSourceValidateIdentifiers(v40, 1);
      v89 = [v38 identifiers];
      _UIDiffableDataSourceValidateIdentifiers(v89, 1);

      v90 = [MEMORY[0x263F08690] currentHandler];
      v99 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      v91 = [v38 identifiers];
      uint64_t v95 = [v91 count];
      v92 = [v38 identifiers];
      v93 = (void *)[v92 mutableCopy];

      [v93 minusOrderedSet:v40];
      [v90 handleFailureInFunction:v99, @"_UIDiffableDataSourceUpdate.m", 378, @"Diffable data source internal inconsistency: attempted to insert %ld identifiers but only %ld inserted. Identifiers that failed to insert: %@", v95, v42, v93 file lineNumber description];
    }
    if (a5)
    {
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v55 = [v38 identifiers];
      uint64_t v56 = [v55 countByEnumeratingWithState:&v109 objects:v138 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v110;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v110 != v57) {
              objc_enumerationMutation(v55);
            }
            uint64_t v59 = (*((uint64_t (**)(id, void))v39 + 2))(v39, *(void *)(*((void *)&v109 + 1) + 8 * k));
            if (v59 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v97 = [MEMORY[0x263F08690] currentHandler];
              v62 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
              [v97 handleFailureInFunction:v62, @"_UIDiffableDataSourceUpdate.m", 385, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" file lineNumber description];
            }
            v60 = [v107 indexPathForGlobalIndex:v59];
            if (!v60)
            {
              v98 = [MEMORY[0x263F08690] currentHandler];
              v63 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
              [v98 handleFailureInFunction:v63, @"_UIDiffableDataSourceUpdate.m", 387, @"Invalid parameter not satisfying: %@", @"indexPath" file lineNumber description];
            }
            _CVCUpdateItemAlloc();
            v61 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithInitialIndexPath:0 finalIndexPath:v60 updateAction:0];
            [v108 addObject:v61];
          }
          uint64_t v56 = [v55 countByEnumeratingWithState:&v109 objects:v138 count:16];
        }
        while (v56);
      }
    }
    _Block_object_dispose(&v128, 8);
  }
  id v78 = v102;

  return v78;
}

void sub_20BE28DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

id _CVCUpdateItemAlloc()
{
  v0 = (objc_class *)CollectionUpdateItemClass;
  if (!CollectionUpdateItemClass)
  {
    int64_t v3 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v4 = [NSString stringWithUTF8String:"id<_CVCCollectionUpdateItem> _CVCUpdateItemAlloc(void)"];
    [v3 handleFailureInFunction:v4, @"_UIDiffableDataSourceUpdate.m", 47, @"Invalid parameter not satisfying: %@", @"CollectionUpdateItemClass != nil" file lineNumber description];

    v0 = (objc_class *)CollectionUpdateItemClass;
  }
  id v1 = [v0 alloc];
  return v1;
}

uint64_t _ensureOrderedSetsHaveGuaranteedPerformanceBeforeCopyingState(void *a1)
{
  id v1 = a1;
  char v2 = objc_opt_respondsToSelector();
  if (v2) {
    [v1 ensureOrderedSetsHaveGuaranteedPerformance];
  }

  return v2 & 1;
}

void sub_20BE297A0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

id _UIDiffableDataSourceApplyDeleteUpdate(void *a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  v71 = v9;
  uint64_t v72 = v8;
  v73 = v10;
  uint64_t v76 = v11;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v52 = [MEMORY[0x263F08690] currentHandler];
    v53 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v52 handleFailureInFunction:v53, @"_UIDiffableDataSourceUpdate.m", 403, @"Invalid parameter not satisfying: %@", @"update" file lineNumber description];

    id v8 = 0;
    id v10 = v73;
    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_4;
      }
LABEL_57:
      uint64_t v56 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v57 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v56 handleFailureInFunction:v57, @"_UIDiffableDataSourceUpdate.m", 405, @"Invalid parameter not satisfying: %@", @"itemIdentifiers" file lineNumber description];

      id v8 = v72;
      id v10 = v73;
      if (v11) {
        goto LABEL_5;
      }
      goto LABEL_58;
    }
  }
  BOOL v54 = [MEMORY[0x263F08690] currentHandler];
  v55 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  [v54 handleFailureInFunction:v55, @"_UIDiffableDataSourceUpdate.m", 404, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" file lineNumber description];

  id v8 = v72;
  id v10 = v73;
  if (!v73) {
    goto LABEL_57;
  }
LABEL_4:
  if (v11) {
    goto LABEL_5;
  }
LABEL_58:
  v58 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v59 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  [v58 handleFailureInFunction:v59, @"_UIDiffableDataSourceUpdate.m", 406, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot" file lineNumber description];

  id v8 = v72;
  id v10 = v73;
LABEL_5:
  uint64_t v12 = [v11 numberOfItems];
  if (v12 != [v10 count])
  {
    v60 = [MEMORY[0x263F08690] currentHandler];
    v61 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v60 handleFailureInFunction:v61, @"_UIDiffableDataSourceUpdate.m", 407, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot.numberOfItems == itemIdentifiers.count" file lineNumber description];

    id v8 = v72;
    id v10 = v73;
  }
  uint64_t v13 = [v11 numberOfSections];
  if (v13 != [v9 count])
  {
    v62 = [MEMORY[0x263F08690] currentHandler];
    v63 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v62 handleFailureInFunction:v63, @"_UIDiffableDataSourceUpdate.m", 408, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot.numberOfSections == sectionIdentifiers.count" file lineNumber description];

    id v8 = v72;
    id v10 = v73;
  }
  uint64_t v14 = v11;
  if ([v8 action] != 1)
  {
    unint64_t v64 = [MEMORY[0x263F08690] currentHandler];
    v65 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v64 handleFailureInFunction:v65, @"_UIDiffableDataSourceUpdate.m", 409, @"Invalid parameter not satisfying: %@", @"update.action == _CVCCollectionUpdateActionDelete" file lineNumber description];

    id v8 = v72;
    id v10 = v73;
    uint64_t v14 = v11;
  }
  if (a5)
  {
    id v15 = objc_alloc(MEMORY[0x263EFF980]);
    unint64_t v16 = [v8 identifiers];
    id v17 = (id)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

    id v8 = v72;
    if ([v72 isDeleteAll])
    {
      uint64_t v18 = [v76 numberOfSections];
      if (v18 < 1)
      {
        id v70 = v17;
      }
      else
      {
        uint64_t v19 = v18;
        uint64_t v20 = v17;
        for (uint64_t i = 0; i != v19; ++i)
        {
          uint64_t v22 = [MEMORY[0x263F088C8] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:i];
          _CVCUpdateItemAlloc();
          unint64_t v23 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithAction:1 forIndexPath:v22];
          [v20 addObject:v23];
        }
        id v17 = v20;
        id v70 = v20;
      }
      id v9 = v71;
      id v10 = v73;
      uint64_t v14 = v76;
      goto LABEL_53;
    }
    id v70 = v17;
    id v10 = v73;
  }
  else
  {
    char v24 = [v8 isDeleteAll];
    id v17 = 0;
    id v70 = (id)MEMORY[0x263EFFA68];
    if (v24)
    {
LABEL_53:
      [v9 removeAllObjects];
      [v10 removeAllObjects];
      [v14 _deleteAllSections];
      goto LABEL_54;
    }
  }
  uint64_t v74 = v17;
  if ([v8 isSectionOperation])
  {
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x3032000000;
    v105 = __Block_byref_object_copy__0;
    v106 = __Block_byref_object_dispose__0;
    id v107 = 0;
    v98[0] = MEMORY[0x263EF8330];
    v98[1] = 3221225472;
    v98[2] = ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke;
    v98[3] = &unk_2640B2E30;
    v101 = &v102;
    id v25 = v9;
    id v99 = v25;
    id v26 = v8;
    id v100 = v26;
    v27 = (uint64_t (**)(void, void))MEMORY[0x21053FCB0](v98);
    id v28 = objc_alloc_init(MEMORY[0x263F089C8]);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v29 = [v26 identifiers];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v94 objects:v110 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v95 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = v27[2](v27, *(void *)(*((void *)&v94 + 1) + 8 * j));
          if (v33 != 0x7FFFFFFFFFFFFFFFLL) {
            [v28 addIndex:v33];
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v94 objects:v110 count:16];
      }
      while (v30);
    }

    [v25 removeObjectsAtIndexes:v28];
    v89[0] = MEMORY[0x263EF8330];
    v89[1] = 3221225472;
    v89[2] = ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_2;
    v89[3] = &unk_2640B2E80;
    id v90 = v76;
    id v91 = v73;
    char v93 = a5;
    id v17 = v74;
    id v92 = v17;
    [v28 enumerateIndexesWithOptions:2 usingBlock:v89];

    _Block_object_dispose(&v102, 8);
  }
  else
  {
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x3032000000;
    v105 = __Block_byref_object_copy__0;
    v106 = __Block_byref_object_dispose__0;
    id v107 = 0;
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_3;
    v85[3] = &unk_2640B2E30;
    v88 = &v102;
    id v68 = v10;
    id v86 = v68;
    id v69 = v8;
    id v87 = v69;
    uint64_t v34 = (uint64_t (**)(void, void))MEMORY[0x21053FCB0](v85);
    id v35 = objc_alloc_init(MEMORY[0x263F08760]);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v36 = [v69 identifiers];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v81 objects:v109 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v82;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v82 != v38) {
            objc_enumerationMutation(v36);
          }
          uint64_t v40 = v34[2](v34, *(void *)(*((void *)&v81 + 1) + 8 * k));
          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v41 = [v76 sectionForGlobalIndex:v40];
            if (v41 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v67 = [MEMORY[0x263F08690] currentHandler];
              uint64_t v66 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyDeleteUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
              [v67 handleFailureInFunction:v66, @"_UIDiffableDataSourceUpdate.m", 490, @"Invalid parameter not satisfying: %@", @"section != NSNotFound" file lineNumber description];
            }
            uint64_t v42 = [NSNumber numberWithInteger:v41];
            [v35 addObject:v42];

            if (a5)
            {
              v43 = [v76 indexPathForGlobalIndex:v40];
              _CVCUpdateItemAlloc();
              id v44 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithAction:1 forIndexPath:v43];
              [v74 addObject:v44];
            }
          }
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v81 objects:v109 count:16];
      }
      while (v37);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v45 = v35;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v77 objects:v108 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v78;
      do
      {
        for (uint64_t m = 0; m != v46; ++m)
        {
          if (*(void *)v78 != v47) {
            objc_enumerationMutation(v45);
          }
          objc_msgSend(v76, "_decrementSectionCount:byCount:", objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * m), "integerValue"), objc_msgSend(v45, "countForObject:", *(void *)(*((void *)&v77 + 1) + 8 * m)));
        }
        uint64_t v46 = [v45 countByEnumeratingWithState:&v77 objects:v108 count:16];
      }
      while (v46);
    }

    uint64_t v49 = [v69 identifiers];
    [v68 minusOrderedSet:v49];

    _Block_object_dispose(&v102, 8);
    id v17 = v74;
  }
LABEL_54:
  id v50 = v70;

  return v50;
}

void sub_20BE2A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_20BE2B058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __CVCForceCastToSnapshotImpl(void *a1)
{
  id v1 = a1;
  return v1;
}

void _CVCDiffableDataSourceInitializeWithUpdateItemClass(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___CVCDiffableDataSourceInitializeWithUpdateItemClass_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = a1;
  if (_CVCDiffableDataSourceInitializeWithUpdateItemClass_onceToken != -1) {
    dispatch_once(&_CVCDiffableDataSourceInitializeWithUpdateItemClass_onceToken, block);
  }
}

uint64_t ___compLayoutLog_block_invoke()
{
  _MergedGlobals_22 = (uint64_t)os_log_create("com.apple.UIKit", "CompositionalLayout");
  return MEMORY[0x270F9A758]();
}

__CFString *_CVCContentInsetsReferenceDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown value: %ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2640B2DC0[a1 - 1];
  }
  return v1;
}

double _CVCTotalEdgeDimensionsForLayoutAxis(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (a1 == 1) {
    return a3 + a5;
  }
  if (a1 == 2) {
    return a2 + a4;
  }
  uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
  int64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat _CVCTotalEdgeDimensionsForLayoutAxis(CVCDirectionalEdgeInsets, CVCAxis)");
  [v6 handleFailureInFunction:v7 file:@"CollectionViewCoreGeometry.m" lineNumber:19 description:@"Unknown axis."];

  return 0.0;
}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(void *a1, int a2)
{
  id v3 = a1;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(__strong id _Nonnull, BOOL)");
    uint64_t v6 = @"a section";
    if (a2) {
      uint64_t v6 = @"an item";
    }
    [v4 handleFailureInFunction:v5, @"_UIDiffableDataSourceHelpers.m", 70, @"Diffable data source detected %@ identifier whose hash value changed. The hash value of an identifier cannot change once it has been added to a snapshot. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for this identifier's type. When fixing your implementation, also remember that two identifiers which are equal must have the same hash value. Identifier returning invalid hash values: %@", v6, v3 file lineNumber description];
  }
  else
  {
    if (a2) {
      int64_t v7 = @"an item";
    }
    else {
      int64_t v7 = @"a section";
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"Diffable data source detected %@ identifier whose hash value changed. The hash value of an identifier cannot change once it has been added to a snapshot. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for this identifier's type. When fixing your implementation, also remember that two identifiers which are equal must have the same hash value. Identifier returning invalid hash values: %@ Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED to catch this in the debugger. This will become an assert in a future version.", v7, v3 format];
  }
}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(void *a1, int a2)
{
  id v3 = a1;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(__strong id _Nonnull, BOOL)");
    uint64_t v6 = @"a section";
    if (a2) {
      uint64_t v6 = @"an item";
    }
    [v4 handleFailureInFunction:v5, @"_UIDiffableDataSourceHelpers.m", 74, @"Diffable data source detected %@ identifier that is not equal to itself. An identifier must compare as equal to the same identifier. You must fix this in the == function (Swift) or -isEqual: method (Objective-C) implementation for this identifier's type. Identifier with invalid equality: %@", v6, v3 file lineNumber description];
  }
  else
  {
    if (a2) {
      int64_t v7 = @"an item";
    }
    else {
      int64_t v7 = @"a section";
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"Diffable data source detected %@ identifier that is not equal to itself. An identifier must compare as equal to the same identifier. You must fix this in the == function (Swift) or -isEqual: method (Objective-C) implementation for this identifier's type. Identifier with invalid equality: %@ Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF to catch this in the debugger. This will become an assert in a future version.", v7, v3 format];
  }
}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    int64_t v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(__strong id _Nonnull, __strong id _Nonnull, BOOL)");
    id v9 = @"section";
    if (a3) {
      id v9 = @"item";
    }
    [v7 handleFailureInFunction:v8, @"_UIDiffableDataSourceHelpers.m", 78, @"Diffable data source detected %@ identifiers that are equal but have different hash values. Two identifiers which compare as equal must return the same hash value. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers. Identifiers that are equal but have different hash values: (%@) and (%@)", v9, v5, v6 file lineNumber description];
  }
  else
  {
    if (a3) {
      id v10 = @"item";
    }
    else {
      id v10 = @"section";
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"Diffable data source detected %@ identifiers that are equal but have different hash values. Two identifiers which compare as equal must return the same hash value. You must fix this in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers. Identifiers that are equal but have different hash values: (%@) and (%@) Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES to catch this in the debugger. This will become an assert in a future version.", v10, v5, v6 format];
  }
}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    int64_t v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE(__strong id _Nonnull, __strong id _Nonnull, BOOL)");
    id v9 = @"section";
    if (a3) {
      id v9 = @"item";
    }
    [v7 handleFailureInFunction:v8, @"_UIDiffableDataSourceHelpers.m", 82, @"Diffable data source detected %@ identifiers that are not unique. You cannot add multiple identifiers to the same snapshot that compare as equal. This probably also means you have an issue in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers, that causes equal identifiers to return different hash values. Identifiers that are not unique: (%@) and (%@)", v9, v5, v6 file lineNumber description];
  }
  else
  {
    if (a3) {
      id v10 = @"item";
    }
    else {
      id v10 = @"section";
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"Diffable data source detected %@ identifiers that are not unique. You cannot add multiple identifiers to the same snapshot that compare as equal. This probably also means you have an issue in the Hashable (Swift) or hash property (Objective-C) implementation for the type of these identifiers, that causes equal identifiers to return different hash values. Identifiers that are not unique: (%@) and (%@) Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE to catch this in the debugger. This will become an assert in a future version.", v10, v5, v6 format];
  }
}

void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(void *a1, int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [v3 count];
  if (a2)
  {
    if (qword_26AA4C0A8 != -1) {
      dispatch_once(&qword_26AA4C0A8, &__block_literal_global_62);
    }
    id v5 = (id)qword_26AA4C0A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v11 = v3;
      if (v4 == 1) {
        uint64_t v12 = @"identifier that already exists";
      }
      else {
        uint64_t v12 = @"identifiers that already exist";
      }
      if (v4 == 1) {
        uint64_t v13 = @"identifier";
      }
      else {
        uint64_t v13 = @"identifiers";
      }
      if (v4 == 1)
      {
        id v11 = [v3 firstObject];
      }
      *(_DWORD *)buf = 134219010;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      id v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      unint64_t v21 = v12;
      __int16 v22 = 2112;
      unint64_t v23 = v11;
      _os_log_error_impl(&dword_20BE1D000, v5, OS_LOG_TYPE_ERROR, "Diffable data source detected an attempt to insert or append %ld item %@ in the snapshot. The existing item %@ will be moved into place instead, but this operation will be more expensive. For best performance, inserted item identifiers should always be unique. Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS to catch this in the debugger. Item %@: %@", buf, 0x34u);
      if (v4 == 1) {
    }
      }
    goto LABEL_19;
  }
  _CVCApplicationIsAppleApp();
  if (dyld_program_sdk_at_least())
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    int64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS(NSArray *__strong _Nonnull, BOOL)");
    if (v4 == 1)
    {
      id v8 = [v3 firstObject];
      [v6 handleFailureInFunction:v7, @"_UIDiffableDataSourceHelpers.m", 99, @"Diffable data source detected an attempt to insert or append %ld section %@ in the snapshot. Identifiers in a snapshot must be unique. Section %@: %@", 1, @"identifier that already exists", @"identifier that already exists", v8 file lineNumber description];
    }
    else
    {
      [v6 handleFailureInFunction:v7, @"_UIDiffableDataSourceHelpers.m", 99, @"Diffable data source detected an attempt to insert or append %ld section %@ in the snapshot. Identifiers in a snapshot must be unique. Section %@: %@", v4, @"identifiers that already exist", @"identifiers that already exist", v3 file lineNumber description];
    }

LABEL_18:
    goto LABEL_19;
  }
  id v9 = (void *)MEMORY[0x263EFF940];
  id v6 = v3;
  if (v4 == 1) {
    id v10 = @"identifier that already exists";
  }
  else {
    id v10 = @"identifiers that already exist";
  }
  if (v4 == 1)
  {
    id v6 = [v3 firstObject];
  }
  [v9 raise:*MEMORY[0x263EFF488], @"Diffable data source detected an attempt to insert or append %ld section %@ in the snapshot. Identifiers in a snapshot must be unique. Section %@: %@ Set a symbolic breakpoint on BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_ALREADY_EXISTS to catch this in the debugger. This will become an assert in a future version.", v4, v10, v10, v6 format];
  if (v4 == 1) {
    goto LABEL_18;
  }
LABEL_19:
}

void _UIDiffableDataSourceValidateIdentifiers(void *a1, int a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = a1;
  unint64_t v3 = [v2 count];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        if (([v10 isEqual:v10] & 1) == 0) {
          BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(v10, a2);
        }
        uint64_t v11 = [v10 hash];
        if (v11 != [v10 hash]) {
          BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(v10, a2);
        }
        if (([v4 containsObject:v10] & 1) == 0)
        {
          if ([v10 isEqual:v10]) {
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_HASH_VALUE_CHANGED(v10, a2);
          }
          else {
            BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIER_IS_NOT_EQUAL_TO_ITSELF(v10, a2);
          }
        }
        unint64_t v12 = ++v7;
        if (v7 < v3)
        {
          do
          {
            id v13 = (id)[v4 objectAtIndexedSubscript:v12];
            if ([v10 isEqual:v13])
            {
              uint64_t v14 = [v10 hash];
              if (v14 != [v13 hash]) {
                BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(v10, v13, a2);
              }
              BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__IDENTIFIERS_ARE_NOT_UNIQUE(v10, v13, a2);
            }
            ++v12;
          }
          while (v12 < v3);
        }
        ++v9;
      }
      while (v9 != v6);
      uint64_t v15 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v15;
    }
    while (v15);
  }
}

void _UIDiffableDataSourceValidateIdentifiersForDiff(void *a1, void *a2, int a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  obuint64_t j = a1;
  id v18 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v9 = v18;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v8 isEqual:v14])
              {
                uint64_t v15 = [v8 hash];
                if (v15 != [v14 hash]) {
                  BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__EQUAL_IDENTIFIERS_HAVE_DIFFERENT_HASH_VALUES(v8, v14, a3);
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }
  _UIDiffableDataSourceValidateIdentifiers(obj, a3);
  _UIDiffableDataSourceValidateIdentifiers(v18, a3);
}

uint64_t ___diffableLog_block_invoke()
{
  qword_26AA4C0A0 = (uint64_t)os_log_create("com.apple.UIKit", "DiffableDataSource");
  return MEMORY[0x270F9A758]();
}

id _UIDiffableDataSourceApplyMoveUpdate(void *a1, void *a2, void *a3, void *a4, int a5)
{
  v92[1] = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v52 = [MEMORY[0x263F08690] currentHandler];
    v53 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v52 handleFailureInFunction:v53, @"_UIDiffableDataSourceUpdate.m", 518, @"Invalid parameter not satisfying: %@", @"update" file lineNumber description];

    if (v10)
    {
LABEL_3:
      if (v11) {
        goto LABEL_4;
      }
LABEL_75:
      uint64_t v56 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v57 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v56 handleFailureInFunction:v57, @"_UIDiffableDataSourceUpdate.m", 520, @"Invalid parameter not satisfying: %@", @"itemIdentifiers" file lineNumber description];

      if (v12) {
        goto LABEL_5;
      }
      goto LABEL_76;
    }
  }
  BOOL v54 = [MEMORY[0x263F08690] currentHandler];
  v55 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  [v54 handleFailureInFunction:v55, @"_UIDiffableDataSourceUpdate.m", 519, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" file lineNumber description];

  if (!v11) {
    goto LABEL_75;
  }
LABEL_4:
  if (v12) {
    goto LABEL_5;
  }
LABEL_76:
  v58 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v59 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  [v58 handleFailureInFunction:v59, @"_UIDiffableDataSourceUpdate.m", 521, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot" file lineNumber description];

LABEL_5:
  uint64_t v13 = [v12 numberOfItems];
  if (v13 != [v11 count])
  {
    v60 = [MEMORY[0x263F08690] currentHandler];
    v61 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v60 handleFailureInFunction:v61, @"_UIDiffableDataSourceUpdate.m", 522, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot.numberOfItems == itemIdentifiers.count" file lineNumber description];
  }
  uint64_t v14 = [v12 numberOfSections];
  if (v14 != [v10 count])
  {
    v62 = [MEMORY[0x263F08690] currentHandler];
    v63 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v62 handleFailureInFunction:v63, @"_UIDiffableDataSourceUpdate.m", 523, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot.numberOfSections == sectionIdentifiers.count" file lineNumber description];
  }
  if ([v9 action] != 3)
  {
    unint64_t v64 = [MEMORY[0x263F08690] currentHandler];
    v65 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v64 handleFailureInFunction:v65, @"_UIDiffableDataSourceUpdate.m", 524, @"Invalid parameter not satisfying: %@", @"update.action == _CVCCollectionUpdateActionMove" file lineNumber description];
  }
  uint64_t v15 = [v9 identifiers];
  __int16 v16 = [v15 firstObject];

  uint64_t v17 = [v9 destinationIdentifier];
  id v18 = (void *)v17;
  if (v16)
  {
    if (v17) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v66 = [MEMORY[0x263F08690] currentHandler];
    v67 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
    [v66 handleFailureInFunction:v67, @"_UIDiffableDataSourceUpdate.m", 528, @"Invalid parameter not satisfying: %@", @"fromIdentifier" file lineNumber description];

    if (v18) {
      goto LABEL_13;
    }
  }
  id v68 = [MEMORY[0x263F08690] currentHandler];
  id v69 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
  [v68 handleFailureInFunction:v69, @"_UIDiffableDataSourceUpdate.m", 529, @"Invalid parameter not satisfying: %@", @"toIdentifier" file lineNumber description];

LABEL_13:
  long long v19 = (void *)MEMORY[0x263EFFA68];
  int v90 = a5;
  if (!a5) {
    long long v19 = 0;
  }
  id v20 = v19;
  v88 = v10;
  v89 = v11;
  if ([v9 isSectionOperation])
  {
    unint64_t v21 = [v10 indexOfObject:v16];
    unint64_t v22 = [v10 indexOfObject:v18];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v70 = [MEMORY[0x263F08690] currentHandler];
      v71 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v70 handleFailureInFunction:v71, @"_UIDiffableDataSourceUpdate.m", 560, @"Invalid parameter not satisfying: %@", @"fromSection != NSNotFound" file lineNumber description];
    }
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v72 = [MEMORY[0x263F08690] currentHandler];
      v73 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v72 handleFailureInFunction:v73, @"_UIDiffableDataSourceUpdate.m", 561, @"Invalid parameter not satisfying: %@", @"toSection != NSNotFound" file lineNumber description];
    }
    uint64_t v23 = [v9 relativePosition];
    if (v21 >= v22)
    {
      uint64_t v24 = v21 > v22 && v23 == 1;
    }
    else if (v23)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = -1;
    }
    unint64_t v32 = v24 + v22;
    if (v24 + v22 != v21)
    {
      uint64_t v33 = [MEMORY[0x263F088D0] indexSetWithIndex:v21];
      [v88 moveObjectsAtIndexes:v33 toIndex:v32];
      uint64_t v34 = [v12 rangeForSection:v21];
      id v36 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v34, v35);
      uint64_t v37 = [v12 rangeForSection:v22];
      uint64_t v39 = v38;
      if ([v9 relativePosition] == 1) {
        uint64_t v40 = v39;
      }
      else {
        uint64_t v40 = 0;
      }
      uint64_t v41 = v40 + v37 - objc_msgSend(v36, "countOfIndexesInRange:", 0, v40 + v37);
      if (v41 == 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v79 = [MEMORY[0x263F08690] currentHandler];
        id v87 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
        [v79 handleFailureInFunction:v87, @"_UIDiffableDataSourceUpdate.m", 590, @"Invalid parameter not satisfying: %@", @"insertionIndex != NSNotFound" file lineNumber description];
      }
      [v89 moveObjectsAtIndexes:v36 toIndex:v41];
      uint64_t v42 = [v12 numberOfItemsInSection:v21];
      [v12 _deleteSection:v21];
      [v12 _insertSection:v32 withInitialCount:v42];
      if (v90)
      {
        v43 = [MEMORY[0x263F088C8] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:v21];
        id v44 = [MEMORY[0x263F088C8] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:v32];
        _CVCUpdateItemAlloc();
        id v45 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithInitialIndexPath:v43 finalIndexPath:v44 updateAction:3];
        v92[0] = v45;
        id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:1];

LABEL_66:
LABEL_68:

        goto LABEL_69;
      }
      goto LABEL_67;
    }
  }
  else
  {
    unint64_t v25 = [v11 indexOfObject:v16];
    unint64_t v26 = [v11 indexOfObject:v18];
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v74 = [MEMORY[0x263F08690] currentHandler];
      v75 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v74 handleFailureInFunction:v75, @"_UIDiffableDataSourceUpdate.m", 614, @"Invalid parameter not satisfying: %@", @"fromIndex != NSNotFound" file lineNumber description];
    }
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v76 = [MEMORY[0x263F08690] currentHandler];
      long long v77 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v76 handleFailureInFunction:v77, @"_UIDiffableDataSourceUpdate.m", 615, @"Invalid parameter not satisfying: %@", @"toIndex != NSNotFound" file lineNumber description];
    }
    uint64_t v27 = [v12 sectionForGlobalIndex:v25];
    uint64_t v28 = [v12 sectionForGlobalIndex:v26];
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v85 = [MEMORY[0x263F08690] currentHandler];
      long long v84 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v85 handleFailureInFunction:v84, @"_UIDiffableDataSourceUpdate.m", 619, @"Invalid parameter not satisfying: %@", @"fromSection != NSNotFound" file lineNumber description];
    }
    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v78 = [MEMORY[0x263F08690] currentHandler];
      id v86 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
      [v78 handleFailureInFunction:v86, @"_UIDiffableDataSourceUpdate.m", 620, @"Invalid parameter not satisfying: %@", @"toSection != NSNotFound" file lineNumber description];
    }
    uint64_t v29 = [v9 relativePosition];
    if (v25 >= v26)
    {
      uint64_t v30 = v25 > v26 && v29 == 1;
    }
    else if (v29)
    {
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v30 = -1;
    }
    unint64_t v47 = v30 + v26;
    if (v30 + v26 != v25 || v27 != v28)
    {
      if (v47 != v25)
      {
        v48 = [MEMORY[0x263F088D0] indexSetWithIndex:v25];
        [v89 moveObjectsAtIndexes:v48 toIndex:v47];
      }
      uint64_t v33 = [v12 indexPathForGlobalIndex:v25];
      if (!v33)
      {
        long long v80 = [MEMORY[0x263F08690] currentHandler];
        long long v81 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
        [v80 handleFailureInFunction:v81, @"_UIDiffableDataSourceUpdate.m", 643, @"Invalid parameter not satisfying: %@", @"fromIndexPath" file lineNumber description];
      }
      [v12 _decrementSectionCount:v27];
      [v12 _incrementSectionCount:v28];
      id v36 = [v12 indexPathForGlobalIndex:v47];
      if (!v36)
      {
        long long v82 = [MEMORY[0x263F08690] currentHandler];
        long long v83 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyMoveUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)");
        [v82 handleFailureInFunction:v83, @"_UIDiffableDataSourceUpdate.m", 651, @"Invalid parameter not satisfying: %@", @"toIndexPath" file lineNumber description];
      }
      if (v90)
      {
        _CVCUpdateItemAlloc();
        v43 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithInitialIndexPath:v33 finalIndexPath:v36 updateAction:3];
        id v91 = v43;
        id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
        goto LABEL_66;
      }
LABEL_67:
      id v20 = 0;
      goto LABEL_68;
    }
  }
LABEL_69:
  if (v90) {
    uint64_t v49 = v20;
  }
  else {
    uint64_t v49 = 0;
  }
  id v50 = v49;

  return v50;
}

uint64_t _CVCApplicationIsAppleApp()
{
  if (qword_26AA4C0B8 != -1) {
    dispatch_once(&qword_26AA4C0B8, &__block_literal_global_1);
  }
  return _MergedGlobals_1;
}

void sub_20BE31FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20BE32214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_20BE322B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20BE32378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20BE325A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20BE32648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}