uint64_t sub_100004A90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004AA0(uint64_t a1)
{
}

void sub_100004AA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  if (!v2) {
    v2 = *(void **)(v1 + 56);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void sub_100004B78(uint64_t a1)
{
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

void sub_100004D64(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasFetchedInitialAccount] & 1) == 0) {
    [*(id *)(a1 + 32) _updateActiveAccount];
  }
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004E18;
    block[3] = &unk_100010500;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t sub_100004E18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000517C(uint64_t a1)
{
  v2 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v7, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) _activeAccountBlocking];
  int v4 = objc_msgSend(v3, "ams_DSID");
  uint64_t v5 = [v4 stringValue];

  unint64_t v6 = *(void *)(a1 + 40);
  if (v6 | v5 && ([(id)v6 isEqualToString:v5] & 1) == 0) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100010568);
  }
  [*(id *)(a1 + 32) setActiveAccount:v3];
  [*(id *)(a1 + 32) setHasFetchedInitialAccount:1];
}

void sub_100005268(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"AccountDSIDChangedNotification" object:0];
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_opt_new();
  int v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100005724(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100005738(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = +[MPMediaLibrary defaultMediaLibrary];
  uint64_t v4 = (uint64_t)[*(id *)(a1 + 32) counterForGeneratingLibraryChangeNotifications];
  if (v4 >= 1) {
    [WeakRetained _endGeneratingLibraryChangeNotifications];
  }
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100005854;
  v11 = &unk_100010590;
  id v13 = *(id *)(a1 + 40);
  id v5 = v3;
  id v12 = v5;
  id v6 = [v5 performTransactionWithBlock:&v8];
  if (v4 >= 1) {
    objc_msgSend(WeakRetained, "_beginGeneratingLibraryChangeNotifications", v8, v9, v10, v11);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
}

uint64_t sub_100005854(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100005914(uint64_t a1)
{
  id v2 = +[MPMediaLibrary defaultMediaLibrary];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100005CE8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _beginGeneratingLibraryChangeNotifications];
}

uint64_t sub_100005DE4(uint64_t a1)
{
  if ((uint64_t)[*(id *)(a1 + 32) counterForGeneratingLibraryChangeNotifications] >= 1) {
    [*(id *)(a1 + 32) _endGeneratingLibraryChangeNotifications];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_1000063F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSURLQueryItem);
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v6 = [v4 initWithName:v3 value:v5];

  return v6;
}

id sub_10000664C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSURLQueryItem);
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v6 = [v4 initWithName:v3 value:v5];

  return v6;
}

void sub_100006770(id a1)
{
  v3[0] = @"playPodcast";
  v3[1] = @"playPodcasts";
  v3[2] = @"playStation";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  uint64_t v2 = (void *)qword_100016D60;
  qword_100016D60 = v1;
}

void sub_1000072D4(id a1)
{
  v3[0] = @"playPodcasts";
  v3[1] = @"playPodcast";
  v4[0] = &off_100010D80;
  v4[1] = &off_100010D98;
  v3[2] = @"playStation";
  v4[2] = &off_100010DB0;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_100016D78;
  qword_100016D78 = v1;
}

void sub_100008500(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long buf)
{
  if (a2)
  {
    _Block_object_dispose(&buf, 8);
    if (a2 == 2)
    {
      id v24 = objc_begin_catch(a1);
      v25 = _MTLogCategoryAppRemoval();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "App Removal failed with exception: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v26 = [v24 userInfo];
      v27 = +[NSMutableDictionary dictionaryWithDictionary:v26];

      v28 = [v24 reason];
      [v27 setObject:v28 forKeyedSubscript:@"exception-reason"];

      +[NSError errorWithDomain:@"com.apple.podcasts.appremoval" code:1 userInfo:v27];
      objc_claimAutoreleasedReturnValue();

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(a1);
    }
    JUMPOUT(0x100008460);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000086A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000086B4(uint64_t a1)
{
}

void sub_1000086BC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_10000871C()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100016D80;
  uint64_t v7 = qword_100016D80;
  if (!qword_100016D80)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100009108;
    void v3[3] = &unk_100010718;
    v3[4] = &v4;
    sub_100009108((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000087E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000088F8(id a1, MPMediaLibrary *a2)
{
  uint64_t v2 = a2;
  id v3 = +[MPMediaQuery mt_allItemsForPodcastsApp];
  [(MPMediaLibrary *)v2 deleteItems:v3];

  return 1;
}

void sub_10000894C(uint64_t a1, int a2)
{
  uint64_t v4 = _MTLogCategoryAppRemoval();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "All podcast media removed.", buf, 2u);
    }

    uint64_t v6 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to remove all podcast media.", v8, 2u);
    }

    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.podcasts.appremoval" code:3 userInfo:0];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

Class sub_100009108(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100016D88)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    void v3[3] = sub_10000924C;
    v3[4] = &unk_100010750;
    void v3[5] = v3;
    long long v4 = off_100010738;
    uint64_t v5 = 0;
    qword_100016D88 = _sl_dlopen();
    if (!qword_100016D88)
    {
      abort_report_np();
LABEL_8:
      sub_10000A5E8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NMSyncDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100016D80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000924C()
{
  uint64_t result = _sl_dlopen();
  qword_100016D88 = result;
  return result;
}

void sub_10000966C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000098C8(id a1, NSString *a2, id a3, id a4)
{
  id v5 = a4;
  if ([(NSString *)a2 isEqualToString:kMTShowSiriSuggestionsKey]) {
    sub_100009944(kMTApplicationBundleIdentifier, (int)[v5 BOOLValue]);
  }
}

void sub_100009944(void *a1, int a2)
{
  id v8 = a1;
  id v3 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  long long v4 = v3;
  if (v3) {
    id v5 = [v3 mutableCopy];
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  uint64_t v6 = v5;
  if (a2)
  {
    [v5 removeObject:v8];
  }
  else if (([v5 containsObject:v8] & 1) == 0)
  {
    [v6 addObject:v8];
  }
  CFPreferencesSetAppValue(@"AppCanShowSiriSuggestionsBlacklist", v6, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

void sub_100009E08(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = +[NSData dataWithContentsOfURL:a2];
    long long v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 32) defaultPodcastArtworkData];
    long long v4 = *(void (**)(void))(v5 + 16);
  }
  id v6 = (id)v3;
  v4();
}

void sub_100009FAC(id a1)
{
  qword_100016D98 = (uint64_t)dispatch_queue_create(0, 0);
  _objc_release_x1();
}

uint64_t sub_100009FE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009FF8(uint64_t a1)
{
}

void sub_10000A000(uint64_t a1)
{
  if (!qword_100016DA8)
  {
    uint64_t v2 = +[UIImage defaultPodcastArtwork];
    uint64_t v3 = UIImageJPEGRepresentation(v2, 0.0);
    long long v4 = (void *)qword_100016DA8;
    qword_100016DA8 = v3;
  }
  if ((byte_100016DA0 & 1) == 0)
  {
    byte_100016DA0 = 1;
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_100010800);
  }
  id v6 = (void *)qword_100016DA8;
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_storeStrong(v7, v6);
}

void sub_10000A0BC(id a1)
{
}

void sub_10000A0D0(id a1)
{
  byte_100016DA0 = 0;
  id v1 = (void *)qword_100016DA8;
  qword_100016DA8 = 0;
}

void sub_10000A41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A43C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A44C(uint64_t a1)
{
}

void sub_10000A454(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    [v3 setIgnoreSystemFilterPredicates:1];
    id v3 = v8;
  }
  long long v4 = [v3 items];
  if ([v4 count])
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObjectsFromArray:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_10000A5E8()
{
  CFAllocatorRef v0 = (const __CFAllocator *)abort_report_np();
  CFDictionaryCreate(v0, v1, v2, v3, v4, v5);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return _CFURLCreateStringByAddingPercentEscapes(allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return _CFURLCreateStringByReplacingPercentEscapes(allocator, originalString, charactersToLeaveEscaped);
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return _MRSystemAppPlaybackQueueCreate();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return _MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
}

uint64_t MRSystemAppPlaybackQueueSetUserInfo()
{
  return _MRSystemAppPlaybackQueueSetUserInfo();
}

uint64_t MTEpisodeContextFromPersistentString()
{
  return _MTEpisodeContextFromPersistentString();
}

uint64_t MTEpisodeContextSortTypeFromPersistentString()
{
  return _MTEpisodeContextSortTypeFromPersistentString();
}

uint64_t MTPlayReasonFromPersistentString()
{
  return _MTPlayReasonFromPersistentString();
}

uint64_t NSPersistentStringForMTEpisodeContext()
{
  return _NSPersistentStringForMTEpisodeContext();
}

uint64_t NSPersistentStringForMTEpisodeContextSortType()
{
  return _NSPersistentStringForMTEpisodeContextSortType();
}

uint64_t NSPersistentStringForMTPlayReason()
{
  return _NSPersistentStringForMTPlayReason();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
}

uint64_t _MTLogCategoryAppRemoval()
{
  return __MTLogCategoryAppRemoval();
}

uint64_t _MTLogCategoryDefault()
{
  return __MTLogCategoryDefault();
}

uint64_t _MTLogCategoryMediaLibrary()
{
  return __MTLogCategoryMediaLibrary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__activeAccountBlocking(void *a1, const char *a2, ...)
{
  return [a1 _activeAccountBlocking];
}

id objc_msgSend__applePodcastsFoundationSettingsUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 _applePodcastsFoundationSettingsUserDefaults];
}

id objc_msgSend__beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend__defaultsChanged(void *a1, const char *a2, ...)
{
  return [a1 _defaultsChanged];
}

id objc_msgSend__endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 _endGeneratingLibraryChangeNotifications];
}

id objc_msgSend__updateActiveAccount(void *a1, const char *a2, ...)
{
  return [a1 _updateActiveAccount];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_activeDsid(void *a1, const char *a2, ...)
{
  return [a1 activeDsid];
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callbacks(void *a1, const char *a2, ...)
{
  return [a1 callbacks];
}

id objc_msgSend_clearPodcastsDefaults(void *a1, const char *a2, ...)
{
  return [a1 clearPodcastsDefaults];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterForGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 counterForGeneratingLibraryChangeNotifications];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultImageStoreURL(void *a1, const char *a2, ...)
{
  return [a1 defaultImageStoreURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultMediaLibrary];
}

id objc_msgSend_defaultPodcastArtwork(void *a1, const char *a2, ...)
{
  return [a1 defaultPodcastArtwork];
}

id objc_msgSend_defaultPodcastArtworkData(void *a1, const char *a2, ...)
{
  return [a1 defaultPodcastArtworkData];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 endGeneratingLibraryChangeNotifications];
}

id objc_msgSend_hasFetchedInitialAccount(void *a1, const char *a2, ...)
{
  return [a1 hasFetchedInitialAccount];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_interactionClass(void *a1, const char *a2, ...)
{
  return [a1 interactionClass];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isUserLoggedIn(void *a1, const char *a2, ...)
{
  return [a1 isUserLoggedIn];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_podcastsQuery(void *a1, const char *a2, ...)
{
  return [a1 podcastsQuery];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_removeAllDonations(void *a1, const char *a2, ...)
{
  return [a1 removeAllDonations];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedCacheURL(void *a1, const char *a2, ...)
{
  return [a1 sharedCacheURL];
}

id objc_msgSend_sharedContainerURL(void *a1, const char *a2, ...)
{
  return [a1 sharedContainerURL];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedDocumentsURL(void *a1, const char *a2, ...)
{
  return [a1 sharedDocumentsURL];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 sharedLibraryURL];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}