DeviceActivityReportService::AppInfoSource_optional __swiftcall AppInfoSource.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3) {
    LOBYTE(rawValue) = 3;
  }
  return (DeviceActivityReportService::AppInfoSource_optional)rawValue;
}

uint64_t AppInfoSource.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_1000045DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000045F0()
{
  Swift::UInt v1 = *v0;
  sub_10001EA68();
  sub_10001EA78(v1);
  return sub_10001EA88();
}

void sub_100004638()
{
  sub_10001EA78(*v0);
}

Swift::Int sub_100004664()
{
  Swift::UInt v1 = *v0;
  sub_10001EA68();
  sub_10001EA78(v1);
  return sub_10001EA88();
}

uint64_t *sub_1000046A8@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_1000046C0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t variable initialization expression of AppInfo.source()
{
  return 3;
}

uint64_t AppInfo.source.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t AppInfo.source.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t (*AppInfo.source.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of AppInfo.bundleIdentifier()
{
  return 0;
}

uint64_t AppInfo.bundleIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInfo.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*AppInfo.bundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AppInfo.displayName.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInfo.displayName.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*AppInfo.displayName.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t AppInfo.localURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B94(&OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL, a1);
}

uint64_t sub_1000049A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A08(&qword_100029448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004A08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t AppInfo.localURL.setter(uint64_t a1)
{
  return sub_100004BF0(a1, &OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL);
}

uint64_t sub_100004A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A08(&qword_100029448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*AppInfo.localURL.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t _s27DeviceActivityReportService7AppInfoC8localURL10Foundation0H0VSgvpfi_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001E218();
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t AppInfo.artworkURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B94(&OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL, a1);
}

uint64_t sub_100004B94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return sub_1000049A0(v4, a2);
}

uint64_t AppInfo.artworkURL.setter(uint64_t a1)
{
  return sub_100004BF0(a1, &OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL);
}

uint64_t sub_100004BF0(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  swift_beginAccess();
  sub_100004A58(a1, v4);
  return swift_endAccess();
}

uint64_t (*AppInfo.artworkURL.modify())()
{
  return j__swift_endAccess;
}

uint64_t AppInfo.description.getter()
{
  uint64_t v1 = v0;
  sub_100004A08(&qword_100029448);
  __chkstk_darwin();
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = 0x203A656372756F53;
  unint64_t v33 = 0xE800000000000000;
  swift_beginAccess();
  LOBYTE(v30) = *(unsigned char *)(v0 + 16);
  sub_100004A08(&qword_100029450);
  v34._countAndFlagsBits = sub_10001E6C8();
  sub_10001E6E8(v34);
  swift_bridgeObjectRelease();
  v35._countAndFlagsBits = 10;
  v35._object = (void *)0xE100000000000000;
  sub_10001E6E8(v35);
  unint64_t v5 = v32;
  unint64_t v4 = v33;
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  sub_10001E948(22);
  swift_bridgeObjectRelease();
  unint64_t v30 = 0xD000000000000013;
  unint64_t v31 = 0x80000001000203C0;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v0 + 32);
  v29[0] = *(void *)(v0 + 24);
  v29[1] = v6;
  swift_bridgeObjectRetain();
  sub_100004A08(&qword_100029458);
  v36._countAndFlagsBits = sub_10001E6C8();
  sub_10001E6E8(v36);
  swift_bridgeObjectRelease();
  v37._countAndFlagsBits = 10;
  v37._object = (void *)0xE100000000000000;
  sub_10001E6E8(v37);
  uint64_t v7 = v30;
  v8 = (void *)v31;
  unint64_t v30 = v5;
  unint64_t v31 = v4;
  swift_bridgeObjectRetain();
  v38._countAndFlagsBits = v7;
  v38._object = v8;
  sub_10001E6E8(v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v10 = v30;
  unint64_t v9 = v31;
  unint64_t v30 = 0;
  unint64_t v31 = 0xE000000000000000;
  sub_10001E948(17);
  swift_bridgeObjectRelease();
  strcpy((char *)v29, "Display Name: ");
  HIBYTE(v29[1]) = -18;
  swift_beginAccess();
  unint64_t v11 = *(void *)(v0 + 48);
  uint64_t v26 = *(void *)(v0 + 40);
  unint64_t v27 = v11;
  swift_bridgeObjectRetain();
  v39._countAndFlagsBits = sub_10001E6C8();
  sub_10001E6E8(v39);
  swift_bridgeObjectRelease();
  v40._countAndFlagsBits = 10;
  v40._object = (void *)0xE100000000000000;
  sub_10001E6E8(v40);
  uint64_t v12 = v29[0];
  v13 = (void *)v29[1];
  v29[0] = v10;
  v29[1] = v9;
  swift_bridgeObjectRetain();
  v41._countAndFlagsBits = v12;
  v41._object = v13;
  sub_10001E6E8(v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = v29[0];
  unint64_t v14 = v29[1];
  uint64_t v26 = 0x5255206C61636F4CLL;
  unint64_t v27 = 0xEB00000000203A4CLL;
  uint64_t v16 = v0 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL;
  swift_beginAccess();
  sub_1000049A0(v16, (uint64_t)v3);
  v42._countAndFlagsBits = sub_10001E6C8();
  sub_10001E6E8(v42);
  swift_bridgeObjectRelease();
  v43._countAndFlagsBits = 10;
  v43._object = (void *)0xE100000000000000;
  sub_10001E6E8(v43);
  uint64_t v17 = v26;
  v18 = (void *)v27;
  uint64_t v26 = v15;
  unint64_t v27 = v14;
  swift_bridgeObjectRetain();
  v44._countAndFlagsBits = v17;
  v44._object = v18;
  sub_10001E6E8(v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = v26;
  unint64_t v19 = v27;
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_10001E948(16);
  swift_bridgeObjectRelease();
  strcpy((char *)v28, "Artwork URL: ");
  HIWORD(v28[1]) = -4864;
  uint64_t v21 = v1 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL;
  swift_beginAccess();
  sub_1000049A0(v21, (uint64_t)v3);
  v45._countAndFlagsBits = sub_10001E6C8();
  sub_10001E6E8(v45);
  swift_bridgeObjectRelease();
  v46._countAndFlagsBits = 10;
  v46._object = (void *)0xE100000000000000;
  sub_10001E6E8(v46);
  uint64_t v22 = v28[0];
  v23 = (void *)v28[1];
  v28[0] = v20;
  v28[1] = v19;
  swift_bridgeObjectRetain();
  v47._countAndFlagsBits = v22;
  v47._object = v23;
  sub_10001E6E8(v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v28[0];
}

uint64_t AppInfo.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FCA4(v0 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL, &qword_100029448);
  sub_10000FCA4(v0 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL, &qword_100029448);
  return v0;
}

uint64_t AppInfo.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FCA4(v0 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL, &qword_100029448);
  sub_10000FCA4(v0 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL, &qword_100029448);

  return swift_deallocClassInstance();
}

uint64_t sub_100005188()
{
  return AppInfo.description.getter();
}

void *variable initialization expression of AppInfoCache.inflightBundleIdentifiers()
{
  return &_swiftEmptySetSingleton;
}

id variable initialization expression of AppInfoCache.appInfoCache()
{
  id v0 = objc_allocWithZone((Class)NSCache);

  return [v0 init];
}

uint64_t variable initialization expression of AppInfoCache.lookupQueue()
{
  uint64_t v0 = sub_10001E858();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001E848();
  __chkstk_darwin();
  sub_10001E628();
  __chkstk_darwin();
  sub_10000543C();
  sub_10001E618();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100006EB8(&qword_100029468, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004A08((uint64_t *)&unk_100029CC0);
  sub_10000FB04(&qword_100029470, (uint64_t *)&unk_100029CC0);
  sub_10001E908();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return sub_10001E898();
}

unint64_t sub_10000543C()
{
  unint64_t result = qword_100029460;
  if (!qword_100029460)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100029460);
  }
  return result;
}

uint64_t sub_10000547C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_1000054C4()
{
  type metadata accessor for AppInfoCache();
  swift_allocObject();
  uint64_t result = sub_1000055A8();
  static AppInfoCache.shared = (uint64_t)result;
  return result;
}

uint64_t *AppInfoCache.shared.unsafeMutableAddressor()
{
  if (qword_100029410 != -1) {
    swift_once();
  }
  return &static AppInfoCache.shared;
}

uint64_t static AppInfoCache.shared.getter()
{
  if (qword_100029410 != -1) {
    swift_once();
  }

  return swift_retain();
}

void *sub_1000055A8()
{
  uint64_t v1 = v0;
  v13[0] = sub_10001E858();
  uint64_t v2 = *(void *)(v13[0] - 8);
  __chkstk_darwin();
  unint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001E848();
  __chkstk_darwin();
  sub_10001E628();
  __chkstk_darwin();
  v0[2] = &_swiftEmptySetSingleton;
  v0[3] = [objc_allocWithZone((Class)NSCache) init];
  sub_10000543C();
  sub_10001E618();
  v13[1] = &_swiftEmptyArrayStorage;
  sub_100006EB8(&qword_100029468, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004A08((uint64_t *)&unk_100029CC0);
  sub_10000FB04(&qword_100029470, (uint64_t *)&unk_100029CC0);
  sub_10001E908();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v13[0]);
  v0[4] = sub_10001E898();
  id v5 = [self ephemeralSessionConfiguration];
  id v6 = [self sharedURLCache];
  [v5 setURLCache:v6];

  [v5 setRequestCachePolicy:2];
  [v5 setHTTPShouldUsePipelining:1];
  id v7 = [objc_allocWithZone((Class)NSOperationQueue) init];
  sub_10001E8A8();
  NSString v8 = sub_10001E688();
  swift_bridgeObjectRelease();
  [v7 setName:v8];

  [v7 setUnderlyingQueue:v1[4]];
  id v9 = [self sessionWithConfiguration:v5 delegate:0 delegateQueue:v7];
  v1[5] = v9;
  id v10 = v9;
  id v11 = [v7 name];
  [v10 setSessionDescription:v11];

  return v1;
}

unsigned char *AppInfoCache.appInfo(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10001E608();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSString v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001E628();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005CC8(a1, a2);
  swift_beginAccess();
  if (!v13[16])
  {
    uint64_t v22 = *(void *)(v2 + 32);
    uint64_t v14 = swift_allocObject();
    uint64_t v21 = v6;
    uint64_t v15 = v14;
    swift_weakInit();
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = v15;
    v16[3] = a1;
    v16[4] = a2;
    aBlock[4] = sub_100005F80;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006E5C;
    aBlock[3] = &unk_100024D98;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    sub_10001E618();
    v23 = &_swiftEmptyArrayStorage;
    sub_100006EB8((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004A08(&qword_100029478);
    uint64_t v20 = v9;
    sub_10000FB04(&qword_100029C00, &qword_100029478);
    sub_10001E908();
    sub_10001E888();
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v20);
    swift_release();
    swift_release();
  }
  return v13;
}

id sub_100005CC8(uint64_t a1, uint64_t a2)
{
  if ((a1 != 0x6C7070612E6D6F63 || a2 != 0xEF74616843692E65) && (sub_10001E9F8() & 1) == 0) {
    swift_bridgeObjectRetain();
  }
  id v5 = *(id *)(v2 + 24);
  NSString v6 = sub_10001E688();
  swift_bridgeObjectRelease();
  id v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    uint64_t v8 = sub_10000E1D8(a1, a2);
    if (v8)
    {
      return (id)v8;
    }
    else
    {
      id v7 = (id)sub_10000E738(a1, a2);
      id v9 = *(id *)(v2 + 24);
      NSString v10 = sub_10001E688();
      [v9 setObject:v7 forKey:v10];
    }
  }
  return v7;
}

uint64_t sub_100005E48()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100004A08(&qword_100029480);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001F2A0;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = a3;
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10000E8AC(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_100005F8C(v7, 0, 0);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100005F68()
{
  return sub_10000FA60((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_100005F80()
{
  return sub_100005E80(v0[2], v0[3], v0[4]);
}

void sub_100005F8C(uint64_t a1, void (*a2)(void *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v99 = a3;
  v104 = a2;
  uint64_t v86 = sub_10001E098();
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  v84 = (char *)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004A08(&qword_100029448);
  __chkstk_darwin(v7 - 8);
  v91 = (char *)v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_10001E218();
  uint64_t v96 = *(void *)(v93 - 8);
  uint64_t v9 = __chkstk_darwin(v93);
  v83 = (char *)v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v92 = (char *)v81 - v11;
  uint64_t v90 = sub_10001E2F8();
  uint64_t v89 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  v13 = (char *)v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_10001E318();
  uint64_t v87 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v15 = (char *)v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004A08(&qword_1000296F8);
  __chkstk_darwin(v16 - 8);
  v18 = (char *)v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_10001E158();
  v94 = *(void **)(v95 - 8);
  uint64_t v19 = __chkstk_darwin(v95);
  v97 = (char *)v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  v98 = (char *)v81 - v22;
  __chkstk_darwin(v21);
  v103 = (char *)v81 - v23;
  uint64_t v24 = sub_100004A08(&qword_100029700);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)v81 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10001E198();
  uint64_t v101 = *(void *)(v27 - 8);
  uint64_t v102 = v27;
  __chkstk_darwin(v27);
  v100 = (char *)v81 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10001E638();
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v32 = (void *)((char *)v81 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v33 = *(void **)(v4 + 32);
  *uint64_t v32 = v33;
  (*(void (**)(void *, void, uint64_t))(v30 + 104))(v32, enum case for DispatchPredicate.onQueue(_:), v29);
  id v34 = v33;
  LOBYTE(v33) = sub_10001E648();
  (*(void (**)(void *, uint64_t))(v30 + 8))(v32, v29);
  if ((v33 & 1) == 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v106 = a1;
  swift_beginAccess();
  uint64_t v35 = *(void *)(v4 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000D3CC(v35);
  swift_bridgeObjectRelease();
  uint64_t v36 = v106;
  if (!*(void *)(v106 + 16))
  {
    swift_bridgeObjectRelease();
    if (qword_100029428 == -1)
    {
LABEL_9:
      uint64_t v44 = sub_10001E5F8();
      sub_10000FABC(v44, (uint64_t)qword_100029E08);
      Swift::String v40 = sub_10001E5D8();
      os_log_type_t v41 = sub_10001E838();
      if (!os_log_type_enabled(v40, v41)) {
        goto LABEL_12;
      }
      Swift::String v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v42 = 0;
      Swift::String v43 = "Requested bundle identifiers have all been cached or are inflight";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v40, v41, v43, v42, 2u);
      swift_slowDealloc();
LABEL_12:

      Swift::String v45 = v104;
      if (v104)
      {
        swift_retain();
        v45(&_swiftEmptyDictionarySingleton);
        sub_10000FAF4((uint64_t)v45);
      }
      return;
    }
LABEL_28:
    swift_once();
    goto LABEL_9;
  }
  sub_10001E188();
  uint64_t v38 = v101;
  uint64_t v37 = v102;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v101 + 48))(v26, 1, v102) == 1)
  {
    swift_bridgeObjectRelease();
    sub_10000FCA4((uint64_t)v26, &qword_100029700);
    if (qword_100029428 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_10001E5F8();
    sub_10000FABC(v39, (uint64_t)qword_100029E08);
    Swift::String v40 = sub_10001E5D8();
    os_log_type_t v41 = sub_10001E828();
    if (!os_log_type_enabled(v40, v41)) {
      goto LABEL_12;
    }
    Swift::String v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v42 = 0;
    Swift::String v43 = "Failed to initialize URL for app info lookup";
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v100, v26, v37);
  aBlock[0] = v36;
  swift_bridgeObjectRetain();
  sub_100004A08(&qword_100029708);
  sub_10000FB04(&qword_100029710, &qword_100029708);
  sub_10000FB48();
  sub_10001E718();
  swift_bridgeObjectRelease();
  sub_10001E148();
  swift_bridgeObjectRelease();
  sub_10001E2D8();
  sub_10001E308();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v15, v88);
  sub_10001E2E8();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v13, v90);
  uint64_t v46 = sub_10001E2C8();
  uint64_t v47 = *(void *)(v46 - 8);
  int v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48))(v18, 1, v46);
  uint64_t v82 = v4;
  v81[1] = v4 + 16;
  if (v48 == 1)
  {
    sub_10000FCA4((uint64_t)v18, &qword_1000296F8);
  }
  else
  {
    sub_10001E2B8();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v46);
  }
  v49 = v94;
  v50 = v98;
  sub_10001E148();
  swift_bridgeObjectRelease();
  v51 = v97;
  sub_10001E148();
  sub_100004A08(&qword_100029720);
  uint64_t v52 = v49[9];
  unint64_t v53 = (*((unsigned __int8 *)v49 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v49 + 80);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_10001F2B0;
  unint64_t v55 = v54 + v53;
  v56 = (void (*)(unint64_t, char *, uint64_t))v49[2];
  uint64_t v57 = v95;
  v56(v55, v103, v95);
  v56(v55 + v52, v50, v57);
  v56(v55 + 2 * v52, v51, v57);
  sub_10001E168();
  uint64_t v58 = (uint64_t)v91;
  sub_10001E178();
  uint64_t v59 = v96;
  uint64_t v60 = v93;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v96 + 48))(v58, 1, v93) == 1)
  {
    swift_bridgeObjectRelease();
    sub_10000FCA4(v58, &qword_100029448);
    if (qword_100029428 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_10001E5F8();
    sub_10000FABC(v61, (uint64_t)qword_100029E08);
    v62 = sub_10001E5D8();
    os_log_type_t v63 = sub_10001E828();
    BOOL v64 = os_log_type_enabled(v62, v63);
    uint64_t v65 = v101;
    if (v64)
    {
      v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Failed to initialize URL with query parameters for app info lookup", v66, 2u);
      swift_slowDealloc();
    }

    v67 = v104;
    if (v104)
    {
      swift_retain();
      v67(&_swiftEmptyDictionarySingleton);
      sub_10000FAF4((uint64_t)v67);
    }
    v68 = (void (*)(char *, uint64_t))v49[1];
    v68(v97, v57);
    v68(v98, v57);
    v68(v103, v57);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v100, v102);
  }
  else
  {
    v69 = v92;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v92, v58, v60);
    uint64_t v70 = v106;
    swift_beginAccess();
    uint64_t v71 = swift_bridgeObjectRetain();
    sub_100007BFC(v71);
    swift_endAccess();
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v83, v69, v60);
    v72 = v84;
    sub_10001E088();
    uint64_t v73 = v82;
    v94 = *(void **)(v82 + 40);
    Class v74 = sub_10001E078();
    v75 = (void *)swift_allocObject();
    v75[2] = v73;
    v75[3] = v70;
    uint64_t v76 = (uint64_t)v104;
    uint64_t v77 = v99;
    v75[4] = v104;
    v75[5] = v77;
    aBlock[4] = sub_10000FBA0;
    aBlock[5] = v75;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100009324;
    aBlock[3] = &unk_100024F40;
    v78 = _Block_copy(aBlock);
    swift_retain();
    sub_10000FBD4(v76);
    swift_release();
    id v79 = [v94 dataTaskWithRequest:v74 completionHandler:v78];
    _Block_release(v78);

    [v79 resume];
    (*(void (**)(char *, uint64_t))(v85 + 8))(v72, v86);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v92, v60);
    v80 = (void (*)(char *, uint64_t))v49[1];
    v80(v97, v57);
    v80(v98, v57);
    v80(v103, v57);
    (*(void (**)(char *, uint64_t))(v101 + 8))(v100, v102);
  }
}

uint64_t sub_100006E5C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100006EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006EB0()
{
  return swift_release();
}

uint64_t sub_100006EB8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AppInfoCache.fetchAppInfo(bundleIdentifier:completionHandler:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v5 = v4;
  sub_100004A08(&qword_100029480);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001F2A0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_10000E8AC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000E9E0(v11, v5, a3, a4, a1, a2);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100006FF4(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_10000D574(a4, a5);
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
      swift_retain();
    }
    else
    {
      uint64_t v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  a2(v11);

  return swift_release();
}

uint64_t AppInfoCache.fetchAppInfo(bundleIdentifiers:completionHandler:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v68 = a3;
  v67 = a2;
  uint64_t v66 = sub_10001E608();
  uint64_t v65 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  BOOL v64 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_10001E628();
  uint64_t v62 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v61 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = &_swiftEmptyDictionarySingleton;
  id v79 = &_swiftEmptySetSingleton;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v72 = a1 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v73 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v75 = a1;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  Class v74 = "ActivityUI.app-info-cache";
  uint64_t v69 = v6;
  if (v10) {
    goto LABEL_42;
  }
LABEL_6:
  int64_t v12 = v11 + 1;
  if (!__OFADD__(v11, 1))
  {
    if (v12 >= v73) {
      goto LABEL_43;
    }
    unint64_t v13 = *(void *)(v72 + 8 * v12);
    ++v11;
    if (!v13)
    {
      int64_t v11 = v12 + 1;
      if (v12 + 1 >= v73) {
        goto LABEL_43;
      }
      unint64_t v13 = *(void *)(v72 + 8 * v11);
      if (!v13)
      {
        int64_t v11 = v12 + 2;
        if (v12 + 2 >= v73) {
          goto LABEL_43;
        }
        unint64_t v13 = *(void *)(v72 + 8 * v11);
        if (!v13)
        {
          int64_t v14 = v12 + 3;
          if (v14 < v73)
          {
            unint64_t v13 = *(void *)(v72 + 8 * v14);
            if (v13)
            {
              int64_t v11 = v14;
              goto LABEL_19;
            }
            while (1)
            {
              int64_t v11 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_49;
              }
              if (v11 >= v73) {
                break;
              }
              unint64_t v13 = *(void *)(v72 + 8 * v11);
              ++v14;
              if (v13) {
                goto LABEL_19;
              }
            }
          }
LABEL_43:
          swift_release();
          v50 = v79;
          if (v79[2])
          {
            uint64_t v51 = swift_allocObject();
            swift_weakInit();
            uint64_t v52 = (void *)swift_allocObject();
            v52[2] = v51;
            v52[3] = v50;
            unint64_t v53 = v67;
            v52[4] = v6;
            v52[5] = v53;
            v52[6] = v68;
            aBlock[4] = (Swift::Int)sub_10000F518;
            aBlock[5] = (Swift::Int)v52;
            aBlock[0] = (Swift::Int)_NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = (Swift::Int)sub_100006E5C;
            aBlock[3] = (Swift::Int)&unk_100024E10;
            uint64_t v54 = _Block_copy(aBlock);
            swift_retain();
            swift_retain();
            swift_retain();
            unint64_t v55 = v61;
            sub_10001E618();
            uint64_t v77 = &_swiftEmptyArrayStorage;
            sub_100006EB8((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
            sub_100004A08(&qword_100029478);
            sub_10000FB04(&qword_100029C00, &qword_100029478);
            v56 = v64;
            uint64_t v57 = v66;
            sub_10001E908();
            sub_10001E888();
            _Block_release(v54);
            (*(void (**)(char *, uint64_t))(v65 + 8))(v56, v57);
            (*(void (**)(char *, uint64_t))(v62 + 8))(v55, v63);
            swift_release();
            swift_release();
            return swift_release();
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v59 = swift_bridgeObjectRetain();
            v67(v59);
            swift_release();
            return swift_bridgeObjectRelease();
          }
        }
      }
    }
LABEL_19:
    unint64_t v10 = (v13 - 1) & v13;
    for (unint64_t i = __clz(__rbit64(v13)) + (v11 << 6); ; unint64_t i = v49 | (v11 << 6))
    {
      uint64_t v16 = (uint64_t *)(*(void *)(v75 + 48) + 16 * i);
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      BOOL v19 = *v16 == 0x6C7070612E6D6F63 && v18 == 0xEF74616843692E65;
      if (!v19 && (sub_10001E9F8() & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t v20 = *(void **)(v76 + 24);
      swift_bridgeObjectRetain();
      id v21 = v20;
      NSString v22 = sub_10001E688();
      swift_bridgeObjectRelease();
      uint64_t v23 = (char *)[v21 objectForKey:v22];

      if (!v23)
      {
        uint64_t v24 = sub_10000E1D8(v17, v18);
        if (v24)
        {
          uint64_t v23 = (char *)v24;
        }
        else
        {
          type metadata accessor for AppInfo();
          uint64_t v23 = (char *)swift_allocObject();
          v23[16] = 3;
          *(_OWORD *)(v23 + 40) = 0u;
          uint64_t v70 = (uint64_t *)(v23 + 40);
          *(_OWORD *)(v23 + 24) = 0u;
          int64_t v71 = v11;
          uint64_t v25 = &v23[OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL];
          uint64_t v26 = sub_10001E218();
          uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
          uint64_t v28 = v25;
          int64_t v11 = v71;
          v27(v28, 1, 1, v26);
          v27(&v23[OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL], 1, 1, v26);
          uint64_t v6 = v69;
          swift_beginAccess();
          v23[16] = 0;
          swift_beginAccess();
          *((void *)v23 + 3) = v17;
          *((void *)v23 + 4) = v18;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v29 = v70;
          swift_beginAccess();
          *uint64_t v29 = v17;
          *((void *)v23 + 6) = v18;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          id v30 = *(id *)(v76 + 24);
          NSString v31 = sub_10001E688();
          [v30 setObject:v23 forKey:v31];
        }
      }
      swift_beginAccess();
      if (v23[16])
      {
        int64_t v32 = v11;
        swift_retain();
        Swift::Int v33 = *(void *)(v6 + 16);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock[0] = v33;
        *(void *)(v6 + 16) = 0x8000000000000000;
        unint64_t v36 = sub_10000D574(v17, v18);
        uint64_t v37 = *(void *)(v33 + 16);
        BOOL v38 = (v35 & 1) == 0;
        uint64_t v39 = v37 + v38;
        if (__OFADD__(v37, v38))
        {
          __break(1u);
          break;
        }
        char v40 = v35;
        if (*(void *)(v33 + 24) >= v39)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_10000DB58();
          }
        }
        else
        {
          sub_10000D6D0(v39, isUniquelyReferenced_nonNull_native);
          unint64_t v41 = sub_10000D574(v17, v18);
          if ((v40 & 1) != (v42 & 1)) {
            goto LABEL_50;
          }
          unint64_t v36 = v41;
        }
        int64_t v11 = v32;
        Swift::String v43 = (void *)aBlock[0];
        if (v40)
        {
          uint64_t v44 = *(void *)(aBlock[0] + 56);
          swift_release();
          *(void *)(v44 + 8 * v36) = v23;
        }
        else
        {
          *(void *)(aBlock[0] + 8 * (v36 >> 6) + 64) |= 1 << v36;
          Swift::String v45 = (uint64_t *)(v43[6] + 16 * v36);
          *Swift::String v45 = v17;
          v45[1] = v18;
          *(void *)(v43[7] + 8 * v36) = v23;
          uint64_t v46 = v43[2];
          BOOL v47 = __OFADD__(v46, 1);
          uint64_t v48 = v46 + 1;
          if (v47) {
            goto LABEL_48;
          }
          v43[2] = v48;
          swift_bridgeObjectRetain();
        }
        *(void *)(v6 + 16) = v43;
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!v10) {
          goto LABEL_6;
        }
      }
      else
      {
        sub_100009D54(aBlock, v17, v18);
        swift_release();
        swift_bridgeObjectRelease();
        if (!v10) {
          goto LABEL_6;
        }
      }
LABEL_42:
      unint64_t v49 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  uint64_t result = sub_10001EA18();
  __break(1u);
  return result;
}

uint64_t sub_100007A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    unint64_t v10 = (void *)swift_allocObject();
    v10[2] = a3;
    v10[3] = a4;
    v10[4] = a5;
    swift_retain();
    swift_retain();
    sub_100005F8C(a2, (void (*)(void *))sub_10000FAB0, (uint64_t)v10);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100007B10(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = (uint64_t *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_10000DD10(a1, (uint64_t)sub_10000DFF8, 0, isUniquelyReferenced_nonNull_native, &v9);
    *uint64_t v4 = v9;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  swift_beginAccess();
  uint64_t v7 = swift_bridgeObjectRetain();
  a3(v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100007BFC(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    unint64_t v10 = (Swift::Int *)(*(void *)(v1 + 48) + 16 * v9);
    Swift::Int v11 = *v10;
    Swift::Int v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_100009D54(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:

  return swift_release();
}

void sub_100007D7C(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void (*a5)(void *), uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v147 = a6;
  uint64_t v148 = a2;
  v149 = a5;
  uint64_t v11 = sub_10001E608();
  uint64_t v143 = *(void *)(v11 - 8);
  uint64_t v144 = v11;
  __chkstk_darwin(v11);
  v141 = (char *)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_10001E628();
  uint64_t v140 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  v139 = (char *)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004A08(&qword_100029448);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  v152 = (char *)&v132 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v153 = (char *)&v132 - v17;
  uint64_t v18 = sub_10001E638();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v21 = (uint64_t *)((char *)&v132 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  NSString v22 = *(void **)(v7 + 32);
  *id v21 = v22;
  (*(void (**)(void *, void, uint64_t))(v19 + 104))(v21, enum case for DispatchPredicate.onQueue(_:), v18);
  id v23 = v22;
  LOBYTE(v22) = sub_10001E648();
  (*(void (**)(void *, uint64_t))(v19 + 8))(v21, v18);
  if ((v22 & 1) == 0)
  {
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    swift_once();
    goto LABEL_10;
  }
  swift_beginAccess();
  sub_10000D3CC(a1);
  swift_endAccess();
  if (a3 >> 60 != 15 && !a4)
  {
    uint64_t v135 = v7;
    uint64_t v24 = self;
    sub_10000F998(v148, a3);
    unint64_t v136 = a3;
    Class isa = sub_10001E228().super.isa;
    *(void *)&long long aBlock = 0;
    id v26 = [v24 JSONObjectWithData:isa options:0 error:&aBlock];

    id v27 = (id)aBlock;
    if (!v26)
    {
      char v42 = v27;
      uint64_t v43 = sub_10001E1E8();

      swift_willThrow();
      if (qword_100029428 != -1) {
        goto LABEL_96;
      }
      goto LABEL_16;
    }
    sub_10001E8F8();
    swift_unknownObjectRelease();
    sub_10000FBF8((uint64_t)v161, (uint64_t)&aBlock);
    sub_100004A08(&qword_100029730);
    if (swift_dynamicCast())
    {
      uint64_t v28 = v156;
      uint64_t v155 = a1;
      if (*(void *)(v156 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v29 = sub_10000D574(0x73746C75736572, 0xE700000000000000);
        uint64_t v30 = (uint64_t)v153;
        if (v31)
        {
          sub_10000FBF8(*(void *)(v28 + 56) + 32 * v29, (uint64_t)&aBlock);
        }
        else
        {
          long long aBlock = 0u;
          long long v158 = 0u;
        }
      }
      else
      {
        long long aBlock = 0u;
        long long v158 = 0u;
        swift_bridgeObjectRetain();
        uint64_t v30 = (uint64_t)v153;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v158 + 1))
      {
        sub_100004A08(&qword_100029740);
        if (swift_dynamicCast())
        {
          uint64_t v62 = v156;
          uint64_t v63 = *(void *)(v156 + 16);
          if (v63)
          {
            uint64_t v64 = 0;
            a4 = &_swiftEmptyDictionarySingleton;
            uint64_t v133 = *(void *)(v156 + 16);
            uint64_t v134 = v156;
            while (1)
            {
              uint64_t v65 = *(void *)(v62 + 8 * v64 + 32);
              uint64_t v66 = swift_bridgeObjectRetain();
              uint64_t v67 = sub_10000FD60(v66, 0x6449656C646E7562, 0xE800000000000000);
              if (v68)
              {
                uint64_t v69 = v67;
                uint64_t v70 = v68;
                uint64_t v71 = sub_10000FD60(v65, 0x6D614E6B63617274, 0xE900000000000065);
                if (v72)
                {
                  v154 = a4;
                  int64_t v146 = v72;
                  uint64_t v150 = v71;
                  uint64_t v151 = v69;
                  uint64_t v73 = sub_10001E218();
                  uint64_t v74 = *(void *)(v73 - 8);
                  v145 = *(void (**)(void))(v74 + 56);
                  *(void *)&long long v138 = v74 + 56;
                  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v145)(v30, 1, 1, v73);
                  sub_10000FD60(v65, 0x556B726F77747261, 0xED00003030316C72);
                  uint64_t v76 = v75;
                  swift_bridgeObjectRelease();
                  if (v76)
                  {
                    uint64_t v77 = (uint64_t)v152;
                    sub_10001E208();
                    swift_bridgeObjectRelease();
                    sub_10000FCA4(v30, &qword_100029448);
                    sub_1000100D0(v77, v30);
                  }
                  type metadata accessor for AppInfo();
                  uint64_t v78 = swift_allocObject();
                  *(unsigned char *)(v78 + 16) = 3;
                  *(_OWORD *)(v78 + 40) = 0u;
                  *(_OWORD *)(v78 + 24) = 0u;
                  id v79 = v145;
                  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v145)(v78 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL, 1, 1, v73);
                  v137 = (char *)(v78 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL);
                  v79();
                  swift_beginAccess();
                  *(unsigned char *)(v78 + 16) = 2;
                  swift_beginAccess();
                  uint64_t v80 = v151;
                  *(void *)(v78 + 24) = v151;
                  uint64_t v30 = (uint64_t)v153;
                  *(void *)(v78 + 32) = v70;
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRelease();
                  swift_beginAccess();
                  *(void *)(v78 + 40) = v150;
                  *(void *)(v78 + 48) = v146;
                  swift_bridgeObjectRelease();
                  uint64_t v81 = (uint64_t)v137;
                  swift_beginAccess();
                  sub_100010068(v30, v81);
                  swift_endAccess();
                  swift_bridgeObjectRetain();
                  swift_retain();
                  uint64_t v82 = v154;
                  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  *(void *)&long long aBlock = v82;
                  sub_10000D9E8(v78, v80, v70, isUniquelyReferenced_nonNull_native);
                  a4 = (void *)aBlock;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  sub_1000120EC(v80, v70);
                  swift_release();
                  swift_bridgeObjectRelease();
                  sub_10000FCA4(v30, &qword_100029448);
                  swift_bridgeObjectRelease();
                  uint64_t v63 = v133;
                  uint64_t v62 = v134;
                  goto LABEL_38;
                }
                swift_bridgeObjectRelease();
              }
              swift_bridgeObjectRelease();
LABEL_38:
              if (v63 == ++v64)
              {
                swift_bridgeObjectRelease();
                a1 = v155;
                goto LABEL_49;
              }
            }
          }
          swift_bridgeObjectRelease();
          a4 = &_swiftEmptyDictionarySingleton;
LABEL_49:
          uint64_t v43 = 0;
          uint64_t v85 = *(void *)(a1 + 56);
          v145 = (void (*)(void))(a1 + 56);
          uint64_t v86 = 1 << *(unsigned char *)(a1 + 32);
          uint64_t v87 = -1;
          if (v86 < 64) {
            uint64_t v87 = ~(-1 << v86);
          }
          unint64_t v88 = v87 & v85;
          int64_t v146 = (unint64_t)(v86 + 63) >> 6;
          *(void *)&long long v84 = 136315138;
          long long v138 = v84;
          v137 = (char *)&type metadata for Any + 8;
          uint64_t v150 = a1;
          while (1)
          {
            if (v88)
            {
              uint64_t v151 = (v88 - 1) & v88;
              unint64_t v90 = __clz(__rbit64(v88)) | (v43 << 6);
            }
            else
            {
              int64_t v91 = v43 + 1;
              if (__OFADD__(v43, 1)) {
                goto LABEL_93;
              }
              if (v91 >= v146)
              {
LABEL_86:
                swift_release();
                goto LABEL_87;
              }
              unint64_t v92 = *((void *)v145 + v91);
              ++v43;
              if (!v92)
              {
                uint64_t v43 = v91 + 1;
                if (v91 + 1 >= v146) {
                  goto LABEL_86;
                }
                unint64_t v92 = *((void *)v145 + v43);
                if (!v92)
                {
                  uint64_t v43 = v91 + 2;
                  if (v91 + 2 >= v146) {
                    goto LABEL_86;
                  }
                  unint64_t v92 = *((void *)v145 + v43);
                  if (!v92)
                  {
                    int64_t v93 = v91 + 3;
                    if (v93 >= v146) {
                      goto LABEL_86;
                    }
                    unint64_t v92 = *((void *)v145 + v93);
                    if (!v92)
                    {
                      while (1)
                      {
                        uint64_t v43 = v93 + 1;
                        if (__OFADD__(v93, 1)) {
                          break;
                        }
                        if (v43 >= v146) {
                          goto LABEL_86;
                        }
                        unint64_t v92 = *((void *)v145 + v43);
                        ++v93;
                        if (v92) {
                          goto LABEL_69;
                        }
                      }
                      __break(1u);
LABEL_96:
                      swift_once();
LABEL_16:
                      uint64_t v44 = sub_10001E5F8();
                      sub_10000FABC(v44, (uint64_t)qword_100029E08);
                      swift_bridgeObjectRetain();
                      swift_errorRetain();
                      swift_bridgeObjectRetain();
                      swift_errorRetain();
                      Swift::String v45 = sub_10001E5D8();
                      os_log_type_t v46 = sub_10001E818();
                      if (os_log_type_enabled(v45, v46))
                      {
                        uint64_t v47 = swift_slowAlloc();
                        *(void *)&long long aBlock = swift_slowAlloc();
                        *(_DWORD *)uint64_t v47 = 136315394;
                        swift_bridgeObjectRetain();
                        uint64_t v48 = sub_10001E7E8();
                        unint64_t v50 = v49;
                        swift_bridgeObjectRelease();
                        v161[0] = sub_10001CFB0(v48, v50, (uint64_t *)&aBlock);
                        sub_10001E8D8();
                        swift_bridgeObjectRelease_n();
                        swift_bridgeObjectRelease();
                        *(_WORD *)(v47 + 12) = 2080;
                        v161[0] = v43;
                        swift_errorRetain();
                        sub_100004A08(&qword_100029BD0);
                        uint64_t v51 = sub_10001E6C8();
                        v161[0] = sub_10001CFB0(v51, v52, (uint64_t *)&aBlock);
                        sub_10001E8D8();
                        swift_bridgeObjectRelease();
                        swift_errorRelease();
                        swift_errorRelease();
                        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Failed to deserialize lookup for %s with error %s", (uint8_t *)v47, 0x16u);
                        swift_arrayDestroy();
                        swift_slowDealloc();
                        swift_slowDealloc();
                      }
                      else
                      {
                        swift_bridgeObjectRelease_n();
                        swift_errorRelease();
                        swift_errorRelease();
                      }

                      unint64_t v41 = v149;
                      if (v149)
                      {
                        swift_retain();
                        v41(&_swiftEmptyDictionarySingleton);
                        sub_10000FBE4(v148, v136);
                        swift_errorRelease();
LABEL_25:
                        sub_10000FAF4((uint64_t)v41);
                      }
                      else
                      {
                        sub_10000FBE4(v148, v136);
                        swift_errorRelease();
                      }
                      return;
                    }
                    uint64_t v43 = v93;
                  }
                }
              }
LABEL_69:
              uint64_t v151 = (v92 - 1) & v92;
              unint64_t v90 = __clz(__rbit64(v92)) + (v43 << 6);
            }
            v94 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v90);
            uint64_t v95 = *v94;
            unint64_t v96 = v94[1];
            uint64_t v97 = qword_100029428;
            swift_bridgeObjectRetain();
            if (v97 != -1) {
              swift_once();
            }
            uint64_t v98 = sub_10001E5F8();
            sub_10000FABC(v98, (uint64_t)qword_100029E08);
            swift_bridgeObjectRetain_n();
            uint64_t v99 = sub_10001E5D8();
            os_log_type_t v100 = sub_10001E818();
            BOOL v101 = os_log_type_enabled(v99, v100);
            v153 = (char *)v95;
            v154 = a4;
            v152 = (char *)v43;
            if (v101)
            {
              uint64_t v102 = swift_slowAlloc();
              *(void *)&long long aBlock = swift_slowAlloc();
              *(_DWORD *)uint64_t v102 = v138;
              swift_bridgeObjectRetain();
              *(void *)(v102 + 4) = sub_10001CFB0(v95, v96, (uint64_t *)&aBlock);
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v99, v100, "Failed to find app with bundle identifier %s", (uint8_t *)v102, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            type metadata accessor for AppInfo();
            uint64_t v103 = swift_allocObject();
            *(unsigned char *)(v103 + 16) = 3;
            *(_OWORD *)(v103 + 40) = 0u;
            *(_OWORD *)(v103 + 24) = 0u;
            uint64_t v104 = v103 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL;
            uint64_t v105 = sub_10001E218();
            uint64_t v106 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56);
            v106(v104, 1, 1, v105);
            v106(v103 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL, 1, 1, v105);
            swift_beginAccess();
            *(unsigned char *)(v103 + 16) = 2;
            swift_beginAccess();
            a4 = v153;
            *(void *)(v103 + 24) = v153;
            *(void *)(v103 + 32) = v96;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_beginAccess();
            *(void *)(v103 + 40) = a4;
            *(void *)(v103 + 48) = v96;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_retain();
            v107 = v154;
            char v108 = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long aBlock = v107;
            uint64_t v109 = v96;
            unint64_t v111 = sub_10000D574((uint64_t)a4, v96);
            uint64_t v112 = v107[2];
            BOOL v113 = (v110 & 1) == 0;
            uint64_t v114 = v112 + v113;
            if (__OFADD__(v112, v113))
            {
              __break(1u);
LABEL_91:
              __break(1u);
              goto LABEL_92;
            }
            char v115 = v110;
            v116 = a4;
            if (v107[3] >= v114)
            {
              a1 = v150;
              if (v108)
              {
                a4 = (void *)aBlock;
                if (v110) {
                  goto LABEL_52;
                }
              }
              else
              {
                sub_10000DB58();
                a4 = (void *)aBlock;
                if (v115) {
                  goto LABEL_52;
                }
              }
            }
            else
            {
              sub_10000D6D0(v114, v108);
              unint64_t v117 = sub_10000D574((uint64_t)a4, v109);
              a1 = v150;
              if ((v115 & 1) != (v118 & 1))
              {
                sub_10001EA18();
                __break(1u);
                return;
              }
              unint64_t v111 = v117;
              a4 = (void *)aBlock;
              if (v115)
              {
LABEL_52:
                uint64_t v89 = a4[7];
                swift_release();
                *(void *)(v89 + 8 * v111) = v103;
                goto LABEL_53;
              }
            }
            a4[(v111 >> 6) + 8] |= 1 << v111;
            v119 = (void *)(a4[6] + 16 * v111);
            void *v119 = v116;
            v119[1] = v109;
            *(void *)(a4[7] + 8 * v111) = v103;
            uint64_t v120 = a4[2];
            BOOL v121 = __OFADD__(v120, 1);
            uint64_t v122 = v120 + 1;
            if (v121) {
              goto LABEL_91;
            }
            a4[2] = v122;
            swift_bridgeObjectRetain();
LABEL_53:
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v88 = v151;
            uint64_t v43 = (uint64_t)v152;
          }
        }
      }
      else
      {
        sub_10000FCA4((uint64_t)&aBlock, &qword_100029738);
      }
      swift_bridgeObjectRelease();
      a4 = &_swiftEmptyDictionarySingleton;
LABEL_87:
      sub_10000543C();
      v123 = (void *)sub_10001E868();
      uint64_t v124 = swift_allocObject();
      swift_weakInit();
      v125 = (void *)swift_allocObject();
      v125[2] = v124;
      v125[3] = a4;
      uint64_t v126 = (uint64_t)v149;
      uint64_t v127 = v147;
      v125[4] = v149;
      v125[5] = v127;
      v159 = sub_10000FD54;
      v160 = v125;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v158 = sub_100006E5C;
      *((void *)&v158 + 1) = &unk_100024F90;
      v128 = _Block_copy(&aBlock);
      sub_10000FBD4(v126);
      swift_release();
      v129 = v139;
      sub_10001E618();
      *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
      sub_100006EB8((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100004A08(&qword_100029478);
      sub_10000FB04(&qword_100029C00, &qword_100029478);
      v130 = v141;
      uint64_t v131 = v144;
      sub_10001E908();
      sub_10001E888();
      sub_10000FBE4(v148, v136);
      _Block_release(v128);

      (*(void (**)(char *, uint64_t))(v143 + 8))(v130, v131);
      (*(void (**)(char *, uint64_t))(v140 + 8))(v129, v142);
    }
    else
    {
      if (qword_100029428 != -1) {
        swift_once();
      }
      uint64_t v53 = sub_10001E5F8();
      sub_10000FABC(v53, (uint64_t)qword_100029E08);
      swift_bridgeObjectRetain_n();
      uint64_t v54 = sub_10001E5D8();
      os_log_type_t v55 = sub_10001E818();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long aBlock = swift_slowAlloc();
        *(_DWORD *)v56 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v57 = sub_10001E7E8();
        unint64_t v59 = v58;
        swift_bridgeObjectRelease();
        uint64_t v156 = sub_10001CFB0(v57, v59, (uint64_t *)&aBlock);
        sub_10001E8D8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "Failed to deserialize lookup for %s", v56, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v60 = v149;
      unint64_t v61 = v136;
      if (!v149)
      {
        sub_10000FC54((uint64_t)v161);
        sub_10000FBE4(v148, v61);
        return;
      }
      swift_retain();
      v60(&_swiftEmptyDictionarySingleton);
      sub_10000FBE4(v148, v61);
      sub_10000FAF4((uint64_t)v60);
    }
    sub_10000FC54((uint64_t)v161);
    return;
  }
  if (qword_100029428 != -1) {
    goto LABEL_94;
  }
LABEL_10:
  uint64_t v32 = sub_10001E5F8();
  sub_10000FABC(v32, (uint64_t)qword_100029E08);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  Swift::Int v33 = sub_10001E5D8();
  os_log_type_t v34 = sub_10001E818();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = swift_slowAlloc();
    *(void *)&long long aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_10001E7E8();
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    v161[0] = sub_10001CFB0(v36, v38, (uint64_t *)&aBlock);
    sub_10001E8D8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    v161[0] = a4;
    swift_errorRetain();
    sub_100004A08(&qword_100029728);
    uint64_t v39 = sub_10001E6C8();
    v161[0] = sub_10001CFB0(v39, v40, (uint64_t *)&aBlock);
    sub_10001E8D8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to lookup bundle identifiers %s with error %s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  unint64_t v41 = v149;
  if (v149)
  {
    swift_retain();
    v41(&_swiftEmptyDictionarySingleton);
    goto LABEL_25;
  }
}

uint64_t sub_100009324(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    uint64_t v6 = (void *)sub_10001E238();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_10000FBE4((uint64_t)v6, v10);

  return swift_release();
}

uint64_t sub_1000093EC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10000949C(a2);
    if (a3)
    {
      swift_retain();
      a3(a2);
      swift_release();
      return sub_10000FAF4((uint64_t)a3);
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

void sub_10000949C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001E638();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000543C();
  *uint64_t v7 = sub_10001E868();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  char v8 = sub_10001E648();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0) {
    goto LABEL_25;
  }
  uint64_t v9 = a1 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a1 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v14 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v14 << 6);
      goto LABEL_6;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (v21 >= v13) {
      goto LABEL_22;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v14;
    if (!v22)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_22;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v14);
      if (!v22)
      {
        int64_t v14 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_22;
        }
        unint64_t v22 = *(void *)(v9 + 8 * v14);
        if (!v22) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v14 << 6);
LABEL_6:
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8 * v16);
    uint64_t v18 = *(void **)(v2 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    id v19 = v18;
    NSString v20 = sub_10001E688();
    swift_bridgeObjectRelease();
    [v19 setObject:v17 forKey:v20];
    swift_release();
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13)
  {
LABEL_22:
    swift_release();
    return;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v14 = v23;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v14 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v14 >= v13) {
      goto LABEL_22;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v14);
    ++v23;
    if (v22) {
      goto LABEL_21;
    }
  }
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
}

id *AppInfoCache.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t AppInfoCache.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_1000097B4@<X0>(void *a1@<X8>)
{
  if (qword_100029410 != -1) {
    swift_once();
  }
  *a1 = static AppInfoCache.shared;

  return swift_retain();
}

unsigned char *sub_100009820(uint64_t a1, uint64_t a2)
{
  return AppInfoCache.appInfo(bundleIdentifier:)(a1, a2);
}

id sub_100009844(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_10001E688();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_10001E1E8();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_100009920(uint64_t a1, uint64_t a2)
{
  return sub_100009C48(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100009938(uint64_t a1, id *a2)
{
  uint64_t result = sub_10001E698();
  *a2 = 0;
  return result;
}

uint64_t sub_1000099B0(uint64_t a1, id *a2)
{
  char v3 = sub_10001E6A8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100009A30@<X0>(void *a1@<X8>)
{
  sub_10001E6B8();
  NSString v2 = sub_10001E688();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100009A74()
{
  uint64_t v0 = sub_10001E6B8();
  uint64_t v2 = v1;
  if (v0 == sub_10001E6B8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10001E9F8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100009B00@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10001E688();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100009B48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001E6B8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009B74(uint64_t a1)
{
  uint64_t v2 = sub_100006EB8(&qword_1000296C0, type metadata accessor for _EXSceneRole);
  uint64_t v3 = sub_100006EB8(&qword_1000296C8, type metadata accessor for _EXSceneRole);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100009C30(uint64_t a1, uint64_t a2)
{
  return sub_100009C48(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100009C48(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10001E6B8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100009C8C()
{
  sub_10001E6B8();
  sub_10001E6D8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100009CE0()
{
  sub_10001E6B8();
  sub_10001EA68();
  sub_10001E6D8();
  Swift::Int v0 = sub_10001EA88();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100009D54(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10001EA68();
  swift_bridgeObjectRetain();
  sub_10001E6D8();
  Swift::Int v8 = sub_10001EA88();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10001E9F8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_10001E9F8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000B628(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100009F04(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10001E298();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_100006EB8(&qword_1000296E8, (void (*)(uint64_t))&type metadata accessor for UUID);
  swift_bridgeObjectRetain();
  Swift::Int v33 = a2;
  uint64_t v11 = sub_10001E668();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    int64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      NSString v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_100006EB8(&qword_1000296F0, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_10001E678();
      unint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      int64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    int64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_10000B7C4((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_10000A228(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *v3;
  sub_10001EA68();
  swift_bridgeObjectRetain();
  sub_10001E248();
  Swift::Int v7 = sub_10001EA88();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  uint64_t v10 = v6 + 56;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_116:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)__s1 = *(void *)v81;
    *(void *)uint64_t v81 = 0x8000000000000000;
    sub_10000F998(a2, a3);
    sub_10000BA64(a2, a3, v9, isUniquelyReferenced_nonNull_native);
    *(void *)uint64_t v81 = *(void *)__s1;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
  uint64_t v86 = ~v8;
  unint64_t v11 = a3 >> 62;
  BOOL v12 = __OFSUB__(HIDWORD(a2), a2);
  BOOL v84 = v12;
  uint64_t v83 = v6;
  size_t __n = BYTE6(a3);
  uint64_t v85 = v6 + 56;
  uint64_t v79 = (a2 >> 32) - (int)a2;
  uint64_t v80 = a2 >> 32;
  unint64_t v78 = a3;
  while (2)
  {
    unint64_t v13 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v9);
    uint64_t v14 = *v13;
    unint64_t v15 = v13[1];
    uint64_t v16 = 0;
    switch(v15 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v14), v14))
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
        }
        uint64_t v16 = HIDWORD(v14) - (int)v14;
LABEL_14:
        sub_10000F998(v14, v15);
        break;
      case 2uLL:
        uint64_t v18 = *(void *)(v14 + 16);
        uint64_t v17 = *(void *)(v14 + 24);
        uint64_t v16 = v17 - v18;
        if (!__OFSUB__(v17, v18)) {
          goto LABEL_14;
        }
        goto LABEL_120;
      case 3uLL:
        break;
      default:
        uint64_t v16 = BYTE6(v15);
        break;
    }
    size_t v19 = __n;
    switch((int)v11)
    {
      case 1:
        size_t v19 = HIDWORD(a2) - (int)a2;
        if (v84) {
          goto LABEL_121;
        }
        goto LABEL_19;
      case 2:
        uint64_t v21 = *(void *)(a2 + 16);
        uint64_t v20 = *(void *)(a2 + 24);
        BOOL v22 = __OFSUB__(v20, v21);
        size_t v19 = v20 - v21;
        if (!v22) {
          goto LABEL_19;
        }
        goto LABEL_122;
      case 3:
        if (v16) {
          goto LABEL_7;
        }
        goto LABEL_117;
      default:
LABEL_19:
        if (v16 != v19)
        {
LABEL_7:
          sub_10000F9F0(v14, v15);
          goto LABEL_8;
        }
        if (v16 >= 1)
        {
          switch(v15 >> 62)
          {
            case 1uLL:
              if ((int)v14 > v14 >> 32) {
                goto LABEL_123;
              }
              uint64_t v27 = (char *)sub_10001E1A8();
              if (!v27) {
                goto LABEL_33;
              }
              uint64_t v28 = sub_10001E1C8();
              if (__OFSUB__((int)v14, v28)) {
                goto LABEL_125;
              }
              v27 += (int)v14 - v28;
LABEL_33:
              sub_10001E1B8();
              uint64_t v10 = v85;
              if (v11)
              {
                if (v11 == 1)
                {
                  if (v80 < (int)a2) {
                    goto LABEL_134;
                  }
                  swift_retain();
                  uint64_t v29 = (char *)sub_10001E1A8();
                  if (v29)
                  {
                    uint64_t v30 = sub_10001E1C8();
                    if (__OFSUB__((int)a2, v30)) {
                      goto LABEL_141;
                    }
                    v29 += (int)a2 - v30;
                  }
                  uint64_t v31 = sub_10001E1B8();
                  size_t v32 = (a2 >> 32) - (int)a2;
                  if (v31 < v79) {
                    size_t v32 = v31;
                  }
                  if (!v27) {
                    goto LABEL_143;
                  }
                  if (!v29) {
                    goto LABEL_144;
                  }
                  int v33 = memcmp(v27, v29, v32);
                  sub_10000F9F0(a2, a3);
                }
                else
                {
                  uint64_t v66 = *(void *)(a2 + 16);
                  uint64_t v65 = *(void *)(a2 + 24);
                  swift_retain();
                  swift_retain();
                  uint64_t v67 = (char *)sub_10001E1A8();
                  if (v67)
                  {
                    uint64_t v68 = sub_10001E1C8();
                    if (__OFSUB__(v66, v68)) {
                      goto LABEL_140;
                    }
                    v67 += v66 - v68;
                  }
                  BOOL v22 = __OFSUB__(v65, v66);
                  int64_t v69 = v65 - v66;
                  if (v22) {
                    goto LABEL_135;
                  }
                  uint64_t v70 = sub_10001E1B8();
                  if (v70 >= v69) {
                    size_t v71 = v69;
                  }
                  else {
                    size_t v71 = v70;
                  }
                  if (!v27) {
                    goto LABEL_154;
                  }
                  a3 = v78;
                  uint64_t v6 = v83;
                  if (!v67) {
                    goto LABEL_155;
                  }
                  int v33 = memcmp(v27, v67, v71);
                  swift_release();
LABEL_112:
                  swift_release();
                }
                sub_10000F9F0(v14, v15);
LABEL_114:
                uint64_t v10 = v85;
                if (!v33) {
                  goto LABEL_118;
                }
              }
              else
              {
                *(void *)__s1 = a2;
                *(_WORD *)&__s1[8] = a3;
                __s1[10] = BYTE2(a3);
                __s1[11] = BYTE3(a3);
                __s1[12] = BYTE4(a3);
                __s1[13] = BYTE5(a3);
                if (!v27) {
                  goto LABEL_153;
                }
                uint64_t v47 = (uint64_t *)__s1;
                os_log_type_t v46 = v27;
LABEL_99:
                int v45 = memcmp(v46, v47, __n);
LABEL_100:
                sub_10000F9F0(v14, v15);
                if (!v45) {
                  goto LABEL_118;
                }
              }
              break;
            case 2uLL:
              uint64_t v34 = *(void *)(v14 + 16);
              swift_retain();
              swift_retain();
              uint64_t v35 = (char *)sub_10001E1A8();
              if (!v35) {
                goto LABEL_47;
              }
              uint64_t v36 = sub_10001E1C8();
              if (__OFSUB__(v34, v36)) {
                goto LABEL_124;
              }
              v35 += v34 - v36;
LABEL_47:
              sub_10001E1B8();
              uint64_t v6 = v83;
              if (!v11)
              {
                *(void *)__s1 = a2;
                *(_WORD *)&__s1[8] = a3;
                __s1[10] = BYTE2(a3);
                __s1[11] = BYTE3(a3);
                __s1[12] = BYTE4(a3);
                __s1[13] = BYTE5(a3);
                if (!v35) {
                  goto LABEL_150;
                }
                int v33 = memcmp(v35, __s1, __n);
                swift_release();
                goto LABEL_112;
              }
              if (v11 == 1)
              {
                if (v80 < (int)a2) {
                  goto LABEL_128;
                }
                swift_retain();
                unint64_t v37 = (char *)sub_10001E1A8();
                if (v37)
                {
                  uint64_t v38 = sub_10001E1C8();
                  if (__OFSUB__((int)a2, v38)) {
                    goto LABEL_139;
                  }
                  v37 += (int)a2 - v38;
                }
                uint64_t v39 = sub_10001E1B8();
                size_t v40 = (a2 >> 32) - (int)a2;
                if (v39 < v79) {
                  size_t v40 = v39;
                }
                if (!v35) {
                  goto LABEL_145;
                }
                if (!v37) {
                  goto LABEL_146;
                }
                int v33 = memcmp(v35, v37, v40);
                sub_10000F9F0(a2, a3);
                swift_release();
              }
              else
              {
                uint64_t v59 = *(void *)(a2 + 16);
                uint64_t v77 = *(void *)(a2 + 24);
                swift_retain();
                swift_retain();
                uint64_t v60 = (char *)sub_10001E1A8();
                if (v60)
                {
                  uint64_t v61 = sub_10001E1C8();
                  if (__OFSUB__(v59, v61)) {
                    goto LABEL_138;
                  }
                  v60 += v59 - v61;
                }
                BOOL v22 = __OFSUB__(v77, v59);
                int64_t v62 = v77 - v59;
                if (v22) {
                  goto LABEL_133;
                }
                uint64_t v63 = sub_10001E1B8();
                if (v63 >= v62) {
                  size_t v64 = v62;
                }
                else {
                  size_t v64 = v63;
                }
                if (!v35) {
                  goto LABEL_151;
                }
                a3 = v78;
                if (!v60) {
                  goto LABEL_152;
                }
                int v33 = memcmp(v35, v60, v64);
                swift_release();
                swift_release();
                swift_release();
              }
              swift_release();
              sub_10000F9F0(v14, v15);
              uint64_t v6 = v83;
              goto LABEL_114;
            case 3uLL:
              *(void *)&__s1[6] = 0;
              *(void *)__s1 = 0;
              if (!v11) {
                goto LABEL_67;
              }
              if (v11 == 1)
              {
                if (v80 < (int)a2) {
                  goto LABEL_127;
                }
                swift_retain();
                uint64_t v41 = sub_10001E1A8();
                if (!v41) {
                  goto LABEL_147;
                }
                uint64_t v24 = v41;
                uint64_t v42 = sub_10001E1C8();
                uint64_t v26 = (int)a2 - v42;
                if (__OFSUB__((int)a2, v42)) {
                  goto LABEL_132;
                }
LABEL_63:
                uint64_t v43 = sub_10001E1B8();
                if (v43 >= v79) {
                  size_t v44 = (a2 >> 32) - (int)a2;
                }
                else {
                  size_t v44 = v43;
                }
                int v45 = memcmp(__s1, (const void *)(v24 + v26), v44);
                a3 = v78;
                sub_10000F9F0(a2, v78);
                goto LABEL_100;
              }
              uint64_t v54 = *(void *)(a2 + 16);
              uint64_t v55 = *(void *)(a2 + 24);
              swift_retain();
              swift_retain();
              unint64_t v50 = (char *)sub_10001E1A8();
              if (v50)
              {
                uint64_t v56 = sub_10001E1C8();
                if (__OFSUB__(v54, v56)) {
                  goto LABEL_137;
                }
                v50 += v54 - v56;
              }
              BOOL v22 = __OFSUB__(v55, v54);
              int64_t v52 = v55 - v54;
              if (v22) {
                goto LABEL_130;
              }
              uint64_t v53 = sub_10001E1B8();
              if (!v50) {
                goto LABEL_149;
              }
LABEL_79:
              if (v53 >= v52) {
                size_t v57 = v52;
              }
              else {
                size_t v57 = v53;
              }
              int v58 = memcmp(__s1, v50, v57);
              swift_release();
              swift_release();
              sub_10000F9F0(v14, v15);
              uint64_t v6 = v83;
              uint64_t v10 = v85;
              if (!v58) {
                goto LABEL_118;
              }
              break;
            default:
              *(void *)__s1 = v14;
              *(_WORD *)&__s1[8] = v15;
              __s1[10] = BYTE2(v15);
              __s1[11] = BYTE3(v15);
              __s1[12] = BYTE4(v15);
              __s1[13] = BYTE5(v15);
              if (!v11)
              {
LABEL_67:
                uint64_t v88 = a2;
                __int16 v89 = a3;
                char v90 = BYTE2(a3);
                char v91 = BYTE3(a3);
                char v92 = BYTE4(a3);
                char v93 = BYTE5(a3);
                os_log_type_t v46 = __s1;
                uint64_t v47 = &v88;
                goto LABEL_99;
              }
              if (v11 == 1)
              {
                if (v80 < (int)a2) {
                  goto LABEL_126;
                }
                swift_retain();
                uint64_t v23 = sub_10001E1A8();
                if (!v23)
                {
                  sub_10001E1B8();
                  __break(1u);
LABEL_143:
                  __break(1u);
LABEL_144:
                  __break(1u);
LABEL_145:
                  __break(1u);
LABEL_146:
                  __break(1u);
LABEL_147:
                  sub_10001E1B8();
                  __break(1u);
LABEL_148:
                  __break(1u);
LABEL_149:
                  __break(1u);
LABEL_150:
                  __break(1u);
LABEL_151:
                  __break(1u);
LABEL_152:
                  __break(1u);
LABEL_153:
                  __break(1u);
LABEL_154:
                  __break(1u);
LABEL_155:
                  __break(1u);
                  JUMPOUT(0x10000AC3CLL);
                }
                uint64_t v24 = v23;
                uint64_t v25 = sub_10001E1C8();
                uint64_t v26 = (int)a2 - v25;
                if (__OFSUB__((int)a2, v25)) {
                  goto LABEL_131;
                }
                goto LABEL_63;
              }
              uint64_t v48 = *(void *)(a2 + 16);
              uint64_t v49 = *(void *)(a2 + 24);
              swift_retain();
              swift_retain();
              unint64_t v50 = (char *)sub_10001E1A8();
              if (v50)
              {
                uint64_t v51 = sub_10001E1C8();
                if (__OFSUB__(v48, v51)) {
                  goto LABEL_136;
                }
                v50 += v48 - v51;
              }
              BOOL v22 = __OFSUB__(v49, v48);
              int64_t v52 = v49 - v48;
              if (v22) {
                goto LABEL_129;
              }
              uint64_t v53 = sub_10001E1B8();
              if (!v50) {
                goto LABEL_148;
              }
              goto LABEL_79;
          }
LABEL_8:
          unint64_t v9 = (v9 + 1) & v86;
          if (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
            goto LABEL_116;
          }
          continue;
        }
LABEL_117:
        sub_10000F9F0(v14, v15);
LABEL_118:
        swift_bridgeObjectRelease();
        sub_10000F9F0(a2, a3);
        uint64_t v74 = (uint64_t *)(*(void *)(*(void *)v81 + 48) + 16 * v9);
        uint64_t v75 = *v74;
        unint64_t v76 = v74[1];
        *a1 = *v74;
        a1[1] = v76;
        sub_10000F998(v75, v76);
        return 0;
    }
  }
}

uint64_t sub_10000AC6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004A08(&qword_100029748);
  uint64_t v3 = sub_10001E938();
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
      size_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_10001EA68();
      sub_10001E6D8();
      uint64_t result = sub_10001EA88();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_10000AF4C()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_10001E298();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_100004A08(&qword_1000296E0);
  uint64_t v5 = sub_10001E938();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_100006EB8(&qword_1000296E8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = sub_10001E668();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_10000B348()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004A08(&qword_1000296D8);
  uint64_t v3 = sub_10001E938();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                  *char v30 = -1 << v29;
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
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_10001EA68();
      sub_10001E248();
      uint64_t result = sub_10001EA88();
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
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10000B628(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_10000AC6C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000C4AC();
      goto LABEL_22;
    }
    sub_10000CAB8();
  }
  uint64_t v11 = *v4;
  sub_10001EA68();
  sub_10001E6D8();
  uint64_t result = sub_10001EA88();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10001E9F8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10001EA08();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_10001E9F8();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

uint64_t sub_10000B7C4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_10001E298();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_10000AF4C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_10000C660();
      goto LABEL_12;
    }
    sub_10000CD68();
  }
  uint64_t v12 = *v3;
  sub_100006EB8(&qword_1000296E8, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = sub_10001E668();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_100006EB8(&qword_1000296F0, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_10001E678();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_10001EA08();
  __break(1u);
  return result;
}

Swift::Int sub_10000BA64(Swift::Int result, unint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 <= v9 || (a4 & 1) == 0)
  {
    if (a4)
    {
      sub_10000B348();
    }
    else
    {
      if (v10 > v9)
      {
        uint64_t result = (Swift::Int)sub_10000C904();
        goto LABEL_125;
      }
      sub_10000D118();
    }
    uint64_t v11 = *v4;
    sub_10001EA68();
    sub_10001E248();
    uint64_t result = sub_10001EA88();
    uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
    a3 = result & ~v12;
    uint64_t v13 = v11 + 56;
    if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
    {
      uint64_t v92 = ~v12;
      uint64_t v88 = v11;
      unint64_t v90 = a2 >> 62;
      BOOL v14 = __OFSUB__(HIDWORD(v8), v8);
      BOOL v89 = v14;
      uint64_t v91 = v11 + 56;
      uint64_t v86 = v4;
      uint64_t v87 = v8 >> 32;
      uint64_t v85 = (v8 >> 32) - (int)v8;
      do
      {
        uint64_t v15 = (uint64_t *)(*(void *)(v11 + 48) + 16 * a3);
        uint64_t v17 = *v15;
        unint64_t v16 = v15[1];
        uint64_t v18 = 0;
        switch(v16 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(v17), v17))
            {
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
              goto LABEL_131;
            }
            uint64_t v18 = HIDWORD(v17) - (int)v17;
LABEL_21:
            sub_10000F998(v17, v16);
LABEL_22:
            uint64_t v21 = BYTE6(a2);
            switch(a2 >> 62)
            {
              case 1uLL:
                uint64_t v21 = HIDWORD(v8) - (int)v8;
                if (v89) {
                  goto LABEL_129;
                }
                goto LABEL_26;
              case 2uLL:
                uint64_t v23 = *(void *)(v8 + 16);
                uint64_t v22 = *(void *)(v8 + 24);
                BOOL v24 = __OFSUB__(v22, v23);
                uint64_t v21 = v22 - v23;
                if (!v24) {
                  goto LABEL_26;
                }
                goto LABEL_130;
              case 3uLL:
                if (v18) {
                  goto LABEL_14;
                }
                goto LABEL_165;
              default:
LABEL_26:
                if (v18 != v21)
                {
LABEL_14:
                  uint64_t result = sub_10000F9F0(v17, v16);
                  goto LABEL_15;
                }
                if (v18 < 1) {
                  goto LABEL_165;
                }
                break;
            }
            break;
          case 2uLL:
            uint64_t v20 = *(void *)(v17 + 16);
            uint64_t v19 = *(void *)(v17 + 24);
            uint64_t v18 = v19 - v20;
            if (!__OFSUB__(v19, v20)) {
              goto LABEL_21;
            }
            goto LABEL_128;
          case 3uLL:
            goto LABEL_22;
          default:
            uint64_t v18 = BYTE6(v16);
            goto LABEL_22;
        }
        switch(v16 >> 62)
        {
          case 1uLL:
            if ((int)v17 > v17 >> 32) {
              goto LABEL_132;
            }
            int64_t v40 = (unsigned char *)sub_10001E1A8();
            if (!v40) {
              goto LABEL_52;
            }
            uint64_t v41 = sub_10001E1C8();
            if (__OFSUB__((int)v17, v41)) {
              goto LABEL_134;
            }
            v40 += (int)v17 - v41;
LABEL_52:
            sub_10001E1B8();
            uint64_t v13 = v91;
            if (!v90)
            {
              *(void *)__s1 = v8;
              *(_WORD *)&__s1[8] = a2;
              __s1[10] = BYTE2(a2);
              __s1[11] = BYTE3(a2);
              __s1[12] = BYTE4(a2);
              __s1[13] = BYTE5(a2);
              if (!v40) {
                goto LABEL_160;
              }
              uint64_t v48 = (uint64_t *)__s1;
              uint64_t v47 = v40;
LABEL_110:
              int v71 = memcmp(v47, v48, BYTE6(a2));
              uint64_t result = sub_10000F9F0(v17, v16);
              if (!v71) {
                goto LABEL_166;
              }
              break;
            }
            if (v90 == 1)
            {
              if (v87 < (int)v8) {
                goto LABEL_143;
              }
              swift_retain();
              uint64_t v42 = sub_10001E1A8();
              if (v42)
              {
                uint64_t v43 = sub_10001E1C8();
                if (__OFSUB__((int)v8, v43)) {
                  goto LABEL_150;
                }
                v42 += (int)v8 - v43;
              }
              uint64_t v44 = sub_10001E1B8();
              uint64_t v45 = (v8 >> 32) - (int)v8;
              if (v44 < v85) {
                uint64_t v45 = v44;
              }
              if (!v40) {
                goto LABEL_153;
              }
              if (!v42) {
                goto LABEL_154;
              }
              size_t v38 = v45;
              uint64_t v39 = v40;
              unint64_t v37 = (const void *)v42;
              goto LABEL_63;
            }
            uint64_t v72 = *(void *)(v8 + 16);
            uint64_t v84 = *(void *)(v8 + 24);
            swift_retain();
            swift_retain();
            uint64_t v73 = sub_10001E1A8();
            if (v73)
            {
              uint64_t v74 = v73;
              uint64_t v75 = sub_10001E1C8();
              if (__OFSUB__(v72, v75)) {
                goto LABEL_149;
              }
              unint64_t v76 = (const void *)(v74 + v72 - v75);
            }
            else
            {
              unint64_t v76 = 0;
            }
            if (__OFSUB__(v84, v72)) {
              goto LABEL_144;
            }
            uint64_t v77 = sub_10001E1B8();
            if (v77 >= v84 - v72) {
              size_t v78 = v84 - v72;
            }
            else {
              size_t v78 = v77;
            }
            uint64_t v11 = v88;
            if (!v40) {
              goto LABEL_163;
            }
            uint64_t v13 = v91;
            if (!v76) {
              goto LABEL_164;
            }
            int v64 = memcmp(v40, v76, v78);
            swift_release();
LABEL_123:
            swift_release();
            uint64_t result = sub_10000F9F0(v17, v16);
            uint64_t v5 = v86;
            if (!v64) {
              goto LABEL_166;
            }
            break;
          case 2uLL:
            uint64_t v29 = *(void *)(v17 + 16);
            swift_retain();
            swift_retain();
            uint64_t v30 = sub_10001E1A8();
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = sub_10001E1C8();
              if (__OFSUB__(v29, v32)) {
                goto LABEL_133;
              }
              uint64_t v33 = (const void *)(v31 + v29 - v32);
            }
            else
            {
              uint64_t v33 = 0;
            }
            sub_10001E1B8();
            uint64_t v11 = v88;
            uint64_t v13 = v91;
            if (v90)
            {
              if (v90 == 1)
              {
                if (v87 < (int)v8) {
                  goto LABEL_137;
                }
                swift_retain();
                uint64_t v49 = (char *)sub_10001E1A8();
                if (v49)
                {
                  uint64_t v50 = sub_10001E1C8();
                  if (__OFSUB__((int)v8, v50)) {
                    goto LABEL_148;
                  }
                  v49 += (int)v8 - v50;
                }
                uint64_t v51 = sub_10001E1B8();
                size_t v52 = (v8 >> 32) - (int)v8;
                if (v51 < v85) {
                  size_t v52 = v51;
                }
                if (!v33) {
                  goto LABEL_155;
                }
                if (!v49) {
                  goto LABEL_156;
                }
                int v46 = memcmp(v33, v49, v52);
                sub_10000F9F0(v8, a2);
                swift_release();
              }
              else
              {
                uint64_t v65 = *(void *)(v8 + 16);
                uint64_t v83 = *(void *)(v8 + 24);
                swift_retain();
                swift_retain();
                uint64_t v66 = (char *)sub_10001E1A8();
                if (v66)
                {
                  uint64_t v67 = sub_10001E1C8();
                  if (__OFSUB__(v65, v67)) {
                    goto LABEL_147;
                  }
                  v66 += v65 - v67;
                }
                BOOL v24 = __OFSUB__(v83, v65);
                int64_t v68 = v83 - v65;
                if (v24) {
                  goto LABEL_142;
                }
                uint64_t v69 = sub_10001E1B8();
                if (v69 >= v68) {
                  size_t v70 = v68;
                }
                else {
                  size_t v70 = v69;
                }
                if (!v33) {
                  goto LABEL_161;
                }
                uint64_t v11 = v88;
                if (!v66) {
                  goto LABEL_162;
                }
                int v46 = memcmp(v33, v66, v70);
                swift_release();
                swift_release();
                swift_release();
              }
              swift_release();
              uint64_t result = sub_10000F9F0(v17, v16);
              uint64_t v5 = v86;
              goto LABEL_106;
            }
            *(void *)__s1 = v8;
            *(_WORD *)&__s1[8] = a2;
            __s1[10] = BYTE2(a2);
            __s1[11] = BYTE3(a2);
            __s1[12] = BYTE4(a2);
            __s1[13] = BYTE5(a2);
            if (!v33) {
              goto LABEL_159;
            }
            int v64 = memcmp(v33, __s1, BYTE6(a2));
            swift_release();
            goto LABEL_123;
          case 3uLL:
            *(void *)&__s1[6] = 0;
            *(void *)__s1 = 0;
            if (!v90) {
              goto LABEL_64;
            }
            if (v90 == 1)
            {
              if (v87 < (int)v8) {
                goto LABEL_136;
              }
              swift_retain();
              uint64_t v34 = sub_10001E1A8();
              if (!v34) {
                goto LABEL_152;
              }
              uint64_t v26 = v34;
              uint64_t v35 = sub_10001E1C8();
              uint64_t v28 = (int)v8 - v35;
              if (__OFSUB__((int)v8, v35)) {
                goto LABEL_141;
              }
              goto LABEL_44;
            }
            uint64_t v59 = *(void *)(v8 + 16);
            uint64_t v60 = *(void *)(v8 + 24);
            swift_retain();
            swift_retain();
            uint64_t v55 = (char *)sub_10001E1A8();
            if (v55)
            {
              uint64_t v61 = sub_10001E1C8();
              if (__OFSUB__(v59, v61)) {
                goto LABEL_146;
              }
              v55 += v59 - v61;
            }
            BOOL v24 = __OFSUB__(v60, v59);
            int64_t v57 = v60 - v59;
            if (v24) {
              goto LABEL_139;
            }
            uint64_t v58 = sub_10001E1B8();
            uint64_t v11 = v88;
            if (!v55) {
              goto LABEL_158;
            }
            goto LABEL_88;
          default:
            *(void *)__s1 = v17;
            *(_WORD *)&__s1[8] = v16;
            __s1[10] = BYTE2(v16);
            __s1[11] = BYTE3(v16);
            __s1[12] = BYTE4(v16);
            __s1[13] = BYTE5(v16);
            if (!v90)
            {
LABEL_64:
              uint64_t v93 = v8;
              __int16 v94 = a2;
              char v95 = BYTE2(a2);
              char v96 = BYTE3(a2);
              char v97 = BYTE4(a2);
              char v98 = BYTE5(a2);
              uint64_t v47 = __s1;
              uint64_t v48 = &v93;
              goto LABEL_110;
            }
            if (v90 == 1)
            {
              if (v87 < (int)v8) {
                goto LABEL_135;
              }
              swift_retain();
              uint64_t v25 = sub_10001E1A8();
              if (!v25)
              {
                sub_10001E1B8();
                __break(1u);
LABEL_152:
                sub_10001E1B8();
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
LABEL_159:
                __break(1u);
LABEL_160:
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                sub_10000F9F0(v17, v16);
LABEL_166:
                sub_10001EA08();
                __break(1u);
                JUMPOUT(0x10000C47CLL);
              }
              uint64_t v26 = v25;
              uint64_t v27 = sub_10001E1C8();
              uint64_t v28 = (int)v8 - v27;
              if (__OFSUB__((int)v8, v27)) {
                goto LABEL_140;
              }
LABEL_44:
              uint64_t v36 = sub_10001E1B8();
              unint64_t v37 = (const void *)(v26 + v28);
              if (v36 >= v85) {
                size_t v38 = (v8 >> 32) - (int)v8;
              }
              else {
                size_t v38 = v36;
              }
              uint64_t v39 = __s1;
LABEL_63:
              int v46 = memcmp(v39, v37, v38);
              sub_10000F9F0(v8, a2);
              uint64_t result = sub_10000F9F0(v17, v16);
LABEL_106:
              uint64_t v13 = v91;
              if (!v46) {
                goto LABEL_166;
              }
              break;
            }
            uint64_t v53 = *(void *)(v8 + 16);
            uint64_t v54 = *(void *)(v8 + 24);
            swift_retain();
            swift_retain();
            uint64_t v55 = (char *)sub_10001E1A8();
            if (v55)
            {
              uint64_t v56 = sub_10001E1C8();
              if (__OFSUB__(v53, v56)) {
                goto LABEL_145;
              }
              v55 += v53 - v56;
            }
            BOOL v24 = __OFSUB__(v54, v53);
            int64_t v57 = v54 - v53;
            if (v24) {
              goto LABEL_138;
            }
            uint64_t v58 = sub_10001E1B8();
            uint64_t v11 = v88;
            if (!v55) {
              goto LABEL_157;
            }
LABEL_88:
            if (v58 >= v57) {
              size_t v62 = v57;
            }
            else {
              size_t v62 = v58;
            }
            int v63 = memcmp(__s1, v55, v62);
            swift_release();
            swift_release();
            uint64_t result = sub_10000F9F0(v17, v16);
            uint64_t v13 = v91;
            if (!v63) {
              goto LABEL_166;
            }
            break;
        }
LABEL_15:
        a3 = (a3 + 1) & v92;
      }
      while (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
    }
  }
LABEL_125:
  uint64_t v79 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v80 = (uint64_t *)(*(void *)(v79 + 48) + 16 * a3);
  *uint64_t v80 = v8;
  v80[1] = a2;
  uint64_t v81 = *(void *)(v79 + 16);
  BOOL v24 = __OFADD__(v81, 1);
  uint64_t v82 = v81 + 1;
  if (v24)
  {
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
  }
  *(void *)(v79 + 16) = v82;
  return result;
}

void *sub_10000C4AC()
{
  uint64_t v1 = v0;
  sub_100004A08(&qword_100029748);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001E928();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    *uint64_t v19 = *v17;
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

void *sub_10000C660()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10001E298();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004A08(&qword_1000296E0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_10001E928();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  int64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_10000C904()
{
  uint64_t v1 = v0;
  sub_100004A08(&qword_1000296D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001E928();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    long long v17 = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t result = (void *)sub_10000F998(v17, *((unint64_t *)&v17 + 1));
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000CAB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004A08(&qword_100029748);
  uint64_t v3 = sub_10001E938();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_10001EA68();
    swift_bridgeObjectRetain();
    sub_10001E6D8();
    uint64_t result = sub_10001EA88();
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
    void *v13 = v20;
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

uint64_t sub_10000CD68()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10001E298();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100004A08(&qword_1000296E0);
  uint64_t v7 = sub_10001E938();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_100006EB8(&qword_1000296E8, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_10001E668();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000D118()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004A08(&qword_1000296D8);
  uint64_t v3 = sub_10001E938();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    unint64_t v21 = v19[1];
    sub_10001EA68();
    sub_10000F998(v20, v21);
    sub_10001E248();
    uint64_t result = sub_10001EA88();
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
    uint64_t v13 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
    uint64_t *v13 = v20;
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

uint64_t sub_10000D3CC(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    int64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1000120EC(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

unint64_t sub_10000D574(uint64_t a1, uint64_t a2)
{
  sub_10001EA68();
  sub_10001E6D8();
  Swift::Int v4 = sub_10001EA88();

  return sub_10000D5EC(a1, a2, v4);
}

unint64_t sub_10000D5EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001E9F8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001E9F8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000D6D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004A08(&qword_100029750);
  char v36 = a2;
  uint64_t v6 = sub_10001E9B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_10001EA68();
    sub_10001E6D8();
    uint64_t result = sub_10001EA88();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_10000D9E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000D574(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10000DB58();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000D6D0(v15, a4 & 1);
  unint64_t v21 = sub_10000D574(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_10001EA18();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

void *sub_10000DB58()
{
  uint64_t v1 = v0;
  sub_100004A08(&qword_100029750);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001E9A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000DD10(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_10000E040();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  int64_t v13 = (void *)*a5;
  unint64_t v15 = sub_10000D574(v7, v8);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v19 = v14;
  if (v13[3] >= v18)
  {
    if (a4)
    {
      int64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_10000DB58();
      int64_t v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    int64_t v24 = (uint64_t *)(v22[6] + 16 * v15);
    *int64_t v24 = v10;
    v24[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v25 = v22[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v27;
LABEL_13:
    uint64_t v28 = sub_10000E040();
    if (v29)
    {
      uint64_t v31 = v28;
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      do
      {
        uint64_t v37 = (void *)*a5;
        unint64_t v39 = sub_10000D574(v31, v32);
        uint64_t v40 = v37[2];
        BOOL v41 = (v38 & 1) == 0;
        uint64_t v42 = v40 + v41;
        if (__OFADD__(v40, v41)) {
          goto LABEL_25;
        }
        char v43 = v38;
        if (v37[3] < v42)
        {
          sub_10000D6D0(v42, 1);
          unint64_t v44 = sub_10000D574(v31, v32);
          if ((v43 & 1) != (v45 & 1)) {
            goto LABEL_27;
          }
          unint64_t v39 = v44;
        }
        int v46 = (void *)*a5;
        if (v43)
        {
          swift_bridgeObjectRelease();
          uint64_t v34 = v46[7];
          swift_release();
          *(void *)(v34 + 8 * v39) = v33;
        }
        else
        {
          v46[(v39 >> 6) + 8] |= 1 << v39;
          uint64_t v47 = (uint64_t *)(v46[6] + 16 * v39);
          *uint64_t v47 = v31;
          v47[1] = v32;
          *(void *)(v46[7] + 8 * v39) = v33;
          uint64_t v48 = v46[2];
          BOOL v26 = __OFADD__(v48, 1);
          uint64_t v49 = v48 + 1;
          if (v26) {
            goto LABEL_26;
          }
          v46[2] = v49;
        }
        uint64_t v31 = sub_10000E040();
        uint64_t v32 = v35;
        uint64_t v33 = v36;
      }
      while (v35);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100010138();
    return swift_release();
  }
  sub_10000D6D0(v18, a4 & 1);
  unint64_t v20 = sub_10000D574(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    int64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v23 = v22[7];
    swift_release();
    *(void *)(v23 + 8 * v15) = v12;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_10001EA18();
  __break(1u);
  return result;
}

uint64_t sub_10000DFF8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_10000E040()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    v11(&v19, v20);
    swift_release();
    swift_bridgeObjectRelease();
    return v19;
  }
  int64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          int64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            int64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            int64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v14 != v18)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  int64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_10000E1D8(uint64_t a1, uint64_t a2)
{
  sub_100004A08(&qword_100029448);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v28 - v7;
  id v9 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v10 = sub_100009844(a1, a2, 0);
  if (a1 == 0xD000000000000012 && a2 == 0x80000001000205A0 || (sub_10001E9F8() & 1) != 0)
  {
    MGGetBoolAnswer();

    return 0;
  }
  else
  {
    type metadata accessor for AppInfo();
    uint64_t v11 = swift_allocObject();
    *(unsigned char *)(v11 + 16) = 3;
    *(_OWORD *)(v11 + 40) = 0u;
    uint64_t v30 = (uint64_t *)(v11 + 40);
    *(_OWORD *)(v11 + 24) = 0u;
    uint64_t v29 = (uint64_t *)(v11 + 24);
    uint64_t v13 = v11 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL;
    uint64_t v32 = v11 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL;
    uint64_t v14 = sub_10001E218();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 56);
    uint64_t v31 = v15 + 56;
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    v16(v17, 1, 1);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(v11 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL, 1, 1, v18);
    swift_beginAccess();
    *(unsigned char *)(v11 + 16) = 1;
    char v19 = v29;
    swift_beginAccess();
    *char v19 = a1;
    *(void *)(v11 + 32) = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_10001E2A8();
    Class isa = sub_10001E728().super.isa;
    swift_bridgeObjectRelease();
    id v21 = [v10 localizedNameWithPreferredLocalizations:isa];

    uint64_t v22 = sub_10001E6B8();
    uint64_t v24 = v23;

    uint64_t v25 = v30;
    swift_beginAccess();
    *uint64_t v25 = v22;
    *(void *)(v11 + 48) = v24;
    swift_bridgeObjectRelease();
    id v26 = [v10 URL];
    sub_10001E1F8();

    ((void (*)(char *, void, uint64_t, uint64_t))v16)(v8, 0, 1, v18);
    sub_1000100D0((uint64_t)v8, (uint64_t)v6);
    uint64_t v27 = v32;
    swift_beginAccess();
    sub_100004A58((uint64_t)v6, v27);
    swift_endAccess();
  }
  return v11;
}

uint64_t sub_10000E738(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AppInfo();
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 3;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  uint64_t v5 = v4 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL;
  uint64_t v6 = sub_10001E218();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7(v4 + OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL, 1, 1, v6);
  swift_beginAccess();
  *(unsigned char *)(v4 + 16) = 0;
  swift_beginAccess();
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000E8AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_10001E7F8();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100009D54(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000E944(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_10000F944();
  uint64_t result = sub_10001E7F8();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (unint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      unint64_t v6 = *v4;
      sub_10000F998(v5, *v4);
      sub_10000A228(v7, v5, v6);
      sub_10000F9F0(v7[0], v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000E9E0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v89 = a2;
  uint64_t v80 = sub_10001E608();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  size_t v78 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_10001E628();
  uint64_t v76 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v75 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t v72 = a3;
  void v13[2] = a3;
  v13[3] = a4;
  uint64_t v71 = a5;
  v13[4] = a5;
  v13[5] = a6;
  uint64_t v81 = v13;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v92 = &_swiftEmptySetSingleton;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v85 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  int64_t v86 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v73 = a4;
  swift_retain();
  uint64_t v74 = a6;
  swift_bridgeObjectRetain();
  uint64_t v88 = a1;
  swift_bridgeObjectRetain();
  int64_t v19 = 0;
  uint64_t v87 = "ActivityUI.app-info-cache";
  uint64_t v82 = v14;
  if (v18) {
    goto LABEL_43;
  }
LABEL_6:
  int64_t v20 = v19 + 1;
  if (!__OFADD__(v19, 1))
  {
    if (v20 >= v86) {
      goto LABEL_44;
    }
    unint64_t v21 = *(void *)(v85 + 8 * v20);
    ++v19;
    if (!v21)
    {
      int64_t v19 = v20 + 1;
      if (v20 + 1 >= v86) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v85 + 8 * v19);
      if (!v21)
      {
        int64_t v19 = v20 + 2;
        if (v20 + 2 >= v86) {
          goto LABEL_44;
        }
        unint64_t v21 = *(void *)(v85 + 8 * v19);
        if (!v21)
        {
          int64_t v22 = v20 + 3;
          if (v22 < v86)
          {
            unint64_t v21 = *(void *)(v85 + 8 * v22);
            if (v21)
            {
              int64_t v19 = v22;
              goto LABEL_19;
            }
            while (1)
            {
              int64_t v19 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_57;
              }
              if (v19 >= v86) {
                break;
              }
              unint64_t v21 = *(void *)(v85 + 8 * v19);
              ++v22;
              if (v21) {
                goto LABEL_19;
              }
            }
          }
LABEL_44:
          swift_release();
          uint64_t v58 = v92;
          if (v92[2])
          {
            uint64_t v59 = swift_allocObject();
            swift_weakInit();
            uint64_t v60 = (void *)swift_allocObject();
            v60[2] = v59;
            v60[3] = v58;
            v60[4] = v14;
            v60[5] = sub_100010180;
            v60[6] = v81;
            aBlock[4] = (Swift::Int)sub_10000F518;
            aBlock[5] = (Swift::Int)v60;
            aBlock[0] = (Swift::Int)_NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = (Swift::Int)sub_100006E5C;
            aBlock[3] = (Swift::Int)&unk_100025008;
            uint64_t v61 = _Block_copy(aBlock);
            swift_retain();
            swift_retain();
            swift_retain();
            size_t v62 = v75;
            sub_10001E618();
            unint64_t v90 = &_swiftEmptyArrayStorage;
            sub_100006EB8((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
            sub_100004A08(&qword_100029478);
            sub_10000FB04(&qword_100029C00, &qword_100029478);
            int v63 = v78;
            uint64_t v64 = v80;
            sub_10001E908();
            sub_10001E888();
            _Block_release(v61);
            (*(void (**)(char *, uint64_t))(v79 + 8))(v63, v64);
            (*(void (**)(char *, uint64_t))(v76 + 8))(v62, v77);
            swift_release();
            swift_release();
            swift_release();
            return swift_release();
          }
          swift_bridgeObjectRelease();
          uint64_t v65 = *(void *)(v14 + 16);
          if (*(void *)(v65 + 16))
          {
            uint64_t v66 = v74;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v67 = sub_10000D574(v71, v66);
            if (v68)
            {
              uint64_t v69 = *(void *)(*(void *)(v65 + 56) + 8 * v67);
              swift_retain();
              swift_bridgeObjectRelease();
LABEL_52:
              v72(v69);
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              return swift_release();
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRetain();
          }
          uint64_t v69 = 0;
          goto LABEL_52;
        }
      }
    }
LABEL_19:
    unint64_t v18 = (v21 - 1) & v21;
    for (unint64_t i = __clz(__rbit64(v21)) + (v19 << 6); ; unint64_t i = v57 | (v19 << 6))
    {
      uint64_t v24 = (uint64_t *)(*(void *)(v88 + 48) + 16 * i);
      uint64_t v25 = *v24;
      uint64_t v26 = v24[1];
      BOOL v27 = *v24 == 0x6C7070612E6D6F63 && v26 == 0xEF74616843692E65;
      if (!v27 && (sub_10001E9F8() & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t v28 = *(void **)(v89 + 24);
      swift_bridgeObjectRetain();
      id v29 = v28;
      NSString v30 = sub_10001E688();
      swift_bridgeObjectRelease();
      uint64_t v31 = (char *)[v29 objectForKey:v30];

      if (!v31)
      {
        uint64_t v32 = sub_10000E1D8(v25, v26);
        if (v32)
        {
          uint64_t v31 = (char *)v32;
        }
        else
        {
          type metadata accessor for AppInfo();
          uint64_t v31 = (char *)swift_allocObject();
          v31[16] = 3;
          *(_OWORD *)(v31 + 40) = 0u;
          uint64_t v83 = (uint64_t *)(v31 + 40);
          *(_OWORD *)(v31 + 24) = 0u;
          int64_t v84 = v19;
          uint64_t v33 = &v31[OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_localURL];
          uint64_t v34 = sub_10001E218();
          uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
          uint64_t v36 = v33;
          int64_t v19 = v84;
          v35(v36, 1, 1, v34);
          v35(&v31[OBJC_IVAR____TtC27DeviceActivityReportService7AppInfo_artworkURL], 1, 1, v34);
          uint64_t v14 = v82;
          swift_beginAccess();
          v31[16] = 0;
          swift_beginAccess();
          *((void *)v31 + 3) = v25;
          *((void *)v31 + 4) = v26;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v37 = v83;
          swift_beginAccess();
          *uint64_t v37 = v25;
          *((void *)v31 + 6) = v26;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          id v38 = *(id *)(v89 + 24);
          NSString v39 = sub_10001E688();
          [v38 setObject:v31 forKey:v39];
        }
      }
      swift_beginAccess();
      if (!v31[16])
      {
        sub_100009D54(aBlock, v25, v26);
        swift_release();
        swift_bridgeObjectRelease();
        if (!v18) {
          goto LABEL_6;
        }
        goto LABEL_43;
      }
      int64_t v40 = v19;
      swift_retain();
      Swift::Int v41 = *(void *)(v14 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      aBlock[0] = v41;
      *(void *)(v14 + 16) = 0x8000000000000000;
      unint64_t v44 = sub_10000D574(v25, v26);
      uint64_t v45 = *(void *)(v41 + 16);
      BOOL v46 = (v43 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46))
      {
        __break(1u);
        break;
      }
      char v48 = v43;
      if (*(void *)(v41 + 24) >= v47)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v51 = (void *)aBlock[0];
          if (v43) {
            goto LABEL_38;
          }
        }
        else
        {
          sub_10000DB58();
          uint64_t v51 = (void *)aBlock[0];
          if (v48) {
            goto LABEL_38;
          }
        }
      }
      else
      {
        sub_10000D6D0(v47, isUniquelyReferenced_nonNull_native);
        unint64_t v49 = sub_10000D574(v25, v26);
        if ((v48 & 1) != (v50 & 1)) {
          goto LABEL_58;
        }
        unint64_t v44 = v49;
        uint64_t v51 = (void *)aBlock[0];
        if (v48)
        {
LABEL_38:
          uint64_t v52 = v51[7];
          swift_release();
          *(void *)(v52 + 8 * v44) = v31;
          goto LABEL_42;
        }
      }
      v51[(v44 >> 6) + 8] |= 1 << v44;
      uint64_t v53 = (uint64_t *)(v51[6] + 16 * v44);
      *uint64_t v53 = v25;
      v53[1] = v26;
      *(void *)(v51[7] + 8 * v44) = v31;
      uint64_t v54 = v51[2];
      BOOL v55 = __OFADD__(v54, 1);
      uint64_t v56 = v54 + 1;
      if (v55) {
        goto LABEL_56;
      }
      v51[2] = v56;
      swift_bridgeObjectRetain();
LABEL_42:
      *(void *)(v14 + 16) = v51;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v19 = v40;
      if (!v18) {
        goto LABEL_6;
      }
LABEL_43:
      unint64_t v57 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t result = sub_10001EA18();
  __break(1u);
  return result;
}

uint64_t sub_10000F490()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t type metadata accessor for AppInfo()
{
  uint64_t result = qword_1000294B8;
  if (!qword_1000294B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10000F520()
{
  unint64_t result = qword_100029488;
  if (!qword_100029488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029488);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AppInfoSource(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppInfoSource(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppInfoSource(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000F6E0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000F708(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000F714(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppInfoSource()
{
  return &type metadata for AppInfoSource;
}

uint64_t sub_10000F72C()
{
  return type metadata accessor for AppInfo();
}

void sub_10000F734()
{
  sub_10000F7DC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000F7DC()
{
  if (!qword_1000294C8)
  {
    sub_10001E218();
    unint64_t v0 = sub_10001E8C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000294C8);
    }
  }
}

uint64_t type metadata accessor for AppInfoCache()
{
  return self;
}

void type metadata accessor for _EXSceneRole(uint64_t a1)
{
}

uint64_t sub_10000F86C()
{
  return sub_100006EB8(&qword_1000296A8, type metadata accessor for _EXSceneRole);
}

uint64_t sub_10000F8B4()
{
  return sub_100006EB8(&qword_1000296B0, type metadata accessor for _EXSceneRole);
}

uint64_t sub_10000F8FC()
{
  return sub_100006EB8(&qword_1000296B8, type metadata accessor for _EXSceneRole);
}

unint64_t sub_10000F944()
{
  unint64_t result = qword_1000296D0;
  if (!qword_1000296D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000296D0);
  }
  return result;
}

uint64_t sub_10000F998(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10000F9F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10000FA48()
{
  return sub_10000FA60((void (*)(void))&_swift_release);
}

uint64_t sub_10000FA60(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 32));

  return _swift_deallocObject(v1, 40, 7);
}

uint64_t sub_10000FAB0(uint64_t a1)
{
  return sub_100007B10(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_10000FABC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000FAF4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000FB04(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000547C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000FB48()
{
  unint64_t result = qword_100029718;
  if (!qword_100029718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029718);
  }
  return result;
}

void sub_10000FBA0(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  sub_100007D7C(*(void *)(v4 + 24), a1, a2, a4, *(void (**)(void *))(v4 + 32), *(void *)(v4 + 40));
}

uint64_t sub_10000FBD4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000FBE4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000F9F0(a1, a2);
  }
  return a1;
}

uint64_t sub_10000FBF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000FC54(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000FCA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004A08(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000FD04()
{
  swift_release();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000FD54()
{
  return sub_1000093EC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
}

uint64_t sub_10000FD60(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!*(void *)(a1 + 16))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000D574(a2, a3);
  if ((v7 & 1) == 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_10000FBF8(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v19);
  swift_bridgeObjectRelease();
  if (!*((void *)&v20 + 1))
  {
LABEL_11:
    sub_10000FCA4((uint64_t)&v19, &qword_100029738);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    if (qword_100029428 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_10001E5F8();
    sub_10000FABC(v10, (uint64_t)qword_100029E08);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_10001E5D8();
    os_log_type_t v12 = sub_10001E818();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      *(void *)&long long v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      swift_bridgeObjectRetain();
      sub_10001CFB0(a2, a3, (uint64_t *)&v19);
      sub_10001E8D8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_10001E658();
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      sub_10001CFB0(v14, v16, (uint64_t *)&v19);
      sub_10001E8D8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to extract value for key %s from lookup results %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  uint64_t result = v17;
  uint64_t v9 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v9 = v17 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_100010068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A08(&qword_100029448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000100D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A08(&qword_100029448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010138()
{
  return swift_release();
}

uint64_t sub_100010140()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100010180(uint64_t a1)
{
  return sub_100006FF4(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_100010190()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000101E0()
{
  return sub_100007A3C(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void sub_100010204(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100010270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  id result = sub_10001029C(a1, a2, a3, a4);
  if (!v5) {
    *a5 = result;
  }
  return result;
}

id sub_10001029C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = 0;
  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  v8[3] = a4;
  id v4 = [(id)swift_getObjCClassFromMetadata() bundleRecordForAuditToken:v8 error:&v9];
  if (v4)
  {
    id v5 = v9;
  }
  else
  {
    id v6 = v9;
    sub_10001E1E8();

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_1000103A4()
{
  id v1 = [*v0 bundleIdentifier];
  if (!v1) {
    return 0;
  }
  int v2 = v1;
  uint64_t v3 = sub_10001E6B8();

  return v3;
}

NSString sub_10001040C()
{
  NSString result = sub_10001E688();
  qword_100029DF8 = (uint64_t)result;
  return result;
}

uint64_t sub_10001044C()
{
  uint64_t v0 = sub_10001E428();
  unint64_t v1 = sub_100011ED8();
  type metadata accessor for DataRefresher();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 48) = &_swiftEmptySetSingleton;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(void *)(v2 + 88) = 0;
  uint64_t v3 = v2 + OBJC_IVAR____TtC27DeviceActivityReportService13DataRefresher_lastRefreshDate;
  uint64_t v4 = sub_10001E278();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = &off_100025108;
  *(void *)(v2 + 32) = v1;
  *(void *)(v2 + 40) = &off_100029D40;
  qword_100029E00 = v2;
  return result;
}

uint64_t sub_100010528()
{
  uint64_t v1 = v0 + 56;
  swift_beginAccess();
  if (*(void *)(v0 + 80))
  {
    sub_100012594(v0 + 56, (uint64_t)&v5);
    uint64_t v2 = *((void *)&v6 + 1);
    uint64_t v3 = v7;
    sub_1000125F8(&v5, *((uint64_t *)&v6 + 1));
    (*(void (**)(uint64_t, uint64_t))(v3 + 48))(v2, v3);
    sub_10000FC54((uint64_t)&v5);
  }
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  swift_beginAccess();
  sub_100012530((uint64_t)&v5, v1, &qword_1000298B8);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_10000FCA4(v1, &qword_1000298B8);
  sub_10000FCA4(v0 + OBJC_IVAR____TtC27DeviceActivityReportService13DataRefresher_lastRefreshDate, &qword_1000298A8);
  return swift_deallocClassInstance();
}

uint64_t sub_100010664()
{
  return type metadata accessor for DataRefresher();
}

uint64_t type metadata accessor for DataRefresher()
{
  uint64_t result = qword_100029790;
  if (!qword_100029790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000106B8()
{
  sub_100011E80();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10001076C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001E278();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004A08(&qword_1000298A8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v43 = (uint64_t)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  os_log_type_t v12 = (char *)&v42 - v11;
  uint64_t v13 = sub_10001E298();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  long long v19 = (char *)&v42 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, a1, v13);
  swift_beginAccess();
  sub_100009F04((uint64_t)v19, v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  swift_endAccess();
  uint64_t v20 = v2 + 56;
  swift_beginAccess();
  sub_100012C64(v2 + 56, (uint64_t)&v45, &qword_1000298B8);
  if (v46)
  {
    sub_100012CC8(&v45, (uint64_t)v48);
    uint64_t v21 = AssociatedTypeWitness;
    uint64_t v22 = AssociatedConformanceWitness;
    sub_1000125F8(v48, AssociatedTypeWitness);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v22 + 24))(v21, v22))
    {
      if (qword_100029430 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_10001E5F8();
      sub_10000FABC(v23, (uint64_t)qword_100029E20);
      uint64_t v24 = sub_10001E5D8();
      os_log_type_t v25 = sub_10001E808();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Data refresh timer has already been started.", v26, 2u);
        swift_slowDealloc();
      }

      return sub_10000FC54((uint64_t)v48);
    }
    uint64_t v42 = v7;
    uint64_t v44 = v5;
    sub_10000FC54((uint64_t)v48);
  }
  else
  {
    uint64_t v42 = v7;
    uint64_t v44 = v5;
    sub_10000FCA4((uint64_t)&v45, &qword_1000298B8);
  }
  uint64_t v28 = *(void *)(v2 + 32);
  uint64_t v29 = *(void *)(v2 + 40);
  NSString v30 = (void *)swift_allocObject();
  v30[2] = v28;
  v30[3] = v29;
  v30[4] = sub_100012B50;
  v30[5] = v2;
  uint64_t v31 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t, double))(v29 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_100012B9C(v48);
  swift_retain();
  v31(1, sub_100012B90, v30, v28, v29, 60.0);
  swift_release();
  sub_100012C00((uint64_t)v48, (uint64_t)&v45, &qword_1000298B8);
  swift_beginAccess();
  sub_100012530((uint64_t)&v45, v2 + 56, &qword_1000298B8);
  swift_endAccess();
  uint64_t v32 = v2 + OBJC_IVAR____TtC27DeviceActivityReportService13DataRefresher_lastRefreshDate;
  swift_beginAccess();
  sub_100012C64(v32, (uint64_t)v12, &qword_1000298A8);
  uint64_t v33 = v44;
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  LODWORD(v29) = v34(v12, 1, v4);
  sub_10000FCA4((uint64_t)v12, &qword_1000298A8);
  if (v29 == 1) {
    goto LABEL_13;
  }
  uint64_t v35 = v42;
  sub_10001E268();
  uint64_t v36 = v43;
  sub_100012C64(v32, v43, &qword_1000298A8);
  uint64_t result = v34((char *)v36, 1, v4);
  if (result == 1)
  {
    __break(1u);
    return result;
  }
  sub_10001E258();
  double v38 = v37;
  NSString v39 = *(void (**)(char *, uint64_t))(v33 + 8);
  v39(v35, v4);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v39)(v36, v4);
  if (v38 > 60.0)
  {
LABEL_13:
    sub_100012C64(v20, (uint64_t)v48, &qword_1000298B8);
    if (AssociatedTypeWitness)
    {
      sub_100012594((uint64_t)v48, (uint64_t)&v45);
      sub_10000FCA4((uint64_t)v48, &qword_1000298B8);
      uint64_t v40 = v46;
      uint64_t v41 = v47;
      sub_1000125F8(&v45, v46);
      (*(void (**)(uint64_t, uint64_t))(v41 + 40))(v40, v41);
      return sub_10000FC54((uint64_t)&v45);
    }
    else
    {
      return sub_10000FCA4((uint64_t)v48, &qword_1000298B8);
    }
  }
  return result;
}

uint64_t sub_100010DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100004A08(&qword_1000298C0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100029430 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10001E5F8();
  sub_10000FABC(v6, (uint64_t)qword_100029E20);
  uint64_t v7 = sub_10001E5D8();
  os_log_type_t v8 = sub_10001E808();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Data refresh timer fired, updating local activity.", v9, 2u);
    swift_slowDealloc();
  }

  sub_10001E798();
  uint64_t v10 = sub_10001E7B8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 0, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a2;
  swift_retain();
  sub_100011860((uint64_t)v5, (uint64_t)&unk_1000298D0, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_100010F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[12] = a4;
  uint64_t v5 = sub_10001E278();
  v4[13] = v5;
  v4[14] = *(void *)(v5 - 8);
  v4[15] = swift_task_alloc();
  sub_100004A08(&qword_1000298A8);
  v4[16] = swift_task_alloc();
  return _swift_task_switch(sub_100011060, 0, 0);
}

uint64_t sub_100011060()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = *(void *)(v1 + 16);
  v0[17] = v2;
  uint64_t v3 = *(void *)(v1 + 24);
  v0[18] = v3;
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v0[5] = v2;
  v0[6] = v3;
  v0[19] = (uint64_t)sub_100012B9C(v0 + 2);
  v4(v2, v3);
  v0[20] = sub_10001E788();
  v0[21] = sub_10001E778();
  uint64_t v6 = sub_10001E768();
  return _swift_task_switch(sub_100011144, v6, v5);
}

uint64_t sub_100011144()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 96);
  swift_release();
  uint64_t v3 = v2 + OBJC_IVAR____TtC27DeviceActivityReportService13DataRefresher_lastRefreshDate;
  swift_beginAccess();
  sub_100012C64(v3, v1, &qword_1000298A8);
  return _swift_task_switch(sub_1000111F4, 0, 0);
}

uint64_t sub_1000111F4()
{
  uint64_t v8 = v0[18];
  uint64_t v1 = sub_10001E4A8();
  v0[22] = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 56) + **(int **)(v8 + 56));
  uint64_t v2 = (void *)swift_task_alloc();
  v0[23] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000112FC;
  uint64_t v3 = v0[18];
  uint64_t v5 = v0[16];
  uint64_t v4 = v0[17];
  return v7(v5, v1, v4, v3);
}

uint64_t sub_1000112FC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128);
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  sub_10000FCA4(v2, &qword_1000298A8);
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v3 = sub_10001161C;
  }
  else {
    uint64_t v3 = sub_100011458;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100011458()
{
  (*(void (**)(void))(v0[18] + 64))(v0[17]);
  sub_10001E268();
  v0[25] = sub_10001E778();
  uint64_t v2 = sub_10001E768();
  return _swift_task_switch(sub_100011510, v2, v1);
}

uint64_t sub_100011510()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  swift_release();
  sub_100011CA0(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_1000115A8, 0, 0);
}

uint64_t sub_1000115A8()
{
  sub_10000FC54(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001161C()
{
  os_log_type_t v12 = v0;
  if (qword_100029430 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001E5F8();
  sub_10000FABC(v1, (uint64_t)qword_100029E20);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_10001E5D8();
  os_log_type_t v3 = sub_10001E818();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[24];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446210;
    v0[10] = v5;
    swift_errorRetain();
    sub_100004A08(&qword_100029BD0);
    uint64_t v7 = sub_10001E6C8();
    v0[11] = sub_10001CFB0(v7, v8, &v11);
    sub_10001E8D8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to refresh local activity with error: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10000FC54((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100011860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001E7B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10001E7A8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000FCA4(a1, &qword_1000298C0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10001E768();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100011A0C(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[3] = AssociatedTypeWitness;
  v7[4] = swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_100012B9C(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v5, a1, AssociatedTypeWitness);
  a2(v7);
  return sub_10000FC54((uint64_t)v7);
}

uint64_t sub_100011AF8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100004A08(&qword_1000298B0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_10001227C(a1, (uint64_t)v6);
  sub_10000FCA4((uint64_t)v6, &qword_1000298B0);
  uint64_t result = swift_endAccess();
  if (!*(void *)(*(void *)(v2 + 48) + 16))
  {
    uint64_t v8 = v2 + 56;
    swift_beginAccess();
    sub_100012C64(v8, (uint64_t)&v14, &qword_1000298B8);
    if (*((void *)&v15 + 1))
    {
      sub_100012594((uint64_t)&v14, (uint64_t)v11);
      sub_10000FCA4((uint64_t)&v14, &qword_1000298B8);
      uint64_t v9 = v12;
      uint64_t v10 = v13;
      sub_1000125F8(v11, v12);
      (*(void (**)(uint64_t, uint64_t))(v10 + 48))(v9, v10);
      sub_10000FC54((uint64_t)v11);
    }
    else
    {
      sub_10000FCA4((uint64_t)&v14, &qword_1000298B8);
    }
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    swift_beginAccess();
    sub_100012530((uint64_t)&v14, v8, &qword_1000298B8);
    return swift_endAccess();
  }
  return result;
}

void sub_100011CA0(uint64_t a1)
{
  uint64_t v3 = sub_100004A08(&qword_1000298A8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = sub_10001E278();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  sub_100012C00((uint64_t)v8, (uint64_t)v6, &qword_1000298A8);
  uint64_t v11 = v1 + OBJC_IVAR____TtC27DeviceActivityReportService13DataRefresher_lastRefreshDate;
  swift_beginAccess();
  sub_100012530((uint64_t)v6, v11, &qword_1000298A8);
  swift_endAccess();
  id v12 = [self defaultCenter];
  if (qword_100029418 != -1) {
    swift_once();
  }
  [v12 postNotificationName:qword_100029DF8 object:0];
}

void sub_100011E80()
{
  if (!qword_1000297A0)
  {
    sub_10001E278();
    unint64_t v0 = sub_10001E8C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000297A0);
    }
  }
}

unint64_t sub_100011ED8()
{
  unint64_t result = qword_1000298A0;
  if (!qword_1000298A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000298A0);
  }
  return result;
}

uint64_t sub_100011F18(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100011FF4;
  return v6(a1);
}

uint64_t sub_100011FF4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000120EC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_10001EA68();
  swift_bridgeObjectRetain();
  sub_10001E6D8();
  Swift::Int v6 = sub_10001EA88();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_10001E9F8() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_10001E9F8() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000C4AC();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_100012680(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_10001227C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10001E298();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_10001263C(&qword_1000296E8);
  swift_bridgeObjectRetain();
  uint64_t v29 = a1;
  uint64_t v10 = sub_10001E668();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v28 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v24 = v2;
    uint64_t v25 = v6;
    uint64_t v26 = a2;
    uint64_t v27 = ~v11;
    uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v14 = v6 + 16;
    uint64_t v13 = v15;
    uint64_t v16 = *(void *)(v14 + 56);
    while (1)
    {
      v13(v8, *(void *)(v9 + 48) + v16 * v12, v5);
      sub_10001263C(&qword_1000296F0);
      char v17 = sub_10001E678();
      (*(void (**)(char *, uint64_t))(v14 - 8))(v8, v5);
      if (v17) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v27;
      if (((*(void *)(v28 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = 1;
        uint64_t v6 = v25;
        a2 = v26;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v19 = v24;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v19;
    uint64_t v30 = *v19;
    *uint64_t v19 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10000C660();
      uint64_t v21 = v30;
    }
    uint64_t v6 = v25;
    a2 = v26;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 32))(v26, *(void *)(v21 + 48) + v16 * v12, v5);
    sub_100012848(v12);
    *uint64_t v19 = v30;
    swift_bridgeObjectRelease();
    uint64_t v18 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
}

uint64_t sub_100012530(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004A08(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012594(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_1000125F8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001263C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001E298();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100012680(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_10001E918();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_10001EA68();
        swift_bridgeObjectRetain();
        sub_10001E6D8();
        Swift::Int v10 = sub_10001EA88();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            _OWORD *v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_100012848(int64_t a1)
{
  uint64_t v3 = sub_10001E298();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v31 = v1;
    uint64_t v11 = ~v9;
    uint64_t v35 = result;
    swift_retain();
    uint64_t v12 = sub_10001E918();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v33 = (v12 + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v13 = v4 + 16;
      uint64_t v32 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v34 = v13;
      BOOL v16 = (void (**)(char *, uint64_t))(v13 - 8);
      uint64_t v17 = v35;
      do
      {
        uint64_t v18 = v8;
        uint64_t v19 = v15;
        int64_t v20 = v15 * v10;
        v32(v6, *(void *)(v17 + 48) + v15 * v10, v3);
        sub_10001263C(&qword_1000296E8);
        uint64_t v21 = sub_10001E668();
        (*v16)(v6, v3);
        unint64_t v22 = v21 & v11;
        if (a1 >= (uint64_t)v33)
        {
          if (v22 < v33 || a1 < (uint64_t)v22)
          {
LABEL_4:
            uint64_t v8 = v18;
            uint64_t v15 = v19;
            uint64_t v17 = v35;
            goto LABEL_5;
          }
        }
        else if (v22 < v33 && a1 < (uint64_t)v22)
        {
          goto LABEL_4;
        }
        uint64_t v17 = v35;
        int64_t v25 = v19 * a1;
        uint64_t v8 = v18;
        if (v19 * a1 < v20
          || (uint64_t v15 = v19, *(void *)(v35 + 48) + v19 * a1 >= (unint64_t)(*(void *)(v35 + 48) + v20 + v19)))
        {
          swift_arrayInitWithTakeFrontToBack();
          goto LABEL_21;
        }
        a1 = v10;
        if (v25 != v20)
        {
          swift_arrayInitWithTakeBackToFront();
LABEL_21:
          uint64_t v17 = v35;
          uint64_t v15 = v19;
          a1 = v10;
        }
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v31;
  }
  else
  {
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v26 = *v1;
  uint64_t v27 = *(void *)(*v1 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v26 + 16) = v29;
    ++*(_DWORD *)(v26 + 36);
  }
  return result;
}

uint64_t sub_100012B50(uint64_t a1)
{
  return sub_100010DAC(a1, v1);
}

uint64_t sub_100012B58()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100012B90(uint64_t a1)
{
  return sub_100011A0C(a1, *(void (**)(uint64_t *))(v1 + 32));
}

uint64_t *sub_100012B9C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100012C00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004A08(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012C64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004A08(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012CC8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100012CE0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012D20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100012DD4;
  return sub_100010F70(a1, v4, v5, v6);
}

uint64_t sub_100012DD4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100012EC8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012F00(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100012DD4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000298D8 + dword_1000298D8);
  return v6(a1, v4);
}

uint64_t sub_100012FBC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100012DD4;
  return DeviceActivityDataSource.refreshLocalActivity(since:segmentIntervals:)(a1, a2);
}

_UNKNOWN **sub_100013068()
{
  return &off_100029948;
}

void *sub_100013074()
{
  return &protocol witness table for _EXExtensionIdentity;
}

void sub_100013080(void *a1)
{
  uint64_t v2 = v1;
  [v1 addChildViewController:a1];
  id v29 = [a1 view];
  if (!v29)
  {
    __break(1u);
    goto LABEL_11;
  }
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [v1 view];
  if (!v4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  [v4 addSubview:v29];

  sub_100004A08(&qword_100029C90);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001F830;
  id v7 = [v2 view];
  if (!v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  id v9 = [v7 topAnchor];

  id v10 = [v29 topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];

  *(void *)(v6 + 32) = v11;
  id v12 = [v2 view];
  if (!v12)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v13 = v12;
  id v14 = [v12 bottomAnchor];

  id v15 = [v29 bottomAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];

  *(void *)(v6 + 40) = v16;
  id v17 = [v2 view];
  if (!v17)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v18 = v17;
  id v19 = [v17 leadingAnchor];

  id v20 = [v29 leadingAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20];

  *(void *)(v6 + 48) = v21;
  id v22 = [v2 view];
  if (!v22)
  {
LABEL_15:
    __break(1u);
    return;
  }
  uint64_t v23 = v22;
  uint64_t v24 = self;
  id v25 = [v23 trailingAnchor];

  id v26 = [v29 trailingAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];

  *(void *)(v6 + 56) = v27;
  sub_10001E748();
  sub_1000133E4();
  Class isa = sub_10001E728().super.isa;
  swift_bridgeObjectRelease();
  [v24 activateConstraints:isa];

  [a1 didMoveToParentViewController:v2];
}

unint64_t sub_1000133E4()
{
  unint64_t result = qword_100029998;
  if (!qword_100029998)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100029998);
  }
  return result;
}

uint64_t sub_100013424@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_1000134C8();
  Class isa = sub_10001E728().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithQueries:isa delegate:a1];

  uint64_t result = swift_unknownObjectRelease();
  *a2 = v6;
  return result;
}

id sub_1000134B8()
{
  return [*v0 resume];
}

unint64_t sub_1000134C8()
{
  unint64_t result = qword_1000299D0;
  if (!qword_1000299D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000299D0);
  }
  return result;
}

uint64_t sub_100013508(uint64_t a1)
{
  return sub_100013544(a1, qword_100029E08);
}

uint64_t sub_100013528(uint64_t a1)
{
  return sub_100013544(a1, qword_100029E20);
}

uint64_t sub_100013544(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001E5F8();
  sub_100013630(v3, a2);
  sub_10000FABC(v3, (uint64_t)a2);
  return sub_10001E5E8();
}

uint64_t sub_1000135BC()
{
  uint64_t v0 = sub_10001E5F8();
  sub_100013630(v0, qword_100029E38);
  sub_10000FABC(v0, (uint64_t)qword_100029E38);
  return sub_10001E5E8();
}

uint64_t *sub_100013630(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000136A4()
{
  uint64_t v1 = sub_10001E608();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001E628();
  uint64_t v5 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001AEF0(0, (unint64_t *)&qword_100029460);
  uint64_t v8 = (void *)sub_10001E868();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_10001AE34;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006E5C;
  aBlock[3] = &unk_1000255D8;
  id v10 = _Block_copy(aBlock);
  id v11 = v0;
  swift_release();
  sub_10001E618();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10001AF2C((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004A08(&qword_100029478);
  sub_10001AF74(&qword_100029C00, &qword_100029478);
  sub_10001E908();
  sub_10001E888();
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

void sub_100013970(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_sceneRole);
  if (v1)
  {
    id v12 = v1;
    id v2 = sub_100013E78();
    id v3 = [v2 configuration];

    if (v3)
    {
      id v4 = [v3 role];
      uint64_t v5 = sub_10001E6B8();
      uint64_t v7 = v6;
      if (v5 == sub_10001E6B8() && v7 == v8)
      {

        swift_bridgeObjectRelease_n();
        return;
      }
      char v10 = sub_10001E9F8();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        [v3 setRole:v12];
        id v11 = sub_100013E78();
        id v3 = v3;
        [v11 setConfiguration:v3];
      }
    }
  }
}

uint64_t sub_100013AEC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  id v3 = *(void **)(result + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection);
  if (!v3) {
    goto LABEL_3;
  }
  v7[4] = sub_100013C18;
  uint64_t v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  uint64_t v7[2] = sub_100013E10;
  v7[3] = &unk_100025718;
  id v4 = _Block_copy(v7);
  id v5 = v3;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];
  _Block_release(v4);

  sub_10001E8F8();
  swift_unknownObjectRelease();
  sub_100004A08(&qword_100029C78);
  unint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
LABEL_3:
  }
    *a2 = 0;
  return result;
}

void sub_100013C18()
{
  if (qword_100029430 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001E5F8();
  sub_10000FABC(v0, (uint64_t)qword_100029E20);
  swift_errorRetain();
  swift_errorRetain();
  oslog = sub_10001E5D8();
  os_log_type_t v1 = sub_10001E818();
  if (os_log_type_enabled(oslog, v1))
  {
    id v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)id v2 = 136446210;
    swift_errorRetain();
    sub_100004A08(&qword_100029BD0);
    uint64_t v3 = sub_10001E6C8();
    sub_10001CFB0(v3, v4, &v6);
    sub_10001E8D8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Failed to create extension proxy: %{public}s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_100013E10(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100013E78()
{
  uint64_t v1 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___reportExtensionHostingController;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___reportExtensionHostingController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___reportExtensionHostingController);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)EXHostViewController) init];
    [v4 setDelegate:v0];
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_100013F00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___extensionController;
  swift_beginAccess();
  sub_100012C64(v4, (uint64_t)&v14, &qword_100029C88);
  if (v15) {
    return sub_100012CC8(&v14, (uint64_t)a1);
  }
  sub_10000FCA4((uint64_t)&v14, &qword_100029C88);
  id v6 = objc_allocWithZone((Class)_EXQuery);
  NSString v7 = sub_10001E688();
  id v8 = [v6 initWithExtensionPointIdentifier:v7];

  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionQueryController);
  uint64_t v10 = *(void *)(v2 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionQueryController + 8);
  sub_100004A08(&qword_100029C90);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001F8C0;
  *(void *)(v11 + 32) = v8;
  *(void *)&long long v14 = v11;
  sub_10001E748();
  uint64_t v12 = v14;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 24);
  a1[3] = v9;
  a1[4] = v10;
  sub_100012B9C(a1);
  swift_unknownObjectRetain();
  v13(v12, v2, v9, v10);
  sub_100012594((uint64_t)a1, (uint64_t)&v14);
  swift_beginAccess();
  sub_100012530((uint64_t)&v14, v4, &qword_100029C88);
  return swift_endAccess();
}

uint64_t sub_1000140BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___dataSource;
  swift_beginAccess();
  sub_100012C64(v3, (uint64_t)&v9, &qword_100029C80);
  if (v10) {
    return sub_100012CC8(&v9, (uint64_t)a1);
  }
  sub_10000FCA4((uint64_t)&v9, &qword_100029C80);
  uint64_t v5 = v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_deviceActivityDataSource;
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_deviceActivityDataSource);
  uint64_t v7 = *(void *)(v5 + 8);
  id v8 = *(void (**)(uint64_t, uint64_t))(v7 + 16);
  a1[3] = v6;
  a1[4] = v7;
  sub_100012B9C(a1);
  v8(v6, v7);
  sub_100012594((uint64_t)a1, (uint64_t)&v9);
  swift_beginAccess();
  sub_100012530((uint64_t)&v9, v3, &qword_100029C80);
  return swift_endAccess();
}

uint64_t sub_100014580()
{
  uint64_t v1 = sub_10001E608();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001E628();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(void *)&v0[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataUpdateQueue];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_10001AEC8;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006E5C;
  aBlock[3] = &unk_1000256A0;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = v0;
  sub_10001E618();
  v13[1] = &_swiftEmptyArrayStorage;
  sub_10001AF2C((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004A08(&qword_100029478);
  sub_10001AF74(&qword_100029C00, &qword_100029478);
  sub_10001E908();
  sub_10001E888();
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_10001482C(uint64_t a1)
{
  uint64_t v2 = sub_10001E118();
  uint64_t v77 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v73 = (char *)v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001E458();
  uint64_t v72 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v71 = (char *)v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001E3D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v81 = v6;
  uint64_t v82 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004A08(&qword_100029C10);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v75 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  long long v14 = (char *)v60 - v13;
  uint64_t v15 = sub_10001E498();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v76 = (char *)v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  id v20 = (char *)v60 - v19;
  uint64_t v21 = a1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_filter;
  swift_beginAccess();
  uint64_t v74 = v21;
  uint64_t v22 = v21;
  uint64_t v23 = v16;
  sub_100012C64(v22, (uint64_t)v14, &qword_100029C10);
  id v26 = *(unsigned int (**)(void, void, void))(v16 + 48);
  uint64_t v25 = v16 + 48;
  uint64_t v24 = v26;
  if (v26(v14, 1, v15) == 1)
  {
    sub_10000FCA4((uint64_t)v14, &qword_100029C10);
    if (qword_100029430 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_10001E5F8();
    sub_10000FABC(v27, (uint64_t)qword_100029E20);
    BOOL v28 = sub_10001E5D8();
    os_log_type_t v29 = sub_10001E838();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Not updating report because we don't have a filter", v30, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    size_t v70 = v24;
    uint64_t v68 = v2;
    uint64_t v31 = *(void (**)(void, void, void))(v23 + 32);
    uint64_t v66 = v23 + 32;
    uint64_t v65 = v31;
    v31(v20, v14, v15);
    uint64_t v69 = a1;
    sub_1000140BC(aBlock);
    sub_1000125F8(aBlock, (uint64_t)v84);
    uint64_t v32 = sub_10001E408();
    uint64_t v67 = v4;
    uint64_t v33 = v32;
    int v63 = v20;
    sub_10000FC54((uint64_t)aBlock);
    uint64_t v34 = v33;
    int64_t v35 = *(void *)(v33 + 16);
    if (v35)
    {
      uint64_t v64 = v25;
      uint64_t v61 = v23;
      uint64_t v62 = v15;
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      sub_100018368(0, v35, 0);
      uint64_t v80 = *(void (**)(char *, unint64_t, uint64_t))(v82 + 16);
      unint64_t v36 = (*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
      v60[1] = v34;
      unint64_t v37 = v34 + v36;
      uint64_t v38 = *(void *)(v82 + 72);
      v82 += 16;
      uint64_t v78 = v38;
      uint64_t v79 = (void (**)(char *, uint64_t))(v82 - 8);
      do
      {
        uint64_t v39 = v81;
        v80(v9, v37, v81);
        sub_10001E0F8();
        swift_allocObject();
        sub_10001E0E8();
        sub_10001AF2C(&qword_100029C68, (void (*)(uint64_t))&type metadata accessor for _DeviceActivityData);
        uint64_t v40 = sub_10001E0D8();
        uint64_t v42 = v41;
        swift_release();
        (*v79)(v9, v39);
        uint64_t v43 = aBlock[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100018368(0, *(void *)(v43 + 16) + 1, 1);
          uint64_t v43 = aBlock[0];
        }
        unint64_t v45 = *(void *)(v43 + 16);
        unint64_t v44 = *(void *)(v43 + 24);
        if (v45 >= v44 >> 1)
        {
          sub_100018368(v44 > 1, v45 + 1, 1);
          uint64_t v43 = aBlock[0];
        }
        *(void *)(v43 + 16) = v45 + 1;
        uint64_t v46 = v43 + 16 * v45;
        *(void *)(v46 + 32) = v40;
        *(void *)(v46 + 40) = v42;
        v37 += v78;
        --v35;
      }
      while (v35);
      uint64_t v47 = swift_bridgeObjectRelease();
      uint64_t v15 = v62;
      uint64_t v23 = v61;
    }
    else
    {
      uint64_t v47 = swift_bridgeObjectRelease();
    }
    __chkstk_darwin(v47);
    v60[-2] = v48;
    swift_bridgeObjectRetain();
    sub_100004A08(&qword_100029C60);
    sub_10001E878();
    unint64_t v49 = (void *)aBlock[0];
    if (aBlock[0])
    {
      Class isa = sub_10001E728().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v51 = v71;
      uint64_t v52 = v63;
      sub_10001E468();
      uint64_t v53 = v73;
      sub_10001E448();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v51, v67);
      Class v54 = sub_10001E108().super.isa;
      (*(void (**)(char *, uint64_t))(v77 + 8))(v53, v68);
      uint64_t v85 = sub_100015684;
      uint64_t v86 = 0;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100015688;
      int64_t v84 = &unk_1000256F0;
      BOOL v55 = _Block_copy(aBlock);
      [v49 updateDeviceActivityData:isa segmentInterval:v54 replyHandler:v55];
      _Block_release(v55);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v23 + 8))(v52, v15);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      if (qword_100029430 != -1) {
        swift_once();
      }
      uint64_t v56 = sub_10001E5F8();
      sub_10000FABC(v56, (uint64_t)qword_100029E20);
      unint64_t v57 = sub_10001E5D8();
      os_log_type_t v58 = sub_10001E838();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v59 = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "Not updating report because we don't have a proxy", v59, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v23 + 8))(v63, v15);
    }
  }
}

void sub_100015688(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000156F4(uint64_t a1)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100029430 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_10001E5F8();
    sub_10000FABC(v1, (uint64_t)qword_100029E20);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_10001E5D8();
    os_log_type_t v2 = sub_10001E818();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 136446210;
      swift_errorRetain();
      sub_100004A08(&qword_100029BD0);
      uint64_t v4 = sub_10001E6C8();
      sub_10001CFB0(v4, v5, &v7);
      sub_10001E8D8();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Failed to update scene device activity data: %{public}s", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_100015904(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_10001592C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  v31[1] = a1;
  uint64_t v40 = sub_10001E858();
  uint64_t v4 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v39 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001E848();
  __chkstk_darwin(v6);
  uint64_t v7 = sub_10001E628();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = (uint64_t *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_appInfoCache];
  uint64_t *v8 = type metadata accessor for AppInfoCache();
  v8[1] = (uint64_t)&off_100025060;
  uint64_t v9 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_authorization;
  *(void *)&v3[v9] = sub_10001E438();
  uint64_t v10 = (uint64_t *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_bundleRecord];
  *uint64_t v10 = sub_10001AEF0(0, &qword_100029C98);
  v10[1] = (uint64_t)&off_100025078;
  uint64_t v11 = (uint64_t *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_connection];
  *uint64_t v11 = sub_10001AEF0(0, &qword_100029CA0);
  v11[1] = (uint64_t)&off_100025820;
  uint64_t v12 = (uint64_t *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_deviceActivityDataSource];
  *uint64_t v12 = sub_10001E428();
  v12[1] = (uint64_t)&off_100025108;
  uint64_t v13 = (uint64_t *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionQueryController];
  uint64_t *v13 = sub_10001AEF0(0, &qword_100029CA8);
  v13[1] = (uint64_t)&off_1000299A0;
  long long v14 = (uint64_t *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_usageTrackingConnection];
  *long long v14 = sub_10001AEF0(0, (unint64_t *)&unk_100029CB0);
  v14[1] = (uint64_t)&off_100025830;
  uint64_t v15 = &v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionIdentifierPrefix];
  *uint64_t v15 = 0;
  v15[1] = 0;
  *(void *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_sceneRole] = 0;
  uint64_t v16 = &v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_filter];
  uint64_t v17 = sub_10001E498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData] = 0;
  *(void *)&v3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection] = 0;
  uint64_t v38 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue;
  uint64_t v37 = sub_10001AEF0(0, (unint64_t *)&qword_100029460);
  uint64_t v18 = v3;
  sub_10001E618();
  unint64_t v44 = &_swiftEmptyArrayStorage;
  uint64_t v35 = sub_10001AF2C(&qword_100029468, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  uint64_t v34 = sub_100004A08((uint64_t *)&unk_100029CC0);
  uint64_t v36 = sub_10001AF74(&qword_100029470, (uint64_t *)&unk_100029CC0);
  sub_10001E908();
  unsigned int v33 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v32 = *(void (**)(char *))(v4 + 104);
  uint64_t v19 = v39;
  uint64_t v20 = v40;
  v32(v39);
  *(void *)&v3[v38] = sub_10001E898();
  *(void *)&v18[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___reportExtensionHostingController] = 0;
  uint64_t v21 = &v18[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___extensionController];
  *(_OWORD *)uint64_t v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  *((void *)v21 + 4) = 0;
  uint64_t v22 = &v18[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___dataSource];
  *(_OWORD *)uint64_t v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  *((void *)v22 + 4) = 0;
  sub_10001E288();
  uint64_t v23 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataUpdateQueue;
  sub_10001E618();
  unint64_t v44 = &_swiftEmptyArrayStorage;
  sub_10001E908();
  ((void (*)(char *, void, uint64_t))v32)(v19, v33, v20);
  uint64_t v24 = sub_10001E898();
  uint64_t v25 = v41;
  *(void *)&v18[v23] = v24;

  if (v25)
  {
    NSString v26 = sub_10001E688();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v26 = 0;
  }
  uint64_t v27 = (objc_class *)type metadata accessor for ReportViewController();
  v43.receiver = v18;
  v43.super_class = v27;
  BOOL v28 = v42;
  id v29 = objc_msgSendSuper2(&v43, "initWithNibName:bundle:", v26, v42);

  return v29;
}

id sub_100015EF8(void *a1)
{
  uint64_t v36 = a1;
  uint64_t v2 = sub_10001E858();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001E848();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10001E628();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = (uint64_t *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_appInfoCache];
  *uint64_t v7 = type metadata accessor for AppInfoCache();
  v7[1] = (uint64_t)&off_100025060;
  uint64_t v8 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_authorization;
  *(void *)&v1[v8] = sub_10001E438();
  uint64_t v9 = (uint64_t *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_bundleRecord];
  *uint64_t v9 = sub_10001AEF0(0, &qword_100029C98);
  v9[1] = (uint64_t)&off_100025078;
  uint64_t v10 = (uint64_t *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_connection];
  *uint64_t v10 = sub_10001AEF0(0, &qword_100029CA0);
  v10[1] = (uint64_t)&off_100025820;
  uint64_t v11 = (uint64_t *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_deviceActivityDataSource];
  *uint64_t v11 = sub_10001E428();
  v11[1] = (uint64_t)&off_100025108;
  uint64_t v12 = (uint64_t *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionQueryController];
  *uint64_t v12 = sub_10001AEF0(0, &qword_100029CA8);
  v12[1] = (uint64_t)&off_1000299A0;
  uint64_t v13 = (uint64_t *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_usageTrackingConnection];
  uint64_t *v13 = sub_10001AEF0(0, (unint64_t *)&unk_100029CB0);
  v13[1] = (uint64_t)&off_100025830;
  long long v14 = &v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionIdentifierPrefix];
  *long long v14 = 0;
  v14[1] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_sceneRole] = 0;
  uint64_t v15 = &v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_filter];
  uint64_t v16 = sub_10001E498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData] = 0;
  *(void *)&v1[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection] = 0;
  uint64_t v33 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue;
  uint64_t v32 = sub_10001AEF0(0, (unint64_t *)&qword_100029460);
  uint64_t v17 = v1;
  sub_10001E618();
  uint64_t v38 = &_swiftEmptyArrayStorage;
  uint64_t v30 = sub_10001AF2C(&qword_100029468, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  uint64_t v29 = sub_100004A08((uint64_t *)&unk_100029CC0);
  uint64_t v31 = sub_10001AF74(&qword_100029470, (uint64_t *)&unk_100029CC0);
  sub_10001E908();
  HIDWORD(v28) = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v34 = *(void *)(v34 + 104);
  uint64_t v18 = v4;
  uint64_t v19 = v4;
  uint64_t v20 = v35;
  ((void (*)(char *))v34)(v19);
  *(void *)&v1[v33] = sub_10001E898();
  *(void *)&v17[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___reportExtensionHostingController] = 0;
  uint64_t v21 = &v17[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___extensionController];
  *(_OWORD *)uint64_t v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  *((void *)v21 + 4) = 0;
  uint64_t v22 = &v17[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController____lazy_storage___dataSource];
  *(_OWORD *)uint64_t v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  *((void *)v22 + 4) = 0;
  sub_10001E288();
  uint64_t v23 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataUpdateQueue;
  sub_10001E618();
  uint64_t v38 = &_swiftEmptyArrayStorage;
  sub_10001E908();
  ((void (*)(char *, void, uint64_t))v34)(v18, HIDWORD(v28), v20);
  *(void *)&v17[v23] = sub_10001E898();

  uint64_t v24 = (objc_class *)type metadata accessor for ReportViewController();
  v37.receiver = v17;
  v37.super_class = v24;
  uint64_t v25 = v36;
  id v26 = objc_msgSendSuper2(&v37, "initWithCoder:", v36);

  return v26;
}

id sub_100016454()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReportViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000165A8()
{
  return type metadata accessor for ReportViewController();
}

uint64_t type metadata accessor for ReportViewController()
{
  uint64_t result = qword_100029A98;
  if (!qword_100029A98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000165FC()
{
  sub_100016728();
  if (v0 <= 0x3F)
  {
    sub_10001E298();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100016728()
{
  if (!qword_100029AA8)
  {
    sub_10001E498();
    unint64_t v0 = sub_10001E8C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100029AA8);
    }
  }
}

void sub_100016780(uint64_t a1, void (*a2)(uint64_t))
{
  if (a1)
  {
    swift_errorRetain();
    a2(a1);
    swift_errorRelease();
  }
  else
  {
    uint64_t v4 = (char *)[objc_allocWithZone((Class)type metadata accessor for TokenCoder()) init];
    if (*(void *)&v4[OBJC_IVAR____TtC27DeviceActivityReportService10TokenCoder_teamIdentifier + 8])
    {
      swift_bridgeObjectRetain();
      sub_10001E3C8();
    }
    else
    {
      if (qword_100029430 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_10001E5F8();
      sub_10000FABC(v5, (uint64_t)qword_100029E20);
      uint64_t v6 = sub_10001E5D8();
      os_log_type_t v7 = sub_10001E818();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to extract team identifier of client application", v8, 2u);
        swift_slowDealloc();
      }
    }
    sub_100013F00(v11);
    uint64_t v9 = v12;
    uint64_t v10 = v13;
    sub_1000125F8(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
    sub_10000FC54((uint64_t)v11);
    a2(0);
  }
}

void sub_100016AF4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_10001E1D8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100016B58(void *a1)
{
  if (*((unsigned char *)a1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData) == 1)
  {
    id v2 = [a1 viewIfLoaded];
    id v3 = [v2 window];

    if (v3)
    {

      if (qword_100029420 != -1) {
        swift_once();
      }
      sub_10001076C((uint64_t)a1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_dataRefresherObserverID);
    }
  }
}

uint64_t sub_100016CC8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_100004A08(&qword_100029C40);
  uint64_t result = __chkstk_darwin(v3);
  os_log_type_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  unint64_t v8 = v1[1];
  unint64_t v10 = *(void *)(*v1 + 16);
  if (v8 == v10)
  {
    uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v11(a1, 1, 1, v3);
  }
  else
  {
    if (v8 >= v10)
    {
      __break(1u);
    }
    else
    {
      uint64_t v20 = v5;
      uint64_t v12 = sub_10001E378();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = v13;
      unint64_t v15 = v9
          + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))
          + *(void *)(v13 + 72) * v8;
      v1[1] = v8 + 1;
      uint64_t v16 = &v7[*(int *)(v3 + 48)];
      uint64_t v17 = v1[2];
      uint64_t result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v13 + 16))(v16, v15, v12);
      if (!__OFADD__(v17, 1))
      {
        v1[2] = v17 + 1;
        uint64_t v18 = (char *)a1 + *(int *)(v3 + 48);
        *a1 = v17;
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v16, v12);
        return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(a1, 0, 1, v3);
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100016FF4(void *a1)
{
  id v3 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP23_DeviceActivity_SwiftUI30DeviceActivityReportServiceXPC_];
  [a1 setExportedInterface:v3];

  [a1 setExportedObject:v1];
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = sub_10001ACBC;
  uint64_t v14 = v4;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 1107296256;
  uint64_t v11 = sub_100006E5C;
  uint64_t v12 = &unk_100025420;
  uint64_t v5 = _Block_copy(&v9);
  swift_release();
  [a1 setInterruptionHandler:v5];
  _Block_release(v5);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = sub_10001ACC4;
  uint64_t v14 = v6;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 1107296256;
  uint64_t v11 = sub_100006E5C;
  uint64_t v12 = &unk_100025448;
  os_log_type_t v7 = _Block_copy(&v9);
  swift_release();
  [a1 setInvalidationHandler:v7];
  _Block_release(v7);
  [a1 activate];
  return 1;
}

uint64_t sub_1000171EC()
{
  if (qword_100029430 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001E5F8();
  sub_10000FABC(v0, (uint64_t)qword_100029E20);
  uint64_t v1 = sub_10001E5D8();
  os_log_type_t v2 = sub_10001E838();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Connection from client application was interrupted.", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = *(NSObject **)(result
                      + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue);
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = 1;
    *(void *)(v7 + 24) = v5;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = sub_10001AACC;
    *(void *)(v8 + 24) = v7;
    aBlock[4] = sub_10001B1C8;
    aBlock[5] = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100015904;
    uint64_t aBlock[3] = &unk_100025538;
    uint64_t v9 = _Block_copy(aBlock);
    id v10 = v5;
    swift_retain();
    swift_release();
    dispatch_sync(v6, v9);
    _Block_release(v9);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v6) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_10001742C()
{
  if (qword_100029430 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001E5F8();
  sub_10000FABC(v0, (uint64_t)qword_100029E20);
  uint64_t v1 = sub_10001E5D8();
  os_log_type_t v2 = sub_10001E838();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Connection from client application was invalidated.", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = *(NSObject **)(result
                      + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue);
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = 1;
    *(void *)(v7 + 24) = v5;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = sub_10001AACC;
    *(void *)(v8 + 24) = v7;
    aBlock[4] = sub_10001B1C8;
    aBlock[5] = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100015904;
    uint64_t aBlock[3] = &unk_1000254C0;
    uint64_t v9 = _Block_copy(aBlock);
    id v10 = v5;
    swift_retain();
    swift_release();
    dispatch_sync(v6, v9);
    _Block_release(v9);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v6) {
      __break(1u);
    }
  }
  return result;
}

void sub_1000176B8(void *a1, void *a2)
{
  uint64_t v5 = sub_10001E608();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001E628();
  id v10 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionIdentifierPrefix + 8);
  if (v14)
  {
    uint64_t v35 = v11;
    os_log_t v36 = v10;
    uint64_t v15 = *(void *)(v2 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionIdentifierPrefix);
    swift_bridgeObjectRetain();
    id v16 = [a1 extensionIdentities];
    sub_10001AEF0(0, (unint64_t *)&unk_100029BE0);
    unint64_t v17 = sub_10001E738();

    swift_bridgeObjectRetain();
    uint64_t v18 = sub_10001A7D4(v17, v15, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v18)
    {
      uint64_t v34 = v6;
      swift_bridgeObjectRelease();
      uint64_t v19 = swift_allocObject();
      id v20 = [objc_allocWithZone((Class)_EXHostViewControllerConfiguration) initWithExtensionIdentity:v18];
      *(void *)(v19 + 16) = v20;
      [v20 setBeginHostingImmediately:1];
      if (*(void *)(v2 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_sceneRole)) {
        objc_msgSend(v20, "setRole:");
      }
      sub_10001AEF0(0, (unint64_t *)&qword_100029460);
      uint64_t v21 = (void *)sub_10001E868();
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = a2;
      *(void *)(v22 + 24) = v19;
      aBlock[4] = (uint64_t)sub_10001AC64;
      aBlock[5] = v22;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100006E5C;
      uint64_t aBlock[3] = (uint64_t)&unk_1000253F8;
      uint64_t v23 = _Block_copy(aBlock);
      id v24 = a2;
      swift_retain();
      swift_release();
      sub_10001E618();
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      sub_10001AF2C((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100004A08(&qword_100029478);
      sub_10001AF74(&qword_100029C00, &qword_100029478);
      sub_10001E908();
      sub_10001E888();
      _Block_release(v23);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v5);
      (*(void (**)(char *, os_log_t))(v35 + 8))(v13, v36);
      swift_release();
    }
    else
    {
      if (qword_100029430 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_10001E5F8();
      sub_10000FABC(v29, (uint64_t)qword_100029E20);
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_10001E5D8();
      os_log_type_t v31 = sub_10001E818();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = 136446210;
        swift_bridgeObjectRetain();
        void aBlock[6] = sub_10001CFB0(v15, (unint64_t)v14, aBlock);
        sub_10001E8D8();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to find an extension for %{public}s", v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    if (qword_100029430 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_10001E5F8();
    sub_10000FABC(v25, (uint64_t)qword_100029E20);
    os_log_t v36 = (os_log_t)sub_10001E5D8();
    os_log_type_t v26 = sub_10001E818();
    if (os_log_type_enabled(v36, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v26, "Failed to find an extension because we do not have a prefix to search for.", v27, 2u);
      swift_slowDealloc();
    }
    os_log_t v28 = v36;
  }
}

uint64_t sub_100017EEC()
{
  if (qword_100029430 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001E5F8();
  sub_10000FABC(v0, (uint64_t)qword_100029E20);
  uint64_t v1 = sub_10001E5D8();
  os_log_type_t v2 = sub_10001E838();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Connection from client extension was interrupted.", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = *(NSObject **)(result
                      + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue);
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = 1;
    *(void *)(v7 + 24) = v5;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = sub_10001AACC;
    *(void *)(v8 + 24) = v7;
    aBlock[4] = sub_10001B1C8;
    aBlock[5] = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100015904;
    uint64_t aBlock[3] = &unk_100025380;
    uint64_t v9 = _Block_copy(aBlock);
    id v10 = v5;
    swift_retain();
    swift_release();
    dispatch_sync(v6, v9);
    _Block_release(v9);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v6) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_10001812C()
{
  if (qword_100029430 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001E5F8();
  sub_10000FABC(v0, (uint64_t)qword_100029E20);
  uint64_t v1 = sub_10001E5D8();
  os_log_type_t v2 = sub_10001E838();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Connection from client extension was invalidated.", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = *(NSObject **)(result
                      + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue);
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = 0;
    *(void *)(v7 + 24) = v5;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = sub_10001AACC;
    *(void *)(v8 + 24) = v7;
    aBlock[4] = sub_10001B1C8;
    aBlock[5] = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100015904;
    uint64_t aBlock[3] = &unk_100025308;
    uint64_t v9 = _Block_copy(aBlock);
    id v10 = v5;
    swift_retain();
    swift_release();
    dispatch_sync(v6, v9);
    _Block_release(v9);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v6) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100018368(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100018388(a1, a2, a3, *v3);
  uint8_t *v3 = (char *)result;
  return result;
}

uint64_t sub_100018388(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004A08(&qword_100029C70);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10001E9C8();
  __break(1u);
  return result;
}

uint64_t sub_1000184F4(unint64_t a1)
{
  return sub_10001CB18(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_100018508(unint64_t a1)
{
  return sub_10001CB4C(0, *(void *)(a1 + 16), 0, a1);
}

void sub_10001851C(void *a1, char *a2)
{
  id aBlock = 0;
  id v3 = [a1 makeXPCConnectionWithError:&aBlock];
  id v4 = aBlock;
  if (v3)
  {
    uint64_t v5 = v3;
    unint64_t v6 = self;
    id v7 = v4;
    id v8 = [v6 interfaceWithProtocol:&OBJC_PROTOCOL____TtP23_DeviceActivity_SwiftUI30DeviceActivityReportServiceXPC_];
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:a2];
    id v9 = [v6 interfaceWithProtocol:&OBJC_PROTOCOL____TtP23_DeviceActivity_SwiftUI32DeviceActivityReportExtensionXPC_];
    [v5 setRemoteObjectInterface:v9];

    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v30 = sub_10001AB58;
    uint64_t v31 = v10;
    id aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    os_log_t v28 = sub_100006E5C;
    uint64_t v29 = &unk_1000251F0;
    int64_t v11 = _Block_copy(&aBlock);
    swift_release();
    [v5 setInterruptionHandler:v11];
    _Block_release(v11);
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v30 = sub_10001AB60;
    uint64_t v31 = v12;
    id aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    os_log_t v28 = sub_100006E5C;
    uint64_t v29 = &unk_100025218;
    uint64_t v13 = _Block_copy(&aBlock);
    swift_release();
    [v5 setInvalidationHandler:v13];
    _Block_release(v13);
    [v5 activate];
    uint64_t v14 = *(NSObject **)&a2[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue];
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a2;
    *(void *)(v15 + 24) = v5;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_10001ABA8;
    *(void *)(v16 + 24) = v15;
    uint64_t v30 = sub_10001B1C8;
    uint64_t v31 = v16;
    id aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    os_log_t v28 = sub_100015904;
    uint64_t v29 = &unk_100025290;
    unint64_t v17 = _Block_copy(&aBlock);
    a2;
    id v18 = v5;
    swift_retain();
    swift_release();
    dispatch_sync(v14, v17);

    _Block_release(v17);
    LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v18 & 1) == 0)
    {
      sub_100014580();
      swift_release();
      return;
    }
    __break(1u);
  }
  else
  {
    id v19 = aBlock;
    sub_10001E1E8();

    swift_willThrow();
    if (qword_100029430 == -1) {
      goto LABEL_5;
    }
  }
  swift_once();
LABEL_5:
  uint64_t v20 = sub_10001E5F8();
  sub_10000FABC(v20, (uint64_t)qword_100029E20);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v21 = sub_10001E5D8();
  os_log_type_t v22 = sub_10001E818();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    id aBlock = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136446210;
    swift_errorRetain();
    sub_100004A08(&qword_100029BD0);
    uint64_t v24 = sub_10001E6C8();
    sub_10001CFB0(v24, v25, (uint64_t *)&aBlock);
    sub_10001E8D8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to establish a connection with the client's extension: %{public}s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_100018AA4(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = sub_100004A08(&qword_100029C50);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10001E608();
  uint64_t v90 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v88 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_10001E628();
  uint64_t v87 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v86 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004A08(&qword_100029C10);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_10001E498();
  uint64_t v14 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  char v96 = (char *)&v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10001E5C8();
  uint64_t v94 = *(void *)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  id v19 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  char v95 = (char *)&v79 - v20;
  uint64_t v91 = a3;
  uint64_t v21 = (void *)(*(uint64_t (**)(void))(*(void *)&a3[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_connection
                                                    + 8]
                                     + 8))();
  if (v21)
  {
    id v93 = v21;
    sub_10001E0C8();
    swift_allocObject();
    sub_10001E0B8();
    sub_10001AF2C(&qword_100029C58, (void (*)(uint64_t))&type metadata accessor for DeviceActivityReport.ClientConfiguration);
    sub_10001E0A8();
    swift_release();
    (*(void (**)(char *, char *, uint64_t))(v94 + 32))(v95, v19, v16);
    sub_10001E5A8();
    uint64_t v25 = sub_10001E598();
    if (v26)
    {
      uint64_t v27 = v25;
      uint64_t v28 = v26;
      uint64_t v29 = v91;
      id v30 = v93;
      if (((*(uint64_t (**)(id))(*(void *)&v91[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_usageTrackingConnection
                                                          + 8]
                                          + 8))(v93) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        sub_10001AD4C();
        swift_allocError();
        *uint64_t v46 = 2;
        uint64_t v47 = (void *)sub_10001E1D8();
        (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v47);

        swift_errorRelease();
        (*(void (**)(char *, uint64_t))(v14 + 8))(v96, v92);
        return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v95, v16);
      }
      uint64_t v83 = a4;
      uint64_t v31 = (uint64_t *)&v29[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionIdentifierPrefix];
      *uint64_t v31 = v27;
      v31[1] = v28;
      swift_bridgeObjectRelease();
      v29[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData] = 1;
LABEL_9:
      uint64_t v32 = v92;
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v13, v96, v92);
      uint64_t v84 = v14;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v13, 0, 1, v32);
      uint64_t v33 = (uint64_t)&v29[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_filter];
      swift_beginAccess();
      sub_100012530((uint64_t)v13, v33, &qword_100029C10);
      swift_endAccess();
      sub_10001E5B8();
      NSString v34 = sub_10001E688();
      swift_bridgeObjectRelease();
      uint64_t v35 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_sceneRole;
      if (*(void *)&v29[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_sceneRole])
      {
        uint64_t v36 = sub_10001E6B8();
        uint64_t v38 = v37;
        if (v36 == sub_10001E6B8() && v38 == v39)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v40 = v85;
LABEL_20:
          sub_100014580();
LABEL_23:
          sub_10001AEF0(0, (unint64_t *)&qword_100029460);
          uint64_t v60 = (void *)sub_10001E868();
          uint64_t v61 = swift_allocObject();
          *(void *)(v61 + 16) = v29;
          uint64_t v99 = sub_10001AE2C;
          uint64_t v100 = v61;
          aBlock[0] = (uint64_t)_NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_100006E5C;
          char v98 = &unk_100025588;
          uint64_t v62 = _Block_copy(aBlock);
          int v63 = v29;
          swift_release();
          uint64_t v64 = v86;
          sub_10001E618();
          aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
          sub_10001AF2C((unint64_t *)&unk_100029BF0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
          sub_100004A08(&qword_100029478);
          sub_10001AF74(&qword_100029C00, &qword_100029478);
          uint64_t v65 = v88;
          sub_10001E908();
          sub_10001E888();
          _Block_release(v62);

          (*(void (**)(char *, uint64_t))(v90 + 8))(v65, v40);
          (*(void (**)(char *, uint64_t))(v87 + 8))(v64, v89);
          (*(void (**)(uint64_t, void))(v83 + 16))(v83, 0);

          (*(void (**)(char *, uint64_t))(v84 + 8))(v96, v92);
          return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v95, v16);
        }
        char v58 = sub_10001E9F8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v40 = v85;
        if (v58) {
          goto LABEL_20;
        }
        unint64_t v57 = *(void **)&v29[v35];
      }
      else
      {
        unint64_t v57 = 0;
        uint64_t v40 = v85;
      }
      *(void *)&v29[v35] = v34;
      id v59 = v34;

      sub_1000136A4();
      goto LABEL_23;
    }
    uint64_t v84 = v14;
    uint64_t v83 = a4;
    uint64_t v80 = v16;
    uint64_t v41 = *(void **)&v91[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_bundleRecord];
    uint64_t v42 = *(void *)&v91[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_bundleRecord + 8];
    [v93 auditToken];
    uint64_t v43 = v101;
    uint64_t v81 = v102;
    uint64_t v44 = v103;
    uint64_t v45 = v104;
    uint64_t v82 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))(v42 + 8);
    char v98 = v41;
    uint64_t v99 = (void (*)())v42;
    uint64_t v79 = sub_100012B9C(aBlock);
    v82(v43, v81, v44, v45, v41, v42);
    uint64_t v48 = (*(uint64_t (**)(void *, uint64_t))(v42 + 16))(v41, v42);
    if (v49)
    {
      uint64_t v50 = v48;
      uint64_t v51 = v49;
      uint64_t v52 = &v91[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_usageTrackingConnection];
      id v53 = v93;
      char v54 = (*(uint64_t (**)(id))(*(void *)&v91[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_usageTrackingConnection
                                                          + 8]
                                          + 8))(v93);
      char v55 = (*(uint64_t (**)(id))(*((void *)v52 + 1) + 16))(v53);
      if (v54)
      {
        unsigned __int8 v56 = 1;
        goto LABEL_29;
      }
      if (v55)
      {
        ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
        NSString v69 = sub_10001E688();
        unsigned __int8 v56 = [ObjCClassFromMetadata isAuthorized:v69];

LABEL_29:
        uint64_t v70 = OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData;
        uint64_t v71 = v91;
        v91[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_isAuthorizedForLocalData] = v56;
        sub_10001E488();
        uint64_t v72 = sub_10001E478();
        int v73 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v72 - 8) + 48))(v8, 1, v72);
        sub_10000FCA4((uint64_t)v8, &qword_100029C50);
        uint64_t v74 = v94;
        uint64_t v16 = v80;
        if (v73 != 1 || v71[v70] == 1)
        {
          uint64_t v75 = (uint64_t *)&v71[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_extensionIdentifierPrefix];
          uint64_t *v75 = v50;
          v75[1] = v51;
          swift_bridgeObjectRelease();
          sub_10000FC54((uint64_t)aBlock);
          uint64_t v14 = v84;
          uint64_t v29 = v71;
          goto LABEL_9;
        }
        swift_bridgeObjectRelease();
        sub_10001AD4C();
        swift_allocError();
        *uint64_t v77 = 2;
        uint64_t v78 = (void *)sub_10001E1D8();
        (*(void (**)(uint64_t, void *))(v83 + 16))(v83, v78);

        swift_errorRelease();
        (*(void (**)(char *, uint64_t))(v84 + 8))(v96, v92);
        (*(void (**)(char *, uint64_t))(v74 + 8))(v95, v16);
        return sub_10000FC54((uint64_t)aBlock);
      }
      swift_bridgeObjectRelease();
      sub_10001AD4C();
      swift_allocError();
      char v67 = 2;
    }
    else
    {
      sub_10001AD4C();
      swift_allocError();
      char v67 = 1;
    }
    char *v66 = v67;
    uint64_t v76 = (void *)sub_10001E1D8();
    (*(void (**)(uint64_t, void *))(v83 + 16))(v83, v76);

    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v96, v92);
    (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v80);
    return sub_10000FC54((uint64_t)aBlock);
  }
  sub_10001AD4C();
  swift_allocError();
  *os_log_type_t v22 = 0;
  uint64_t v23 = (void *)sub_10001E1D8();
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v23);

  return swift_errorRelease();
}

uint64_t sub_1000197E4(uint64_t a1, unint64_t a2, unsigned int (**a3)(char *, uint64_t, uint64_t), void (**a4)(unint64_t *, uint64_t, uint64_t, uint64_t), uint64_t a5, uint64_t a6, void (**a7)(char *, char *, uint64_t), char *a8, unint64_t a9)
{
  uint64_t v123 = a6;
  uint64_t v124 = a7;
  unint64_t v117 = a4;
  v116 = a3;
  unint64_t v115 = a2;
  unint64_t v10 = a9;
  uint64_t v120 = sub_10001E348();
  uint64_t v126 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v127 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100004A08(&qword_100029C08);
  unint64_t v114 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v109 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004A08(&qword_100029C10);
  __chkstk_darwin(v13 - 8);
  uint64_t v99 = (uint64_t)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_10001E498();
  uint64_t v100 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  char v97 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004A08(&qword_100029C18);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  char v118 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v122 = (char *)&v91 - v19;
  uint64_t v107 = sub_10001E378();
  uint64_t v121 = *(void *)(v107 - 8);
  __chkstk_darwin(v107);
  uint64_t v106 = (char *)&v91 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100004A08(&qword_100029C20);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v105 = (uint64_t *)((char *)&v91 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v22);
  v125 = (char *)&v91 - v24;
  uint64_t v25 = sub_100004A08(&qword_100029C28);
  __chkstk_darwin(v25 - 8);
  uint64_t v27 = (char *)&v91 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_10001E3B8();
  uint64_t v103 = *(void *)(v104 - 8);
  uint64_t v28 = __chkstk_darwin(v104);
  char v98 = (char *)&v91 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v91 - v30;
  uint64_t v32 = sub_100004A08(&qword_100029C30);
  __chkstk_darwin(v32 - 8);
  NSString v34 = (char *)&v91 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10001E4C8();
  uint64_t v36 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v38 = (char *)&v91 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001E4B8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35) == 1)
  {
    sub_10000FCA4((uint64_t)v34, &qword_100029C30);
    sub_10001AD4C();
    swift_allocError();
    *uint64_t v39 = 3;
    uint64_t v40 = (void *)sub_10001E1D8();
    (*(void (**)(unint64_t, void, void *))(a9 + 16))(a9, 0, v40);

    return swift_errorRelease();
  }
  BOOL v113 = v31;
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v38, v34, v35);
  sub_1000140BC(&v132);
  sub_1000125F8(&v132, v133);
  sub_10001E4D8();
  uint64_t v92 = v38;
  uint64_t v94 = v36;
  uint64_t v93 = v35;
  uint64_t v42 = v103;
  uint64_t v43 = v104;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v103 + 48))(v27, 1, v104) == 1)
  {
    sub_10000FCA4((uint64_t)v27, &qword_100029C28);
    sub_10000FC54((uint64_t)&v132);
    (*(void (**)(unint64_t, void, void))(a9 + 16))(a9, 0, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v92, v93);
  }
  uint64_t v91 = 0;
  uint64_t v44 = v113;
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v113, v27, v43);
  sub_10000FC54((uint64_t)&v132);
  uint64_t v45 = sub_10001E398();
  uint64_t v112 = (uint64_t *)&a8[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_appInfoCache];
  uint64_t v102 = (void (**)(char *, char *, uint64_t))(v121 + 32);
  uint64_t v130 = 0;
  uint64_t v131 = 0;
  uint64_t v108 = v126 + 16;
  uint64_t v124 = (void (**)(char *, char *, uint64_t))(v126 + 32);
  unint64_t v117 = (void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(v114 + 56);
  v116 = (unsigned int (**)(char *, uint64_t, uint64_t))(v114 + 48);
  uint64_t v129 = v45;
  uint64_t v110 = v126 + 8;
  char v95 = (void (**)(char *, uint64_t))(v121 + 8);
  uint64_t v46 = v120;
  uint64_t v47 = v119;
  uint64_t v48 = (unint64_t *)v118;
  uint64_t v49 = v122;
  uint64_t v50 = v125;
  unint64_t v96 = a9;
  unint64_t v111 = a8;
LABEL_7:
  uint64_t v51 = v105;
  sub_100016CC8(v105);
  sub_100012C00((uint64_t)v51, (uint64_t)v50, &qword_100029C20);
  uint64_t v52 = sub_100004A08(&qword_100029C40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v52 - 8) + 48))(v50, 1, v52) != 1)
  {
    unint64_t v115 = *(void *)v50;
    (*v102)(v106, &v50[*(int *)(v52 + 48)], v107);
    uint64_t result = sub_10001E368();
    unint64_t v10 = 0;
    unint64_t v53 = *(void *)(result + 16);
    uint64_t v123 = result;
    unint64_t v114 = v53;
    if (!v53)
    {
LABEL_9:
      uint64_t v54 = 1;
      unint64_t v10 = v53;
      goto LABEL_12;
    }
    while (1)
    {
      if (v10 >= *(void *)(result + 16))
      {
        __break(1u);
        return result;
      }
      uint64_t v55 = v126;
      unsigned __int8 v56 = &v109[*(int *)(v47 + 48)];
      (*(void (**)(char *, unint64_t, uint64_t))(v126 + 16))(v56, result+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v10, v46);
      unint64_t v57 = (char *)v48 + *(int *)(v47 + 48);
      *uint64_t v48 = v10;
      char v58 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
      uint64_t v50 = v125;
      v58(v57, v56, v46);
      uint64_t v54 = 0;
      ++v10;
LABEL_12:
      (*v117)(v48, v54, 1, v47);
      sub_100012C00((uint64_t)v48, (uint64_t)v49, &qword_100029C18);
      if ((*v116)(v49, 1, v47) == 1)
      {
        swift_bridgeObjectRelease();
        (*v95)(v106, v107);
        unint64_t v10 = v96;
        goto LABEL_7;
      }
      unint64_t v59 = *(void *)v49;
      (*v124)(v127, &v49[*(int *)(v47 + 48)], v46);
      uint64_t v60 = sub_10001E328();
      uint64_t v62 = v61;
      uint64_t v64 = v112[1];
      uint64_t v65 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
      uint64_t v133 = *v112;
      uint64_t v63 = v133;
      uint64_t v134 = v64;
      sub_100012B9C(&v132);
      v65(v63, v64);
      uint64_t v44 = v113;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v64 + 16))(v60, v62, v63, v64);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_release();
      sub_10000FC54((uint64_t)&v132);
      uint64_t v66 = (void (*)(uint64_t *, void))sub_10001E388();
      a8 = (char *)v67;
      unint64_t v68 = *v67;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)a8 = v68;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_100018508(v68);
        unint64_t v68 = isUniquelyReferenced_nonNull_native;
        *(void *)a8 = isUniquelyReferenced_nonNull_native;
      }
      uint64_t v49 = v122;
      if ((v115 & 0x8000000000000000) != 0) {
        break;
      }
      if (v115 >= *(void *)(v68 + 16)) {
        goto LABEL_30;
      }
      a8 = (char *)sub_10001E358();
      uint64_t v72 = v71;
      unint64_t v73 = *v71;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      void *v72 = v73;
      if (isUniquelyReferenced_nonNull_native)
      {
        if ((v59 & 0x8000000000000000) != 0) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_1000184F4(v73);
        unint64_t v73 = isUniquelyReferenced_nonNull_native;
        void *v72 = isUniquelyReferenced_nonNull_native;
        if ((v59 & 0x8000000000000000) != 0)
        {
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
      }
      if (v59 >= *(void *)(v73 + 16)) {
        goto LABEL_31;
      }
      uint64_t v74 = v126;
      sub_10001E338();
      ((void (*)(char *, void))a8)(v128, 0);
      v66(&v132, 0);
      uint64_t v46 = v120;
      (*(void (**)(char *, uint64_t))(v74 + 8))(v127, v120);
      a8 = v111;
      uint64_t v47 = v119;
      uint64_t v48 = (unint64_t *)v118;
      uint64_t v50 = v125;
      uint64_t result = v123;
      unint64_t v53 = v114;
      if (v10 == v114) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
LABEL_24:
  swift_bridgeObjectRelease();
  uint64_t v75 = &a8[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_filter];
  swift_beginAccess();
  uint64_t v76 = (uint64_t)v75;
  uint64_t v77 = v99;
  sub_100012C64(v76, v99, &qword_100029C10);
  uint64_t v78 = v100;
  uint64_t v79 = v101;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v77, 1, v101) == 1)
  {
    sub_10000FCA4(v77, &qword_100029C10);
  }
  else
  {
    uint64_t v80 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v97, v77, v79);
    sub_10001E398();
    sub_10001E758();
    swift_bridgeObjectRelease();
    sub_10001E3A8();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v80, v79);
  }
  a8 = v98;
  sub_10001E0F8();
  swift_allocObject();
  sub_10001E0E8();
  uint64_t v49 = (char *)v103;
  uint64_t v66 = (void (*)(uint64_t *, void))v104;
  (*(void (**)(char *, char *, uint64_t))(v103 + 16))(a8, v44, v104);
  sub_10001AF2C(&qword_100029C48, (void (*)(uint64_t))&type metadata accessor for _DeviceActivityData.ActivitySegment);
  uint64_t v81 = v91;
  uint64_t isUniquelyReferenced_nonNull_native = sub_10001E0D8();
  if (!v81)
  {
LABEL_32:
    uint64_t v85 = isUniquelyReferenced_nonNull_native;
    unint64_t v86 = v70;
    unint64_t v87 = v10;
    uint64_t v83 = (void (*)(char *, void))*((void *)v49 + 1);
    v83(a8, v66);
    swift_release();
    sub_10000F998(v85, v86);
    Class isa = sub_10001E228().super.isa;
    (*(void (**)(unint64_t, Class, void))(v87 + 16))(v87, isa, 0);

    sub_10000F9F0(v85, v86);
    sub_10000F9F0(v85, v86);
    goto LABEL_33;
  }
  unint64_t v82 = v10;
  uint64_t v83 = (void (*)(char *, void))*((void *)v49 + 1);
  v83(a8, v66);
  swift_release();
  swift_errorRetain();
  uint64_t v84 = (void *)sub_10001E1D8();
  (*(void (**)(unint64_t, void, void *))(v82 + 16))(v82, 0, v84);

  swift_errorRelease();
  swift_errorRelease();
LABEL_33:
  uint64_t v89 = v93;
  uint64_t v90 = v92;
  v83(v44, v66);
  return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v90, v89);
}

void *sub_10001A7D4(unint64_t a1, uint64_t a2, void *a3)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_10001E998())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)sub_10001E968() : *(id *)(a1 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = [v6 bundleIdentifier];
      sub_10001E6B8();

      v13._countAndFlagsBits = a2;
      v13._object = a3;
      LOBYTE(v9) = sub_10001E708(v13);
      swift_bridgeObjectRelease();
      if (v9)
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10001A938()
{
  uint64_t v1 = *(NSObject **)&v0[OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnectionQueue];
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_10001AACC;
  *(void *)(v3 + 24) = v2;
  void v8[4] = sub_10001AAE0;
  v8[5] = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100015904;
  v8[3] = &unk_1000251A0;
  uint64_t v4 = _Block_copy(v8);
  uint64_t v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001AA94()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001AAD0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001AAE0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001AB08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001AB18()
{
  return swift_release();
}

uint64_t sub_10001AB20()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001AB58()
{
  return sub_100017EEC();
}

uint64_t sub_10001AB60()
{
  return sub_10001812C();
}

uint64_t sub_10001AB68()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001ABA8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  id v4 = *(id *)(v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection);
  *(void *)(v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection) = v2;
  id v3 = v2;
}

uint64_t sub_10001ABF4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001AC04()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001AC14()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001AC24()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_10001AC64()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_beginAccess();
  return [v1 setConfiguration:*(void *)(v2 + 16)];
}

uint64_t sub_10001ACBC()
{
  return sub_1000171EC();
}

uint64_t sub_10001ACC4()
{
  return sub_10001742C();
}

uint64_t sub_10001ACCC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001ACDC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (*(unsigned char *)(v0 + 16) == 1) {
    [*(id *)(v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection) invalidate];
  }
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection);
  *(void *)(v1 + OBJC_IVAR____TtC27DeviceActivityReportService20ReportViewController_reportExtensionConnection) = 0;
}

uint64_t sub_10001AD3C()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10001AD4C()
{
  unint64_t result = qword_100029C38;
  if (!qword_100029C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029C38);
  }
  return result;
}

uint64_t sub_10001ADA0(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_10001ADF4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001AE2C()
{
  sub_100016B58(*(void **)(v0 + 16));
}

void sub_10001AE34()
{
  sub_100013970(*(void *)(v0 + 16));
}

uint64_t sub_10001AE3C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001AE74(uint64_t a1)
{
  sub_100016AF4(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001AE7C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001AEBC(uint64_t a1)
{
  sub_100016780(a1, *(void (**)(uint64_t))(v1 + 16));
}

void sub_10001AEC8()
{
  sub_10001482C(*(void *)(v0 + 16));
}

uint64_t sub_10001AED0@<X0>(void *a1@<X8>)
{
  return sub_100013AEC(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001AEF0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10001AF2C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001AF74(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000547C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReportViewController.ClientError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ReportViewController.ClientError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001B120);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReportViewController.ClientError()
{
  return &type metadata for ReportViewController.ClientError;
}

unint64_t sub_10001B15C()
{
  unint64_t result = qword_100029CD0;
  if (!qword_100029CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029CD0);
  }
  return result;
}

uint64_t sub_10001B1B0@<X0>(void *a1@<X8>)
{
  return sub_10001AED0(a1);
}

_UNKNOWN **sub_10001B270()
{
  return &off_100029D40;
}

id sub_10001B27C()
{
  return [*v0 isValid];
}

uint64_t sub_10001B2A0@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>, double a5@<D0>)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  v15[4] = sub_10001B498;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10001B3D8;
  v15[3] = &unk_1000257F8;
  uint64_t v11 = _Block_copy(v15);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_retain();
  swift_retain();
  id v13 = [ObjCClassFromMetadata scheduledTimerWithTimeInterval:a1 & 1 repeats:v11 block:a5];
  _Block_release(v11);
  swift_release();
  uint64_t result = swift_release();
  *a4 = v13;
  return result;
}

void sub_10001B3D8(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_10001B440()
{
  return [*v0 fire];
}

id sub_10001B450()
{
  return [*v0 invalidate];
}

uint64_t sub_10001B460()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B498(uint64_t a1)
{
  int v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_10001B4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001B4E0()
{
  return swift_release();
}

uint64_t sub_10001B4E8()
{
  uint64_t v0 = sub_10001E518();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unsigned int v6 = (char *)&v10 - v5;
  sub_10001E508();
  BOOL v7 = (char *)objc_allocWithZone((Class)type metadata accessor for TokenCoder());
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  id v8 = sub_10001D618(0x656C707041, 0xE500000000000000, (uint64_t)v4, v7);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  qword_100029E50 = (uint64_t)v8;
  return result;
}

id sub_10001B680()
{
  uint64_t v1 = sub_10001E518();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&token - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  BOOL v7 = (char *)&token - v6;
  id v8 = self;
  id v9 = v0;
  id v10 = [v8 currentConnection];
  if (!v10)
  {
    if (qword_100029438 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_10001E5F8();
    sub_10000FABC(v18, (uint64_t)qword_100029E38);
    uint64_t v19 = sub_10001E5D8();
    os_log_type_t v20 = sub_10001E818();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to get the current XPC connection", v21, 2u);
      swift_slowDealloc();
    }

    goto LABEL_14;
  }
  uint64_t v11 = v10;
  [v10 auditToken];
  SecTaskRef v12 = SecTaskCreateWithAuditToken(0, &token);
  if (!v12 || (uint64_t v13 = sub_10001B970(), !v14))
  {
    if (os_variant_allows_internal_security_policies())
    {
      uint64_t v15 = sub_10001BB94();
      uint64_t v16 = v17;

      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_15;
  }
  uint64_t v15 = v13;
  uint64_t v16 = v14;

LABEL_7:
LABEL_15:
  sub_10001E508();
  uint64_t v22 = (char *)objc_allocWithZone((Class)type metadata accessor for TokenCoder());
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  id v23 = sub_10001D618(v15, v16, (uint64_t)v5, v22);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v23;
}

uint64_t sub_10001B970()
{
  id v12 = 0;
  uint64_t v0 = SecTaskCopyTeamIdentifier();
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    uint64_t v2 = sub_10001E6B8();
  }
  else
  {
    if (qword_100029438 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_10001E5F8();
    sub_10000FABC(v3, (uint64_t)qword_100029E38);
    id v4 = v12;
    uint64_t v5 = sub_10001E5D8();
    os_log_type_t v6 = sub_10001E838();
    if (os_log_type_enabled(v5, v6))
    {
      BOOL v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)BOOL v7 = 136446210;
      sub_100004A08(&qword_100029DC8);
      uint64_t v8 = sub_10001E8B8();
      sub_10001CFB0(v8, v9, &v11);
      sub_10001E8D8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to extract team identifier from SecTask: %{public}s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  return v2;
}

uint64_t sub_10001BB94()
{
  NSString v1 = sub_10001E688();
  id v2 = [v0 valueForEntitlement:v1];

  if (v2)
  {
    sub_10001E8F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10001DF04((uint64_t)v9, (uint64_t)v10);
  if (v11)
  {
    if (swift_dynamicCast()) {
      return v8;
    }
  }
  else
  {
    sub_10001DF6C((uint64_t)v10);
  }
  if (qword_100029438 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10001E5F8();
  sub_10000FABC(v4, (uint64_t)qword_100029E38);
  uint64_t v5 = sub_10001E5D8();
  os_log_type_t v6 = sub_10001E838();
  if (os_log_type_enabled(v5, v6))
  {
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to extract team identifier from connection entitlements", v7, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_10001BD54()
{
  return sub_10001E538();
}

uint64_t sub_10001BE48()
{
  return sub_10001E548();
}

uint64_t sub_10001BF3C()
{
  return sub_10001E558();
}

uint64_t sub_10001C030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, uint64_t))
{
  uint64_t v8 = sub_100004A08(&qword_100029DB8);
  uint64_t v27 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F998(*(void *)a2, *(void *)(a2 + 8));
  sub_10001E4F8();
  uint64_t v11 = *(void *)(a3 + OBJC_IVAR____TtC27DeviceActivityReportService10TokenCoder_decoder);
  if (!v11)
  {
    if (qword_100029438 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_10001E5F8();
    sub_10000FABC(v21, (uint64_t)qword_100029E38);
    uint64_t v22 = sub_10001E5D8();
    os_log_type_t v23 = sub_10001E818();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to create token decoder", v24, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  }
  swift_retain();
  Swift::Int v12 = a4(v10, v11);
  if (!v4)
  {
    sub_100009D54(&v28, v12, v13);
    swift_release();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  }
  if (qword_100029438 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10001E5F8();
  sub_10000FABC(v14, (uint64_t)qword_100029E38);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v15 = sub_10001E5D8();
  os_log_type_t v16 = sub_10001E818();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v26 = v8;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136446210;
    v25[1] = v17 + 4;
    uint64_t v29 = v4;
    swift_errorRetain();
    sub_100004A08(&qword_100029BD0);
    uint64_t v18 = sub_10001E6C8();
    uint64_t v29 = sub_10001CFB0(v18, v19, &v28);
    sub_10001E8D8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to decode token: %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    swift_errorRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v10, v26);
  }
  else
  {

    swift_release();
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  }
}

Class sub_10001C498(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_10001E7D8();
  id v7 = a1;
  uint64_t v8 = sub_10001DCB8(v6, (uint64_t)v7, a4);
  sub_10000E944(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000F944();
  v9.super.Class isa = sub_10001E7C8().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

Class sub_10001C590(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_10001E6B8();
  uint64_t v8 = v7;
  id v9 = a1;
  uint64_t v10 = sub_10001C660(v6, v8, (uint64_t)v9, a4);
  unint64_t v12 = v11;

  swift_bridgeObjectRelease();
  if (v12 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_10001E228().super.isa;
    sub_10000FBE4(v10, v12);
  }

  return isa;
}

uint64_t sub_10001C660(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = sub_100004A08(&qword_100029DB8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a3 + OBJC_IVAR____TtC27DeviceActivityReportService10TokenCoder_encoder))
  {
    swift_retain();
    a4(a1, a2);
    uint64_t v16 = sub_10001E4E8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    if (qword_100029438 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10001E5F8();
    sub_10000FABC(v12, (uint64_t)qword_100029E38);
    Swift::Int v13 = sub_10001E5D8();
    os_log_type_t v14 = sub_10001E818();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Failed to create token encoder", v15, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return v16;
}

id sub_10001CA14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TokenCoder();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TokenCoder()
{
  return self;
}

uint64_t sub_10001CACC(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001CADC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10001CB18(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001CB80(a1, a2, a3, a4, &qword_100029DD0, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.ApplicationActivity, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.ApplicationActivity);
}

uint64_t sub_10001CB4C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001CB80(a1, a2, a3, a4, &qword_100029DD8, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.CategoryActivity, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.CategoryActivity);
}

uint64_t sub_10001CB80(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004A08(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_10001E988();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001D854(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

char *sub_10001CE00(char *result, int64_t a2, char a3, char *a4)
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
      sub_100004A08(&qword_100029C70);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_10001DBC4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001CF10(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001CF38(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001CFB0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_10001E8D8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001CFB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001D084(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000FBF8((uint64_t)v12, *a3);
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
      sub_10000FBF8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000FC54((uint64_t)v12);
  return v7;
}

uint64_t sub_10001D084(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001E8E8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001D240(a5, a6);
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
  uint64_t v8 = sub_10001E978();
  if (!v8)
  {
    sub_10001E988();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001E9C8();
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

uint64_t sub_10001D240(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001D2D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001D4B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001D4B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001D2D8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001D450(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001E958();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001E988();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001E6F8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001E9C8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001E988();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001D450(uint64_t a1, uint64_t a2)
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
  sub_100004A08(&qword_100029DC0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001D4B8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004A08(&qword_100029DC0);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_10001E9C8();
  __break(1u);
  return result;
}

unsigned char **sub_10001D608(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

id sub_10001D618(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v8 = sub_10001E518();
  v22[3] = v8;
  v22[4] = (uint64_t)&protocol witness table for KeyRetriever;
  int64_t v9 = sub_100012B9C(v22);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v9, a3, v8);
  uint64_t v10 = &a4[OBJC_IVAR____TtC27DeviceActivityReportService10TokenCoder_teamIdentifier];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  swift_bridgeObjectRetain();
  size_t v11 = a4;
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_100012594((uint64_t)v22, (uint64_t)v20);
    sub_10001E568();
    swift_allocObject();
    swift_bridgeObjectRetain();
    *(void *)&v11[OBJC_IVAR____TtC27DeviceActivityReportService10TokenCoder_decoder] = sub_10001E528();
    sub_100012594((uint64_t)v22, (uint64_t)v20);
    sub_10001E588();
    swift_allocObject();
    uint64_t v12 = sub_10001E578();
  }
  else
  {
    if (qword_100029438 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10001E5F8();
    sub_10000FABC(v13, (uint64_t)qword_100029E38);
    uint64_t v14 = sub_10001E5D8();
    os_log_type_t v15 = sub_10001E818();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to create token coder with nil team identifier", v16, 2u);
      swift_slowDealloc();
    }

    uint64_t v12 = 0;
    *(void *)&v11[OBJC_IVAR____TtC27DeviceActivityReportService10TokenCoder_decoder] = 0;
  }
  *(void *)&v11[OBJC_IVAR____TtC27DeviceActivityReportService10TokenCoder_encoder] = v12;

  unint64_t v17 = (objc_class *)type metadata accessor for TokenCoder();
  v21.receiver = v11;
  v21.super_class = v17;
  id v18 = objc_msgSendSuper2(&v21, "init");
  sub_10000FC54((uint64_t)v22);
  return v18;
}

uint64_t sub_10001D854(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_10001E9C8();
  __break(1u);
  return result;
}

uint64_t sub_10001D9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, uint64_t))
{
  uint64_t v24 = a1;
  uint64_t v21 = a2 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a2 + 56);
  int64_t v22 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    id v18 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    v23[0] = v19;
    v23[1] = v20;
    sub_10000F998(v19, v20);
    sub_10001C030((uint64_t)&v24, (uint64_t)v23, a3, a4);
    if (v4)
    {
      swift_bridgeObjectRelease();
      sub_10000F9F0(v19, v20);
      return swift_release();
    }
    uint64_t result = sub_10000F9F0(v19, v20);
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v22) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v21 + 8 * v12);
    if (!v16) {
      break;
    }
LABEL_17:
    unint64_t v10 = (v16 - 1) & v16;
  }
  int64_t v17 = v12 + 1;
  if (v12 + 1 >= v22) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v21 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 2;
  if (v12 + 2 >= v22) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v21 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 3;
  if (v12 + 3 >= v22) {
    goto LABEL_26;
  }
  unint64_t v16 = *(void *)(v21 + 8 * v17);
  if (v16) {
    goto LABEL_16;
  }
  int64_t v17 = v12 + 4;
  if (v12 + 4 >= v22)
  {
LABEL_26:
    swift_release();
    return v24;
  }
  unint64_t v16 = *(void *)(v21 + 8 * v17);
  if (v16)
  {
LABEL_16:
    int64_t v12 = v17;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v22) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v21 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10001DBC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10001E9C8();
  __break(1u);
  return result;
}

uint64_t sub_10001DCB8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v27 = (char *)&_swiftEmptyArrayStorage;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v11 << 6))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10001C660(v15, v16, a2, a3);
    unint64_t v19 = v18;
    uint64_t result = swift_bridgeObjectRelease();
    if (v19 >> 60 == 15)
    {
      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10001CE00(0, *((void *)v27 + 2) + 1, 1, v27);
        uint64_t v27 = (char *)result;
      }
      unint64_t v24 = *((void *)v27 + 2);
      unint64_t v23 = *((void *)v27 + 3);
      unint64_t v25 = v24 + 1;
      if (v24 >= v23 >> 1)
      {
        uint64_t result = (uint64_t)sub_10001CE00((char *)(v23 > 1), v24 + 1, 1, v27);
        unint64_t v25 = v24 + 1;
        uint64_t v27 = (char *)result;
      }
      *((void *)v27 + 2) = v25;
      uint64_t v26 = &v27[16 * v24];
      *((void *)v26 + 4) = v17;
      *((void *)v26 + 5) = v19;
      if (v8) {
        goto LABEL_4;
      }
    }
LABEL_7:
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v20 >= v9) {
      goto LABEL_29;
    }
    unint64_t v21 = *(void *)(v28 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v9) {
        goto LABEL_29;
      }
      unint64_t v21 = *(void *)(v28 + 8 * v11);
      if (!v21)
      {
        int64_t v11 = v20 + 2;
        if (v20 + 2 >= v9) {
          goto LABEL_29;
        }
        unint64_t v21 = *(void *)(v28 + 8 * v11);
        if (!v21)
        {
          int64_t v11 = v20 + 3;
          if (v20 + 3 >= v9) {
            goto LABEL_29;
          }
          unint64_t v21 = *(void *)(v28 + 8 * v11);
          if (!v21) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v21 - 1) & v21;
  }
  int64_t v22 = v20 + 4;
  if (v22 >= v9)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v27;
  }
  unint64_t v21 = *(void *)(v28 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_29;
    }
    unint64_t v21 = *(void *)(v28 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_10001DF04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A08(&qword_100029738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001DF6C(uint64_t a1)
{
  uint64_t v2 = sub_100004A08(&qword_100029738);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10001DFCC()
{
  id v0 = [(id)swift_getObjCClassFromMetadata() currentConnection];

  return v0;
}

id sub_10001E008(uint64_t a1)
{
  return [(id)swift_getObjCClassFromMetadata() connectionHasPrivateEntitlement:a1];
}

id sub_10001E040(uint64_t a1)
{
  return [(id)swift_getObjCClassFromMetadata() connectionHasFamilyControlsEntitlement:a1];
}

Class sub_10001E078()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_10001E088()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t sub_10001E098()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_10001E0A8()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10001E0B8()
{
  return JSONDecoder.init()();
}

uint64_t sub_10001E0C8()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10001E0D8()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_10001E0E8()
{
  return JSONEncoder.init()();
}

uint64_t sub_10001E0F8()
{
  return type metadata accessor for JSONEncoder();
}

NSDateInterval sub_10001E108()
{
  return DateInterval._bridgeToObjectiveC()();
}

uint64_t sub_10001E118()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_10001E128()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E138()
{
  return type metadata accessor for Notification();
}

uint64_t sub_10001E148()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_10001E158()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_10001E168()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_10001E178()
{
  return URLComponents.url.getter();
}

uint64_t sub_10001E188()
{
  return URLComponents.init(string:)();
}

uint64_t sub_10001E198()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_10001E1A8()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_10001E1B8()
{
  return __DataStorage._length.getter();
}

uint64_t sub_10001E1C8()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_10001E1D8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10001E1E8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10001E1F8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E208()
{
  return URL.init(string:)();
}

uint64_t sub_10001E218()
{
  return type metadata accessor for URL();
}

NSData sub_10001E228()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10001E238()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E248()
{
  return Data.hash(into:)();
}

uint64_t sub_10001E258()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10001E268()
{
  return static Date.now.getter();
}

uint64_t sub_10001E278()
{
  return type metadata accessor for Date();
}

uint64_t sub_10001E288()
{
  return UUID.init()();
}

uint64_t sub_10001E298()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10001E2A8()
{
  return static Locale.preferredLanguages.getter();
}

uint64_t sub_10001E2B8()
{
  return Locale.Region.identifier.getter();
}

uint64_t sub_10001E2C8()
{
  return type metadata accessor for Locale.Region();
}

uint64_t sub_10001E2D8()
{
  return static Locale.current.getter();
}

uint64_t sub_10001E2E8()
{
  return Locale.Language.region.getter();
}

uint64_t sub_10001E2F8()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_10001E308()
{
  return Locale.language.getter();
}

uint64_t sub_10001E318()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10001E328()
{
  return _DeviceActivityData.ApplicationActivity.bundleIdentifier.getter();
}

uint64_t sub_10001E338()
{
  return _DeviceActivityData.ApplicationActivity.localizedDisplayName.setter();
}

uint64_t sub_10001E348()
{
  return type metadata accessor for _DeviceActivityData.ApplicationActivity();
}

uint64_t sub_10001E358()
{
  return _DeviceActivityData.CategoryActivity.applicationActivities.modify();
}

uint64_t sub_10001E368()
{
  return _DeviceActivityData.CategoryActivity.applicationActivities.getter();
}

uint64_t sub_10001E378()
{
  return type metadata accessor for _DeviceActivityData.CategoryActivity();
}

uint64_t sub_10001E388()
{
  return _DeviceActivityData.ActivitySegment.categoryActivities.modify();
}

uint64_t sub_10001E398()
{
  return _DeviceActivityData.ActivitySegment.categoryActivities.getter();
}

uint64_t sub_10001E3A8()
{
  return _DeviceActivityData.ActivitySegment.categoryActivities.setter();
}

uint64_t sub_10001E3B8()
{
  return type metadata accessor for _DeviceActivityData.ActivitySegment();
}

uint64_t sub_10001E3C8()
{
  return static _DeviceActivityData.teamIdentifier.setter();
}

uint64_t sub_10001E3D8()
{
  return type metadata accessor for _DeviceActivityData();
}

void sub_10001E3E8()
{
}

uint64_t sub_10001E408()
{
  return DeviceActivityDataSource.activity(filteredBy:)();
}

uint64_t sub_10001E418()
{
  return DeviceActivityDataSource.init()();
}

uint64_t sub_10001E428()
{
  return type metadata accessor for DeviceActivityDataSource();
}

uint64_t sub_10001E438()
{
  return type metadata accessor for DeviceActivityAuthorization();
}

uint64_t sub_10001E448()
{
  return DeviceActivityFilter.SegmentInterval.interval.getter();
}

uint64_t sub_10001E458()
{
  return type metadata accessor for DeviceActivityFilter.SegmentInterval();
}

uint64_t sub_10001E468()
{
  return DeviceActivityFilter.segmentInterval.getter();
}

uint64_t sub_10001E478()
{
  return type metadata accessor for DeviceActivityFilter.Users();
}

uint64_t sub_10001E488()
{
  return DeviceActivityFilter.users.getter();
}

uint64_t sub_10001E498()
{
  return type metadata accessor for DeviceActivityFilter();
}

uint64_t sub_10001E4A8()
{
  return static _SegmentInterval.allCases.getter();
}

uint64_t sub_10001E4B8()
{
  return _SegmentInterval.init(rawValue:)();
}

uint64_t sub_10001E4C8()
{
  return type metadata accessor for _SegmentInterval();
}

uint64_t sub_10001E4D8()
{
  return dispatch thunk of CodableElementFetching.fetchCodableActivitySegment(userAltDSID:deviceIdentifier:segmentInterval:recordName:)();
}

uint64_t sub_10001E4E8()
{
  return Token.data.getter();
}

uint64_t sub_10001E4F8()
{
  return Token.init(data:)();
}

uint64_t sub_10001E508()
{
  return KeyRetriever.init()();
}

uint64_t sub_10001E518()
{
  return type metadata accessor for KeyRetriever();
}

uint64_t sub_10001E528()
{
  return TokenDecoder.init(teamIdentifier:keyRetriever:)();
}

uint64_t sub_10001E538()
{
  return dispatch thunk of TokenDecoder.decode(bundleIdentifierToken:)();
}

uint64_t sub_10001E548()
{
  return dispatch thunk of TokenDecoder.decode(categoryIdentifierToken:)();
}

uint64_t sub_10001E558()
{
  return dispatch thunk of TokenDecoder.decode(webDomainToken:)();
}

uint64_t sub_10001E568()
{
  return type metadata accessor for TokenDecoder();
}

uint64_t sub_10001E578()
{
  return TokenEncoder.init(teamIdentifier:keyRetriever:)();
}

uint64_t sub_10001E588()
{
  return type metadata accessor for TokenEncoder();
}

uint64_t sub_10001E598()
{
  return DeviceActivityReport.ClientConfiguration.extensionIdentifier.getter();
}

uint64_t sub_10001E5A8()
{
  return DeviceActivityReport.ClientConfiguration.filter.getter();
}

uint64_t sub_10001E5B8()
{
  return DeviceActivityReport.ClientConfiguration.context.getter();
}

uint64_t sub_10001E5C8()
{
  return type metadata accessor for DeviceActivityReport.ClientConfiguration();
}

uint64_t sub_10001E5D8()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001E5E8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001E5F8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10001E608()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10001E618()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10001E628()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10001E638()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_10001E648()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_10001E658()
{
  return Dictionary.description.getter();
}

uint64_t sub_10001E668()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10001E678()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10001E688()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001E698()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001E6A8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001E6B8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E6C8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10001E6D8()
{
  return String.hash(into:)();
}

void sub_10001E6E8(Swift::String a1)
{
}

Swift::Int sub_10001E6F8()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_10001E708(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_10001E718()
{
  return Sequence<>.joined(separator:)();
}

NSArray sub_10001E728()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001E738()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E748()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10001E758()
{
  return Array<A>.filterCategoryActivities(with:)();
}

uint64_t sub_10001E768()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10001E778()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10001E788()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10001E798()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_10001E7A8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10001E7B8()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_10001E7C8()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_10001E7D8()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E7E8()
{
  return Set.description.getter();
}

uint64_t sub_10001E7F8()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10001E808()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10001E818()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001E828()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10001E838()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001E848()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10001E858()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10001E868()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10001E878()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_10001E888()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10001E898()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10001E8A8()
{
  return OS_dispatch_queue.label.getter();
}

uint64_t sub_10001E8B8()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_10001E8C8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10001E8D8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001E8E8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001E8F8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10001E908()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10001E918()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10001E928()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10001E938()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_10001E948(Swift::Int a1)
{
}

uint64_t sub_10001E958()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001E968()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001E978()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001E988()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001E998()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001E9A8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10001E9B8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001E9C8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10001E9D8()
{
  return static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E9F8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001EA08()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001EA18()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001EA28()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10001EA38()
{
  return Error._code.getter();
}

uint64_t sub_10001EA48()
{
  return Error._domain.getter();
}

uint64_t sub_10001EA58()
{
  return Error._userInfo.getter();
}

uint64_t sub_10001EA68()
{
  return Hasher.init(_seed:)();
}

void sub_10001EA78(Swift::UInt a1)
{
}

Swift::Int sub_10001EA88()
{
  return Hasher._finalize()();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return _SecTaskCopyTeamIdentifier();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}