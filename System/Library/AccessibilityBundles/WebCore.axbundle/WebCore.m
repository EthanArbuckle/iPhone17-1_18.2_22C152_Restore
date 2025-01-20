id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F48F3B0 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t _runLoopExitObserver()
{
  v0 = (void *)WebThreadPreparer;
  if (!WebThreadPreparer)
  {
    _AXAssert();
    v0 = (void *)WebThreadPreparer;
  }

  return [v0 setPreparedThisRunLoop:0];
}

void sub_2404A0E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_2404A1110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A1610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A25F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose((const void *)(v63 - 208), 8);
  _Block_object_dispose((const void *)(v63 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2404A2CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A338C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A3EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A495C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A5428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A5F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

id _processEquationChild(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (!v1)
  {
    id v5 = (id)MEMORY[0x263EFFA78];
    goto LABEL_29;
  }
  v3 = [v1 safeValueForKey:@"accessibilityMathType"];
  char v4 = [v3 isEqualToString:@"AXMathFenceOperator"];
  id v5 = (id)MEMORY[0x263EFFA78];
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = _axMathTypeForWebMathType_onceToken;
    id v7 = v3;
    if (v6 != -1) {
      dispatch_once(&_axMathTypeForWebMathType_onceToken, &__block_literal_global_2119);
    }
    v8 = [(id)_axMathTypeForWebMathType_Mappings objectForKey:v7];

    if (!v8)
    {
      uint64_t v17 = [v2 _accessibilityProcessRootEquation];
      v18 = (void *)v17;
      if (v17) {
        v19 = (void *)v17;
      }
      else {
        v19 = v5;
      }
      id v5 = v19;

      goto LABEL_27;
    }
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = (void *)MEMORY[0x2455E7590]([v5 setObject:v8 forKey:@"AXMType"]);
    if ([v8 isEqualToString:@"Fraction"])
    {
      v10 = [v2 safeValueForKey:@"accessibilityMathNumeratorObject"];
      v11 = _processEquationChild(v10);
      [v5 setObject:v11 forKey:@"AXMNumeratorObject"];

      v12 = [v2 safeValueForKey:@"accessibilityMathDenominatorObject"];
      v13 = _processEquationChild(v12);
      [v5 setObject:v13 forKey:@"AXMDenominatorObject"];

      v14 = [v2 safeValueForKey:@"accessibilityMathLineThickness"];
      uint64_t v15 = [v14 integerValue];

      v16 = [NSNumber numberWithInteger:v15];
      [v5 setObject:v16 forKey:@"AXMLineThickness"];
LABEL_25:

LABEL_26:
LABEL_27:

      goto LABEL_28;
    }
    if (([v8 isEqualToString:@"Fenced"] & 1) != 0
      || ([v8 isEqualToString:@"Row"] & 1) != 0
      || ([v8 isEqualToString:@"Table"] & 1) != 0
      || ([v8 isEqualToString:@"TableRow"] & 1) != 0
      || [v8 isEqualToString:@"TableCell"])
    {
      _retrieveChildrenFromEquation(v2);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v16 forKey:@"AXMChildren"];
      if (![v8 isEqualToString:@"Fenced"]) {
        goto LABEL_25;
      }
      v20 = [v2 safeValueForKey:@"accessibilityMathFencedOpenString"];
      if (v20) {
        [v5 setObject:v20 forKey:@"AXMOpenOperator"];
      }
      v21 = [v2 safeValueForKey:@"accessibilityMathFencedCloseString"];
      if (v21) {
        [v5 setObject:v21 forKey:@"AXMCloseOperator"];
      }
      goto LABEL_23;
    }
    if ([v8 isEqualToString:@"SubSuperScript"])
    {
      uint64_t v23 = [v2 safeValueForKey:@"accessibilityMathBaseObject"];
      v16 = (__CFString *)v23;
      if (v23)
      {
        v24 = _processEquationChild(v23);
        [v5 setObject:v24 forKey:@"AXMBaseObject"];
      }
      uint64_t v25 = [v2 safeValueForKey:@"accessibilityMathSubscriptObject"];
      v20 = (void *)v25;
      if (v25)
      {
        v26 = _processEquationChild(v25);
        [v5 setObject:v26 forKey:@"AXMSubscriptObject"];
      }
      uint64_t v27 = [v2 safeValueForKey:@"accessibilityMathSuperscriptObject"];
      v21 = (void *)v27;
      if (!v27) {
        goto LABEL_23;
      }
      v28 = _processEquationChild(v27);
      v29 = @"AXMSuperscriptObject";
LABEL_53:
      [v5 setObject:v28 forKey:v29];

LABEL_23:
LABEL_24:

      goto LABEL_25;
    }
    if ([v8 isEqualToString:@"UnderOver"])
    {
      uint64_t v30 = [v2 safeValueForKey:@"accessibilityMathBaseObject"];
      v16 = (__CFString *)v30;
      if (v30)
      {
        v31 = _processEquationChild(v30);
        [v5 setObject:v31 forKey:@"AXMBaseObject"];
      }
      uint64_t v32 = [v2 safeValueForKey:@"accessibilityMathUnderObject"];
      v20 = (void *)v32;
      if (v32)
      {
        v33 = _processEquationChild(v32);
        [v5 setObject:v33 forKey:@"AXMUnderObject"];
      }
      uint64_t v34 = [v2 safeValueForKey:@"accessibilityMathOverObject"];
      v21 = (void *)v34;
      if (!v34) {
        goto LABEL_23;
      }
      v28 = _processEquationChild(v34);
      v29 = @"AXMOverObject";
      goto LABEL_53;
    }
    if ([v8 isEqualToString:@"Multiscript"])
    {
      uint64_t v35 = [v2 safeValueForKey:@"accessibilityMathBaseObject"];
      v16 = (__CFString *)v35;
      if (v35)
      {
        v36 = _processEquationChild(v35);
        [v5 setObject:v36 forKey:@"AXMBaseObject"];
      }
      v37 = [v2 safeValueForKey:@"accessibilityMathPrescripts"];
      v20 = v37;
      if (v37)
      {
        v38 = _processMultiscriptArray(v37);
        [v5 setObject:v38 forKey:@"AXMMultiscriptPrescripts"];
      }
      v39 = [v2 safeValueForKey:@"accessibilityMathPostscripts"];
      v21 = v39;
      if (!v39) {
        goto LABEL_23;
      }
      v28 = _processMultiscriptArray(v39);
      v29 = @"AXMMultiscriptPostscripts";
      goto LABEL_53;
    }
    if ([v8 isEqualToString:@"RootOperation"])
    {
      int v40 = [v7 isEqualToString:@"AXMathSquareRoot"];
      v41 = [v2 safeArrayForKey:@"accessibilityMathRadicand"];
      v16 = v41;
      if (v41)
      {
        if (v40 && (unint64_t)[(__CFString *)v41 count] >= 2)
        {
          v42 = _retrieveChildrenFromEquation(v2);
          v43 = [MEMORY[0x263EFF9A0] dictionary];
          [v43 setObject:@"Row" forKey:@"AXMType"];
          [v43 setObject:v42 forKey:@"AXMChildren"];
        }
        else
        {
          v42 = [(__CFString *)v16 objectAtIndex:0];
          v43 = ((void (*)(void))_processEquationChild)();
        }
        [v5 setObject:v43 forKey:@"AXMRadicandObject"];
      }
      uint64_t v47 = [v2 safeValueForKey:@"accessibilityMathRootIndexObject"];
      v48 = (void *)v47;
      if (v47) {
        char v49 = v40;
      }
      else {
        char v49 = 1;
      }
      if ((v49 & 1) == 0)
      {
        v50 = _processEquationChild(v47);
        [v5 setObject:v50 forKey:@"AXMRootIndexObject"];
      }
      goto LABEL_25;
    }
    if (([v8 isEqualToString:@"Text"] & 1) != 0
      || ([v8 isEqualToString:@"Number"] & 1) != 0
      || [v8 isEqualToString:@"Identifier"])
    {
      if ([v2 accessibilityElementCount] != 1) {
        goto LABEL_26;
      }
      v16 = [v2 accessibilityElementAtIndex:0];
      v44 = [(__CFString *)v16 accessibilityLabel];
      v45 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v20 = [v44 stringByTrimmingCharactersInSet:v45];

      if (![v20 length]) {
        goto LABEL_24;
      }
      v46 = @"AXMContent";
      goto LABEL_65;
    }
    if (![v8 isEqualToString:@"Operator"]) {
      goto LABEL_26;
    }
    uint64_t v57 = [v2 accessibilityElementCount];
    if (v57 < 1)
    {
      v16 = &stru_26F48F3B0;
    }
    else
    {
      uint64_t v51 = 0;
      v16 = &stru_26F48F3B0;
      do
      {
        v58 = objc_msgSend(v2, "accessibilityElementAtIndex:", v51, v57);
        v52 = [v58 accessibilityLabel];
        v53 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        v54 = [v52 stringByTrimmingCharactersInSet:v53];

        if ([v54 length])
        {
          uint64_t v55 = [(__CFString *)v16 stringByAppendingString:v54];

          v16 = (__CFString *)v55;
        }

        ++v51;
      }
      while (v57 != v51);
    }
    if ([(__CFString *)v16 isEqualToString:@"⎛⎜⎝", v57])
    {
      v56 = CFSTR("(");
    }
    else if ([(__CFString *)v16 isEqualToString:@"⎞⎟⎠"])
    {
      v56 = @"");
    }
    else if ([(__CFString *)v16 isEqualToString:@"⎡⎢⎣"])
    {
      v56 = @"[";
    }
    else if ([(__CFString *)v16 isEqualToString:@"⎤⎥⎦"])
    {
      v56 = @"]";
    }
    else if ([(__CFString *)v16 isEqualToString:@"⎧⎨⎩"])
    {
      v56 = @"{";
    }
    else
    {
      if (![(__CFString *)v16 isEqualToString:@"⎫⎬⎭"])
      {
LABEL_95:
        [v5 setObject:v16 forKey:@"AXMContent"];
        if (![(__CFString *)v16 length]) {
          goto LABEL_25;
        }
        v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[__CFString characterAtIndex:](v16, "characterAtIndex:", 0));
        v46 = @"AXMUnichar";
LABEL_65:
        [v5 setObject:v20 forKey:v46];
        goto LABEL_24;
      }
      v56 = @"}";
    }

    v16 = v56;
    goto LABEL_95;
  }
LABEL_28:

LABEL_29:

  return v5;
}

void sub_2404A9568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _AXPrintMarkerRangeInfo(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = VOTLogRotor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    _AXPrintMarkerRangeInfo_cold_2(v3, v5);
  }

  uint64_t v6 = VOTLogRotor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    _AXPrintMarkerRangeInfo_cold_1(v3, v4);
  }
}

void sub_2404A9754(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2404A98B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404A9D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_2404ADC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404ADFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CGPathEnumerationCallback(uint64_t a1, uint64_t a2)
{
  id v3 = (void (**)(void, void))MEMORY[0x2455E7770]();
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, a2);
    id v3 = (void (**)(void, void))v4;
  }
}

uint64_t __fuzzyAccessibilityHitTest_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(id *)(a1 + 32) == v7) {
    goto LABEL_13;
  }
  uint64_t v15 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v15) {
      goto LABEL_13;
    }
    v12 = (void *)fuzzyAccessibilityHitTest_hitQueue;
    v13 = v15;
    goto LABEL_12;
  }
  closestDistanceFromObjectCorner(v15, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  float v9 = v8;
  if (v8 > *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    goto LABEL_13;
  }
  v10 = [v15 safeValueForKey:@"accessibilityCanFuzzyHitTest"];
  if (![v10 BOOLValue])
  {

    goto LABEL_11;
  }
  int v11 = [v15 isAccessibilityElement];

  if (!v11)
  {
LABEL_11:
    v12 = (void *)fuzzyAccessibilityHitTest_hitQueue;
    v13 = v15;
LABEL_12:
    [v12 addObject:v13];
    goto LABEL_13;
  }
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (*(float *)(a1 + 80) == 0.0) {
    *a4 = 1;
  }
LABEL_13:

  return MEMORY[0x270F9A828]();
}

uint64_t closestDistanceFromObjectCorner(void *a1, CGFloat a2, CGFloat a3)
{
  id v5 = [a1 safeValueForKey:@"accessibilityElementRect"];
  [v5 rectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  v20.x = a2;
  v20.y = a3;
  uint64_t result = CGRectContainsPoint(v21, v20);
  if ((result & 1) == 0)
  {
    MEMORY[0x270FA5388](0.0);
    uint64_t v15 = 0;
    double v16 = 1.79769313e308;
    double v17 = 1.79769313e308;
    double v18 = 1.79769313e308;
    do
    {
      uint64_t result = AX_CGPointGetDistanceToPoint();
      if (v19 >= v16)
      {
        if (v19 >= v17)
        {
          if (v19 < v18) {
            double v18 = v19;
          }
        }
        else
        {
          double v17 = v19;
        }
      }
      else
      {
        double v16 = v19;
      }
      v15 += 16;
    }
    while (v15 != 144);
  }
  return result;
}

id _retrieveChildrenFromEquation(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [v1 accessibilityElementCount];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v6 = [v1 accessibilityElementAtIndex:i];
      CGFloat v7 = _processEquationChild();

      if ([v7 count]) {
        [v2 addObject:v7];
      }
    }
  }

  return v2;
}

id _processMultiscriptArray(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v15 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v1;
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        CGFloat v7 = [v6 objectForKey:@"AXMSubscriptObject"];
        double v8 = _processEquationChild();
        CGFloat v9 = [v6 objectForKey:@"AXMSuperscriptObject"];
        double v10 = _processEquationChild();
        CGFloat v11 = [MEMORY[0x263EFF9A0] dictionary];
        double v12 = v11;
        if (v7)
        {
          [v11 setObject:v8 forKey:@"AXMSubscriptObject"];
          [v12 setObject:v10 forKey:@"AXMSuperscriptObject"];
        }
        [v15 addObject:v12];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }

  return v15;
}

void ___axMathTypeForWebMathType_block_invoke()
{
  v0 = (void *)_axMathTypeForWebMathType_Mappings;
  _axMathTypeForWebMathType_Mappings = (uint64_t)&unk_26F493E08;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x18u);
}

void _AXUIInstallBaseCategories()
{
  if (_AXUIInstallBaseCategories_onceToken != -1) {
    dispatch_once(&_AXUIInstallBaseCategories_onceToken, &__block_literal_global_1);
  }
}

id AXWebNotificationWithName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _NotificationMap();
  uint64_t v3 = [v2 valueForKey:v1];

  return v3;
}

id _NotificationMap()
{
  if (_NotificationMap_onceToken != -1) {
    dispatch_once(&_NotificationMap_onceToken, &__block_literal_global_267);
  }
  v0 = (void *)_NotificationMap_notificationsMap;

  return v0;
}

id AXWebNotificationName(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  _NotificationMap();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        CGFloat v7 = objc_msgSend(v2, "objectForKeyedSubscript:", v6, (void)v10);
        char v8 = [v7 isEqual:v1];

        if (v8)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

void _AXPrintMarkerRangeInfo_cold_1(void *a1, void *a2)
{
  uint64_t v4 = [a1 firstObject];
  [a2 positionForTextMarker:v4];
  id v5 = [a1 lastObject];
  [a2 positionForTextMarker:v5];
  double v6 = [a2 stringForTextMarkers:a1];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24049D000, v7, v8, "startRange.start = %d, startRange.end = %d, startRange.string = %{public}@", v9, v10, v11, v12, 2u);
}

void _AXPrintMarkerRangeInfo_cold_2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_debug_impl(&dword_24049D000, a2, OS_LOG_TYPE_DEBUG, "startRange.count = %d", (uint8_t *)v3, 8u);
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x270F09808]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F09248]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXLogScrollToVisible()
{
  return MEMORY[0x270F09368]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x270F09380]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x270F0A378]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x270F0A3B0]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E88](allocator, activities, repeats, order, callout, context);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t GSMainScreenScaleFactor()
{
  return MEMORY[0x270F30680]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySceneReferencePointForScreenPoint()
{
  return MEMORY[0x270F809F8]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F80A10]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t VOTLogRotor()
{
  return MEMORY[0x270F095D0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x270F09930]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F095E8]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXServerCacheGetPossiblyNilObjectForKey()
{
  return MEMORY[0x270F80A50]();
}

uint64_t _AXServerCacheInsertPossiblyNilObjectForKey()
{
  return MEMORY[0x270F80A58]();
}

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x270F09968]();
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x270F09980]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityFocusedElementForAssistiveTech()
{
  return MEMORY[0x270F80AB8]();
}

uint64_t _UIAccessibilitySetAssociatedElementContextForNextNotification()
{
  return MEMORY[0x270F80AD8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F09658]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}