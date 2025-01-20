void sub_100002CF8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  void *v20;
  unsigned char v21[128];

  v3 = a2;
  sleep(1u);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    v6 = v5;
    v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "uniqueIdentifier", (void)v16);
        if ([v10 isEqual:@"test"])
        {
          v11 = [v9 actions];
          v12 = [v11 count];

          if (!v12)
          {
            [v9 setTitle:@"Zero Action After"];
            v13 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT"];
            v14 = +[FLFollowUpAction actionWithLabel:@"ADDED LATER" url:v13];
            v20 = v14;
            v15 = +[NSArray arrayWithObjects:&v20 count:1];
            [v9 setActions:v15];

            [*(id *)(a1 + 32) postFollowUpItem:v9 error:0];
          }
        }
        else
        {
        }
      }
      v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_1000033C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000033CC(id a1, UIAlertAction *a2)
{
  id v2 = [(id)0x3039 stringValue];
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _FLLogSystem()
{
  return __FLLogSystem();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend__appeared(void *a1, const char *a2, ...)
{
  return [a1 _appeared];
}

id objc_msgSend__loadActionURL(void *a1, const char *a2, ...)
{
  return [a1 _loadActionURL];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_eventSource(void *a1, const char *a2, ...)
{
  return [a1 eventSource];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}