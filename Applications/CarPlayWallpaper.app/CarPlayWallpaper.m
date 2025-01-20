uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

id sub_100005818(uint64_t a1)
{
  if (a1) {
    sub_10000DF20();
  }
  if (qword_10001AE88 != -1) {
    dispatch_once(&qword_10001AE88, &stru_100014750);
  }
  v1 = (void *)qword_10001AE80;

  return v1;
}

void sub_100005874(id a1)
{
  qword_10001AE80 = (uint64_t)os_log_create("com.apple.CarPlayWallpaper", "Default");

  _objc_release_x1();
}

void sub_1000061F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000621C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = [WeakRetained wallpaperCache];
    uint64_t v7 = *(void *)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000634C;
    v10[3] = &unk_100014778;
    objc_copyWeak(v13, (id *)(a1 + 48));
    id v8 = *(id *)(a1 + 40);
    v9 = *(void **)(a1 + 56);
    id v11 = v8;
    v13[1] = v9;
    id v12 = *(id *)(a1 + 32);
    [v6 saveImage:v3 withKey:v7 completion:v10];

    objc_destroyWeak(v13);
  }
}

void sub_100006338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000634C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = [WeakRetained wallpaper];
  v6 = [v5 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) identifier];
  if ([v6 isEqualToString:v7])
  {
    id v8 = *(id *)(a1 + 56);
    id v9 = [WeakRetained userInterfaceStyle];

    if (v8 == v9)
    {
      v10 = sub_100005818(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [*(id *)(a1 + 32) identifier];
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138543618;
        v14 = v11;
        __int16 v15 = 2114;
        uint64_t v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Displaying cached image %{public}@ (%{public}@)", (uint8_t *)&v13, 0x16u);
      }
      [WeakRetained setCachedWallpaperImage:v3];
    }
  }
  else
  {
  }
}

void sub_100007174(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) layer];
  v4 = [v2 createImageFromLayer:v3];

  v5 = sub_100005818(0);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 64)) {
        CFStringRef v7 = @"dark";
      }
      else {
        CFStringRef v7 = @"light";
      }
      id v8 = [*(id *)(a1 + 48) wallpaper];
      id v9 = [v8 identifier];
      int v10 = 138543618;
      CFStringRef v11 = v7;
      __int16 v12 = 2114;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Generated %{public}@ image for wallpaper %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10000E10C(a1, v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1000078C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000078F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id CPWWallpaperImageCache.__allocating_init(imageCache:imageIDsCache:)(uint64_t a1, uint64_t a2)
{
  v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageCache] = a1;
  *(void *)&v5[OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageIDsCache] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return [super init];
}

id CPWWallpaperImageCache.init(imageCache:imageIDsCache:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageCache] = a1;
  *(void *)&v2[OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageIDsCache] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for CPWWallpaperImageCache();
  return [super init];
}

uint64_t type metadata accessor for CPWWallpaperImageCache()
{
  return self;
}

Swift::Void __swiftcall CPWWallpaperImageCache.updateCacheVersionIfNeeded(version:)(Swift::Int version)
{
  v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  objc_super v7 = (void *)((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100007CC0(0, &qword_10001AC48);
  *objc_super v7 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  char v8 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    if ([*(id *)&v2[OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageIDsCache] version] != (id)version)
    {
      static os_log_type_t.error.getter();
      sub_100007CC0(0, &qword_10001AC50);
      uint64_t v9 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();

      uint64_t v10 = *(void **)&v2[OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageCache];
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v2;
      *(void *)(v11 + 24) = version;
      aBlock[4] = sub_100007D34;
      aBlock[5] = v11;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100007DB8;
      aBlock[3] = &unk_1000147E8;
      __int16 v12 = _Block_copy(aBlock);
      int v13 = v2;
      swift_release();
      [v10 removeAllImagesWithCompletion:v12];
      _Block_release(v12);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100007CC0(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100007CFC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100007D34()
{
  v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageIDsCache);
  [v1 setVersion:*(void *)(v0 + 24)];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v1 setEntries:isa];
}

uint64_t sub_100007DB8(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100007DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007E0C()
{
  return swift_release();
}

UIImage_optional __swiftcall CPWWallpaperImageCache.image(with:)(Swift::String with)
{
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for DispatchPredicate();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (uint64_t *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100007CC0(0, &qword_10001AC48);
  uint64_t *v6 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  char v7 = _dispatchPreconditionTest(_:)();
  char v8 = (objc_class *)(*(uint64_t (**)(uint64_t *, uint64_t))(v4 + 8))(v6, v3);
  if (v7)
  {
    uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageCache);
    NSString v11 = String._bridgeToObjectiveC()();
    __int16 v12 = (objc_class *)[v10 imageWith:v11];

    if (v12) {
      sub_1000083EC();
    }
    char v8 = v12;
  }
  else
  {
    __break(1u);
  }
  result.value.super.Class isa = v8;
  result.is_nil = v9;
  return result;
}

void CPWWallpaperImageCache.save(image:with:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = type metadata accessor for DispatchPredicate();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  __int16 v15 = (void *)((char *)aBlock - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100007CC0(0, &qword_10001AC48);
  *__int16 v15 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v12);
  char v16 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    v17 = *(void **)&v6[OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageCache];
    NSString v18 = String._bridgeToObjectiveC()();
    v19 = (void *)swift_allocObject();
    v19[2] = v6;
    v19[3] = a2;
    v19[4] = a3;
    v19[5] = a4;
    v19[6] = a5;
    aBlock[4] = sub_100008900;
    aBlock[5] = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000082A0;
    aBlock[3] = &unk_100014838;
    v20 = _Block_copy(aBlock);
    v21 = v6;
    swift_bridgeObjectRetain();
    sub_100009770(a4);
    swift_release();
    [v17 saveWithImage:a1 with:v18 completion:v20];
    _Block_release(v20);
  }
  else
  {
    __break(1u);
  }
}

void sub_1000082A0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000083EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100007CC0(0, &qword_10001AC48);
  uint64_t *v5 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  char v6 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0) {
    goto LABEL_28;
  }
  char v7 = *(void **)(v1 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageIDsCache);
  NSString v8 = String._bridgeToObjectiveC()();
  [v7 markEntryAsRecentlyUsed:v8];

  id v9 = [v7 entries];
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v11 = *(void **)(v1 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWWallpaperImageCache_imageCache);
  id v12 = [v11 allImageKeys];
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v14 = sub_10000C41C(v13);
  swift_bridgeObjectRelease();
  __int16 v15 = sub_10000B1CC(v10, v14);
  swift_bridgeObjectRelease();
  int64_t v17 = 0;
  unint64_t v18 = v15[7];
  v37 = v15 + 7;
  uint64_t v19 = 1 << *((unsigned char *)v15 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v18;
  int64_t v38 = (unint64_t)(v19 + 63) >> 6;
  *(void *)&long long v16 = 136446210;
  long long v36 = v16;
  v35[1] = (char *)&type metadata for Any + 8;
  while (1)
  {
    if (v21)
    {
      unint64_t v23 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      unint64_t v24 = v23 | (v17 << 6);
      goto LABEL_23;
    }
    int64_t v25 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v38) {
      goto LABEL_25;
    }
    unint64_t v26 = v37[v25];
    ++v17;
    if (!v26)
    {
      int64_t v17 = v25 + 1;
      if (v25 + 1 >= v38) {
        goto LABEL_25;
      }
      unint64_t v26 = v37[v17];
      if (!v26)
      {
        int64_t v17 = v25 + 2;
        if (v25 + 2 >= v38) {
          goto LABEL_25;
        }
        unint64_t v26 = v37[v17];
        if (!v26) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v21 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v17 << 6);
LABEL_23:
    v28 = (uint64_t *)(v15[6] + 16 * v24);
    uint64_t v30 = *v28;
    unint64_t v29 = v28[1];
    swift_bridgeObjectRetain();
    os_log_type_t v31 = static os_log_type_t.info.getter();
    sub_100007CC0(0, &qword_10001AC50);
    swift_bridgeObjectRetain_n();
    v32 = static OS_os_log.default.getter();
    if (os_log_type_enabled(v32, v31))
    {
      uint64_t v33 = swift_slowAlloc();
      int64_t v39 = v17;
      uint64_t v34 = v33;
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = v36;
      swift_bridgeObjectRetain();
      *(void *)(v34 + 4) = sub_10000A9C4(v30, v29, &v40);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v32, v31, "Removing cached wallpaper: %{public}s", (uint8_t *)v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      int64_t v17 = v39;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v11 removeImageWith:v22];
  }
  int64_t v27 = v25 + 3;
  if (v27 >= v38)
  {
LABEL_25:
    swift_release();
    return;
  }
  unint64_t v26 = v37[v27];
  if (v26)
  {
    int64_t v17 = v27;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v17 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v17 >= v38) {
      goto LABEL_25;
    }
    unint64_t v26 = v37[v17];
    ++v27;
    if (v26) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_1000088B0()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100008900(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(v1 + 40);
  if (a1) {
    sub_1000083EC();
  }
  if (v3) {
    v3(a1);
  }
}

void CPWWallpaperImageCache.init()()
{
}

id CPWWallpaperImageCache.__deallocating_deinit()
{
  return sub_10000A758(type metadata accessor for CPWWallpaperImageCache);
}

void CPWMappedImageCache.__allocating_init(cacheID:persistenceOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_allocWithZone(v3);
  id v6 = objc_allocWithZone((Class)BSUIMappedImageCache);
  char v7 = (char *)v5;
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v9 = [v6 initWithUniqueIdentifier:v8];

  if (v9)
  {
    *(void *)&v7[OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache] = v9;
    *(void *)&v7[OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_persistenceOptions] = a3;

    v10.receiver = v7;
    v10.super_class = v3;
    [super init];
  }
  else
  {
    __break(1u);
  }
}

void CPWMappedImageCache.init(cacheID:persistenceOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_allocWithZone((Class)BSUIMappedImageCache);
  id v6 = v3;
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v8 = [v5 initWithUniqueIdentifier:v7];

  if (v8)
  {
    *(void *)&v6[OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache] = v8;
    *(void *)&v6[OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_persistenceOptions] = a3;

    v9.receiver = v6;
    v9.super_class = (Class)type metadata accessor for CPWMappedImageCache();
    [super init];
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for CPWMappedImageCache()
{
  return self;
}

UIImage_optional __swiftcall CPWMappedImageCache.image(with:)(Swift::String with)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  NSString v3 = String._bridgeToObjectiveC()();
  uint64_t v4 = (objc_class *)[v2 imageForKey:v3];

  id v6 = v4;
  result.value.super.Class isa = v6;
  result.is_nil = v5;
  return result;
}

void CPWMappedImageCache.save(image:with:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_super v9 = *(void **)(v5 + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  NSString v10 = String._bridgeToObjectiveC()();
  uint64_t v11 = *(void *)(v5 + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_persistenceOptions);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a4;
  *(void *)(v12 + 24) = a5;
  v14[4] = sub_100009178;
  v14[5] = v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_100009184;
  v14[3] = &unk_100014888;
  uint64_t v13 = _Block_copy(v14);
  sub_100009770(a4);
  swift_release();
  [v9 setImage:a1 forKey:v10 withPersistenceOptions:v11 completion:v13];
  _Block_release(v13);
}

uint64_t sub_100008ECC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v18 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v17 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007CC0(0, &qword_10001AC48);
  uint64_t v12 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v13 = (void *)swift_allocObject();
  id v13[2] = a2;
  v13[3] = a3;
  v13[4] = a1;
  aBlock[4] = sub_10000CA44;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007DB8;
  aBlock[3] = &unk_100014B58;
  uint64_t v14 = _Block_copy(aBlock);
  sub_100009770(a2);
  id v15 = a1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000C900();
  sub_10000A0CC(&qword_10001AD28);
  sub_10000C958();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
}

uint64_t sub_100009178(uint64_t a1, void *a2)
{
  return sub_100008ECC(a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_100009184(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

Swift::Void __swiftcall CPWMappedImageCache.removeImage(with:)(Swift::String with)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  NSString v3 = String._bridgeToObjectiveC()();
  [v2 removeImageForKey:v3];
}

void CPWMappedImageCache.removeAllImages(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v8[4] = sub_100009768;
  v8[5] = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100007DB8;
  v8[3] = &unk_1000148D8;
  uint64_t v7 = _Block_copy(v8);
  sub_100009770(a1);
  swift_release();
  [v5 removeAllImagesWithCompletion:v7];
  _Block_release(v7);
}

uint64_t sub_1000094CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v16 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007CC0(0, &qword_10001AC48);
  uint64_t v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  aBlock[4] = sub_10000C8D0;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007DB8;
  aBlock[3] = &unk_100014B08;
  uint64_t v13 = _Block_copy(aBlock);
  sub_100009770(a1);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000C900();
  sub_10000A0CC(&qword_10001AD28);
  sub_10000C958();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v16);
}

uint64_t sub_100009768()
{
  return sub_1000094CC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100009770(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

id CPWMappedImageCache.allImageKeys.getter()
{
  id result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                 + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache), "allKeys"));
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id CPWMappedImageCache.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void CPWMappedImageCache.init()()
{
}

id CPWMappedImageCache.__deallocating_deinit()
{
  return sub_10000A758(type metadata accessor for CPWMappedImageCache);
}

uint64_t CPWPreferencesLRUCache.capacity.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_capacity);
}

id CPWPreferencesLRUCache.__allocating_init(capacity:domain:versionKey:cachedDataKey:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_capacity] = a1;
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)&v4[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain] = v5;
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)&v4[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey] = v6;
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)&v4[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey] = v7;

  v9.receiver = v4;
  v9.super_class = v1;
  return [super init];
}

id CPWPreferencesLRUCache.init(capacity:domain:versionKey:cachedDataKey:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_capacity] = a1;
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)&v2[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain] = v3;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)&v2[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey] = v4;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)&v2[OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey] = v5;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CPWPreferencesLRUCache();
  return [super init];
}

uint64_t type metadata accessor for CPWPreferencesLRUCache()
{
  return self;
}

CFIndex CPWPreferencesLRUCache.version.getter()
{
  return CFPreferencesGetAppIntegerValue(*(CFStringRef *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey), *(CFStringRef *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain), 0);
}

void CPWPreferencesLRUCache.version.setter()
{
  CFStringRef v1 = *(const __CFString **)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey);
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  CFPreferencesSetAppValue(v1, isa, *(CFStringRef *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain));
}

void (*CPWPreferencesLRUCache.version.modify(CFIndex *a1))(uint64_t a1)
{
  CFStringRef v3 = *(const __CFString **)(v1 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey);
  CFStringRef v4 = *(const __CFString **)(v1 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain);
  a1[1] = (CFIndex)v3;
  a1[2] = (CFIndex)v4;
  *a1 = CFPreferencesGetAppIntegerValue(v3, v4, 0);
  return sub_100009F64;
}

void sub_100009F64(uint64_t a1)
{
  CFStringRef v2 = *(const __CFString **)(a1 + 8);
  CFStringRef v1 = *(const __CFString **)(a1 + 16);
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  CFPreferencesSetAppValue(v2, isa, v1);
}

void *CPWPreferencesLRUCache.entries.getter()
{
  if (!CFPreferencesCopyAppValue(*(CFStringRef *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey), *(CFStringRef *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain))|| (swift_unknownObjectRetain(), sub_10000A0CC(&qword_10001AC88), (swift_dynamicCast() & 1) == 0))
  {
    swift_unknownObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v1 = v3;
  swift_unknownObjectRelease();
  if (!v3) {
    return &_swiftEmptyArrayStorage;
  }
  return (void *)v1;
}

uint64_t sub_10000A0CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void CPWPreferencesLRUCache.entries.setter()
{
  CFStringRef v1 = *(const __CFString **)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey);
  Class value = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  CFPreferencesSetAppValue(v1, value, *(CFStringRef *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain));
}

void (*CPWPreferencesLRUCache.entries.modify(void **a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = CPWPreferencesLRUCache.entries.getter();
  return sub_10000A27C;
}

void sub_10000A27C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  CFStringRef v3 = *(const __CFString **)(v2 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey);
  if (a2)
  {
    swift_bridgeObjectRetain();
    Class value = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    CFPreferencesSetAppValue(v3, value, *(CFStringRef *)(v2 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain));
    swift_bridgeObjectRelease();
  }
  else
  {
    Class value = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    CFPreferencesSetAppValue(v3, value, *(CFStringRef *)(v2 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain));
  }
}

Swift::Void __swiftcall CPWPreferencesLRUCache.markEntryAsRecentlyUsed(_:)(Swift::String a1)
{
  uint64_t v2 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v5 = CFPreferencesAppSynchronize(*(CFStringRef *)((char *)v1
                                                  + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain));
  NSString v6 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x90);
  objc_super v7 = (char *)v6(v5);
  uint64_t v34 = v7;
  uint64_t v8 = sub_10000C4B4((uint64_t)v7, countAndFlagsBits, (uint64_t)object);
  if (v9) {
    goto LABEL_7;
  }
  uint64_t v10 = v8;
  uint64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  os_log_type_t v31 = v6;
  v32 = v2;
  unint64_t v12 = *((void *)v7 + 2);
  if (v11 != v12)
  {
    uint64_t v21 = 16 * v8;
    unint64_t v13 = v8 + 1;
    while ((v11 & 0x8000000000000000) == 0)
    {
      if (v13 >= v12) {
        goto LABEL_35;
      }
      unint64_t v23 = &v7[v21];
      BOOL v24 = *(void *)&v7[v21 + 48] == countAndFlagsBits && *(void *)&v7[v21 + 56] == (void)object;
      if (!v24 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        if (v13 != v10)
        {
          if (v10 >= v12) {
            goto LABEL_37;
          }
          int64_t v25 = &v7[16 * v10 + 32];
          uint64_t v26 = *((void *)v25 + 1);
          uint64_t v33 = *(void *)v25;
          uint64_t v27 = *((void *)v23 + 6);
          uint64_t v28 = *((void *)v23 + 7);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            objc_super v7 = sub_10000C408((uint64_t)v7);
          }
          unint64_t v29 = &v7[16 * v10];
          *((void *)v29 + 4) = v27;
          *((void *)v29 + 5) = v28;
          swift_bridgeObjectRelease();
          if (v13 >= *((void *)v7 + 2)) {
            goto LABEL_38;
          }
          uint64_t v30 = &v7[v21];
          *((void *)v30 + 6) = v33;
          *((void *)v30 + 7) = v26;
          swift_bridgeObjectRelease();
          uint64_t v34 = v7;
        }
        if (__OFADD__(v10++, 1)) {
          goto LABEL_36;
        }
      }
      ++v13;
      unint64_t v12 = *((void *)v7 + 2);
      v21 += 16;
      if (v13 == v12) {
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  unint64_t v13 = v8 + 1;
LABEL_5:
  NSString v6 = v31;
  uint64_t v2 = v32;
  if ((uint64_t)v13 < v10)
  {
    __break(1u);
LABEL_7:
    uint64_t v10 = *((void *)v7 + 2);
    unint64_t v13 = v10;
  }
  sub_10000C63C(v10, v13);
  swift_bridgeObjectRetain();
  sub_10000C284(0, 0, countAndFlagsBits, (uint64_t)object);
  uint64_t v14 = v34;
  uint64_t v15 = *((void *)v34 + 2);
  uint64_t v16 = *(void *)((char *)v2 + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_capacity);
  if (v16 >= v15) {
    goto LABEL_11;
  }
  if (__OFSUB__(v15, v16))
  {
LABEL_40:
    __break(1u);
    return;
  }
  sub_10000A650(v15 - v16);
  uint64_t v14 = v34;
LABEL_11:
  uint64_t v17 = swift_bridgeObjectRetain();
  uint64_t v18 = (void *)v6(v17);
  char v19 = sub_10000A7EC(v14, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void (**)(char *))((swift_isaMask & *v2) + 0x98);
    v20(v14);
  }
}

unint64_t sub_10000A650(unint64_t result)
{
  if (result)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      unint64_t v2 = *(void *)(*(void *)v1 + 16);
      BOOL v3 = v2 >= result;
      uint64_t result = v2 - result;
      if (v3) {
        return sub_10000C63C(result, v2);
      }
    }
    __break(1u);
  }
  return result;
}

void CPWPreferencesLRUCache.init()()
{
}

id CPWPreferencesLRUCache.__deallocating_deinit()
{
  return sub_10000A758(type metadata accessor for CPWPreferencesLRUCache);
}

id sub_10000A758(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  [super dealloc];
}

uint64_t sub_10000A7EC(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    char v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

char *sub_10000A8B4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000A0CC(&qword_10001AD18);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000C548(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A9C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000AA98(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000CAC4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000CAC4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000CA74((uint64_t)v12);
  return v7;
}

uint64_t sub_10000AA98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000AC54(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000AC54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000ACEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000AECC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000AECC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000ACEC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000AE64(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000AE64(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000A0CC(&qword_10001AD38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000AECC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000A0CC(&qword_10001AD38);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000B01C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000BC84(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t *sub_10000B1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
  uint64_t v25 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a2 + 56;
    v24[0] = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v24[0] + 16 * v5);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      ++v5;
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int v9 = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(v2 + 48);
        BOOL v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v26 = v5;
LABEL_19:
          char v18 = *(unsigned char *)(v2 + 32);
          unint64_t v19 = (unint64_t)((1 << v18) + 63) >> 6;
          size_t v20 = 8 * v19;
          if ((v18 & 0x3Fu) < 0xE || swift_stdlib_isStackAllocationSafe())
          {
            __chkstk_darwin();
            memcpy((char *)v24 - ((v20 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v20);
            uint64_t v21 = sub_10000B7C0((void *)((char *)v24 - ((v20 + 15) & 0x3FFFFFFFFFFFFFF0)), v19, v2, v11, &v25);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            NSString v22 = (void *)swift_slowAlloc();
            memcpy(v22, (const void *)(v2 + 56), v20);
            uint64_t v21 = sub_10000B7C0((unint64_t *)v22, v19, v2, v11, &v25);
            swift_release();
            swift_bridgeObjectRelease();
            swift_slowDealloc();
          }
          return v21;
        }
        uint64_t v15 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v15;
          if (((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
            break;
          }
          uint64_t v16 = (void *)(v12 + 16 * v11);
          BOOL v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t v26 = v5;
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return (unint64_t *)v2;
      }
    }
  }
  return (unint64_t *)v2;
}

uint64_t sub_10000B4E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000A0CC(&qword_10001AD40);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t *sub_10000B7C0(unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v30 = result;
  uint64_t v31 = v6 - 1;
  uint64_t v8 = *a5;
  unint64_t v7 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return (unint64_t *)sub_10000B9EC(v30, a2, v31, a3);
  }
  uint64_t v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9) {
      goto LABEL_29;
    }
    uint64_t v11 = v8 + 16 * v7;
    uint64_t v13 = *(void *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    a5[1] = v7 + 1;
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v14 = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = 1 << v16;
    if (((1 << v16) & *(void *)(v32 + 8 * (v16 >> 6))) == 0) {
      goto LABEL_4;
    }
    uint64_t v19 = *(void *)(a3 + 48);
    uint64_t v20 = (void *)(v19 + 16 * v16);
    BOOL v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v24 = ~v15;
      for (unint64_t i = v16 + 1; ; unint64_t i = v26 + 1)
      {
        unint64_t v26 = i & v24;
        if (((*(void *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        BOOL v27 = (void *)(v19 + 16 * v26);
        BOOL v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
          unint64_t v17 = v26 >> 6;
          uint64_t v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
LABEL_15:
    unint64_t v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      uint64_t v23 = v31 - 1;
      if (__OFSUB__(v31, 1)) {
        goto LABEL_30;
      }
      --v31;
      if (!v23) {
        return (unint64_t *)&_swiftEmptySetSingleton;
      }
    }
LABEL_5:
    uint64_t v8 = *a5;
    unint64_t v7 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v7 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000B9EC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_10000A0CC(&qword_10001AD40);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    BOOL v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_10000BC84(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10000B4E0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000BE20();
      goto LABEL_22;
    }
    sub_10000BFD4();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_10000BE20()
{
  uint64_t v1 = v0;
  sub_10000A0CC(&qword_10001AD40);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000BFD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000A0CC(&qword_10001AD40);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_10000C284(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t v6 = sub_10000A8B4(isUniquelyReferenced_nonNull_native, v15, 1, v6);
  }
  int64_t v16 = &v6[16 * a1 + 32];
  uint64_t result = (char *)swift_arrayDestroy();
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v18 = *((void *)v6 + 2);
  BOOL v19 = __OFSUB__(v18, a2);
  uint64_t v20 = v18 - a2;
  if (v19) {
    goto LABEL_26;
  }
  if ((v20 & 0x8000000000000000) == 0)
  {
    uint64_t result = v16 + 16;
    uint64_t v21 = &v6[16 * a2 + 32];
    if (v16 + 16 != v21 || result >= &v21[16 * v20]) {
      uint64_t result = (char *)memmove(result, v21, 16 * v20);
    }
    uint64_t v22 = *((void *)v6 + 2);
    BOOL v19 = __OFADD__(v22, v10);
    uint64_t v23 = v22 + v10;
    if (!v19)
    {
      *((void *)v6 + 2) = v23;
LABEL_20:
      *(void *)int64_t v16 = a3;
      *((void *)v16 + 1) = a4;
      uint64_t *v4 = v6;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10000C408(uint64_t a1)
{
  return sub_10000A8B4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000C41C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000B01C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000C4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = 0;
  for (unint64_t i = (void *)(a1 + 40); ; i += 2)
  {
    BOOL v8 = *(i - 1) == a2 && *i == a3;
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      break;
    }
    if (v3 == ++v6) {
      return 0;
    }
  }
  return v6;
}

uint64_t sub_10000C548(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000C63C(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_10000A8B4(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = *((void *)v4 + 2);
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    int64_t v16 = &v4[16 * a2 + 32];
    if (a1 != a2 || &v4[16 * a1 + 32] >= &v16[16 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[16 * a1 + 32], v16, 16 * v15);
    }
    uint64_t v17 = *((void *)v4 + 2);
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      *((void *)v4 + 2) = v18;
LABEL_20:
      void *v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for BSUIMappedImageCachePersistenceOptions(uint64_t a1)
{
}

void sub_10000C7D0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000C81C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000C82C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C864()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000C874()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000C890()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C8D0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

unint64_t sub_10000C900()
{
  unint64_t result = qword_10001AD20;
  if (!qword_10001AD20)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001AD20);
  }
  return result;
}

unint64_t sub_10000C958()
{
  unint64_t result = qword_10001AD30;
  if (!qword_10001AD30)
  {
    sub_10000C9B4(&qword_10001AD28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001AD30);
  }
  return result;
}

uint64_t sub_10000C9B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C9FC()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000CA44()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1(*(void *)(v0 + 32));
  }
  return result;
}

uint64_t sub_10000CA74(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000CAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t variable initialization expression of CPWAssetLibrary.wallpaperOverlayPath()
{
  return 0;
}

uint64_t CPWAssetLibrary.wallpaperOverlayPath.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_10000CCEC(uint64_t a1, unint64_t a2)
{
  sub_10000CE28(a1, a2);
  int64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath);
  swift_beginAccess();
  uint64_t *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  return sub_10000D080();
}

uint64_t sub_10000CD54@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x70))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000CDB0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  swift_bridgeObjectRetain();
  sub_10000CE28(v2, v3);
  int64_t v5 = (uint64_t *)(v4 + OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath);
  swift_beginAccess();
  uint64_t *v5 = v2;
  v5[1] = v3;
  swift_bridgeObjectRelease();
  return sub_10000D080();
}

void sub_10000CE28(uint64_t a1, unint64_t a2)
{
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  sub_100007CC0(0, &qword_10001AC50);
  log = static OS_os_log.default.getter();
  if (os_log_type_enabled(log, v5))
  {
    swift_bridgeObjectRetain_n();
    unint64_t v6 = v2;
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = (uint64_t *)&v6[OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath];
    swift_beginAccess();
    if (v8[1])
    {
      uint64_t v9 = *v8;
      unint64_t v10 = v8[1];
    }
    else
    {
      uint64_t v9 = 7104878;
      unint64_t v10 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_10000A9C4(v9, v10, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    if (a2)
    {
      unint64_t v11 = a2;
    }
    else
    {
      a1 = 7104878;
      unint64_t v11 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_10000A9C4(a1, v11, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v5, "updating wallpaperOverlayPath from %s to %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_10000D080()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)v0
                                                             + OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_observers), "allObjects"));
  sub_10000A0CC(&qword_10001ADE0);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v3) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  os_log_type_t v5 = *(void (**)(void))((swift_isaMask & *v0) + 0x70);
  if (v3 >= 1)
  {
    uint64_t v6 = 0;
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        v5();
        if (!v9) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v8 = *(void **)(v2 + 8 * v6 + 32);
        uint64_t v10 = swift_unknownObjectRetain();
        ((void (*)(uint64_t))v5)(v10);
        if (!v11)
        {
LABEL_11:
          NSString v7 = 0;
          goto LABEL_6;
        }
      }
      NSString v7 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
LABEL_6:
      ++v6;
      [v8 assetLibraryDidUpdateWallpaperOverlayPath:v7];
      swift_unknownObjectRelease();

      if (v3 == v6) {
        return swift_bridgeObjectRelease_n();
      }
    }
  }
  __break(1u);
  return result;
}

id variable initialization expression of CPWAssetLibrary.observers()
{
  id v0 = [self hashTableWithOptions:5];

  return v0;
}

void *variable initialization expression of CPWAssetLibrary.cancellables()
{
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) == 0 || !_CocoaArrayWrapper.endIndex.getter()) {
    return &_swiftEmptySetSingleton;
  }
  return (void *)sub_10000DA98((unint64_t)&_swiftEmptyArrayStorage);
}

uint64_t variable initialization expression of CPWAssetLibrary.assetManager()
{
  return CAUAssetLibraryManager.init()();
}

id CPWAssetLibrary.init()()
{
  sub_10000A0CC(&qword_10001AD50);
  __chkstk_darwin();
  unint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000A0CC(&qword_10001AD58);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10000A0CC(&qword_10001AD60);
  uint64_t v7 = *(void *)(v21 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = &v0[OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_observers;
  unint64_t v12 = self;
  uint64_t v13 = v0;
  *(void *)&v0[v11] = [v12 hashTableWithOptions:5];
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    BOOL v14 = (void *)sub_10000DA98((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    BOOL v14 = &_swiftEmptySetSingleton;
  }
  *(void *)&v13[OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_cancellables] = v14;
  uint64_t v15 = OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_assetManager;
  type metadata accessor for CAUAssetLibraryManager();
  swift_allocObject();
  *(void *)&v13[v15] = CAUAssetLibraryManager.init()();

  int64_t v16 = (objc_class *)type metadata accessor for CPWAssetLibrary();
  v23.receiver = v13;
  v23.super_class = v16;
  [super init];
  dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
  id v22 = [self mainRunLoop];
  uint64_t v18 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v2, 1, 1, v18);
  sub_100007CC0(0, &qword_10001AD80);
  sub_10000DE50(&qword_10001AD88, &qword_10001AD58);
  sub_10000DD48();
  Publisher.receive<A>(on:options:)();
  sub_10000DDB0((uint64_t)v2);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10000DE50(&qword_10001AD98, &qword_10001AD60);
  uint64_t v19 = v21;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();

  return v17;
}

void sub_10000D73C(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for CAUResource();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v12 = (char *)Strong;
    if (v10)
    {
      (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, enum case for CAUResource.wallpaperOverlay(_:), v2);
      dispatch thunk of CAUAssetLibrary.path(for:)();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
      Swift::String v13 = URL.path(percentEncoded:)(0);
      uint64_t countAndFlagsBits = v13._countAndFlagsBits;
      object = v13._object;
      (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    }
    else
    {
      uint64_t countAndFlagsBits = 0;
      object = 0;
    }
    sub_10000CE28(countAndFlagsBits, (unint64_t)object);
    int64_t v16 = (uint64_t *)&v12[OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath];
    swift_beginAccess();
    *int64_t v16 = countAndFlagsBits;
    v16[1] = (uint64_t)object;
    swift_bridgeObjectRelease();
    sub_10000D080();
  }
}

id CPWAssetLibrary.addObserver(_:)(uint64_t a1)
{
  return [*(id *)(v1 + OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_observers) addObject:a1];
}

id CPWAssetLibrary.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CPWAssetLibrary();
  [super dealloc];
}

unint64_t sub_10000DA98(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_10000A0CC(&qword_10001ADC8);
      uint64_t result = static _SetStorage.allocate(capacity:)();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  uint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    uint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    type metadata accessor for AnyCancellable();
    sub_10000DE94(&qword_10001ADD0);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_10000DE94(&qword_10001ADD8);
      while (1)
      {
        uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      uint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CPWAssetLibrary()
{
  return self;
}

unint64_t sub_10000DD48()
{
  unint64_t result = qword_10001AD90;
  if (!qword_10001AD90)
  {
    sub_100007CC0(255, &qword_10001AD80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001AD90);
  }
  return result;
}

uint64_t sub_10000DDB0(uint64_t a1)
{
  uint64_t v2 = sub_10000A0CC(&qword_10001AD50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DE10()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DE48(uint64_t *a1)
{
}

uint64_t sub_10000DE50(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000C9B4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000DE94(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AnyCancellable();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000DED8()
{
}

uint64_t sub_10000DEEC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10000DF20()
{
}

void sub_10000DF4C()
{
  sub_1000078E4();
  sub_1000078C8((void *)&_mh_execute_header, v0, v1, "No wallpaper to display!", v2, v3, v4, v5, v6);
}

void sub_10000DF80(void *a1)
{
  uint64_t v1 = [a1 identifier];
  sub_1000078F0((void *)&_mh_execute_header, v2, v3, "Unable to load wallpaper: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10000E00C(void *a1)
{
  uint64_t v1 = [a1 identifier];
  sub_1000078F0((void *)&_mh_execute_header, v2, v3, "Failed to resolve wallpaper %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10000E098()
{
  sub_1000078E4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Wallpaper provider is not ready yet!", v1, 2u);
}

void sub_10000E0D8()
{
  sub_1000078E4();
  sub_1000078C8((void *)&_mh_execute_header, v0, v1, "Failed to retrieve data for wallpaper overlay.", v2, v3, v4, v5, v6);
}

void sub_10000E10C(uint64_t a1, NSObject *a2)
{
  if (*(unsigned char *)(a1 + 64)) {
    CFStringRef v3 = @"dark";
  }
  else {
    CFStringRef v3 = @"light";
  }
  uint64_t v4 = [*(id *)(a1 + 48) wallpaper];
  uint64_t v5 = [v4 identifier];
  int v6 = 138543618;
  CFStringRef v7 = v3;
  __int16 v8 = 2114;
  unint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to generate %{public}@ image for wallpaper %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_10000E1E8()
{
  sub_1000078E4();
  sub_1000078C8((void *)&_mh_execute_header, v0, v1, "Unable to create device to draw wallpaper", v2, v3, v4, v5, v6);
}

void sub_10000E21C()
{
  sub_1000078E4();
  sub_1000078C8((void *)&_mh_execute_header, v0, v1, "Unable to draw wallpaper with width/height of 0", v2, v3, v4, v5, v6);
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for CAUResource()
{
  return type metadata accessor for CAUResource();
}

uint64_t dispatch thunk of CAUAssetLibrary.path(for:)()
{
  return dispatch thunk of CAUAssetLibrary.path(for:)();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter()
{
  return dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
}

uint64_t CAUAssetLibraryManager.init()()
{
  return CAUAssetLibraryManager.init()();
}

uint64_t type metadata accessor for CAUAssetLibraryManager()
{
  return type metadata accessor for CAUAssetLibraryManager();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return _CGBitmapGetAlignedBytesPerRow();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

uint64_t CGImageCreateFromIOSurface()
{
  return _CGImageCreateFromIOSurface();
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return _IOSurfaceCreate(properties);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _[a1 _FBSScene];
}

id objc_msgSend__cacheKeyForWallpaper_(void *a1, const char *a2, ...)
{
  return [a1 _cacheKeyForWallpaper:];
}

id objc_msgSend__registerSettingsDiffActionArray_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerSettingsDiffActionArray:forKey:");
}

id objc_msgSend__unregisterSettingsDiffActionArrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterSettingsDiffActionArrayForKey:");
}

id objc_msgSend__updateOverlayImageViewWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOverlayImageViewWithPath:");
}

id objc_msgSend__updateWallpaperImage(void *a1, const char *a2, ...)
{
  return _[a1 _updateWallpaperImage];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addUpdateRect_(void *a1, const char *a2, ...)
{
  return [a1 addUpdateRect:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assetLibrary(void *a1, const char *a2, ...)
{
  return _[a1 assetLibrary];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginFrameAtTime_timeStamp_(void *a1, const char *a2, ...)
{
  return [a1 beginFrameAtTime:timeStamp:];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_bs_performAfterSynchronizedCommit_(void *a1, const char *a2, ...)
{
  return [a1 bs_performAfterSynchronizedCommit:];
}

id objc_msgSend_cacheID(void *a1, const char *a2, ...)
{
  return _[a1 cacheID];
}

id objc_msgSend_cachedImageView(void *a1, const char *a2, ...)
{
  return _[a1 cachedImageView];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_createImageFromLayer_(void *a1, const char *a2, ...)
{
  return [a1 createImageFromLayer:];
}

id objc_msgSend_createImageOfResolvedWallpaper_completion_(void *a1, const char *a2, ...)
{
  return [a1 createImageOfResolvedWallpaper:completion:];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return _[a1 displayIdentity];
}

id objc_msgSend_endFrame(void *a1, const char *a2, ...)
{
  return _[a1 endFrame];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:];
}

id objc_msgSend_imageWithKey_(void *a1, const char *a2, ...)
{
  return [a1 imageWithKey:];
}

id objc_msgSend_initWithCacheID_persistenceOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheID:persistenceOptions:];
}

id objc_msgSend_initWithCapacity_domain_versionKey_cachedDataKey_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:domain:versionKey:cachedDataKey:];
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfFile:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithImageCache_imageIDsCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithImageCache:imageCache imageIDsCache:imageIDsCache];
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:sessionRole:];
}

id objc_msgSend_initWithWallpaper_assetLibrary_wallpaperProvider_wallpaperCache_isInstrumentCluster_(void *a1, const char *a2, ...)
{
  return [a1 initWithWallpaper:assetLibrary:wallpaperProvider:wallpaperCache:isInstrumentCluster:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:belowSubview:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isCarInstrumentsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 isCarInstrumentsDisplay];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isInstrumentCluster(void *a1, const char *a2, ...)
{
  return _[a1 isInstrumentCluster];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return _[a1 isReady];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_loadWallpaperFromData_(void *a1, const char *a2, ...)
{
  return [a1 loadWallpaperFromData:];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_newTextureWithDescriptor_iosurface_plane_(void *a1, const char *a2, ...)
{
  return [a1 newTextureWithDescriptor:iosurface:plane:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_overlayImageView(void *a1, const char *a2, ...)
{
  return _[a1 overlayImageView];
}

id objc_msgSend_overlayPath(void *a1, const char *a2, ...)
{
  return _[a1 overlayPath];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_render(void *a1, const char *a2, ...)
{
  return _[a1 render];
}

id objc_msgSend_rendererWithMTLTexture_options_(void *a1, const char *a2, ...)
{
  return [a1 rendererWithMTLTexture:options:];
}

id objc_msgSend_resolveWallpaper_(void *a1, const char *a2, ...)
{
  return [a1 resolveWallpaper:];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_saveImage_withKey_completion_(void *a1, const char *a2, ...)
{
  return [a1 saveImage:withKey:completion:];
}

id objc_msgSend_setAssetLibrary_(void *a1, const char *a2, ...)
{
  return [a1 setAssetLibrary:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setCachedImageView_(void *a1, const char *a2, ...)
{
  return [a1 setCachedImageView:];
}

id objc_msgSend_setCachedWallpaperImage_(void *a1, const char *a2, ...)
{
  return [a1 setCachedWallpaperImage:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setDataProviderDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDataProviderDelegate:];
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return [a1 setDisableActions:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return [a1 setLayer:];
}

id objc_msgSend_setOverlayImageView_(void *a1, const char *a2, ...)
{
  return [a1 setOverlayImageView:];
}

id objc_msgSend_setOverlayPath_(void *a1, const char *a2, ...)
{
  return [a1 setOverlayPath:];
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideUserInterfaceStyle:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setUncachedWallpaperView_(void *a1, const char *a2, ...)
{
  return [a1 setUncachedWallpaperView:];
}

id objc_msgSend_setUsage_(void *a1, const char *a2, ...)
{
  return [a1 setUsage:];
}

id objc_msgSend_setWallpaper_(void *a1, const char *a2, ...)
{
  return [a1 setWallpaper:];
}

id objc_msgSend_setWallpaperCache_(void *a1, const char *a2, ...)
{
  return [a1 setWallpaperCache:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_tableBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 tableBackgroundColor];
}

id objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(void *a1, const char *a2, ...)
{
  return [a1 texture2DDescriptorWithPixelFormat:width:height:mipmapped:];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_updateCacheVersionIfNeededWithVersion_(void *a1, const char *a2, ...)
{
  return [a1 updateCacheVersionIfNeededWithVersion:];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_wallpaper(void *a1, const char *a2, ...)
{
  return _[a1 wallpaper];
}

id objc_msgSend_wallpaperCache(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperCache];
}

id objc_msgSend_wallpaperOverlayPath(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperOverlayPath];
}

id objc_msgSend_wallpaperProvider(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperProvider];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}