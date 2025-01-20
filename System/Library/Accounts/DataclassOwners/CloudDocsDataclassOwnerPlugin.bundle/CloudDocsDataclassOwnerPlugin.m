void sub_2754(char a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  void v8[5];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_86F0 != -1) {
    dispatch_once(&qword_86F0, &stru_4148);
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_28D4;
  v8[3] = &unk_4170;
  v8[4] = &v10;
  v9 = a1;
  dispatch_sync((dispatch_queue_t)qword_86E8, v8);
  a4[1] = a2;
  a4[2] = 0;
  *a4 = v11[3];
  *((_DWORD *)a4 + 4) = a3;
  _Block_object_dispose(&v10, 8);
}

void sub_284C(id a1)
{
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("create-log-section", v1);

  v3 = (void *)qword_86E8;
  qword_86E8 = (uint64_t)v2;
}

uint64_t sub_28D4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = qword_86E0 + 1;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 24);
  if (*(unsigned char *)(result + 40) != ((v2 & 1) == 0))
  {
    *(void *)(v1 + 24) = v2 + 1;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  qword_86E0 = v2;
  return result;
}

void sub_2928(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = *a1;
    if (*a1)
    {
      uint64_t v2 = brc_bread_crumbs();
      v3 = brc_default_log();
      v4 = v3;
      if (v1)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          sub_3128((uint64_t)v2, v1, v4);
        }
      }
      else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v5 = 134218242;
        uint64_t v6 = v1;
        __int16 v7 = 2112;
        v8 = v2;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[INFO] ┗%llx %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

void sub_3128(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┗%llx %@", (uint8_t *)&v3, 0x16u);
}

void sub_31B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] everything is in sync%@", (uint8_t *)&v2, 0xCu);
}

void sub_3228(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "[DEBUG] there are containers needing upload: %@%@", (uint8_t *)&v3, 0x16u);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_containerWithPendingChanges(void *a1, const char *a2, ...)
{
  return [a1 containerWithPendingChanges];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}