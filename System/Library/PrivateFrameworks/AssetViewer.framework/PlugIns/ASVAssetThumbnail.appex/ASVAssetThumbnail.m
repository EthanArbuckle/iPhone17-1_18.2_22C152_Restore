uint64_t sub_100002308()
{
  uint64_t v0;

  v0 = sub_10000D9D8();
  sub_100007014(v0, qword_1000146A8);
  sub_100005648(v0, (uint64_t)qword_1000146A8);
  return sub_10000D9C8();
}

id sub_10000238C()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v19 = sub_10000DB08();
  uint64_t v1 = *(void *)(v19 - 8);
  __chkstk_darwin();
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DAF8();
  __chkstk_darwin();
  sub_10000DA18();
  __chkstk_darwin();
  uint64_t v18 = OBJC_IVAR____TtC17ASVAssetThumbnail27USDRealityThumbnailProvider_serialQueue;
  unint64_t v17 = sub_1000070B8();
  v4 = v0;
  sub_10000D9F8();
  v25[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10000620C(&qword_100014790, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000057DC(&qword_100014798);
  sub_1000070F8(&qword_1000147A0, &qword_100014798);
  v5 = v4;
  sub_10000DB98();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v19);
  *(void *)&v0[v18] = sub_10000DB28();
  uint64_t v6 = OBJC_IVAR____TtC17ASVAssetThumbnail27USDRealityThumbnailProvider_singleFileSemaphore;
  *(void *)&v4[v6] = dispatch_semaphore_create(1);
  id v7 = [self mainBundle];
  NSString v8 = sub_10000DA48();
  id v9 = [v7 objectForInfoDictionaryKey:v8];

  if (v9)
  {
    sub_10000DB88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v24, 0, sizeof(v24));
  }
  sub_100007148((uint64_t)v24, (uint64_t)v25);
  if (v25[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v11 = v21;
      unint64_t v10 = v22;
      goto LABEL_9;
    }
  }
  else
  {
    sub_1000071B0((uint64_t)v25, &qword_1000147A8);
  }
  unint64_t v10 = 0xE100000000000000;
  uint64_t v11 = 63;
LABEL_9:
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_10000D9D8();
  sub_100005648(v12, (uint64_t)qword_1000146A8);
  swift_bridgeObjectRetain();
  v13 = sub_10000D9B8();
  os_log_type_t v14 = sub_10000DAE8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v24[0] = sub_100005BB4(v11, v10, v25);
    sub_10000DB68();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "ARQL_Thumbnail init USDRealityThumbnailProvider v%s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_10000D908();
  swift_allocObject();
  *(void *)&v5[OBJC_IVAR____TtC17ASVAssetThumbnail27USDRealityThumbnailProvider_renderer] = sub_10000D8F8();

  v23.receiver = v5;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, "init");
}

id sub_1000028E0()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10000D9D8();
  sub_100005648(v3, (uint64_t)qword_1000146A8);
  v4 = sub_10000D9B8();
  os_log_type_t v5 = sub_10000DAE8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "ARQL_Thumbnail deinit USDRealityThumbnailProvider", v6, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, "dealloc");
}

uint64_t sub_100002B58(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v40 = a3;
  v42 = a2;
  uint64_t v43 = a4;
  uint64_t v5 = sub_10000D9E8();
  uint64_t v48 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v46 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_10000DA18();
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  v44 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000D898();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  v38 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)v34 - v12;
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10000D9D8();
  sub_100005648(v14, (uint64_t)qword_1000146A8);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v39 = a1;
  v37 = v15;
  v15(v13, a1, v8);
  v16 = sub_10000D9B8();
  os_log_type_t v17 = sub_10000DAE8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v36 = v5;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)uint64_t v19 = 136380675;
    v34[1] = v19 + 4;
    sub_10000620C(&qword_100014738, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v20 = sub_10000DBF8();
    v49 = (void *)sub_100005BB4(v20, v21, aBlock);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "provideThumbnail File: %{private}s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v36;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }

  unint64_t v22 = v41;
  objc_super v23 = v38;
  v37(v38, v39, v8);
  unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v25 = (char *)swift_allocObject();
  v27 = v42;
  uint64_t v26 = v43;
  *((void *)v25 + 2) = v22;
  *((void *)v25 + 3) = v27;
  *((void *)v25 + 4) = v40;
  *((void *)v25 + 5) = v26;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v25[v24], v23, v8);
  aBlock[4] = (uint64_t)sub_10000575C;
  aBlock[5] = (uint64_t)v25;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000050B8;
  aBlock[3] = (uint64_t)&unk_1000108E0;
  v28 = _Block_copy(aBlock);
  id v29 = v22;
  id v30 = v27;
  swift_retain();
  v31 = v44;
  sub_10000DA08();
  v49 = &_swiftEmptyArrayStorage;
  sub_10000620C(&qword_100014720, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000057DC(&qword_100014728);
  sub_1000070F8(&qword_100014730, &qword_100014728);
  v32 = v46;
  sub_10000DB98();
  sub_10000DB18();
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v32, v5);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v47);
  return swift_release();
}

void sub_100003280(void *a1, void *a2, void (*a3)(id, void), uint64_t a4, uint64_t a5)
{
  uint64_t v26 = a4;
  v27 = a3;
  uint64_t v8 = sub_10000D898();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DB38();
  objc_msgSend(a2, "maximumSize", v26);
  double v13 = v12;
  double v15 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a5, v8);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v16, v11, v8);
  *(void *)(v19 + v17) = a1;
  uint64_t v20 = (double *)(v19 + v18);
  *uint64_t v20 = v13;
  v20[1] = v15;
  *(void *)(v19 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) = a2;
  aBlock[4] = sub_1000063C8;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005000;
  aBlock[3] = &unk_100010930;
  unint64_t v21 = _Block_copy(aBlock);
  unint64_t v22 = self;
  id v23 = a1;
  id v24 = a2;
  id v25 = objc_msgSend(v22, "replyWithContextSize:ioSurfaceAsyncBlock:", v21, v13, v15);
  _Block_release(v21);
  swift_release();
  v27(v25, 0);
}

uint64_t sub_1000034D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, double a7, double a8)
{
  v71 = a1;
  v72 = a6;
  uint64_t v69 = a2;
  v70 = a5;
  sub_1000057DC(&qword_100014748);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v74 = (uint64_t)v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000D898();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v67 = v16;
  v68 = (char *)v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)v59 - v17;
  uint64_t v19 = sub_10000D9D8();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v22 = (char *)v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_100005648(v19, (uint64_t)qword_1000146A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v23, v19);
  v66 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v66(v18, a4, v13);
  id v24 = sub_10000D9B8();
  int v65 = sub_10000DAE8();
  BOOL v25 = os_log_type_enabled(v24, (os_log_type_t)v65);
  uint64_t v73 = a3;
  if (v25)
  {
    os_log_t v61 = v24;
    v59[0] = v19;
    uint64_t v63 = a4;
    uint64_t v26 = v14;
    uint64_t v27 = v13;
    uint64_t v28 = swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    v76[0] = v60;
    *(_DWORD *)uint64_t v28 = 136381187;
    sub_10000620C(&qword_100014738, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v29 = sub_10000DBF8();
    uint64_t v75 = sub_100005BB4(v29, v30, v76);
    v59[1] = v76;
    sub_10000DB68();
    swift_bridgeObjectRelease();
    uint64_t v62 = v26;
    v31 = *(void (**)(char *, uint64_t))(v26 + 8);
    uint64_t v64 = v27;
    v31(v18, v27);
    *(_WORD *)(v28 + 12) = 2080;
    v32 = self;
    id v33 = [v32 currentThread];
    id v34 = [v33 name];

    if (v34)
    {
      uint64_t v35 = sub_10000DA58();
      unint64_t v37 = v36;
    }
    else
    {
      unint64_t v37 = 0xE90000000000003ELL;
      uint64_t v35 = 0x656D616E206F6E3CLL;
    }
    uint64_t v38 = v59[0];
    os_log_type_t v39 = v65;
    uint64_t v75 = sub_100005BB4(v35, v37, v76);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 22) = 1024;
    LODWORD(v75) = [v32 isMainThread];
    sub_10000DB68();
    os_log_t v40 = v61;
    _os_log_impl((void *)&_mh_execute_header, v61, v39, "inside QLThumbnailReply: %{private}s, thread: %s isMain: %{BOOL}d", (uint8_t *)v28, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v38);
    a4 = v63;
    uint64_t v13 = v64;
    uint64_t v14 = v62;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  uint64_t v41 = sub_10000DAC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v74, 1, 1, v41);
  v42 = v68;
  v66(v68, a4, v13);
  unint64_t v43 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v44 = (v67 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v45 = (v44 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v46 = v13;
  unint64_t v47 = (v45 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v48 = (char *)swift_allocObject();
  *((void *)v48 + 2) = 0;
  *((void *)v48 + 3) = 0;
  v49 = v70;
  *((void *)v48 + 4) = v70;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v48[v43], v42, v46);
  v50 = (double *)&v48[v44];
  double *v50 = a7;
  v50[1] = a8;
  v51 = v71;
  v52 = v72;
  *(void *)&v48[v45] = v72;
  *(void *)&v48[v47] = v51;
  v53 = &v48[(v47 + 15) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v54 = v73;
  *(void *)v53 = v69;
  *((void *)v53 + 1) = v54;
  id v55 = v49;
  id v56 = v52;
  id v57 = v51;
  swift_retain();
  sub_100004E54(v74, (uint64_t)&unk_100014758, (uint64_t)v48);
  return swift_release();
}

uint64_t sub_100003B10(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v10 + 72) = a10;
  *(void *)(v10 + 80) = v12;
  *(void *)(v10 + 56) = a8;
  *(void *)(v10 + 64) = a9;
  *(double *)(v10 + 40) = a1;
  *(double *)(v10 + 48) = a2;
  *(void *)(v10 + 24) = a6;
  *(void *)(v10 + 32) = a7;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100003B44, 0, 0);
}

uint64_t sub_100003B44()
{
  uint64_t v1 = (void *)*((void *)v0 + 7);
  [v1 scale];
  double v3 = v2;
  char v4 = [v1 badgeType] == (id)1;
  uint64_t v5 = (void *)swift_task_alloc();
  *((void *)v0 + 11) = v5;
  void *v5 = v0;
  v5[1] = sub_100003C20;
  uint64_t v6 = *((void *)v0 + 8);
  double v7 = v0[5];
  double v8 = v0[6];
  uint64_t v9 = *((void *)v0 + 4);
  return sub_100003FD0(v9, v6, v4, v7, v8, v3);
}

uint64_t sub_100003C20()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    double v2 = sub_100003DB0;
  }
  else {
    double v2 = sub_100003D34;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_100003D34()
{
  (*(void (**)(uint64_t))(v0 + 72))(1);
  sub_10000DB48();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100003DB0()
{
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10000D9D8();
  sub_100005648(v1, (uint64_t)qword_1000146A8);
  swift_errorRetain();
  swift_errorRetain();
  double v2 = sub_10000D9B8();
  os_log_type_t v3 = sub_10000DAD8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    sub_10000DB68();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to provideThumbnail, error: %@", v4, 0xCu);
    sub_1000057DC(&qword_100014778);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(void))(v0 + 72))(0);
  swift_errorRelease();
  sub_10000DB48();
  double v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100003FD0(uint64_t a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  *(unsigned char *)(v7 + 264) = a3;
  *(void *)(v7 + 104) = a2;
  *(void *)(v7 + 112) = v6;
  *(double *)(v7 + 88) = a5;
  *(double *)(v7 + 96) = a6;
  *(double *)(v7 + 80) = a4;
  *(void *)(v7 + 72) = a1;
  uint64_t v8 = sub_10000D8E8();
  *(void *)(v7 + 120) = v8;
  *(void *)(v7 + 128) = *(void *)(v8 - 8);
  *(void *)(v7 + 136) = swift_task_alloc();
  *(void *)(v7 + 144) = swift_task_alloc();
  uint64_t v9 = sub_10000D898();
  *(void *)(v7 + 152) = v9;
  *(void *)(v7 + 160) = *(void *)(v9 - 8);
  *(void *)(v7 + 168) = swift_task_alloc();
  *(void *)(v7 + 176) = swift_task_alloc();
  *(void *)(v7 + 184) = swift_task_alloc();
  uint64_t v10 = sub_10000D9D8();
  *(void *)(v7 + 192) = v10;
  *(void *)(v7 + 200) = *(void *)(v10 - 8);
  *(void *)(v7 + 208) = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100004184, 0, 0);
}

uint64_t sub_100004184()
{
  uint64_t v61 = v0;
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v7 = *(void *)(v0 + 152);
  uint64_t v6 = *(void *)(v0 + 160);
  uint64_t v8 = sub_100005648(v4, (uint64_t)qword_1000146A8);
  *(void *)(v0 + 216) = v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v8, v4);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  *(void *)(v0 + 224) = v9;
  *(void *)(v0 + 232) = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  id v56 = v9;
  v9(v5, v1, v7);
  uint64_t v10 = sub_10000D9B8();
  os_log_type_t v11 = sub_10000DAE8();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v55 = v11;
    uint64_t v12 = *(void *)(v0 + 184);
    uint64_t v13 = *(void *)(v0 + 152);
    uint64_t v14 = *(void *)(v0 + 160);
    uint64_t v15 = swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136380931;
    sub_10000620C(&qword_100014738, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v16 = sub_10000DBF8();
    *(void *)(v0 + 56) = sub_100005BB4(v16, v17, &v60);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    v58 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v58(v12, v13);
    *(_WORD *)(v15 + 12) = 2080;
    id v18 = [self currentThread];
    id v19 = [v18 name];

    if (v19)
    {
      uint64_t v20 = sub_10000DA58();
      unint64_t v22 = v21;
    }
    else
    {
      unint64_t v22 = 0xE90000000000003ELL;
      uint64_t v20 = 0x656D616E206F6E3CLL;
    }
    uint64_t v27 = *(void *)(v0 + 200);
    uint64_t v53 = *(void *)(v0 + 208);
    uint64_t v28 = *(void *)(v0 + 192);
    *(void *)(v0 + 64) = sub_100005BB4(v20, v22, &v60);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v55, "generateThumbnail, url: %{private}s, thread: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v53, v28);
    uint64_t v26 = v58;
  }
  else
  {
    uint64_t v24 = *(void *)(v0 + 200);
    uint64_t v23 = *(void *)(v0 + 208);
    uint64_t v25 = *(void *)(v0 + 192);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 160) + 8);
    v26(*(void *)(v0 + 184), *(void *)(v0 + 152));

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  }
  *(void *)(v0 + 240) = v26;
  uint64_t v29 = *(void *)(v0 + 176);
  uint64_t v30 = *(void *)(v0 + 152);
  double v31 = *(double *)(v0 + 96);
  uint64_t v32 = *(void *)(v0 + 72);
  double v33 = v31 * *(double *)(v0 + 80);
  double v34 = v31 * *(double *)(v0 + 88);
  unint64_t v35 = (unint64_t)[self forceUseLegacySceneImportPipeline];
  v56(v29, v32, v30);
  unint64_t v36 = sub_10000D9B8();
  os_log_type_t v37 = sub_10000DAE8();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v39 = *(void *)(v0 + 176);
  uint64_t v40 = *(void *)(v0 + 152);
  if (v38)
  {
    unsigned int v57 = v35;
    uint64_t v41 = swift_slowAlloc();
    uint64_t v54 = (void *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 136315651;
    uint64_t v42 = sub_10000DB58();
    *(void *)(v0 + 32) = sub_100005BB4(v42, v43, &v60);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2112;
    id v44 = [self currentThread];
    *(void *)(v0 + 40) = v44;
    sub_10000DB68();
    *uint64_t v54 = v44;
    *(_WORD *)(v41 + 22) = 2081;
    sub_10000620C(&qword_100014738, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v45 = sub_10000DBF8();
    *(void *)(v0 + 48) = sub_100005BB4(v45, v46, &v60);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    v26(v39, v40);
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Begin thumbnail generation. Size: %s. Thread: %@ File: %{private}s", (uint8_t *)v41, 0x20u);
    sub_1000057DC(&qword_100014778);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    unint64_t v35 = v57;
    swift_slowDealloc();
  }
  else
  {
    v26(*(void *)(v0 + 176), *(void *)(v0 + 152));
  }

  sub_10000D8D8();
  v59 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, __n128, __n128))((char *)&async function pointer to dispatch thunk of ARQLRenderer.snapshot(file:iosurface:contentSize:forceUseLegacySceneImportPipeline:)
                                                                                   + async function pointer to dispatch thunk of ARQLRenderer.snapshot(file:iosurface:contentSize:forceUseLegacySceneImportPipeline:));
  unint64_t v47 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v47;
  *unint64_t v47 = v0;
  v47[1] = sub_100004860;
  uint64_t v48 = *(void *)(v0 + 104);
  uint64_t v49 = *(void *)(v0 + 72);
  v50.n128_f64[0] = v33;
  v51.n128_f64[0] = v34;
  return v59(v49, v48, v35, v50, v51);
}

uint64_t sub_100004860()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100004D90;
  }
  else {
    uint64_t v2 = sub_100004974;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v2, 0, 0);
}

uint64_t sub_100004974()
{
  uint64_t v38 = v0;
  uint64_t v1 = sub_10000D9B8();
  os_log_type_t v2 = sub_10000DAE8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Finished snapshotting", v3, 2u);
    swift_slowDealloc();
  }
  int v4 = *(unsigned __int8 *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 104);

  uint64_t v6 = sub_10000D838();
  sub_100006918(v5, v6, v7);
  swift_bridgeObjectRelease();
  if (v4 == 1) {
    sub_1000050FC(*(void **)(v0 + 104), *(CGFloat *)(v0 + 80), *(CGFloat *)(v0 + 88), *(CGFloat *)(v0 + 96));
  }
  uint64_t v8 = sub_10000D9B8();
  os_log_type_t v9 = sub_10000DAE8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Created image", v10, 2u);
    swift_slowDealloc();
  }
  os_log_type_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
  uint64_t v12 = *(void *)(v0 + 168);
  uint64_t v13 = *(void *)(v0 + 152);
  uint64_t v15 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 120);
  uint64_t v17 = *(void *)(v0 + 72);

  sub_10000D8D8();
  sub_10000D8C8();
  uint64_t v19 = v18;
  unint64_t v36 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v36(v14, v16);
  v11(v12, v17, v13);
  uint64_t v20 = sub_10000D9B8();
  os_log_type_t v21 = sub_10000DAE8();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
  uint64_t v24 = *(void *)(v0 + 168);
  uint64_t v25 = *(void *)(v0 + 144);
  uint64_t v26 = *(void *)(v0 + 152);
  uint64_t v27 = *(void *)(v0 + 120);
  if (v22)
  {
    uint64_t v35 = *(void *)(v0 + 144);
    double v34 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
    uint64_t v28 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 134218242;
    *(void *)(v0 + 16) = v19;
    sub_10000DB68();
    *(_WORD *)(v28 + 12) = 2080;
    sub_10000620C(&qword_100014738, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v29 = sub_10000DBF8();
    *(void *)(v0 + 24) = sub_100005BB4(v29, v30, &v37);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    v34(v24, v26);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "⌛️Snapshot took %fs for %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v31 = v35;
  }
  else
  {

    v23(v24, v26);
    uint64_t v31 = v25;
  }
  v36(v31, v27);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_100004D90()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100004E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000DAC8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000DAB8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000071B0(a1, &qword_100014748);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000DAA8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_100005000(uint64_t a1, void *a2, void *aBlock)
{
  int v4 = *(void (**)(void))(a1 + 32);
  uint64_t v5 = _Block_copy(aBlock);
  *(void *)(swift_allocObject() + 16) = v5;
  swift_retain();
  id v6 = a2;
  v4();
  swift_release();
  swift_release();
}

uint64_t sub_1000050B8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1000050FC(void *a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10000D9D8();
  sub_100005648(v8, (uint64_t)qword_1000146A8);
  os_log_type_t v9 = sub_10000D9B8();
  os_log_type_t v10 = sub_10000DAE8();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Adding interactive badge to iosurface", v11, 2u);
    swift_slowDealloc();
  }

  CGColorSpaceRef v12 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  [a1 width];
  [a1 height];
  uint64_t v13 = (CGContext *)CGIOSurfaceContextCreate();
  if (v13)
  {
    uint64_t v14 = v13;
    CGContextTranslateCTM(v13, 0.0, a3 * a4);
    CGContextScaleCTM(v14, a4, -a4);
    CGContextGetCTM(&v16, v14);
    CGContextSetBaseCTM();
    UIGraphicsPushContext(v14);
    sub_1000052F0(a2, a3);
    UIGraphicsPopContext();
  }
  else
  {
    __break(1u);
  }
}

uint64_t static CGBitmapInfo.byteOrder32Host.getter()
{
  return 0x2000;
}

void sub_1000052F0(CGFloat a1, CGFloat a2)
{
  if (qword_1000146A0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10000D9D8();
  sub_100005648(v4, (uint64_t)qword_1000146A8);
  uint64_t v5 = sub_10000D9B8();
  os_log_type_t v6 = sub_10000DAE8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v14 = [self currentThread];
    sub_10000DB68();
    *uint64_t v8 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Creating image next, Thread: %@", v7, 0xCu);
    sub_1000057DC(&qword_100014778);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v9 = [objc_allocWithZone((Class)UIColor) initWithWhite:1.0 alpha:0.3];
  v15.width = a1;
  v15.height = a2;
  UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
  [v9 setFill];
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = a1;
  v16.size.height = a2;
  UIRectFill(v16);
  os_log_type_t v10 = UIGraphicsGetImageFromCurrentImageContext();
  if (v10)
  {
    os_log_type_t v11 = v10;
    UIGraphicsEndImageContext();

    id v12 = [self badgeForThumbnail:v11];
    [v12 size];
    objc_msgSend(v12, "drawAtPoint:", a1 - v13, 0.0);
  }
  else
  {
    __break(1u);
  }
}

double variable initialization expression of StackedImagesThumbnail.imageSpacingRatio()
{
  return 0.07;
}

double variable initialization expression of StackedImagesThumbnail.imageCornerRadiusRatio()
{
  return 0.25;
}

double variable initialization expression of StackedImagesThumbnail.shadowOffset()
{
  return 2.0;
}

double variable initialization expression of StackedImagesThumbnail.shadowBlur()
{
  return 3.0;
}

id variable initialization expression of StackedImagesThumbnail.shadowColor()
{
  id v0 = [self blackColor];
  id v1 = [v0 colorWithAlphaComponent:0.4];

  return v1;
}

uint64_t variable initialization expression of ObjectCaptureThumbnailProvider.maximumNumberOfStackedImages()
{
  return 3;
}

uint64_t variable initialization expression of ObjectCaptureThumbnailProvider.modelsDirectoryName()
{
  return 0x736C65646F6DLL;
}

uint64_t variable initialization expression of ObjectCaptureThumbnailProvider.imageDirectoryName()
{
  return 0x736567616D69;
}

uint64_t type metadata accessor for USDRealityThumbnailProvider()
{
  return self;
}

uint64_t sub_100005648(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005680()
{
  uint64_t v1 = sub_10000D898();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

void sub_10000575C()
{
  uint64_t v1 = *(void *)(sub_10000D898() - 8);
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void (*)(id, void))v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_100003280(v2, v3, v4, v5, v6);
}

uint64_t sub_1000057C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000057D4()
{
  return swift_release();
}

uint64_t sub_1000057DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005820(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005868()
{
  return sub_10000D938();
}

uint64_t sub_1000058B4()
{
  return sub_10000D928();
}

Swift::Int sub_10000590C()
{
  return sub_10000DC38();
}

uint64_t sub_100005974()
{
  swift_getWitnessTable();
  return sub_10000D918();
}

uint64_t sub_1000059E0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100005ABC;
  return v6(a1);
}

uint64_t sub_100005ABC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005BB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005C88(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000062A4((uint64_t)v12, *a3);
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
      sub_1000062A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006254((uint64_t)v12);
  return v7;
}

uint64_t sub_100005C88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000DB78();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005E44(a5, a6);
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
  uint64_t v8 = sub_10000DBB8();
  if (!v8)
  {
    sub_10000DBC8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000DBE8();
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

uint64_t sub_100005E44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005EDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000060BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000060BC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005EDC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006054(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000DBA8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000DBC8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000DA88();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000DBE8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000DBC8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006054(uint64_t a1, uint64_t a2)
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
  sub_1000057DC(&qword_100014740);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000060BC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000057DC(&qword_100014740);
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
  double v13 = a4 + 32;
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
  uint64_t result = sub_10000DBE8();
  __break(1u);
  return result;
}

uint64_t sub_10000620C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006254(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000062A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006304()
{
  uint64_t v1 = sub_10000D898();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v7 + 8, v5);
}

uint64_t sub_1000063C8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_10000D898() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  size_t v11 = *(void **)(v3 + v9);
  double v12 = *(double *)(v3 + v10);
  double v13 = *(double *)(v3 + v10 + 8);
  id v14 = *(void **)(v3 + ((v10 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_1000034D8(a1, a2, a3, v3 + v8, v11, v14, v12, v13);
}

uint64_t sub_100006498(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_1000064B0()
{
  uint64_t v1 = sub_10000D898();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_1000065D4()
{
  uint64_t v2 = *(void *)(sub_10000D898() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v0 + 32);
  uint64_t v9 = v0 + v3;
  uint64_t v10 = *(void *)(v0 + v4);
  uint64_t v11 = *(void *)(v0 + v4 + 8);
  uint64_t v12 = *(void *)(v0 + v5);
  uint64_t v13 = *(void *)(v0 + v6);
  uint64_t v14 = swift_task_alloc();
  long long v15 = *(_OWORD *)(v0 + v7);
  *(void *)(v1 + 16) = v14;
  *(void *)uint64_t v14 = v1;
  *(void *)(v14 + 8) = sub_100006734;
  *(_OWORD *)(v14 + 72) = v15;
  *(void *)(v14 + 56) = v12;
  *(void *)(v14 + 64) = v13;
  *(void *)(v14 + 40) = v10;
  *(void *)(v14 + 48) = v11;
  *(void *)(v14 + 24) = v8;
  *(void *)(v14 + 32) = v9;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100003B44, 0, 0);
}

uint64_t sub_100006734()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006828()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006860(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100006734;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100014760 + dword_100014760);
  return v6(a1, v4);
}

void sub_100006918(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_10000D818();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000057DC(&qword_100014780);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000D898();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  CGRect v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([self debugSaveThumbnailImageToDisk])
  {
    uint64_t v42 = a3;
    id v43 = [objc_allocWithZone((Class)CIImage) initWithIOSurface:a1];
    id v17 = objc_allocWithZone((Class)UIImage);
    uint64_t v18 = (UIImage *)[v17 initWithCIImage:v43];
    uint64_t v19 = UIImagePNGRepresentation(v18);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v41 = v18;
      uint64_t v21 = sub_10000D8A8();
      unint64_t v39 = v22;
      uint64_t v40 = v21;

      uint64_t v23 = NSTemporaryDirectory();
      uint64_t v24 = sub_10000DA58();
      uint64_t v38 = v6;
      uint64_t v25 = a2;
      uint64_t v26 = v24;
      unint64_t v28 = v27;

      uint64_t v37 = v26;
      v45[0] = v26;
      v45[1] = v28;
      swift_bridgeObjectRetain();
      v47._countAndFlagsBits = 0x2D4C5152412FLL;
      v47._object = (void *)0xE600000000000000;
      sub_10000DA78(v47);
      v48._countAndFlagsBits = v25;
      v48._object = v42;
      sub_10000DA78(v48);
      v49._countAndFlagsBits = 1735290926;
      v49._object = (void *)0xE400000000000000;
      sub_10000DA78(v49);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for URL.DirectoryHint.inferFromPath(_:), v38);
      unint64_t v30 = v39;
      uint64_t v29 = v40;
      sub_10000D888();
      sub_10000D8B8();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      if (qword_1000146A0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_10000D9D8();
      sub_100005648(v32, (uint64_t)qword_1000146A8);
      swift_bridgeObjectRetain();
      double v33 = sub_10000D9B8();
      os_log_type_t v34 = sub_10000DAE8();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        v45[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v44 = sub_100005BB4(v37, v28, v45);
        sub_10000DB68();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "[DEBUG] Saved to %s", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_100006FBC(v29, v30);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        sub_100006FBC(v29, v30);
      }
    }
    else
    {

      id v31 = v43;
    }
  }
}

uint64_t sub_100006FBC(uint64_t a1, unint64_t a2)
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

uint64_t *sub_100007014(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007078()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000070B0(uint64_t a1, uint64_t a2)
{
  sub_10000CA9C(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_1000070B8()
{
  unint64_t result = qword_100014788;
  if (!qword_100014788)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100014788);
  }
  return result;
}

uint64_t sub_1000070F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005820(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000057DC(&qword_1000147A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000071B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000057DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

__n128 sub_100007220(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100007230(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007250(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_10000728C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000072D4()
{
  return sub_10000620C(&qword_1000147C0, type metadata accessor for CFString);
}

uint64_t sub_10000731C()
{
  return sub_10000620C(&qword_1000147C8, type metadata accessor for CFString);
}

void sub_100007370()
{
  qword_1000147D0 = 0x63697061636A626FLL;
  *(void *)algn_1000147D8 = 0xEA00000000006E6FLL;
}

id _s17ASVAssetThumbnail013StackedImagesB0V4icon33_6AA8C53F2C4650FAB362222B0509284ELLSo7UIImageCSgvpfi_0()
{
  if (qword_1000146C0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v0 = sub_10000DA48();
  swift_bridgeObjectRelease();
  id v1 = [self imageNamed:v0];

  if (v1)
  {
    uint64_t v2 = self;
    id v3 = v1;
    id v4 = [v2 whiteColor];
    id v1 = [v3 imageWithTintColor:v4 renderingMode:2];
  }
  return v1;
}

double StackedImagesThumbnail.init(with:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [self blackColor];
  id v5 = [v4 colorWithAlphaComponent:0.4];

  id v6 = _s17ASVAssetThumbnail013StackedImagesB0V4icon33_6AA8C53F2C4650FAB362222B0509284ELLSo7UIImageCSgvpfi_0();
  double result = 0.07;
  *(_OWORD *)a2 = xmmword_10000E4F0;
  *(_OWORD *)(a2 + 16) = xmmword_10000E500;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = a1;
  return result;
}

Swift::Void __swiftcall StackedImagesThumbnail.draw(in:)(CGRect in)
{
  double height = in.size.height;
  double width = in.size.width;
  CGFloat y = in.origin.y;
  CGFloat x = in.origin.x;
  uint64_t v6 = sub_10000D898();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000057DC(&qword_100014780);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (height >= width) {
    double v13 = width;
  }
  else {
    double v13 = height;
  }
  CGFloat v14 = v13 * 0.1;
  v87.origin.CGFloat x = x;
  v87.origin.CGFloat y = y;
  v87.size.double width = width;
  v87.size.double height = height;
  CGRect v88 = CGRectInset(v87, v14, v14);
  double v15 = v88.origin.x;
  double v16 = v88.origin.y;
  double v17 = v88.size.width;
  double v18 = v88.size.height;
  uint64_t v19 = *(void *)(v1 + 48);
  v84[0] = v19;
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v21 = v7 + 16;
    v82 = v22;
    uint64_t v23 = v19 + ((*(unsigned __int8 *)(v21 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 64));
    uint64_t v79 = *(void *)(v21 + 56);
    v80 = (unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 32);
    v77 = (void (**)(char *, uint64_t))(v21 - 8);
    v78 = (void (**)(char *, char *, uint64_t))(v21 + 16);
    swift_bridgeObjectRetain_n();
    v81 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 40);
    v71[1] = (id)((v21 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000);
    uint64_t v75 = v1;
    uint64_t v76 = v21;
    double v73 = v16;
    double v74 = v15;
    while (1)
    {
      v82(v12, v23, v6);
      uint64_t v25 = *v81;
      (*v81)(v12, 0, 1, v6);
      if ((*v80)(v12, 1, v6) == 1) {
        goto LABEL_30;
      }
      (*v78)(v9, v12, v6);
      id v26 = [self mainScreen];
      [v26 scale];
      double v28 = v27;

      id v29 = sub_100009DB0(v17, v18, v28);
      if (v29)
      {
        unint64_t v30 = v29;
        [v29 size];
        double v32 = v31;
        [v30 size];
        double v34 = v33;
        [v30 size];
        double v36 = v35;
        [v30 size];
        double v38 = v37;
        unint64_t v39 = (CGImage *)[v30 CGImage];
        if (v39)
        {
          uint64_t v40 = v39;
          if (v34 >= v32) {
            double v41 = v32;
          }
          else {
            double v41 = v34;
          }
          double v42 = (v38 - v41) * 0.5;
          double v43 = (v36 - v41) * 0.5;
          double v44 = v41;
          CGImageRef v45 = CGImageCreateWithImageInRect(v39, *(CGRect *)(&v41 - 2));

          if (v45)
          {
            uint64_t v24 = (CGContext *)[objc_allocWithZone((Class)UIImage) initWithCGImage:v45];

            if (!v24) {
              goto LABEL_8;
            }
            sub_100007E1C(v15, v16, v17, v18);
            double v47 = v46;
            double v49 = v48;
            double v51 = v50;
            double v53 = v52;
            uint64_t v54 = UIGraphicsGetCurrentContext();
            if (v54)
            {
              os_log_type_t v55 = v54;
              double v72 = v47;
              if (v53 >= v51) {
                double v56 = v51;
              }
              else {
                double v56 = v53;
              }
              double v57 = v56 * *(double *)(v1 + 8);
              [(CGContext *)v24 size];
              double v59 = v58;
              double v61 = v60;
              [(CGContext *)v24 size];
              UIGraphicsBeginImageContextWithOptions(v85, 0, 0.0);
              id v62 = objc_msgSend(self, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v59, v61, v57);
              [v62 addClip];
              -[CGContext drawInRect:](v24, "drawInRect:", 0.0, 0.0, v59, v61);
              uint64_t v63 = UIGraphicsGetImageFromCurrentImageContext();
              UIGraphicsEndImageContext();

              if (v63
                && (uint64_t v64 = v63,
                    int v65 = (void *)UIImage.darken(percentage:)(2),
                    v64,
                    v64,
                    v65))
              {
                CGContextSaveGState(v55);
                v71[0] = v65;
                uint64_t v1 = v75;
                CGFloat v66 = *(double *)(v75 + 16);
                CGFloat v67 = *(double *)(v75 + 24);
                v68 = (CGColor *)[*(id *)(v75 + 32) CGColor];
                v86.double width = v66;
                v86.double height = v66;
                CGContextSetShadowWithColor(v55, v86, v67, v68);

                uint64_t v69 = (CGContext *)v71[0];
                objc_msgSend(v71[0], "drawInRect:", v72, v49, v51, v53);
                CGContextRestoreGState(v55);

                uint64_t v24 = v55;
                os_log_type_t v55 = v69;
              }
              else
              {
                uint64_t v1 = v75;
              }
              double v16 = v73;
              double v15 = v74;

              uint64_t v24 = v55;
            }
          }
          else
          {
            uint64_t v24 = (CGContext *)v30;
          }
        }
        else
        {
          uint64_t v24 = (CGContext *)v30;
        }
      }
LABEL_8:
      (*v77)(v9, v6);
      v23 += v79;
      if (!--v20)
      {
        v25(v12, 1, 1, v6);
        goto LABEL_30;
      }
    }
  }
  v70 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  swift_bridgeObjectRetain_n();
  v70(v12, 1, 1, v6);
LABEL_30:
  sub_100007FE8((uint64_t)v84);
  sub_100007FE8((uint64_t)v84);
  sub_100007B24(v15, v16, v17, v18);
}

void sub_100007B24(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_1000057DC(&qword_100014780);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D898();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  double v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v16 = *(void **)(v4 + 40);
  if (!v16) {
    return;
  }
  uint64_t v17 = *(void *)(v4 + 48);
  uint64_t v18 = *(void *)(v17 + 16);
  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_10;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v11, v17+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * (v18 - 1), v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_10:
    sub_1000082FC((uint64_t)v11);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  id v19 = v16;
  uint64_t v20 = UIGraphicsGetCurrentContext();
  if (v20)
  {
    uint64_t v21 = v20;
    CGContextSaveGState(v20);
    CGFloat v22 = *(double *)(v4 + 16);
    CGFloat v23 = *(double *)(v4 + 24);
    uint64_t v24 = (CGColor *)[*(id *)(v4 + 32) CGColor];
    v31.double width = v22;
    v31.double height = v22;
    CGContextSetShadowWithColor(v21, v31, v23, v24);

    sub_100007E1C(a1, a2, a3, a4);
    if (v28 >= v27) {
      double v29 = v27;
    }
    else {
      double v29 = v28;
    }
    objc_msgSend(v19, "drawInRect:", sub_1000082E0(v25, v26, v27, v28, v29 * 0.15, v29 * 0.15));
    CGContextRestoreGState(v21);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

void sub_100007E1C(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = *(void *)(v4 + 48);
  uint64_t v15 = v5;
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v11 = *(void *)(sub_10000D898() - 8);
    uint64_t v12 = v5 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v13 = *(void *)(v11 + 72);
    sub_100008288();
    swift_bridgeObjectRetain();
    uint64_t v14 = 0;
    while ((sub_10000DA38() & 1) == 0)
    {
      ++v14;
      v12 += v13;
      if (v6 == v14)
      {
        sub_100007FE8((uint64_t)&v15);
        return;
      }
    }
    sub_100007FE8((uint64_t)&v15);
    if (__OFSUB__(v6 - v14, 1)) {
      __break(1u);
    }
    else {
      sub_1000082E0(a1, a2, a3, a4, 0.0, 0.0);
    }
  }
}

uint64_t sub_100007FE8(uint64_t a1)
{
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for StackedImagesThumbnail(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for StackedImagesThumbnail(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StackedImagesThumbnail(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  uint64_t v4 = *(void **)(a2 + 32);
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  id v6 = v4;
  id v7 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for StackedImagesThumbnail(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = (void *)a2[4];
  uint64_t v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  id v7 = (void *)a1[5];
  uint64_t v8 = (void *)a2[5];
  a1[5] = v8;
  id v9 = v8;

  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for StackedImagesThumbnail(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StackedImagesThumbnail(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;

  uint64_t v5 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StackedImagesThumbnail(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StackedImagesThumbnail(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StackedImagesThumbnail()
{
  return &type metadata for StackedImagesThumbnail;
}

unint64_t sub_100008288()
{
  unint64_t result = qword_1000147E0;
  if (!qword_1000147E0)
  {
    sub_10000D898();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000147E0);
  }
  return result;
}

double sub_1000082E0(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_1000082FC(uint64_t a1)
{
  uint64_t v2 = sub_1000057DC(&qword_100014780);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *URL.contentFiles(conformingTo:)(uint64_t a1)
{
  id v3 = [objc_allocWithZone((Class)NSFileManager) init];
  sub_10000D878();
  NSString v4 = sub_10000DA48();
  swift_bridgeObjectRelease();
  id v14 = 0;
  id v5 = [v3 contentsOfDirectoryAtPath:v4 error:&v14];

  id v6 = v14;
  if (v5)
  {
    uint64_t v7 = sub_10000DA98();
    id v8 = v6;

    __chkstk_darwin(v9);
    v13[2] = v1;
    v13[3] = a1;
    uint64_t v10 = sub_1000087D8((void (*)(void))sub_1000087BC, (uint64_t)v13, v7);

    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = v14;
    sub_10000D808();

    swift_willThrow();
    swift_errorRelease();

    return (char *)&_swiftEmptyArrayStorage;
  }
  return v10;
}

uint64_t sub_1000084DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v1 = sub_1000057DC(&qword_1000147F0);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D9A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  __chkstk_darwin(v6);
  id v8 = (char *)&v17 - v7;
  uint64_t v17 = sub_10000D898();
  uint64_t v9 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D858();
  sub_10000D828();
  sub_10000D968();
  sub_10000D948();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1000071B0((uint64_t)v3, &qword_1000147F0);
LABEL_5:
    uint64_t v14 = v17;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v17);
    uint64_t v15 = 1;
    uint64_t v13 = v18;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v13, v15, 1, v14);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  char v12 = sub_10000D998();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if ((v12 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v14 = v17;
  uint64_t v13 = v18;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v18, v11, v17);
  uint64_t v15 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v13, v15, 1, v14);
}

uint64_t sub_1000087BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000084DC(a1);
}

char *sub_1000087D8(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a2;
  uint64_t v6 = sub_1000057DC(&qword_100014780);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D898();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v30 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  double v27 = (char *)&v24 - v13;
  uint64_t v14 = *(void *)(a3 + 16);
  if (!v14) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v25 = v12;
  double v28 = (void (**)(char *))(v12 + 32);
  double v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  uint64_t v24 = a3;
  uint64_t v15 = (uint64_t *)(a3 + 40);
  double v33 = (char *)&_swiftEmptyArrayStorage;
  double v26 = a1;
  do
  {
    uint64_t v16 = v9;
    uint64_t v17 = *v15;
    v32[0] = *(v15 - 1);
    v32[1] = v17;
    swift_bridgeObjectRetain();
    a1(v32);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v33;
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = v16;
    if ((*v29)(v8, 1, v16) == 1)
    {
      sub_1000071B0((uint64_t)v8, &qword_100014780);
    }
    else
    {
      uint64_t v18 = v27;
      id v19 = *v28;
      (*v28)(v27);
      ((void (*)(char *, char *, uint64_t))v19)(v30, v18, v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        double v33 = (char *)sub_100008AF8(0, *((void *)v33 + 2) + 1, 1, (unint64_t)v33);
      }
      unint64_t v21 = *((void *)v33 + 2);
      unint64_t v20 = *((void *)v33 + 3);
      if (v21 >= v20 >> 1) {
        double v33 = (char *)sub_100008AF8(v20 > 1, v21 + 1, 1, (unint64_t)v33);
      }
      CGFloat v22 = v33;
      *((void *)v33 + 2) = v21 + 1;
      uint64_t v9 = v16;
      ((void (*)(char *, char *, uint64_t))v19)(&v22[((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v21], v30, v16);
      a1 = v26;
    }
    v15 += 2;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v33;
}

uint64_t sub_100008AF8(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000057DC(&qword_1000147E8);
  uint64_t v10 = *(void *)(sub_10000D898() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_10000DBC8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_10000D898() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100008D60(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_100008D60(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_10000D898() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_10000DBE8();
  __break(1u);
  return result;
}

UIImage_optional __swiftcall UIImage.croppingBiggestCenteredSquare()()
{
  [v0 size];
  double v2 = v1;
  [v0 size];
  double v4 = v3;
  [v0 size];
  double v6 = v5;
  [v0 size];
  double v8 = v7;
  uint64_t v9 = (CGImage *)[v0 CGImage];
  unint64_t v11 = v9;
  if (v9)
  {
    if (v4 >= v2) {
      double v12 = v2;
    }
    else {
      double v12 = v4;
    }
    double v13 = (v8 - v12) * 0.5;
    double v14 = (v6 - v12) * 0.5;
    double v15 = v12;
    CGImageRef v16 = CGImageCreateWithImageInRect(v9, *(CGRect *)(&v12 - 2));

    if (v16)
    {
      unint64_t v11 = (CGImage *)[objc_allocWithZone((Class)UIImage) initWithCGImage:v16];
    }
    else
    {
      unint64_t v11 = 0;
    }
  }
  unint64_t v17 = v11;
  result.value.super.isa = v17;
  result.is_nil = v10;
  return result;
}

UIImage *UIImage.rounding(radius:)(double a1)
{
  [v1 size];
  double v4 = v3;
  double v6 = v5;
  [v1 size];
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  id v7 = objc_msgSend(self, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v4, v6, a1);
  [v7 addClip];
  objc_msgSend(v1, "drawInRect:", 0.0, 0.0, v4, v6);
  double v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

UIImage_optional __swiftcall UIImage.darken(percentage:)(Swift::Int percentage)
{
  uint64_t v2 = v1;
  id v4 = [objc_allocWithZone((Class)CIImage) initWithImage:v2];
  if (!v4) {
    goto LABEL_10;
  }
  double v6 = v4;
  double v7 = (double)percentage / -100.0;
  if (percentage > 100) {
    double v7 = -1.0;
  }
  if (percentage >= 1) {
    double v8 = v7;
  }
  else {
    double v8 = -0.0;
  }
  id v9 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v8];
  sub_1000057DC(&qword_1000147F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000E530;
  *(void *)(inited + 32) = 0x6972427475706E69;
  *(void *)(inited + 40) = 0xEF7373656E746867;
  *(void *)(inited + 48) = v9;
  id v11 = v9;
  unint64_t v12 = sub_1000095A0(inited);
  NSString v13 = sub_10000DA48();
  sub_1000096BC(v12);
  swift_bridgeObjectRelease();
  Class isa = sub_10000DA28().super.isa;
  swift_bridgeObjectRelease();
  id v15 = [v6 imageByApplyingFilter:v13 withInputParameters:isa];

  id v16 = [objc_allocWithZone((Class)CIContext) initWithOptions:0];
  [v15 extent];
  id v17 = objc_msgSend(v16, "createCGImage:fromRect:", v15);
  if (!v17)
  {

LABEL_10:
    id v19 = 0;
    goto LABEL_11;
  }
  unint64_t v18 = v17;
  id v19 = (objc_class *)[objc_allocWithZone((Class)UIImage) initWithCGImage:v17];

LABEL_11:
  unint64_t v20 = v19;
  result.value.super.Class isa = v20;
  result.is_nil = v5;
  return result;
}

UIImage_optional __swiftcall UIImage.cropping(to:)(CGRect to)
{
  CGFloat height = to.size.height;
  CGFloat width = to.size.width;
  CGFloat y = to.origin.y;
  CGFloat x = to.origin.x;
  double v6 = (CGImage *)[v1 CGImage];
  double v8 = v6;
  if (v6)
  {
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    CGImageRef v9 = CGImageCreateWithImageInRect(v6, v12);

    if (v9)
    {
      double v8 = (CGImage *)[objc_allocWithZone((Class)UIImage) initWithCGImage:v9];
    }
    else
    {
      double v8 = 0;
    }
  }
  CGSize v10 = v8;
  result.value.super.Class isa = v10;
  result.is_nil = v7;
  return result;
}

unint64_t sub_100009384(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000057DC(&qword_100014840);
  uint64_t v2 = (void *)sub_10000DBD8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (id *)(a1 + 40);
  while (1)
  {
    char v5 = *(unsigned char *)v4;
    id v6 = *(v4 - 1);
    unint64_t result = sub_100009A64((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v6;
    *(unsigned char *)(v2[7] + result) = v5;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100009484(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000057DC(&qword_100014828);
  uint64_t v2 = sub_10000DBD8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100009FF0(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_100009A64(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100009A54(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000095A0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000057DC(&qword_100014810);
  uint64_t v2 = (void *)sub_10000DBD8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100009B04(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000096BC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_1000057DC(&qword_100014800);
    uint64_t v2 = (void *)sub_10000DBD8();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v34 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v33 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v38;
  uint64_t v7 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  char v10 = (char *)&type metadata for Any + 8;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v33) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v33) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v33) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v34 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v33) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v34 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v33)
          {
            unint64_t v21 = *(void *)(v34 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v33) {
                break;
              }
              unint64_t v21 = *(void *)(v34 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_100009B7C();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = v18 | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v25 = *(void **)(*(void *)(v1 + 56) + 8 * v19);
    uint64_t v36 = *v24;
    uint64_t v37 = v24[1];
    sub_100009A14();
    swift_bridgeObjectRetain();
    id v26 = v25;
    swift_dynamicCast();
    sub_100009A54(v6, v7);
    sub_100009A54(v7, v41);
    sub_100009A54(v41, &v39);
    unint64_t result = sub_100009B04(v36, v37);
    unint64_t v27 = result;
    if (v28)
    {
      unint64_t v35 = v5;
      BOOL v11 = v7;
      uint64_t v12 = v6;
      uint64_t v13 = v1;
      int64_t v14 = i;
      id v15 = v10;
      id v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v16 = v36;
      v16[1] = v37;
      char v10 = v15;
      int64_t i = v14;
      uint64_t v1 = v13;
      uint64_t v6 = v12;
      uint64_t v7 = v11;
      unint64_t v5 = v35;
      id v17 = (_OWORD *)(v2[7] + 32 * v27);
      sub_100006254((uint64_t)v17);
      unint64_t result = (unint64_t)sub_100009A54(&v39, v17);
      if (!v35) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v29 = (uint64_t *)(v2[6] + 16 * result);
    *double v29 = v36;
    v29[1] = v37;
    unint64_t result = (unint64_t)sub_100009A54(&v39, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v30 = v2[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_34;
    }
    v2[2] = v32;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v18 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_100009A14()
{
  unint64_t result = qword_100014808;
  if (!qword_100014808)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100014808);
  }
  return result;
}

_OWORD *sub_100009A54(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100009A64(uint64_t a1)
{
  sub_10000DC28();
  type metadata accessor for CFString(0);
  sub_10000A058(&qword_100014838);
  sub_10000D928();
  Swift::Int v2 = sub_10000DC38();
  return sub_100009B84(a1, v2);
}

unint64_t sub_100009B04(uint64_t a1, uint64_t a2)
{
  sub_10000DC28();
  sub_10000DA68();
  Swift::Int v4 = sub_10000DC38();
  return sub_100009CCC(a1, a2, v4);
}

uint64_t sub_100009B7C()
{
  return swift_release();
}

unint64_t sub_100009B84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_10000A058(&qword_100014838);
    id v7 = v6;
    char v8 = sub_10000D918();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_10000D918();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_100009CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000DC08() & 1) == 0)
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
      while (!v14 && (sub_10000DC08() & 1) == 0);
    }
  }
  return v6;
}

id sub_100009DB0(double a1, double a2, double a3)
{
  sub_1000057DC(&qword_100014818);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000E530;
  *(void *)(inited + 32) = kCGImageSourceShouldCache;
  *(unsigned char *)(inited + 40) = 0;
  CFStringRef v7 = (id)kCGImageSourceShouldCache;
  sub_100009384(inited);
  type metadata accessor for CFString(0);
  sub_10000A058(&qword_1000147C0);
  v8.super.Class isa = sub_10000DA28().super.isa;
  swift_bridgeObjectRelease();
  sub_10000D848(v9);
  CFURLRef v11 = v10;
  uint64_t v12 = CGImageSourceCreateWithURL(v10, v8.super.isa);

  if (!v12)
  {

    return 0;
  }
  if (a1 > a2) {
    double v13 = a1;
  }
  else {
    double v13 = a2;
  }
  double v14 = v13 * a3;
  sub_1000057DC(&qword_100014820);
  uint64_t v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_10000E540;
  *(void *)(v15 + 32) = kCGImageSourceCreateThumbnailFromImageAlways;
  *(unsigned char *)(v15 + 40) = 1;
  *(void *)(v15 + 64) = &type metadata for Bool;
  *(void *)(v15 + 72) = kCGImageSourceCreateThumbnailWithTransform;
  *(unsigned char *)(v15 + 80) = 1;
  *(void *)(v15 + 104) = &type metadata for Bool;
  *(void *)(v15 + 112) = kCGImageSourceThumbnailMaxPixelSize;
  *(void *)(v15 + 144) = &type metadata for CGFloat;
  *(double *)(v15 + 120) = v14;
  CFStringRef v16 = (id)kCGImageSourceCreateThumbnailFromImageAlways;
  CFStringRef v17 = (id)kCGImageSourceCreateThumbnailWithTransform;
  CFStringRef v18 = (id)kCGImageSourceThumbnailMaxPixelSize;
  sub_100009484(v15);
  v19.super.Class isa = sub_10000DA28().super.isa;
  swift_bridgeObjectRelease();
  ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(v12, 0, v19.super.isa);
  if (!ThumbnailAtIndex)
  {

    return 0;
  }
  CGImageRef v21 = ThumbnailAtIndex;
  id v22 = [objc_allocWithZone((Class)UIImage) initWithCGImage:ThumbnailAtIndex];

  return v22;
}

uint64_t sub_100009FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000057DC(&qword_100014830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A058(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A09C()
{
  uint64_t v0 = sub_10000D9D8();
  sub_100007014(v0, qword_100014848);
  sub_100005648(v0, (uint64_t)qword_100014848);
  return sub_10000D9C8();
}

id ObjectCaptureThumbnailProvider.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_1000146C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000D9D8();
  sub_100005648(v2, (uint64_t)qword_100014848);
  uint64_t v3 = sub_10000D9B8();
  os_log_type_t v4 = sub_10000DAE8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ObjectCapture_Thumbnail deinit ThumbnailProvider", v5, 2u);
    swift_slowDealloc();
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ObjectCaptureThumbnailProvider();
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t type metadata accessor for ObjectCaptureThumbnailProvider()
{
  return self;
}

uint64_t ObjectCaptureThumbnailProvider.provideThumbnail(for:_:)(void *a1, void (*a2)(id, void), uint64_t a3)
{
  uint64_t v7 = sub_10000D898();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  CFURLRef v10 = (char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [a1 fileURL];
  sub_10000D868();

  if (sub_10000A70C())
  {
    sub_10000B9AC(a1, a2, a3);
  }
  else
  {
    BOOL v12 = sub_10000AB78((unint64_t)v10);
    [a1 maximumSize];
    double v14 = v13;
    double v16 = v15;
    if (v12)
    {
      uint64_t v17 = swift_allocObject();
      *(void *)(v17 + 16) = v3;
      *(void *)(v17 + 24) = a1;
      uint64_t v30 = sub_10000BFF0;
      uint64_t v31 = v17;
      aBlock = _NSConcreteStackBlock;
      uint64_t v27 = 1107296256;
      char v28 = sub_10000B234;
      double v29 = &unk_100010B90;
      CFStringRef v18 = _Block_copy(&aBlock);
      NSDictionary v19 = self;
      id v20 = v3;
      id v21 = a1;
      id v22 = objc_msgSend(v19, "replyWithContextSize:currentContextDrawingBlock:", v18, v14, v16);
      int64_t v23 = v18;
    }
    else
    {
      uint64_t v30 = sub_10000BE28;
      uint64_t v31 = 0;
      aBlock = _NSConcreteStackBlock;
      uint64_t v27 = 1107296256;
      char v28 = sub_10000B234;
      double v29 = &unk_100010B40;
      uint64_t v24 = _Block_copy(&aBlock);
      id v22 = objc_msgSend(self, "replyWithContextSize:currentContextDrawingBlock:", v24, v14, v16);
      int64_t v23 = v24;
    }
    _Block_release(v23);
    swift_release();
    a2(v22, 0);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

BOOL sub_10000A70C()
{
  uint64_t v32 = sub_10000D9D8();
  uint64_t v1 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D9A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000D898();
  uint64_t v30 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  __chkstk_darwin(v8);
  CFURLRef v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34[0] = 47;
  v34[1] = 0xE100000000000000;
  uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_modelsDirectoryName);
  BOOL v12 = *(void **)(v0 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_modelsDirectoryName + 8);
  swift_bridgeObjectRetain();
  v35._countAndFlagsBits = v11;
  v35._object = v12;
  sub_10000DA78(v35);
  swift_bridgeObjectRelease();
  sub_10000D858();
  swift_bridgeObjectRelease();
  sub_10000D958();
  double v13 = URL.contentFiles(conformingTo:)((uint64_t)v7);
  double v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v7, v4);
  sub_10000D978();
  double v15 = URL.contentFiles(conformingTo:)((uint64_t)v7);
  v14(v7, v4);
  uint64_t v16 = *((void *)v13 + 2);
  swift_bridgeObjectRelease();
  if (v16)
  {
    swift_bridgeObjectRelease();
    BOOL v17 = 1;
  }
  else
  {
    uint64_t v18 = *((void *)v15 + 2);
    swift_bridgeObjectRelease();
    BOOL v17 = v18 != 0;
  }
  uint64_t v19 = v32;
  if (qword_1000146C8 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100005648(v19, (uint64_t)qword_100014848);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v20, v19);
  id v21 = sub_10000D9B8();
  os_log_type_t v22 = sub_10000DAE8();
  if (os_log_type_enabled(v21, v22))
  {
    int64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)int64_t v23 = 136315138;
    v34[0] = v24;
    if (v17) {
      uint64_t v25 = 7562617;
    }
    else {
      uint64_t v25 = 28526;
    }
    if (v17) {
      unint64_t v26 = 0xE300000000000000;
    }
    else {
      unint64_t v26 = 0xE200000000000000;
    }
    double v29 = v3;
    uint64_t v33 = sub_100005BB4(v25, v26, v34);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Bundle contains USDZ: %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v29, v32);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v19);
  }
  (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v31);
  return v17;
}

BOOL sub_10000AB78(unint64_t a1)
{
  uint64_t v2 = sub_10000D9D8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *((void *)sub_10000ADFC(a1, 1) + 2);
  swift_bridgeObjectRelease();
  if (qword_1000146C8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100005648(v2, (uint64_t)qword_100014848);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  uint64_t v8 = sub_10000D9B8();
  os_log_type_t v9 = sub_10000DAE8();
  if (os_log_type_enabled(v8, v9))
  {
    CFURLRef v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)CFURLRef v10 = 136315138;
    uint64_t v18 = v11;
    if (v6) {
      uint64_t v12 = 7562617;
    }
    else {
      uint64_t v12 = 28526;
    }
    if (v6) {
      unint64_t v13 = 0xE300000000000000;
    }
    else {
      unint64_t v13 = 0xE200000000000000;
    }
    uint64_t v16 = v2;
    uint64_t v17 = sub_100005BB4(v12, v13, &v18);
    sub_10000DB68();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Bundle contains images: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v6 != 0;
}

void *sub_10000ADFC(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000D9A8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10000D898();
  uint64_t v9 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = 47;
  unint64_t v28 = 0xE100000000000000;
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_imageDirectoryName);
  unint64_t v13 = *(void **)(v2 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_imageDirectoryName + 8);
  swift_bridgeObjectRetain();
  v29._countAndFlagsBits = v12;
  v29._object = v13;
  sub_10000DA78(v29);
  swift_bridgeObjectRelease();
  sub_10000D858();
  swift_bridgeObjectRelease();
  sub_10000D988();
  uint64_t v14 = (uint64_t)URL.contentFiles(conformingTo:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v15 = *(void *)(v14 + 16);
  BOOL v16 = __OFSUB__(v15, a2);
  uint64_t v17 = v15 - a2;
  if (v16)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v14 = sub_10000B0B0(v17 & ~(v17 >> 63), v14);
  a2 = v18;
  uint64_t v5 = v19;
  a1 = v20;
  if ((v20 & 1) == 0)
  {
LABEL_3:
    id v21 = sub_10000BFF8(v14, a2, v5, a1);
    goto LABEL_10;
  }
  sub_10000DC18();
  swift_unknownObjectRetain_n();
  os_log_type_t v22 = (void *)swift_dynamicCastClass();
  if (!v22)
  {
    swift_unknownObjectRelease();
    os_log_type_t v22 = &_swiftEmptyArrayStorage;
  }
  uint64_t v23 = v22[2];
  swift_release();
  if (__OFSUB__(a1 >> 1, v5)) {
    goto LABEL_12;
  }
  if (v23 != (a1 >> 1) - v5)
  {
LABEL_13:
    swift_unknownObjectRelease();
    goto LABEL_3;
  }
  id v21 = (void *)swift_dynamicCastClass();
  if (!v21)
  {
    swift_unknownObjectRelease();
    id v21 = &_swiftEmptyArrayStorage;
  }
LABEL_10:
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v26);
  return v21;
}

uint64_t sub_10000B0B0(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      sub_10000D898();
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B14C(uint64_t a1, void *a2)
{
  sub_10000B274(a2);
  if (qword_1000146C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000D9D8();
  sub_100005648(v2, (uint64_t)qword_100014848);
  unint64_t v3 = sub_10000D9B8();
  os_log_type_t v4 = sub_10000DAE8();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Thumbnail type generated: stacked images", v5, 2u);
    swift_slowDealloc();
  }

  return 1;
}

uint64_t sub_10000B234(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

uint64_t sub_10000B274(void *a1)
{
  uint64_t v2 = sub_1000057DC(&qword_100014780);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v4 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000D898();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v77 - v10;
  id v12 = [a1 fileURL];
  sub_10000D868();

  [a1 maximumSize];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = sub_10000ADFC((unint64_t)v11, 3);
  id v18 = [self blackColor];
  id v19 = [v18 colorWithAlphaComponent:0.4];

  id v20 = _s17ASVAssetThumbnail013StackedImagesB0V4icon33_6AA8C53F2C4650FAB362222B0509284ELLSo7UIImageCSgvpfi_0();
  long long v93 = xmmword_10000E4F0;
  long long v94 = xmmword_10000E500;
  id v84 = v19;
  id v95 = v19;
  id v96 = v20;
  v97 = v17;
  if (v16 >= v14) {
    double v21 = v14;
  }
  else {
    double v21 = v16;
  }
  CGFloat v22 = v21 * 0.1;
  v100.origin.double x = 0.0;
  v100.origin.double y = 0.0;
  v100.size.double width = v14;
  v100.size.double height = v16;
  CGRect v101 = CGRectInset(v100, v22, v22);
  double x = v101.origin.x;
  double y = v101.origin.y;
  double width = v101.size.width;
  double height = v101.size.height;
  uint64_t v27 = v17[2];
  v83 = v11;
  v82 = v17;
  id v81 = v20;
  if (v27)
  {
    unint64_t v28 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    Swift::String v29 = (char *)v17 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v30 = *(void *)(v6 + 72);
    uint64_t v31 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    v89 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
    v90 = v28;
    CGRect v87 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v88 = v30;
    uint64_t v91 = v6 + 16;
    CGSize v86 = (void (**)(char *, uint64_t))(v6 + 8);
    swift_bridgeObjectRetain_n();
    uint64_t v80 = v6;
    double v79 = x;
    double v78 = y;
    CGSize v85 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    while (1)
    {
      v90(v4, v29, v5);
      uint64_t v33 = *v31;
      (*v31)(v4, 0, 1, v5);
      if ((*v89)(v4, 1, v5) == 1) {
        goto LABEL_29;
      }
      (*v87)(v9, v4, v5);
      id v34 = [self mainScreen];
      [v34 scale];
      double v36 = v35;

      id v37 = sub_100009DB0(width, height, v36);
      if (v37)
      {
        uint64_t v38 = v37;
        [v37 size];
        double v40 = v39;
        [v38 size];
        double v42 = v41;
        [v38 size];
        double v44 = v43;
        [v38 size];
        double v46 = v45;
        double v47 = (CGImage *)[v38 CGImage];
        if (v47)
        {
          double v48 = v47;
          if (v42 >= v40) {
            double v49 = v40;
          }
          else {
            double v49 = v42;
          }
          double v50 = (v46 - v49) * 0.5;
          double v51 = (v44 - v49) * 0.5;
          double v52 = v49;
          CGImageRef v53 = CGImageCreateWithImageInRect(v47, *(CGRect *)(&v49 - 2));

          if (v53)
          {
            uint64_t v32 = (CGContext *)[objc_allocWithZone((Class)UIImage) initWithCGImage:v53];

            uint64_t v31 = v85;
            if (!v32) {
              goto LABEL_8;
            }
            sub_100007E1C(x, y, width, height);
            double v55 = v54;
            double v57 = v56;
            double v59 = v58;
            double v61 = v60;
            id v62 = UIGraphicsGetCurrentContext();
            if (v62)
            {
              uint64_t v63 = v62;
              double v77 = v57;
              if (v61 >= v59) {
                double v64 = v59;
              }
              else {
                double v64 = v61;
              }
              double v65 = v64 * 0.25;
              [(CGContext *)v32 size];
              double v67 = v66;
              double v69 = v68;
              [(CGContext *)v32 size];
              UIGraphicsBeginImageContextWithOptions(v98, 0, 0.0);
              id v70 = objc_msgSend(self, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v67, v69, v65);
              [v70 addClip];
              -[CGContext drawInRect:](v32, "drawInRect:", 0.0, 0.0, v67, v69);
              v71 = UIGraphicsGetImageFromCurrentImageContext();
              UIGraphicsEndImageContext();

              if (v71)
              {
                double v72 = v71;
                double v73 = (void *)UIImage.darken(percentage:)(2);

                if (v73)
                {
                  CGContextSaveGState(v63);
                  double v74 = (CGColor *)[v84 CGColor];
                  v99.double width = 2.0;
                  v99.double height = 2.0;
                  CGContextSetShadowWithColor(v63, v99, 3.0, v74);

                  objc_msgSend(v73, "drawInRect:", v55, v77, v59, v61);
                  CGContextRestoreGState(v63);

                  uint64_t v32 = v63;
                  uint64_t v63 = (CGContext *)v73;
                }
              }
              uint64_t v6 = v80;
              double x = v79;
              double y = v78;

              uint64_t v32 = v63;
            }
          }
          else
          {
            uint64_t v32 = (CGContext *)v38;
          }
          uint64_t v31 = v85;
        }
        else
        {
          uint64_t v32 = (CGContext *)v38;
        }
      }
LABEL_8:
      (*v86)(v9, v5);
      v29 += v88;
      if (!--v27)
      {
        v33(v4, 1, 1, v5);
        goto LABEL_29;
      }
    }
  }
  uint64_t v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  swift_bridgeObjectRetain_n();
  v75(v4, 1, 1, v5);
LABEL_29:
  swift_bridgeObjectRelease_n();
  sub_100007B24(x, y, width, height);
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v83, v5);
}

uint64_t sub_10000B9AC(void *a1, void (*a2)(id, void), uint64_t a3)
{
  double v39 = a2;
  uint64_t v40 = a3;
  uint64_t v5 = sub_1000057DC(&qword_100014780);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10000D9A8();
  uint64_t v8 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D898();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  double v35 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v34 - v16;
  __chkstk_darwin(v15);
  id v19 = (char *)&v34 - v18;
  id v37 = a1;
  id v20 = [a1 fileURL];
  sub_10000D868();

  uint64_t aBlock = 47;
  unint64_t v43 = 0xE100000000000000;
  uint64_t v36 = v3;
  uint64_t v22 = *(void *)(v3 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_modelsDirectoryName);
  double v21 = *(void **)(v3 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_modelsDirectoryName + 8);
  swift_bridgeObjectRetain();
  v48._countAndFlagsBits = v22;
  v48._object = v21;
  sub_10000DA78(v48);
  swift_bridgeObjectRelease();
  sub_10000D858();
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v12 + 8);
  v23(v17, v11);
  sub_10000D978();
  uint64_t v38 = v19;
  uint64_t v24 = URL.contentFiles(conformingTo:)((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v41);
  if (*((void *)v24 + 2))
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v7, &v24[(*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)], v11);
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v7, v25, 1, v11);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1000082FC((uint64_t)v7);
    [v37 maximumSize];
    double v27 = v26;
    double v29 = v28;
    double v46 = sub_10000BE28;
    uint64_t v47 = 0;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v43 = 1107296256;
    double v44 = sub_10000B234;
    double v45 = &unk_100010C80;
    uint64_t v30 = _Block_copy(&aBlock);
    id v31 = objc_msgSend(self, "replyWithContextSize:currentContextDrawingBlock:", v30, v27, v29);
    _Block_release(v30);
    swift_release();
    v39(v31, 0);
  }
  else
  {
    uint64_t v32 = (uint64_t)v35;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v35, v7, v11);
    sub_100002B58(v32, v37, (uint64_t)v39, v40);
    v23((char *)v32, v11);
  }
  return ((uint64_t (*)(char *, uint64_t))v23)(v38, v11);
}

uint64_t sub_10000BE28()
{
  if (qword_1000146C8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000D9D8();
  sub_100005648(v0, (uint64_t)qword_100014848);
  uint64_t v1 = sub_10000D9B8();
  os_log_type_t v2 = sub_10000DAE8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Thumbnail type generated: none.", v3, 2u);
    swift_slowDealloc();
  }

  return 0;
}

id ObjectCaptureThumbnailProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void ObjectCaptureThumbnailProvider.init()()
{
}

uint64_t sub_10000BF98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BFA8()
{
  return swift_release();
}

uint64_t sub_10000BFB0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BFF0()
{
  return sub_10000B14C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void *sub_10000BFF8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return &_swiftEmptyArrayStorage;
  }
  if (v5 <= 0)
  {
    uint64_t v11 = &_swiftEmptyArrayStorage;
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(sub_10000D898() - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      id v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_1000057DC(&qword_1000147E8);
  uint64_t v8 = *(void *)(sub_10000D898() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  size_t v12 = j__malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = (void *)sub_10000DBE8();
  __break(1u);
  return result;
}

uint64_t sub_10000C238(void *a1, uint64_t a2, void (**a3)(const void *, id, void))
{
  uint64_t v6 = sub_1000057DC(&qword_100014780);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10000D9A8();
  uint64_t v9 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D898();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v37[0] = (char *)v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)v37 - v17;
  __chkstk_darwin(v16);
  unint64_t v20 = (char *)v37 - v19;
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = a3;
  uint64_t v38 = a3;
  _Block_copy(a3);
  double v39 = a1;
  id v21 = [a1 fileURL];
  sub_10000D868();

  uint64_t aBlock = 47;
  unint64_t v43 = 0xE100000000000000;
  v37[1] = a2;
  uint64_t v22 = *(void *)(a2 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_modelsDirectoryName);
  uint64_t v23 = *(void **)(a2 + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_modelsDirectoryName + 8);
  swift_bridgeObjectRetain();
  v48._countAndFlagsBits = v22;
  v48._object = v23;
  sub_10000DA78(v48);
  swift_bridgeObjectRelease();
  sub_10000D858();
  swift_bridgeObjectRelease();
  uint64_t v24 = v18;
  uint64_t v25 = v20;
  double v26 = *(void (**)(char *, uint64_t))(v13 + 8);
  v26(v24, v12);
  sub_10000D978();
  double v27 = URL.contentFiles(conformingTo:)((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v41);
  if (*((void *)v27 + 2))
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, &v27[(*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)], v12);
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v8, v28, 1, v12);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) == 1)
  {
    sub_1000082FC((uint64_t)v8);
    [v39 maximumSize];
    double v30 = v29;
    double v32 = v31;
    double v46 = sub_10000BE28;
    uint64_t v47 = 0;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v43 = 1107296256;
    double v44 = sub_10000B234;
    double v45 = &unk_100010C58;
    uint64_t v33 = _Block_copy(&aBlock);
    id v34 = objc_msgSend(self, "replyWithContextSize:currentContextDrawingBlock:", v33, v30, v32);
    _Block_release(v33);
    swift_release();
    v38[2](v38, v34, 0);
  }
  else
  {
    uint64_t v35 = v37[0];
    (*(void (**)(void, char *, uint64_t))(v13 + 32))(v37[0], v8, v12);
    sub_100002B58(v35, v39, (uint64_t)sub_1000070B0, v40);
    v26((char *)v35, v12);
  }
  v26(v25, v12);
  return swift_release();
}

void sub_10000C70C(void *a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v6 = sub_10000D898();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  _Block_copy(a3);
  id v10 = [a1 fileURL];
  sub_10000D868();

  if (sub_10000A70C())
  {
    _Block_copy(a3);
    sub_10000C238(a1, (uint64_t)a2, (void (**)(const void *, id, void))a3);
    _Block_release(a3);
  }
  else
  {
    BOOL v11 = sub_10000AB78((unint64_t)v9);
    [a1 maximumSize];
    double v13 = v12;
    double v15 = v14;
    if (v11)
    {
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = a2;
      *(void *)(v16 + 24) = a1;
      uint64_t v28 = sub_10000CA6C;
      uint64_t v29 = v16;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v25 = 1107296256;
      double v26 = sub_10000B234;
      double v27 = &unk_100010C08;
      uint64_t v17 = _Block_copy(&aBlock);
      uint64_t v18 = self;
      id v19 = a2;
      id v20 = a1;
      id v21 = objc_msgSend(v18, "replyWithContextSize:currentContextDrawingBlock:", v17, v13, v15);
      _Block_release(v17);
      swift_release();
      ((void (**)(void, id, void))a3)[2](a3, v21, 0);
    }
    else
    {
      uint64_t v28 = sub_10000BE28;
      uint64_t v29 = 0;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v25 = 1107296256;
      double v26 = sub_10000B234;
      double v27 = &unk_100010BB8;
      uint64_t v22 = _Block_copy(&aBlock);
      id v23 = objc_msgSend(self, "replyWithContextSize:currentContextDrawingBlock:", v22, v13, v15);
      _Block_release(v22);
      swift_release();
      ((void (**)(void, id, void))a3)[2](a3, v23, 0);
    }
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  _Block_release(a3);
}

uint64_t sub_10000CA34()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000CA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_10000D7F8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_10000CB0C()
{
  uint64_t v0 = sub_10000D9D8();
  sub_100007014(v0, qword_1000148A8);
  sub_100005648(v0, (uint64_t)qword_1000148A8);
  return sub_10000D9C8();
}

void sub_10000CB90()
{
  qword_1000148C0 = 0x7061636A626FLL;
  *(void *)algn_1000148C8 = 0xE600000000000000;
}

id sub_10000CBB0()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = self;
  uint64_t v3 = v0;
  id v4 = [v2 mainBundle];
  NSString v5 = sub_10000DA48();
  id v6 = [v4 objectForInfoDictionaryKey:v5];

  if (v6)
  {
    sub_10000DB88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_100007148((uint64_t)v25, (uint64_t)v26);
  if (v26[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v8 = v21;
      unint64_t v7 = v22;
      goto LABEL_9;
    }
  }
  else
  {
    sub_10000D764((uint64_t)v26);
  }
  unint64_t v7 = 0xE100000000000000;
  uint64_t v8 = 63;
LABEL_9:
  if (qword_1000146D0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10000D9D8();
  sub_100005648(v9, (uint64_t)qword_1000148A8);
  swift_bridgeObjectRetain();
  id v10 = sub_10000D9B8();
  os_log_type_t v11 = sub_10000DAE8();
  if (os_log_type_enabled(v10, v11))
  {
    double v12 = ObjectType;
    double v13 = (uint8_t *)swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)double v13 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v25[0] = sub_100005BB4(v8, v7, v26);
    sub_10000DB68();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "ARQL_Thumbnail init ThumbnailProvider v%s shared", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    ObjectType = v12;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v14 = [objc_allocWithZone((Class)type metadata accessor for USDRealityThumbnailProvider()) init];
  *(void *)&v3[OBJC_IVAR____TtC17ASVAssetThumbnail17ThumbnailProvider_usdRealityProvider] = v14;
  double v15 = (objc_class *)type metadata accessor for ObjectCaptureThumbnailProvider();
  uint64_t v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_maximumNumberOfStackedImages] = 3;
  uint64_t v17 = &v16[OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_modelsDirectoryName];
  *(void *)uint64_t v17 = 0x736C65646F6DLL;
  *((void *)v17 + 1) = 0xE600000000000000;
  uint64_t v18 = &v16[OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_imageDirectoryName];
  *(void *)uint64_t v18 = 0x736567616D69;
  *((void *)v18 + 1) = 0xE600000000000000;
  *(void *)&v16[OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_usdRealityProvider] = v14;
  v24.receiver = v16;
  v24.super_class = v15;
  id v19 = v14;
  *(void *)&v3[OBJC_IVAR____TtC17ASVAssetThumbnail17ThumbnailProvider_objectCaptureProvider] = objc_msgSendSuper2(&v24, "init");

  v23.receiver = v3;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, "init");
}

void sub_10000CF50(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v33 = a2;
  uint64_t v7 = sub_10000D898();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  double v13 = (char *)&v32 - v12;
  id v14 = [a1 fileURL];
  sub_10000D868();

  uint64_t v15 = sub_10000D828();
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v13, v7);
  if (qword_1000146D8 != -1) {
    swift_once();
  }
  if (v15 == qword_1000148C0 && v17 == *(void *)algn_1000148C8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = sub_10000DC08();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      if (qword_1000146D0 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_10000D9D8();
      sub_100005648(v21, (uint64_t)qword_1000148A8);
      unint64_t v22 = sub_10000D9B8();
      os_log_type_t v23 = sub_10000DAE8();
      if (os_log_type_enabled(v22, v23))
      {
        objc_super v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)objc_super v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Generating thumbnail for USDZ or Reality file", v24, 2u);
        swift_slowDealloc();
      }

      id v25 = [a1 fileURL];
      sub_10000D868();

      sub_100002B58((uint64_t)v11, a1, v33, a3);
      v18(v11, v7);
      return;
    }
  }
  if (qword_1000146D0 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_10000D9D8();
  sub_100005648(v26, (uint64_t)qword_1000148A8);
  double v27 = sub_10000D9B8();
  os_log_type_t v28 = sub_10000DAE8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Generating thumbnail for Object Capture file", v29, 2u);
    swift_slowDealloc();
  }

  double v30 = *(void **)(v4 + OBJC_IVAR____TtC17ASVAssetThumbnail17ThumbnailProvider_objectCaptureProvider);
  aBlock[4] = v33;
  aBlock[5] = a3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D35C;
  aBlock[3] = &unk_100010CD0;
  double v31 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v30 provideThumbnailForFileRequest:a1 completionHandler:v31];
  _Block_release(v31);
}

void sub_10000D35C(uint64_t a1, void *a2, void *a3)
{
  NSString v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_10000D488()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_1000146D0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10000D9D8();
  sub_100005648(v3, (uint64_t)qword_1000148A8);
  uint64_t v4 = sub_10000D9B8();
  os_log_type_t v5 = sub_10000DAE8();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "ARQL_Thumbnail deinit ThumbnailProvider shared", v6, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, "dealloc");
}

uint64_t type metadata accessor for ThumbnailProvider()
{
  return self;
}

uint64_t sub_10000D714()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D74C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D75C()
{
  return swift_release();
}

uint64_t sub_10000D764(uint64_t a1)
{
  uint64_t v2 = sub_1000057DC(&qword_1000147A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D7C4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10000D7F8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000D808()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000D818()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10000D828()
{
  return URL.pathExtension.getter();
}

uint64_t sub_10000D838()
{
  return URL.lastPathComponent.getter();
}

void sub_10000D848(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000D858()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_10000D868()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D878()
{
  return URL.path.getter();
}

uint64_t sub_10000D888()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10000D898()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000D8A8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D8B8()
{
  return Data.write(to:options:)();
}

uint64_t sub_10000D8C8()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10000D8D8()
{
  return Date.init()();
}

uint64_t sub_10000D8E8()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000D8F8()
{
  return ARQLRenderer.init(showBackgroundGradient:assetPathPrefix:opaqueBackground:)();
}

uint64_t sub_10000D908()
{
  return type metadata accessor for ARQLRenderer();
}

uint64_t sub_10000D918()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_10000D928()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_10000D938()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10000D948()
{
  return UTType.init(filenameExtension:conformingTo:)();
}

uint64_t sub_10000D958()
{
  return static UTType.usd.getter();
}

uint64_t sub_10000D968()
{
  return static UTType.data.getter();
}

uint64_t sub_10000D978()
{
  return static UTType.usdz.getter();
}

uint64_t sub_10000D988()
{
  return static UTType.image.getter();
}

uint64_t sub_10000D998()
{
  return UTType.conforms(to:)();
}

uint64_t sub_10000D9A8()
{
  return type metadata accessor for UTType();
}

uint64_t sub_10000D9B8()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000D9C8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000D9D8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000D9E8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10000D9F8()
{
  return static DispatchQoS.background.getter();
}

uint64_t sub_10000DA08()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10000DA18()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_10000DA28()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000DA38()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10000DA48()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000DA58()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000DA68()
{
  return String.hash(into:)();
}

void sub_10000DA78(Swift::String a1)
{
}

Swift::Int sub_10000DA88()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000DA98()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000DAA8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000DAB8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000DAC8()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000DAD8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000DAE8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000DAF8()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10000DB08()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10000DB18()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10000DB28()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

void sub_10000DB38()
{
}

Swift::Int sub_10000DB48()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_10000DB58()
{
  return CGSize.debugDescription.getter();
}

uint64_t sub_10000DB68()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000DB78()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000DB88()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000DB98()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10000DBA8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000DBB8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000DBC8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000DBD8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000DBE8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000DBF8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000DC08()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000DC18()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10000DC28()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000DC38()
{
  return Hasher._finalize()();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return _CGContextGetCTM(retstr, c);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return _CGContextSetBaseCTM();
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGIOSurfaceContextCreate()
{
  return _CGIOSurfaceContextCreate();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}