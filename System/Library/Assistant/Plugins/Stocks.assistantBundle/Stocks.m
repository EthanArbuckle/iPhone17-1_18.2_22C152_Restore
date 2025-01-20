BOOL sub_3058(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  v4 = [v3 symbol];
  v5 = [v4 length];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) symbol];
    v7 = [v3 symbol];
    v8 = [v6 caseInsensitiveCompare:v7] == 0;
  }
  else
  {
    v9 = [v3 companyName];
    v10 = [v9 length];

    if (v10)
    {
      v11 = [*(id *)(a1 + 32) companyName];
      v12 = [v11 length];
      v13 = [v3 companyName];
      v14 = [v13 length];

      if (v12 <= v14)
      {
        v15 = [v3 companyName];
        v16 = *(void **)(a1 + 32);
      }
      else
      {
        v15 = [*(id *)(a1 + 32) companyName];
        v16 = v3;
      }
      v17 = [v16 companyName];
      [v15 rangeOfString:v17 options:385];
      v19 = v18;

      v8 = v19 != 0;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
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

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_addCompleted(void *a1, const char *a2, ...)
{
  return [a1 addCompleted];
}

id objc_msgSend_addStocks(void *a1, const char *a2, ...)
{
  return [a1 addStocks];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_companyName(void *a1, const char *a2, ...)
{
  return [a1 companyName];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createdStocks(void *a1, const char *a2, ...)
{
  return [a1 createdStocks];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_reference(void *a1, const char *a2, ...)
{
  return [a1 reference];
}

id objc_msgSend_searchCompleted(void *a1, const char *a2, ...)
{
  return [a1 searchCompleted];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_stockReferences(void *a1, const char *a2, ...)
{
  return [a1 stockReferences];
}

id objc_msgSend_stocks(void *a1, const char *a2, ...)
{
  return [a1 stocks];
}

id objc_msgSend_stocksList(void *a1, const char *a2, ...)
{
  return [a1 stocksList];
}

id objc_msgSend_symbol(void *a1, const char *a2, ...)
{
  return [a1 symbol];
}

id objc_msgSend_validateCommandArguments(void *a1, const char *a2, ...)
{
  return [a1 validateCommandArguments];
}