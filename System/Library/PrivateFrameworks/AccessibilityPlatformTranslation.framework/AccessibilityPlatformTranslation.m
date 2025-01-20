void notificationBypass(int a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  if (a1 == 1060) {
    _handleElementDestroyed((uint64_t)a3);
  }
  v7 = _convertAXNotification(a1, a4);
  if (v7)
  {
    v8 = v7;
    v17 = 0;
    v9 = _convertAXNotificationForElementWithData(a1, a3, a4, &v17);
    v10 = v17;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __notificationBypass_block_invoke;
    v13[3] = &unk_2649DF0C8;
    v15 = v10;
    v16 = v8;
    v14 = v9;
    v11 = v10;
    v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
}

void _axEventHandler(uint64_t a1, void *a2, int a3, void *a4)
{
  v7 = (void *)MEMORY[0x230FA6B50]();
  if (a3 == 1060) {
    _handleElementDestroyed((uint64_t)a2);
  }
  v8 = +[AXPTranslator sharedInstance];
  v9 = [v8 runtimeDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = _convertAXNotification(a3, a4);
    if (v11)
    {
      uint64_t v12 = v11;
      id v21 = 0;
      v13 = _convertAXNotificationForElementWithData(a3, a2, a4, &v21);
      id v14 = v21;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = ___axEventHandler_block_invoke;
      v17[3] = &unk_2649DF0C8;
      id v19 = v14;
      uint64_t v20 = v12;
      id v18 = v13;
      id v15 = v14;
      id v16 = v13;
      dispatch_async(MEMORY[0x263EF83A0], v17);
    }
  }
}

uint64_t _axBroadcastEventHandler()
{
  return MEMORY[0x270F09928]();
}

uint64_t _appLoadedAccessibilityCallback(uint64_t a1, void *a2)
{
  v3 = AXPlatformTranslationLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E850000, v3, OS_LOG_TYPE_DEFAULT, "Received app accessibility loaded, proceeding...", v5, 2u);
  }

  return [a2 _signalAppAXReady];
}

uint64_t _convertAXError(int a1)
{
  int v1 = a1 + 25218;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
      uint64_t result = 18;
      break;
    case 1:
    case 18:
      uint64_t result = 6;
      break;
    case 2:
      uint64_t result = 10;
      break;
    case 3:
      uint64_t result = 17;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 16;
      break;
    case 6:
      uint64_t result = 15;
      break;
    case 7:
      uint64_t result = 2;
      break;
    case 8:
      uint64_t result = 12;
      break;
    case 9:
      uint64_t result = 11;
      break;
    case 10:
      uint64_t result = 14;
      break;
    case 11:
      uint64_t result = 13;
      break;
    case 12:
      return result;
    case 13:
      uint64_t result = 3;
      break;
    case 14:
      uint64_t result = 5;
      break;
    case 15:
      uint64_t result = 9;
      break;
    case 16:
      uint64_t result = 8;
      break;
    case 17:
      uint64_t result = 7;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t _convertAXPActionToiOS(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x10) {
    return 2021;
  }
  else {
    return dword_22E867660[a1 - 1];
  }
}

CFUUIDRef _AXPConvertOutgoingValueWithDesiredType(void *a1, uint64_t a2)
{
  v45[7] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    CFUUIDRef v7 = 0;
    goto LABEL_26;
  }
  CFUUIDRef v3 = a1;
  CFTypeID v4 = CFUUIDGetTypeID();
  if (v4 == CFGetTypeID(v3))
  {
    CFStringRef v5 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x263EFFB08], v3);
    CFUUIDRef v6 = (const __CFUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];

    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    CFUUIDRef v6 = v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFUUIDRef v9 = v6;
    char v10 = (void *)[(__CFUUID *)v9 mutableCopy];
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = ___convertAXAttributedStringToAXString_block_invoke;
    v39[3] = &unk_2649DF110;
    CFUUIDRef v11 = v9;
    CFUUIDRef v40 = v11;
    id v12 = v10;
    id v41 = v12;
    v42 = v43;
    [(__CFUUID *)v11 enumerateAttributesUsingBlock:v39];
    v45[0] = @"NSParagraphStyle";
    v45[1] = @"NSFont";
    v45[2] = @"NSShadow";
    v45[3] = @"NSColor";
    v45[4] = @"NSTextAlternatives";
    v45[5] = @"NSTextEffect";
    v45[6] = @"NSOriginalFont";
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:7];
    [v12 removeAttributes:v13];

    id v14 = v41;
    id v15 = v12;

    _Block_object_dispose(v43, 8);
    if (a2 && objc_opt_class() == a2 && [v15 hasAttributes])
    {
      uint64_t v16 = [v15 attributedString];
    }
    else
    {
      uint64_t v16 = [v15 string];
    }
    CFUUIDRef v7 = (const __CFUUID *)v16;

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = ___AXPConvertOutgoingValueWithDesiredType_block_invoke;
    v38[3] = &__block_descriptor_40_e8__16__0_8lu32l8;
    v38[4] = a2;
    CFUUIDRef v8 = [(__CFUUID *)v6 ax_flatMappedArrayUsingBlock:v38];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [(__CFUUID *)v6 allKeys];
    if ([v18 count])
    {
      objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      CFUUIDRef v7 = (const __CFUUID *)objc_claimAutoreleasedReturnValue();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v24 = _AXPConvertOutgoingValueWithDesiredType([(__CFUUID *)v6 objectForKey:v23], a2);
            if (v24) {
              [(__CFUUID *)v7 setObject:v24 forKeyedSubscript:v23];
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v20);
      }
    }
    else
    {
      CFUUIDRef v7 = v6;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (CFTypeID v25 = CFURLGetTypeID(), v25 == CFGetTypeID(v6))
    || (CFTypeID v26 = CGColorGetTypeID(), v26 == CFGetTypeID(v6))
    || (CFTypeID v27 = CGPathGetTypeID(), v27 == CFGetTypeID(v6)))
  {
LABEL_8:
    CFUUIDRef v8 = v6;
  }
  else
  {
    CFTypeID TypeID = AXValueGetTypeID();
    if (TypeID != CFGetTypeID(v6))
    {
      CFTypeID v29 = AXUIElementGetTypeID();
      if (v29 == CFGetTypeID(v6))
      {
        v30 = +[AXPTranslator_iOS sharedInstance];
        CFUUIDRef v7 = [v30 translationObjectFromPlatformElement:v6];
      }
      else
      {
        v31 = (void *)MEMORY[0x263EFF940];
        v32 = [NSString stringWithFormat:@"Illegal outgoing type: %@[%@]", objc_opt_class(), v6];
        v33 = [v31 exceptionWithName:@"Illegal outgoing type" reason:v32 userInfo:0];

        [v33 raise];
        CFUUIDRef v7 = 0;
      }
      goto LABEL_25;
    }
    _AXPConvertAXValueRefToNSValue(v6);
    CFUUIDRef v8 = (const __CFUUID *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  CFUUIDRef v7 = v8;
LABEL_25:

LABEL_26:

  return v7;
}

void sub_22E855100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

id _AXPiOSParameterFromPlatformParameter(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 objectForKey:@"parameter"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id _AXPConvertAXValueRefToNSValue(const __AXValue *a1)
{
  switch(AXValueGetType(a1))
  {
    case kAXValueTypeCGPoint:
      long long v4 = 0uLL;
      if (!AXValueGetValue(a1, kAXValueTypeCGPoint, &v4)) {
        goto LABEL_12;
      }
      v2 = [MEMORY[0x263F08D40] valueWithPoint:v4];
      break;
    case kAXValueTypeCGSize:
      long long v4 = 0uLL;
      if (!AXValueGetValue(a1, kAXValueTypeCGSize, &v4)) {
        goto LABEL_12;
      }
      v2 = [MEMORY[0x263F08D40] valueWithSize:v4];
      break;
    case kAXValueTypeCGRect:
      long long v4 = 0u;
      long long v5 = 0u;
      if (!AXValueGetValue(a1, kAXValueTypeCGRect, &v4)) {
        goto LABEL_12;
      }
      v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v4, v5);
      break;
    case kAXValueTypeCFRange:
      long long v4 = 0uLL;
      if (!AXValueGetValue(a1, kAXValueTypeCFRange, &v4)) {
        goto LABEL_12;
      }
      v2 = 0;
      if ((v4 & 0x8000000000000000) == 0 && (*((void *)&v4 + 1) & 0x8000000000000000) == 0)
      {
        v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:");
      }
      break;
    default:
LABEL_12:
      v2 = 0;
      break;
  }

  return v2;
}

void sub_22E855C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t _AXPElementIsTabButton(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ((*MEMORY[0x263F219B8] & ~a2) != 0 && (*MEMORY[0x263F21A38] & ~a2) != 0 && (*MEMORY[0x263F21A40] & ~a2) != 0) {
    goto LABEL_8;
  }
  long long v4 = [MEMORY[0x263F21668] elementWithUIElement:v3];
  if ([v4 rowRange] == 0x7FFFFFFF)
  {

LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  long long v5 = [v4 elementParent];
  uint64_t v6 = [v5 containerType];

  if (v6 != 2048) {
    goto LABEL_8;
  }
  uint64_t v7 = 1;
LABEL_9:

  return v7;
}

void sub_22E859E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_22E85B428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E85C248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXPAXUIElementReplaceWithRemotePid(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    *a2 = 0;
    _AXUIElementIDForElement();
    if (v7 == 9999)
    {
      uint64_t v8 = _AXUIElementIDForElement();
      *a2 = MEMORY[0x230FA6910](a3, v8, v9);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _handleElementDestroyed(uint64_t a1)
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x263F21690];
    id v3 = objc_opt_new();
    long long v4 = [v2 uiElementWithAXElement:a1 cache:v3];

    long long v5 = objc_opt_new();
    uint64_t v6 = _AXUIElementIDForElement();
    objc_msgSend(v5, "setUid:", v6, v7);
    objc_msgSend(v5, "setPid:", objc_msgSend(v4, "pid"));
    uint64_t v8 = +[AXPTranslator_iOS sharedInstance];
    uint64_t v9 = v8[14];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___handleElementDestroyed_block_invoke;
    block[3] = &unk_2649DEF48;
    id v12 = v5;
    id v10 = v5;
    dispatch_sync(v9, block);
  }
}

uint64_t _convertAXNotification(int a1, void *a2)
{
  if (a1 <= 1043)
  {
    uint64_t v2 = 1;
    switch(a1)
    {
      case 1000:
        return 5;
      case 1001:
      case 1020:
        return 4;
      case 1005:
        if (!a2) {
          return 8;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 8;
        }
        long long v4 = [a2 objectForKey:*MEMORY[0x263F21C78]];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_33;
        }
        if ([v4 isEqualToString:*MEMORY[0x263F21C58]])
        {
          uint64_t v2 = 13;
LABEL_32:

          return v2;
        }
        if ([v4 isEqualToString:*MEMORY[0x263F21C60]])
        {
          uint64_t v2 = 14;
          goto LABEL_32;
        }
LABEL_33:

        break;
      case 1006:
        if (AXPIsCatalyst()) {
          return 11;
        }
        else {
          return 5;
        }
      case 1007:
        return 10;
      case 1008:
        return v2;
      case 1009:
        return 12;
      case 1012:
        return 8;
      case 1017:
        return 6;
      case 1018:
        return 3;
      default:
        return 0;
    }
    return 8;
  }
  if (a1 > 1059)
  {
    switch(a1)
    {
      case 5550:
        return 9;
      case 4002:
        return 7;
      case 1060:
        return 2;
      default:
        return 0;
    }
  }
  else
  {
    switch(a1)
    {
      case 1044:
        return 15;
      case 1053:
        return 3;
      case 1054:
        return 8;
      default:
        return 0;
    }
  }
}

id _convertAXNotificationForElementWithData(int a1, void *a2, void *a3, void *a4)
{
  if (!a4) {
    _convertAXNotificationForElementWithData_cold_1();
  }
  uint64_t v8 = _AXPConvertOutgoingValueWithDesiredType(a3, 0);
  _AXPConvertOutgoingValueWithDesiredType(a2, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  switch(a1)
  {
    case 1008:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [a3 objectForKey:@"data"];

        if (v12)
        {
          id v11 = [a3 objectForKey:@"data"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [v11 attributeValueForKey:*MEMORY[0x263F21800]];
            char v14 = [v13 BOOLValue];

            if (v14)
            {
              uint64_t v15 = 0;
            }
            else
            {
              uint64_t v16 = (void *)[v8 mutableCopy];
              uint64_t v17 = objc_opt_class();
              id v18 = _AXPConvertOutgoingValueWithDesiredType(v11, v17);
              [v16 setObject:v18 forKeyedSubscript:@"data"];

              uint64_t v15 = [v16 copy];
              uint64_t v8 = v16;
            }

            uint64_t v8 = (void *)v15;
          }
          goto LABEL_19;
        }
      }
      break;
    case 1053:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v11 = [v8 objectForKey:*MEMORY[0x263F21A60]];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v11;
          *a4 = v11;

          uint64_t v8 = 0;
        }
      }
      goto LABEL_19;
    case 1020:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = (void *)MEMORY[0x263F21A60];
        id v10 = [v8 objectForKey:*MEMORY[0x263F21A60]];

        if (v10)
        {
          [v8 objectForKey:*v9];
          v8 = id v11 = v8;
LABEL_19:
        }
      }
      break;
  }

  return v8;
}

void __notificationBypass_block_invoke(void *a1)
{
  id v2 = +[AXPTranslator sharedInstance];
  [v2 handleNotification:a1[6] data:a1[4] associatedObject:a1[5]];
}

void ___handleElementDestroyed_block_invoke(uint64_t a1)
{
  id v2 = +[AXPTranslator_iOS sharedInstance];
  [v2 _removeCacheEntriesForElement:*(void *)(a1 + 32)];
}

void ___axEventHandler_block_invoke(void *a1)
{
  id v3 = +[AXPTranslator sharedInstance];
  id v2 = [v3 runtimeDelegate];
  [v2 handleNotification:a1[6] data:a1[4] associatedObject:a1[5]];
}

void ___convertAXAttributedStringToAXString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v22 = a2;
  uint64_t v7 = [v22 objectForKeyedSubscript:*MEMORY[0x263F21738]];
  if ([v7 BOOLValue]) {
    goto LABEL_4;
  }
  uint64_t v8 = [v22 objectForKeyedSubscript:*MEMORY[0x263F21740]];
  if ([v8 BOOLValue])
  {

LABEL_4:
LABEL_5:
    uint64_t v9 = [*(id *)(a1 + 32) string];
    id v10 = objc_msgSend(v9, "substringWithRange:", a3, a4);
    id v11 = _convertDurationTime(v10);
    goto LABEL_6;
  }
  id v12 = (void *)MEMORY[0x263F21730];
  v13 = [v22 objectForKeyedSubscript:*MEMORY[0x263F21730]];
  if ([v13 BOOLValue])
  {
    char v14 = [*(id *)(a1 + 32) string];
    uint64_t v15 = objc_msgSend(v14, "substringWithRange:", a3, a4);
    uint64_t v16 = [v15 componentsSeparatedByString:@":"];
    uint64_t v17 = [v16 count];

    id v12 = (void *)MEMORY[0x263F21730];
    if (v17 == 3) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v18 = [v22 objectForKeyedSubscript:*v12];
  int v19 = [v18 BOOLValue];

  if (!v19) {
    goto LABEL_8;
  }
  uint64_t v20 = NSString;
  uint64_t v9 = [*(id *)(a1 + 32) string];
  id v10 = objc_msgSend(v9, "substringWithRange:", a3, a4);
  uint64_t v21 = [v20 stringWithFormat:@"%@:00", v10];
  id v11 = _convertDurationTime(v21);

LABEL_6:
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + a3, a4, v11);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v11 length] - a4;
  }
LABEL_8:
}

id _convertDurationTime(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v2 = (void (*)(id))getAXLocalizeDurationTimeSymbolLoc_ptr;
  id v10 = getAXLocalizeDurationTimeSymbolLoc_ptr;
  if (!getAXLocalizeDurationTimeSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getAXLocalizeDurationTimeSymbolLoc_block_invoke;
    v6[3] = &unk_2649DF138;
    v6[4] = &v7;
    __getAXLocalizeDurationTimeSymbolLoc_block_invoke((uint64_t)v6);
    id v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    long long v5 = (_Unwind_Exception *)_convertDurationTime_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  id v3 = v2(v1);

  return v3;
}

void *__getAXLocalizeDurationTimeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2649DF158;
    uint64_t v7 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
    if (AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "AXLocalizeDurationTime");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXLocalizeDurationTimeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t _AXPConvertAXAttribute(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"kAXLabelAttribute"])
  {
    if ([v1 caseInsensitiveCompare:@"kAXHintAttribute"])
    {
      if ([v1 caseInsensitiveCompare:@"kAXFrameAttribute"])
      {
        if ([v1 caseInsensitiveCompare:@"kAXTraitsAttribute"])
        {
          if ([v1 caseInsensitiveCompare:@"kAXSelectedTextRangeAttribute"])
          {
            if ([v1 caseInsensitiveCompare:@"kAXValueAttribute"])
            {
              if ([v1 caseInsensitiveCompare:@"kAXCenterPointAttribute"])
              {
                if ([v1 caseInsensitiveCompare:@"kAXLanguageAttribute"])
                {
                  if ([v1 caseInsensitiveCompare:@"kAXScrollStatusAttribute"])
                  {
                    if ([v1 caseInsensitiveCompare:@"kAXTextOperationsAttribute"])
                    {
                      if ([v1 caseInsensitiveCompare:@"kAXTextOperationsOperatorAttribute"])
                      {
                        if ([v1 caseInsensitiveCompare:@"kAXTouchContainerAttribute"])
                        {
                          if ([v1 caseInsensitiveCompare:@"kAXVisibleElementInListAttribute"])
                          {
                            if ([v1 caseInsensitiveCompare:@"kAXNextContainerAttribute"])
                            {
                              if ([v1 caseInsensitiveCompare:@"kAXPreviousContainerAttribute"])
                              {
                                if ([v1 caseInsensitiveCompare:@"kAXIsElementAttribute"])
                                {
                                  if ([v1 caseInsensitiveCompare:@"kAXApplicationAttribute"])
                                  {
                                    if ([v1 caseInsensitiveCompare:@"kAXAssistiveTechnologyFocusedAttribute"])
                                    {
                                      if ([v1 caseInsensitiveCompare:@"kAXSupportsActivateActionAttribute"])
                                      {
                                        if ([v1 caseInsensitiveCompare:@"kAXURLAttribute"])
                                        {
                                          if ([v1 caseInsensitiveCompare:@"kAXWindowContextIdAttribute"])
                                          {
                                            if ([v1 caseInsensitiveCompare:@"kAXFirstSiblingAttribute"])
                                            {
                                              if ([v1 caseInsensitiveCompare:@"kAXLastSiblingAttribute"])
                                              {
                                                if ([v1 caseInsensitiveCompare:@"kAXLinkedElementAttribute"])
                                                {
                                                  if ([v1 caseInsensitiveCompare:@"kAXIsVisibleAttribute"])
                                                  {
                                                    if ([v1 caseInsensitiveCompare:@"kAXHeaderElementsAttribute"])
                                                    {
                                                      uint64_t v2 = 0;
                                                    }
                                                    else
                                                    {
                                                      uint64_t v2 = 2026;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v2 = 2025;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t v2 = 2024;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t v2 = 2023;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t v2 = 2022;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v2 = 2021;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v2 = 2020;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v2 = 2019;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v2 = 2018;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v2 = 2017;
                                  }
                                }
                                else
                                {
                                  uint64_t v2 = 2016;
                                }
                              }
                              else
                              {
                                uint64_t v2 = 2015;
                              }
                            }
                            else
                            {
                              uint64_t v2 = 2014;
                            }
                          }
                          else
                          {
                            uint64_t v2 = 2013;
                          }
                        }
                        else
                        {
                          uint64_t v2 = 2012;
                        }
                      }
                      else
                      {
                        uint64_t v2 = 2011;
                      }
                    }
                    else
                    {
                      uint64_t v2 = 2010;
                    }
                  }
                  else
                  {
                    uint64_t v2 = 2009;
                  }
                }
                else
                {
                  uint64_t v2 = 2008;
                }
              }
              else
              {
                uint64_t v2 = 2007;
              }
            }
            else
            {
              uint64_t v2 = 2006;
            }
          }
          else
          {
            uint64_t v2 = 2005;
          }
        }
        else
        {
          uint64_t v2 = 2004;
        }
      }
      else
      {
        uint64_t v2 = 2003;
      }
    }
    else
    {
      uint64_t v2 = 2002;
    }
  }
  else
  {
    uint64_t v2 = 2001;
  }

  return v2;
}

void sub_22E85DBEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22E85E3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22E85E5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E85E804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22E85EC84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_22E85F0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id AXPConvertValue(void *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = AXPConvertValue(*(void *)(*((void *)&v25 + 1) + 8 * i), a2);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v3;
      id v12 = v3;
      objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v13 = [v12 allKeys];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * j);
            int v19 = [v12 objectForKeyedSubscript:v18];
            uint64_t v20 = AXPConvertValue(v19, a2);

            [v5 setObject:v20 forKeyedSubscript:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v15);
      }

      id v3 = v24;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = +[AXPTranslator sharedInstance];
        id v22 = [v21 platformTranslator];
        id v5 = [v22 platformElementFromTranslation:v3];
      }
      else
      {
        id v5 = v3;
      }
    }
  }

  return v5;
}

uint64_t AXPClientIsEntitledForRemoteDeviceContent()
{
  return 1;
}

uint64_t AXPIsCatalyst()
{
  if (AXPIsCatalyst_onceToken != -1) {
    dispatch_once(&AXPIsCatalyst_onceToken, &__block_literal_global_1);
  }
  return 0;
}

uint64_t AXPIsiOSAppOnMac()
{
  if (AXPIsiOSAppOnMac_onceToken != -1) {
    dispatch_once(&AXPIsiOSAppOnMac_onceToken, &__block_literal_global_6);
  }
  return 0;
}

uint64_t AXPLinkedOnOrAfterGozul()
{
  if (AXPLinkedOnOrAfterGozul_onceToken != -1) {
    dispatch_once(&AXPLinkedOnOrAfterGozul_onceToken, &__block_literal_global_8);
  }
  return AXPLinkedOnOrAfterGozul_isLinkedOnOrAfterGozul;
}

uint64_t __AXPLinkedOnOrAfterGozul_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  AXPLinkedOnOrAfterGozul_isLinkedOnOrAfterGozul = result;
  return result;
}

uint64_t AXPIsGoodOldAppleCatalystApp()
{
  if (AXPIsGoodOldAppleCatalystApp_onceToken != -1) {
    dispatch_once(&AXPIsGoodOldAppleCatalystApp_onceToken, &__block_literal_global_10);
  }
  return AXPIsGoodOldAppleCatalystApp_isGoodOldApp;
}

void __AXPIsGoodOldAppleCatalystApp_block_invoke()
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.findmy", @"com.apple.Home", @"com.apple.MobileSMS", @"com.apple.news", @"com.apple.PlaygroundsMac", @"com.apple.VoiceMemos", 0);
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 bundleIdentifier];

  if ([v3 containsObject:v1]) {
    char v2 = 1;
  }
  else {
    char v2 = [v1 hasPrefix:@"com.apple.WebKit.WebContent"];
  }
  AXPIsGoodOldAppleCatalystApp_isGoodOldApp = v2;
}

uint64_t AXPIsSwiftPlaygrounds()
{
  if (AXPIsSwiftPlaygrounds_onceToken != -1) {
    dispatch_once(&AXPIsSwiftPlaygrounds_onceToken, &__block_literal_global_43);
  }
  return AXPIsSwiftPlaygrounds_isSwiftPlaygrounds;
}

void __AXPIsSwiftPlaygrounds_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  AXPIsSwiftPlaygrounds_isSwiftPlaygrounds = [v0 isEqualToString:@"com.apple.PlaygroundsMac"];
}

BOOL AXPNilOrEmptyString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    BOOL v2 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && [v1 length] == 0;
  }
  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

void sub_22E860C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
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

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return MEMORY[0x270EF2BB8](v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

__CFString *_AXPNotificationToString(unint64_t a1)
{
  if (a1 > 0xF) {
    return 0;
  }
  else {
    return off_2649DF328[a1];
  }
}

__CFString *_AXPActionToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x10) {
    return 0;
  }
  else {
    return off_2649DF3A8[a1 - 1];
  }
}

__CFString *_AXPAttributeToString(unint64_t a1)
{
  if (a1 > 0x7C) {
    return 0;
  }
  else {
    return off_2649DF430[a1];
  }
}

void _convertAXNotificationForElementWithData_cold_1()
{
  __assert_rtn("_convertAXNotificationForElementWithData", "AXPTranslator_iOS.m", 908, "outTranslationObject != nil");
}

uint64_t _convertDurationTime_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __30__AXPRemoteCacheManager_start__block_invoke_cold_1(v0);
}

uint64_t AXConvertPointFromHostedCoordinates()
{
  return MEMORY[0x270F097F8]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x270F09818](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x270F09820](*(void *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F09828](observer);
}

uint64_t AXOverrideRequestingClientType()
{
  return MEMORY[0x270F09838]();
}

uint64_t AXPlatformTranslationLogCommon()
{
  return MEMORY[0x270F09470]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXUIElementCopyElementUsingDisplayIdAtPosition()
{
  return MEMORY[0x270F09888]();
}

AXError AXUIElementCopyMultipleAttributeValues(AXUIElementRef element, CFArrayRef attributes, AXCopyMultipleAttributeOptions options, CFArrayRef *values)
{
  return MEMORY[0x270F09890](element, attributes, *(void *)&options, values);
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)MEMORY[0x270F09898]();
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return MEMORY[0x270F098A0](element, pid);
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x270F098A8]();
}

uint64_t AXUIElementIsApplication()
{
  return MEMORY[0x270F098B0]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x270F098E8](*(void *)&theType, valuePtr);
}

AXValueType AXValueGetType(AXValueRef value)
{
  return MEMORY[0x270F098F0](value);
}

CFTypeID AXValueGetTypeID(void)
{
  return MEMORY[0x270F098F8]();
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return MEMORY[0x270F09900](value, *(void *)&theType, valuePtr);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x270EE54A0]();
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x270EE5BF8]();
}

CFTypeID CGPathGetTypeID(void)
{
  return MEMORY[0x270EE7098]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x270F09930]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90570]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x270F90580]();
}

uint64_t _AXUIElementCopyElementAtPositionWithParams()
{
  return MEMORY[0x270F09970]();
}

uint64_t _AXUIElementCreateAppElementWithPid()
{
  return MEMORY[0x270F09978]();
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x270F09980]();
}

uint64_t _AXUIElementCreateWithData()
{
  return MEMORY[0x270F09988]();
}

uint64_t _AXUIElementCreateWithPIDAndID()
{
  return MEMORY[0x270F09990]();
}

uint64_t _AXUIElementIDForElement()
{
  return MEMORY[0x270F09998]();
}

uint64_t _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback()
{
  return MEMORY[0x270F099A8]();
}

uint64_t _AXUIElementServerRegistered()
{
  return MEMORY[0x270F099B8]();
}

uint64_t _AXUIElementUnregisterServer()
{
  return MEMORY[0x270F099C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}