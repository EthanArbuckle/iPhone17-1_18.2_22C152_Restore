id INSJSONEncodedIntent(void *a1)
{
  void *v1;
  void *v2;
  uint64_t vars8;

  v1 = [a1 _JSONDictionaryRepresentation];
  v2 = objc_msgSend(v1, "if_JSONStringRepresentation");

  return v2;
}

id INSJSONEncodedIntentResponse(void *a1)
{
  v1 = [a1 _JSONDictionaryRepresentation];
  v2 = objc_msgSend(v1, "if_JSONStringRepresentation");

  return v2;
}

id INSJSONEncodedSlotResolutionResult(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  v8 = [v6 _intentInstanceDescription];
  v9 = [v8 slotByName:v5];

  v10 = objc_msgSend((id)objc_msgSend(v9, "resolutionResultClass"), "_resolutionResultWithData:slotDescription:", v7, v9);

  v11 = [v9 facadePropertyName];
  v12 = [v10 _JSONDictionaryRepresentationForIntent:v6 parameterName:v11];

  v13 = objc_msgSend(v12, "if_JSONStringRepresentation");

  return v13;
}

id INSExtensionServiceTraceCompletionHandlerWithCode(void *a1, int a2)
{
  id v3 = a1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __INSExtensionServiceTraceCompletionHandlerWithCode_block_invoke;
  v7[3] = &unk_26427DEB8;
  id v8 = v3;
  int v9 = a2;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x2166CBB50](v7);

  return v5;
}

uint64_t __INSExtensionServiceTraceCompletionHandlerWithCode_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return kdebug_trace();
}

float INSGetAceVersionNumberFromString(void *a1)
{
  v1 = [a1 componentsSeparatedByString:@"-"];
  if ([v1 count])
  {
    v2 = [v1 objectAtIndexedSubscript:0];
    [v2 floatValue];
    float v4 = v3;
  }
  else
  {
    float v4 = 0.0;
  }

  return v4;
}

void *__getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_26427DFB0;
    uint64_t v7 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    float v3 = (void *)v5[0];
    v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary;
    if (FrontBoardServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      float v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "FBSOpenApplicationErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke_273(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_275)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __FrontBoardServicesLibraryCore_block_invoke_276;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_26427E0E0;
    uint64_t v7 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary_275 = _sl_dlopen();
    float v3 = (void *)v5[0];
    v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary_275;
    if (FrontBoardServicesLibraryCore_frameworkLibrary_275)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      float v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary_275;
LABEL_5:
  uint64_t result = dlsym(v2, "FBSOpenApplicationErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationErrorDomainSymbolLoc_ptr_272 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke_276()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary_275 = result;
  return result;
}

void sub_2163E8568(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

uint64_t IFMergeDictionaries()
{
  return MEMORY[0x270F44638]();
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x270EF51B8]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x270EF51E0]();
}

uint64_t INIntentDefinitionURLsForInstalledApps()
{
  return MEMORY[0x270EF51E8]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x270EF51F8]();
}

uint64_t INIntentResponseIsFailure()
{
  return MEMORY[0x270EF5200]();
}

uint64_t INIntentSchemaGetIntentResponseDescriptionWithFacadeClass()
{
  return MEMORY[0x270EF5218]();
}

uint64_t INSchemaWithTypeName()
{
  return MEMORY[0x270EF5290]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _INVCVoiceShortcutErrorDomain()
{
  return MEMORY[0x270EF52D8]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}