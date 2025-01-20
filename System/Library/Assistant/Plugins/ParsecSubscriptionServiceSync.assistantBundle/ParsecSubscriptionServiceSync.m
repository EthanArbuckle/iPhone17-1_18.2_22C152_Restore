void sub_28F4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v2 = *(void **)(a1 + 32);
  v3 = [a2 bundleIdentifier];
  [v2 addObject:v3];
}

void sub_294C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[PSSSSiriSyncHandler _startSubscriptionFetch]_block_invoke_2";
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%s Error getting active subscription services: %{public}@", buf, 0x16u);
    }
  }
  id v8 = objc_alloc_init((Class)NSMutableArray);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_2B28;
  v18 = &unk_41B0;
  id v9 = v5;
  id v19 = v9;
  id v10 = v8;
  id v20 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:&v15];
  id v11 = objc_alloc_init((Class)SAAppSubscriptions);
  id v12 = objc_alloc((Class)NSURL);
  id v13 = objc_msgSend(v12, "initWithString:", @"com.apple.app-subscriptions:all", v15, v16, v17, v18);
  [v11 setIdentifier:v13];

  [v11 setActiveSubscriptions:v10];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v11);
  }
}

void sub_2B28(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectForKey:a2];
  v4 = [v3 objectForKey:@"provider"];
  if (v4)
  {
    id v5 = [v3 objectForKey:@"active"];
    unsigned int v6 = [v5 isEqualToNumber:&__kCFBooleanTrue];

    if (v6)
    {
      id v7 = objc_alloc_init((Class)SAAppSubscription);
      id v8 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.app-subscription:%@", v4];
      id v9 = [objc_alloc((Class)NSURL) initWithString:v8];
      [v7 setIdentifier:v9];

      [v7 setBundleId:v4];
      uint64_t v10 = [v3 objectForKey:@"type"];
      id v11 = (void *)v10;
      if (v10)
      {
        uint64_t v13 = v10;
        id v12 = +[NSArray arrayWithObjects:&v13 count:1];
        [v7 setSubscriptionTiers:v12];
      }
      else
      {
        [v7 setSubscriptionTiers:&__NSArray0__struct];
      }
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__startSubscriptionFetch(void *a1, const char *a2, ...)
{
  return [a1 _startSubscriptionFetch];
}

id objc_msgSend_activeSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 activeSubscriptions];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_subscriptionTiers(void *a1, const char *a2, ...)
{
  return [a1 subscriptionTiers];
}

id objc_msgSend_waitForValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForValue:");
}