void sub_24718E568(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_247191B88(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v4 = objc_msgSend_cancelled(a1[4], a2, a3);
  v5 = APLogForCategory();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24718C000, v6, OS_LOG_TYPE_INFO, "Request was cancelled and data task is not created.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_absoluteString(a1[5], v7, v8);
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_24718C000, v6, OS_LOG_TYPE_DEFAULT, "Starting request to: %{public}@.", buf, 0xCu);
    }
    objc_initWeak((id *)buf, a1[4]);
    v10 = a1[6];
    uint64_t v11 = (uint64_t)a1[5];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = sub_247191D80;
    v18 = &unk_265206308;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = a1[6];
    v13 = objc_msgSend_GET_headers_withCompletionHandler_(v10, v12, v11, 0, &v15);
    objc_msgSend_setSessionDataTask_(a1[4], v14, (uint64_t)v13, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void sub_247191D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247191D80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = objc_msgSend_responseQueue(WeakRetained, v5, v6);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_247191E5C;
    block[3] = &unk_2652062E0;
    block[4] = v7;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(v8, block);
  }
}

uint64_t sub_247191E5C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__httpResponse_session_, *(void *)(a1 + 40));
}

void sub_247191EF4(uint64_t a1)
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24718C000, v2, OS_LOG_TYPE_DEFAULT, "Config System Request: Canceling request.", buf, 2u);
  }

  objc_msgSend_setCancelled_(*(void **)(a1 + 32), v3, 1);
  v7 = objc_msgSend_sessionDataTask(*(void **)(a1 + 32), v4, v5);
  if (v7)
  {
    uint64_t v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_24718C000, v8, OS_LOG_TYPE_INFO, "Config System Request: Data task canceled.", v16, 2u);
    }

    objc_msgSend_cancel(v7, v9, v10);
  }
  objc_msgSend__runCompletionHandlerWithSuccess_data_(*(void **)(a1 + 32), v6, 0, 0);
  id v11 = *(void **)(a1 + 32);
  uint64_t v14 = objc_msgSend__configurationVersion(v11, v12, v13);
  objc_msgSend__sendCoreAnalyticsWithUpdateStatus_version_(v11, v15, 1513, v14);
}

void sub_24719357C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  objc_destroyWeak(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2471935B0(uint64_t a1, uint64_t a2)
{
}

void sub_2471935BC(uint64_t a1)
{
}

void sub_2471935C4(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v6 = objc_msgSend_datasource(*(void **)(a1 + 32), v4, v5);
  uint64_t v8 = objc_msgSend_subdirectoriesAtURL_(v6, v7, (uint64_t)v3);

  uint64_t v10 = objc_msgSend__versionInDirectoryWithURLs_(*(void **)(a1 + 32), v9, (uint64_t)v8);
  uint64_t v13 = v10;
  if (v10)
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v15 = objc_msgSend_integerValue(v10, v11, v12);
    if (v14 <= v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v14;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v8;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v26, v30, 16);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id WeakRetained = (void (**)(id, void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48)
                                                                                                  + 8)
                                                                                      + 40));
          WeakRetained[2](WeakRetained, v23);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v25, (uint64_t)&v26, v30, 16);
      }
      while (v20);
    }
  }
}

uint64_t PurposeConfigSystemConfigurationStore.__allocating_init(configDataSource:fallback:)(long long *a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  sub_247193B4C(a1, v4 + 16);
  sub_247193B4C(a2, v4 + 56);
  return v4;
}

uint64_t PurposeConfigSystemConfigurationStore.init(configDataSource:fallback:)(long long *a1, long long *a2)
{
  sub_247193B4C(a1, v2 + 16);
  sub_247193B4C(a2, v2 + 56);
  return v2;
}

uint64_t sub_247193B4C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t PurposeConfigSystemConfigurationStore.deinit()
{
  sub_247193B8C((void *)(v0 + 16));
  sub_247193B8C((void *)(v0 + 56));
  return v0;
}

uint64_t sub_247193B8C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t PurposeConfigSystemConfigurationStore.__deallocating_deinit()
{
  sub_247193B8C((void *)(v0 + 16));
  sub_247193B8C((void *)(v0 + 56));
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t PurposeConfigSystemConfigurationStore.configurationFor(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = v2;
  uint64_t v6 = sub_247194430();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247193EE0(&qword_269240170);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v2[5];
  uint64_t v13 = v2[6];
  sub_247193F24(v2 + 2, v12);
  uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 8))(a1, v12, v13);
  if (v14)
  {
    sub_247194050(v14, (uint64_t)v11);
    swift_unknownObjectRelease();
    uint64_t v15 = sub_2471943F0();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(a2, v11, v15);
    }
    sub_247193F8C((uint64_t)v11);
  }
  sub_247194410();
  id v17 = sub_247194420();
  os_log_type_t v18 = sub_247194450();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134217984;
    v21[1] = a1;
    sub_247194460();
    _os_log_impl(&dword_24718C000, v17, v18, "Using fallback configuration for purpose %ld", v19, 0xCu);
    MEMORY[0x24C54AF60](v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_247193F24(v3 + 7, v3[10]);
  return sub_247194400();
}

uint64_t sub_247193EE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_247193F24(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_247193F68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PurposeConfigSystemConfigurationStore.configurationFor(_:)(a1, a2);
}

uint64_t sub_247193F8C(uint64_t a1)
{
  uint64_t v2 = sub_247193EE0(&qword_269240170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for PurposeConfigSystemConfigurationStore()
{
  return self;
}

uint64_t method lookup function for PurposeConfigSystemConfigurationStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PurposeConfigSystemConfigurationStore);
}

uint64_t dispatch thunk of PurposeConfigSystemConfigurationStore.__allocating_init(configDataSource:fallback:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ConfigSystemPurposeDataSource.configFor(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_247194050@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2471943D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_boundary);
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = sub_247194440();
    uint64_t v12 = v11;

    if (v12)
    {
      BOOL v13 = v10 == 0x6C616E7265747865 && v12 == 0xE800000000000000;
      if (v13 || (sub_247194470() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = (unsigned int *)MEMORY[0x263F20B20];
LABEL_19:
        (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v14, v4);
        sub_2471943E0();
        uint64_t v20 = sub_2471943F0();
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a2, 0, 1, v20);
      }
      if (v10 == 0x6C616E7265746E69 && v12 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v16 = sub_247194470();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0) {
          goto LABEL_14;
        }
      }
      uint64_t v14 = (unsigned int *)MEMORY[0x263F20B28];
      goto LABEL_19;
    }
  }
LABEL_14:
  uint64_t v17 = sub_2471943F0();
  os_log_type_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  return v18(a2, 1, 1, v17);
}

uint64_t ProductionConfigSystemPurposeDataSource.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ProductionConfigSystemPurposeDataSource.init()()
{
  return v0;
}

uint64_t ProductionConfigSystemPurposeDataSource.deinit()
{
  return v0;
}

uint64_t ProductionConfigSystemPurposeDataSource.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id ProductionConfigSystemPurposeDataSource.configFor(_:)(uint64_t a1)
{
  id v1 = objc_msgSend(self, sel_purposeConfig_, a1);
  return v1;
}

id sub_247194330(uint64_t a1)
{
  id v1 = objc_msgSend(self, sel_purposeConfig_, a1);
  return v1;
}

uint64_t type metadata accessor for ProductionConfigSystemPurposeDataSource()
{
  return self;
}

uint64_t method lookup function for ProductionConfigSystemPurposeDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ProductionConfigSystemPurposeDataSource);
}

uint64_t dispatch thunk of ProductionConfigSystemPurposeDataSource.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_2471943D0()
{
  return MEMORY[0x270F08B58]();
}

uint64_t sub_2471943E0()
{
  return MEMORY[0x270F08B68]();
}

uint64_t sub_2471943F0()
{
  return MEMORY[0x270F08B70]();
}

uint64_t sub_247194400()
{
  return MEMORY[0x270F08B78]();
}

uint64_t sub_247194410()
{
  return MEMORY[0x270F08BB0]();
}

uint64_t sub_247194420()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247194430()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247194440()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247194450()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247194460()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247194470()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t APLogForCategory()
{
  return MEMORY[0x270F08BC8]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x270F08BD8]();
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x270F08BE0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
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

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}