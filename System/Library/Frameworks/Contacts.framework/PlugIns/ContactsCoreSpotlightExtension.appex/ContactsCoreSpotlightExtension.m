uint64_t sub_1000032A8(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)(void);
  uint64_t vars8;

  v2 = [*(id *)(a1 + 32) store];
  [v2 reindexSearchableItemsWithIdentifiers:0];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t sub_1000033D8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) store];
  [v2 reindexSearchableItemsWithIdentifiers:*(void *)(a1 + 40)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentEnvironment];
}

id objc_msgSend_fileURLRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileURLRepresentation];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_loggerProvider(void *a1, const char *a2, ...)
{
  return [a1 loggerProvider];
}

id objc_msgSend_spotlightIndexingLogger(void *a1, const char *a2, ...)
{
  return [a1 spotlightIndexingLogger];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:");
}