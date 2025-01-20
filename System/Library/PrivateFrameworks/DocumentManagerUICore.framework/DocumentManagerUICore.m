void sub_222E2F69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_222E2FDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 48), 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_222E301B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E3023C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_222E30370(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E30B5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E30C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_222E31114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_222E311F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E3172C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E3283C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E32934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E329C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E32A98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E32C94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E32D34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E34238(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v4 - 152), 8);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

DOCThumbnailFittingImageView *DOCNewThumbnailFittingImageView(void *a1, double a2, double a3)
{
  id v5 = a1;
  v6 = -[DOCThumbnailFittingImageView initWithSize:url:]([DOCThumbnailFittingImageView alloc], "initWithSize:url:", v5, a2, a3);

  return v6;
}

void sub_222E35EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E35FD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222E36050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_222E360C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_222E3615C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

void DOCDocumentPickerExtensionUpdateWithConfiguration(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_msgSend(v4, "_setPickerMode:", objc_msgSend(v3, "interactionMode"));
  id v5 = (void *)MEMORY[0x263F1D920];
  id v7 = [v3 documentContentTypes];

  v6 = objc_msgSend(v5, "doc_identifiersForContentTypes:", v7);
  [v4 _setPickableTypes:v6];
}

id DOCLogHandle()
{
  v0 = (void **)MEMORY[0x263F3AC28];
  v1 = (void *)*MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v1 = *v0;
  }
  return v1;
}

DOCOpenLocationIntent *DOCCreateDefaultHomeScreenWidgetIntent()
{
  v0 = [DOCIntentLocation alloc];
  uint64_t v1 = *MEMORY[0x263F3AB40];
  v2 = _DocumentManagerBundle();
  id v3 = [v2 localizedStringForKey:@"Recents" value:@"Recents" table:@"Localizable"];
  id v4 = [(DOCIntentLocation *)v0 initWithIdentifier:v1 displayString:v3];

  id v5 = [MEMORY[0x263F0FB88] systemImageNamed:@"folder"];
  [(DOCIntentLocation *)v4 setDisplayImage:v5];

  [(DOCIntentLocation *)v4 setLocationType:@"recents"];
  [(DOCIntentLocation *)v4 setLocationIdentifier:v1];
  v6 = objc_alloc_init(DOCOpenLocationIntent);
  [(DOCOpenLocationIntent *)v6 _setLaunchId:@"com.apple.DocumentsApp"];
  [(DOCOpenLocationIntent *)v6 _setExtensionBundleId:@"com.apple.DocumentManagerUICore.RecentsAvocadoIntentHandler"];
  [(DOCOpenLocationIntent *)v6 setLocation:v4];

  return v6;
}

id DOCConstraintsToResizeViewsWithSuperview(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a1;
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", 4 * objc_msgSend(v9, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "superview", (void)v20);
        v18 = DOCConstraintsToResizeWithReferenceView(v16, v17, a2, a3, a4, a5);
        [v10 addObjectsFromArray:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v10;
}

id DOCConstraintsToResizeWithReferenceView(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a1;
  id v12 = a2;
  uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v14 = [v11 topAnchor];
  v15 = [v12 topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:a3];
  [v13 addObject:v16];

  v17 = [v11 leadingAnchor];
  v18 = [v12 leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:a4];
  [v13 addObject:v19];

  long long v20 = [v11 bottomAnchor];
  long long v21 = [v12 bottomAnchor];
  long long v22 = [v20 constraintEqualToAnchor:v21 constant:-a5];
  [v13 addObject:v22];

  long long v23 = [v11 trailingAnchor];
  v24 = [v12 trailingAnchor];
  uint64_t v25 = [v23 constraintEqualToAnchor:v24 constant:-a6];
  [v13 addObject:v25];

  return v13;
}

id DOCConstraintsToResizeWithSuperview(void *a1, double a2, double a3, double a4, double a5)
{
  v14[1] = *MEMORY[0x263EF8340];
  v14[0] = a1;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a1;
  id v11 = [v9 arrayWithObjects:v14 count:1];

  id v12 = DOCConstraintsToResizeViewsWithSuperview(v11, a2, a3, a4, a5);

  return v12;
}

id DOCConstraintsToResizeWithSuperviewSafeArea(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  id v10 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [v9 topAnchor];
  id v12 = [v9 superview];
  uint64_t v13 = [v12 safeAreaLayoutGuide];
  uint64_t v14 = [v13 topAnchor];
  v15 = [v11 constraintEqualToAnchor:v14 constant:a2];
  [v10 addObject:v15];

  v16 = [v9 leadingAnchor];
  v17 = [v9 superview];
  v18 = [v17 safeAreaLayoutGuide];
  v19 = [v18 leadingAnchor];
  long long v20 = [v16 constraintEqualToAnchor:v19 constant:a3];
  [v10 addObject:v20];

  long long v21 = [v9 bottomAnchor];
  long long v22 = [v9 superview];
  long long v23 = [v22 safeAreaLayoutGuide];
  v24 = [v23 bottomAnchor];
  uint64_t v25 = [v21 constraintEqualToAnchor:v24 constant:-a4];
  [v10 addObject:v25];

  v26 = [v9 trailingAnchor];
  v27 = [v9 superview];
  v28 = [v27 safeAreaLayoutGuide];
  v29 = [v28 trailingAnchor];
  v30 = [v26 constraintEqualToAnchor:v29 constant:-a5];
  [v10 addObject:v30];

  [v10 enumerateObjectsUsingBlock:&__block_literal_global_3];
  return v10;
}

uint64_t __DOCConstraintsToResizeWithSuperviewSafeArea_block_invoke(double a1, uint64_t a2, void *a3)
{
  LODWORD(a1) = 1148829696;
  return [a3 setPriority:a1];
}

id DOCConstraintWithPriority(void *a1, float a2)
{
  id v3 = a1;
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];
  return v3;
}

id DOCConstraintsWithPriority(void *a1, float a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFF980];
  id v4 = a1;
  id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __DOCConstraintsWithPriority_block_invoke;
  v8[3] = &unk_264674A88;
  id v6 = v5;
  id v9 = v6;
  float v10 = a2;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __DOCConstraintsWithPriority_block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 40);
  id v5 = a2;
  LODWORD(v4) = v3;
  [v5 setPriority:v4];
  [v2 addObject:v5];
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t DOCAdaptSizeToRect()
{
  return MEMORY[0x270F26AF8]();
}

uint64_t DOCFrameworkBundle()
{
  return MEMORY[0x270F26B10]();
}

uint64_t DOCInitLogging()
{
  return MEMORY[0x270F26B48]();
}

uint64_t DOCProviderDomainIDIsSharedServerDomainID()
{
  return MEMORY[0x270F26B78]();
}

uint64_t DOCRunInMainThread()
{
  return MEMORY[0x270F26B88]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x270EF52C0]();
}

uint64_t NLSearchParseCandidateCopyAttributedInput()
{
  return MEMORY[0x270F4D858]();
}

uint64_t NLSearchParserCopyParseWithOptions()
{
  return MEMORY[0x270F4D860]();
}

uint64_t NLSearchParserCreate()
{
  return MEMORY[0x270F4D868]();
}

uint64_t NLSearchParserSetContext()
{
  return MEMORY[0x270F4D870]();
}

uint64_t NLSearchParserSetIndex()
{
  return MEMORY[0x270F4D878]();
}

uint64_t NLSearchParserSetString()
{
  return MEMORY[0x270F4D880]();
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x270EF2A80](retstr, table);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x270EF2B60](enumerator, key, value);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F06208]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DocumentManagerBundle()
{
  return MEMORY[0x270F26BB0]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
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

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}