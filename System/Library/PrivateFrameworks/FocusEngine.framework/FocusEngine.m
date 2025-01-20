_FEFocusRegionContainerProxy *_FEFocusRegionContainerFromEnvironmentAndContainer(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  void *v4;
  _FEFocusRegionContainerProxy *v5;
  _FEFocusRegionContainerProxy *v6;
  uint64_t vars8;

  v2 = +[_FEFocusEnvironmentContainerTuple tupleWithOwningEnvironment:a1 itemContainer:a2];
  v3 = [v2 owningEnvironment];
  v4 = [v2 itemContainer];
  if (v3 == v4 && [v3 conformsToProtocol:&unk_2700D69B8]) {
    v5 = v3;
  }
  else {
    v5 = [[_FEFocusRegionContainerProxy alloc] initWithEnvironmentContainer:v2];
  }
  v6 = v5;

  return v6;
}

id _prefixForItem(int a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString * _Nonnull _prefixForItem(BOOL, BOOL, _FEDebugLogNodeTreeStyle * _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"_FEDebugLogTree.m", 173, @"Invalid parameter not satisfying: %@", @"treeStyle != nil" file lineNumber description];
  }
  if (a1)
  {
    if (a2) {
      [v5 node];
    }
    else {
      [v5 lastNode];
    }
  }
  else if (a2)
  {
    [v5 intermediate];
  }
  else
  {
    [v5 trailing];
  uint64_t v6 = };
  v7 = (void *)v6;

  return v7;
}

void sub_24F3F4988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24F3F59A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _FEPerformDelayed(void *a1)
{
  dispatch_block_t block = a1;
  if (UIKitCoreLibraryCore())
  {
    if (qword_269A11C28 != -1) {
      dispatch_once(&qword_269A11C28, &__block_literal_global_470);
    }
    [(id)qword_269A11C20 _performBlockAfterCATransactionCommits:block];
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void sub_24F3F6530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _FERectSmartIntersectsRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (CGRectIsNull(*(CGRect *)&a1)) {
    return 0;
  }
  v33.origin.CGFloat x = a5;
  v33.origin.CGFloat y = a6;
  v33.size.CGFloat width = a7;
  v33.size.CGFloat height = a8;
  if (CGRectIsNull(v33)) {
    return 0;
  }
  v34.origin.CGFloat x = a1;
  v34.origin.CGFloat y = a2;
  v34.size.CGFloat width = a3;
  v34.size.CGFloat height = a4;
  CGRect v35 = CGRectStandardize(v34);
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;
  v35.origin.CGFloat x = a5;
  v35.origin.CGFloat y = a6;
  v35.size.CGFloat width = a7;
  v35.size.CGFloat height = a8;
  CGRect v36 = CGRectStandardize(v35);
  CGFloat v21 = v36.origin.x;
  CGFloat v22 = v36.origin.y;
  CGFloat v23 = v36.size.width;
  CGFloat v24 = v36.size.height;
  CGFloat v31 = y;
  CGFloat v32 = x;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGFloat v25 = CGRectGetMinX(v36) + 0.0001;
  v37.origin.CGFloat x = v21;
  v37.origin.CGFloat y = v22;
  v37.size.CGFloat width = v23;
  v37.size.CGFloat height = v24;
  if (v25 <= CGRectGetMaxX(v37))
  {
    v38.origin.CGFloat y = v31;
    v38.origin.CGFloat x = x;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGFloat v27 = CGRectGetMaxX(v38) + -0.0001;
    v39.origin.CGFloat x = v21;
    v39.origin.CGFloat y = v22;
    v39.size.CGFloat width = v23;
    v39.size.CGFloat height = v24;
    BOOL v26 = v27 >= CGRectGetMinX(v39);
  }
  else
  {
    BOOL v26 = 0;
  }
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = v31;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v28 = CGRectGetMinY(v40) + 0.0001;
  v41.origin.CGFloat x = v21;
  v41.origin.CGFloat y = v22;
  v41.size.CGFloat width = v23;
  v41.size.CGFloat height = v24;
  if (v28 <= CGRectGetMaxY(v41))
  {
    v42.origin.CGFloat x = v32;
    v42.origin.CGFloat y = v31;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGFloat v30 = CGRectGetMaxY(v42) + -0.0001;
    v43.origin.CGFloat x = v21;
    v43.origin.CGFloat y = v22;
    v43.size.CGFloat width = v23;
    v43.size.CGFloat height = v24;
    BOOL v29 = v30 >= CGRectGetMinY(v43);
  }
  else
  {
    BOOL v29 = 0;
  }
  return v26 & v29;
}

void sub_24F3F8C68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_24F3F9848(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_24F3F9DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitCoreLibraryCore()
{
  if (!UIKitCoreLibraryCore_frameworkLibrary) {
    UIKitCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  return UIKitCoreLibraryCore_frameworkLibrary;
}

uint64_t __UIKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  UIKitCoreLibraryCore();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_269A11C30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _FEFocusGroupCompare(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    v77 = [MEMORY[0x263F08690] currentHandler];
    v78 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    [v77 handleFailureInFunction:v78, @"_FEFocusGroupHelperFuncs.m", 27, @"Invalid parameter not satisfying: %@", @"group1" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  v79 = [MEMORY[0x263F08690] currentHandler];
  v80 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
  [v79 handleFailureInFunction:v80, @"_FEFocusGroupHelperFuncs.m", 28, @"Invalid parameter not satisfying: %@", @"group2" file lineNumber description];

LABEL_3:
  uint64_t v6 = [v3 parentGroup];
  v7 = [v5 parentGroup];

  if (v6 != v7)
  {
    v81 = [MEMORY[0x263F08690] currentHandler];
    v82 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    [v81 handleFailureInFunction:v82 file:@"_FEFocusGroupHelperFuncs.m" lineNumber:30 description:@"Comparing groups with different parents is invalid."];
  }
  v8 = [v3 coordinateSpace];
  v9 = [v5 coordinateSpace];
  id v10 = v8;
  id v11 = v9;
  if (v10 == v11)
  {
    v14 = v10;
    v15 = v10;
    v16 = v10;
  }
  else
  {
    v12 = v11;
    if (v10 && v11)
    {
      char v13 = [v10 isEqual:v11];

      if (v13) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    v16 = [MEMORY[0x263F08690] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    v14 = [v3 identifier];
    id v10 = [v3 coordinateSpace];
    v83 = [v5 identifier];
    v84 = [v5 coordinateSpace];
    [v16 handleFailureInFunction:v15, @"_FEFocusGroupHelperFuncs.m", 32, @"Trying to compare groups with different coordinate spaces. Group %@ uses %@ while group %@ uses %@.", v14, v10, v83, v84 file lineNumber description];
  }
LABEL_12:
  v17 = [v3 owningEnvironment];
  uint64_t v18 = [v5 owningEnvironment];
  v19 = (void *)v18;
  if (!v17)
  {
    CGFloat v21 = 0;
    if (!v18) {
      goto LABEL_19;
    }
LABEL_17:
    CGFloat v22 = +[_FEFocusSystem focusSystemForEnvironment:v19];

    if (v21 == v22) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v20 = +[_FEFocusSystem focusSystemForEnvironment:v17];
  CGFloat v21 = (void *)v20;
  if (v19) {
    goto LABEL_17;
  }
  if (v20)
  {
LABEL_18:
    CGFloat v23 = [MEMORY[0x263F08690] currentHandler];
    CGFloat v24 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult _FEFocusGroupCompare(_FEFocusGroup * _Nonnull __strong, _FEFocusGroup * _Nonnull __strong)");
    [v23 handleFailureInFunction:v24 file:@"_FEFocusGroupHelperFuncs.m" lineNumber:38 description:@"Unable to compare focus groups from different focus systems."];
  }
LABEL_19:
  CGFloat v25 = [v3 parentGroup];
  BOOL v26 = [v25 owningEnvironment];

  int v27 = [v21 _shouldReverseLayoutDirectionForEnvironment:v26];
  int v28 = [v21 _shouldReverseLinearWrappingForEnvironment:v26];
  [v3 boundingBox];
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  [v5 boundingBox];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  v87.origin.CGFloat x = v30;
  v87.origin.CGFloat y = v32;
  v87.size.CGFloat width = v34;
  v87.size.CGFloat height = v36;
  if (CGRectIsNull(v87)) {
    goto LABEL_30;
  }
  v88.origin.CGFloat x = v38;
  v88.origin.CGFloat y = v40;
  v88.size.CGFloat width = v42;
  v88.size.CGFloat height = v44;
  if (CGRectIsNull(v88)) {
    goto LABEL_30;
  }
  v89.origin.CGFloat x = v30;
  v89.origin.CGFloat y = v32;
  v89.size.CGFloat width = v34;
  v89.size.CGFloat height = v36;
  CGRect v90 = CGRectStandardize(v89);
  CGFloat x = v90.origin.x;
  CGFloat y = v90.origin.y;
  CGFloat width = v90.size.width;
  CGFloat height = v90.size.height;
  v90.origin.CGFloat x = v38;
  v90.origin.CGFloat y = v40;
  v90.size.CGFloat width = v42;
  v90.size.CGFloat height = v44;
  CGRect v91 = CGRectStandardize(v90);
  CGFloat v49 = v91.origin.x;
  CGFloat v50 = v91.origin.y;
  CGFloat v51 = v91.size.width;
  CGFloat v52 = v91.size.height;
  CGFloat v85 = y;
  CGFloat v86 = x;
  v91.origin.CGFloat x = x;
  v91.origin.CGFloat y = y;
  v91.size.CGFloat width = width;
  v91.size.CGFloat height = height;
  CGFloat v53 = CGRectGetMinX(v91) + 0.0001;
  v92.origin.CGFloat x = v49;
  v92.origin.CGFloat y = v50;
  v92.size.CGFloat width = v51;
  v92.size.CGFloat height = v52;
  if (v53 <= CGRectGetMaxX(v92))
  {
    v93.origin.CGFloat y = v85;
    v93.origin.CGFloat x = x;
    v93.size.CGFloat width = width;
    v93.size.CGFloat height = height;
    CGFloat v55 = CGRectGetMaxX(v93) + -0.0001;
    v94.origin.CGFloat x = v49;
    v94.origin.CGFloat y = v50;
    v94.size.CGFloat width = v51;
    v94.size.CGFloat height = v52;
    BOOL v54 = v55 >= CGRectGetMinX(v94);
  }
  else
  {
    BOOL v54 = 0;
  }
  v95.origin.CGFloat x = x;
  v95.origin.CGFloat y = v85;
  v95.size.CGFloat width = width;
  v95.size.CGFloat height = height;
  CGFloat v56 = CGRectGetMinY(v95) + 0.0001;
  v96.origin.CGFloat x = v49;
  v96.origin.CGFloat y = v50;
  v96.size.CGFloat width = v51;
  v96.size.CGFloat height = v52;
  if (v56 > CGRectGetMaxY(v96)) {
    goto LABEL_30;
  }
  v97.origin.CGFloat x = v86;
  v97.origin.CGFloat y = v85;
  v97.size.CGFloat width = width;
  v97.size.CGFloat height = height;
  CGFloat v57 = CGRectGetMaxY(v97) + -0.0001;
  v98.origin.CGFloat x = v49;
  v98.origin.CGFloat y = v50;
  v98.size.CGFloat width = v51;
  v98.size.CGFloat height = v52;
  if (v57 < CGRectGetMinY(v98) || !v54)
  {
LABEL_30:
    [v3 boundingBox];
    CGFloat v60 = v71;
    CGFloat v62 = v72;
    CGFloat v64 = v73;
    CGFloat v66 = v74;
    [v5 boundingBox];
  }
  else
  {
    [v3 primaryRect];
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    CGFloat v64 = v63;
    CGFloat v66 = v65;
    [v5 primaryRect];
  }
  uint64_t v75 = _FEFocusRectCompare(v27, v28, v60, v62, v64, v66, v67, v68, v69, v70);

  return v75;
}

id _FEFocusGroupIdentifierForInstance(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = [NSString stringWithUTF8String:"NSString * _Nonnull _FEFocusGroupIdentifierForInstance(id  _Nonnull __strong)"];
    [v7 handleFailureInFunction:v8, @"_FEFocusGroupHelperFuncs.m", 221, @"Invalid parameter not satisfying: %@", @"object" file lineNumber description];
  }
  uint64_t v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [v2 stringWithFormat:@"<%@: %p>", v4, v1];

  return v5;
}

id _FEFocusGroupUnresolvedIdentifierForEnvironment(void *a1)
{
  id v1 = a1;
  if (_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v1))
  {
    uint64_t v2 = [v1 _focusGroupIdentifier];
    goto LABEL_26;
  }
  id v3 = v1;
  id v4 = +[_FEFocusSystem focusSystemForEnvironment:v3];
  id v5 = [v4 behavior];
  char v6 = [v5 focusGroupContainmentBehavior];

  v7 = [v3 _focusItemContainer];
  v8 = v7;
  if ((v6 & 8) == 0)
  {
    uint64_t v2 = 0;
    if (!_FEFocusItemContainerIsScrollableContainer(v7) || (v6 & 6) == 0) {
      goto LABEL_25;
    }
    id v9 = v3;
    uint64_t v10 = _FEFocusItemScrollableContainerPrimaryAxis(v8);
    id v11 = _FEFocusNearestAncestorEnvironmentScrollableContainer(v9, 1);
    v12 = v11;
    if (v11)
    {
      char v13 = [v11 scrollableContainer];
      uint64_t v14 = _FEFocusItemScrollableContainerPrimaryAxis(v13);

      if ((v6 & 4) == 0)
      {
LABEL_8:
        uint64_t v2 = 0;
        if ((v6 & 2) == 0 || v12) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v14 = 0;
      if ((v6 & 4) == 0) {
        goto LABEL_8;
      }
    }
    if (v12 && v10 == v14)
    {
      uint64_t v2 = 0;
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:
    uint64_t v2 = _FEFocusGroupIdentifierForInstance(v9);
    goto LABEL_23;
  }
  id v15 = v3;
  uint64_t v16 = _FEFocusEnvironmentRotaryFocusMovementAxis(v15);
  if (v16 == -1)
  {
    uint64_t v2 = 0;
    goto LABEL_24;
  }
  uint64_t v17 = v16;
  if (_FEInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_6);
  }
  int v18 = _FEInternalPreferencesRevisionVar;
  if (_FEInternalPreferencesRevisionVar >= 1)
  {
    int v22 = _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis;
    if (_FEInternalPreferencesRevisionVar != _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis)
    {
      while (v18 >= v22)
      {
        _FEInternalPreferenceSync(v18, &_FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis, @"FocusGroupSeparateNestedEqualRotaryMovementAxis", (uint64_t (*)(_DWORD *))_FEInternalPreferenceUpdateBool);
        int v22 = _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis;
        if (v18 == _FEInternalPreference_FocusGroupSeparateNestedEqualRotaryMovementAxis) {
          goto LABEL_15;
        }
      }
      if (byte_269A11BDC) {
        goto LABEL_16;
      }
    }
  }
LABEL_15:
  v19 = [v15 _parentFocusEnvironment];
  uint64_t v20 = _FEFocusEnvironmentResolvedRotaryFocusMovementAxis(v19, 0);

  uint64_t v2 = 0;
  if (v17 != v20)
  {
LABEL_16:
    uint64_t v2 = _FEFocusGroupIdentifierForInstance(v15);
  }
LABEL_24:

LABEL_25:
LABEL_26:

  return v2;
}

uint64_t _FEFocusGroupPriorityForItem(void *a1, id a2, id a3)
{
  id v5 = a1;
  char v6 = v5;
  uint64_t v7 = 1000;
  if (v5 != a3) {
    uint64_t v7 = 0;
  }
  if (v5 == a2) {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v8 = v7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v6 _systemDefaultFocusGroupPriority];
    if (v9 > v8) {
      uint64_t v8 = v9;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v6 _focusGroupPriority];
    if (v10 > v8) {
      uint64_t v8 = v10;
    }
  }

  return v8;
}

uint64_t _FEFocusItemContainerIsViewOrRespondsToSelector(void *a1)
{
  id v1 = a1;
  if (UIKitCoreLibraryCore_0() && (objc_msgSend(v1, "__isKindOfUIView") & 1) != 0) {
    char v2 = 1;
  }
  else {
    char v2 = objc_opt_respondsToSelector();
  }

  return v2 & 1;
}

id _FEFocusNearestAncestorEnvironmentScrollableContainer(void *a1, int a2)
{
  id v3 = a1;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    id v15 = objc_msgSend(NSString, "stringWithUTF8String:", "_FEFocusEnvironmentScrollableContainerTuple * _Nullable _FEFocusNearestAncestorEnvironmentScrollableContainer(__strong id<_FEFocusEnvironment> _Nonnull, BOOL)");
    [v14 handleFailureInFunction:v15, @"_FEFocusItemContainer.m", 70, @"Invalid parameter not satisfying: %@", @"environment" file lineNumber description];
  }
  uint64_t v4 = [v3 _parentFocusEnvironment];
  if (!v4)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  id v5 = (void *)v4;
  char v6 = v3;
  while (!_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v5))
  {
LABEL_19:
    char v6 = v5;
    id v5 = (void *)[v5 _parentFocusEnvironment];
    if (!v5) {
      goto LABEL_22;
    }
  }
  uint64_t v7 = [v5 _focusItemContainer];
  uint64_t v8 = v7;
  if (v7 && _FEFocusItemContainerIsScrollableContainer(v7))
  {
    id v9 = v8;
    if (_FEFocusEnvironmentPrefersFocusContainment(v5))
    {
      v12 = +[_FEFocusEnvironmentScrollableContainerTuple tupleWithOwningEnvironment:v5 scrollableContainer:v9];

      goto LABEL_27;
    }
  }
  if (!a2
    || !_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v6)
    || (id v10 = (id)[v6 _focusFallbackScroller]) == 0)
  {
    id v11 = v5;
    goto LABEL_18;
  }
  id v11 = v10;
  if (!_FEFocusEnvironmentPrefersFocusContainment(v10))
  {
LABEL_18:

    id v5 = v11;
    goto LABEL_19;
  }
  id v9 = [v11 _focusItemContainer];

  if (!v9)
  {
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  if (!_FEFocusItemContainerIsScrollableContainer(v9))
  {
    uint64_t v8 = v9;
    goto LABEL_18;
  }
  v12 = +[_FEFocusEnvironmentScrollableContainerTuple tupleWithOwningEnvironment:v11 scrollableContainer:v9];
LABEL_27:

LABEL_23:
  return v12;
}

uint64_t _FEFocusItemContainerIsScrollableContainer(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 conformsToProtocol:&unk_2700DFBB8];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

id _FEFocusAncestorEnvironmentScrollableContainers(void *a1, int a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  if (v3)
  {
    id v5 = v3;
    do
    {
      char v6 = _FEFocusNearestAncestorEnvironmentScrollableContainer(v5, a2);
      if (v6) {
        [v4 addObject:v6];
      }
      id v5 = (id)[v6 owningEnvironment];
    }
    while (v5);
  }
  uint64_t v7 = [v4 array];

  return v7;
}

void _FEFocusItemContainerAddChildItemsInContextWithOptions(void *a1, void *a2, int a3)
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v5 owningEnvironment];
  uint64_t v8 = [v5 itemContainer];
  v107 = [v8 _focusCoordinateSpace];
  id v9 = [v6 searchArea];
  id v10 = [v6 coordinateSpace];
  v103 = v7;
  double v11 = _FEFocusEnvironmentContainerFrameInCoordinateSpace(v7, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v10 bounds];
  double v94 = v11;
  double v95 = v13;
  double v96 = v15;
  double v97 = v17;
  if ((_FERectSmartIntersectsRect(v18, v19, v20, v21, v11, v13, v15, v17) & 1) == 0 && (a3 & 0x100) != 0)
  {
    id v22 = v8;
    if (_FEFocusItemContainerIsViewOrRespondsToSelector(v22))
    {
      int v23 = [v22 _isLazyFocusItemContainer];

      if (v23)
      {
        CGFloat v24 = [_FEFocusPromiseRegion alloc];
        id v25 = v22;
        if (v25)
        {
          BOOL v26 = NSString;
          int v27 = (objc_class *)objc_opt_class();
          int v28 = NSStringFromClass(v27);
          double v29 = [v26 stringWithFormat:@"<%@: %p>", v28, v25];
        }
        else
        {
          double v29 = @"(nil)";
        }

        CGRect v93 = -[_FEFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](v24, "initWithFrame:coordinateSpace:identifier:", v10, v29, v11, v13, v15, v17);
        v113[0] = MEMORY[0x263EF8330];
        v113[1] = 3221225472;
        v113[2] = ___FEFocusItemContainerAddChildItemsInContextWithOptions_block_invoke;
        v113[3] = &unk_265328230;
        v114 = (_FEFocusGuideRegion *)v5;
        [(_FEFocusPromiseRegion *)v93 setContentFulfillmentHandler:v113];
        id obj = v93;
        [v6 addRegion:v93];
        CGRect v91 = v114;
        goto LABEL_45;
      }
    }
    else
    {
    }
  }
  int v98 = a3;
  v100 = v9;
  id v101 = v5;
  [v9 frame];
  v99 = v10;
  objc_msgSend(v107, "convertRect:fromCoordinateSpace:", v10);
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  objc_msgSend(v8, "_focusItemsInRect:");
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v110;
    v102 = v8;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v110 != v40) {
          objc_enumerationMutation(obj);
        }
        CGFloat v42 = *(void **)(*((void *)&v109 + 1) + 8 * v41);
        double v43 = logger();
        BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);

        if (v44)
        {
          v45 = [v42 _parentFocusEnvironment];
          v46 = [v45 _focusItemContainer];

          if (v46 != v8)
          {
            v47 = logger();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              double v65 = @"(nil)";
              if (v42)
              {
                CGFloat v66 = NSString;
                id v67 = v42;
                CGFloat v68 = (objc_class *)objc_opt_class();
                CGFloat v69 = NSStringFromClass(v68);
                double v65 = [v66 stringWithFormat:@"<%@: %p>", v69, v67];
              }
              v106 = v65;
              uint64_t v70 = [v42 _parentFocusEnvironment];
              double v71 = @"(nil)";
              if (v70)
              {
                double v72 = NSString;
                double v73 = (objc_class *)objc_opt_class();
                double v74 = NSStringFromClass(v73);
                double v71 = [v72 stringWithFormat:@"<%@: %p>", v74, v70];
              }
              v105 = (void *)v70;
              v104 = v71;
              id v75 = v8;
              v76 = @"(nil)";
              if (v8)
              {
                v77 = NSString;
                v78 = (objc_class *)objc_opt_class();
                v79 = NSStringFromClass(v78);
                v76 = [v77 stringWithFormat:@"<%@: %p>", v79, v75];
              }
              v80 = v76;
              id v81 = v103;
              v82 = @"(nil)";
              if (v103)
              {
                v83 = NSString;
                v84 = (objc_class *)objc_opt_class();
                CGFloat v85 = NSStringFromClass(v84);
                v82 = [v83 stringWithFormat:@"<%@: %p>", v85, v81];
              }
              *(_DWORD *)buf = 138413058;
              v116 = v106;
              __int16 v117 = 2112;
              v118 = v104;
              __int16 v119 = 2112;
              v120 = v80;
              __int16 v121 = 2112;
              v122 = v82;
              _os_log_error_impl(&dword_24F3F0000, v47, OS_LOG_TYPE_ERROR, "_FEFocusItem: %@ has mismatched parentFocusEnvironment: %@  from focusItemContainer: %@ with owningEnvironment: %@", buf, 0x2Au);

              uint64_t v8 = v102;
            }
          }
        }
        v48 = [v42 _focusItemContainer];
        if (v48)
        {
          _FEFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v42, (uint64_t)v48);
          CGFloat v49 = (_FEFocusItemRegion *)objc_claimAutoreleasedReturnValue();
          [v6 addRegionsInContainer:v49];
        }
        else
        {
          CGFloat v49 = [v6 searchInfo];
          if ([(_FEFocusItemRegion *)v49 shouldIncludeFocusItem:v42])
          {
            [v42 _focusFrame];
            int v54 = _FERectSmartIntersectsRect(v50, v51, v52, v53, v31, v33, v35, v37);

            if (!v54) {
              goto LABEL_23;
            }
            CGFloat v55 = [_FEFocusItemRegion alloc];
            [v42 _focusFrame];
            double v57 = v56;
            double v59 = v58;
            double v61 = v60;
            double v63 = v62;
            CGFloat v64 = [v6 focusSystem];
            CGFloat v49 = -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v55, "initWithFrame:coordinateSpace:item:focusSystem:", v107, v42, v64, v57, v59, v61, v63);

            [v6 addRegion:v49];
          }
        }

LABEL_23:
        ++v41;
      }
      while (v39 != v41);
      uint64_t v86 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
      uint64_t v39 = v86;
    }
    while (v86);
  }
  CGRect v87 = [v6 movementInfo];
  id v88 = v8;
  id v89 = v87;
  if (_FEFocusItemContainerIsViewOrRespondsToSelector(v88)) {
    uint64_t v90 = [v88 _focusGuideBehaviorForMovement:v89];
  }
  else {
    uint64_t v90 = 0;
  }
  id v9 = v100;

  id v5 = v101;
  id v10 = v99;
  if ((v98 & 0x10000) != 0)
  {
    if (v90 == 2)
    {
      CGRect v91 = -[_FEFocusGuideRegion initWithFrame:coordinateSpace:]([_FEFocusGuideRegion alloc], "initWithFrame:coordinateSpace:", v99, v94, v95, v96, v97);
      [(_FEFocusGuideRegion *)v91 setOwningEnvironment:v103];
      [v6 addRegion:v91];
      goto LABEL_45;
    }
    if (v90 == 1)
    {
      CGRect v91 = [[_FEFocusRegionContainerProxy alloc] initWithEnvironmentContainer:v101];
      [(_FEFocusGuideRegion *)v91 setShouldCreateRegionForOwningItem:0];
      [(_FEFocusGuideRegion *)v91 setShouldCreateRegionForGuideBehavior:0];
      [(_FEFocusGuideRegion *)v91 setAllowsLazyLoading:0];
      CGRect v92 = -[_FEFocusGuideRegion initWithFrame:coordinateSpace:]([_FEFocusContainerGuideRegion alloc], "initWithFrame:coordinateSpace:", v99, v94, v95, v96, v97);
      [(_FEFocusContainerGuideRegion *)v92 setContentFocusRegionContainer:v91];
      [v6 addRegion:v92];

LABEL_45:
    }
  }
}

uint64_t _FEFocusItemContainerSupportsInvalidatingFocusCache(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [(id)objc_opt_class() _supportsInvalidatingFocusCache];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t _FEFocusItemScrollableContainerCanScrollX(void *a1)
{
  id v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    uint64_t v2 = [v1 _focusCanScrollX];
  }
  else
  {
    [v1 _focusContentSize];
    double v4 = v3;
    [v1 _focusVisibleSize];
    uint64_t v2 = v4 > v5;
  }

  return v2;
}

uint64_t _FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(void *a1)
{
  id v1 = a1;
  if (UIKitCoreLibraryCore_0() && (objc_msgSend(v1, "__isKindOfUIScrollView") & 1) != 0) {
    char v2 = 1;
  }
  else {
    char v2 = objc_opt_respondsToSelector();
  }

  return v2 & 1;
}

uint64_t _FEFocusItemScrollableContainerCanScrollY(void *a1)
{
  id v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    uint64_t v2 = [v1 _focusCanScrollY];
  }
  else
  {
    [v1 _focusContentSize];
    double v4 = v3;
    [v1 _focusVisibleSize];
    uint64_t v2 = v4 > v5;
  }

  return v2;
}

double _FEFocusItemScrollableContainerContentBounds(void *a1)
{
  id v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    [v1 _focusScrollableContentBounds];
    double v3 = v2;
  }
  else
  {
    double v3 = *MEMORY[0x263F00148];
    [v1 _focusContentSize];
  }

  return v3;
}

uint64_t _FEFocusItemScrollableContainerPrimaryAxis(void *a1)
{
  id v1 = a1;
  if (_FEFocusItemScrollableContainerIsScrollViewOrRespondsToSelector(v1))
  {
    uint64_t v2 = [v1 _focusPrimaryScrollableAxis];
  }
  else
  {
    id v3 = v1;
    [v3 _focusContentSize];
    double v5 = v4;
    double v7 = v6;
    [v3 _focusVisibleSize];
    int CanScrollX = _FEFocusItemScrollableContainerCanScrollX(v3);
    int CanScrollY = _FEFocusItemScrollableContainerCanScrollY(v3);

    if (CanScrollX && CanScrollY)
    {
      if (v5 <= v7)
      {
        if (v7 <= v5) {
          uint64_t v2 = 0;
        }
        else {
          uint64_t v2 = 2;
        }
      }
      else
      {
        uint64_t v2 = 1;
      }
    }
    else
    {
      uint64_t v10 = 2;
      if (!CanScrollY) {
        uint64_t v10 = 0;
      }
      if (CanScrollX) {
        uint64_t v2 = 1;
      }
      else {
        uint64_t v2 = v10;
      }
    }
  }

  return v2;
}

id _FEFocusEngineCommonEnvironmentScrollableContainerForItems(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 item];
  if (v5
    && (double v6 = (void *)v5,
        [v4 item],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = [v3 ancestorEnvironmentScrollableContainers];
    id v9 = [v4 ancestorEnvironmentScrollableContainers];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___FEFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke;
    v14[3] = &unk_265328258;
    id v10 = v8;
    id v15 = v10;
    uint64_t v11 = [v9 indexOfObjectPassingTest:v14];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v12 = 0;
    }
    else
    {
      double v12 = [v9 objectAtIndex:v11];
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

uint64_t _FEFocusEngineScrollableContainerCanScroll(void *a1)
{
  id v1 = a1;
  if ((_FEFocusItemScrollableContainerCanScrollX(v1) & 1) != 0
    || _FEFocusItemScrollableContainerCanScrollY(v1))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = [v1 _focusIsScrollableContainer];
    }
    else {
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id _FEFocusEngineFirstScrollableContainerTupleThatScrollsForItem(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [a1 ancestorEnvironmentScrollableContainers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = (id)[v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        double v6 = objc_msgSend(v5, "scrollableContainer", (void)v9);
        char CanScroll = _FEFocusEngineScrollableContainerCanScroll(v6);

        if (CanScroll)
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

uint64_t UIKitCoreLibraryCore_0()
{
  if (!UIKitCoreLibraryCore_frameworkLibrary_0) {
    UIKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return UIKitCoreLibraryCore_frameworkLibrary_0;
}

uint64_t __UIKitCoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UIKitCoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_24F3FD92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _FEGetFocusCastingVisualization()
{
  if (_FEInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_6);
  }
  int v0 = _FEInternalPreferencesRevisionVar;
  if (_FEInternalPreferencesRevisionVar < 1
    || (int v3 = _FEInternalPreference_FocusCastingVisualization,
        _FEInternalPreferencesRevisionVar == _FEInternalPreference_FocusCastingVisualization))
  {
    BOOL v1 = 0;
  }
  else
  {
    do
    {
      BOOL v1 = v0 < v3;
      if (v0 < v3) {
        break;
      }
      _FEInternalPreferenceSync(v0, &_FEInternalPreference_FocusCastingVisualization, @"FocusCastingVisualization", (uint64_t (*)(_DWORD *))_FEInternalPreferenceUpdateBool);
      int v3 = _FEInternalPreference_FocusCastingVisualization;
    }
    while (v0 != _FEInternalPreference_FocusCastingVisualization);
  }
  return byte_269A11BE4 && v1;
}

uint64_t _FEFocusItemIsViewOrRespondsToSelector(void *a1)
{
  id v1 = a1;
  if (UIKitCoreLibraryCore_1() && (objc_msgSend(v1, "__isKindOfUIView") & 1) != 0) {
    char v2 = 1;
  }
  else {
    char v2 = objc_opt_respondsToSelector();
  }

  return v2 & 1;
}

uint64_t _FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(void *a1)
{
  id v1 = a1;
  if (UIKitCoreLibraryCore_1() && (objc_msgSend(v1, "__isKindOfUIView") & 1) != 0) {
    goto LABEL_5;
  }
  id v2 = v1;
  if (!UIKitCoreLibraryCore_1())
  {

    goto LABEL_7;
  }
  char v3 = objc_msgSend(v2, "__isKindOfUIViewController");

  if ((v3 & 1) == 0)
  {
LABEL_7:
    char v4 = objc_opt_respondsToSelector();
    goto LABEL_8;
  }
LABEL_5:
  char v4 = 1;
LABEL_8:

  return v4 & 1;
}

id _FEFocusEnvironmentRootAncestorEnvironment(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    long long v9 = [NSString stringWithUTF8String:"id<_FEFocusEnvironment>  _Nonnull _FEFocusEnvironmentRootAncestorEnvironment(__strong id<_FEFocusEnvironment> _Nonnull)"];
    [v8 handleFailureInFunction:v9, @"_FEFocusEnvironment.m", 79, @"Invalid parameter not satisfying: %@", @"environment" file lineNumber description];
  }
  id v2 = v1;
  id v3 = (id)[v2 _parentFocusEnvironment];
  id v4 = v2;
  if (v3)
  {
    id v5 = v3;
    double v6 = v2;
    do
    {
      id v4 = v5;

      id v5 = (id)[v4 _parentFocusEnvironment];
      double v6 = v4;
    }
    while (v5);
  }

  return v4;
}

BOOL _FEFocusEnvironmentIsAncestorOfEnvironment(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = 0;
  if (v3 && v4)
  {
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___FEFocusEnvironmentIsAncestorOfEnvironment_block_invoke;
    v8[3] = &unk_265328298;
    id v9 = v3;
    long long v10 = &v11;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v5, v8);
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void sub_24F400164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _FEFocusEnvironmentEnumerateAncestorEnvironments(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void (**)(void, void, void))v4;
  if (v3 && v4)
  {
    char v11 = 0;
    unsigned int v6 = objc_msgSend(v3, sel_allowsWeakReference);
    id v7 = v6 ? v3 : 0;
    id v8 = v7;
    if (v6)
    {
      id v9 = v3;
      while (1)
      {
        ((void (**)(void, void *, char *))v5)[2](v5, v9, &v11);
        if (!objc_msgSend((id)objc_msgSend(v9, "_parentFocusEnvironment"), sel_allowsWeakReference)) {
          break;
        }
        id v10 = (id)[v9 _parentFocusEnvironment];

        if (v10)
        {
          id v9 = v10;
          if (!v11) {
            continue;
          }
        }
        goto LABEL_13;
      }
      id v10 = v9;
LABEL_13:
    }
  }
}

id _FEFocusEnvironmentFirstCommonAncestor(void *a1, void *a2)
{
  return _UITreeFirstCommonAncestor(a1, a2, sel__parentFocusEnvironment);
}

BOOL _FEFocusEnvironmentsHaveCommonHierarchy(void *a1, void *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    id v4 = a2;
    id v5 = a1;
    _UITreeFirstCommonAncestor(v5, v4, sel__parentFocusEnvironment);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v2 = v6 == v5 || v6 == v4;
  }
  return v2;
}

uint64_t _FEFocusEnvironmentShouldUpdateFocus(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusEnvironmentShouldUpdateFocus(__strong id<_FEFocusEnvironment> _Nonnull, _FEFocusUpdateContext *__strong _Nonnull)");
    [v7 handleFailureInFunction:v8 file:@"_FEFocusEnvironment.m" lineNumber:169 description:@"Attempted to validate a focus update with a nil context."];
  }
  if (_FEFocusItemIsViewOrRespondsToSelector(v3)) {
    uint64_t v5 = [v3 _shouldUpdateFocusInContext:v4];
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t _FEFocusEnvironmentInheritedFocusMovementStyle(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"_FEFocusMovementStyle _FEFocusEnvironmentInheritedFocusMovementStyle(__strong id<_FEFocusEnvironment> _Nonnull)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"_FEFocusEnvironment.m", 181, @"Cannot determine preferred focus movement style for nil focus environment.", 0);
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___FEFocusEnvironmentInheritedFocusMovementStyle_block_invoke;
  v6[3] = &unk_265328370;
  v6[4] = &v7;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v1, v6);
  uint64_t v2 = v8[3];
  if (!v2)
  {
    uint64_t v2 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_24F40050C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FEFocusEnvironmentIsEligibleForFocusInteraction(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"BOOL _FEFocusEnvironmentIsEligibleForFocusInteraction(__strong id<_FEFocusEnvironment> _Nonnull)"];
    [v4 handleFailureInFunction:v5 file:@"_FEFocusEnvironment.m" lineNumber:206 description:@"Cannot determine the focus interaction eligibility for a nil focus environment."];
  }
  if (_FEFocusItemIsViewOrRespondsToSelector(v1)) {
    uint64_t v2 = [v1 _isEligibleForFocusInteraction];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t _FEFocusEnvironmentIsEligibleForFocusOcclusion(void *a1, unsigned char *a2)
{
  id v3 = a1;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusEnvironmentIsEligibleForFocusOcclusion(__strong id<_FEFocusEnvironment> _Nonnull, BOOL * _Nullable)");
    [v7 handleFailureInFunction:v8 file:@"_FEFocusEnvironment.m" lineNumber:218 description:@"Cannot determine the focus occlusion eligibility for a nil focus environment."];
  }
  char IsEligibleForFocusInteraction = _FEFocusEnvironmentIsEligibleForFocusInteraction(v3);
  if (a2) {
    *a2 = IsEligibleForFocusInteraction;
  }
  if (IsEligibleForFocusInteraction)
  {
    uint64_t v5 = 1;
  }
  else if (_FEFocusItemIsViewOrRespondsToSelector(v3))
  {
    uint64_t v5 = [v3 _isEligibleForFocusOcclusion];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
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

id _FEFocusEnvironmentPreferredFocusMapContainer(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"id<_FEFocusRegionContainer>  _Nullable _FEFocusEnvironmentPreferredFocusMapContainer(__strong id<_FEFocusEnvironment> _Nonnull)"];
    [v4 handleFailureInFunction:v5, @"_FEFocusEnvironment.m", 266, @"Invalid parameter not satisfying: %@", @"environment" file lineNumber description];
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  char v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___FEFocusEnvironmentPreferredFocusMapContainer_block_invoke;
  v6[3] = &unk_265328370;
  v6[4] = &v7;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v1, v6);
  id v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v2;
}

void sub_24F4008CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _FEFocusEnvironmentContainerFrameInCoordinateSpace(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = _FEFocusItemSafeCast(v3);
  v12.origin.double x = _FEFocusItemFrameInCoordinateSpace(v5, v4);
  double x = v12.origin.x;
  if (CGRectIsNull(v12))
  {
    uint64_t v7 = [v3 _focusItemContainer];
    id v8 = [v7 _focusCoordinateSpace];
    uint64_t v9 = v8;
    if (v7 && v8)
    {
      [v8 bounds];
      objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v9);
      double x = v10;
    }
  }
  return x;
}

uint64_t _FEFocusEnvironmentRotaryFocusMovementAxis(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if (_FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v1))
    {
      uint64_t v3 = [v2 _focusRotaryMovementAxis];
    }
    else
    {
      id v4 = v2;
      uint64_t v5 = [v4 _focusItemContainer];
      if (_FEFocusItemContainerIsScrollableContainer(v5)
        && _FEFocusEnvironmentPrefersFocusContainment(v4))
      {
        uint64_t v6 = _FEFocusItemScrollableContainerPrimaryAxis(v5);
        if (v6 == 2) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = -1;
        }
        if (v6 == 1) {
          uint64_t v3 = 1;
        }
        else {
          uint64_t v3 = v7;
        }
      }
      else
      {
        uint64_t v3 = -1;
      }
    }
  }
  else
  {
    uint64_t v3 = -1;
  }

  return v3;
}

uint64_t _FEFocusEnvironmentPrefersFocusContainment(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t IsScrollableContainer = [v1 _prefersFocusContainment];
  }
  else
  {
    uint64_t v3 = [v1 _focusItemContainer];

    uint64_t IsScrollableContainer = _FEFocusItemContainerIsScrollableContainer(v3);
    id v1 = v3;
  }

  return IsScrollableContainer;
}

uint64_t _FEFocusEnvironmentResolvedRotaryFocusMovementAxis(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  uint64_t v5 = -1;
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v23 = 0;
  CGFloat v24 = &v23;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy_;
  int v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v19 = 0;
  CGFloat v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = -1;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = ___FEFocusEnvironmentResolvedRotaryFocusMovementAxis_block_invoke;
  v18[3] = &unk_265328330;
  v18[4] = &v19;
  v18[5] = &v23;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v3, v18);
  if (v20[3] == -1)
  {
    if (_FEInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_6);
    }
    int v6 = _FEInternalPreferencesRevisionVar;
    if (_FEInternalPreferencesRevisionVar >= 1)
    {
      int v8 = _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis;
      if (_FEInternalPreferencesRevisionVar != _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis)
      {
        while (v6 >= v8)
        {
          _FEInternalPreferenceSync(v6, &_FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis, @"FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis", (uint64_t (*)(_DWORD *))_FEInternalPreferenceUpdateBool);
          int v8 = _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis;
          if (v6 == _FEInternalPreference_FocusEnvironmentUseAncestorScrollableSizeForFallbackRotaryAxis) {
            goto LABEL_6;
          }
        }
        if (byte_269A11BEC)
        {
          uint64_t v9 = _FEFocusNearestAncestorEnvironmentScrollableContainer(v4, 1);
          double v10 = v9;
          if (v9)
          {
            char v11 = [v9 scrollableContainer];
            [v11 _focusVisibleSize];
            double v13 = v12;
            double v15 = v14;

            if (v13 > v15)
            {
              v20[3] = 1;
              uint64_t v16 = [v10 owningEnvironment];
LABEL_22:
              double v17 = (void *)v24[5];
              v24[5] = v16;

              goto LABEL_23;
            }
            if (v15 > v13)
            {
              v20[3] = 2;
              uint64_t v16 = [v10 owningEnvironment];
              goto LABEL_22;
            }
          }
LABEL_23:
        }
      }
    }
  }
LABEL_6:
  uint64_t v5 = v20[3];
  if (v5 == -1)
  {
    uint64_t v5 = 0;
    v20[3] = 0;
  }
  if (a2)
  {
    *a2 = (id) v24[5];
    uint64_t v5 = v20[3];
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

LABEL_11:
  return v5;
}

void sub_24F400E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _FEFocusEnvironmentPreferredFocusEnvironments(void *a1)
{
  id v1 = a1;
  int IsViewOrViewControllerOrRespondsToSelector = _FEFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v1);
  id v3 = (id)MEMORY[0x263EFFA68];
  if (IsViewOrViewControllerOrRespondsToSelector)
  {
    uint64_t v4 = [v1 _preferredFocusEnvironments];
    uint64_t v5 = (void *)v4;
    if (v4) {
      int v6 = (void *)v4;
    }
    else {
      int v6 = v3;
    }
    id v3 = v6;
  }
  return v3;
}

id _FEFocusEnvironmentEffectivePreferredFocusEnvironments(void *a1, unsigned char *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_FEFocusEnvironment>> * _Nonnull _FEFocusEnvironmentEffectivePreferredFocusEnvironments(__strong id<_FEFocusEnvironment> _Nonnull, BOOL * _Nullable)");
    [v8 handleFailureInFunction:v9 file:@"_FEFocusEnvironment.m" lineNumber:463 description:@"Cannot determine effective preferred focus environments for a nil environment."];
  }
  uint64_t v4 = _FEFocusEnvironmentPreferredFocusEnvironments(v3);
  if ([v4 count])
  {
    if ([v4 indexOfObjectIdenticalTo:v3] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
    uint64_t v5 = [v4 arrayByAddingObject:v3];
  }
  else
  {
    v10[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  int v6 = (void *)v5;

  uint64_t v4 = v6;
LABEL_8:
  if (a2) {
    *a2 = 0;
  }

  return v4;
}

uint64_t _FEFocusEnvironmentAllowsFocusToLeaveViaHeading(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v3)) {
    uint64_t v4 = [v3 _focusAllowsLeavingWithHeading:a2];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t UIKitCoreLibraryCore_1()
{
  if (!UIKitCoreLibraryCore_frameworkLibrary_2) {
    UIKitCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  return UIKitCoreLibraryCore_frameworkLibrary_2;
}

uint64_t __UIKitCoreLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  UIKitCoreLibraryCore_frameworkLibrary_2 = result;
  return result;
}

double _UIRectThatJustBarelyIntersectsRect(double a1, CGFloat y, CGFloat width, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double x = a1;
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  CGFloat v34 = a5;
  v37.origin.double x = a5;
  v37.origin.CGFloat y = a6;
  CGFloat rect = a7;
  v37.size.CGFloat width = a7;
  v37.size.CGFloat height = a8;
  CGFloat v16 = a8;
  CGFloat v35 = a8;
  if (MaxX <= CGRectGetMinX(v37))
  {
    CGFloat v18 = a6;
    v38.origin.double x = a5;
    v38.origin.CGFloat y = a6;
    v38.size.CGFloat width = rect;
    v38.size.CGFloat height = v16;
    CGFloat MinX = CGRectGetMinX(v38);
    v39.origin.double x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = a4;
    CGFloat MinY = CGRectGetMinY(v39);
    v40.origin.double x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = a4;
    v41.size.CGFloat height = CGRectGetHeight(v40);
    v41.size.CGFloat width = 90.0;
    v41.origin.double x = MinX;
    v41.origin.CGFloat y = MinY;
    CGFloat v16 = v35;
    v63.origin.double x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = a4;
    CGRect v42 = CGRectUnion(v41, v63);
    double x = v42.origin.x;
    CGFloat y = v42.origin.y;
    CGFloat width = v42.size.width;
    CGFloat height = v42.size.height;
  }
  else
  {
    CGFloat height = a4;
    CGFloat v18 = a6;
  }
  v43.origin.double x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v21 = CGRectGetMinX(v43);
  CGFloat v22 = v34;
  v44.origin.double x = v34;
  v44.origin.CGFloat y = v18;
  v44.size.CGFloat width = rect;
  v44.size.CGFloat height = v16;
  if (v21 >= CGRectGetMaxX(v44))
  {
    v45.origin.double x = v34;
    v45.origin.CGFloat y = v18;
    v45.size.CGFloat width = rect;
    v45.size.CGFloat height = v16;
    CGFloat v23 = CGRectGetMaxX(v45) + -90.0;
    v46.origin.double x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGFloat v24 = CGRectGetMinY(v46);
    v47.origin.double x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    v48.size.CGFloat height = CGRectGetHeight(v47);
    v48.size.CGFloat width = 90.0;
    v48.origin.double x = v23;
    v48.origin.CGFloat y = v24;
    CGFloat v22 = v34;
    CGFloat v16 = v35;
    v64.origin.double x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    CGRect v49 = CGRectUnion(v48, v64);
    double x = v49.origin.x;
    CGFloat y = v49.origin.y;
    CGFloat width = v49.size.width;
    CGFloat height = v49.size.height;
  }
  v50.origin.double x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v50);
  v51.origin.double x = v22;
  v51.origin.CGFloat y = v18;
  v51.size.CGFloat width = rect;
  v51.size.CGFloat height = v16;
  if (MaxY <= CGRectGetMinY(v51))
  {
    v52.origin.double x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    CGFloat v26 = CGRectGetMinX(v52);
    v53.origin.double x = v22;
    v53.origin.CGFloat y = v18;
    v53.size.CGFloat width = rect;
    v53.size.CGFloat height = v16;
    double v27 = v22;
    CGFloat v28 = CGRectGetMinY(v53);
    v54.origin.double x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    v55.size.CGFloat width = CGRectGetWidth(v54);
    v55.size.CGFloat height = 90.0;
    v55.origin.double x = v26;
    v55.origin.CGFloat y = v28;
    CGFloat v22 = v27;
    CGFloat v16 = v35;
    v65.origin.double x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    CGRect v56 = CGRectUnion(v55, v65);
    double x = v56.origin.x;
    CGFloat y = v56.origin.y;
    CGFloat width = v56.size.width;
    CGFloat height = v56.size.height;
  }
  v57.origin.double x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  double v29 = CGRectGetMinY(v57);
  v58.origin.double x = v22;
  v58.origin.CGFloat y = v18;
  v58.size.CGFloat width = rect;
  v58.size.CGFloat height = v16;
  if (v29 >= CGRectGetMaxY(v58))
  {
    v59.origin.double x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGFloat v30 = CGRectGetMinX(v59);
    v60.origin.double x = v22;
    v60.origin.CGFloat y = v18;
    v60.size.CGFloat width = rect;
    v60.size.CGFloat height = v16;
    CGFloat v31 = CGRectGetMaxY(v60) + -90.0;
    v61.origin.double x = x;
    v61.origin.CGFloat y = y;
    v61.size.CGFloat width = width;
    v61.size.CGFloat height = height;
    v62.size.CGFloat width = CGRectGetWidth(v61);
    v62.size.CGFloat height = 90.0;
    v62.origin.double x = v30;
    v62.origin.CGFloat y = v31;
    v66.origin.double x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    *(void *)&double x = (unint64_t)CGRectUnion(v62, v66);
  }
  return x;
}

void sub_24F402068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void _enumeratePreferredFocusEnvironments(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = a3;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
LABEL_35:
    uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    CGFloat v26 = objc_msgSend(NSString, "stringWithUTF8String:", "void _enumeratePreferredFocusEnvironments(_FEFocusEnvironmentPreferenceEnumerator *__strong, _FEFocusEnvironmentPreferenceEnumerationContext *__strong, void (^__strong)(__strong id<_FEFocusEnvironmentPreferenceEnumerationContext>, _FEFocusEnvironmentPreferenceEnumerationResult *), _FEFocusEnvironmentPreferenceEnumerationResult *)");
    [v25 handleFailureInFunction:v26, @"_FEFocusEnvironmentPreferenceEnumerator.m", 477, @"Invalid parameter not satisfying: %@", @"context" file lineNumber description];

    if (a4) {
      goto LABEL_4;
    }
LABEL_36:
    double v27 = [MEMORY[0x263F08690] currentHandler];
    CGFloat v28 = objc_msgSend(NSString, "stringWithUTF8String:", "void _enumeratePreferredFocusEnvironments(_FEFocusEnvironmentPreferenceEnumerator *__strong, _FEFocusEnvironmentPreferenceEnumerationContext *__strong, void (^__strong)(__strong id<_FEFocusEnvironmentPreferenceEnumerationContext>, _FEFocusEnvironmentPreferenceEnumerationResult *), _FEFocusEnvironmentPreferenceEnumerationResult *)");
    [v27 handleFailureInFunction:v28, @"_FEFocusEnvironmentPreferenceEnumerator.m", 478, @"Invalid parameter not satisfying: %@", @"result" file lineNumber description];

    goto LABEL_4;
  }
  CGFloat v23 = [MEMORY[0x263F08690] currentHandler];
  CGFloat v24 = objc_msgSend(NSString, "stringWithUTF8String:", "void _enumeratePreferredFocusEnvironments(_FEFocusEnvironmentPreferenceEnumerator *__strong, _FEFocusEnvironmentPreferenceEnumerationContext *__strong, void (^__strong)(__strong id<_FEFocusEnvironmentPreferenceEnumerationContext>, _FEFocusEnvironmentPreferenceEnumerationResult *), _FEFocusEnvironmentPreferenceEnumerationResult *)");
  [v23 handleFailureInFunction:v24, @"_FEFocusEnvironmentPreferenceEnumerator.m", 476, @"Invalid parameter not satisfying: %@", @"enumerator" file lineNumber description];

  if (!v8) {
    goto LABEL_35;
  }
LABEL_3:
  if (!a4) {
    goto LABEL_36;
  }
LABEL_4:
  uint64_t v34 = 0;
  char v10 = [v8 isInPreferredSubtree];
  if (v9 && (v10 & 1) != 0)
  {
    v9[2](v9, v8, &v34);
    if (v34 == 3) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v11 = [v8 debugStack];
    uint64_t v12 = (void *)v11;
    if (v9 && v11)
    {
      char v13 = [v8 isPreferredByItself];

      if (v13) {
        goto LABEL_13;
      }
      uint64_t v12 = [v8 debugStack];
      double v14 = +[_FEDebugLogMessage messageWithString:@"Not visiting node. Outside of preferred subtree."];
      [v12 addMessage:v14];
    }
  }
LABEL_13:
  if ([v8 prefersNothingFocused])
  {
LABEL_14:
    *a4 = 3;
    goto LABEL_15;
  }
  if (v34 != 1)
  {
    if (v34 == 2) {
      *a4 = 2;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v15 = [v8 preferredEnvironments];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v29 = 0;
          [v8 pushEnvironment:v20];
          _enumeratePreferredFocusEnvironments(v7, v8, v9, &v29);
          [v8 popEnvironment];
          if ((v29 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            *a4 = v29;
            goto LABEL_29;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_29:

    if ([v8 isInPreferredSubtree] && *a4 != 3)
    {
      uint64_t v21 = [v7 didVisitAllPreferencesForEnvironmentHandler];
      CGFloat v22 = (void *)v21;
      if (v21) {
        (*(void (**)(uint64_t, id, void *))(v21 + 16))(v21, v8, a4);
      }
    }
  }
LABEL_15:
}

void sub_24F403BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_24F404388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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

void sub_24F4046A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_24F404A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _FEUserDefaults()
{
  if (qword_269A11C48 != -1) {
    dispatch_once(&qword_269A11C48, &__block_literal_global_2);
  }
  int v0 = (void *)_MergedGlobals_5;
  return v0;
}

id _FEPreferencesOnce()
{
  if (qword_269A11C58 != -1) {
    dispatch_once(&qword_269A11C58, &__block_literal_global_4);
  }
  int v0 = (void *)qword_269A11C50;
  return v0;
}

void notificationHandler()
{
  if (_FEInternalPreferencesRevisionVar <= 2147483645) {
    _FEInternalPreferencesRevisionVar += 2;
  }
  _FEUserDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 dictionaryRepresentation];
  id v1 = (void *)_revisionDefaults;
  _revisionDefaults = v0;
}

uint64_t _FEInternalPreferenceUpdateBool(uint64_t a1, void *a2)
{
  *(unsigned char *)(a1 + 4) = [a2 BOOLValue];
  return 1;
}

uint64_t _FEInternalPreferenceSync(int a1, _DWORD *a2, uint64_t a3, uint64_t (*a4)(_DWORD *))
{
  uint64_t v7 = objc_msgSend((id)_revisionDefaults, "objectForKey:");
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v7 = a4(a2);
    uint64_t v8 = v10;
    a1 += v7;
  }
  *a2 = a1;
  return MEMORY[0x270F9A758](v7, v8);
}

void sub_24F405BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitCoreLibraryCore_2()
{
  if (!UIKitCoreLibraryCore_frameworkLibrary_1) {
    UIKitCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  return UIKitCoreLibraryCore_frameworkLibrary_1;
}

uint64_t __UIKitCoreLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  UIKitCoreLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getUIApplicationClass_block_invoke_0(uint64_t a1)
{
  UIKitCoreLibraryCore_2();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_269A11C78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_24F4082CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

CFTypeRef _OpaqueRetain(int a1, CFTypeRef cf)
{
  return CFRetain(cf);
}

void _OpaqueRelease(int a1, CFTypeRef cf)
{
}

uint64_t _OpaqueIsEqual(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return objc_msgSend(a1, "isEqual:", a2, v2, v3);
  }
}

void _CGRectValueFree(int a1, void *a2)
{
}

BOOL _CGRectValueIsEqual(CGRect *a1, CGRect *a2)
{
  return CGRectEqualToRect(*a1, *a2);
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

void _FEFocusRegionSearchContextAddChildItemsInEnvironmentContainer(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v29 = v7;
  id v10 = v8;
  uint64_t v11 = [v10 _focusItemContainer];
  if (v11)
  {
    uint64_t v12 = [v29 searchArea];
    uint64_t v13 = [v12 coordinateSpace];
    double v14 = _FEFocusEnvironmentContainerFrameInCoordinateSpace(v10, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    uint64_t v21 = [v29 searchArea];
    LODWORD(v13) = objc_msgSend(v21, "intersectsRect:", v14, v16, v18, v20);

    if (v13)
    {
      CGFloat v22 = _FEFocusItemSafeCast(v10);
      CGFloat v23 = [v29 searchInfo];
      int v24 = [v23 treatFocusableItemAsLeaf];

      if (v24)
      {
        if (_UITVFocusItemAllowsFocusInChildrenWhenFocused(v22))
        {
          int v25 = 1;
          if (_FEFocusItemIsFocused(v22) || !v22) {
            goto LABEL_12;
          }
          goto LABEL_10;
        }
        if (v22)
        {
LABEL_10:
          CGFloat v26 = [v29 focusSystem];
          double v27 = [v29 searchInfo];
          int v25 = _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(v22, v26, v27) ^ 1;

LABEL_12:
          goto LABEL_13;
        }
      }
      int v25 = 1;
      goto LABEL_12;
    }
  }
  int v25 = 0;
LABEL_13:

  if (v9 && v25)
  {
    CGFloat v28 = +[_FEFocusEnvironmentContainerTuple tupleWithOwningEnvironment:v10 itemContainer:v9];
    _FEFocusItemContainerAddChildItemsInContextWithOptions(v28, v29, a4 & 0xFFFFFF);
  }
}

void _FEFocusRegionSearchContextSearchForFocusRegionsInEnvironment(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = _FEFocusItemSafeCast(v6);
  id v8 = [v6 _focusItemContainer];
  long long v32 = [v8 _focusCoordinateSpace];
  int v9 = _UITVFocusItemAddsChildFocusItemsBeforeSelf(v7);
  id v10 = [v5 searchArea];
  uint64_t v11 = [v5 coordinateSpace];
  if (v9) {
    _FEFocusRegionSearchContextAddChildItemsInEnvironmentContainer(v5, v6, v8, a3 & 0xFFFFFF);
  }
  if (v7 && (a3 & 1) != 0)
  {
    if ((_UITVFocusItemAddsChildFocusItemsButNotSelf(v7) & 1) == 0)
    {
      uint64_t v12 = objc_msgSend(v5, "searchInfo", v32);
      int v13 = [v12 shouldIncludeFocusItem:v7];

      if (v13)
      {
        double v14 = _FEFocusItemFrameInCoordinateSpace(v7, v11);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        if (objc_msgSend(v10, "intersectsRect:"))
        {
          if ((_FEFocusItemIsLegacyTransparentFocusRegionInSearchContext(v7, v5) & 1) == 0)
          {
            uint64_t v21 = [_FEFocusItemRegion alloc];
            CGFloat v22 = [v5 focusSystem];
            CGFloat v23 = -[_FEFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v21, "initWithFrame:coordinateSpace:item:focusSystem:", v11, v7, v22, v14, v16, v18, v20);

            [v5 addRegion:v23];
          }
        }
      }
    }
    id v24 = v5;
    id v25 = v7;
  }
  else
  {
    id v26 = v5;
    id v27 = v7;
    if (!v7) {
      goto LABEL_14;
    }
  }
  uint64_t v28 = _FEFocusItemFocusSpeedBumpEdges(v7);
  if (v28)
  {
    uint64_t v29 = v28;
    long long v30 = [v5 coordinateSpace];
    v35.origin.double x = _FEFocusItemFrameInCoordinateSpace(v7, v30);
    CGRect v36 = CGRectInset(v35, -1.0, -1.0);
    long long v31 = -[_FEFocusSpeedBumpRegion initWithFrame:coordinateSpace:speedBumpEdges:]([_FEFocusSpeedBumpRegion alloc], "initWithFrame:coordinateSpace:speedBumpEdges:", v30, v29, v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    [v5 addRegion:v31];
  }
LABEL_14:

  if ((v9 & 1) == 0) {
    _FEFocusRegionSearchContextAddChildItemsInEnvironmentContainer(v5, v6, v8, a3 & 0xFFFFFF);
  }
  id v33 = v5;
  if ((_FEFocusItemContainerSupportsInvalidatingFocusCache(v8) & 1) == 0) {
    [v33 markContainerAsProvidingDynamicContent];
  }
}

uint64_t _UIEffectiveFocusRegionBoundariesForHeading(uint64_t result, char a2)
{
  if (result)
  {
    if (result == 15)
    {
      return 111;
    }
    else
    {
      uint64_t v2 = result & 0x10;
      if ((result & 0x24) != 0) {
        uint64_t v3 = result & 0x10 | 0x24;
      }
      else {
        uint64_t v3 = result & 0x10;
      }
      if ((result & 0x41) != 0) {
        v3 |= 0x41uLL;
      }
      if (a2) {
        uint64_t v2 = v3;
      }
      if ((result & 0x21) != 0) {
        uint64_t v4 = v2 | 0x21;
      }
      else {
        uint64_t v4 = v2;
      }
      if ((result & 0x44) != 0) {
        v4 |= 0x44uLL;
      }
      if ((a2 & 2) != 0) {
        uint64_t v2 = v4;
      }
      if ((result & 0x28) != 0) {
        uint64_t v5 = v2 | 0x28;
      }
      else {
        uint64_t v5 = v2;
      }
      if ((result & 0x42) != 0) {
        v5 |= 0x42uLL;
      }
      if ((a2 & 0x24) != 0) {
        uint64_t v2 = v5;
      }
      if ((result & 0x22) != 0) {
        uint64_t v6 = v2 | 0x22;
      }
      else {
        uint64_t v6 = v2;
      }
      if ((result & 0x48) != 0) {
        v6 |= 0x48uLL;
      }
      if ((a2 & 0x18) != 0) {
        return v6;
      }
      else {
        return v2;
      }
    }
  }
  return result;
}

__CFString *_FEStringFromCGRect(double a1, double a2, double a3, double a4)
{
  uint64_t v4 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{{%.*g, %.*g}, {%.*g, %.*g}}", 17, *(void *)&a1, 17, *(void *)&a2, 17, *(void *)&a3, 17, *(void *)&a4);
  return v4;
}

uint64_t SplitBracesAndComma(void *a1, CFStringRef *a2, CFStringRef *a3)
{
  uint64_t v3 = a1;
  if (CFStringGetLength(@",") != 1)
  {
    double v19 = [MEMORY[0x263F08690] currentHandler];
    double v20 = objc_msgSend(NSString, "stringWithUTF8String:", "void ParseBracesWithDelimiter(CFStringRef, CFStringRef, CFIndex *, CFIndex *, CFIndex *, NSInteger *)");
    [v19 handleFailureInFunction:v20 file:@"_FEGeometry.m" lineNumber:25 description:@"Parsing allows delimiter of length 1 only"];
  }
  if (qword_269A11C88 != -1) {
    dispatch_once(&qword_269A11C88, &__block_literal_global_5);
  }
  CFIndex v24 = 0;
  MutableCopCGFloat y = CFCharacterSetCreateMutableCopy(0, (CFCharacterSetRef)_MergedGlobals_7);
  CFCharacterSetAddCharactersInString(MutableCopy, @",");
  CFIndex Length = CFStringGetLength(v3);
  result.CFIndex location = 0;
  result.length = 0;
  CharacterAtIndedouble x = CFStringGetCharacterAtIndex(@",", 0);
  if (Length < 1)
  {
    uint64_t v9 = 0;
    CFIndex location = -1;
  }
  else
  {
    int v7 = 0;
    CFIndex v8 = 0;
    uint64_t v9 = 0;
    int v10 = CharacterAtIndex;
    uint64_t v21 = &v24;
    CFIndex location = -1;
    CFIndex v12 = Length;
    CFIndex v13 = -1;
    while (1)
    {
      v26.CFIndex location = v8;
      v26.length = v12;
      if (!CFStringFindCharacterFromSet(v3, MutableCopy, v26, 0, &result)) {
        break;
      }
      if (result.location >= Length || result.length != 1) {
        break;
      }
      int v15 = CFStringGetCharacterAtIndex(v3, result.location);
      if ((v15 & 0xFFFFFFDF) == 0x5B)
      {
        if (!v7) {
          CFIndex location = result.location;
        }
        ++v7;
      }
      else if (v10 == v15)
      {
        if (v7 == 1)
        {
          if (v9 <= 0) {
            *v21++ = result.location;
          }
          uint64_t v9 = 1;
          int v7 = 1;
        }
      }
      else if ((v15 & 0xFFFFFFDF) == 0x5D && !--v7)
      {
        CFIndex v13 = result.location;
        goto LABEL_30;
      }
      if (result.location + 1 < Length)
      {
        v12 += v8 + ~result.location;
        CFIndex v8 = result.location + 1;
        if (v12 > 0) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  CFIndex v13 = -1;
LABEL_30:
  CFRelease(MutableCopy);
  uint64_t v16 = 0;
  if (location != -1 && v13 != -1 && v9 == 1 && location < v13)
  {
    uint64_t v16 = 0;
    CFIndex v17 = v24;
    if (v24 > location + 1 && v24 < v13 - 1)
    {
      v27.length = v24 + ~location;
      v27.CFIndex location = location + 1;
      *a2 = CFStringCreateWithSubstring(0, v3, v27);
      v28.CFIndex location = v17 + 1;
      v28.length = v13 + ~v17;
      *a3 = CFStringCreateWithSubstring(0, v3, v28);
      uint64_t v16 = 1;
    }
  }

  return v16;
}

double _FEDistanceBetweenRects(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (CGRectIsNull(*(CGRect *)&a1)) {
    return 1.79769313e308;
  }
  v30.origin.double x = a5;
  v30.origin.CGFloat y = a6;
  v30.size.CGFloat width = a7;
  v30.size.CGFloat height = a8;
  if (CGRectIsNull(v30)) {
    return 1.79769313e308;
  }
  v31.origin.double x = a1;
  v31.origin.CGFloat y = a2;
  v31.size.CGFloat width = a3;
  v31.size.CGFloat height = a4;
  v40.origin.double x = a5;
  v40.origin.CGFloat y = a6;
  v40.size.CGFloat width = a7;
  v40.size.CGFloat height = a8;
  BOOL v17 = CGRectIntersectsRect(v31, v40);
  double result = 0.0;
  if (!v17)
  {
    v32.origin.double x = a1;
    v32.origin.CGFloat y = a2;
    v32.size.CGFloat width = a3;
    v32.size.CGFloat height = a4;
    double MinX = CGRectGetMinX(v32);
    v33.origin.double x = a1;
    v33.origin.CGFloat y = a2;
    v33.size.CGFloat width = a3;
    v33.size.CGFloat height = a4;
    double MinY = CGRectGetMinY(v33);
    v34.origin.double x = a1;
    v34.origin.CGFloat y = a2;
    v34.size.CGFloat width = a3;
    v34.size.CGFloat height = a4;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.double x = a1;
    v35.origin.CGFloat y = a2;
    v35.size.CGFloat width = a3;
    v35.size.CGFloat height = a4;
    double MaxY = CGRectGetMaxY(v35);
    v36.origin.double x = a5;
    v36.origin.CGFloat y = a6;
    v36.size.CGFloat width = a7;
    v36.size.CGFloat height = a8;
    double v19 = CGRectGetMinX(v36);
    v37.origin.double x = a5;
    v37.origin.CGFloat y = a6;
    v37.size.CGFloat width = a7;
    v37.size.CGFloat height = a8;
    double v20 = CGRectGetMinY(v37);
    v38.origin.double x = a5;
    v38.origin.CGFloat y = a6;
    v38.size.CGFloat width = a7;
    v38.size.CGFloat height = a8;
    double v21 = CGRectGetMaxX(v38);
    v39.origin.double x = a5;
    v39.origin.CGFloat y = a6;
    v39.size.CGFloat width = a7;
    v39.size.CGFloat height = a8;
    double v22 = CGRectGetMaxY(v39);
    if (v21 <= MinX && v22 <= MinY)
    {
      double v23 = MinX - v21;
LABEL_9:
      double v24 = MinY - v22;
      double v25 = v23;
LABEL_14:
      return hypot(v25, v24);
    }
    if (v21 > MinX || MaxY > v20)
    {
      if (MaxX <= v19 && v22 <= MinY)
      {
        double v23 = v19 - MaxX;
        goto LABEL_9;
      }
      if (MaxX > v19 || MaxY > v20)
      {
        if (v21 <= MinX) {
          return MinX - v21;
        }
        if (MaxX <= v19) {
          return v19 - MaxX;
        }
        if (v22 <= MinY) {
          return MinY - v22;
        }
        if (MaxY <= v20) {
          return v20 - MaxY;
        }
        return 1.79769313e308;
      }
      double v25 = v19 - MaxX;
    }
    else
    {
      double v25 = MinX - v21;
    }
    double v24 = v20 - MaxY;
    goto LABEL_14;
  }
  return result;
}

CFCharacterSetRef __ParseBracesWithDelimiter_block_invoke()
{
  CFCharacterSetRef result = CFCharacterSetCreateWithCharactersInString(0, @"{[]}");
  _MergedGlobals_7 = (uint64_t)result;
  return result;
}

void sub_24F40D03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_24F40F744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24F40FBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UITreeFirstCommonAncestor(void *a1, void *a2, const char *a3)
{
  id v5 = a1;
  id v6 = a2;
  int v7 = v6;
  id v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_18;
  }
  if (v5 == v6)
  {
    id v8 = v5;
    goto LABEL_18;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:514 capacity:20];
  BOOL v10 = 1;
  BOOL v11 = 1;
  unint64_t v12 = (unint64_t)v7;
  unint64_t v13 = (unint64_t)v5;
  while (!v11)
  {
    unint64_t v13 = 0;
    if (v10) {
      goto LABEL_10;
    }
LABEL_8:
    unint64_t v12 = 0;
LABEL_12:
    BOOL v11 = v13 != 0;
    BOOL v10 = v12 != 0;
    if (!(v13 | v12))
    {
      id v8 = 0;
      goto LABEL_17;
    }
  }
  if ([v9 containsObject:v13]) {
    goto LABEL_16;
  }
  [v9 addObject:v13];
  unint64_t v13 = (unint64_t)[(id)v13 a3];
  if (!v10) {
    goto LABEL_8;
  }
LABEL_10:
  if (([v9 containsObject:v12] & 1) == 0)
  {
    [v9 addObject:v12];
    unint64_t v12 = (unint64_t)[(id)v12 a3];
    goto LABEL_12;
  }
  unint64_t v13 = v12;
LABEL_16:
  id v8 = (id)v13;
LABEL_17:

LABEL_18:
  return v8;
}

BOOL __recursePreOrderDepthFirstTraversal(void *a1, const char *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a1;
  BOOL v10 = a4;
  BOOL v11 = a5;
  if (v9)
  {
    unsigned __int8 Traversal = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v9;
    id obj = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * v15);
        if (v10) {
          uint64_t v17 = v10[2](v10, *(void *)(*((void *)&v24 + 1) + 8 * v15), a3, &Traversal);
        }
        else {
          uint64_t v17 = 1;
        }
        int v18 = Traversal;
        if (v17 && !Traversal)
        {
          double v19 = [v16 a2];
          unsigned __int8 Traversal = __recursePreOrderDepthFirstTraversal(v19, a2, a3 + 1, v10, v11);

          int v18 = Traversal;
        }
        if (v11 && !v18)
        {
          v11[2](v11, v16, a3, v17, &Traversal);
          int v18 = Traversal;
        }
        if (v18) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    BOOL v20 = Traversal != 0;
    id v9 = v22;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

void sub_24F4114EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

double _FEFocusMapDistanceToRegionBoundary(uint64_t a1, unsigned int a2, void *a3, uint64_t a4, uint64_t a5, void *a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  id v19 = a3;
  [a6 snapshotFrameForRegion:a1];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  uint64_t v28 = [v19 heading];
  unint64_t v29 = v28;
  if (a4)
  {
    if (a4 != 1)
    {
      double v36 = 1.79769313e308;
      goto LABEL_27;
    }
    v62.origin.double x = v21;
    v62.origin.CGFloat y = v23;
    v62.size.CGFloat width = v25;
    v62.size.CGFloat height = v27;
    double MidX = CGRectGetMidX(v62);
    v63.origin.double x = v21;
    v63.origin.CGFloat y = v23;
    v63.size.CGFloat width = v25;
    v63.size.CGFloat height = v27;
    double MidY = CGRectGetMidY(v63);
    if ((a2 & 0x10) != 0) {
      goto LABEL_10;
    }
    if ((a2 & 0x20) != 0 && (v29 & 1) != 0 || (a2 & 0x40) != 0 && (v29 & 2) != 0)
    {
      char v31 = 2;
    }
    else
    {
      BOOL v55 = (a2 & 0x20) == 0;
      if ((v29 & 2) == 0) {
        BOOL v55 = 1;
      }
      char v31 = 1;
      if ((((a2 & 0x40) != 0) & v29) == 0 && v55)
      {
        unint64_t v56 = v29 & 0x218;
        BOOL v57 = (a2 & 0x40) == 0 || v56 == 0;
        BOOL v58 = v57;
        char v31 = 8;
        if ((((v29 & 0x124) != 0) & (a2 >> 5)) == 0 && v58)
        {
          BOOL v59 = (a2 & 0x20) == 0 || v56 == 0;
          BOOL v60 = v59;
          char v31 = 4;
          if ((((v29 & 0x124) != 0) & (a2 >> 6)) == 0 && v60) {
            goto LABEL_10;
          }
        }
      }
    }
    double MidX = _UIRectDeparturePointAlongFocusHeading(v31, v21, v23, v25, v27);
    double MidY = v32;
LABEL_10:
    double v33 = MidY;
    v64.origin.double x = a7;
    v64.origin.CGFloat y = a8;
    v64.size.CGFloat width = a9;
    v64.size.CGFloat height = a10;
    double v34 = CGRectGetMidX(v64);
    v65.origin.double x = a7;
    v65.origin.CGFloat y = a8;
    v65.size.CGFloat width = a9;
    v65.size.CGFloat height = a10;
    CGFloat v35 = CGRectGetMidY(v65);
    double v36 = hypot(MidX - v34, v33 - v35);
    goto LABEL_27;
  }
  double v37 = _UIRectDeparturePointAlongFocusHeading(v28, a7, a8, a9, a10);
  double v39 = v38;
  BOOL v40 = (v29 & 3) != 0;
  if ((v29 & 0xC) == 0) {
    BOOL v40 = 0;
  }
  BOOL v41 = a5 == 2 && v40;
  if ((a2 & 0x10) != 0 || v41)
  {
    v66.origin.double x = v21;
    v66.origin.CGFloat y = v23;
    v66.size.CGFloat width = v25;
    v66.size.CGFloat height = v27;
    CGFloat v47 = CGRectGetMidX(v66);
    v67.origin.double x = v21;
    v67.origin.CGFloat y = v23;
    v67.size.CGFloat width = v25;
    v67.size.CGFloat height = v27;
    double v23 = CGRectGetMidY(v67);
    double v21 = v47;
  }
  else
  {
    if ((a2 & 0x20) != 0)
    {
      uint64_t v46 = (v29 >> 1) & 0x114 | (2 * (int)v29) & 0x228 | (__rbit32(v29) >> 30);
      double v42 = v21;
      double v43 = v23;
      double v44 = v25;
      double v45 = v27;
    }
    else
    {
      if ((a2 & 0x40) == 0) {
        goto LABEL_25;
      }
      double v42 = v21;
      double v43 = v23;
      double v44 = v25;
      double v45 = v27;
      LOBYTE(v46) = v29;
    }
    double v21 = _UIRectDeparturePointAlongFocusHeading(v46, v42, v43, v44, v45);
    double v23 = v48;
  }
LABEL_25:
  _UIPointAxisAlignedDistanceAlongFocusHeading(v29, v37, v39, v21, v23);
  double v36 = v49;
  if (v41)
  {
    double v50 = atan2(v23 - v39, v21 - v37);
    [v19 _velocity];
    long double v52 = v51;
    [v19 _velocity];
    double v36 = v36 * (vabdd_f64(atan2(v52, v53), v50) / 0.785398163 + 1.0);
  }
LABEL_27:

  return round(v36);
}

void __addChildFocusGroupsRecursively(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  [v4 addObject:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(v3, "childGroups", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        __addChildFocusGroupsRecursively(*(void *)(*((void *)&v10 + 1) + 8 * v9++), v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void sub_24F416818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

BOOL _FEFocusItemIsFocused(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"BOOL _FEFocusItemIsFocused(__strong id<_FEFocusItem> _Nonnull)"];
    [v6 handleFailureInFunction:v7, @"_FEFocusItem.m", 57, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];
  }
  uint64_t v2 = +[_FEFocusSystem focusSystemForEnvironment:v1];
  id v3 = [v2 focusedItem];
  BOOL v4 = v3 == v1;

  return v4;
}

uint64_t _FEFocusItemIsFocusedOrFocusable(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"BOOL _FEFocusItemIsFocusedOrFocusable(__strong id<_FEFocusItem> _Nonnull)"];
    [v5 handleFailureInFunction:v6, @"_FEFocusItem.m", 64, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];
  }
  uint64_t v2 = +[_FEFocusSystem focusSystemForEnvironment:v1];
  if (v2) {
    uint64_t IsFocusedOrFocusableInFocusSystem = __UIFocusItemIsFocusedOrFocusableInFocusSystem(v1, v2, 0, 1);
  }
  else {
    uint64_t IsFocusedOrFocusableInFocusSystem = 0;
  }

  return IsFocusedOrFocusableInFocusSystem;
}

uint64_t __UIFocusItemIsFocusedOrFocusableInFocusSystem(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL __UIFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem>, _FEFocusSystem *__strong, BOOL, BOOL)");
    [v16 handleFailureInFunction:v17, @"_FEFocusItem.m", 32, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  int v18 = [MEMORY[0x263F08690] currentHandler];
  id v19 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL __UIFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem>, _FEFocusSystem *__strong, BOOL, BOOL)");
  [v18 handleFailureInFunction:v19, @"_FEFocusItem.m", 33, @"Invalid parameter not satisfying: %@", @"focusSystem" file lineNumber description];

LABEL_3:
  if (_FEFocusItemCanBecomeFocused(v7, v9)) {
    int IsEligibleForFocusInteraction = _FEFocusEnvironmentIsEligibleForFocusInteraction(v7);
  }
  else {
    int IsEligibleForFocusInteraction = 0;
  }
  BOOL v11 = 0;
  if ((IsEligibleForFocusInteraction & 1) == 0 && a4)
  {
    id v12 = [v9 focusedItem];
    BOOL v11 = v12 == v7;
  }
  uint64_t v13 = IsEligibleForFocusInteraction | v11;
  if (v13 == 1 && a3)
  {
    uint64_t v14 = +[_FEFocusSystem focusSystemForEnvironment:v7];
    uint64_t v13 = v14 == v9;
  }
  return v13;
}

uint64_t _FEFocusItemIsFocusedOrFocusableInFocusSystem(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    [v8 handleFailureInFunction:v9, @"_FEFocusItem.m", 74, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    long long v10 = [MEMORY[0x263F08690] currentHandler];
    BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusedOrFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    [v10 handleFailureInFunction:v11, @"_FEFocusItem.m", 75, @"Invalid parameter not satisfying: %@", @"focusSystem" file lineNumber description];

    goto LABEL_3;
  }
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t IsFocusedOrFocusableInFocusSystem = __UIFocusItemIsFocusedOrFocusableInFocusSystem(v3, v5, 1, 1);

  return IsFocusedOrFocusableInFocusSystem;
}

uint64_t _FEFocusItemIsFocusableInFocusSystem(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    [v8 handleFailureInFunction:v9, @"_FEFocusItem.m", 81, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    long long v10 = [MEMORY[0x263F08690] currentHandler];
    BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystem(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    [v10 handleFailureInFunction:v11, @"_FEFocusItem.m", 82, @"Invalid parameter not satisfying: %@", @"focusSystem" file lineNumber description];

    goto LABEL_3;
  }
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t IsFocusedOrFocusableInFocusSystem = __UIFocusItemIsFocusedOrFocusableInFocusSystem(v3, v5, 1, 0);

  return IsFocusedOrFocusableInFocusSystem;
}

uint64_t _FEFocusItemCanBecomeFocused(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    long long v10 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusItemCanBecomeFocused(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull)");
    [v9 handleFailureInFunction:v10, @"_FEFocusItem.m", 90, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];
  }
  if ([v3 _canBecomeFocused])
  {
    id v5 = [v4 behavior];
    int v6 = [v5 disablesFocusabilityForItemsContainingFocus];

    if (v6) {
      uint64_t v7 = [v4 _focusedItemIsContainedInEnvironment:v3 includeSelf:0] ^ 1;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v10 = [MEMORY[0x263F08690] currentHandler];
    BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull, _FEFocusSearchInfo *__strong _Nonnull)");
    [v10 handleFailureInFunction:v11, @"_FEFocusItem.m", 102, @"Invalid parameter not satisfying: %@", @"item" file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  id v12 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(__strong id<_FEFocusItem> _Nonnull, _FEFocusSystem *__strong _Nonnull, _FEFocusSearchInfo *__strong _Nonnull)");
  [v12 handleFailureInFunction:v13, @"_FEFocusItem.m", 103, @"Invalid parameter not satisfying: %@", @"focusSystem" file lineNumber description];

LABEL_3:
  uint64_t v8 = 0;
  if (__UIFocusItemIsFocusedOrFocusableInFocusSystem(v5, v6, 1, 0)) {
    uint64_t v8 = [v7 shouldIncludeFocusItem:v5];
  }

  return v8;
}

uint64_t _FEFocusItemIsLegacyTransparentFocusRegionInSearchContext(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v5 = +[_FEFocusSystem focusSystemForEnvironment:v3];
  id v6 = [v5 behavior];
  if (![v6 legacyIsTransparentFocusRegionSupported])
  {

LABEL_6:
    goto LABEL_7;
  }
  int IsViewOrRespondsToSelector = _FEFocusItemIsViewOrRespondsToSelector(v3);

  if (IsViewOrRespondsToSelector)
  {
    if ([v3 _isTransparentFocusRegion])
    {
      *((unsigned char *)v18 + 24) = 1;
      goto LABEL_7;
    }
    long long v10 = [v4 focusSystem];
    BOOL v11 = [v4 searchInfo];
    char IsFocusableInFocusSystemWithSearchInfo = _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(v3, v10, v11);

    uint64_t v13 = +[_FEFocusSystem focusSystemForEnvironment:v3];
    id v14 = [v13 focusedItem];

    char v15 = v14 == v3 ? 1 : IsFocusableInFocusSystemWithSearchInfo;
    if ((v15 & 1) == 0)
    {
      id v5 = [v3 _parentFocusEnvironment];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = ___FEFocusItemIsLegacyTransparentFocusRegionInSearchContext_block_invoke;
      v16[3] = &unk_265328370;
      v16[4] = &v17;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(v5, v16);
      goto LABEL_6;
    }
  }
LABEL_7:
  uint64_t v8 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void sub_24F41870C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FEFocusItemIsTransparentFocusItem(void *a1)
{
  id v1 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v1)) {
    uint64_t v2 = [v1 _isTransparentFocusItem];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _UITVFocusItemAllowsFocusInChildrenWhenFocused(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && _FEFocusItemIsViewOrRespondsToSelector(v1)) {
    uint64_t v3 = [v2 _tvAllowsFocusInChildrenWhenFocused];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _UITVFocusItemAddsChildFocusItemsBeforeSelf(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && _FEFocusItemIsViewOrRespondsToSelector(v1)) {
    uint64_t v3 = [v2 _tvAddsChildFocusItemsBeforeSelf];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _UITVFocusItemAddsChildFocusItemsButNotSelf(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && _FEFocusItemIsViewOrRespondsToSelector(v1)) {
    uint64_t v3 = [v2 _tvAddsChildFocusItemsButNotSelf];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id _UIParentCoordinateSpaceForFocusItem(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 _parentFocusEnvironment];
  uint64_t v3 = [v2 _focusItemContainer];
  id v4 = [v3 _focusCoordinateSpace];

  if (!v4)
  {
    id v5 = logger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v7 = [v1 debugDescription];
      uint64_t v8 = [v1 _parentFocusEnvironment];
      uint64_t v9 = [v8 debugDescription];
      long long v10 = [v1 _parentFocusEnvironment];
      BOOL v11 = [v10 _focusItemContainer];
      id v12 = [v11 debugDescription];
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      int v18 = v12;
      _os_log_fault_impl(&dword_24F3F0000, v5, OS_LOG_TYPE_FAULT, "_FEFocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@ has no coordinate space.", (uint8_t *)&v13, 0x20u);
    }
  }

  return v4;
}

double _FEFocusItemFrameInCoordinateSpace(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && v4 && (_FEFocusItemIsViewOrRespondsToSelector(v3) & 1) != 0)
  {
    id v6 = _UIParentCoordinateSpaceForFocusItem(v3);
    if (v6)
    {
      [v3 _focusFrame];
      objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5);
      double v8 = v7;
    }
    else
    {
      double v8 = *MEMORY[0x263F001A0];
    }
  }
  else
  {
    double v8 = *MEMORY[0x263F001A0];
  }

  return v8;
}

uint64_t _FEFocusDeferralModeForItem(void *a1)
{
  id v1 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v1)) {
    uint64_t v2 = [v1 _focusDeferralMode];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _FEFocusItemFocusSpeedBumpEdges(void *a1)
{
  id v1 = a1;
  if (_FEFocusItemIsViewOrRespondsToSelector(v1)) {
    uint64_t v2 = [v1 _focusSpeedBumpEdges];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _FEProcessIsBeingDebugged()
{
  uint64_t v36 = *MEMORY[0x263EF8340];
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
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(void *)double v33 = 0xE00000001;
  int v34 = 1;
  pid_t v35 = getpid();
  size_t v1 = 648;
  sysctl(v33, 4u, v2, &v1, 0, 0);
  return (v3 >> 11) & 1;
}

id _FEFocusItemSafeCast(void *a1)
{
  id v1 = a1;
  if (UIKitCoreLibraryCore_3() && (objc_msgSend(v1, "__isKindOfUIView") & 1) != 0
    || [v1 conformsToProtocol:&unk_2700DAB20])
  {
    id v2 = v1;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t UIKitCoreLibraryCore_3()
{
  if (!UIKitCoreLibraryCore_frameworkLibrary_3) {
    UIKitCoreLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  return UIKitCoreLibraryCore_frameworkLibrary_3;
}

uint64_t __UIKitCoreLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  UIKitCoreLibraryCore_frameworkLibrary_3 = result;
  return result;
}

uint64_t _FEFocusGetSensitivitySetting()
{
  if (_MergedGlobals_8 != -1) {
    dispatch_once(&_MergedGlobals_8, &__block_literal_global_7);
  }
  uint64_t result = _FEFocusSensitivityCachedSetting;
  if (_FEFocusSensitivityCachedSetting == -1)
  {
    if (qword_269A11CA0 != -1) {
      dispatch_once(&qword_269A11CA0, &__block_literal_global_18);
    }
    id v1 = [(id)qword_269A11C98 objectForKey:@"_FEFocusSensitivitySetting"];
    id v2 = v1;
    if (v1) {
      uint64_t v3 = [v1 integerValue];
    }
    else {
      uint64_t v3 = 1;
    }
    _FEFocusSensitivityCachedSetting = v3;

    return _FEFocusSensitivityCachedSetting;
  }
  return result;
}

void _FEFocusClearCachedSensitivitySettingObserver()
{
  _FEFocusSensitivityCachedSetting = -1;
}

void _FEFocusSetSensitivitySetting(uint64_t a1)
{
  if (qword_269A11CA0 != -1) {
    dispatch_once(&qword_269A11CA0, &__block_literal_global_18);
  }
  id v2 = NSNumber;
  id v3 = (id)qword_269A11C98;
  id v6 = [v2 numberWithInteger:a1];
  objc_msgSend(v3, "setObject:forKey:");
  int v4 = [v3 synchronize];

  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"_FEFocusSensitivityUpdateNotification", 0, 0, 1u);
    _FEFocusSensitivityCachedSetting = -1;
  }
}

void sub_24F41AE5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

double _FEFocusShiftAndExpandRectAlongFocusMovement(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a1;
  int v10 = [v9 _isLinearMovement];
  char v11 = [v9 heading];

  v34.origin.double x = a2;
  v34.origin.double y = a3;
  v34.size.double width = a4;
  v34.size.double height = a5;
  CGRect v35 = CGRectIntegral(v34);
  double x = v35.origin.x;
  double y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;
  double v16 = CGRectGetWidth(v35);
  v36.origin.double x = x;
  v36.origin.double y = y;
  v36.size.double width = width;
  v36.size.double height = height;
  double v17 = -CGRectGetHeight(v36);
  double v18 = 0.0;
  if (v11) {
    double v19 = v17;
  }
  else {
    double v19 = 0.0;
  }
  if ((v11 & 8) != 0) {
    double v20 = -v16;
  }
  else {
    double v20 = 0.0;
  }
  if ((v11 & 2) == 0) {
    double v17 = 0.0;
  }
  if ((v11 & 4) != 0) {
    double v18 = -v16;
  }
  double v21 = x + v18;
  double v22 = width - (v20 + v18);
  double v23 = y + v19;
  double v24 = height - (v19 + v17);
  if (!v10)
  {
    double v25 = _UIVectorForFocusHeading(v11);
    double v32 = v26;
    rect.origin.double x = v21;
    double v27 = v25;
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    CGFloat v28 = v27 * CGRectGetWidth(v37);
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    CGFloat v29 = v32 * CGRectGetHeight(v38);
    v39.origin.double x = rect.origin.x;
    v39.origin.double y = v23;
    v39.size.double width = v22;
    v39.size.double height = v24;
    CGRect v40 = CGRectOffset(v39, v28, v29);
    double v21 = v40.origin.x;
    if (_FERectSmartIntersectsRect(v40.origin.x, v40.origin.y, v40.size.width, v40.size.height, x, y, width, height))
    {
      long long v31 = logger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        LOWORD(rect.origin.y) = 0;
        _os_log_fault_impl(&dword_24F3F0000, v31, OS_LOG_TYPE_FAULT, "Shifting focus search rect in search direction returned an overlapping rect -- this is a UIKit bug.", (uint8_t *)&rect.origin.y, 2u);
      }
    }
  }
  return v21;
}

void sub_24F41E0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_24F41F690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FEAXAssignFocusToItem(void *a1)
{
  return 0;
}

uint64_t _FEAXAssignFocusToItemWithOptions(void *a1)
{
  return 0;
}

double _UIVectorForFocusHeading(char a1)
{
  double result = -1.0;
  double v2 = 0.0;
  if ((a1 & 4) != 0) {
    double v2 = -1.0;
  }
  if ((a1 & 8) != 0) {
    double v2 = 1.0;
  }
  if ((a1 & 0x20) == 0) {
    double result = v2;
  }
  if ((a1 & 0x10) != 0) {
    return 1.0;
  }
  return result;
}

double _UIRectDeparturePointAlongFocusHeading(char a1, double a2, double a3, double a4, double a5)
{
  if ((a1 & 0xC) != 0)
  {
    if ((a1 & 4) != 0) {
      double MinX = CGRectGetMinX(*(CGRect *)&a2);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&a2);
    }
  }
  else
  {
    double MinX = CGRectGetMidX(*(CGRect *)&a2);
  }
  double v11 = MinX;
  double v12 = a2;
  double v13 = a3;
  double v14 = a4;
  double v15 = a5;
  if ((a1 & 3) != 0)
  {
    if (a1) {
      CGRectGetMinY(*(CGRect *)&v12);
    }
    else {
      CGRectGetMaxY(*(CGRect *)&v12);
    }
  }
  else
  {
    CGRectGetMidY(*(CGRect *)&v12);
  }
  return v11;
}

void _UIPointAxisAlignedDistanceAlongFocusHeading(char a1, double a2, double a3, double a4, double a5)
{
  if ((a1 & 3) != 0 && (a1 & 0xC) != 0)
  {
    hypot(a4 - a2, a5 - a3);
    _UIVectorForFocusHeading(a1);
  }
}

BOOL _UIRectIntersectsRectAlongFocusHeading(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if ((a1 & 3) != 0)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&a2);
    v30.origin.double x = a6;
    v30.origin.double y = a7;
    v30.size.double width = a8;
    v30.size.double height = a9;
    if (MinX < CGRectGetMaxX(v30))
    {
      v31.origin.double x = a2;
      v31.origin.double y = a3;
      v31.size.double width = a4;
      v31.size.double height = a5;
      double MaxX = CGRectGetMaxX(v31);
      v32.origin.double x = a6;
      v32.origin.double y = a7;
      v32.size.double width = a8;
      v32.size.double height = a9;
      double v18 = CGRectGetMinX(v32);
      return MaxX > v18;
    }
  }
  else if ((a1 & 0xC) != 0)
  {
    double MinY = CGRectGetMinY(*(CGRect *)&a2);
    v33.origin.double x = a6;
    v33.origin.double y = a7;
    v33.size.double width = a8;
    v33.size.double height = a9;
    if (MinY < CGRectGetMaxY(v33))
    {
      v34.origin.double x = a2;
      v34.origin.double y = a3;
      v34.size.double width = a4;
      v34.size.double height = a5;
      double MaxX = CGRectGetMaxY(v34);
      v35.origin.double x = a6;
      v35.origin.double y = a7;
      v35.size.double width = a8;
      v35.size.double height = a9;
      double v18 = CGRectGetMinY(v35);
      return MaxX > v18;
    }
  }
  return 0;
}

uint64_t _FEFocusRectCompare(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  double v18 = a4 + a6 * 0.5;
  v28.origin.double x = a7;
  v28.origin.double y = a8;
  v28.size.double width = a9;
  v28.size.double height = a10;
  if (CGRectGetMinY(v28) < v18)
  {
    v29.origin.double x = a7;
    v29.origin.double y = a8;
    v29.size.double width = a9;
    v29.size.double height = a10;
    if (v18 < CGRectGetMaxY(v29))
    {
      v30.origin.double x = a7;
      v30.origin.double y = a8;
      v30.size.double width = a9;
      v34.size.double width = a5;
      v30.size.double height = a10;
      v34.origin.double x = a3;
      v34.origin.double y = a4;
      v34.size.double height = a6;
      if (!CGRectContainsRect(v30, v34)) {
        goto LABEL_15;
      }
    }
  }
  double v19 = a8 + a10 * 0.5;
  v31.origin.double x = a3;
  v31.origin.double y = a4;
  v31.size.double width = a5;
  v31.size.double height = a6;
  if (CGRectGetMinY(v31) >= v19) {
    goto LABEL_7;
  }
  v32.origin.double x = a3;
  v32.origin.double y = a4;
  v32.size.double width = a5;
  v32.size.double height = a6;
  if (v19 >= CGRectGetMaxY(v32)) {
    goto LABEL_7;
  }
  v33.origin.double x = a3;
  v33.origin.double y = a4;
  v35.size.double width = a9;
  v33.size.double width = a5;
  v33.size.double height = a6;
  v35.origin.double x = a7;
  v35.origin.double y = a8;
  v35.size.double height = a10;
  if (CGRectContainsRect(v33, v35))
  {
LABEL_7:
    uint64_t v20 = -1;
    if (v18 > v19) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = -1;
    }
    if (v18 <= v19) {
      uint64_t v20 = 1;
    }
    if (a2) {
      return v20;
    }
    else {
      return v21;
    }
  }
  else
  {
LABEL_15:
    double v23 = a3 + a5 * 0.5;
    double v24 = a7 + a9 * 0.5;
    BOOL v25 = v23 >= v24;
    if (!a1) {
      BOOL v25 = v23 <= v24;
    }
    if (v25) {
      return -1;
    }
    else {
      return 1;
    }
  }
}

uint64_t _FEFocusItemCompare(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v5 = [v3 _parentFocusEnvironment];
  id v6 = [v4 _parentFocusEnvironment];
  long long v7 = _FEFocusEnvironmentFirstCommonAncestor(v5, v6);

  long long v8 = +[_FEFocusSystem focusSystemForEnvironment:v7];
  id v9 = [v8 behavior];
  int v10 = [v9 shouldUseAccessibilityCompareForItemGeometry];

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v11 = [v3 accessibilityCompareGeometry:v4];
  }
  else
  {
    id v12 = v7;
    id v13 = v3;
    id v14 = v4;
    double v15 = v12;
    if (!v12)
    {
      double v16 = [v13 _parentFocusEnvironment];
      double v17 = [v14 _parentFocusEnvironment];
      double v15 = _FEFocusEnvironmentFirstCommonAncestor(v16, v17);
    }
    double v18 = +[_FEFocusSystem focusSystemForEnvironment:v15];
    double v19 = [v18 _focusItemContainer];
    uint64_t v20 = [v19 _focusCoordinateSpace];

    [v13 _focusFrame];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [v14 _focusFrame];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    if (v20)
    {
      v60.origin.double x = _FEFocusItemFrameInCoordinateSpace(v13, v20);
      double v55 = v34;
      double v56 = v36;
      double v37 = v22;
      double x = v60.origin.x;
      double v39 = v30;
      double v40 = v24;
      double y = v60.origin.y;
      double v57 = v32;
      double v58 = v28;
      double v42 = v26;
      double width = v60.size.width;
      double height = v60.size.height;
      BOOL IsNull = CGRectIsNull(v60);
      if (!IsNull)
      {
        double v37 = x;
        double v40 = y;
        double v42 = width;
      }
      double v46 = v58;
      if (!IsNull) {
        double v46 = height;
      }
      double v59 = v46;
      v61.origin.double x = _FEFocusItemFrameInCoordinateSpace(v14, v20);
      double v47 = v61.origin.x;
      double v48 = v61.origin.y;
      double v49 = v61.size.width;
      double v50 = v61.size.height;
      BOOL v51 = CGRectIsNull(v61);
      if (!v51) {
        double v39 = v47;
      }
      CGFloat v22 = v37;
      CGFloat v36 = v56;
      double v52 = v57;
      if (!v51) {
        double v52 = v48;
      }
      CGFloat v24 = v40;
      CGFloat v30 = v39;
      CGFloat v34 = v55;
      if (!v51) {
        CGFloat v34 = v49;
      }
      CGFloat v26 = v42;
      if (!v51) {
        CGFloat v36 = v50;
      }
      CGFloat v32 = v52;
      CGFloat v28 = v59;
    }

    long double v53 = +[_FEFocusSystem focusSystemForEnvironment:v12];
    uint64_t v11 = _FEFocusRectCompare([v53 _shouldReverseLayoutDirectionForEnvironment:v12], objc_msgSend(v53, "_shouldReverseLinearWrappingForEnvironment:", v12), v22, v24, v26, v28, v30, v32, v34, v36);
  }
  return v11;
}

id _FEFocusGetNextItemFromList(void *a1, void *a2, __int16 a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!v8)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    id v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id<_FEFocusItem>  _Nonnull _FEFocusGetNextItemFromList(id<_FEFocusItem>  _Nullable __strong, NSArray<id<_FEFocusItem>> *__strong _Nonnull, _FEFocusHeading, BOOL)");
    [v13 handleFailureInFunction:v14, @"_FEFocusGeometry.m", 364, @"Invalid parameter not satisfying: %@", @"list != nil" file lineNumber description];
  }
  if (![v8 count]) {
    goto LABEL_11;
  }
  if ((a3 & 0x300) != 0)
  {
    if ((a3 & 0x100) == 0)
    {
LABEL_6:
      uint64_t v9 = [v8 count] - 1;
      goto LABEL_7;
    }
    goto LABEL_22;
  }
  if (!v7) {
    goto LABEL_22;
  }
  unint64_t v10 = [v8 indexOfObject:v7];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
  uint64_t v9 = v10;
  if ((a3 & 0x10) != 0)
  {
    if (v10 >= [v8 count] - 1)
    {
      if (a4) {
        uint64_t v9 = 0;
      }
      goto LABEL_23;
    }
    ++v9;
LABEL_7:
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
LABEL_11:
    uint64_t v11 = 0;
    goto LABEL_24;
  }
  if ((a3 & 0x20) != 0)
  {
    if (v10)
    {
      uint64_t v9 = v10 - 1;
      goto LABEL_7;
    }
    if (a4) {
      goto LABEL_6;
    }
LABEL_22:
    uint64_t v9 = 0;
  }
LABEL_23:
  uint64_t v11 = [v8 objectAtIndexedSubscript:v9];
LABEL_24:

  return v11;
}

void _FEFocusRectWithMinimumSize(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v8.origin.double x = a1;
    v8.origin.double y = a2;
    v8.size.double width = a3;
    v8.size.double height = a4;
    CGRectStandardize(v8);
  }
}

__CFString *_FEStringFromFocusHeading(uint64_t a1)
{
  if (a1)
  {
    __int16 v1 = a1;
    double v2 = [MEMORY[0x263F089D8] string];
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___FEStringFromFocusHeading_block_invoke;
    v8[3] = &unk_2653287B8;
    id v3 = v2;
    id v9 = v3;
    unint64_t v10 = v11;
    uint64_t v4 = MEMORY[0x25335DA10](v8);
    long long v5 = (void (**)(void, void))v4;
    if (v1) {
      (*(void (**)(uint64_t, __CFString *))(v4 + 16))(v4, @"Up");
    }
    if ((v1 & 2) != 0) {
      ((void (**)(void, __CFString *))v5)[2](v5, @"Down");
    }
    if ((v1 & 4) != 0) {
      ((void (**)(void, __CFString *))v5)[2](v5, @"Left");
    }
    if ((v1 & 8) != 0) {
      ((void (**)(void, __CFString *))v5)[2](v5, @"Right");
    }
    if ((v1 & 0x20) != 0) {
      ((void (**)(void, __CFString *))v5)[2](v5, @"Previous");
    }
    if ((v1 & 0x10) != 0) {
      ((void (**)(void, __CFString *))v5)[2](v5, @"Next");
    }
    if ((v1 & 0x100) != 0) {
      ((void (**)(void, __CFString *))v5)[2](v5, @"First");
    }
    if ((v1 & 0x200) != 0) {
      ((void (**)(void, __CFString *))v5)[2](v5, @"Last");
    }
    id v6 = (__CFString *)v3;

    _Block_object_dispose(v11, 8);
  }
  else
  {
    id v6 = @"None";
  }
  return v6;
}

void sub_24F420A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_FEStringFromGroupFilter(uint64_t a1)
{
  __int16 v1 = @"None";
  if (a1 == 1) {
    __int16 v1 = @"CurrentGroup";
  }
  if (a1 == 2) {
    return @"PrimaryItems";
  }
  else {
    return v1;
  }
}

void sub_24F420C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24F420E50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _FEGetFocusTreeLockVerboseLogging()
{
  if (_FEInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_FEInternalPreferencesRevisionOnce, &__block_literal_global_6);
  }
  int v0 = _FEInternalPreferencesRevisionVar;
  if (_FEInternalPreferencesRevisionVar < 1
    || (int v3 = _FEInternalPreference_FocusTreeLockVerboseLogging,
        _FEInternalPreferencesRevisionVar == _FEInternalPreference_FocusTreeLockVerboseLogging))
  {
    BOOL v1 = 1;
  }
  else
  {
    do
    {
      BOOL v1 = v0 >= v3;
      if (v0 < v3) {
        break;
      }
      _FEInternalPreferenceSync(v0, &_FEInternalPreference_FocusTreeLockVerboseLogging, @"FocusTreeLockVerboseLogging", (uint64_t (*)(_DWORD *))_FEInternalPreferenceUpdateBool);
      int v3 = _FEInternalPreference_FocusTreeLockVerboseLogging;
    }
    while (v0 != _FEInternalPreference_FocusTreeLockVerboseLogging);
  }
  return byte_269A11BF4 || v1;
}

id logger()
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global_8);
  }
  int v0 = (void *)logger_logger;
  return v0;
}

uint64_t __logger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIFocus");
  uint64_t v1 = logger_logger;
  logger_logger = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10718]();
}

uint64_t BSSerializeCGRectToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10908]();
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB960](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB978](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4738](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4748](alloc, theString);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x270EE51A8](str);
  return result;
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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