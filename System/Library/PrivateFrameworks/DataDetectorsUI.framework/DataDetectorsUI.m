uint64_t __DDTrackEventCreationInHostApplication_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  int v3;
  char v4;
  void *v6;
  uint64_t vars8;

  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v0 bundleIdentifier];

  if ([v6 isEqualToString:@"com.apple.MobileSMS"])
  {
    v1 = 1;
    v2 = v6;
  }
  else
  {
    v3 = [v6 isEqualToString:@"com.apple.mobilemail"];
    v2 = v6;
    if (!v3) {
      goto LABEL_6;
    }
    v1 = 2;
  }
  DDTrackEventCreationInHostApplication_host = v1;
LABEL_6:
  if (v2) {
    v4 = [&unk_1EF50FF90 containsObject:v6];
  }
  else {
    v4 = 0;
  }
  DDTrackEventCreationInHostApplication_track = v4;
  return MEMORY[0x1F41817F8]();
}

void sub_1A170C0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _DDResultIsURL(uint64_t result)
{
  if (result)
  {
    v1 = (void *)_DDResultIsURL__sURLTypes;
    if (!_DDResultIsURL__sURLTypes)
    {
      uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F5F028], *MEMORY[0x1E4F5F108], *MEMORY[0x1E4F5F060], *MEMORY[0x1E4F5F068], *MEMORY[0x1E4F5F020], *MEMORY[0x1E4F5EFF8], 0);
      v3 = (void *)_DDResultIsURL__sURLTypes;
      _DDResultIsURL__sURLTypes = v2;

      v1 = (void *)_DDResultIsURL__sURLTypes;
    }
    uint64_t Type = DDResultGetType();
    return [v1 containsObject:Type];
  }
  return result;
}

void sub_1A170D0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t dd_urlLooksSuspicious(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 scheme];
  v3 = [v2 lowercaseString];

  if (([v3 isEqualToString:@"http"] & 1) != 0
    || [v3 isEqualToString:@"https"])
  {
    uint64_t v4 = objc_msgSend(v1, "_lp_userVisibleStringUsesEncodedHost");
  }
  else
  {
    uint64_t v4 = [v3 isEqualToString:@"javascript"];
  }
  uint64_t v5 = v4;

  return v5;
}

id dd_ensureUrlIsUrl(void *a1)
{
  id v1 = a1;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v2 = v1;
LABEL_4:
    v3 = v2;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
    goto LABEL_4;
  }
  v3 = 0;
LABEL_5:

  return v3;
}

id _DDURLFromResult(uint64_t a1)
{
  if (a1)
  {
    id v1 = (void *)DDResultCopyExtractedURLWithOptions();
    if (v1)
    {
      id v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

CFTypeRef specialCaseResultForResult(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if (!DDResultHasType()) {
    return 0;
  }
  if (!DDResultGetSubresultWithType()) {
    return 0;
  }
  id v1 = [(id)DDResultGetMatchedString() lowercaseString];
  int v2 = [v1 hasPrefix:@"pounds"];

  if (!v2) {
    return 0;
  }
  uint64_t Copy = DDResultCreateCopy();
  if (!Copy) {
    return 0;
  }
  uint64_t v4 = (const void *)Copy;
  DDResultSetType();
  DDResultGetQueryRange();
  DDResultCreate();
  DDResultSetMatchedString();
  DDResultAddSubresult();
  return CFAutorelease(v4);
}

BOOL DDTrackEventCreationInHostApplication(_DWORD *a1)
{
  if (DDTrackEventCreationInHostApplication_onceToken != -1) {
    dispatch_once(&DDTrackEventCreationInHostApplication_onceToken, &__block_literal_global_149);
  }
  int v2 = DDTrackEventCreationInHostApplication_track;
  if (a1 && DDTrackEventCreationInHostApplication_track) {
    *a1 = DDTrackEventCreationInHostApplication_host;
  }
  return v2 != 0;
}

uint64_t __dd_transientAttributesSet_block_invoke()
{
  _sTransientAttributesSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F5F118], @"DDContext", @"DDAttributeBackup", @"DDFoundExistingLink", 0);
  return MEMORY[0x1F41817F8]();
}

void sub_1A170FB04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A17102D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A1710A2C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDDetectionController _doURLification:].cold.4();
    }
    objc_end_catch();
    JUMPOUT(0x1A1710780);
  }
  _Block_object_dispose((const void *)(v11 - 208), 8);
  _Unwind_Resume(exc_buf);
}

void sub_1A1710F24(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDOperation main]();
    }
    objc_end_catch();
    JUMPOUT(0x1A1710F08);
  }
  _Unwind_Resume(a1);
}

id dd_transientAttributesSet()
{
  if (dd_transientAttributesSet_onceToken != -1) {
    dispatch_once(&dd_transientAttributesSet_onceToken, &__block_literal_global_66);
  }
  v0 = (void *)_sTransientAttributesSet;
  return v0;
}

void sub_1A1711EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1713788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1713944(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
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

void sub_1A171CE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

BOOL _supportsBusinessService()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  unint64_t v1 = [v0 userInterfaceIdiom];

  return v1 < 2 || v1 == 6;
}

void sub_1A171D944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A171F990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void DDPerformWebSearchFromQuery(void *a1)
{
  id v1 = a1;
  if (dd_canReadDefaultBrowser_onceToken != -1) {
    dispatch_once(&dd_canReadDefaultBrowser_onceToken, &__block_literal_global_2);
  }
  if (dd_canReadDefaultBrowser__isEntitled == 1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v11 = [v1 stringByTrimmingCharactersInSet:v2];

    id v3 = +[DDUISearchWebHandler webSearchURLForQueryString:v11];
    uint64_t v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v4 openURL:v3 configuration:0 completionHandler:0];
  }
  else
  {
    id v3 = v1;
    uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.datadetectors.AddToRecentsService"];

    if (v7)
    {
      NSLog(&cfstr_Addtorecentsse.isa);
    }
    else
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.datadetectors.AddToRecentsService"];
      uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF557490];
      [v8 setRemoteObjectInterface:v9];

      [v8 resume];
      v10 = [v8 remoteObjectProxy];
      [v10 performWebSearchFromQuery:v3];

      [v8 invalidate];
    }
    id v11 = v3;
  }
}

void __dd_canReadDefaultBrowser_block_invoke()
{
  v0 = _copy_entitlement_value(@"com.apple.security.exception.shared-preference.read-only");
  if (v0)
  {
    CFArrayRef v1 = v0;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      v7.length = CFArrayGetCount(v1);
      v7.location = 0;
      if (CFArrayContainsValue(v1, v7, @"com.apple.mobilesafarishared")) {
        dd_canReadDefaultBrowser__isEntitled = 1;
      }
    }
    CFRelease(v1);
  }
  if ((dd_canReadDefaultBrowser__isEntitled & 1) == 0)
  {
    id v3 = _copy_entitlement_value(@"com.apple.security.exception.shared-preference.read-write");
    if (v3)
    {
      CFArrayRef v4 = v3;
      CFTypeID v5 = CFArrayGetTypeID();
      if (v5 == CFGetTypeID(v4))
      {
        v8.length = CFArrayGetCount(v4);
        v8.location = 0;
        if (CFArrayContainsValue(v4, v8, @"com.apple.mobilesafarishared")) {
          dd_canReadDefaultBrowser__isEntitled = 1;
        }
      }
      CFRelease(v4);
    }
  }
}

__SecTask *_copy_entitlement_value(const __CFString *a1)
{
  result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (result)
  {
    id v3 = result;
    CFTypeRef v4 = SecTaskCopyValueForEntitlement(result, a1, 0);
    CFRelease(v3);
    return (__SecTask *)v4;
  }
  return result;
}

void sub_1A17247F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

id _displayString(void *a1, uint64_t SubresultWithType, void *a3, void *a4, int a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v11;
  if (SubresultWithType)
  {
    if (!a5
      || (CFStringRef Type = (const __CFString *)DDResultGetType(), CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F010], 0))
      || (SubresultWithCFStringRef Type = DDResultGetSubresultWithType(),
          DDResultGetMatchedString(),
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v14 = DDMapAddressFromResult(SubresultWithType);
LABEL_7:
      uint64_t v15 = (void *)v14;
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = DDMapAddressFromURL(v9);
      goto LABEL_7;
    }
    if (v10)
    {
      v17 = DDDefaultAddressForContact(v10);
      v18 = v17;
      if (v17)
      {
        if (!a5 || ([v17 street], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v19 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v18 style:0];
        }
        v20 = (void *)v19;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v18 = [v11 objectForKeyedSubscript:@"event"];
      v21 = [v12 objectForKeyedSubscript:@"icsEvent"];
      v22 = v18;
      if (v18 || (v22 = v21) != 0)
      {
        v20 = [v22 location];
      }
      else
      {
        v20 = 0;
      }
    }
    if (v20)
    {
      uint64_t v15 = objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:options:range:", @"(\\s|\\n)+", @" ", 1024, 0, objc_msgSend(v20, "length"));
    }
    else
    {
      uint64_t v15 = 0;
    }
  }

  return v15;
}

void sub_1A1726B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id _ddui_parsec_xpcInterface(int a1)
{
  if (a1)
  {
    CFArrayRef v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF5574F0];
    uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    CFRange v7 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
    [v1 setClasses:v7 forSelector:sel_startQueryWithResult_context_ argumentIndex:0 ofReply:0];
    CFRange v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    gotLoadHelper_x8__OBJC_CLASS___SFResultSection(v11);
    uint64_t v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);

    v13 = sel_showClientQueryResults_error_;
    uint64_t v14 = v1;
    uint64_t v15 = v12;
    uint64_t v16 = 0;
  }
  else
  {
    CFArrayRef v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF531C90];
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    gotLoadHelper_x8__OBJC_CLASS___SFResultSection(v20);
    v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    [v1 setClasses:v21 forSelector:sel_performClientTextQueryWithTerm_queryId_sessionId_userAgent_reply_ argumentIndex:0 ofReply:1];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);

    v13 = sel_loadReportAnIssueImage_;
    uint64_t v14 = v1;
    uint64_t v15 = v12;
    uint64_t v16 = 1;
  }
  [v14 setClasses:v15 forSelector:v13 argumentIndex:0 ofReply:v16];

  return v1;
}

void DDRecursivelyRemoveResultLinksFromAnchor(void *a1, void *a2, void *a3)
{
  id v22 = a1;
  id v5 = a2;
  id v6 = a3;
  if (v22)
  {
    CFRange v7 = [v22 getAttribute:*MEMORY[0x1E4F5F140]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v8 = [v7 isEqual:@"true"];
    }
    else {
      char v8 = 0;
    }
    uint64_t v9 = [v22 childNodes];
    int v10 = [v9 length];
    if (v10)
    {
      int v11 = v10;
      uint64_t v12 = 0;
      do
      {
        v13 = [v9 item:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          DDRecursivelyRemoveResultLinksFromAnchor(v13, v22, v6);
        }

        uint64_t v12 = (v12 + 1);
      }
      while (v11 != v12);
    }
    char v14 = v8 ^ 1;
    if (!v5) {
      char v14 = 1;
    }
    if (v14)
    {
      uint64_t v16 = v9;
    }
    else
    {
      uint64_t v15 = [v22 childNodes];
      uint64_t v16 = (void *)[v15 copy];

      int v17 = [v16 length];
      if (v17)
      {
        int v18 = v17;
        do
        {
          uint64_t v19 = [v16 item:0];
          id v20 = (id)[v5 insertBefore:v19 refChild:v22];

          --v18;
        }
        while (v18);
      }
      id v21 = (id)[v5 removeChild:v22];
    }
  }
}

void sub_1A172A3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _DDArrayWithList(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v1 length])
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = [v1 item:v3];
      [v2 addObject:v4];

      uint64_t v3 = (v3 + 1);
    }
    while (v3 < [v1 length]);
  }

  return v2;
}

void _DDRemoveResultLinksFromArrayOfAnchors(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v10 = [v9 parentNode];
        int v11 = [v9 parentNode];

        if (v11) {
          DDRecursivelyRemoveResultLinksFromAnchor(v9, v10, v4);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

id DDLocalizedString(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  id v3 = [v1 bundleWithIdentifier:@"com.apple.DataDetectorsUI"];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_1EF5023D8 table:0];

  return v4;
}

id DDLocalizedStringFromTable(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  id v9 = a1;
  int v10 = [v6 bundleWithIdentifier:@"com.apple.DataDetectorsUI"];
  int v11 = [v10 localizedStringForKey:v9 value:v8 table:v7];

  return v11;
}

id DDLocalizedStringWithDefaultValue(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a1;
  id v8 = [v5 bundleWithIdentifier:@"com.apple.DataDetectorsUI"];
  id v9 = [v8 localizedStringForKey:v7 value:v6 table:0];

  return v9;
}

id beginDateOfEventResults(void *a1, void *a2, unsigned char *a3, BOOL *a4, void *a5)
{
  return beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(a1, 0, a2, a3, a4, a5, 0);
}

id beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(void *a1, uint64_t a2, void *a3, unsigned char *a4, BOOL *a5, void *a6, void *a7)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a3;
  int v11 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        if (DDResultGetCategory() == 4) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v14);
  }

  uint64_t v18 = DDResultCreateFromDateTimeResults();
  if (!v18)
  {
    id v23 = 0;
    goto LABEL_35;
  }
  uint64_t v19 = (const void *)v18;
  v34 = a5;
  id v20 = [v10 objectForKey:@"ReferenceDate"];
  id v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [MEMORY[0x1E4F1C9C8] date];
  }
  v24 = v22;

  v25 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [v10 objectForKey:@"ReferenceDate"];
  DDResultIsPartialDateRangeOrTimeRange();
  CFStringRef Type = (const __CFString *)DDResultGetType();
  CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F5F0D0];
  id v33 = v10;
  if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F0D0], 0)
    && CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5EFE0], 0)
    && CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5EFE8], 0))
  {
    CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F5F0C8];
    if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F0C8], 0)
      && CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5EFD8], 0))
    {
      if (v34) {
        BOOL *v34 = 0;
      }
      v29 = a4;
      v30 = a7;
      v31 = a6;
      if (!a6) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    if (!DDResultCopyExtractedStartDateEndDate()) {
      goto LABEL_25;
    }
LABEL_23:
    v28 = 0;

    goto LABEL_26;
  }
  if (DDResultCopyExtractedDateFromReferenceDate()) {
    goto LABEL_23;
  }
LABEL_25:
  v28 = v24;
LABEL_26:
  v29 = a4;
  if (v34) {
    BOOL *v34 = CFEqual(Type, v27);
  }
  v30 = a7;
  v31 = a6;
  v24 = v28;
  id v10 = v33;
  if (!a6) {
    goto LABEL_30;
  }
LABEL_29:
  void *v31 = 0;
LABEL_30:
  if (v29) {
    unsigned char *v29 = 0;
  }
  CFRelease(v19);
  if (v30) {
    void *v30 = v25;
  }
  id v23 = v24;

LABEL_35:
  return v23;
}

id beginDateOfEventResultsRespectingSpecificEndDates(void *a1, uint64_t a2, void *a3, unsigned char *a4, void *a5)
{
  return beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(a1, a2, a3, a4, 0, a5, 0);
}

id dueDateAndTimezoneOfEventResults(void *a1, void *a2, unsigned char *a3, void *a4)
{
  id v17 = 0;
  uint64_t v5 = beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(a1, 0, a2, a3, 0, &v17, a4);
  id v6 = v17;
  id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v9 = [v8 calendarIdentifier];
  id v10 = (void *)[v7 initWithCalendarIdentifier:v9];

  if (a4) {
    [v10 setTimeZone:*a4];
  }
  id v11 = v6;
  if (!v11) {
    goto LABEL_7;
  }
  id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v13 = [v12 components:224 fromDate:v11];

  if ([v13 hour] || objc_msgSend(v13, "minute"))
  {

LABEL_7:
    id v14 = v5;

    goto LABEL_8;
  }
  uint64_t v16 = [v13 second];

  id v14 = v11;
  if (v16) {
    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

id dd_urlUserVisibleString(void *a1)
{
  id v1 = a1;
  id v2 = [v1 scheme];
  id v3 = [v2 lowercaseString];

  if (objc_msgSend(v1, "dd_isMaps:", 1))
  {
    id v4 = DDMapAddressFromURL(v1);
    if (!v4) {
      goto LABEL_14;
    }
LABEL_13:
    id v9 = v4;
LABEL_18:
    id v4 = v9;
    id v7 = v9;
    goto LABEL_20;
  }
  if ([v3 isEqualToString:@"mailto"])
  {
    uint64_t v5 = objc_msgSend(v1, "dd_emailFromMailtoScheme");
    id v4 = objc_msgSend(v5, "dd_userFriendlyEmail");

    if (v4) {
      goto LABEL_13;
    }
  }
  else if (objc_msgSend(v1, "dd_isAnySimpleTelephonyScheme"))
  {
    id v6 = objc_msgSend(v1, "dd_phoneNumberFromTelScheme");
    if (v6)
    {
      id v4 = v6;
      if ([v6 containsString:@"@"]) {
        goto LABEL_13;
      }
      if ([v4 isEqualToString:@"open"])
      {
        id v7 = 0;
        goto LABEL_20;
      }
      uint64_t v8 = TUFormattedPhoneNumber();

      id v4 = (void *)v8;
      if (v8) {
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  if (([v3 isEqualToString:@"http"] & 1) != 0
    || [v3 isEqualToString:@"https"])
  {
    id v10 = objc_msgSend(v1, "_lp_userVisibleString");
    if (v10)
    {
      id v9 = v10;
      goto LABEL_18;
    }
  }
  id v7 = [v1 absoluteString];
  id v4 = 0;
LABEL_20:

  return v7;
}

id actionSheetTitleForResult(uint64_t a1)
{
  if (a1)
  {
    id v1 = DDResultGetMatchedString();
    uint64_t Range = DDResultGetRange();
    uint64_t v4 = v3;
    uint64_t RangeForURLification = DDResultGetRangeForURLification();
    NSUInteger v7 = v6;
    NSUInteger v8 = RangeForURLification - Range;
    if (v8 || v6 != v4)
    {
      v40.length = [v1 length];
      v39.location = v8;
      v39.length = v7;
      v40.location = 0;
      NSRange v9 = NSIntersectionRange(v39, v40);
      if (v8 == v9.location && v7 == v9.length)
      {
        uint64_t v10 = objc_msgSend(v1, "substringWithRange:", v8, v7);

        id v1 = (void *)v10;
      }
    }
    switch(DDResultGetCategory())
    {
      case 1u:
        goto LABEL_17;
      case 3u:
        _DDSentenceCasedString(v1);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 4u:
        id v12 = _DDSentenceCasedString(v1);
        id v37 = 0;
        uint64_t v13 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\(|\\)|\\[|\\]" options:1 error:&v37];
        id v14 = v37;
        id v36 = v14;
        uint64_t v15 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"  +" options:1 error:&v36];
        id v16 = v36;

        if (v16)
        {
          id v33 = [MEMORY[0x1E4F28B00] currentHandler];
          v34 = [NSString stringWithUTF8String:"NSString *_DDEventSanitizedString(NSString *__strong)"];
          v35 = [v16 localizedDescription];
          [v33 handleFailureInFunction:v34 file:@"DDUIUtils.m" lineNumber:219 description:v35];
        }
        id v17 = objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v12, 0, 0, objc_msgSend(v12, "length"), @" ");
        uint64_t v18 = objc_msgSend(v15, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, objc_msgSend(v17, "length"), @" ");

        goto LABEL_28;
      case 5u:
        CFStringRef Type = (const __CFString *)DDResultGetType();
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F000], 0))
        {
          if (DDResultHasType() && DDScannerShouldKeepParsecScoresBelowThreshold())
          {
            unsigned int ParsecDomain = DDResultGetParsecDomain();
            if (ParsecDomain > 9) {
              id v21 = @"interesting to look up";
            }
            else {
              id v21 = off_1E5A85988[ParsecDomain];
            }
            if (DDShouldUseDebugHighlightForResult()) {
              v30 = @"Internal: red link? Lookup thinks this hint may be %@, is it?";
            }
            else {
              v30 = @"Internal: Lookup thinks this hint is %@, is it?";
            }
            objc_msgSend(NSString, "stringWithFormat:", v30, v21);
            id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
            uint64_t v18 = v11;
            goto LABEL_29;
          }
LABEL_17:
          id v12 = (void *)DDResultCopyExtractedURL();
          if (!v12
            || ([MEMORY[0x1E4F1CB10] URLWithString:v12],
                (id v22 = objc_claimAutoreleasedReturnValue()) == 0))
          {

LABEL_21:
            id v11 = v1;
            goto LABEL_22;
          }
          id v23 = v22;
          uint64_t v24 = dd_urlUserVisibleString(v22);
        }
        else
        {
          DDResultGetSubresultWithType();
          DDResultGetSubresultWithType();
          id v12 = DDResultGetValue();
          id v23 = DDResultGetMatchedString();
          v25 = [v12 lowercaseString];
          v26 = [v23 lowercaseString];
          int v27 = [v25 isEqualToString:v26];

          if (v27)
          {
            v28 = [v12 uppercaseString];
            uint64_t v18 = [v28 stringByAppendingString:DDResultGetValue()];

            goto LABEL_27;
          }
          uint64_t v24 = _DDSentenceCasedString(v1);
        }
        uint64_t v18 = (void *)v24;
LABEL_27:

LABEL_28:
LABEL_29:

        break;
      default:
        goto LABEL_21;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = [NSString stringWithUTF8String:"NSString *actionSheetTitleForResult(DDResultRef)"];
    [v31 handleFailureInFunction:v32 file:@"DDUIUtils.m" lineNumber:275 description:@"Attempting to determine title for result that is nil."];

    uint64_t v18 = 0;
  }
  return v18;
}

id _DDSentenceCasedString(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] > 1)
  {
    uint64_t v3 = [v1 substringToIndex:1];
    uint64_t v4 = [v3 localizedCapitalizedString];
    uint64_t v5 = [v1 substringFromIndex:1];
    id v2 = [v4 stringByAppendingString:v5];
  }
  else
  {
    id v2 = [v1 localizedUppercaseString];
  }

  return v2;
}

id actionSheetTitleForURL(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *actionSheetTitleForURL(NSURL *__strong)"];
    [v4 handleFailureInFunction:v5 file:@"DDUIUtils.m" lineNumber:378 description:@"Attempting to determine title for url that is nil."];
  }
  id v2 = dd_urlUserVisibleString(v1);

  return v2;
}

id findNearbyResultsInArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v25 = a5;
  uint64_t v10 = a2 - 1;
  unint64_t v11 = a2 + 1;
  unint64_t v12 = [v9 count];
  char v13 = a2 + 1 < v12;
  uint64_t v14 = [v9 objectAtIndex:a2];
  uint64_t Range = DDResultGetRange();
  id v16 = [[DDResultTracker alloc] initWithReferenceResult:v14];
  [(DDResultTracker *)v16 setMaximumDistanceForEmails:a3];
  [(DDResultTracker *)v16 setMaximumDistance:a4];
  if ((v10 & 0x8000000000000000) == 0 || v11 < v12)
  {
    unsigned __int8 v17 = v10 >= 0;
    do
    {
      if (v17)
      {
        uint64_t v18 = [v9 objectAtIndex:v10];
        uint64_t v19 = DDResultGetRange();
        unint64_t v21 = Range - (v20 + v19);
        if ((v13 & 1) == 0) {
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t v18 = 0;
        unint64_t v21 = -1;
        if ((v13 & 1) == 0)
        {
LABEL_6:
          if ((v17 & 1) == 0)
          {
            char v13 = 0;
            goto LABEL_12;
          }
LABEL_10:
          unsigned __int8 v17 = [(DDResultTracker *)v16 addResultIfAppropriate:v18 referenceDate:v25 referenceTimeZone:0];
          --v10;
          goto LABEL_12;
        }
      }
      uint64_t v22 = [v9 objectAtIndex:v11];
      if ((v17 & (v21 < DDResultGetRange() - Range)) != 0) {
        goto LABEL_10;
      }
      char v13 = [(DDResultTracker *)v16 addResultIfAppropriate:v22 referenceDate:v25 referenceTimeZone:0];
      ++v11;
LABEL_12:
      v17 &= v10 >= 0;
      v13 &= v11 < [v9 count];
    }
    while ((v17 & 1) != 0 || (v13 & 1) != 0);
  }
  id v23 = [(DDResultTracker *)v16 results];

  return v23;
}

id findNearbyResultsInTextStorage(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void *a6)
{
  id v11 = a1;
  id v12 = a6;
  uint64_t v13 = *MEMORY[0x1E4F5F118];
  uint64_t v14 = [v11 attribute:*MEMORY[0x1E4F5F118] atIndex:a2 effectiveRange:0];
  uint64_t v15 = [v14 coreResult];

  if (v15)
  {
    id v16 = [[DDResultTracker alloc] initWithReferenceResult:v15];
    [(DDResultTracker *)v16 setMaximumDistanceForEmails:a4];
    [(DDResultTracker *)v16 setMaximumDistance:a5];
    if (a2 >= a5) {
      uint64_t v17 = a2 - a5;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __findNearbyResultsInTextStorage_block_invoke;
    v39[3] = &unk_1E5A85968;
    id v19 = v18;
    id v40 = v19;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, v17, a2 - v17, 2, v39);
    uint64_t v20 = a2 + a3;
    if ([v11 length] - (a2 + a3) < a5) {
      a5 = [v11 length] - v20;
    }
    unint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    id v36 = __findNearbyResultsInTextStorage_block_invoke_2;
    id v37 = &unk_1E5A85968;
    id v22 = v21;
    id v38 = v22;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, v20, a5, 0, &v34);
    while (1)
    {
      if (!objc_msgSend(v19, "count", v34, v35, v36, v37) && !objc_msgSend(v22, "count"))
      {
        v32 = [(DDResultTracker *)v16 results];

        goto LABEL_23;
      }
      if ([v19 count])
      {
        id v23 = [v19 objectAtIndex:0];
        unint64_t v24 = a2 - [v23 range];
      }
      else
      {
        unint64_t v24 = -1;
      }
      if ([v22 count])
      {
        id v25 = [v22 objectAtIndex:0];
        unint64_t v26 = [v25 range] - a2;
      }
      else
      {
        unint64_t v26 = -1;
      }
      if (v24 >= v26)
      {
        v30 = [v22 objectAtIndex:0];
        BOOL v31 = -[DDResultTracker addResultIfAppropriate:referenceDate:referenceTimeZone:](v16, "addResultIfAppropriate:referenceDate:referenceTimeZone:", [v30 coreResult], v12, 0);

        v29 = v22;
        if (!v31) {
          goto LABEL_20;
        }
LABEL_18:
        [v29 removeObjectAtIndex:0];
      }
      else
      {
        int v27 = [v19 objectAtIndex:0];
        BOOL v28 = -[DDResultTracker addResultIfAppropriate:referenceDate:referenceTimeZone:](v16, "addResultIfAppropriate:referenceDate:referenceTimeZone:", [v27 coreResult], v12, 0);

        v29 = v19;
        if (v28) {
          goto LABEL_18;
        }
LABEL_20:
        [v29 removeAllObjects];
      }
    }
  }
  v32 = [MEMORY[0x1E4F1C978] array];
LABEL_23:

  return v32;
}

uint64_t __findNearbyResultsInTextStorage_block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t __findNearbyResultsInTextStorage_block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t dd_hostApplicationCanListCallProviders()
{
  if (dd_hostApplicationCanListCallProviders_onceToken != -1) {
    dispatch_once(&dd_hostApplicationCanListCallProviders_onceToken, &__block_literal_global_4);
  }
  return dd_hostApplicationCanListCallProviders_hostApplicationCanListCallProviders;
}

void __dd_hostApplicationCanListCallProviders_block_invoke()
{
  v0 = _copy_entitlement_value(@"com.apple.telephonyutilities.callservicesd");
  if (v0)
  {
    cf = v0;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      v0 = cf;
    }
    else
    {
      CFRelease(cf);
      v0 = 0;
    }
  }
  cfa = v0;
  dd_hostApplicationCanListCallProviders_hostApplicationCanListCallProviders = [(__SecTask *)v0 containsObject:@"access-call-providers"];
}

uint64_t dd_callsRequireExternalPrompt()
{
  if (dd_callsRequireExternalPrompt_onceToken != -1) {
    dispatch_once(&dd_callsRequireExternalPrompt_onceToken, &__block_literal_global_138);
  }
  return dd_callsRequireExternalPrompt__notAllowed;
}

uint64_t __dd_callsRequireExternalPrompt_block_invoke()
{
  uint64_t result = _get_BOOL_entitlement(@"com.apple.springboard.allowallcallurls");
  dd_callsRequireExternalPrompt__notAllowed = result ^ 1;
  return result;
}

uint64_t _get_BOOL_entitlement(const __CFString *a1)
{
  id v1 = _copy_entitlement_value(a1);
  if (v1)
  {
    id v2 = v1;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v2) && CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
      _get_BOOL_entitlement__isEntitled = 1;
    }
    CFRelease(v2);
  }
  return _get_BOOL_entitlement__isEntitled;
}

uint64_t dd_isLSTrusted()
{
  if (dd_isLSTrusted_onceToken != -1) {
    dispatch_once(&dd_isLSTrusted_onceToken, &__block_literal_global_143);
  }
  return dd_isLSTrusted__trusted;
}

void __dd_isLSTrusted_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (_get_BOOL_entitlement(@"com.apple.private.coreservices.canmaplsdatabase"))
  {
    dd_isLSTrusted__trusted = 1;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v0 = [MEMORY[0x1E4F28B50] mainBundle];
    id v1 = [v0 bundleIdentifier];
    int v2 = 138412290;
    uint64_t v3 = v1;
    _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Host process %@ can't map the LS db. This will be logged once", (uint8_t *)&v2, 0xCu);
  }
}

id dd_applicationNameWithBundleIdentifier(void *a1)
{
  id v1 = a1;
  if (dd_isLSTrusted_onceToken != -1) {
    dispatch_once(&dd_isLSTrusted_onceToken, &__block_literal_global_143);
  }
  if (dd_isLSTrusted__trusted == 1)
  {
    id v7 = 0;
    int v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:&v7];
    id v3 = v7;
    if (!v2)
    {
      uint64_t v6 = 0;
      int v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifierOfSystemPlaceholder:v1 error:&v6];
    }
    uint64_t v4 = [v2 localizedName];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t applicationWithBundleIdentifierIsRestricted(void *a1)
{
  id v1 = a1;
  if (dd_isLSTrusted_onceToken != -1) {
    dispatch_once(&dd_isLSTrusted_onceToken, &__block_literal_global_143);
  }
  if (dd_isLSTrusted__trusted == 1)
  {
    id v9 = 0;
    int v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:&v9];
    id v3 = v9;
    if (v2)
    {
      id v4 = 0;
    }
    else
    {
      id v8 = 0;
      int v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifierOfSystemPlaceholder:v1 error:&v8];
      id v4 = v8;
      if (!v2)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          applicationWithBundleIdentifierIsRestricted_cold_1((uint64_t)v1, (uint64_t)v3, (uint64_t)v4);
        }
        uint64_t v5 = 1;
        goto LABEL_9;
      }
    }
    uint64_t v6 = [v2 applicationState];
    uint64_t v5 = [v6 isRestricted];

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v5 = 0;
LABEL_10:

  return v5;
}

void DDUILogAssertionFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = (objc_class *)NSString;
  id v13 = a5;
  uint64_t v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Data Detectors UI assertion on %s:%d \"%s\" failed: %@", a2, a4, a1, v14];
  if (LoadCrashSupportIfNecessary___CrashReportHandle) {
    goto LABEL_2;
  }
  uint64_t v18 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport" fileSystemRepresentation], 1);
  LoadCrashSupportIfNecessary___CrashReportHandle = (uint64_t)v18;
  if (!v18)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      DDUILogAssertionFailure_cold_2();
    }
LABEL_2:
    id v16 = DDUISimulateCrash;
    if (!DDUISimulateCrash) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v16 = dlsym(v18, "SimulateCrash");
  DDUISimulateCrash = v16;
  if (v16)
  {
LABEL_3:
    uint64_t v17 = getpid();
    ((void (*)(uint64_t, uint64_t, void *))v16)(v17, 3131747805, v15);
  }
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    DDUILogAssertionFailure_cold_1((uint64_t)v15);
  }
}

id DDShipmentTrackingUrlForResult()
{
  v0 = DDResultGetShipmentTrackingUrlString();
  if (v0)
  {
    id v1 = [MEMORY[0x1E4F1CB10] URLWithString:v0];
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

id DDWebSearchURLFromQuery(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    int v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v3 = [v1 stringByTrimmingCharactersInSet:v2];

    id v4 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    uint64_t v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

    uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
    id v7 = [NSString stringWithFormat:@"x-web-search://?%@", v5];
    id v1 = [v6 URLWithString:v7];
  }
  return v1;
}

uint64_t dd_handleIsChatBot(void *a1)
{
  id v1 = a1;
  int v2 = [v1 componentsSeparatedByString:@"@"];
  if ([v2 count] == 2)
  {
    id v3 = [v2 lastObject];
    id v4 = [v3 lowercaseString];

    if ([v4 hasPrefix:@"botplatform."]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = [v4 containsString:@".botplatform."];
    }
    id v1 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t dd_isDeviceLocked()
{
  v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 BOOLValue];

  return v1;
}

uint64_t dd_isInternalInstall()
{
  if (dd_isInternalInstall_onceToken != -1) {
    dispatch_once(&dd_isInternalInstall_onceToken, &__block_literal_global_402);
  }
  return dd_isInternalInstall_isInternalInstall;
}

void __dd_isInternalInstall_block_invoke()
{
  id v1 = (id)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v0 = [v1 isEqualToString:@"Internal"];
  }
  else {
    char v0 = 0;
  }
  dd_isInternalInstall_isInternalInstall = v0;
}

BOOL dd_phoneNumberResultCanBeRdarLink(BOOL result)
{
  if (result)
  {
    DDResultGetRange();
    if ((v1 & 0xFFFFFFFFFFFFFFFELL) != 8) {
      return 0;
    }
    if (dd_isInternalInstall_onceToken != -1) {
      dispatch_once(&dd_isInternalInstall_onceToken, &__block_literal_global_402);
    }
    if (!dd_isInternalInstall_isInternalInstall) {
      return 0;
    }
    int v2 = DDResultGetMatchedString();
    id v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
    id v4 = [v3 invertedSet];

    uint64_t v5 = [v2 rangeOfCharacterFromSet:v4];
    return v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

void dd_requireDeviceUnlockAndPerformBlock(int a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (a1 && (id v4 = (void *)MGCopyAnswer(), v5 = [v4 BOOLValue], v4, v3 = v7, (v5 & 1) != 0)) {
    SBSRequestPasscodeUnlockUI_delayInitStub(v6);
  }
  else {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

void sub_1A172ED10(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *context, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,long long buf)
{
  if (a2 == 1)
  {
    id v25 = objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Exception caught in dd_collectDDRangesForQuery: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1A172ECB4);
  }
  _Unwind_Resume(a1);
}

uint64_t _isLinkNode(void *a1)
{
  id v1 = a1;
  if ([v1 nodeType] == 1)
  {
    int v2 = [v1 tagName];
    if ([v2 length] == 1 && (objc_msgSend(v2, "characterAtIndex:", 0) & 0xFFFFFFDF) == 0x41) {
      uint64_t v3 = [v1 hasAttribute:@"href"];
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _isDataDetectorLinkNode(void *a1)
{
  id v1 = a1;
  if ([v1 nodeType] == 1 && objc_msgSend(v1, "hasAttribute:", @"href"))
  {
    int v2 = [v1 getAttribute:@"href"];
    uint64_t v3 = [v2 hasPrefix:*MEMORY[0x1E4F5F140]];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void _removeDataDetectorLinkInNode(void *a1)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v1 = [v3 parentElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v2 = [v3 parentElement];
    }
    else
    {
      int v2 = 0;
    }

    DDRecursivelyRemoveResultLinksFromAnchor(v3, v2, 0);
  }
}

void DDUpdateContactWithContactResult(void *a1, void *a2)
{
  v38[5] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  char v5 = [v3 givenName];
  double v6 = [v3 familyName];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__2;
  uint64_t v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  if (![v5 length] && !objc_msgSend(v6, "length"))
  {
    id v11 = [v4 valueForKey:*MEMORY[0x1E4F5EFB8]];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      if (![MEMORY[0x1E4F1CBF0] count])
      {
        uint64_t v13 = *MEMORY[0x1E4F1AEB0];
        uint64_t v14 = *MEMORY[0x1E4F5EF98];
        v37[0] = *MEMORY[0x1E4F5EFC8];
        v37[1] = v14;
        uint64_t v15 = *MEMORY[0x1E4F1ADF0];
        v38[0] = v13;
        v38[1] = v15;
        uint64_t v16 = *MEMORY[0x1E4F1AEA0];
        uint64_t v17 = *MEMORY[0x1E4F5EFA8];
        v37[2] = *MEMORY[0x1E4F5EFB0];
        v37[3] = v17;
        uint64_t v18 = *MEMORY[0x1E4F1ADE0];
        v38[2] = v16;
        v38[3] = v18;
        v37[4] = *MEMORY[0x1E4F5EFC0];
        v38[4] = *MEMORY[0x1E4F1AEB8];
        id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        unint64_t v26 = __DDUpdateContactWithContactResult_block_invoke;
        int v27 = &unk_1E5A85AE8;
        v30 = &v31;
        id v28 = v4;
        id v29 = v3;
        [v19 enumerateKeysAndObjectsUsingBlock:&v24];
      }
      uint64_t v20 = objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E4F5F048], v24, v25, v26, v27);
      unint64_t v21 = (void *)v32[5];
      v32[5] = v20;

      id v22 = (void *)v32[5];
      if (v22)
      {
        id v23 = [v22 matchedString];
        [v3 setJobTitle:v23];
      }
      else
      {
        [v3 setJobTitle:&stru_1EF5023D8];
      }
    }
  }
  uint64_t v7 = [v4 valueForKey:*MEMORY[0x1E4F5EF90]];
  id v8 = (void *)v32[5];
  v32[5] = v7;

  id v9 = [v3 organizationName];
  if ([v9 length]) {
    goto LABEL_6;
  }
  BOOL v10 = v32[5] == 0;

  if (!v10)
  {
    id v9 = [(id)v32[5] matchedString];
    [v3 setOrganizationName:v9];
LABEL_6:
  }
  _Block_object_dispose(&v31, 8);
}

void sub_1A1730C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
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

void __DDUpdateContactWithContactResult_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  char v5 = *(void **)(a1 + 32);
  double v6 = [NSString stringWithFormat:@"%@.%@", *MEMORY[0x1E4F5EFB8], a2];
  uint64_t v7 = [v5 valueForKeyPath:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void **)(a1 + 40);
  id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v11)
  {
    BOOL v12 = [v11 matchedString];
    [v10 setValue:v12 forKey:v13];
  }
  else
  {
    [*(id *)(a1 + 40) setValue:&stru_1EF5023D8 forKey:v13];
  }
}

id DDPhoneLabeledValue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
    if (v5)
    {
      double v6 = (void *)v5;
      uint64_t v7 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v3 value:v5];

      goto LABEL_9;
    }
    BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v16) {
      DDPhoneLabeledValue_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      DDPhoneLabeledValue_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

id DDHarvestDataFromResults(void *a1, void *a2)
{
  v207[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v129 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  v101 = v3;
  uint64_t v130 = [v3 range];
  uint64_t v6 = v5;
  id v157 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v8 = *MEMORY[0x1E4F1AE60];
  v207[0] = *MEMORY[0x1E4F1ADC8];
  v207[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v207 count:2];
  uint64_t v10 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v9, 0);

  if (v10)
  {
    long long v201 = 0u;
    long long v200 = 0u;
    long long v199 = 0u;
    long long v198 = 0u;
    uint64_t v11 = [v10 emailAddresses];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v198 objects:v206 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v199;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v199 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = [*(id *)(*((void *)&v198 + 1) + 8 * i) value];
          [v157 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v198 objects:v206 count:16];
      }
      while (v13);
    }

    long long v197 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v194 = 0u;
    uint64_t v17 = [v10 instantMessageAddresses];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v194 objects:v205 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v195;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v195 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = [*(id *)(*((void *)&v194 + 1) + 8 * j) value];
          uint64_t v23 = [v22 username];
          [v157 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v194 objects:v205 count:16];
      }
      while (v19);
    }
  }
  uint64_t v24 = [v101 type];
  uint64_t v139 = *MEMORY[0x1E4F5F0A0];
  int v131 = objc_msgSend(v24, "isEqualToString:");

  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  obuint64_t j = v4;
  uint64_t v140 = [obj countByEnumeratingWithState:&v190 objects:v204 count:16];
  if (v140)
  {
    v124 = 0;
    v127 = 0;
    id v171 = 0;
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    BOOL v135 = 0;
    uint64_t v138 = *(void *)v191;
    uint64_t v27 = *MEMORY[0x1E4F5F020];
    unint64_t v28 = v130;
    uint64_t v29 = v130 + v6;
    uint64_t v167 = *MEMORY[0x1E4F5EFF8];
    uint64_t v164 = *MEMORY[0x1E4F5F040];
    uint64_t v143 = *MEMORY[0x1E4F5EF70];
    uint64_t v134 = *MEMORY[0x1E4F5EFA0];
    uint64_t v128 = *MEMORY[0x1E4F5F010];
    uint64_t v126 = *MEMORY[0x1E4F5F030];
    uint64_t v123 = *MEMORY[0x1E4F5F028];
    uint64_t v103 = *MEMORY[0x1E4F5F108];
    uint64_t v102 = *MEMORY[0x1E4F1B768];
    v137 = (void *)*MEMORY[0x1E4F1B008];
    uint64_t v122 = *MEMORY[0x1E4F5F178];
    v136 = (void *)*MEMORY[0x1E4F1B030];
    uint64_t v121 = *MEMORY[0x1E4F5F1A0];
    uint64_t v120 = *MEMORY[0x1E4F1B038];
    uint64_t v119 = *MEMORY[0x1E4F5F1A8];
    uint64_t v118 = *MEMORY[0x1E4F1B028];
    uint64_t v117 = *MEMORY[0x1E4F5F198];
    uint64_t v116 = *MEMORY[0x1E4F1B050];
    uint64_t v115 = *MEMORY[0x1E4F5F1C0];
    uint64_t v114 = *MEMORY[0x1E4F1B048];
    uint64_t v113 = *MEMORY[0x1E4F5F1B8];
    uint64_t v112 = *MEMORY[0x1E4F1B010];
    uint64_t v111 = *MEMORY[0x1E4F5F180];
    uint64_t v110 = *MEMORY[0x1E4F1B020];
    uint64_t v109 = *MEMORY[0x1E4F5F190];
    uint64_t v108 = *MEMORY[0x1E4F1B040];
    uint64_t v107 = *MEMORY[0x1E4F5F1B0];
    uint64_t v106 = *MEMORY[0x1E4F1B018];
    uint64_t v105 = *MEMORY[0x1E4F5F188];
    v168 = (void *)*MEMORY[0x1E4F1B6F8];
    uint64_t v125 = *MEMORY[0x1E4F5F048];
    uint64_t v104 = *MEMORY[0x1E4F5EF90];
    v161 = (void *)*MEMORY[0x1E4F1B770];
    uint64_t v160 = *MEMORY[0x1E4F5F1F0];
    uint64_t v159 = *MEMORY[0x1E4F5F170];
    uint64_t v133 = *MEMORY[0x1E4F1B700];
    uint64_t v158 = *MEMORY[0x1E4F5F1D8];
    v170 = (void *)*MEMORY[0x1E4F1B728];
    uint64_t v156 = *MEMORY[0x1E4F1B758];
    uint64_t v155 = *MEMORY[0x1E4F5F1F8];
    uint64_t v154 = *MEMORY[0x1E4F5F1D0];
    uint64_t v153 = *MEMORY[0x1E4F1B720];
    uint64_t v152 = *MEMORY[0x1E4F5F1C8];
    uint64_t v151 = *MEMORY[0x1E4F1B710];
    uint64_t v150 = *MEMORY[0x1E4F5F168];
    uint64_t v149 = *MEMORY[0x1E4F1B750];
    uint64_t v148 = *MEMORY[0x1E4F5F1E8];
    uint64_t v147 = *MEMORY[0x1E4F1B738];
    uint64_t v146 = *MEMORY[0x1E4F5F1E0];
    uint64_t v144 = *MEMORY[0x1E4F5F020];
    uint64_t v169 = v130 + v6;
    while (1)
    {
      uint64_t v30 = 0;
      do
      {
        uint64_t v31 = v26;
        if (*(void *)v191 != v138)
        {
          uint64_t v32 = v30;
          objc_enumerationMutation(obj);
          uint64_t v30 = v32;
        }
        uint64_t v145 = v30;
        uint64_t v33 = *(void **)(*((void *)&v190 + 1) + 8 * v30);
        uint64_t v34 = [v33 type];
        int v35 = [v34 isEqualToString:v139];

        id v36 = (void *)MEMORY[0x1E4F1C978];
        if (v35)
        {
          id v37 = [v33 subResults];
          id v38 = [v36 arrayWithArray:v37];

          int v39 = 1;
        }
        else
        {
          id v38 = [MEMORY[0x1E4F1C978] arrayWithObject:v33];
          int v39 = v131;
        }
        int v163 = v39;
        long long v188 = 0u;
        long long v189 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        id v172 = v38;
        unint64_t v26 = v31;
        uint64_t v174 = [v172 countByEnumeratingWithState:&v186 objects:v203 count:16];
        if (v174)
        {
          uint64_t v173 = *(void *)v187;
LABEL_27:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v187 != v173) {
              objc_enumerationMutation(v172);
            }
            long long v41 = *(void **)(*((void *)&v186 + 1) + 8 * v40);
            unint64_t v42 = [v41 range];
            uint64_t v44 = v42 - v29;
            if (v42 <= v28) {
              uint64_t v44 = v28 - (v43 + v42);
            }
            if ((v44 & (unint64_t)~(v44 >> 63)) > 0x1F4) {
              goto LABEL_156;
            }
            v45 = [v41 type];
            v175 = v45;
            if ([v41 category] == 2) {
              break;
            }
            if (![v45 isEqualToString:v27])
            {
              if (([v45 isEqualToString:v167] & 1) == 0
                && ([v45 isEqualToString:v164] & 1) == 0
                && ![v45 isEqualToString:v143])
              {
                if ([v45 isEqualToString:v134])
                {
                  DDUpdateContactWithContactResult(v129, v41);
                  if (!v163) {
                    goto LABEL_74;
                  }
                  if (v135)
                  {
                    BOOL v135 = 1;
                    goto LABEL_74;
                  }
                  id v48 = [v41 valueForKey:v125];
                  if (v48)
                  {
                    BOOL v135 = 1;
                    goto LABEL_73;
                  }
                  id v49 = [v41 valueForKey:v104];
                  BOOL v135 = v49 != 0;
                  goto LABEL_72;
                }
                if ([v45 isEqualToString:v128])
                {
                  if (v127) {
                    goto LABEL_74;
                  }
                  DDMapsGetBestAddressForResults(v172, 0);
                  id v48 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v48)
                  {
                    v127 = 0;
                    goto LABEL_73;
                  }
                  id v49 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v168 value:v48];
                  if (v49)
                  {
                    v127 = [MEMORY[0x1E4F1CA48] arrayWithObject:v49];
                  }
                  else
                  {
                    v127 = 0;
                  }
                  goto LABEL_72;
                }
                v88 = v25;
                v89 = v26;
                if ([v45 isEqualToString:v126])
                {
                  id v177 = 0;
                  id v176 = 0;
                  int v90 = [v41 getIMScreenNameValue:&v177 type:&v176];
                  id v48 = v177;
                  id v49 = v176;
                  if (v90)
                  {
                    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v137, v122, v136, v121, v120, v119, v118, v117, v116, v115, v114, v113, v112, v111, v110, v109, v108,
                      v107,
                      v106,
                      v105,
                    v91 = 0);
                    v92 = [v91 objectForKey:v49];
                    if (v92)
                    {
                      v166 = v91;
                      v93 = (void *)[objc_alloc(MEMORY[0x1E4F1BA18]) initWithUsername:v48 service:v92];
                      uint64_t v94 = (uint64_t)v171;
                      if (!v171)
                      {
                        uint64_t v94 = [MEMORY[0x1E4F1CA48] array];
                      }
                      id v171 = (id)v94;
                      unint64_t v26 = v89;
                      if (v93)
                      {
                        v95 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v168 value:v93];
                        if (v95 && ([v171 containsObject:v95] & 1) == 0) {
                          [v171 addObject:v95];
                        }
                      }
                      v91 = v166;
                    }
                    else
                    {
                      unint64_t v26 = v89;
                    }

                    uint64_t v25 = v88;
                    uint64_t v29 = v169;
                    goto LABEL_72;
                  }
                }
                else
                {
                  if (!v163
                    || ([v45 isEqualToString:v123] & 1) == 0
                    && ![v45 isEqualToString:v103]
                    || v124)
                  {
                    uint64_t v25 = v88;
                    goto LABEL_74;
                  }
                  v96 = (void *)MEMORY[0x1E4F1BA20];
                  v97 = [v41 matchedString];
                  id v48 = [v96 labeledValueWithLabel:v102 value:v97];

                  if (!v48)
                  {
                    v124 = 0;
                    unint64_t v26 = v89;
                    uint64_t v25 = v88;
                    goto LABEL_73;
                  }
                  [MEMORY[0x1E4F1CA48] arrayWithObject:v48];
                  v124 = id v49 = 0;
                }
                unint64_t v26 = v89;
                uint64_t v25 = v88;
                goto LABEL_72;
              }
              id v57 = v168;
              id v183 = 0;
              id v182 = 0;
              int v58 = [v41 getMailValue:&v183 label:&v182];
              id v59 = v183;
              id v49 = v182;
              if (v58)
              {
                v165 = v57;
                objc_msgSend(v59, "dd_userFriendlyEmail");
                id v48 = (id)objc_claimAutoreleasedReturnValue();

                if ((v163 & 1) != 0 || ([v157 containsObject:v48] & 1) == 0)
                {
                  if (v25)
                  {
                    if ([v25 count]) {
                      goto LABEL_57;
                    }
                  }
                  else
                  {
                    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
                  }
                  if (v49)
                  {
                    v68 = v25;
                    v69 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v161, v160, v165, v159, v133, v158, 0);
                    v70 = [v69 objectForKey:v49];
                    v71 = v70;
                    id v162 = v165;
                    if (v70)
                    {
                      id v162 = v70;
                    }
                    uint64_t v25 = v68;
                    uint64_t v29 = v169;
LABEL_87:
                  }
                  else
                  {
                    id v162 = v165;
                    if (v135)
                    {
                      id v162 = v161;
                      v69 = v165;
                      goto LABEL_87;
                    }
                  }
                  if (v48)
                  {
                    v72 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v162 value:v48];
                    if (v72 && ([v25 containsObject:v72] & 1) == 0) {
                      [v25 addObject:v72];
                    }
                  }
                  if (([v175 isEqualToString:v164] & 1) != 0
                    || [v175 isEqualToString:v143])
                  {
                    v141 = v25;
                    int v73 = [v175 isEqualToString:v164];
                    v74 = v137;
                    if (v73) {
                      v74 = v136;
                    }
                    id v75 = v74;
                    v76 = v171;
                    if (!v171)
                    {
                      v76 = [MEMORY[0x1E4F1CA48] array];
                    }
                    v142 = v26;
                    long long v180 = 0u;
                    long long v181 = 0u;
                    long long v178 = 0u;
                    long long v179 = 0u;
                    id v171 = v76;
                    uint64_t v77 = [v171 countByEnumeratingWithState:&v178 objects:v202 count:16];
                    if (v77)
                    {
                      uint64_t v78 = v77;
                      uint64_t v79 = *(void *)v179;
                      while (2)
                      {
                        for (uint64_t k = 0; k != v78; ++k)
                        {
                          if (*(void *)v179 != v79) {
                            objc_enumerationMutation(v171);
                          }
                          v81 = [*(id *)(*((void *)&v178 + 1) + 8 * k) value];
                          v82 = [v81 service];
                          char v83 = [v82 isEqualToString:v75];

                          if (v83)
                          {
                            char v84 = 1;
                            goto LABEL_109;
                          }
                        }
                        uint64_t v78 = [v171 countByEnumeratingWithState:&v178 objects:v202 count:16];
                        if (v78) {
                          continue;
                        }
                        break;
                      }
                      char v84 = 0;
LABEL_109:
                      unint64_t v28 = v130;
                      uint64_t v27 = v144;
                      uint64_t v29 = v169;
                    }
                    else
                    {
                      char v84 = 0;
                    }

                    if (v48)
                    {
                      v85 = (void *)[objc_alloc(MEMORY[0x1E4F1BA18]) initWithUsername:v48 service:v75];
                      if (v85) {
                        char v86 = v84;
                      }
                      else {
                        char v86 = 1;
                      }
                      if ((v86 & 1) == 0)
                      {
                        v87 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v165 value:v85];
                        if (v87 && ([v171 containsObject:v87] & 1) == 0) {
                          [v171 addObject:v87];
                        }

                        uint64_t v29 = v169;
                      }
                    }
                    uint64_t v25 = v141;
                    unint64_t v26 = v142;
                  }

                  goto LABEL_72;
                }
LABEL_57:
                id v59 = v48;
                id v57 = v165;
              }

              id v48 = v59;
              goto LABEL_72;
            }
            v54 = [v41 matchedString];
            id v48 = [v54 lowercaseString];

            if ([v48 hasPrefix:@"mailto:"])
            {
              v55 = [MEMORY[0x1E4F1CB10] URLWithString:v48];
              v56 = objc_msgSend(v55, "dd_emailFromMailtoScheme");
              objc_msgSend(v56, "dd_userFriendlyEmail");
              id v49 = (id)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                id v46 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v49];
                if (v46) {
                  [v25 addObject:v46];
                }
LABEL_71:
              }
LABEL_72:

              goto LABEL_73;
            }
            if ([v48 hasPrefix:@"tel:"])
            {
              v60 = [MEMORY[0x1E4F1CB10] URLWithString:v48];
              v61 = objc_msgSend(v60, "dd_phoneNumberFromTelScheme");
              DDPhoneLabeledValue(0, v61);
              id v49 = (id)objc_claimAutoreleasedReturnValue();

              if (v49 && ([v26 containsObject:v49] & 1) == 0) {
                [v26 addObject:v49];
              }
              goto LABEL_72;
            }
LABEL_73:

            v45 = v175;
LABEL_74:

            if (++v40 == v174)
            {
              uint64_t v98 = [v172 countByEnumeratingWithState:&v186 objects:v203 count:16];
              uint64_t v174 = v98;
              if (v98) {
                goto LABEL_27;
              }
              goto LABEL_156;
            }
          }
          id v46 = v170;
          id v185 = 0;
          id v184 = 0;
          int v47 = [v41 getPhoneValue:&v185 label:&v184];
          id v48 = v185;
          id v49 = v184;
          if (!v47) {
            goto LABEL_71;
          }
          if (v48)
          {
            uint64_t v50 = TUFormattedPhoneNumber();
            v51 = (void *)v50;
            if (v50) {
              v52 = (void *)v50;
            }
            else {
              v52 = v48;
            }
            id v53 = v52;

            id v48 = v53;
            uint64_t v29 = v169;
          }
          if (v26)
          {
            if ((unint64_t)[v26 count] > 2) {
              goto LABEL_71;
            }
            if (!v49) {
              goto LABEL_67;
            }
LABEL_64:
            objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v161, v160, v168, v159, v46, v158, v156, v155, v46, v154, v153, v152, v151, v150, v149, v148, v147,
              v146,
            v62 = 0);
            v63 = [v62 objectForKey:v49];
            v64 = v63;
            if (v63)
            {
              v65 = v25;
              id v66 = v63;

              id v46 = v66;
              uint64_t v25 = v65;
              uint64_t v27 = v144;
            }

            uint64_t v29 = v169;
          }
          else
          {
            unint64_t v26 = [MEMORY[0x1E4F1CA48] array];
            if (v49) {
              goto LABEL_64;
            }
          }
LABEL_67:
          v67 = DDPhoneLabeledValue(v46, v48);
          if (v67 && ([v26 containsObject:v67] & 1) == 0) {
            [v26 addObject:v67];
          }

          goto LABEL_71;
        }
LABEL_156:

        uint64_t v30 = v145 + 1;
      }
      while (v145 + 1 != v140);
      uint64_t v140 = [obj countByEnumeratingWithState:&v190 objects:v204 count:16];
      if (!v140) {
        goto LABEL_160;
      }
    }
  }
  v124 = 0;
  v127 = 0;
  id v171 = 0;
  uint64_t v25 = 0;
  unint64_t v26 = 0;
LABEL_160:

  [v129 setEmailAddresses:v25];
  [v129 setUrlAddresses:v124];
  [v129 setInstantMessageAddresses:v171];
  [v129 setPhoneNumbers:v26];
  [v129 setPostalAddresses:v127];
  id v99 = v129;

  return v99;
}

void DDMergeContactIntoContact(void *a1, void *a2, int a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a2;
  uint64_t v6 = *MEMORY[0x1E4F1AEE0];
  uint64_t v7 = *MEMORY[0x1E4F1ADC8];
  v66[0] = *MEMORY[0x1E4F1AEE0];
  v66[1] = v7;
  uint64_t v50 = v7;
  uint64_t v43 = *MEMORY[0x1E4F1AFB0];
  uint64_t v44 = *MEMORY[0x1E4F1AE60];
  v66[2] = *MEMORY[0x1E4F1AE60];
  v66[3] = v43;
  uint64_t v8 = *MEMORY[0x1E4F1AE78];
  uint64_t v42 = *MEMORY[0x1E4F1AF10];
  v66[4] = *MEMORY[0x1E4F1AF10];
  v66[5] = v8;
  uint64_t v38 = *MEMORY[0x1E4F1AEA0];
  uint64_t v39 = *MEMORY[0x1E4F1ADF0];
  v66[6] = *MEMORY[0x1E4F1ADF0];
  v66[7] = v38;
  uint64_t v36 = *MEMORY[0x1E4F1AEB8];
  uint64_t v37 = *MEMORY[0x1E4F1ADE0];
  v66[8] = *MEMORY[0x1E4F1ADE0];
  v66[9] = v36;
  uint64_t v34 = v8;
  uint64_t v35 = *MEMORY[0x1E4F1AED8];
  v66[10] = *MEMORY[0x1E4F1AED8];
  v66[11] = v8;
  uint64_t v41 = *MEMORY[0x1E4F1AEB0];
  v66[12] = *MEMORY[0x1E4F1AEB0];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:13];
  uint64_t v10 = [v4 organizationName];
  if ([v10 length]) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = [v4 contactType] == 1;
  }
  BOOL v52 = v11;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v56;
    uint64_t v33 = &v64;
    uint64_t v15 = *MEMORY[0x1E4F1B700];
    uint64_t v54 = *MEMORY[0x1E4F1B770];
    id v47 = v5;
    id v48 = v4;
    uint64_t v45 = *(void *)v56;
    uint64_t v46 = v6;
    do
    {
      uint64_t v16 = 0;
      uint64_t v49 = v13;
      do
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v16;
        uint64_t v17 = *(void **)(*((void *)&v55 + 1) + 8 * v16);
        uint64_t v18 = objc_msgSend(v4, "valueForKey:", v17, v33);
        if (([v17 isEqualToString:v6] & 1) != 0
          || ([v17 isEqualToString:v50] & 1) != 0
          || ([v17 isEqualToString:v44] & 1) != 0
          || ([v17 isEqualToString:v43] & 1) != 0
          || [v17 isEqualToString:v42])
        {
          if ([v18 count])
          {
            if (v52)
            {
              id v19 = v18;
              uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              id v20 = v19;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v67 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v60;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v60 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v25 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                    unint64_t v26 = [v25 label];
                    int v27 = [v26 isEqualToString:v15];

                    if (v27)
                    {
                      unint64_t v28 = (void *)MEMORY[0x1E4F1BA20];
                      uint64_t v29 = [v25 value];
                      uint64_t v30 = [v28 labeledValueWithLabel:v54 value:v29];

                      if (v30) {
                        [v18 addObject:v30];
                      }
                    }
                    else
                    {
                      [v18 addObject:v25];
                    }
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v59 objects:v67 count:16];
                }
                while (v22);
              }

              id v5 = v47;
              id v4 = v48;
              uint64_t v14 = v45;
              uint64_t v6 = v46;
              uint64_t v13 = v49;
            }
            [v5 setValue:v18 forKey:v17];
          }
        }
        else if (([v17 isEqualToString:v41] & 1) != 0 {
               || ([v17 isEqualToString:v39] & 1) != 0
        }
               || ([v17 isEqualToString:v38] & 1) != 0
               || ([v17 isEqualToString:v37] & 1) != 0
               || ([v17 isEqualToString:v36] & 1) != 0
               || ([v17 isEqualToString:v35] & 1) != 0
               || [v17 isEqualToString:v34])
        {
          if (a3)
          {
            uint64_t v31 = [v4 valueForKey:v17];
            [v5 setValue:v31 forKey:v17];
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          DDMergeContactIntoContact_cold_1(buf, (uint64_t)v17, v33);
        }

        uint64_t v16 = v53 + 1;
      }
      while (v53 + 1 != v13);
      uint64_t v32 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
      uint64_t v13 = v32;
    }
    while (v32);
  }
}

id DDDefaultAddressForContact(void *a1)
{
  id v1 = a1;
  if ([v1 isKeyAvailable:@"postalAddresses"])
  {
    int v2 = [v1 postalAddresses];
    id v3 = [v2 firstObject];
    id v4 = [v3 value];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

BOOL DDContactHasNameInfo(void *a1)
{
  id v1 = a1;
  if ([v1 isKeyAvailable:@"givenName"])
  {
    int v2 = [v1 givenName];
  }
  else if ([v1 isKeyAvailable:@"familyName"])
  {
    int v2 = [v1 familyName];
  }
  else
  {
    if (![v1 isKeyAvailable:@"organizationName"])
    {
      BOOL v3 = 0;
      goto LABEL_8;
    }
    int v2 = [v1 organizationName];
  }
  BOOL v3 = v2 != 0;

LABEL_8:
  return v3;
}

void DDAugmentContactWithResultsFromAction(void *a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 result];
  uint64_t v6 = [v4 coalescedResult];
  if (v5)
  {
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F5F150] resultFromCoreResult:v6];
      v25[0] = v7;
      uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = (void **)v25;
    }
    else
    {
      if ([v4 associatedResults])
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F5F150], "resultsFromCoreResults:");
        goto LABEL_9;
      }
      uint64_t v7 = [MEMORY[0x1E4F5F150] resultFromCoreResult:v5];
      uint64_t v24 = v7;
      uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v9 = &v24;
    }
    uint64_t v10 = [v8 arrayWithObjects:v9 count:1];

LABEL_9:
    id v19 = [MEMORY[0x1E4F5F150] resultFromCoreResult:v5];
    if (v19)
    {
      uint64_t v20 = [v10 sortedArrayUsingFunction:MEMORY[0x1E4F5F148] context:v19];

      uint64_t v10 = (void *)v20;
    }
    uint64_t v21 = [MEMORY[0x1E4F5F150] resultFromCoreResult:v5];
    uint64_t v22 = DDHarvestDataFromResults(v21, v10);

    uint64_t v23 = [v4 associatedVisualResults];
    _DDFillContactWithGroupResult(v22, v23);

    DDMergeContactIntoContact(v22, v3, 1);
    goto LABEL_12;
  }
  BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v11) {
    DDAugmentContactWithResultsFromAction_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
  }
LABEL_12:
}

void _DDFillContactWithGroupResult(void *a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v74 = a1;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v84;
    uint64_t v6 = *MEMORY[0x1E4F5EFA0];
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v84 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v83 + 1) + 8 * v7);
      uint64_t v9 = [v8 type];
      int v10 = [v9 isEqualToString:v6];

      if (v10) {
        break;
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
        if (!v4) {
          goto LABEL_65;
        }
        goto LABEL_3;
      }
    }
    BOOL v11 = [v74 givenName];
    if ([v11 length])
    {
      BOOL v71 = 0;
    }
    else
    {
      uint64_t v12 = [v74 familyName];
      if ([v12 length])
      {
        BOOL v71 = 0;
      }
      else
      {
        uint64_t v13 = [v74 nickname];
        BOOL v71 = [v13 length] == 0;
      }
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v70 = [v8 subResults];
    uint64_t v14 = [v70 countByEnumeratingWithState:&v79 objects:v88 count:16];
    uint64_t v15 = v74;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v80;
      uint64_t v68 = *MEMORY[0x1E4F5F048];
      uint64_t v69 = *MEMORY[0x1E4F5EF90];
      uint64_t v66 = *MEMORY[0x1E4F5EFB8];
      uint64_t v67 = *(void *)v80;
      do
      {
        uint64_t v18 = 0;
        uint64_t v63 = v16;
        do
        {
          if (*(void *)v80 != v17) {
            objc_enumerationMutation(v70);
          }
          id v19 = *(void **)(*((void *)&v79 + 1) + 8 * v18);
          uint64_t v20 = [v19 type];
          uint64_t v21 = [v15 organizationName];
          if ([v21 length])
          {
            uint64_t v22 = v20;
          }
          else
          {
            uint64_t v22 = v20;
            int v23 = [v20 isEqualToString:v69];

            if (v23)
            {
              id v24 = [v19 matchedString];
              [v15 setOrganizationName:v24];
LABEL_33:
              uint64_t v29 = v22;
              goto LABEL_61;
            }
          }
          uint64_t v25 = [v15 departmentName];
          if ([v25 length])
          {
          }
          else
          {
            int v26 = [v22 isEqualToString:@"DepartmentName"];

            if (v26)
            {
              id v24 = [v19 matchedString];
              [v15 setDepartmentName:v24];
              goto LABEL_33;
            }
          }
          int v27 = [v15 jobTitle];
          if ([v27 length])
          {
          }
          else
          {
            int v28 = [v22 isEqualToString:v68];

            if (v28)
            {
              id v24 = [v19 matchedString];
              [v15 setJobTitle:v24];
              goto LABEL_33;
            }
          }
          uint64_t v29 = v22;
          if (!v71) {
            goto LABEL_62;
          }
          if ([v22 isEqualToString:@"NLPContactName"])
          {
            id v24 = objc_alloc_init(MEMORY[0x1E4F28F38]);
            uint64_t v30 = [v19 matchedString];
            uint64_t v31 = [v24 personNameComponentsFromString:v30];

            uint64_t v32 = [v31 givenName];
            [MEMORY[0x1E4F1CA20] currentLocale];
            v34 = uint64_t v33 = v18;
            uint64_t v35 = [v32 capitalizedStringWithLocale:v34];
            [v74 setGivenName:v35];

            uint64_t v36 = [v31 middleName];
            [v74 setMiddleName:v36];

            uint64_t v37 = [v31 familyName];
            uint64_t v15 = v74;
            uint64_t v38 = [MEMORY[0x1E4F1CA20] currentLocale];
            uint64_t v39 = [v37 capitalizedStringWithLocale:v38];
            [v74 setFamilyName:v39];

            uint64_t v17 = v67;
            uint64_t v18 = v33;

            uint64_t v40 = [v31 namePrefix];
            [v74 setNamePrefix:v40];

            uint64_t v41 = [v31 nameSuffix];
            [v74 setNameSuffix:v41];

            goto LABEL_61;
          }
          if (![v22 isEqualToString:v66]) {
            goto LABEL_62;
          }
          uint64_t v65 = v18;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v24 = [v19 subResults];
          uint64_t v42 = [v24 countByEnumeratingWithState:&v75 objects:v87 count:16];
          if (!v42) {
            goto LABEL_61;
          }
          uint64_t v43 = v42;
          int v64 = v22;
          uint64_t v44 = *(void *)v76;
          unint64_t v45 = 0x1E4F1C000uLL;
          do
          {
            uint64_t v46 = 0;
            do
            {
              if (*(void *)v76 != v44) {
                objc_enumerationMutation(v24);
              }
              id v47 = *(void **)(*((void *)&v75 + 1) + 8 * v46);
              id v48 = [v47 type];
              uint64_t v49 = [v47 matchedString];
              if ([v48 isEqualToString:@"FirstName"])
              {
                uint64_t v50 = [*(id *)(v45 + 2592) currentLocale];
                v51 = [v49 capitalizedStringWithLocale:v50];
                [v74 setGivenName:v51];
LABEL_45:

                goto LABEL_48;
              }
              if ([v48 isEqualToString:@"MiddleName"])
              {
                [v74 setMiddleName:v49];
              }
              else
              {
                if ([v48 isEqualToString:@"LastName"])
                {
                  uint64_t v50 = [*(id *)(v45 + 2592) currentLocale];
                  v51 = [v49 capitalizedStringWithLocale:v50];
                  [v74 setFamilyName:v51];
                  goto LABEL_45;
                }
                if ([v48 isEqualToString:@"Title"])
                {
                  [v74 setNamePrefix:v49];
                }
                else if ([v48 isEqualToString:@"NameSuffix"])
                {
                  [v74 setNameSuffix:v49];
                }
                else if (([v48 isEqualToString:@"AddressBookContactName"] & 1) != 0 {
                       || [v48 isEqualToString:@"NLPContactName"])
                }
                {
                  id v72 = objc_alloc_init(MEMORY[0x1E4F28F38]);
                  int v73 = [v72 personNameComponentsFromString:v49];
                  BOOL v52 = [v73 givenName];
                  uint64_t v53 = [MEMORY[0x1E4F1CA20] currentLocale];
                  uint64_t v54 = [v52 capitalizedStringWithLocale:v53];
                  [v74 setGivenName:v54];

                  long long v55 = [v73 middleName];
                  [v74 setMiddleName:v55];

                  long long v56 = [v73 familyName];
                  long long v57 = [MEMORY[0x1E4F1CA20] currentLocale];
                  long long v58 = [v56 capitalizedStringWithLocale:v57];
                  [v74 setFamilyName:v58];

                  long long v59 = [v73 namePrefix];
                  [v74 setNamePrefix:v59];

                  long long v60 = [v73 nameSuffix];
                  [v74 setNameSuffix:v60];

                  unint64_t v45 = 0x1E4F1C000;
                }
              }
LABEL_48:

              ++v46;
            }
            while (v43 != v46);
            uint64_t v61 = [v24 countByEnumeratingWithState:&v75 objects:v87 count:16];
            uint64_t v43 = v61;
          }
          while (v61);
          uint64_t v16 = v63;
          uint64_t v29 = v64;
          uint64_t v17 = v67;
          uint64_t v18 = v65;
          uint64_t v15 = v74;
LABEL_61:

LABEL_62:
          ++v18;
        }
        while (v18 != v16);
        uint64_t v16 = [v70 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v16);
    }
  }
LABEL_65:
}

uint64_t DDPersonActionsSupportedSchemes()
{
  return [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF510080];
}

id DDContactFromResult(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  uint64_t v54 = a4;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  unint64_t v70 = a2;
  id v55 = a3;
  long long v56 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v61 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = [MEMORY[0x1E4F1CA48] array];
  long long v57 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = [MEMORY[0x1E4F1CA48] array];
  int v64 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF510080];
  if (a1 | v70)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    if (a1)
    {
      CFStringRef Type = (const __CFString *)DDResultGetType();
      if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F0A0], 0))
      {
        [v6 addObject:a1];
        if (v55)
        {
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v8 = v55;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v93 objects:v101 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v94;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v94 != v10) {
                  objc_enumerationMutation(v8);
                }
                objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * i), "coreResult", v54));
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v93 objects:v101 count:16];
            }
            while (v9);
          }
        }
      }
      else
      {
        [v6 addObjectsFromArray:DDResultGetSubResults()];
      }
    }
    if (v70) {
      [v6 addObject:v70];
    }
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    obuint64_t j = v6;
    uint64_t v68 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
    if (v68)
    {
      id v65 = *(id *)v90;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(id *)v90 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v89 + 1) + 8 * v12);
          if (v13 == (void *)v70) {
            goto LABEL_26;
          }
          int Category = DDResultGetCategory();
          if ((Category - 1) >= 2)
          {
            if (Category != 3) {
              goto LABEL_47;
            }
            id v19 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
            DDResultGetSubresultWithType();
            [v19 setStreet:DDResultGetMatchedString()];
            int v27 = [v19 street];
            BOOL v28 = v27 == 0;

            if (v28)
            {
              DDResultGetSubresultWithType();
              [v19 setStreet:DDResultGetMatchedString()];
            }
            DDResultGetSubresultWithType();
            [v19 setCity:DDResultGetMatchedString()];
            DDResultGetSubresultWithType();
            [v19 setState:DDResultGetMatchedString()];
            DDResultGetSubresultWithType();
            [v19 setPostalCode:DDResultGetMatchedString()];
            DDResultGetSubresultWithType();
            [v19 setCountry:DDResultGetMatchedString()];
            [v19 setISOCountryCode:DDResultGetCountryCode()];
            [v59 addObject:v19];
            uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:0 value:v19];
            [v60 addObject:v29];

            goto LABEL_46;
          }
          if (!v13)
          {
LABEL_26:
            char v18 = 1;
          }
          else
          {
            uint64_t v15 = (void *)DDResultCopyExtractedURLWithOptions();
            if (v15)
            {
              id v16 = v15;
              char v17 = 0;
              char v18 = 0;
              id v19 = v16;
              goto LABEL_29;
            }
            char v18 = 0;
          }
          objc_msgSend((id)v70, "absoluteString", v54);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          id v16 = 0;
          if (v19)
          {
            char v17 = 1;
LABEL_29:
            CFTypeRef cf = 0;
            uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v19, v54);
            uint64_t v21 = objc_msgSend(v20, "dd_emailFromValidSchemes:", v64);
            uint64_t v22 = objc_msgSend(v21, "dd_userFriendlyEmail");

            if (v22 && ([v62 containsObject:v22] & 1) == 0)
            {
              [v62 addObject:v22];
              if ((v18 & 1) == 0) {
                DDResultCopyMailValue();
              }
              int v23 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:cf value:v22];
              [v58 addObject:v23];
            }
            id v24 = objc_msgSend(v20, "dd_phoneNumberFromValidSchemes:", v64);
            if (v24 && ([v61 containsObject:v24] & 1) == 0)
            {
              [v61 addObject:v24];
              uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v24];
              [v56 addObject:v25];
              if ((v18 & 1) == 0) {
                DDResultCopyPhoneValue();
              }
              int v26 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:cf value:v25];
              [v57 addObject:v26];
            }
            if ((v17 & 1) == 0) {
              CFRelease(v16);
            }
            goto LABEL_46;
          }
          id v19 = 0;
LABEL_46:

LABEL_47:
          ++v12;
        }
        while (v68 != v12);
        uint64_t v30 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
        uint64_t v68 = v30;
      }
      while (v30);
    }
  }
  CFTypeRef cf = 0;
  p_CFTypeRef cf = &cf;
  uint64_t v85 = 0x3032000000;
  long long v86 = __Block_byref_object_copy__2;
  v87 = __Block_byref_object_dispose__2;
  id v88 = 0;
  if ((dd_isDeviceLocked() & 1) == 0
    && [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
  {
    id v69 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v31 = objc_alloc(MEMORY[0x1E4F1B908]);
    double Helper_x8__OBJC_CLASS___CNContactContentViewController = gotLoadHelper_x8__OBJC_CLASS___CNContactContentViewController(v32);
    uint64_t v35 = objc_msgSend(*(id *)(v34 + 2936), "descriptorForRequiredKeys", Helper_x8__OBJC_CLASS___CNContactContentViewController);
    id v99 = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
    uint64_t v37 = (void *)[v31 initWithKeysToFetch:v36];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v66 = v56;
    uint64_t v38 = [v66 countByEnumeratingWithState:&v79 objects:v98 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v80;
      uint64_t v40 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v80 != v39) {
            objc_enumerationMutation(v66);
          }
          uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForContactsMatchingPhoneNumber:", *(void *)(*((void *)&v79 + 1) + 8 * j), v54);
          [v37 setPredicate:v42];

          v77[4] = &cf;
          uint64_t v78 = 0;
          v77[0] = v40;
          v77[1] = 3221225472;
          v77[2] = __DDContactFromResult_block_invoke;
          v77[3] = &unk_1E5A85B10;
          [v69 enumerateContactsWithFetchRequest:v37 error:&v78 usingBlock:v77];
        }
        uint64_t v38 = [v66 countByEnumeratingWithState:&v79 objects:v98 count:16];
      }
      while (v38);
    }

    if (!p_cf[5])
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v67 = v62;
      uint64_t v43 = [v67 countByEnumeratingWithState:&v73 objects:v97 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v74;
        uint64_t v45 = MEMORY[0x1E4F143A8];
        do
        {
          for (uint64_t k = 0; k != v43; ++k)
          {
            if (*(void *)v74 != v44) {
              objc_enumerationMutation(v67);
            }
            id v47 = objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForContactsMatchingEmailAddress:", *(void *)(*((void *)&v73 + 1) + 8 * k), v54);
            [v37 setPredicate:v47];

            v71[4] = &cf;
            uint64_t v72 = 0;
            v71[0] = v45;
            v71[1] = 3221225472;
            v71[2] = __DDContactFromResult_block_invoke_2;
            v71[3] = &unk_1E5A85B10;
            [v69 enumerateContactsWithFetchRequest:v37 error:&v72 usingBlock:v71];
          }
          uint64_t v43 = [v67 countByEnumeratingWithState:&v73 objects:v97 count:16];
        }
        while (v43);
      }
    }
  }
  id v48 = p_cf;
  if (v54) {
    BOOL *v54 = p_cf[5] != 0;
  }
  uint64_t v49 = (void *)v48[5];
  if (!v49)
  {
    id v50 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v50 setPhoneNumbers:v57];
    [v50 setEmailAddresses:v58];
    [v50 setPostalAddresses:v60];
    _DDFillContactWithGroupResult(v50, v55);
    v51 = (void *)p_cf[5];
    p_cf[5] = v50;

    uint64_t v49 = (void *)p_cf[5];
  }
  id v52 = v49;
  _Block_object_dispose(&cf, 8);

  return v52;
}

void sub_1A1733C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void __DDContactFromResult_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __DDContactFromResult_block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

id DDMapsGetBestAddressForResults(void *a1, int a2)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v65 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v3 = v2;
  uint64_t v53 = [v3 countByEnumeratingWithState:&v68 objects:v76 count:16];
  uint64_t v4 = 0;
  if (v53)
  {
    uint64_t v5 = *(void *)v69;
    uint64_t v6 = *MEMORY[0x1E4F5F010];
    uint64_t v61 = *MEMORY[0x1E4F5EF88];
    uint64_t v58 = *MEMORY[0x1E4F5F110];
    uint64_t v54 = *MEMORY[0x1E4F5F0A8];
    uint64_t v50 = *MEMORY[0x1E4F5EFD0];
    p_inst_meths = &OBJC_PROTOCOL___EKEventEditViewDelegate.inst_meths;
    uint64_t v60 = *MEMORY[0x1E4F5F0B0];
    uint64_t v55 = *MEMORY[0x1E4F5F078];
    uint64_t v48 = *(void *)v69;
    id v49 = v3;
    uint64_t v47 = *MEMORY[0x1E4F5F010];
    do
    {
      uint64_t v8 = 0;
      do
      {
        long long v59 = v4;
        if (*(void *)v69 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v56 = v8;
        uint64_t v9 = *(void **)(*((void *)&v68 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "type", v46);
        int v11 = [v10 isEqualToString:v6];

        if (v11)
        {
          id v12 = v4;
          if (v4)
          {
            [v4 coreResult];
            [v9 coreResult];
            if (!DDAddressResultCanBeMergedWith()) {
              goto LABEL_51;
            }
          }
          else
          {
            id v12 = v9;
          }
          id v52 = v12;
          id v13 = v9;
          id v65 = v65;
          id v14 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          v51 = v13;
          obuint64_t j = [v13 subResults];
          uint64_t v15 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v62 = 0;
            id v66 = 0;
            uint64_t v17 = *(void *)v73;
            char v18 = &OBJC_PROTOCOL___EKEventEditViewDelegate.inst_meths;
            uint64_t v64 = *(void *)v73;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v73 != v17) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v20 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                objc_msgSend(v20, "coreResult", v46);
                if (v18[93] != (__objc2_meth_list *)-1) {
                  dispatch_once(&_CNPropertyNameForResult_sOnce, &__block_literal_global_6);
                }
                uint64_t Type = DDResultGetType();
                uint64_t v22 = [(__objc2_meth_list *)p_inst_meths[92] objectForKeyedSubscript:Type];
                int v23 = v22;
                if (v22)
                {
                  if ([v22 length])
                  {
                    id v24 = [v65 valueForKey:v23];
                    uint64_t v25 = [v24 length];

                    if (v25)
                    {

                      id v38 = 0;
                      goto LABEL_48;
                    }
                    if (!v66)
                    {
                      id v66 = [v20 valueForKeyPath:@"Location.value"];
                    }
                    int v26 = [v20 type];
                    int v27 = [v20 valueForKeyPath:@"CountryCode.value"];
                    if ([v27 length])
                    {
                      id v28 = v26;
                      if ([v28 isEqualToString:v61])
                      {
                        uint64_t v29 = 4;
                      }
                      else if ([v28 isEqualToString:v58])
                      {
                        uint64_t v29 = 6;
                      }
                      else if ([v28 isEqualToString:v54])
                      {
                        uint64_t v29 = 8;
                      }
                      else
                      {
                        uint64_t v29 = [v28 isEqualToString:v50] ? 10 : 2;
                      }

                      if (v29 > v62)
                      {
                        [v14 setISOCountryCode:v27];
                        uint64_t v62 = v29;
                      }
                    }
                    uint64_t v30 = [v20 matchedString];
                    if (a2 && [v26 isEqualToString:v60])
                    {
                      id v31 = [v20 valueForKey:v55];
                      if (v31)
                      {
                        uint64_t v32 = [v20 range];
                        uint64_t v33 = [v31 range];
                        uint64_t v57 = v34;
                        uint64_t v35 = v33 - v32;
                        uint64_t v36 = (void *)[v30 mutableCopy];
                        uint64_t v37 = v35;
                        char v18 = (__objc2_meth_list **)(&OBJC_PROTOCOL___EKEventEditViewDelegate + 24);
                        objc_msgSend(v36, "replaceCharactersInRange:withString:", v37, v57, &stru_1EF5023D8);

                        uint64_t v30 = v36;
                      }
                    }
                    [v14 setValue:v30 forKey:v23];

                    p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___EKEventEditViewDelegate + 24);
                    uint64_t v17 = v64;
                  }
                }
                else
                {
                  uint64_t v46 = Type;
                  DDLog();
                }
              }
              uint64_t v16 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v66 = 0;
          }

          id v38 = v14;
LABEL_48:

          uint64_t v5 = v48;
          id v3 = v49;
          uint64_t v4 = v52;
          uint64_t v6 = v47;
          if (v38)
          {
            uint64_t v39 = [v65 dictionaryRepresentation];
            uint64_t v40 = (void *)[v39 mutableCopy];

            uint64_t v41 = [v38 dictionaryRepresentation];
            [v40 addEntriesFromDictionary:v41];

            uint64_t v42 = [MEMORY[0x1E4F1BA58] postalAddressWithDictionaryRepresentation:v40];

            id v65 = (id)v42;
          }

          if (v59) {
            goto LABEL_53;
          }
        }
LABEL_51:
        uint64_t v8 = v56 + 1;
      }
      while (v56 + 1 != v53);
      uint64_t v53 = [v3 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v53);
  }
LABEL_53:

  uint64_t v43 = [v65 ISOCountryCode];
  if (!v43)
  {
    uint64_t v43 = (void *)CPPhoneNumberCopyNetworkCountryCode();
    if (!v43) {
      uint64_t v43 = (void *)CPPhoneNumberCopyHomeCountryCode();
    }
    if ((a2 & 1) == 0 && v43) {
      [v65 setISOCountryCode:v43];
    }
  }
  id v44 = v65;

  return v44;
}

id DDMapURLForResult(void *a1)
{
  id v2 = _addressStringForResult(a1);
  if ([v2 length])
  {
    double Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    uint64_t v6 = objc_msgSend(*(id *)(v5 + 3144), "URLForAddress:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
    goto LABEL_11;
  }
  if (!a1 || DDResultGetCategory() != 1) {
    goto LABEL_10;
  }
  uint64_t v7 = (void *)DDResultCopyExtractedURL();
  uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  if (!v8)
  {

LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  char v12 = 0;
  if (!objc_msgSend(v8, "dd_isMaps:isDirections:", 1, &v12) || v12)
  {
    DDMapURLForURL(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v9;
  }
  uint64_t v6 = v10;

LABEL_11:
  return v6;
}

id _addressStringForResult(void *a1)
{
  if (a1)
  {
    CFStringRef Type = (const __CFString *)DDResultGetType();
    CFComparisonResult v3 = CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F010], 0);
    a1 = 0;
    if (v3 == kCFCompareEqualTo)
    {
      a1 = DDResultGetMatchedString();
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

id DDMapURLForURL(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    uint64_t v9 = 0;
    goto LABEL_24;
  }
  CFComparisonResult v3 = [v1 scheme];
  uint64_t v4 = [v3 lowercaseString];
  uint64_t v5 = (void *)[v4 isEqualToString:@"geo"];

  if (!v5)
  {
    gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(v6);
    uint64_t v7 = (void *)[objc_alloc(*(Class *)(v10 + 3152)) initWithURL:v2];
    [v7 parseIncludingCustomParameters:0];
    int v11 = [v7 searchQuery];
    if (v11 || ([v7 addressString], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v12 = [v7 directionsSourceAddressString];
      if (!v12)
      {
        uint64_t v16 = [v7 directionsDestinationAddressString];

        if (v11)
        {

          if (v16) {
            goto LABEL_13;
          }
        }
        else
        {

          if (v16) {
            goto LABEL_13;
          }
        }
        id v8 = v2;
        goto LABEL_4;
      }

      if (v11) {
        id v13 = v11;
      }
      else {
        id v13 = v5;
      }
    }
LABEL_13:
    id v14 = [v7 searchQuery];
    if ([v14 length]) {
      goto LABEL_20;
    }
    uint64_t v15 = [v7 addressString];

    if (![v15 length])
    {
      id v14 = [v7 directionsDestinationAddressString];

      if ([v14 length])
      {
LABEL_20:
        if ([v14 length])
        {
          uint64_t v9 = DDMapURLForString(v14);
        }
        else
        {

          uint64_t v9 = 0;
        }
        goto LABEL_23;
      }
      uint64_t v15 = [v7 directionsSourceAddressString];
    }
    id v14 = v15;
    goto LABEL_20;
  }
  uint64_t v7 = DDMapAddressFromURL(v2);
  DDMapURLForString(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  uint64_t v9 = v8;
LABEL_23:

LABEL_24:
  return v9;
}

id DDMapsURLForUrlAndResult(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!v3 && a2)
  {
    DDMapURLForResult(a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    id v4 = v4;
    uint64_t v5 = v4;
    goto LABEL_8;
  }
  if (!v3) {
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "dd_isMaps:", 1))
  {
    uint64_t v5 = 0;
    if (!DDExtractMapLocationInformationFromURL(v4, 0, 0)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

BOOL DDExtractMapLocationInformationFromURL(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  double v6 = [v5 scheme];
  uint64_t v7 = [v6 lowercaseString];
  int v8 = [v7 isEqualToString:@"geo"];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v10 = DDMapAddressFromURL(v5);
    uint64_t v11 = [v9 queryItemWithName:@"ll" value:v10];
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "dd_isMaps:", 1))
  {
    uint64_t v10 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
    id v13 = [v10 queryItems];
    id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name == %@", @"ll"];
    uint64_t v15 = [v13 filteredArrayUsingPredicate:v14];
    uint64_t v11 = [v15 firstObject];

    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name == %@", @"q"];
    uint64_t v17 = [v13 filteredArrayUsingPredicate:v16];
    uint64_t v12 = [v17 firstObject];

    if (!v12)
    {
      char v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name == %@", @"address"];
      id v19 = [v13 filteredArrayUsingPredicate:v18];
      uint64_t v12 = [v19 firstObject];
    }
LABEL_7:

    if (!a2) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  if (a2) {
LABEL_8:
  }
    *a2 = (id) v11;
LABEL_9:
  if (a3) {
    *a3 = (id) v12;
  }

  return (v11 | v12) != 0;
}

id DDMapURLForString(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"(\\s|\\n)+", @" ", 1024, 0, objc_msgSend(v1, "length"));

  if ([v2 length])
  {
    double Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    double v6 = objc_msgSend(*(id *)(v5 + 3144), "URLForAddress:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

id DDDirectionsURLForResult(void *a1)
{
  id v2 = _addressStringForResult(a1);
  if ([v2 length])
  {
    double Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    double v6 = objc_msgSend(*(id *)(v5 + 3144), "URLForDirectionsFromHereTo:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
    goto LABEL_11;
  }
  if (!a1 || DDResultGetCategory() != 1) {
    goto LABEL_10;
  }
  uint64_t v7 = (void *)DDResultCopyExtractedURL();
  int v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  if (!v8)
  {

LABEL_10:
    double v6 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  char v12 = 0;
  if (objc_msgSend(v8, "dd_isMaps:isDirections:", 1, &v12) && v12)
  {
    id v10 = v9;
  }
  else
  {
    DDMapURLForURL(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v6 = v10;

LABEL_11:
  return v6;
}

id DDDirectionsURLForString(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"(\\s|\\n)+", @" ", 1024, 0, objc_msgSend(v1, "length"));

  if ([v2 length])
  {
    double Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    double v6 = objc_msgSend(*(id *)(v5 + 3144), "URLForDirectionsFromHereTo:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

id DDMapAddressFromURL(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    uint64_t v11 = 0;
    goto LABEL_25;
  }
  double v3 = [v1 scheme];
  id v4 = [v3 lowercaseString];
  int v5 = [v4 isEqualToString:@"geo"];

  if (!v5)
  {
    gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(v6);
    uint64_t v7 = (void *)[objc_alloc(*(Class *)(v12 + 3152)) initWithURL:v2];
    [v7 parseIncludingCustomParameters:0];
    uint64_t v11 = [v7 addressString];
    if (![v11 length])
    {
      id v13 = [v7 directionsDestinationAddressString];

      if ([v13 length])
      {
        uint64_t v11 = v13;
      }
      else
      {
        uint64_t v11 = [v7 searchQuery];
      }
    }
    if ([v11 length]) {
      goto LABEL_24;
    }
    id v24 = 0;
    id v25 = 0;
    BOOL v14 = DDExtractMapLocationInformationFromURL(v2, &v25, &v24);
    id v10 = v25;
    id v15 = v24;
    uint64_t v16 = v15;
    if (v14)
    {
      uint64_t v17 = [v15 value];
      uint64_t v18 = [v17 length];

      id v19 = v16;
      if (v18
        || ([v10 value],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v21 = [v20 length],
            v20,
            id v19 = v10,
            v21))
      {
        uint64_t v22 = [v19 value];

        uint64_t v11 = (void *)v22;
      }
    }

    goto LABEL_23;
  }
  uint64_t v7 = [v2 resourceSpecifier];
  if ([v7 hasPrefix:@"//"])
  {
    if ((unint64_t)[v7 length] < 3) {
      goto LABEL_15;
    }
    uint64_t v8 = [v7 substringFromIndex:2];

    uint64_t v7 = (void *)v8;
  }
  if ([v7 hasPrefix:@"?"])
  {
    if ((unint64_t)[v7 length] < 2) {
      goto LABEL_15;
    }
    uint64_t v9 = [v7 substringFromIndex:1];

    uint64_t v7 = (void *)v9;
  }
  if ([v7 length])
  {
    id v10 = [v7 componentsSeparatedByString:@";"];
    uint64_t v11 = [v10 firstObject];
LABEL_23:

    goto LABEL_24;
  }
LABEL_15:
  uint64_t v11 = 0;
LABEL_24:

LABEL_25:
  return v11;
}

id DDDirectionsURLForURL(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    uint64_t v9 = 0;
    goto LABEL_19;
  }
  double v3 = [v1 scheme];
  id v4 = [v3 lowercaseString];
  int v5 = [v4 isEqualToString:@"geo"];

  if (!v5)
  {
    gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(v6);
    uint64_t v7 = (void *)[objc_alloc(*(Class *)(v10 + 3152)) initWithURL:v2];
    [v7 parseIncludingCustomParameters:0];
    uint64_t v11 = [v7 searchQuery];
    if (v11 || ([v7 addressString], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      goto LABEL_9;
    }
    BOOL v14 = [v7 directionsSourceAddressString];
    if (v14)
    {
    }
    else
    {
      uint64_t v16 = [v7 directionsDestinationAddressString];

      if (!v16)
      {
LABEL_9:
        uint64_t v12 = [v7 directionsDestinationAddressString];
        if ([v12 length]) {
          goto LABEL_15;
        }
        id v13 = [v7 addressString];

        if (![v13 length])
        {
          uint64_t v12 = [v7 directionsSourceAddressString];

          if ([v12 length])
          {
LABEL_15:
            if ([v12 length])
            {
              uint64_t v9 = DDDirectionsURLForString(v12);
            }
            else
            {

              uint64_t v9 = 0;
            }
            goto LABEL_18;
          }
          [v7 centerCoordinate];
          if (v17 == -180.0 || ([v7 centerCoordinate], v18 == -180.0))
          {
            uint64_t v23 = [v7 searchQuery];
          }
          else
          {
            id v19 = NSString;
            [v7 centerCoordinate];
            uint64_t v21 = v20;
            [v7 centerCoordinate];
            uint64_t v23 = objc_msgSend(v19, "stringWithFormat:", @"%f,%f", v21, v22);
          }
          id v13 = (void *)v23;
        }
        uint64_t v12 = v13;
        goto LABEL_15;
      }
    }
    id v8 = v2;
    goto LABEL_4;
  }
  uint64_t v7 = DDMapAddressFromURL(v2);
  DDDirectionsURLForString(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  uint64_t v9 = v8;
LABEL_18:

LABEL_19:
  return v9;
}

void *DDCreateUpdatedResultWithContext(void *Copy, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (Copy)
  {
    if (DDResultHasType())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v4 = copyAssociatedResultsFromResultWithContext(Copy, v3, 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v25;
        while (2)
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v25 != v7) {
              objc_enumerationMutation(v4);
            }
            if (DDResultHasType())
            {
              uint64_t Range = DDResultGetRange();
              uint64_t v11 = v10;
              uint64_t v12 = DDResultGetRange();
              if ((unint64_t)(v12 - (Range + v11)) < 0x32 || (unint64_t)(Range - v12 + v13) <= 0x31)
              {
                if (DDAddressResultCanBeMergedWith())
                {
                  uint64_t Copy = (void *)DDResultCreateCopy();
                  if (Copy)
                  {
                    CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults();
                    if (SubResults)
                    {
                      CFArrayRef v15 = SubResults;
                      CFIndex Count = CFArrayGetCount(SubResults);
                      if (Count >= 1)
                      {
                        CFIndex v17 = Count;
                        for (CFIndex i = 0; i != v17; ++i)
                        {
                          CFArrayGetValueAtIndex(v15, i);
                          DDResultAddSubresultSorted();
                        }
                      }
                      uint64_t MatchedString = DDResultGetMatchedString();
                      uint64_t v20 = DDResultGetMatchedString();
                      CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%@, %@", MatchedString, v20, (void)v24);
                      if (v21)
                      {
                        CFStringRef v22 = v21;
                        DDResultSetMatchedString();
                        CFRelease(v22);
                      }
                      goto LABEL_24;
                    }
                    CFRelease(Copy);
                  }
                }
              }
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      uint64_t Copy = 0;
LABEL_24:
    }
    else
    {
      uint64_t Copy = 0;
    }
  }

  return Copy;
}

void *copyAssociatedResultsFromResultWithContext(void *a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 objectForKey:@"GroupAllResultsKey"];
    if (v7)
    {
      uint64_t v8 = v7;
      if ([v7 count])
      {
        uint64_t v9 = [v8 sortedArrayUsingFunction:_DDScannerResultProximitySort context:a1];
        if (!a3)
        {
LABEL_6:
          a1 = copyCoreResultsArray(v9);

          goto LABEL_22;
        }
      }
      else
      {
        CFArrayRef v15 = [MEMORY[0x1E4F5F150] resultFromCoreResult:a1];
        v29[0] = v15;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

        if (!a3) {
          goto LABEL_6;
        }
      }
      *a3 = v9;
      goto LABEL_6;
    }
    uint64_t v10 = [v6 objectForKey:@"AllResults"];
    if (!v10)
    {
      uint64_t v16 = [v6 objectForKey:@"TextStorage"];
      if (v16)
      {
        uint64_t v10 = (void *)v16;
        CFIndex v17 = [MEMORY[0x1E4F28B50] mainBundle];
        double v18 = [v17 bundleIdentifier];
        if ([v18 isEqualToString:@"com.apple.MobileSMS"]) {
          uint64_t v19 = 2000;
        }
        else {
          uint64_t v19 = 50;
        }

        unint64_t RangeForURLification = DDResultGetRangeForURLification();
        uint64_t v22 = v21;
        uint64_t v23 = [v6 objectForKeyedSubscript:@"ReferenceDate"];
        long long v24 = findNearbyResultsInTextStorage(v10, RangeForURLification, v22, v19, 4 * v19, v23);
        a1 = (void *)CFRetain(v24);

LABEL_21:
        goto LABEL_22;
      }
      id v28 = a1;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      if (!v10)
      {
        a1 = 0;
        goto LABEL_22;
      }
    }
    uint64_t v11 = [v10 count];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      while (1)
      {
        BOOL v14 = [v10 objectAtIndex:v13];

        if (v14 == a1) {
          break;
        }
        if (v12 == ++v13) {
          goto LABEL_12;
        }
      }
      long long v25 = [v6 objectForKeyedSubscript:@"ReferenceDate"];
      long long v26 = findNearbyResultsInArray(v10, v13, 50, 200, v25);
      a1 = (void *)CFRetain(v26);
    }
    else
    {
LABEL_12:
      a1 = 0;
    }
    goto LABEL_21;
  }
LABEL_22:

  return a1;
}

uint64_t DDUIRecordOtherActionInSheetForResultIfNeeded(uint64_t result)
{
  if (result)
  {
    uint64_t result = DDResultGetCategory();
    int v5 = 0;
    if (result == 4)
    {
      uint64_t result = DDTrackEventCreationInHostApplication(&v5);
      if (result)
      {
        if (v5 == 1) {
          uint64_t v1 = 2;
        }
        else {
          uint64_t v1 = 3;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          DDUIRecordOtherActionInSheetForResultIfNeeded_cold_1();
        }
        double Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics = gotLoadHelper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics(v2);
        return objc_msgSend(*(id *)(v4 + 2744), "recordUserInteraction:withLinkInApplication:eventPrefillMode:eventTypeClassification:proposedEvent:confirmedEvent:", 2, v1, 0, 0, 0, 0, Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics);
      }
    }
  }
  return result;
}

void *copyCoreResultsArray(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    double v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count"));
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "coreResult", (void)v9));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

uint64_t _DDScannerResultProximitySort(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [a1 coreResult];
  uint64_t v7 = [v5 coreResult];

  return MEMORY[0x1F41172B8](v6, v7, a3);
}

id _eventTitleFromCache(void *a1)
{
  id v1 = a1;
  double v2 = [v1 objectForKeyedSubscript:@"event"];
  id v3 = [v2 title];
  if (v3
    || ([v1 objectForKeyedSubscript:@"icsEvent"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 summary],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    id v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v6 = [v3 componentsSeparatedByCharactersInSet:v5];
    uint64_t v7 = [v6 firstObject];
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    long long v9 = [v7 stringByTrimmingCharactersInSet:v8];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

id _eventStartDateFromCache(void *a1)
{
  id v1 = a1;
  double v2 = [v1 objectForKeyedSubscript:@"event"];
  id v3 = [v2 startDate];
  if (!v3)
  {
    uint64_t v4 = [v1 objectForKeyedSubscript:@"icsEvent"];
    id v5 = [v4 dtstart];
    uint64_t v6 = [v5 components];

    if (v6)
    {
      uint64_t v7 = [v6 calendar];
      uint64_t v8 = v7;
      if (!v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      }
      id v3 = [v8 dateFromComponents:v6];
      if (!v7) {
    }
      }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

void sub_1A1740860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v13 - 120));
  _Unwind_Resume(a1);
}

void sub_1A1741B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location)
{
}

id selectDefaultAction(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 || !v4 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), uint64_t v7 = v5, (isKindOfClass & 1) != 0)) {
    uint64_t v7 = v3;
  }
  id v8 = v7;

  return v8;
}

void sub_1A1742C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A17443C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
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

id DDUIAugmentedContextForEvent(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (![v5 count])
  {
    id v13 = v6;
    goto LABEL_29;
  }
  id v8 = _DDUIEventGetComponents(v5, v6, v7);
  long long v9 = v8;
  char v27 = 1;
  if (v8)
  {
    long long v10 = [v8 title];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      long long v12 = [v9 title];
    }
    else
    {
      long long v12 = 0;
    }
    double v18 = [v9 startDate];

    if (v18)
    {
      char v27 = 0;
      uint64_t v14 = [v9 startDate];
      uint64_t v17 = [v9 endDate];
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v19 = [v9 startDate];
    if (!v19)
    {
      [v9 duration];
      if (v20 > 0.0)
      {
        if (!v18) {
          goto LABEL_17;
        }
        [v9 duration];
        objc_msgSend(v14, "dateByAddingTimeInterval:");
        v17 = uint64_t v19 = (void *)v17;
      }
    }

LABEL_17:
    unint64_t v21 = [v9 source] - 1;
    if (v21 > 3) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = qword_1A175CB48[v21];
    }
    uint64_t v22 = (void *)[v6 mutableCopy];
    id v13 = v22;
    if (v14)
    {
      [v22 setObject:v14 forKey:@"EventStartDate"];
      if (!v17) {
        goto LABEL_25;
      }
    }
    else if (!v17)
    {
      uint64_t v23 = 0;
      if (!v12) {
        goto LABEL_28;
      }
      goto LABEL_26;
    }
    [v13 setObject:v17 forKey:@"EventEndDate"];
    goto LABEL_25;
  }
  uint64_t v14 = beginDateOfEventResultsRespectingSpecificEndDates(v5, 1, v6, &v27, 0);
  CFArrayRef v15 = (void *)[v6 mutableCopy];
  id v13 = v15;
  if (!v14)
  {
    long long v12 = 0;
    uint64_t v23 = 0;
    uint64_t v16 = 0;
    goto LABEL_28;
  }
  [v15 setObject:v14 forKey:@"EventStartDate"];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  long long v12 = 0;
LABEL_25:
  uint64_t v23 = v14;
  long long v24 = [MEMORY[0x1E4F28ED0] numberWithBool:v27 != 0];
  [v13 setObject:v24 forKey:@"EventIsAllDay"];

  uint64_t v14 = (void *)v17;
  if (v12) {
LABEL_26:
  }
    [v13 setObject:v12 forKey:@"EventTitle"];
LABEL_28:
  long long v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v16];
  [v13 setObject:v25 forKey:@"PrefillMode"];

LABEL_29:
  return v13;
}

id _DDUIEventGetComponents(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = objc_alloc_init(DDActionSuggestionsContext);
  long long v9 = [v6 objectForKey:@"CoreSpotlightUniqueIdentifier"];
  [(DDActionSuggestionsContext *)v8 setCoreSpotlightUniqueIdentifier:v9];

  [(DDActionSuggestionsContext *)v8 setBundleIdentifier:v5];
  long long v10 = objc_alloc_init(DDActionNaturalLanguageContext);
  uint64_t v11 = [v6 objectForKey:@"LeadingText"];
  [(DDActionNaturalLanguageContext *)v10 setLeadingText:v11];

  long long v12 = [v6 objectForKey:@"TrailingText"];
  [(DDActionNaturalLanguageContext *)v10 setTrailingText:v12];

  id v13 = [v7 firstObject];
  [(DDActionNaturalLanguageContext *)v10 setResult:v13];

  [(DDActionNaturalLanguageContext *)v10 setAssociatedResults:v7];
  [(DDActionNaturalLanguageContext *)v10 setBundleIdentifier:v5];

  uint64_t v14 = [v7 firstObject];

  CFArrayRef v15 = +[DDEventComponents bestEventComponentsForResult:v14 withNaturalLanguageContext:v10 suggestionsContext:v8 context:v6];

  return v15;
}

id DDUISuggestedEventForResults(void *a1, void *a2, void *a3, void *a4, uint64_t *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  if (![v12 count])
  {
    uint64_t v16 = 0;
    goto LABEL_40;
  }
  CFArrayRef v15 = _DDUIEventGetComponents(v12, v13, v14);
  if (v15)
  {
    uint64_t v43 = a6;
    uint64_t v16 = [MEMORY[0x1E4F25538] eventWithEventStore:v11];
    uint64_t v17 = [v15 title];
    if (v17)
    {
      double v18 = (void *)v17;
      uint64_t v19 = [v15 title];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        unint64_t v21 = [v15 title];
        [v16 setTitle:v21];
      }
    }
    uint64_t v22 = [v15 notes];
    if (v22)
    {
      uint64_t v23 = (void *)v22;
      long long v24 = [v15 notes];
      uint64_t v25 = [v24 length];

      if (v25)
      {
        long long v26 = [v15 notes];
        [v16 setNotes:v26];
      }
    }
    char v27 = [v15 URL];

    if (v27)
    {
      id v28 = [v15 URL];
      [v16 setURL:v28];
    }
    uint64_t v29 = [v15 location];

    if (v29)
    {
      uint64_t v30 = [v15 location];
      [v16 setLocation:v30];
    }
    id v31 = [v15 structuredLocation];

    if (v31)
    {
      uint64_t v32 = [v15 structuredLocation];
      [v16 setStructuredLocation:v32];
    }
    uint64_t v33 = [v15 startDate];

    if (v33)
    {
      [v16 setAllDay:0];
      uint64_t v34 = [v15 startDate];
      [v16 setStartDate:v34];

      uint64_t v35 = [v15 endDate];
      [v16 setEndDate:v35];
    }
    uint64_t v36 = [v15 startDate];
    if (!v36)
    {
      [v15 duration];
      if (v37 > 0.0)
      {
        if ([v16 isAllDay]) {
          goto LABEL_22;
        }
        uint64_t v36 = [v16 startDate];
        [v15 duration];
        id v38 = objc_msgSend(v36, "dateByAddingTimeInterval:");
        [v16 setEndDate:v38];
      }
    }

LABEL_22:
    if ([v15 source] == 1)
    {
      uint64_t v39 = v43;
      if (!a5) {
        goto LABEL_37;
      }
      uint64_t v40 = 2;
    }
    else
    {
      uint64_t v39 = v43;
      if ([v15 source] == 2)
      {
        if (!a5) {
          goto LABEL_37;
        }
        uint64_t v40 = 1;
      }
      else if ([v15 source] == 3)
      {
        if (!a5) {
          goto LABEL_37;
        }
        uint64_t v40 = 4;
      }
      else
      {
        uint64_t v41 = [v15 source];
        if (!a5 || v41 != 4)
        {
LABEL_37:
          if (v39)
          {
            *uint64_t v39 = [v15 eventTypeIdentifier];
          }
          goto LABEL_39;
        }
        uint64_t v40 = 3;
      }
    }
    *a5 = v40;
    goto LABEL_37;
  }
  uint64_t v16 = 0;
LABEL_39:

LABEL_40:
  return v16;
}

id DDUIEventForResults(void *a1, void *a2, void *a3)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v60 = [v7 objectForKeyedSubscript:@"ICS"];
  if (!v60) {
    goto LABEL_6;
  }
  id v8 = [v7 objectForKeyedSubscript:@"NotificationStyle"];
  if ([v8 BOOLValue])
  {

    goto LABEL_5;
  }
  long long v9 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v10 = [v9 bundleIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.BarcodeSupport.BarcodeNotificationService"];

  if (!v11)
  {
LABEL_6:
    id v14 = [MEMORY[0x1E4F25538] eventWithEventStore:v5];
    if (v14 && [v6 count])
    {
      LOBYTE(cf) = 0;
      id v80 = 0;
      CFArrayRef v15 = beginDateOfEventResultsRespectingSpecificEndDates(v6, 1, v7, &cf, &v80);
      id v16 = v80;
      if (!v16)
      {
        id v16 = [v15 dateByAddingTimeInterval:3600.0];
      }
      [v14 setStartDate:v15];
      [v14 setEndDate:v16];
      [v14 setAllDay:(_BYTE)cf != 0];
    }
    goto LABEL_11;
  }
LABEL_5:
  id v12 = [v60 dataUsingEncoding:4];
  id v13 = [v5 importICSData:v12 intoCalendar:0 options:0];
  id v14 = [v13 firstObject];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_11:
  uint64_t v17 = [v7 objectForKey:@"EventTitle"];
  double v18 = [v14 title];
  if ([v18 length])
  {
  }
  else
  {
    uint64_t v19 = [v17 length];

    if (v19) {
      [v14 setTitle:v17];
    }
  }
  if ([v6 count])
  {
    uint64_t v20 = [v6 objectAtIndex:0];
    unint64_t v21 = [v6 sortedArrayUsingFunction:MEMORY[0x1E4F5F120] context:v20];
  }
  else
  {
    unint64_t v21 = 0;
  }
  uint64_t v58 = v6;
  uint64_t v22 = [v14 URL];

  long long v59 = v5;
  uint64_t v61 = v7;
  uint64_t v57 = v17;
  if (v22)
  {
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v24 = [v7 objectForKey:@"SpecialURL"];
    if (v24)
    {
      uint64_t v25 = (void *)v24;
      [v14 setURL:v24];
    }
    else
    {
      uint64_t v62 = v14;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v55 = v21;
      id v26 = v21;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v76 objects:v83 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v25 = 0;
        uint64_t v29 = *(void *)v77;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v77 != v29) {
              objc_enumerationMutation(v26);
            }
            if ((DDResultHasType() & 1) != 0 || (DDResultHasType() & 1) != 0 || DDResultHasType())
            {
              id v31 = (void *)DDResultCopyExtractedURLWithOptions();
              if (v31)
              {
                uint64_t v32 = [MEMORY[0x1E4F1CB10] URLWithString:v31];

                if (v32)
                {
                  uint64_t v33 = [v32 scheme];
                  uint64_t v34 = [v33 lowercaseString];

                  if (([v34 isEqualToString:@"http"] & 1) != 0
                    || ([v34 isEqualToString:@"tel"] & 1) != 0
                    || ([v34 isEqualToString:@"sip"] & 1) != 0
                    || ([v34 hasPrefix:@"facetime"] & 1) != 0)
                  {
                    [v62 setURL:v32];

                    uint64_t v25 = v32;
                    goto LABEL_44;
                  }
                }
              }
              else
              {
                uint64_t v32 = v25;
              }

              uint64_t v25 = v32;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v76 objects:v83 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v25 = 0;
      }
LABEL_44:

      id v14 = v62;
      unint64_t v21 = v55;
    }
    uint64_t v35 = [v14 URL];

    if (v35)
    {
      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v63 = v14;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v36 = v21;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v72 objects:v82 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v56 = v21;
        uint64_t v39 = *(void *)v73;
        while (2)
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v73 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v23 = *(void *)(*((void *)&v72 + 1) + 8 * j);
            if (DDResultHasType())
            {
              CFTypeRef v70 = 0;
              CFTypeRef cf = 0;
              DDResultCopyPhoneValue();
              if (cf)
              {
                if (([(id)cf containsString:@","] & 1) != 0
                  || [(id)cf containsString:@";"])
                {
                  uint64_t v41 = (void *)DDResultCopyExtractedURLWithOptions();
                  if (v41)
                  {
                    uint64_t v42 = [MEMORY[0x1E4F1CB10] URLWithString:v41];

                    if (v42)
                    {
                      [v63 setURL:v42];

                      uint64_t v25 = (void *)v42;
                      goto LABEL_66;
                    }
                    uint64_t v25 = 0;
                  }
                }
                if (cf) {
                  CFRelease(cf);
                }
              }
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v72 objects:v82 count:16];
          if (v38) {
            continue;
          }
          break;
        }
        uint64_t v23 = 0;
LABEL_66:
        unint64_t v21 = v56;
      }
      else
      {
        uint64_t v23 = 0;
      }

      id v14 = v63;
    }
  }
  uint64_t v64 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v43 = v21;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v81 count:16];
  if (!v44) {
    goto LABEL_85;
  }
  uint64_t v45 = v44;
  uint64_t v46 = *(void *)v67;
  CFStringRef theString2 = (const __CFString *)*MEMORY[0x1E4F5F010];
  do
  {
    for (uint64_t k = 0; k != v45; ++k)
    {
      if (*(void *)v67 != v46) {
        objc_enumerationMutation(v43);
      }
      if (*(void *)(*((void *)&v66 + 1) + 8 * k) != v23)
      {
        uint64_t v48 = v14;
        id v49 = [v14 location];
        if ([v49 length])
        {
        }
        else
        {
          CFStringRef Type = (const __CFString *)DDResultGetType();
          CFComparisonResult v51 = CFStringCompare(Type, theString2, 0);

          if (v51 == kCFCompareEqualTo)
          {
            id v14 = v48;
            [v48 setLocation:DDResultGetMatchedString()];
            continue;
          }
        }
        id v14 = v48;
        if (DDResultHasType())
        {
          CFTypeRef cf = 0;
          DDResultCopyPhoneValue();
          if (cf)
          {
            objc_msgSend(v64, "addObject:");
            CFRelease(cf);
          }
        }
      }
    }
    uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v81 count:16];
  }
  while (v45);
LABEL_85:

  id v52 = [v61 objectForKey:@"SelectedText"];
  if (v52) {
    [v64 addObject:v52];
  }
  uint64_t v53 = [v14 notes];
  if (v53)
  {
LABEL_90:
  }
  else if ([v64 count])
  {
    uint64_t v53 = [v64 componentsJoinedByString:@"\n"];
    [v14 setNotes:v53];
    goto LABEL_90;
  }

  return v14;
}

BOOL _DDUICalendarIsTitleGenerationUsed(void *a1)
{
  id v1 = [a1 objectForKey:@"PrefillMode"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return (unint64_t)(v2 - 3) < 2;
}

void sub_1A1749498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1A1749C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
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

id linkAncestorOfNode(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v2 = [v1 parentNode];

      id v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

void sub_1A174F0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1A175039C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A17506BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A1751D14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void applicationWithBundleIdentifierIsRestricted_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Application proxy for bundle identifier %@ is nil (errors %@ -- %@).", (uint8_t *)&v3, 0x20u);
}

void DDUILogAssertionFailure_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void DDUILogAssertionFailure_cold_2()
{
  *(_WORD *)char v0 = 0;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to load CrashReporterSupport framework.", v0, 2u);
}

void DDPhoneLabeledValue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void DDPhoneLabeledValue_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void DDMergeContactIntoContact_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unknown key: %@", buf, 0xCu);
}

void DDAugmentContactWithResultsFromAction_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void DDUIRecordOtherActionInSheetForResultIfNeeded_cold_1()
{
  *(_WORD *)char v0 = 0;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Will record user interaction OtherActionInSheet. #DDUINLEventMetrics", v0, 2u);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86E8]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1F4109368]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x1F4109378]();
}

uint64_t DDAddressResultCanBeMergedWith()
{
  return MEMORY[0x1F4117148]();
}

uint64_t DDInternalURLStringForResultIdentifier()
{
  return MEMORY[0x1F4117160]();
}

uint64_t DDLog()
{
  return MEMORY[0x1F4117168]();
}

uint64_t DDResultAddSubresult()
{
  return MEMORY[0x1F4117170]();
}

uint64_t DDResultAddSubresultSorted()
{
  return MEMORY[0x1F4117178]();
}

uint64_t DDResultCopyAuthCode()
{
  return MEMORY[0x1F4117180]();
}

uint64_t DDResultCopyExtractedDateFromReferenceDate()
{
  return MEMORY[0x1F4117188]();
}

uint64_t DDResultCopyExtractedStartDateEndDate()
{
  return MEMORY[0x1F4117198]();
}

uint64_t DDResultCopyExtractedURL()
{
  return MEMORY[0x1F41171A8]();
}

uint64_t DDResultCopyExtractedURLWithOptions()
{
  return MEMORY[0x1F41171B0]();
}

uint64_t DDResultCopyMailValue()
{
  return MEMORY[0x1F41171C8]();
}

uint64_t DDResultCopyPhoneValue()
{
  return MEMORY[0x1F41171D0]();
}

uint64_t DDResultCopyUPIIdentifierValue()
{
  return MEMORY[0x1F41171D8]();
}

uint64_t DDResultCreate()
{
  return MEMORY[0x1F41171E0]();
}

uint64_t DDResultCreateCopy()
{
  return MEMORY[0x1F41171E8]();
}

uint64_t DDResultCreateFromDateTimeResults()
{
  return MEMORY[0x1F41171F0]();
}

uint64_t DDResultCurrencyExtraction()
{
  return MEMORY[0x1F41171F8]();
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x1F4117208]();
}

uint64_t DDResultGetCountryCode()
{
  return MEMORY[0x1F4117210]();
}

uint64_t DDResultGetMatchedString()
{
  return MEMORY[0x1F4117218]();
}

uint64_t DDResultGetParsecDomain()
{
  return MEMORY[0x1F4117220]();
}

uint64_t DDResultGetParsecRawDomain()
{
  return MEMORY[0x1F4117228]();
}

uint64_t DDResultGetQueryRange()
{
  return MEMORY[0x1F4117238]();
}

uint64_t DDResultGetQueryRangeForURLification()
{
  return MEMORY[0x1F4117240]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x1F4117248]();
}

uint64_t DDResultGetRangeForURLification()
{
  return MEMORY[0x1F4117250]();
}

uint64_t DDResultGetShipmentTrackingUrlString()
{
  return MEMORY[0x1F4117258]();
}

uint64_t DDResultGetSignatureContainingResult()
{
  return MEMORY[0x1F4117260]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x1F4117268]();
}

uint64_t DDResultGetSubresultWithType()
{
  return MEMORY[0x1F4117270]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x1F4117278]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x1F4117280]();
}

uint64_t DDResultHasProperties()
{
  return MEMORY[0x1F4117288]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x1F4117290]();
}

uint64_t DDResultIsPartialDateRangeOrTimeRange()
{
  return MEMORY[0x1F4117298]();
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x1F41172A0]();
}

uint64_t DDResultPhysicalUnitsExtraction()
{
  return MEMORY[0x1F41172B0]();
}

uint64_t DDResultSetMatchedString()
{
  return MEMORY[0x1F41172C0]();
}

uint64_t DDResultSetType()
{
  return MEMORY[0x1F41172C8]();
}

uint64_t DDResultTimeIsApprox()
{
  return MEMORY[0x1F41172D0]();
}

uint64_t DDResultTypesAreEqual()
{
  return MEMORY[0x1F41172D8]();
}

uint64_t DDScanQueryAddLineBreak()
{
  return MEMORY[0x1F41172E0]();
}

uint64_t DDScanQueryAddSeparator()
{
  return MEMORY[0x1F41172E8]();
}

uint64_t DDScanQueryAddTextFragment()
{
  return MEMORY[0x1F41172F0]();
}

uint64_t DDScanQueryCreate()
{
  return MEMORY[0x1F41172F8]();
}

uint64_t DDScanQueryCreateFromString()
{
  return MEMORY[0x1F4117300]();
}

uint64_t DDScanQueryGetFragmentMetaData()
{
  return MEMORY[0x1F4117308]();
}

uint64_t DDScanQueryGetNumberOfFragments()
{
  return MEMORY[0x1F4117310]();
}

uint64_t DDScannerServiceScanQuerySyncWithOptionsAndQOS()
{
  return MEMORY[0x1F4117360]();
}

uint64_t DDScannerShouldKeepParsecScoresBelowThreshold()
{
  return MEMORY[0x1F4117380]();
}

uint64_t DDShouldImmediatelyShowActionSheetForResult()
{
  return MEMORY[0x1F4117388]();
}

uint64_t DDShouldImmediatelyShowActionSheetForURL()
{
  return MEMORY[0x1F4117390]();
}

uint64_t DDShouldUseDebugHighlightForResult()
{
  return MEMORY[0x1F4117398]();
}

uint64_t DDShouldUseLightLinksForResult()
{
  return MEMORY[0x1F41173A0]();
}

uint64_t DDURLStringForResult()
{
  return MEMORY[0x1F41173A8]();
}

uint64_t DDURLTapAndHoldSchemes()
{
  return MEMORY[0x1F41173B0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
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

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x1F4163A30]();
}

uint64_t TUUnformattedPhoneNumber()
{
  return MEMORY[0x1F4163AE8]();
}

uint64_t WebThreadIsEnabled()
{
  return MEMORY[0x1F4103EC8]();
}

uint64_t WebThreadRun()
{
  return MEMORY[0x1F4103ED8]();
}

uint64_t _AXSSoftwareTTYEnabled()
{
  return MEMORY[0x1F4179030]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4102EB8]();
}

uint64_t _UISystemFontName()
{
  return MEMORY[0x1F4102F98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
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

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1F417F6F8](*(void *)&c);
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x1F417F7C8](*(void *)&c);
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1F4180050](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

int32_t uidna_nameToUnicodeUTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1F4180060](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1F4180068](*(void *)&options, pErrorCode);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

uint64_t SBSRequestPasscodeUnlockUI_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SpringBoardServices)) {
    dlopenHelper_SpringBoardServices(a1);
  }
  return MEMORY[0x1F415C408]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GeoServices(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SpringBoardServices(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_StoreKit(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreSpotlight(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_iCalendar(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SearchUI(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_FlightUtilities(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_MessageUI(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SearchFoundation(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppProtectionUI(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_BusinessChatService(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_DataDetectorsNaturalLanguage(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_ContactsUI(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppProtection(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_NewsServices(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_IconServices(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CalendarUIKit(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreSuggestions(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreParsec(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_BusinessChat(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreLocation(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___BCError(double result)
{
  if (!atomic_load(&dlopenHelperFlag_BusinessChat)) {
    return dlopenHelper_BusinessChat(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APApplication(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AppProtection)) {
    return dlopenHelper_AppProtection(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___ISIcon(double result)
{
  if (!atomic_load(&dlopenHelperFlag_IconServices)) {
    return dlopenHelper_IconServices(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___ISImageDescriptor(double result)
{
  if (!atomic_load(&dlopenHelperFlag_IconServices)) {
    return dlopenHelper_IconServices(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APBaseExtensionShieldView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AppProtectionUI)) {
    return dlopenHelper_AppProtectionUI(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APGuard(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AppProtection)) {
    return dlopenHelper_AppProtection(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CUIKOccurrencesCollection(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CalendarUIKit)) {
    return dlopenHelper_CalendarUIKit(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___BCSBusinessQueryService(double result)
{
  if (!atomic_load(&dlopenHelperFlag_BusinessChatService)) {
    return dlopenHelper_BusinessChatService(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage)) {
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CSSearchableItemAttributeSet(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSpotlight)) {
    return dlopenHelper_CoreSpotlight(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CSSearchableItem(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSpotlight)) {
    return dlopenHelper_CoreSpotlight(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SGSuggestionsService(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSuggestions)) {
    return dlopenHelper_CoreSuggestions(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CLLocation(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CoreLocation)) {
    return dlopenHelper_CoreLocation(result);
  }
  return result;
}

double gotLoadHelper_x8__IPMessageTypeEmail(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage)) {
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x9__IPMessageTypeShortMessage(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage)) {
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___IPMessage(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage)) {
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___IPMessageUnit(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage)) {
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___FUFlightViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FlightUtilities)) {
    return dlopenHelper_FlightUtilities(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SKStoreProductViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_StoreKit)) {
    return dlopenHelper_StoreKit(result);
  }
  return result;
}

double gotLoadHelper_x8__SKStoreProductParameterITunesItemIdentifier(double result)
{
  if (!atomic_load(&dlopenHelperFlag_StoreKit)) {
    return dlopenHelper_StoreKit(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NewsServices)) {
    return dlopenHelper_NewsServices(result);
  }
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___NSSNewsViewController(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_NewsServices)) {
    dlopenHelper_NewsServices(a1);
  }
}

double gotLoadHelper_x8__OBJC_CLASS___SFResultSection(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SearchFoundation)) {
    return dlopenHelper_SearchFoundation(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SearchUIMediaPlayerViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SearchUI)) {
    return dlopenHelper_SearchUI(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CNContactContentViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_ContactsUI)) {
    return dlopenHelper_ContactsUI(result);
  }
  return result;
}

double gotLoadHelper_x8__kPARLookupClient(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreParsec)) {
    return dlopenHelper_CoreParsec(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PARSessionConfiguration(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreParsec)) {
    return dlopenHelper_CoreParsec(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PARSession(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreParsec)) {
    return dlopenHelper_CoreParsec(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SFLookupHintRelevancyFeedback(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SearchFoundation)) {
    return dlopenHelper_SearchFoundation(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GeoServices)) {
    return dlopenHelper_GeoServices(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GeoServices)) {
    return dlopenHelper_GeoServices(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSuggestions)) {
    return dlopenHelper_CoreSuggestions(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___ICSDocument(double result)
{
  if (!atomic_load(&dlopenHelperFlag_iCalendar)) {
    return dlopenHelper_iCalendar(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___MFMessageComposeViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MessageUI)) {
    return dlopenHelper_MessageUI(result);
  }
  return result;
}