void sub_4C6C(id a1)
{
  uint64_t vars8;

  qword_C918 = +[NSSet setWithArray:&off_88F8];
  _objc_release_x1();
}

id sub_5410()
{
  v0 = (void *)qword_C910;
  if (!qword_C910)
  {
    id v1 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.ondemandd.devtools" options:4096];
    v2 = (void *)qword_C910;
    qword_C910 = (uint64_t)v1;

    v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ODRDeveloperToolsProtocol_New];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
    [v3 setClasses:v10 forSelector:"tagStatusForBundle:replyBlock:" argumentIndex:0 ofReply:1];

    [(id)qword_C910 setRemoteObjectInterface:v3];
    [(id)qword_C910 resume];
    v0 = (void *)qword_C910;
  }
  return v0;
}

void sub_5588(id a1, NSError *a2)
{
}

void sub_559C(id a1)
{
  id v1 = (void *)qword_C910;
  qword_C910 = 0;
}

uint64_t sub_55AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_55BC(uint64_t a1)
{
}

void sub_55C4(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5680;
  v6[3] = &unk_82B8;
  id v7 = v2;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  [v3 tagStatusForBundle:v7 replyBlock:v6];
}

void sub_5680(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) mutableCopy:v14];
          [v13 setObject:a1[4] forKeyedSubscript:@"ODRTag_BundleIDKey"];
          [v7 addObject:v13];

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v7 forKeyedSubscript:@"process.resources[]"];
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void sub_5A88(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  CFStringRef v5 = @"Resource status collection timeout.";
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = +[NSError errorWithDomain:@"com.apple.dtmobileis.resources" code:-2 userInfo:v2];
  [v1 invokeCompletionWithReturnValue:0 error:v3];
}

void sub_5B5C(uint64_t a1, uint64_t a2, void *a3)
{
  CFStringRef v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  [v5 setObject:a2 forKeyedSubscript:v6];
  [*(id *)(a1 + 48) invokeCompletionWithReturnValue:*(void *)(a1 + 32) error:v7];
}

void sub_5E30(id a1, NSError *a2)
{
}

void sub_5E44(id a1)
{
  id v1 = (void *)qword_C910;
  qword_C910 = 0;
}

uint64_t sub_5E54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_5E64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5FF0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2 = +[NSString stringWithFormat:@"Resource purge for BundleID '%@' timedout.", *(void *)(a1 + 40), NSLocalizedDescriptionKey];
  uint64_t v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  NSErrorUserInfoKey v4 = +[NSError errorWithDomain:@"com.apple.dtmobileis.assetcontrol" code:-3 userInfo:v3];
  [v1 invokeCompletionWithReturnValue:0 error:v4];
}

id sub_60E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeCompletionWithReturnValue:a2 error:a2];
}

void sub_6284(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2 = +[NSString stringWithFormat:@"Resource purge for AssetID '%@' timedout.", *(void *)(a1 + 40), NSLocalizedDescriptionKey];
  uint64_t v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  NSErrorUserInfoKey v4 = +[NSError errorWithDomain:@"com.apple.dtmobileis.assetcontrol" code:-4 userInfo:v3];
  [v1 invokeCompletionWithReturnValue:0 error:v4];
}

id sub_6378(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeCompletionWithReturnValue:a2 error:a2];
}

void sub_64FC(id a1, NSError *a2)
{
}

void sub_6510(id a1)
{
  id v1 = (void *)qword_C910;
  qword_C910 = 0;
}

void sub_6520(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  CFStringRef v5 = @"Resource: Get bandwidth value timedout.";
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = +[NSError errorWithDomain:@"com.apple.dtmobileis.resources" code:-2 userInfo:v2];
  [v1 invokeCompletionWithReturnValue:0 error:v3];
}

void sub_65F4(uint64_t a1, uint64_t a2, void *a3)
{
  NSErrorUserInfoKey v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInteger:a2];
  [v4 invokeCompletionWithReturnValue:v6 error:v5];
}

void sub_6818(id a1, NSError *a2)
{
}

void sub_682C(id a1)
{
  id v1 = (void *)qword_C910;
  qword_C910 = 0;
}

void sub_683C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2 = +[NSString stringWithFormat:@"Resource: Set bandwidth to '%@' timedout.", *(void *)(a1 + 40), NSLocalizedDescriptionKey];
  id v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  NSErrorUserInfoKey v4 = +[NSError errorWithDomain:@"com.apple.dtmobileis.resources" code:-2 userInfo:v3];
  [v1 invokeCompletionWithReturnValue:0 error:v4];
}

void sub_6930(uint64_t a1, uint64_t a2, void *a3)
{
  NSErrorUserInfoKey v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInteger:a2];
  [v4 invokeCompletionWithReturnValue:v6 error:v5];
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

void CFRelease(CFTypeRef cf)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleFlushBundleCaches()
{
  return __CFBundleFlushBundleCaches();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int rand(void)
{
  return _rand();
}

uint64_t random(void)
{
  return _random();
}

[objc_msgSend_array(a1, a2, ...);
{
  return [a1 array];
}

[objc_msgSend_date(a1, a2, ...);
{
  return [a1 date];
}

[objc_msgSend_intValue:intValue];
{
  return [a1 intValue];
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return [a1 length];
}

[objc_msgSend_mutableCopy mutableCopy];
{
  return [a1 mutableCopy];
}

id objc_msgSend_resume(id a1, SEL a2, ...)
{
  return [a1 resume];
}

[objc_msgSend_stringByDeletingLastPathComponent(a1, a2, ...)]
{
  return [a1 stringByDeletingLastPathComponent];
}

[objc_msgSend_unsignedIntegerValue unsignedIntegerValue];
{
  return [a1 unsignedIntegerValue];
}