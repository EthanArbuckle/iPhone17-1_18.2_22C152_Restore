uint64_t IMDaemonAutomationRequestHandler.requiredCapabilities.getter()
{
  return 0;
}

void sub_100005B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005D60(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v6 = [a3 objectForKeyedSubscript:IMClientSetupContextNumberOfChatsToLoad];
  uint64_t v7 = (uint64_t)[v6 integerValue];

  if (v7 >= 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
    *a4 = 1;
  }
}

uint64_t sub_10000604C(uint64_t a1, uint64_t a2)
{
  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = sub_10004D1E0();
  swift_retain();
  v3(a2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_100006254(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, id))
{
  id v5 = objc_allocWithZone((Class)IMXPCDictionary);
  swift_bridgeObjectRetain();
  Class isa = sub_10004D1C0().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithDictionary:isa key:"setupInfo"];

  a3(a1, v7);
}

uint64_t ClientRequestHandling<>.client.getter()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &unk_10007C670);
  uint64_t result = swift_endAccess();
  if (v1)
  {
    sub_10004D360();
    swift_unknownObjectRelease();
    sub_100008458(&v4, &v5);
    sub_10004CF30();
    swift_dynamicCast();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100006BA0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v11 = sub_10004D150();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100008690();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v16 = sub_10004D130();
  os_log_type_t v17 = sub_10004D2E0();
  int v44 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v45 = a3;
    uint64_t v19 = v18;
    uint64_t v39 = swift_slowAlloc();
    uint64_t v47 = v39;
    *(_DWORD *)uint64_t v19 = 136315650;
    v42 = a5;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100007094(a1, a2, &v47);
    uint64_t v40 = v11;
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2080;
    id v20 = (id)IMStringFromClientCapabilities();
    uint64_t v43 = a6;
    id v21 = v20;
    uint64_t v22 = sub_10004D210();
    uint64_t v38 = a1;
    uint64_t v23 = v22;
    unint64_t v41 = a2;
    unint64_t v25 = v24;

    uint64_t v46 = sub_100007094(v23, v25, &v47);
    sub_10004D340();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_10004D1F0();
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v29 = v26;
    a5 = v42;
    uint64_t v46 = sub_100007094(v29, v28, &v47);
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, (os_log_type_t)v44, "Preparing setup info for %s with %s and context %s", (uint8_t *)v19, 0x20u);
    a6 = v43;
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v45;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v40);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v30 = (id *)sub_10003D25C();
  v31 = *(uint64_t (**)(void))((swift_isaMask & *(void *)*v30) + 0xB8);
  id v32 = *v30;
  LOBYTE(v31) = v31();

  if (v31) {
    uint64_t v33 = a3;
  }
  else {
    uint64_t v33 = a3 & 0x1842F8;
  }
  sub_100008470();
  sub_1000084B0();
  ClientRequestHandling<>.client.getter();
  sub_10004CF20();
  swift_release();
  Class isa = sub_10004D1C0().super.isa;
  id v35 = [a5 _setupInfoForCapabilities:v33 context:isa];

  sub_10004D1E0();
  Class v36 = sub_10004D1C0().super.isa;
  (*(void (**)(uint64_t, uint64_t, Class))(a6 + 16))(a6, 1, v36);
  swift_bridgeObjectRelease();

  id v37 = [self sharedInstance];
  [v37 broadcastCloudKitStateAfterFetchingAccountStatus];
}

uint64_t sub_100007094(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007214(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000071B8((uint64_t)v12, *a3);
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
      sub_1000071B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007168((uint64_t)v12);
  return v7;
}

uint64_t sub_100007168(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000071B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007214(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10004D350();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100035E4C(a5, a6);
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
  uint64_t v8 = sub_10004D3C0();
  if (!v8)
  {
    sub_10004D420();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10004D470();
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

void sub_1000076AC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100007670);
  }
  _Unwind_Resume(a1);
}

id ClientRequestHandling<>.init(client:)(void *a1)
{
  id v2 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  sub_100007C78(a1);

  swift_release();
  return v2;
}

uint64_t sub_100007C78(void *a1)
{
  swift_beginAccess();
  objc_setAssociatedObject(v1, &unk_10007C670, a1, (void *)1);
  return swift_endAccess();
}

uint64_t IMDaemonChatMessageHistoryRequestHandler.requiredCapabilities.getter()
{
  return 8196;
}

uint64_t sub_100008308()
{
  return swift_release();
}

uint64_t sub_100008310()
{
  return swift_release();
}

uint64_t sub_100008318()
{
  return swift_release();
}

uint64_t sub_100008320()
{
  return swift_release();
}

uint64_t sub_100008328()
{
  return swift_release();
}

uint64_t sub_100008330()
{
  return swift_release();
}

uint64_t sub_100008338()
{
  return swift_release();
}

uint64_t sub_100008340(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008350(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008360(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008370(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008380(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008390(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000083A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000083B0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000083E8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 objectForKeyedSubscript:IMClientSetupContextPinnedChatIdentifiers];
  if (v4) {
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
  }

  return _objc_release_x1();
}

_OWORD *sub_100008458(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t IMDaemonChatRequestHandler.requiredCapabilities.getter()
{
  return 4;
}

unint64_t sub_100008470()
{
  unint64_t result = qword_10007C858;
  if (!qword_10007C858)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007C858);
  }
  return result;
}

unint64_t sub_1000084B0()
{
  unint64_t result = qword_10007C860;
  if (!qword_10007C860)
  {
    sub_100008470();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C860);
  }
  return result;
}

void sub_100008508(uint64_t a1, uint64_t a2)
{
  sub_100006254(a1, a2, *(void (**)(uint64_t, id))(v2 + 16));
}

uint64_t type metadata accessor for ChatInsertMessageRequestHandler()
{
  return self;
}

uint64_t type metadata accessor for SyncedSettingsRequestHandler()
{
  return self;
}

uint64_t type metadata accessor for IntentClientRequestHandler()
{
  return self;
}

uint64_t sub_10000863C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10004D150();

  return sub_1000083B0(v3, a2);
}

uint64_t sub_100008690()
{
  return sub_10000863C(&qword_10007D370, (uint64_t)qword_10007D268);
}

uint64_t sub_1000086B4(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(v2 + 16) + 16))(*(void *)(v2 + 16), a1 & 1, a2);
}

void sub_10000A89C(uint64_t a1)
{
  uint64_t v2 = +[IMDReplayController sharedInstance];
  [v2 restoreDefaultStoreControllerInstance];

  uint64_t v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [*(id *)(a1 + 32) stringByAppendingString:@"-wal"];
  [v3 removeItemAtPath:v4 error:0];

  long long v5 = +[NSFileManager defaultManager];
  uint64_t v6 = [*(id *)(a1 + 32) stringByAppendingString:@"-shm"];
  [v5 removeItemAtPath:v6 error:0];

  id v7 = +[NSFileManager defaultManager];
  [v7 removeItemAtPath:*(void *)(a1 + 32) error:0];
}

void sub_10000BF04()
{
  if (qword_10007D310 != -1) {
    dispatch_once(&qword_10007D310, &stru_1000716A8);
  }
}

void sub_10000BF2C(id a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  for (uint64_t i = 0; i != 7; ++i)
  {
    int v3 = dword_100055268[i];
    qword_10007D318 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v3, 0, global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000C038;
    handler[3] = &unk_1000716C8;
    int v6 = v3;
    dispatch_source_set_event_handler((dispatch_source_t)qword_10007D318, handler);
    uint64_t v4 = qword_10007D318;
    qword_10007D230[i] = qword_10007D318;
    dispatch_resume(v4);
    signal(v3, (void (__cdecl *)(int))1);
  }
}

void sub_10000C038(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C124;
  block[3] = &unk_1000716C8;
  int v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000C0B0(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C124;
  block[3] = &unk_1000716C8;
  int v2 = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000C124(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 14)
  {
    if (v1 == 13)
    {
      signal(2, (void (__cdecl *)(int))sub_10000C0B0);
    }
    else if (v1 == 1 || v1 == 3)
    {
      goto LABEL_21;
    }
  }
  else
  {
    if (v1 != 30)
    {
      if (v1 == 31)
      {
        _IMLog();
        uint64_t v2 = _IMSyncLoggingSettings();
        _MarcoSyncLoggingsPreferences(v2);
        return;
      }
      if (v1 != 15) {
        return;
      }
LABEL_21:
      _IMLog();
      [+[NSNotificationCenter defaultCenter] __mainThreadPostNotificationName:@"IMDaemonShutdownNotification" object:0];
      _IMLog();
      exit(0);
    }
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    id v4 = [objc_alloc((Class)IMWeakLinkClass()) initWithName:@"com.apple.MobileSMS"];
    [+[IMDSpotlightIndexDelegate sharedInstance] searchableIndex:v4 reindexAllSearchableItemsWithAcknowledgementHandler:&stru_1000716E8];
  }
}

void sub_10000D09C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10000D060);
  }
  _Unwind_Resume(a1);
}

void sub_10000EE84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "messagePartIndex")))
  {
    id v4 = [v3 messagePartBody];

    if (v4)
    {
      long long v5 = +[IMDDatabase database];
      int v6 = [v3 messagePartBody];
      id v7 = [*(id *)(a1 + 40) guid];
      [v5 storeRecoverableMessagePartWithBody:v6 forMessageWithGUID:v7 deleteDate:*(void *)(a1 + 48)];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Mardid: deleting message part: found no message-part body-text to store for recovery", v9, 2u);
      }
    }
  }
}

id sub_10000FDEC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_100010040(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

void sub_100010230(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _chatDictionariesWithLastMessageRecordDateFromDictionaries:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000104FC(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  if (v3)
  {
    id v5 = v3;
    id v4 = [v3 date];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"lastMessageRecordDateForQuery"];

    id v3 = v5;
  }
}

id sub_10001068C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_1000108C8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_100010B04(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_100010DD4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

void sub_100011310(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 ID];
  [v2 addObject:v3];
}

BOOL sub_100011964(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

uint64_t sub_1000134C0(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  }
  return result;
}

void sub_1000159F0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = +[IMDClientRequestContext currentContext];
    id v4 = [v5 replyProxy];
    [v4 markedAsReadForMessageGUID:*(void *)(a1 + 40) success:a2 queryID:*(void *)(a1 + 32)];
  }
}

void sub_100017360(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1000172C4);
  }
  _Unwind_Resume(a1);
}

void sub_1000177BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Finished downloading attachment batch.", buf, 2u);
    }
  }
  id v5 = [*(id *)(a1 + 32) _broadcastedUncachedAttachmentCountForChatWithGUID:*(void *)(a1 + 40) chatIdentifiers:*(void *)(a1 + 48) services:*(void *)(a1 + 56) broadcaster:*(void *)(a1 + 64)];
  int v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 72)];
  signed int v7 = [v6 intValue];

  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 80);
  if (v5 == (id)v7)
  {
    ++v9;
    if (!IMOSLoggingEnabled()) {
      goto LABEL_14;
    }
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = +[NSNumber numberWithUnsignedInteger:v5];
      uint64_t v12 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
      uint64_t v13 = +[NSNumber numberWithUnsignedInteger:v9];
      uint64_t v14 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138413058;
      v51 = v11;
      __int16 v52 = 2112;
      v53 = v12;
      __int16 v54 = 2112;
      v55 = v13;
      __int16 v56 = 2112;
      uint64_t v57 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Purged count did not change and is still %@, changing retry count from %@ to %@ for key %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 8);
    v16 = +[NSNumber numberWithUnsignedInteger:v5];
    [v15 setObject:v16 forKey:*(void *)(a1 + 72)];

    if (!IMOSLoggingEnabled()) {
      goto LABEL_14;
    }
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v17 = +[NSNumber numberWithUnsignedInteger:v8];
      uint64_t v18 = +[NSNumber numberWithUnsignedInteger:v5];
      uint64_t v19 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138412802;
      v51 = v17;
      __int16 v52 = 2112;
      v53 = v18;
      __int16 v54 = 2112;
      v55 = v19;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Purged count changed from %@ to %@ for key %@", buf, 0x20u);
    }
  }

LABEL_14:
  id v20 = +[IMDBroadcastController sharedProvider];
  id v21 = [v20 broadcasterForChatListeners];
  [v21 downloadedPurgedAssetBatchForChatIDs:*(void *)(a1 + 48) completedTransferGUIDs:v3];

  unsigned int v22 = [*(id *)(a1 + 32) _shouldContinueDownloadingPurgedAttachments:v9];
  if (v5) {
    unsigned int v23 = v22;
  }
  else {
    unsigned int v23 = 0;
  }
  if (v23 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        unint64_t v25 = *(void **)(a1 + 48);
        uint64_t v26 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 88)];
        unint64_t v27 = *(void **)(a1 + 56);
        uint64_t v28 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138413058;
        v51 = v25;
        __int16 v52 = 2112;
        v53 = v26;
        __int16 v54 = 2112;
        v55 = v27;
        __int16 v56 = 2112;
        uint64_t v57 = v28;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Detected more purged attachments, downloading next batch for chatIdentifiers %@ style %@ services %@ chat guid %@.", buf, 0x2Au);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017E74;
    block[3] = &unk_1000718B8;
    void block[4] = *(void *)(a1 + 32);
    id v44 = *(id *)(a1 + 48);
    char v49 = *(unsigned char *)(a1 + 88);
    id v45 = *(id *)(a1 + 56);
    id v46 = *(id *)(a1 + 40);
    uint64_t v48 = v9;
    id v47 = *(id *)(a1 + 64);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (v5 && IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = +[NSNumber numberWithUnsignedInteger:v9];
        v31 = *(void **)(a1 + 48);
        id v32 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 88)];
        uint64_t v33 = *(void *)(a1 + 56);
        uint64_t v34 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138413314;
        v51 = v30;
        __int16 v52 = 2112;
        v53 = v31;
        __int16 v54 = 2112;
        v55 = v32;
        __int16 v56 = 2112;
        uint64_t v57 = v33;
        __int16 v58 = 2112;
        uint64_t v59 = v34;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Detected more purged attachments but not downloading next batch becaused reached max retry count %@ for chatIdentifiers %@ style %@ services %@ chat guid %@.", buf, 0x34u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        Class v36 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v51 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "No more attachments to download, downloading completed for chatIDs: %@", buf, 0xCu);
      }
    }
    id v37 = +[IMDChatUtilities sharedUtilities];
    uint64_t v38 = [v37 currentlyDownloadingSet];
    uint64_t v39 = (void *)(a1 + 48);
    uint64_t v40 = +[IMDChatUtilities _stringForChatIDs:*(void *)(a1 + 48) onServices:*(void *)(a1 + 56)];
    [v38 removeObject:v40];

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 72)];
    unint64_t v41 = +[IMDBroadcastController sharedProvider];
    v42 = [v41 broadcasterForChatListeners];
    [v42 finishedDownloadingPurgedAssetsForChatIDs:*v39];
  }
}

void sub_100017DF8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100017B3CLL);
  }
  _Unwind_Resume(a1);
}

id sub_100017E74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadPurgedAttachmentsForIDs:*(void *)(a1 + 40) style:*(unsigned __int8 *)(a1 + 80) onServices:*(void *)(a1 + 48) chatID:*(void *)(a1 + 56) retryCount:*(void *)(a1 + 72) broadcaster:*(void *)(a1 + 64)];
}

void sub_100018238(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Replying with groupIDsToGroupPhotos dictionary: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_10001A99C(id a1)
{
  off_10007D328 = (_UNKNOWN *)IMWeakLinkSymbol();
}

void sub_10001DDE0(id a1)
{
  qword_10007D340 = objc_alloc_init(IMDChatUtilities);

  _objc_release_x1();
}

void sub_10001E054(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v32 = a3;
  uint64_t v33 = v5;
  uint64_t v34 = v6;
  if (![v5 count])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_51;
    }
    v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "No items to store, ignoring", buf, 2u);
    }
LABEL_41:

    goto LABEL_51;
  }
  if (![v6 length])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_51;
    }
    v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "No chat GUID to store in, ignoring", buf, 2u);
    }
    goto LABEL_41;
  }
  id v7 = +[IMDChatRegistry sharedInstance];
  id v35 = [v7 existingChatWithGUID:v6];

  int v8 = IMOSLoggingEnabled();
  if (v35)
  {
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "= Starting to store items: %@", buf, 0xCu);
      }
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = v5;
    uint64_t v11 = 0;
    id v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v16 = +[IMDMessageStore sharedInstance];
          os_log_type_t v17 = [v15 guid];
          uint64_t v18 = [v16 itemWithGUID:v17];

          uint64_t v19 = +[IMDMessageStore sharedInstance];
          id v20 = [v19 storeItem:v15 forceReplace:0];

          if (!v20)
          {
            if (!IMOSLoggingEnabled()) {
              goto LABEL_31;
            }
            unsigned int v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v42 = 0;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, " Skipped item, didn't store: %@", buf, 0xCu);
            }
            goto LABEL_30;
          }
          if (v11 || (uint64_t v11 = (__CFArray *)objc_alloc_init((Class)NSMutableArray)) != 0) {
            CFArrayAppendValue(v11, v20);
          }
          if (!v18)
          {
            if (IMOSLoggingEnabled())
            {
              id v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v42 = v20;
                __int16 v43 = 2112;
                id v44 = v35;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "  Assocating item: %@ to chat: %@", buf, 0x16u);
              }
            }
            unsigned int v22 = +[IMDChatRegistry sharedInstance];
            [v22 addItem:v20 toChat:v35];
          }
          if (IMOSLoggingEnabled())
          {
            unsigned int v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v42 = v20;
              __int16 v43 = 2112;
              id v44 = v35;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, " Stored item: %@   in chat: %@", buf, 0x16u);
            }
LABEL_30:
          }
LABEL_31:
        }
        id v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v12);
    }

    if (IMOSLoggingEnabled())
    {
      unint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "= Done storing items", buf, 2u);
      }
    }
    unint64_t v25 = +[IMDBroadcastController sharedProvider];
    uint64_t v26 = objc_msgSend(v25, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v35, "isBlackholed"));

    unint64_t v27 = (void *)IMCreateSerializedItemsFromArray();
    uint64_t v28 = [v35 accountID];
    uint64_t v29 = [v35 chatIdentifier];
    objc_msgSend(v26, "account:chat:style:chatProperties:messagesUpdated:", v28, v29, objc_msgSend(v35, "style"), 0, v27);
  }
  else if (v8)
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v5;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Asked to store chat items: %@   in guid: %@, however chat doesn't exist", buf, 0x16u);
    }
  }
LABEL_51:
}

void _sSo26IMDaemonChatRequestHandlerC7imagentE23markChatsAsReadFiltered5usingySo11NSPredicateC_tF_0(void *a1)
{
  id v38 = a1;
  if (IMOSLoggingEnabled())
  {
    int v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v38;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Marking all as read with chat predicate %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v2 = objc_alloc_init((Class)NSMutableSet);
  do
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v55 = 0x3032000000;
    __int16 v56 = sub_10001EFE8;
    uint64_t v57 = sub_10001EFF8;
    id v58 = 0;
    id v3 = +[IMDDatabase synchronousDatabase];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10001F000;
    v49[3] = &unk_100071988;
    v49[4] = &buf;
    [v3 fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:v38 limit:50 completionHandler:v49];

    if ([*(id *)(*((void *)&buf + 1) + 40) count])
    {
      id v4 = objc_alloc((Class)NSMutableArray);
      id v5 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v6 = *(id *)(*((void *)&buf + 1) + 40);
      id v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v46 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            uint64_t v11 = [v10 guid];
            [v5 addObject:v11];

            id v12 = [v10 chatRecord];
            uint64_t v13 = [v12 guid];
            [v2 addObject:v13];
          }
          id v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v7);
      }

      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v51 = 138412290;
          id v52 = v2;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Marking chats as read %@", v51, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v51 = 138412290;
          id v52 = v5;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "   with messages: %@", v51, 0xCu);
        }
      }
      v16 = +[IMDDatabase synchronousDatabase];
      [v16 markMessageRecordsAsReadWithGUIDs:v5];

      os_log_type_t v17 = +[IMDMessageStore sharedInstance];
      [v17 retractPostedNotificationsForMessageGUIDs:v5];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No messages to mark as read", v51, 2u);
      }
    }
    BOOL v19 = (unint64_t)[*(id *)(*((void *)&buf + 1) + 40) count] > 0x31;
    _Block_object_dispose(&buf, 8);
  }
  while (v19);
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Deleting orphaned messages", (uint8_t *)&buf, 2u);
    }
  }
  IMDMessageRecordDeleteOrphanedMessages();
  if ([v2 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v2;
    id v21 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v21)
    {
      uint64_t v40 = *(void *)v42;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v42 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
          if (IMOSLoggingEnabled())
          {
            unint64_t v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Recalculating unread count for chat %@", (uint8_t *)&buf, 0xCu);
            }
          }
          unint64_t v25 = +[IMDChatRegistry sharedInstance];
          uint64_t v26 = [v25 existingChatWithGUID:v23];

          unint64_t v27 = +[IMDChatRegistry sharedInstance];
          [v27 updateStateForChat:v26 forcePost:1 shouldRebuildFailedMessageDate:1 shouldCalculateUnreadCount:1];

          uint64_t v28 = [v26 lastMessage];
          if ([v28 isFromMe])
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v28;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Last message for chat was from me, not sending read receipt %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          else
          {
            v30 = [v26 accountID];
            v31 = +[IMDAccountController sharedInstance];
            id v32 = [v31 sessionForAccount:v30];

            if (IMOSLoggingEnabled())
            {
              uint64_t v33 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                uint64_t v34 = [v26 lastMessage];
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v34;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Sending receipt for last message: %@", (uint8_t *)&buf, 0xCu);
              }
            }
            id v35 = [v26 guid];
            long long v36 = [v26 chatIdentifier];
            objc_msgSend(v32, "sendReadReceiptForMessage:toChatID:identifier:style:", v28, v35, v36, objc_msgSend(v26, "style"));
          }
        }
        id v21 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v21);
    }
  }
  else
  {
    long long v37 = +[IMDMessageStore sharedInstance];
    [v37 rebuildUnreadMessageCount];

    id obj = +[IMDMessageStore sharedInstance];
    [obj rebuildLastFailedMessageDate];
  }
}

uint64_t sub_10001EFE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001EFF8(uint64_t a1)
{
}

void sub_10001F000(uint64_t a1, void *a2)
{
}

void sub_10001F010(void *a1, uint64_t a2, void *a3, void *a4, id a5, uint64_t a6, uint64_t a7)
{
  id v12 = a1;
  id v101 = a3;
  id v13 = a4;
  v103 = v12;
  if ([v12 count] && objc_msgSend(v101, "count"))
  {
    id v14 = [v12 count];
    if (v14 == [v101 count])
    {
      v97 = v13;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v15 = v101;
      id v16 = [v15 countByEnumeratingWithState:&v122 objects:v136 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v123;
LABEL_6:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v123 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v122 + 1) + 8 * v18);
          uint64_t v20 = +[IMDServiceController sharedController];
          id v21 = [(id)v20 serviceWithName:v19];

          LOBYTE(v20) = [v21 supportsDatabase];
          if (v20) {
            break;
          }
          if (v16 == (id)++v18)
          {
            id v16 = [v15 countByEnumeratingWithState:&v122 objects:v136 count:16];
            if (v16) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }

        unint64_t v24 = +[IMDMessageStore sharedInstance];
        unint64_t v25 = [v97 lastObject];
        uint64_t v26 = +[NSDate __im_dateWithCurrentServerTime];
        v99 = [v24 markMessagesAsReadWithIdentifiers:v103 onServices:v15 chatStyle:a2 upToGUID:v25 readDate:v26 fromMe:0];

        if (IMOSLoggingEnabled())
        {
          unint64_t v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412802;
            uint64_t v131 = (uint64_t)v99;
            __int16 v132 = 2112;
            id v133 = v103;
            __int16 v134 = 2112;
            id v135 = v15;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Found message guids to mark as read: %@ for IDs %@ services %@", buf, 0x20u);
          }
        }
        uint64_t v28 = +[IMDMessageStore sharedInstance];
        [v28 retractPostedNotificationsForMessageGUIDs:v99];

        if ([v99 count])
        {
          uint64_t v29 = +[IMDMessageStore sharedInstance];
          v96 = [v29 messagesWithGUIDs:v99];

          v98 = [v96 lastObject];
          v95 = [v98 service];
          if (IMOSLoggingEnabled())
          {
            v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v131 = (uint64_t)v95;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Looking for chat that matches last message service %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v95 = 0;
          v96 = 0;
          v98 = 0;
        }
        v31 = +[IMDMessageStore sharedInstance];
        v102 = objc_msgSend(v31, "chatForMessageIdentifier:", objc_msgSend(v98, "messageID"));

        id v100 = objc_alloc_init((Class)NSMutableSet);
        if ([v103 count])
        {
          unint64_t v32 = 0;
          do
          {
            uint64_t v33 = [v15 objectAtIndex:v32];
            uint64_t v34 = [v103 objectAtIndex:v32];
            id v35 = (void *)IMCopyGUIDForChat();

            [v100 addObject:v35];
            ++v32;
          }
          while (v32 < (unint64_t)[v103 count]);
        }
        if (!v102)
        {
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          id v36 = v100;
          id v37 = [v36 countByEnumeratingWithState:&v118 objects:v129 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v119;
LABEL_36:
            uint64_t v39 = 0;
            while (1)
            {
              if (*(void *)v119 != v38) {
                objc_enumerationMutation(v36);
              }
              uint64_t v40 = *(void *)(*((void *)&v118 + 1) + 8 * v39);
              long long v41 = +[IMDChatRegistry sharedInstance];
              uint64_t v42 = [v41 existingChatWithGUID:v40];

              if (v42) {
                break;
              }
              if (v37 == (id)++v39)
              {
                id v37 = [v36 countByEnumeratingWithState:&v118 objects:v129 count:16];
                if (v37) {
                  goto LABEL_36;
                }
                goto LABEL_42;
              }
            }
          }
          else
          {
LABEL_42:
            uint64_t v42 = 0;
          }
          v102 = (void *)v42;

          if (IMOSLoggingEnabled())
          {
            long long v43 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v131 = v42;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Could not find chat from last message so defaulted to %@", buf, 0xCu);
            }
          }
        }
        if (IMOSLoggingEnabled())
        {
          long long v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            id v45 = [v99 count];
            *(_DWORD *)long long buf = 134218498;
            uint64_t v131 = (uint64_t)v45;
            __int16 v132 = 2048;
            id v133 = a5;
            __int16 v134 = 2112;
            id v135 = v100;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "daemon unread count : %lu, client unread count :%lu chatGuids %@", buf, 0x20u);
          }
        }
        if ([v99 count] && v102)
        {
          id obja = [v98 timeRead];
          id v46 = objc_msgSend(obja, "__im_nanosecondTimeInterval");
          if (IMOSLoggingEnabled())
          {
            long long v47 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              long long v48 = +[NSNumber numberWithLongLong:v46];
              *(_DWORD *)long long buf = 138412290;
              uint64_t v131 = (uint64_t)v48;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Updating last read message time stamp with last read date: %@", buf, 0xCu);
            }
          }
          [v102 updateLastReadMessageTimeStampIfNeeded:v46];
          uint64_t v93 = [v98 guid];
          if (IMOSLoggingEnabled())
          {
            char v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v131 = v93;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Calling update last seen message guid: %@", buf, 0xCu);
            }
          }
          objc_msgSend(v102, "updateLastSeenMessageGuidIfNeeded:", v93, v93, v95);
          v50 = [v102 lastMessage];
          v51 = [v50 guid];
          id v52 = [v98 guid];
          unsigned int v53 = [v51 isEqualToString:v52];

          if ([v96 count])
          {
            long long v116 = 0u;
            long long v117 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id v54 = v100;
            id v55 = [v54 countByEnumeratingWithState:&v114 objects:v128 count:16];
            if (v55)
            {
              uint64_t v56 = *(void *)v115;
              do
              {
                for (uint64_t i = 0; i != v55; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v115 != v56) {
                    objc_enumerationMutation(v54);
                  }
                  uint64_t v58 = *(void *)(*((void *)&v114 + 1) + 8 * i);
                  uint64_t v59 = +[IMDChatRegistry sharedInstance];
                  v60 = [v59 existingChatWithGUID:v58];

                  int v61 = IMOSLoggingEnabled();
                  if (v53)
                  {
                    if (v61)
                    {
                      v62 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        uint64_t v131 = (uint64_t)v102;
                        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Last messages match. Setting unread count to zero for chat %@", buf, 0xCu);
                      }
                    }
                    v63 = +[IMDChatRegistry sharedInstance];
                    [v63 updateStateForChat:v60 forcePost:1 shouldRebuildFailedMessageDate:0 setUnreadCountToZero:1];
                  }
                  else
                  {
                    if (v61)
                    {
                      v64 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        uint64_t v131 = (uint64_t)v102;
                        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Last messages do not match. Recalculating unread count for chat %@", buf, 0xCu);
                      }
                    }
                    v63 = +[IMDChatRegistry sharedInstance];
                    [v63 updateStateForChat:v60 forcePost:1 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];
                  }
                }
                id v55 = [v54 countByEnumeratingWithState:&v114 objects:v128 count:16];
              }
              while (v55);
            }

            v65 = [v98 accountID];
            v66 = +[IMDAccountController sharedInstance];
            v67 = [v66 sessionForAccount:v65];

            if (IMOSLoggingEnabled())
            {
              v68 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v131 = (uint64_t)v98;
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Sending receipt for last message: %@", buf, 0xCu);
              }
            }
            v69 = [v102 guid];
            v70 = [v102 chatIdentifier];
            objc_msgSend(v67, "sendReadReceiptForMessage:toChatID:identifier:style:", v98, v69, v70, objc_msgSend(v102, "style"));

            v71 = +[IMDBroadcastController sharedProvider];
            v72 = [v71 broadcasterForChatListeners];

            if (IMOSLoggingEnabled())
            {
              v73 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v131 = (uint64_t)v96;
                _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Notifying about messages: %@", buf, 0xCu);
              }
            }
            v74 = (void *)IMCreateSerializedItemsFromArray();
            [v72 account:v65 chat:0 style:0 chatProperties:0 messagesUpdated:v74];
          }
        }
        else
        {
          if ([v99 count] == a5)
          {
LABEL_103:
            long long v108 = 0u;
            long long v109 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            id v83 = v100;
            id v84 = [v83 countByEnumeratingWithState:&v106 objects:v126 count:16];
            if (v84)
            {
              uint64_t v85 = *(void *)v107;
              do
              {
                for (j = 0; j != v84; j = (char *)j + 1)
                {
                  if (*(void *)v107 != v85) {
                    objc_enumerationMutation(v83);
                  }
                  uint64_t v87 = *(void *)(*((void *)&v106 + 1) + 8 * (void)j);
                  v88 = +[IMDChatRegistry sharedInstance];
                  v89 = [v88 existingChatWithGUID:v87];

                  if (a6 != 1) {
                    [v89 tearDownToneNotificationSessionIfNeeded];
                  }
                }
                id v84 = [v83 countByEnumeratingWithState:&v106 objects:v126 count:16];
              }
              while (v84);
            }

            v90 = +[IMLockdownManager sharedInstance];
            unsigned int v91 = [v90 isInternalInstall];

            if (v91)
            {
              v92 = +[NSDate date];
              IMSetDomainValueForKey();
            }
            goto LABEL_115;
          }
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          id obja = v100;
          id v75 = [obja countByEnumeratingWithState:&v110 objects:v127 count:16];
          if (v75)
          {
            uint64_t v76 = *(void *)v111;
            do
            {
              for (k = 0; k != v75; k = (char *)k + 1)
              {
                if (*(void *)v111 != v76) {
                  objc_enumerationMutation(obja);
                }
                v78 = *(void **)(*((void *)&v110 + 1) + 8 * (void)k);
                if (IMOSLoggingEnabled())
                {
                  v79 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    uint64_t v131 = (uint64_t)v78;
                    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Syncing client back into state for chat with guid %@", buf, 0xCu);
                  }
                }
                v80 = +[IMDChatRegistry sharedInstance];
                v81 = [v80 existingChatWithGUID:v78];

                v82 = +[IMDChatRegistry sharedInstance];
                [v82 updateStateForChat:v81 forcePost:1 shouldRebuildFailedMessageDate:0 setUnreadCountToZero:a7];
              }
              id v75 = [obja countByEnumeratingWithState:&v110 objects:v127 count:16];
            }
            while (v75);
          }
        }

        goto LABEL_103;
      }
LABEL_12:

      id v13 = v97;
      if (IMOSLoggingEnabled())
      {
        unsigned int v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v131 = (uint64_t)v15;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Read receipts are not supported for services: %@", buf, 0xCu);
        }

LABEL_115:
        id v13 = v97;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v131 = (uint64_t)v12;
        __int16 v132 = 2112;
        id v133 = v101;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Mismatched IDs and serviceNames array to mark as read (IDs: %@   Service names: %@)", buf, 0x16u);
      }
    }
  }
}

void sub_10001FFE0(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a3;
  id v13 = a4;
  if ([v11 count] && objc_msgSend(v12, "count"))
  {
    if (a2 == 45 && a5)
    {
      id v14 = [objc_alloc((Class)NSSet) initWithArray:v11];
      id v15 = IMBiomeQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100020150;
      block[3] = &unk_100071668;
      id v20 = v14;
      id v16 = v14;
      dispatch_async(v15, block);
    }
    uint64_t v17 = (void *)IMCreateItemsFromSerializedArray();
    uint64_t v18 = [v17 arrayByApplyingSelector:"guid"];
    sub_10001F010(v11, a2, v12, v18, a5, 0, a6);
  }
}

void sub_100020150(uint64_t a1)
{
  id v2 = +[BMStreams readMessageStream];
  id v3 = [v2 source];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [objc_alloc((Class)BMReadMessageEvent) initWithIDSHandle:v8];
        [v3 sendEvent:v9];
        if (IMOSLoggingEnabled())
        {
          id v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v16 = v8;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Donating Read Message Event to Stream for %@", buf, 0xCu);
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

id sub_100021F10(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) isDownloadingQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2];
}

void sub_100022054(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412546;
      CFStringRef v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Chat zone created %@ error %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_100022460(id a1, IMDChat *a2, BOOL *a3)
{
  BOOL v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(IMDChat *)v3 guid];
      int v6 = 138412546;
      int v7 = v5;
      __int16 v8 = 1024;
      unsigned int v9 = [(IMDChat *)v3 cloudKitSyncState];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Marking existing chat %@ as needing sync from state %d", (uint8_t *)&v6, 0x12u);
    }
  }
  [(IMDChat *)v3 resetCKSyncState];
}

void sub_1000226D0(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412546;
      CFStringRef v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Attachment zone created %@ error %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_100022DA8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v8 = 138412546;
      CFStringRef v9 = v6;
      __int16 v10 = 2112;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Write Exit Record with success:%@, error:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  if (v3)
  {
    int v7 = +[IMDCKUtilities sharedInstance];
    [v7 evalToggleiCloudSettingsSwitch];
  }
}

void sub_100022F84(id a1, NSDate *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    CFStringRef v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      int v8 = v4;
      __int16 v9 = 2112;
      __int16 v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetched Exit record date:%@, error:%@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_100023130(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v8 = 138412546;
      CFStringRef v9 = v6;
      __int16 v10 = 2112;
      long long v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleted exit record with success:%@, error:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  if (v3)
  {
    int v7 = +[IMDCKUtilities sharedInstance];
    [v7 evalToggleiCloudSettingsSwitch];
  }
}

void sub_100023300(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v4 = +[IMDBroadcastController sharedProvider];
  BOOL v3 = [v4 broadcasterForAccountListeners];
  [v3 didAttemptToDisableAllDevicesResult:v2];
}

uint64_t sub_100023BC4(uint64_t a1)
{
  BOOL v2 = +[IMDCKUtilities sharedInstance];
  [v2 currentStorageOnDevice];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100023C90(id a1, unint64_t a2, NSString *a3, NSError *a4)
{
  CFStringRef v6 = a4;
  int v7 = a3;
  id v9 = +[IMDBroadcastController sharedProvider];
  int v8 = [v9 broadcasterForAccountListeners];
  [v8 didPerformAdditionalStorageRequiredCheckWithSuccess:v6 == 0 additionalStorageRequired:a2 forAccountId:v7 error:v6];
}

void sub_100024038(id a1, BOOL a2, BOOL a3)
{
  BOOL v3 = a3;
  BOOL v4 = a2;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v7 = @"YES";
      }
      else {
        CFStringRef v7 = @"NO";
      }
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v8 = 138412546;
      CFStringRef v9 = v7;
      __int16 v10 = 2112;
      CFStringRef v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "current cloudkit ramp state featurePromoted(%@) fetchHadServerError(%@)", (uint8_t *)&v8, 0x16u);
    }
  }
}

void sub_1000244FC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10002448CLL);
  }
  _Unwind_Resume(a1);
}

void sub_100024580(id a1, int64_t a2, NSError *a3)
{
  BOOL v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromIMDCKBackupControllerResult();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      CFStringRef v7 = [(NSError *)v4 localizedDescription];
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      long long v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Attempt to disable iCloud backups result: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  int v8 = +[IMDBroadcastController sharedProvider];
  CFStringRef v9 = [v8 broadcasterForAllListeners];
  [v9 didAttemptToDisableiCloudBackups:a2 error:v4];
}

void sub_100025430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = @"NO";
      if (a2) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      if (a3) {
        CFStringRef v7 = @"YES";
      }
      int v12 = 138412546;
      CFStringRef v13 = v8;
      __int16 v14 = 2112;
      CFStringRef v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetched cloudkit ramp state featurePromoted(%@) fetchHadServerError(%@)", (uint8_t *)&v12, 0x16u);
    }
  }
  CFStringRef v9 = [*(id *)(a1 + 32) rampStateDictionaryFromPromoted:a2 featureHadServerError:a3];
  int v10 = +[IMDBroadcastController sharedProvider];
  id v11 = [v10 broadcasterForAllListeners];
  [v11 didFetchRampState:v9];
}

void sub_100028A5C(id a1)
{
  qword_10007D350 = objc_alloc_init(IMDaemonMIGInterface);
}

uint64_t sub_100028C8C(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      BOOL v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "IMDaemonMIGInterface auth port died: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    exit(-1);
  }
  return result;
}

void sub_100028D6C(id a1, OS_xpc_object *a2, OS_xpc_object *a3)
{
  xpc_type_t type = xpc_get_type(a3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a3 != (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      if (a3 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
      {
        if (!IMOSLoggingEnabled()) {
          return;
        }
        CFStringRef v8 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          return;
        }
        LODWORD(v14) = 67109120;
        HIDWORD(v14) = xpc_connection_get_pid(a2);
        CFStringRef v9 = "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED";
      }
      else
      {
        if (a3 != (OS_xpc_object *)&_xpc_error_termination_imminent) {
          return;
        }
        if (!IMOSLoggingEnabled()) {
          return;
        }
        CFStringRef v8 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          return;
        }
        LODWORD(v14) = 67109120;
        HIDWORD(v14) = xpc_connection_get_pid(a2);
        CFStringRef v9 = "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT";
      }
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 8u);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LODWORD(v14) = 67109120;
        HIDWORD(v14) = xpc_connection_get_pid(a2);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "peer(%d) received XPC_ERROR_CONNECTION_INVALID", (uint8_t *)&v14, 8u);
      }
    }
    int v12 = (void *)im_local_object_from_connection();
    CFStringRef v13 = v12;
    if (v12) {
      [v12 _portDidBecomeInvalid];
    }

    xpc_connection_cancel(a2);
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    __int16 v14 = _NSConcreteStackBlock;
    *(void *)&long long v15 = 3221225472;
    if (xpc_dictionary_get_BOOL(a3, "setup-request"))
    {
      *((void *)&v15 + 1) = sub_10002925C;
      uint64_t v16 = &unk_100071CF8;
      uint64_t v17 = a3;
      uint64_t v18 = a2;
    }
    else
    {
      *((void *)&v15 + 1) = sub_1000297EC;
      uint64_t v16 = &unk_100071D20;
      uint64_t v17 = a2;
      uint64_t v18 = a3;
      uint64_t v19 = a3;
    }
    dispatch_block_t v10 = dispatch_block_create((dispatch_block_flags_t)0, &v14);
    sub_100029748((uint64_t)v10);
  }
  else
  {
    id v6 = xpc_copy_description(a3);
    if (IMOSLoggingEnabled())
    {
      CFStringRef v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(v14) = 67109378;
        HIDWORD(v14) = xpc_connection_get_pid(a2);
        LOWORD(v15) = 2080;
        *(void *)((char *)&v15 + 2) = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "received unknown from peer(%d): %s", (uint8_t *)&v14, 0x12u);
      }
    }
    free(v6);
  }
}

id sub_1000291CC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "__setupServer");
}

void sub_10002925C(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    BOOL v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Incoming peer auth grant request", buf, 2u);
    }
  }
  if (_IMWillLog())
  {
    uint64_t v3 = xpc_copy_description(*(xpc_object_t *)(a1 + 32));
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = pid;
        LOWORD(v23) = 2080;
        *(void *)((char *)&v23 + 2) = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", buf, 0x12u);
      }
    }
    free(v3);
  }
  id v6 = [+[IMDaemonMIGInterface sharedInstance] delegate];
  uint64_t v7 = IMGetXPCStringFromDictionary();
  uint64_t v8 = IMGetXPCDictionaryFromDictionary();
  BOOL v9 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "plugin-request");
  *(void *)long long buf = 0;
  *(void *)&long long v23 = buf;
  *((void *)&v23 + 1) = 0x3052000000;
  unint64_t v24 = sub_100029714;
  unint64_t v25 = sub_100029724;
  uint64_t v26 = 0;
  xpc_connection_get_audit_token();
  uint64_t v10 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  if (v6 && *(void *)(a1 + 40))
  {
    id v11 = +[IMDaemonMIGInterface sharedInstance];
    uint64_t v12 = *(void *)(a1 + 40);
    memset(v21, 0, sizeof(v21));
    if (v9) {
      unsigned int v13 = [(IMDaemonMIGInterfaceDelegate *)v6 daemonInterface:v11 shouldGrantPlugInAccessForPID:v10 auditToken:v21 portName:v7 listenerConnection:v12 setupInfo:v8 setupResponse:(void)v23 + 40];
    }
    else {
      unsigned int v13 = [(IMDaemonMIGInterfaceDelegate *)v6 daemonInterface:v11 shouldGrantAccessForPID:v10 auditToken:v21 portName:v7 listenerConnection:v12 setupInfo:v8 setupResponse:(void)v23 + 40];
    }
    int v14 = v13;
  }
  else
  {
    int v14 = 1;
  }
  long long v15 = +[IMRGLog registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"NO";
    *(_DWORD *)id v21 = 138412802;
    *(void *)&v21[4] = v7;
    if (v14) {
      CFStringRef v16 = @"YES";
    }
    *(_WORD *)&v21[12] = 1024;
    *(_DWORD *)&v21[14] = v10;
    *(_WORD *)&v21[18] = 2112;
    *(void *)&v21[20] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Port name request for: %@ from pid: %d granted: %@", v21, 0x1Cu);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      CFStringRef v18 = @"NO";
      *(_DWORD *)id v21 = 138412802;
      *(void *)&v21[4] = v7;
      if (v14) {
        CFStringRef v18 = @"YES";
      }
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = v10;
      *(_WORD *)&v21[18] = 2112;
      *(void *)&v21[20] = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Port name request for: %@ from pid: %d granted: %@", v21, 0x1Cu);
    }
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  id v20 = reply;
  if (reply)
  {
    xpc_dictionary_set_value(reply, "response", *(xpc_object_t *)(v23 + 40));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v20);
    xpc_release(v20);
  }
  im_dispatch_after();
  _Block_object_dispose(buf, 8);
}

void sub_100029690(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x100029364);
  }
  _Unwind_Resume(exception_object);
}

void sub_100029714(uint64_t a1, uint64_t a2)
{
}

void sub_100029724(uint64_t a1)
{
}

void sub_100029730(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1) {
    xpc_release(v1);
  }
}

uint64_t sub_100029748(uint64_t a1)
{
  v4[0] = 0;
  v4[1] = 0;
  pthread_main_thread_np();
  pthread_dependency_init_np();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100029988;
  v3[3] = &unk_100071D48;
  v3[4] = a1;
  v3[5] = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  return pthread_dependency_wait_np();
}

void sub_1000297EC(uint64_t a1)
{
  BOOL v2 = (void *)im_local_object_from_connection();
  objc_msgSend(objc_msgSend(v2, "protocolChecker"), "protocol");
  [v2 allowlistedClasses];
  uint64_t v3 = IMCreateInvocationFromXPCObjectWithProtocol();
  if (v3)
  {
    id v4 = (id)v3;
    [v2 _enqueueInvocationWithSync:v3 xpcMessage:*(void *)(a1 + 48)];
  }
  else
  {
    if (xpc_dictionary_get_dictionary(*(xpc_object_t *)(a1 + 40), "invocation"))
    {
      uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ((unint64_t)[v5 count] < 2
          ? (id v6 = 0)
          : (id v6 = [v5 objectAtIndexedSubscript:1]),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v4 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10004CD40((uint64_t)v4, v7);
    }
    +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, +[NSString stringWithFormat:@"Could not create NSInvocation matching XPC request object. Selector \"%@\" not found in XPC interface.", v4], 0);
    IMLogSimulateCrashForException();
  }
}

uint64_t sub_100029988(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(a1 + 40);

  return _pthread_dependency_fulfill_np(v2, 0);
}

void sub_100029D00(id a1)
{
  qword_10007D368 = objc_alloc_init(IMDaemonCloudKitManager);

  _objc_release_x1();
}

void sub_10002A074(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        CFStringRef v9 = @"YES";
        if (!v2) {
          CFStringRef v9 = @"NO";
        }
        int v15 = 138412290;
        CFStringRef v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got called to sync during backup with non null activity %@", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t v10 = +[IMDCKUtilities sharedInstance];
    unsigned __int8 v11 = [v10 cloudKitSyncingEnabled];

    if (v11)
    {
      if (!xpc_activity_set_state(v2, 4) && IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "We did not set the state of xpc_activity from core duet to continue successfully syncing during backup", (uint8_t *)&v15, 2u);
        }
      }
      unsigned int v13 = +[IMDCKSyncController sharedInstance];
      [v13 beginPeriodicSyncWithActivity:v2];
    }
    else if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Ignoring activity request to sync during backup, as syncing is disabled", (uint8_t *)&v15, 2u);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_USER_REQUESTED_BACKUP_TASK, 1);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
    xpc_object_t v5 = xpc_activity_copy_criteria(v2);
    id v6 = v5;
    if (!v5 || !xpc_equal(v5, v4)) {
      xpc_activity_set_criteria(v2, v4);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Got called to sync during backup in check in state", (uint8_t *)&v15, 2u);
      }
    }
  }
}

void sub_10002A530(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"YES";
        if (!v3) {
          CFStringRef v10 = @"NO";
        }
        int v17 = 138412290;
        CFStringRef v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got called to sync chats in check in run state with non null activity %@", (uint8_t *)&v17, 0xCu);
      }
    }
    unsigned __int8 v11 = +[IMDCKUtilities sharedInstance];
    unsigned __int8 v12 = [v11 cloudKitSyncingEnabled];

    if (v12)
    {
      unsigned int v13 = +[IMLogDump sharedInstance];
      [v13 dumpMOCLoggingMetaData];

      if (!xpc_activity_set_state(v3, 4) && IMOSLoggingEnabled())
      {
        int v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "We did not set the state of xpc_activity from core duet to continue successfully for chat sync", (uint8_t *)&v17, 2u);
        }
      }
      int v15 = +[IMDCKSyncController sharedInstance];
      [v15 beginChatSyncPeriodic:1 activity:v3];
    }
    else if (IMOSLoggingEnabled())
    {
      CFStringRef v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Ignoring activity request to sync chats, as syncing is disabled", (uint8_t *)&v17, 2u);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 32));
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    uint64_t v7 = v6;
    if (!v6 || !xpc_equal(v6, v5)) {
      xpc_activity_set_criteria(v3, v5);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got called to sync chats in check in state", (uint8_t *)&v17, 2u);
      }
    }
  }
}

void sub_10002ABF4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"YES";
        if (!v3) {
          CFStringRef v10 = @"NO";
        }
        int v19 = 138412290;
        CFStringRef v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got called to sync message in run state with non null activity %@", (uint8_t *)&v19, 0xCu);
      }
    }
    unsigned __int8 v11 = +[IMDCKUtilities sharedInstance];
    unsigned __int8 v12 = [v11 cloudKitSyncingEnabled];

    if (v12)
    {
      unsigned int v13 = +[NSDate date];
      IMSetDomainValueForKey();

      int v14 = +[IMMetricsCollector sharedInstance];
      [v14 trackEvent:IMMetricsCollectorEventCKCalledByCoreduetForPeriodicSync];

      int v15 = +[IMLogDump sharedInstance];
      [v15 dumpMOCLoggingMetaData];

      if (!xpc_activity_set_state(v3, 4) && IMOSLoggingEnabled())
      {
        CFStringRef v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "We did not set the state of xpc_activity from core duet to continue successfully for message syncing", (uint8_t *)&v19, 2u);
        }
      }
      int v17 = +[IMDCKSyncController sharedInstance];
      [v17 beginPeriodicSyncWithActivity:v3];
    }
    else if (IMOSLoggingEnabled())
    {
      CFStringRef v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Ignoring activity request to sync messages, as syncing is disabled", (uint8_t *)&v19, 2u);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 40));
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_DELAY, (int64_t)[*(id *)(a1 + 32) _messageSyncingDelayBagValue]);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_GRACE_PERIOD, 43200);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    uint64_t v7 = v6;
    if (!v6 || !xpc_equal(v6, v5)) {
      xpc_activity_set_criteria(v3, v5);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got called to sync message in check in state", (uint8_t *)&v19, 2u);
      }
    }
  }
}

void sub_10002B2D4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"YES";
        if (!v3) {
          CFStringRef v10 = @"NO";
        }
        int v12 = 138412290;
        CFStringRef v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got called to update attachment file sizes with non null activity %@", (uint8_t *)&v12, 0xCu);
      }
    }
    if (!xpc_activity_set_state(v3, 4) && IMOSLoggingEnabled())
    {
      unsigned __int8 v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "We did not set the state of xpc_activity from core duet to continue successfully for attachment file size updating", (uint8_t *)&v12, 2u);
      }
    }
    xpc_object_t v5 = +[IMDCKCacheDeleteManager sharedInstance];
    [v5 updateAttachmentFileSizesWithActivity:v3];
    goto LABEL_23;
  }
  if (!state)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 32));
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    uint64_t v7 = v6;
    if (!v6 || !xpc_equal(v6, v5)) {
      xpc_activity_set_criteria(v3, v5);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got called to update attachment file sizes in check in state", (uint8_t *)&v12, 2u);
      }
    }
LABEL_23:
  }
}

void sub_10002B70C(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"YES";
        if (!v3) {
          CFStringRef v10 = @"NO";
        }
        int v14 = 138412290;
        CFStringRef v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got called to log CK metrics in run state with non null activity %@", (uint8_t *)&v14, 0xCu);
      }
    }
    [*(id *)(a1 + 32) uploadDailyAnalyticstoCloudKit];
    BOOL v11 = xpc_activity_set_state(v3, 5);
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        CFStringRef v13 = +[NSNumber numberWithBool:v11];
        int v14 = 138412290;
        CFStringRef v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Set log CK metrics activity %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 40));
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    uint64_t v7 = v6;
    if (!v6 || !xpc_equal(v6, v5)) {
      xpc_activity_set_criteria(v3, v5);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got called to log CK metrics in state", (uint8_t *)&v14, 2u);
      }
    }
  }
}

void sub_10002BB00(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        CFStringRef v9 = @"YES";
        if (!v2) {
          CFStringRef v9 = @"NO";
        }
        int v15 = 138412290;
        CFStringRef v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got called to do log dump in run state with non null activity %@", (uint8_t *)&v15, 0xCu);
      }
    }
    CFStringRef v10 = +[IMDCKSyncController sharedInstance];
    [v10 collectLogsIfNeeded];

    BOOL v11 = +[IMDCKSyncController sharedInstance];
    [v11 sendRestoreFailuresLogDumpsIfNeeded];

    BOOL v12 = xpc_activity_set_state(v2, 5);
    if (IMOSLoggingEnabled())
    {
      CFStringRef v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = +[NSNumber numberWithBool:v12];
        int v15 = 138412290;
        CFStringRef v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Set log dump activity %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 0);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
    xpc_object_t v5 = xpc_activity_copy_criteria(v2);
    xpc_object_t v6 = v5;
    if (!v5 || !xpc_equal(v5, v4)) {
      xpc_activity_set_criteria(v2, v4);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Got called to do log dump check in state", (uint8_t *)&v15, 2u);
      }
    }
  }
}

void sub_10002CE70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) historyQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:v5 limit:*(void *)(a1 + 72)];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 64);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "   Results of query %@ broadcast to %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void sub_10002D4D4(uint64_t a1, void *a2, void *a3, char a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      id v14 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Paged history serializedMessages count: %lu", buf, 0xCu);
    }
  }
  BYTE1(v12) = a5;
  LOBYTE(v12) = a4;
  objc_msgSend(*(id *)(a1 + 32), "pagedHistoryQuery:chatID:services:numberOfMessagesBefore:numberOfMessagesAfter:finishedWithResult:hasMessagesBefore:hasMessagesAfter:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), v9, v12);
}

id sub_10002DD9C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) attachmentQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2];
}

void sub_10002ECF4(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) length] && !*(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    xpc_object_t v4 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    id v8 = +[NSNumber numberWithUnsignedInteger:a2];
    [v4 markAsSpamQuery:v5 chatID:v7 services:v6 finishedWithResult:v8];
  }
}

id sub_10002F294(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) frequentRepliesQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2 limit:*(void *)(a1 + 64)];
}

void sub_10002F5E8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10002F550);
  }
  _Unwind_Resume(a1);
}

id sub_10002F7B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) historyQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2 limit:*(void *)(a1 + 64)];
}

id sub_10002FD58(id a1, IMItem *a2)
{
  return [(IMItem *)a2 guid];
}

BOOL sub_10002FD60(id a1, IMItem *a2)
{
  uint64_t v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(IMItem *)v2 isSticker]) {
      unsigned __int8 v3 = 1;
    }
    else {
      unsigned __int8 v3 = [(IMItem *)v2 isMessageAcknowledgment];
    }
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

void sub_10003020C(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id v6 = +[NSNumber numberWithUnsignedInteger:a2];
  [v2 uncachedAttachmentCountQuery:v3 chatID:v4 services:v5 finishedWithResult:v6];
}

void sub_100030C8C(uint64_t a1, void *a2)
{
  id v34 = a2;
  uint64_t v2 = +[IMDChatRegistry sharedInstance];
  id v35 = [v2 existingChatWithGUID:v34];

  if (v35)
  {
    if (+[IMGenerativeModelsAvailabilityProvider messageSummarizationEnabled])
    {
      uint64_t v47 = IMChatPropertyChatSummaryDictionary;
      uint64_t v3 = +[NSNull null];
      long long v48 = v3;
      uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      [v35 updateProperties:v4];
    }
    uint64_t v5 = +[IMDChatVocabularyUpdater sharedInstance];
    [v5 updateVocabularyForDeletedChat:v35 completionHandler:0];

    [*(id *)(v33 + 32) _updateLastMessageTimeStampForChat:v35];
    if ([v35 isBusinessChat]) {
      BOOL v6 = [v35 style] == 45;
    }
    else {
      BOOL v6 = 1;
    }
    id v36 = +[NSMutableSet set];
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = [v35 participants];
    id v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v38;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v12);
          if (v6)
          {
            id v14 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v12) ID];
            [v36 addObject:v14];
          }
          int v15 = +[IMDChatRegistry sharedInstance];
          unsigned int v16 = [v15 removeIMDHandleFromRegistry:v13];

          if (v16)
          {
            int v17 = [v13 ID];
            [v8 addObject:v17];
          }
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v10);
    }

    CFStringRef v18 = +[IMDNicknameController sharedInstance];
    [v18 cleanUpNicknameForIDs:v8];

    if ([v36 count])
    {
      int v19 = +[IMSafetyMonitorCoordinator sharedCoordinator];
      CFStringRef v20 = [v36 allObjects];
      [v19 informOfDeletedConversationWithReceiverHandles:v20];
    }
    id v21 = [v35 serviceName];
    unsigned int v22 = [v21 isEqualToString:IMServiceNameSMS];
    uint64_t v23 = 48;
    if (v22) {
      uint64_t v23 = 40;
    }
    id v24 = *(id *)(v33 + v23);

    v45[0] = v34;
    v44[0] = IMDCommandChatGUIDKey;
    v44[1] = IMDCommandChatGroupIDKey;
    unint64_t v25 = [v35 groupID];
    v45[1] = v25;
    v44[2] = IMDCommandChatParticipantsKey;
    uint64_t v26 = [v35 participantHandles];
    v45[2] = v26;
    v44[3] = IMDChatWasReportedAsJunkKey;
    unint64_t v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v35 wasReportedAsJunk]);
    v45[3] = v27;
    v44[4] = IMDDeleteCommandDeleteIncomingMessagesKey;
    uint64_t v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v35 isDeletingIncomingMessages]);
    v45[4] = v28;
    uint64_t v29 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];

    long long v41 = v29;
    v42[0] = IMDRecoverableDeleteCommandChatMetadataArrayKey;
    v30 = +[NSArray arrayWithObjects:&v41 count:1];
    v43[0] = v30;
    v43[1] = &__kCFBooleanFalse;
    v42[1] = IMDDeleteCommandIsPermanentDeleteKey;
    v42[2] = IMDDeleteCommandRecoverableDeleteDateKey;
    v43[2] = *(void *)(v33 + 56);
    v31 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];

    [v24 sendDeleteCommand:v31 forChatGUID:v34];
    [v24 willMoveChatToRecentlyDeleted:v35];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v50 = v34;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Recently Deleted | IMDaemon_Chat skipping: chat not found for guid: %@", buf, 0xCu);
    }
  }
}

void sub_1000314CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[IMDChatRegistry sharedInstance];
  uint64_t v5 = [v4 existingChatWithGUID:v3];

  [*(id *)(a1 + 32) _updateLastMessageTimeStampForChat:v5];
  if (v5)
  {
    BOOL v6 = [v5 serviceName];
    unsigned int v7 = [v6 isEqualToString:IMServiceNameSMS];

    if (v7) {
      IMGreenTeaMessageDeleteLog();
    }
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removing chat from registry: %@", buf, 0xCu);
      }
    }
    id v9 = [v5 serviceName];
    unsigned int v10 = [v9 isEqualToString:IMServiceNameSMS];
    uint64_t v11 = 48;
    if (v10) {
      uint64_t v11 = 40;
    }
    id v12 = *(id *)(a1 + v11);

    v23[0] = v3;
    v22[0] = IMDCommandChatGUIDKey;
    v22[1] = IMDCommandChatGroupIDKey;
    uint64_t v13 = [v5 groupID];
    v23[1] = v13;
    v22[2] = IMDCommandChatParticipantsKey;
    id v14 = [v5 participantHandles];
    v23[2] = v14;
    int v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    int v19 = v15;
    uint64_t v20 = IMDRecoverCommandChatMetadataArrayKey;
    unsigned int v16 = +[NSArray arrayWithObjects:&v19 count:1];
    id v21 = v16;
    int v17 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    [v12 sendRecoverCommand:v17 forChatGUID:v3];
  }
  else if (IMOSLoggingEnabled())
  {
    CFStringRef v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Recently Deleted | IMDaemon_Chat skipping: chat not found for guid: %@", buf, 0xCu);
    }
  }
}

void sub_100031950(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = +[IMDChatRegistry sharedInstance];
  BOOL v6 = [v5 existingChatWithGUID:v4];

  if (v6)
  {
    unsigned int v7 = [v6 serviceName];
    unsigned int v8 = [v7 isEqualToString:IMServiceNameSMS];

    if (v8) {
      IMGreenTeaMessageDeleteLog();
    }
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v29 = (NSString *)v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sending live sync delete command for chat: %@", buf, 0xCu);
      }
    }
    unsigned int v10 = [v6 serviceName];
    unsigned int v11 = [v10 isEqualToString:IMServiceNameSMS];
    id v12 = (id *)&IMServiceNameiMessage;
    if (v11) {
      id v12 = (id *)&IMServiceNameSMS;
    }
    id v13 = *v12;

    id v14 = +[IMDAccountController sharedInstance];
    int v15 = [v14 anySessionForServiceName:v13];

    v27[0] = v4;
    v26[0] = IMDCommandChatGUIDKey;
    v26[1] = IMDCommandChatGroupIDKey;
    unsigned int v16 = [v6 groupID];
    v27[1] = v16;
    v26[2] = IMDCommandChatParticipantsKey;
    int v17 = [v6 participantHandles];
    v27[2] = v17;
    v26[3] = IMDChatWasReportedAsJunkKey;
    CFStringRef v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 wasReportedAsJunk]);
    v27[3] = v18;
    int v19 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

    uint64_t v23 = v19;
    v24[0] = IMDPermanentDeleteCommandChatMetadataArrayKey;
    uint64_t v20 = +[NSArray arrayWithObjects:&v23 count:1];
    v24[1] = IMDDeleteCommandIsPermanentDeleteKey;
    v25[0] = v20;
    v25[1] = &__kCFBooleanTrue;
    id v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

    [v15 sendDeleteCommand:v21 forChatGUID:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    unsigned int v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Recently Deleted | IMDaemon_Chat skipping: chat not found for guid: %@", buf, 0xCu);
    }
  }
}

void sub_100031CD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[IMDClientRequestContext currentContext];
  uint64_t v5 = [v4 replyProxy];

  [v5 permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:v3 queryID:*(void *)(a1 + 32)];
  BOOL v6 = +[IMDBroadcastController sharedProvider];
  unsigned int v7 = [v6 broadcasterForChatListeners];

  [v7 permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:v3];
  if (IMOSLoggingEnabled())
  {
    unsigned int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Finished permanently deleting messages in recently deleted for the given chats.", v9, 2u);
    }
  }
}

uint64_t sub_100032130()
{
  uint64_t v1 = sub_10004D150();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  v0[5] = sub_10004CF00();
  v0[6] = sub_10004CEF0();
  sub_10004D2B0();
  uint64_t v3 = sub_10004D280();
  v0[7] = v3;
  v0[8] = v2;
  return _swift_task_switch(sub_100032224, v3, v2);
}

uint64_t sub_100032224()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = sub_100008690();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_10004D130();
  os_log_type_t v6 = sub_10004D310();
  if (os_log_type_enabled(v5, v6))
  {
    unsigned int v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Loading accounts", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v10 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  id v11 = [self sharedInstance];
  if (!v11)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v12 = v11;
  [v11 load];

  id v13 = [self standardControls];
  if (!v13)
  {
LABEL_9:
    __break(1u);
    return withCheckedContinuation<A>(isolation:function:_:)();
  }
  id v14 = v13;
  [v13 updateAccountActivation];

  v0[9] = sub_10004CEF0();
  int v15 = (void *)swift_task_alloc();
  v0[10] = v15;
  *int v15 = v0;
  v15[1] = sub_100032448;
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_100032448()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_10003258C, v3, v2);
}

uint64_t sub_10003258C()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1000325F8(uint64_t a1)
{
  uint64_t v2 = sub_100032DB4(&qword_10007C1A0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v5 = [self sharedInstance];
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7 + v6, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_100032E8C;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100032B30;
  aBlock[3] = &unk_1000721A0;
  uint64_t v8 = _Block_copy(aBlock);
  swift_release();
  [v5 loadChatsWithCompletionBlock:v8];
  _Block_release(v8);
}

void sub_1000327C4(uint64_t a1)
{
  v25[1] = a1;
  uint64_t v1 = sub_10004D150();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v25 - v6;
  uint64_t v8 = sub_100008690();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v9(v7, v8, v1);
  uint64_t v10 = sub_10004D130();
  os_log_type_t v11 = sub_10004D310();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Loading transfers", v12, 2u);
    swift_slowDealloc();
  }

  id v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13(v7, v1);

  v9(v5, v8, v1);
  id v14 = sub_10004D130();
  os_log_type_t v15 = sub_10004D310();
  if (os_log_type_enabled(v14, v15))
  {
    unsigned int v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Kicking off auto reconnect", v16, 2u);
    swift_slowDealloc();
  }

  v13(v5, v1);
  id v17 = [self sharedInstance];
  if (!v17)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  CFStringRef v18 = v17;
  id v19 = [v17 activeSessions];

  if (v19)
  {
    sub_100032EF0();
    unint64_t v20 = sub_10004D250();

    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_10004D430();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v21)
      {
LABEL_9:
        if (v21 >= 1)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if ((v20 & 0xC000000000000001) != 0) {
              id v23 = (id)sub_10004D3B0();
            }
            else {
              id v23 = *(id *)(v20 + 8 * i + 32);
            }
            id v24 = v23;
            [v23 autoReconnect];
          }
          goto LABEL_16;
        }
        __break(1u);
        goto LABEL_18;
      }
    }
LABEL_16:
    swift_bridgeObjectRelease();
    sub_100032DB4(&qword_10007C1A0);
    sub_10004D290();
    return;
  }
LABEL_19:
  __break(1u);
}

uint64_t sub_100032B30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_100032B84()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100032B94()
{
  return swift_allocObject();
}

uint64_t sub_100032BA4()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(**(void **)v0 + 80) + **(int **)(**(void **)v0 + 80));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100032C9C;
  return v4();
}

uint64_t sub_100032C9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for AccountLoader()
{
  return self;
}

uint64_t sub_100032DB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100032DF8()
{
  uint64_t v1 = sub_100032DB4(&qword_10007C1A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100032E8C()
{
  uint64_t v1 = *(void *)(sub_100032DB4(&qword_10007C1A0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_1000327C4(v2);
}

unint64_t sub_100032EF0()
{
  unint64_t result = qword_10007CBA0;
  if (!qword_10007CBA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007CBA0);
  }
  return result;
}

uint64_t sub_100032F30(uint64_t a1)
{
  return sub_100033090(a1, qword_10007D268);
}

uint64_t sub_100032F4C(uint64_t a1)
{
  return sub_100033090(a1, qword_10007D280);
}

uint64_t sub_100032F70()
{
  return sub_10000863C(&qword_10007D378, (uint64_t)qword_10007D280);
}

uint64_t sub_100032F94(uint64_t a1)
{
  return sub_100033090(a1, qword_10007D298);
}

uint64_t sub_100032FB8()
{
  return sub_10000863C(&qword_10007D380, (uint64_t)qword_10007D298);
}

uint64_t sub_100032FDC(uint64_t a1)
{
  return sub_100033090(a1, qword_10007D2B0);
}

uint64_t sub_100033000()
{
  return sub_10000863C(&qword_10007D388, (uint64_t)qword_10007D2B0);
}

uint64_t sub_100033024(uint64_t a1)
{
  return sub_100033090(a1, qword_10007D2C8);
}

uint64_t sub_100033048()
{
  return sub_10000863C(&qword_10007D390, (uint64_t)qword_10007D2C8);
}

uint64_t sub_10003306C(uint64_t a1)
{
  return sub_100033090(a1, qword_10007D2E0);
}

uint64_t sub_100033090(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10004D150();
  sub_10003311C(v3, a2);
  sub_1000083B0(v3, (uint64_t)a2);
  sub_10004D120();
  return sub_10004D140();
}

uint64_t sub_1000330F8()
{
  return sub_10000863C(qword_10007D398, (uint64_t)qword_10007D2E0);
}

uint64_t *sub_10003311C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000331D4()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_10003326C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1000332B4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_100033348()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_1000333C0(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_100033400())()
{
  return j_j__swift_endAccess;
}

void *sub_100033498()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void sub_100033534(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*sub_10003357C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1000335D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100033634()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 240);
  id v2 = v1;
  return v1;
}

void sub_100033678(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 240);
  *(void *)(v1 + 240) = a1;
}

uint64_t (*sub_1000336C0())()
{
  return j__swift_endAccess;
}

uint64_t sub_100033718@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_100033764(v1 + 248, a1);
}

uint64_t sub_100033764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032DB4(&qword_10007C1A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000337CC(uint64_t a1)
{
  swift_beginAccess();
  sub_100033820(a1, v1 + 248);
  return swift_endAccess();
}

uint64_t sub_100033820(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032DB4(&qword_10007C1A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_100033888())()
{
  return j_j__swift_endAccess;
}

void *sub_1000338DC()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 288);
  id v2 = v1;
  return v1;
}

void sub_100033920(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 288);
  *(void *)(v1 + 288) = a1;
}

uint64_t (*sub_100033968())()
{
  return j_j__swift_endAccess;
}

id sub_1000339BC()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 296);

  return v1;
}

void sub_100033A00(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 296);
  *(void *)(v1 + 296) = a1;
}

uint64_t (*sub_100033A48())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_100033A9C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  sub_100033B1C(a1, a2, a3, a4, a5, a6);
  return v12;
}

id sub_100033B1C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v52 = a6;
  uint64_t v13 = sub_10004D150();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v51 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  CFStringRef v18 = (char *)&v46 - v17;
  *(_OWORD *)(v7 + 240) = 0u;
  id v19 = (void **)(v7 + 240);
  *(unsigned char *)(v7 + 24) = 0;
  *(void *)(v7 + 32) = 0;
  *(_OWORD *)(v7 + 256) = 0u;
  *(_OWORD *)(v7 + 272) = 0u;
  *(void *)(v7 + 288) = 0;
  *(void *)(v7 + 296) = [self sharedListener];
  uint64_t v20 = sub_100008690();
  uint64_t v53 = v14;
  uint64_t v54 = v13;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v49 = v20;
  uint64_t v50 = v14 + 16;
  long long v48 = v21;
  ((void (*)(char *))v21)(v18);
  unsigned int v22 = sub_10004D130();
  os_log_type_t v23 = sub_10004D310();
  if (os_log_type_enabled(v22, v23))
  {
    id v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = a1;
    *(_WORD *)id v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "imagent launching", v24, 2u);
    a1 = v47;
    swift_slowDealloc();
  }

  uint64_t v25 = v53 + 8;
  uint64_t v47 = *(void **)(v53 + 8);
  ((void (*)(char *, uint64_t))v47)(v18, v54);
  sub_1000335D0((uint64_t)a1, v7 + 40);
  sub_1000335D0(a2, v7 + 80);
  sub_1000335D0(a3, v7 + 120);
  sub_1000335D0(a4, v7 + 160);
  sub_1000335D0(a5, v7 + 200);
  id result = [self standardControls];
  if (result)
  {
    uint64_t v53 = v25;
    uint64_t v46 = a2;
    *(void *)(v7 + 16) = result;
    id v27 = [self sharedFeatureFlags];
    unsigned int v28 = [v27 isRockNRollEnabled];

    if (v28)
    {
      swift_beginAccess();
      sub_100035674(v52, v7 + 248);
      swift_endAccess();
      id v29 = [self mainBundle];
      id v30 = [v29 bundleIdentifier];

      if (v30)
      {
        sub_10004D210();
      }
      id v31 = objc_allocWithZone((Class)LNDaemonConnectionListener);
      NSString v32 = sub_10004D200();
      swift_bridgeObjectRelease();
      id v33 = [v31 initWithBundleIdentifier:v32];

      swift_beginAccess();
      id v34 = *v19;
      *id v19 = v33;
    }
    [self setSharedDaemon:v7];
    uint64_t v35 = a1[3];
    uint64_t v36 = a1[4];
    sub_10003408C(a1, v35);
    long long v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32);
    uint64_t v38 = swift_retain();
    v37(v38, v35, v36);
    swift_release();
    uint64_t v39 = a1[3];
    uint64_t v40 = a1[4];
    sub_10003408C(a1, v39);
    (*(void (**)(uint64_t, uint64_t))(v40 + 24))(v39, v40);
    long long v41 = v51;
    v48(v51, v49, v54);
    uint64_t v42 = sub_10004D130();
    os_log_type_t v43 = sub_10004D310();
    if (os_log_type_enabled(v42, v43))
    {
      long long v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "imagent daemon init complete", v44, 2u);
      swift_slowDealloc();
    }

    uint64_t v45 = ((uint64_t (*)(char *, uint64_t))v47)(v41, v54);
    (*(void (**)(uint64_t))(*(void *)v7 + 360))(v45);
    sub_100035800(v52, &qword_10007C1A8);
    sub_100007168(a5);
    sub_100007168(a4);
    sub_100007168(a3);
    sub_100007168(v46);
    sub_100007168((uint64_t)a1);
    return (id)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_10003408C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id *sub_1000340D0()
{
  id result = (id *)[self sharedInstance];
  if (result)
  {
    id v2 = result;
    [result removeListener:v0];

    swift_unknownObjectRelease();
    sub_100007168((uint64_t)(v0 + 5));
    sub_100007168((uint64_t)(v0 + 10));
    sub_100007168((uint64_t)(v0 + 15));
    sub_100007168((uint64_t)(v0 + 20));
    sub_100007168((uint64_t)(v0 + 25));

    sub_100035800((uint64_t)(v0 + 31), &qword_10007C1A8);
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100034190()
{
  sub_1000340D0();

  return _swift_deallocClassInstance(v0, 304, 7);
}

uint64_t sub_1000341C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004D150();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)aBlock - v8;
  if ((*(uint64_t (**)(uint64_t))(*v0 + 200))(v7))
  {
    uint64_t v10 = sub_100008690();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
    os_log_type_t v11 = sub_10004D130();
    os_log_type_t v12 = sub_10004D2F0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Attempting to load daemon after setup is complete", v13, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    uint64_t v14 = v0[8];
    uint64_t v15 = v0[9];
    sub_10003408C(v0 + 5, v14);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15)) {
      return 1;
    }
    uint64_t v17 = sub_100008690();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v17, v2);
    CFStringRef v18 = sub_10004D130();
    os_log_type_t v19 = sub_10004D2E0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Device is not yet ready, reattempting load in 15 seconds", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    aBlock[4] = sub_1000356DC;
    aBlock[5] = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000344EC;
    aBlock[3] = &unk_1000721C8;
    uint64_t v21 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    im_dispatch_after();
    _Block_release(v21);
  }
  return 0;
}

uint64_t sub_1000344EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100034530()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100032DB4(&qword_10007CA60);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10004D150();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 352))(v7);
  if (result)
  {
    uint64_t v11 = sub_100008690();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v11, v5);
    os_log_type_t v12 = sub_10004D130();
    os_log_type_t v13 = sub_10004D310();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Load conditions met, bringing up services", v14, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t v15 = sub_10004D2D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
    sub_10004CF00();
    swift_retain();
    uint64_t v16 = sub_10004CEF0();
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = v16;
    v17[3] = &protocol witness table for MainActor;
    v17[4] = v1;
    sub_100035168((uint64_t)v4, (uint64_t)&unk_10007C1B8, (uint64_t)v17);
    return swift_release();
  }
  return result;
}

uint64_t sub_1000347B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[2] = a4;
  sub_10004CF00();
  v4[3] = sub_10004CEF0();
  sub_10004D2B0();
  uint64_t v6 = sub_10004D280();
  v4[4] = v6;
  v4[5] = v5;
  return _swift_task_switch(sub_100034850, v6, v5);
}

uint64_t sub_100034850()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[13];
  uint64_t v3 = v1[14];
  sub_10003408C(v1 + 10, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100034954;
  return v6(v2, v3);
}

uint64_t sub_100034954()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return _swift_task_switch(sub_100034A74, v3, v2);
}

uint64_t sub_100034A74()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[18];
  uint64_t v3 = v1[19];
  sub_10003408C(v1 + 15, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100034B78;
  return v6(v2, v3);
}

uint64_t sub_100034B78()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return _swift_task_switch(sub_100034C98, v3, v2);
}

uint64_t sub_100034C98()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[23];
  uint64_t v3 = v1[24];
  sub_10003408C(v1 + 20, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100034D9C;
  return v6(v2, v3);
}

uint64_t sub_100034D9C(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 32);
  return _swift_task_switch(sub_100034EC4, v4, v3);
}

uint64_t sub_100034EC4()
{
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = *(void (**)(void *))(*v2 + 304);
  id v4 = v1;
  v3(v1);
  uint64_t v5 = v2[28];
  uint64_t v6 = v2[29];
  sub_10003408C(v2 + 25, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[10] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100034FB4;
  return dispatch thunk of ClientConnectionManaging.startAcceptingIncomingConnections()(v5, v6);
}

uint64_t sub_100034FB4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return _swift_task_switch(sub_1000350D4, v3, v2);
}

uint64_t sub_1000350D4()
{
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = v0[2];
  uint64_t v3 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v2 + 368))(v3);

  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100035168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004D2D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10004D2C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100035800(a1, &qword_10007CA60);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10004D280();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100035314()
{
  uint64_t v1 = sub_10004D150();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(*v0 + 208))(1);
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[9];
  sub_10003408C(v0 + 5, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v5, v6);
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[9];
  sub_10003408C(v0 + 5, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 48))(v7, v8);
  uint64_t v10 = v0[8];
  uint64_t v9 = v0[9];
  sub_10003408C(v0 + 5, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 56))(v10, v9);
  uint64_t v11 = sub_100008690();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v11, v1);
  os_log_type_t v12 = sub_10004D130();
  os_log_type_t v13 = sub_10004D310();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Setup complete", v14, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_100035674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032DB4(&qword_10007C1A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000356DC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t sub_100035708()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100035748()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100032C9C;
  return sub_1000347B8((uint64_t)v3, v4, v5, v2);
}

uint64_t type metadata accessor for MessagesDaemon()
{
  return self;
}

uint64_t sub_100035800(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100032DB4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003585C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100035938;
  return v6(a1);
}

uint64_t sub_100035938()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100035A30()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100035A68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100032C9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10007C438 + dword_10007C438);
  return v6(a1, v4);
}

id sub_100035BEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChatInsertMessageRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100035C30()
{
  return swift_bridgeObjectRetain();
}

void sub_100035C44(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100035C4C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100035C60@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100035C74@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100035C88(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100035CB8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100035CE4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100035D08(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100035D1C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100035D30(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100035D44@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100035D58(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100035D6C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100035D80(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100035D94()
{
  return *v0 == 0;
}

uint64_t sub_100035DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100035DBC(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_100035DD0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100035DE4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100036958(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_100035E24@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_100035E30@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100035E40(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100035E4C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100035EE4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000360C4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000360C4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100035EE4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10003605C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10004D3A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10004D420();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10004D230();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10004D470();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10004D420();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10003605C(uint64_t a1, uint64_t a2)
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
  sub_100032DB4(&qword_10007C508);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000360C4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100032DB4(&qword_10007C508);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  os_log_type_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_10004D470();
  __break(1u);
  return result;
}

void sub_100036214(void *a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5, unint64_t a6)
{
  LODWORD(v59) = a4;
  uint64_t v11 = sub_10004D150();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v56 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v56 - v20;
  __chkstk_darwin(v19);
  if (!a1)
  {
    uint64_t v34 = sub_100033000();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v34, v11);
    uint64_t v35 = sub_10004D130();
    os_log_type_t v36 = sub_10004D2F0();
    if (os_log_type_enabled(v35, v36))
    {
      long long v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "No messageItem to receive.", v37, 2u);
      swift_slowDealloc();
    }

    uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v39 = v15;
LABEL_17:
    uint64_t v40 = v11;
LABEL_24:
    v38(v39, v40);
    return;
  }
  uint64_t v23 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x2000000000000000) == 0) {
    uint64_t v23 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v23)
  {
    id v47 = a1;
    uint64_t v48 = sub_100033000();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, v48, v11);
    uint64_t v49 = sub_10004D130();
    os_log_type_t v50 = sub_10004D2F0();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "No serviceName to receive a message from.", v51, 2u);
      swift_slowDealloc();
    }

    uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v39 = v18;
    uint64_t v40 = v11;
    goto LABEL_24;
  }
  if (a3)
  {
    uint64_t v24 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v24 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v24)
    {
      uint64_t v25 = (char *)&v56 - v22;
      uint64_t v26 = self;
      id v58 = a1;
      id v27 = [v26 sharedInstance];
      if (!v27)
      {
        __break(1u);
        return;
      }
      unsigned int v28 = v27;
      NSString v29 = sub_10004D200();
      id v30 = [v28 anySessionForServiceName:v29];

      if (v30)
      {
        NSString v31 = sub_10004D200();
        NSString v57 = sub_10004D200();
        id v32 = v58;
        [v30 didReceiveMessage:v58 forChat:v31 style:v59 fromIDSID:v57];

        id v33 = v57;

        return;
      }
      uint64_t v59 = a5;
      uint64_t v52 = sub_100033000();
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v25, v52, v11);
      swift_bridgeObjectRetain_n();
      uint64_t v53 = sub_10004D130();
      os_log_type_t v54 = sub_10004D2F0();
      if (os_log_type_enabled(v53, v54))
      {
        id v55 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        *(_DWORD *)id v55 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v60 = sub_100007094(v59, a6, &v61);
        sub_10004D340();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "No session for serviceName: %s -- can't insert a received message.", v55, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
      uint64_t v39 = v25;
      goto LABEL_17;
    }
  }
  id v41 = a1;
  uint64_t v42 = sub_100033000();
  uint64_t v43 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v21, v42, v11);
  long long v44 = sub_10004D130();
  os_log_type_t v45 = sub_10004D2F0();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v46 = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "No chatIdentifier to receive a message to.", v46, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v21, v43);
}

void type metadata accessor for MessagesClientCapabilities()
{
  if (!qword_10007C4E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10007C4E0);
    }
  }
}

uint64_t sub_100036844()
{
  return sub_100036914(&qword_10007C4E8);
}

uint64_t sub_100036878()
{
  return sub_100036914(&qword_10007C4F0);
}

uint64_t sub_1000368AC()
{
  return sub_100036914(&qword_10007C4F8);
}

uint64_t sub_1000368E0()
{
  return sub_100036914(&qword_10007C500);
}

uint64_t sub_100036914(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MessagesClientCapabilities();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100036958(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t IMDaemonFileTransferRequestHandler.requiredCapabilities.getter()
{
  return 256;
}

Swift::Void __swiftcall IMDaemonFileTransferRequestHandler.failTransferPreviewGeneration(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall IMDaemonFileTransferRequestHandler.successfullyGeneratedPreview(forTransfer:withPreviewSize:)(Swift::String forTransfer, CGSize withPreviewSize)
{
  double height = withPreviewSize.height;
  double width = withPreviewSize.width;
  id v4 = [self sharedInstance];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = sub_10004D200();
    objc_msgSend(v5, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v6, width, height);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall IMDaemonFileTransferRequestHandler.successfullyGeneratedPreview(forTransfer:)(Swift::String forTransfer)
{
}

void sub_100036B54(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = [self sharedInstance];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = sub_10004D200();
    objc_msgSend(v5, *a3, v6);
  }
  else
  {
    __break(1u);
  }
}

void sub_100036BFC(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  sub_10004D210();
  id v6 = self;
  id v7 = a1;
  id v8 = [v6 sharedInstance];
  if (v8)
  {
    int64_t v9 = v8;
    id v10 = sub_10004D200();
    objc_msgSend(v9, *a4, v10);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t IMDaemonVCRequestHandler.requiredCapabilities.getter()
{
  return 8;
}

uint64_t sub_100036CD4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = sub_10004D150();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008690();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_bridgeObjectRetain();
  int64_t v9 = sub_10004D130();
  os_log_type_t v10 = sub_10004D2E0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134217984;
    v13[1] = *(void *)(a1 + 16);
    sub_10004D340();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Fetched %ld contacts from IMDP", v11, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a2(a1);
}

uint64_t sub_100036EA0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_100037348();
  uint64_t v2 = sub_10004D1E0();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_100036FD4(uint64_t a1, uint64_t a2)
{
  sub_100037348();
  Class isa = sub_10004D1C0().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

id sub_100037050()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentClientRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100037094()
{
  return swift_bridgeObjectRetain();
}

void sub_1000370A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10004D150();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008690();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  os_log_type_t v10 = sub_10004D130();
  os_log_type_t v11 = sub_10004D2E0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Requesting contacts for handles", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v13 = [self synchronousDatabase];
  Class isa = sub_10004D240().super.isa;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  aBlock[4] = sub_1000373C0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100036EA0;
  aBlock[3] = &unk_100072318;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v13 fetchContactsForIdentifiers:isa completionHandler:v16];
  _Block_release(v16);
  swift_unknownObjectRelease();
}

uint64_t sub_100037308()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100037340(uint64_t a1)
{
  sub_100036FD4(a1, *(void *)(v1 + 16));
}

unint64_t sub_100037348()
{
  unint64_t result = qword_10007C668;
  if (!qword_10007C668)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007C668);
  }
  return result;
}

uint64_t sub_100037388()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000373C0(uint64_t a1)
{
  return sub_100036CD4(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_1000373C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ClientRequestHandling<>.client.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000373F4()
{
  uint64_t v0 = (void *)swift_retain();
  sub_100007C78(v0);

  return swift_release();
}

uint64_t sub_100037450()
{
  return 16;
}

__n128 sub_10003745C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t IMDaemonChatFileTransferRequestHandler.requiredCapabilities.getter()
{
  return 260;
}

id sub_100037470()
{
  sub_1000375E4();
  [*(id *)(v0 + 16) registerForInternalCoreTelephonyNotifications];
  v7[4] = sub_100037F1C;
  uint64_t v8 = v0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1000344EC;
  v7[3] = &unk_100072360;
  uint64_t v1 = _Block_copy(v7);
  swift_retain();
  swift_release();
  IMDSetInconsistencyHandler();
  _Block_release(v1);
  sub_100038210();
  IMRegisterForKeychainNotifications();
  sub_100038ABC();
  objc_super v2 = self;
  id v3 = [v2 sharedManager];
  [v3 registerForCoreSpotlightMigration];

  id v4 = [v2 sharedManager];
  [v4 registerForCoreSpotlightIndexing];

  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v6 = result;
    [result deleteReplayDBIfNotUnderFirstUnlock];

    return (id)sub_1000390A4();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000375E4()
{
  uint64_t v1 = sub_10004CE90();
  uint64_t v32 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_10004D150();
  uint64_t v4 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);

  uint64_t v7 = self;
  [*(id *)(v0 + 16) prewarmHSAAuthenticationServer];

  uint64_t v8 = self;
  sub_10004CFF0();
  uint64_t v9 = (void *)sub_10004CFD0();
  id v10 = [v8 sharedController];
  if (v10)
  {
    os_log_type_t v11 = v10;
    uint64_t v31 = v1;
    sub_10004CFE0();

    if (IMSharedHelperNickNameEnabled()) {
    uint64_t v12 = self;
    }
    id v13 = [v12 sharedFeatureFlags];
    unsigned __int8 v14 = [v13 isAttachmentsPurgeabilityMonitoringEnabled];

    if ((v14 & 1) != 0
      || (id v15 = [self sharedInstance]) != 0
      && (v16 = v15, unsigned int v17 = [v15 isInternalInstall], v16, v17))
    {
      uint64_t v18 = sub_100008690();
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v18, v33);
      uint64_t v19 = sub_10004D130();
      os_log_type_t v20 = sub_10004D310();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Attachments purgeability monitoring enabled", v21, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v33);
      uint64_t v22 = self;
      id v23 = [v22 sharedInstance];
      [v23 stopObserving];

      id v24 = (id)IMSMSDirectoryURL();
      sub_10004CE60();

      sub_10004CE70(1);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v3, v31);
      id v25 = [v22 sharedInstance];
      NSString v26 = sub_10004D200();
      swift_bridgeObjectRelease();
      [v25 observeChangesInPath:v26];
    }
    id v27 = [self sharedManager];
    [v27 registerServiceCapabilityNotifications];

    id v28 = [v12 sharedFeatureFlags];
    unsigned int v29 = [v28 isMessagesAppDeletionEnabled];

    if (v29) {
      sub_10003D25C();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100037C60(uint64_t a1)
{
  uint64_t v2 = sub_10004D150();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008690();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_10004D130();
  os_log_type_t v8 = sub_10004D310();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Told that our state is inconsistent; reloading accounts and forcing clients to reconnect",
      v9,
      2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = self;
  id v11 = [v10 sharedInstance];
  if (!v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v12 = v11;
  [v11 load];

  id v13 = [v10 sharedInstance];
  if (!v13)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  unsigned __int8 v14 = v13;
  id v15 = [v13 activeSessions];

  if (v15)
  {
    sub_100039670(0, (unint64_t *)&qword_10007CBA0);
    unint64_t v16 = sub_10004D250();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_10004D430();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v17)
      {
LABEL_8:
        if (v17 >= 1)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if ((v16 & 0xC000000000000001) != 0) {
              id v19 = (id)sub_10004D3B0();
            }
            else {
              id v19 = *(id *)(v16 + 8 * i + 32);
            }
            os_log_type_t v20 = v19;
            [v19 autoReconnect];
          }
          goto LABEL_15;
        }
        __break(1u);
        goto LABEL_17;
      }
    }
LABEL_15:
    swift_bridgeObjectRelease();
    [*(id *)(a1 + 16) postAliveNotification];
    return;
  }
LABEL_19:
  __break(1u);
}

void sub_100037F1C()
{
  sub_100037C60(v0);
}

void sub_100037F24()
{
  id v0 = [self sharedInstance];
  if (v0)
  {
    id v1 = v0;
    [v0 resumeSyncOnLaunchIfNeeded];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100037F90()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100037FC8()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)IMDLegacyLaunchAssistant) init];
  return v0;
}

id sub_100038018()
{
  id result = [self sharedInstance];
  if (result)
  {
    id v1 = result;
    id v2 = [result systemIsShuttingDown];

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100038078()
{
  return [*(id *)(*(void *)v0 + 16) hasDeviceName];
}

id sub_1000380A0()
{
  return sub_100037470();
}

void sub_1000380C4(uint64_t a1)
{
  id v2 = [self sharedInstance];
  if (v2)
  {
    id v3 = v2;
    [v2 setActive:1];
    [v3 setReceivesMemoryWarnings:1];
    [v3 setUsesPowerNotifications:1];
    [v3 setWatchesDataProtectionLockState:1];
    [v3 addListener:a1];
  }
}

void sub_10003819C()
{
  id v0 = [self sharedInstance];
  [v0 broadcastCloudKitStateAfterFetchingAccountStatus];
}

id sub_1000381FC()
{
  return [*(id *)(*(void *)v0 + 16) postAliveNotification];
}

void sub_100038210()
{
  uint64_t v0 = sub_10004D150();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - v5;
  sub_10004D070();
  swift_allocObject();
  sub_10004D060();
  if (sub_10004D040())
  {
    swift_release();
  }
  else
  {
    uint64_t v34 = v4;
    uint64_t v7 = sub_100008690();
    uint64_t v32 = *(void (**)(char *))(v1 + 16);
    uint64_t v33 = v7;
    v32(v6);
    os_log_type_t v8 = sub_10004D130();
    os_log_type_t v9 = sub_10004D2E0();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Disabling #images before looking in bag", v10, 2u);
      swift_slowDealloc();
    }

    uint64_t v31 = *(void (**)(char *, uint64_t))(v1 + 8);
    v31(v6, v0);
    sub_10004D050();
    id v11 = [objc_allocWithZone((Class)NSMutableDictionary) init];
    uint64_t v12 = (void *)MCFeatureBlockedAppBundleIDs;
    sub_100032DB4(&qword_10007C788);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100055850;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 32) = 0xD000000000000026;
    *(void *)(v13 + 40) = 0x800000010005B350;
    id v14 = v12;
    Class isa = sub_10004D240().super.isa;
    swift_bridgeObjectRelease();
    [v11 MCSetUnionRestriction:v14 values:isa];

    id v16 = [self sharedConnection];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v30 = v1 + 16;
      id v35 = 0;
      id v18 = v11;
      sub_10004D1D0();

      if (v35)
      {
        v19.super.Class isa = sub_10004D1C0().super.isa;
        swift_bridgeObjectRelease();
      }
      else
      {
        v19.super.Class isa = 0;
      }
      NSString v20 = sub_10004D200();
      NSString v21 = sub_10004D200();
      id v35 = 0;
      unsigned int v22 = [v17 applyRestrictionDictionary:v19.super.isa clientType:v20 clientUUID:v21 localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v35];

      if (v22)
      {
        id v23 = v35;
        swift_release();
      }
      else
      {
        id v24 = v35;
        sub_10004CE40();

        swift_willThrow();
        id v25 = v34;
        ((void (*)(char *, uint64_t, uint64_t))v32)(v34, v33, v0);
        NSString v26 = sub_10004D130();
        os_log_type_t v27 = sub_10004D2F0();
        if (os_log_type_enabled(v26, v27))
        {
          id v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v28 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to apply restriction to #images", v28, 2u);
          swift_slowDealloc();
          swift_release();
          swift_errorRelease();
        }
        else
        {
          swift_release();

          swift_errorRelease();
        }
        unsigned int v29 = v31;

        v29(v25, v0);
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100038740()
{
  uint64_t v0 = sub_10004D160();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004D180();
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004D1A0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v18 - v12;
  id v14 = [self sharedInstance];
  unsigned __int8 v15 = [v14 isUnderFirstDataProtectionLock];

  if ((v15 & 1) == 0)
  {
    sub_100039670(0, &qword_10007C778);
    uint64_t v19 = sub_10004D330();
    sub_10004D190();
    sub_10004D1B0();
    NSString v20 = *(void (**)(char *, uint64_t))(v8 + 8);
    v20(v11, v7);
    aBlock[4] = sub_100037F24;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100037F8C;
    aBlock[3] = &unk_1000723C8;
    id v16 = _Block_copy(aBlock);
    sub_10004D170();
    id v23 = &_swiftEmptyArrayStorage;
    sub_100039574();
    sub_100032DB4(&qword_10007C780);
    sub_1000395CC();
    sub_10004D380();
    uint64_t v17 = (void *)v19;
    sub_10004D320();
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v22);
    v20(v13, v7);
  }
}

void sub_100038ABC()
{
  uint64_t v0 = sub_10004D150();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v33 - v5;
  NSString v7 = sub_10004D200();
  NSString v8 = sub_10004D200();
  int v9 = IMGetDomainBoolForKey();

  if (v9)
  {
    NSString v10 = sub_10004D200();
    NSString v11 = sub_10004D200();
    unint64_t v12 = IMGetCachedDomainIntForKeyWithDefaultValue();

    if ((v12 & 0x8000000000000000) != 0 || HIDWORD(v12)) {
      goto LABEL_19;
    }
    uint64_t v13 = sub_100008690();
    id v35 = *(void (**)(char *))(v1 + 16);
    os_log_type_t v36 = (char *)v13;
    v35(v6);
    id v14 = sub_10004D130();
    os_log_type_t v15 = sub_10004D2F0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v34 = v1;
      uint64_t v38 = v17;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v37 = sub_100007094(0xD000000000000010, 0x800000010005B2D0, &v38);
      sub_10004D340();
      *(_WORD *)(v16 + 12) = 1024;
      LODWORD(v37) = v12;
      sub_10004D340();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Simulating a %s hang of %u seconds", (uint8_t *)v16, 0x12u);
      swift_arrayDestroy();
      uint64_t v1 = v34;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v18 = *(void (**)(char *, uint64_t))(v1 + 8);
    v18(v6, v0);
    sleep(v12);
    ((void (*)(char *, char *, uint64_t))v35)(v4, v36, v0);
    uint64_t v19 = sub_10004D130();
    os_log_type_t v20 = sub_10004D2F0();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v36 = v4;
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v37 = sub_100007094(0xD000000000000010, 0x800000010005B2D0, &v38);
      sub_10004D340();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Finished simulating a %s hang", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v22 = v36;
    }
    else
    {

      uint64_t v22 = v4;
    }
    v18(v22, v0);
  }
  id v23 = [self sharedInstance];
  if (!v23)
  {
    __break(1u);
    goto LABEL_16;
  }
  id v24 = v23;
  [v23 recordMetricIsCloudKitEnabled];

  id v25 = [self sharedManager];
  if (!v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  NSString v26 = v25;
  [v25 registerForCloudKitSyncing];

  os_log_type_t v27 = self;
  id v28 = [v27 sharedInstance];
  if (v28)
  {
    unsigned int v29 = v28;
    [v28 registerWithCacheDelete];

    id v30 = [v27 sharedInstance];
    if (v30)
    {
      uint64_t v31 = v30;
      [v30 resetAttachmentWatermark];

      id v32 = [self sharedInstance];
      [v32 fetchAccountStatusAndUpdateMiCSwitchEligibilityIfNeededOnImagentLaunch];

      sub_100038740();
      return;
    }
    goto LABEL_18;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  sub_10004D420();
  __break(1u);
}

uint64_t sub_1000390A4()
{
  uint64_t v0 = sub_10004D150();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v18 - v5;
  sub_10004D0F0();
  swift_allocObject();
  sub_10004D0E0();
  if ((sub_10004D0A0() & 1) == 0)
  {
    unsigned int v7 = [self IMReadEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:0 simID:0];
    uint64_t v8 = sub_100008690();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v8, v0);
    int v9 = sub_10004D130();
    os_log_type_t v10 = sub_10004D310();
    if (os_log_type_enabled(v9, v10))
    {
      NSString v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v11 = 67109120;
      v18[2] = v7;
      sub_10004D340();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Setting preview transcoding to %{BOOL}d based on carrier preferences", v11, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    sub_10004D080();
    sub_10004D0B0();
  }
  if ((sub_10004D0C0() & 1) == 0)
  {
    unsigned int v12 = [self IMReadDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:0 simID:0];
    uint64_t v13 = sub_100008690();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v13, v0);
    id v14 = sub_10004D130();
    os_log_type_t v15 = sub_10004D310();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 67109120;
      v18[3] = v12;
      sub_10004D340();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Setting disable low quality transcode on WiFi to %{BOOL}d based on carrier preferences", v16, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    sub_10004D090();
    sub_10004D0D0();
  }
  return swift_release();
}

void sub_1000393DC()
{
  uint64_t v0 = sub_10004D150();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008690();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_10004D130();
  os_log_type_t v6 = sub_10004D310();
  if (os_log_type_enabled(v5, v6))
  {
    unsigned int v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Setting up location sharing monitoring", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t type metadata accessor for DaemonLaunchAssistant()
{
  return self;
}

unint64_t sub_100039574()
{
  unint64_t result = qword_10007CBC0;
  if (!qword_10007CBC0)
  {
    sub_10004D160();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CBC0);
  }
  return result;
}

unint64_t sub_1000395CC()
{
  unint64_t result = qword_10007CBD0;
  if (!qword_10007CBD0)
  {
    sub_100039628(&qword_10007C780);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CBD0);
  }
  return result;
}

uint64_t sub_100039628(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100039670(uint64_t a1, unint64_t *a2)
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

void _sSo26IMDaemonChatRequestHandlerC7imagentE37recoverChatsFromJunkContainingMessage8withGUIDySS_tF_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_10004D150();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v41 = (void (*)(char *, uint64_t, uint64_t))((char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v40 = (char *)&v38 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v45 = (char *)&v38 - v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v38 - v12;
  uint64_t v14 = sub_100008690();
  uint64_t v15 = v5 + 16;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v13, v14, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_10004D130();
  os_log_type_t v18 = sub_10004D310();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v44 = a1;
  if (v19)
  {
    uint64_t v42 = v5 + 16;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v43 = v5;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v39 = v4;
    uint64_t v47 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100007094(v44, a2, &v47);
    uint64_t v15 = v42;
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Request to recover chat with messageGUID: %s", v21, 0xCu);
    swift_arrayDestroy();
    a1 = v44;
    uint64_t v4 = v39;
    swift_slowDealloc();
    uint64_t v5 = v43;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v13, v4);
  uint64_t v24 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v24 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v24)
  {
    v16(v45, v14, v4);
    swift_bridgeObjectRetain_n();
    id v25 = sub_10004D130();
    os_log_type_t v26 = sub_10004D310();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v38 = v14;
    if (v27)
    {
      id v41 = v16;
      uint64_t v42 = v15;
      id v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v43 = v5;
      *(_DWORD *)id v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_100007094(a1, a2, &v47);
      uint64_t v16 = v41;
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Recovering junk chat on peer devices with %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v23(v45, v4);
    id v33 = [self sharedAccountController];
    if (!v33)
    {
      __break(1u);
      return;
    }
    uint64_t v34 = v33;
    NSString v35 = sub_10004D200();
    id v36 = [v34 anySessionForServiceName:v35];

    if (v36)
    {
      NSString v37 = sub_10004D200();
      [v36 reflectRecoverChatToPeerDevicesForMessageGUID:v37];

      return;
    }
    unsigned int v29 = v40;
    v16(v40, v38, v4);
    id v30 = sub_10004D130();
    uint64_t v14 = sub_10004D2F0();
    if (os_log_type_enabled(v30, (os_log_type_t)v14))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      id v32 = "Could not find session";
      goto LABEL_17;
    }
  }
  else
  {
    unsigned int v29 = (char *)v41;
    v16((char *)v41, v14, v4);
    id v30 = sub_10004D130();
    LOBYTE(v14) = sub_10004D2F0();
    if (os_log_type_enabled(v30, (os_log_type_t)v14))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      id v32 = "No message guid provided";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v14, v32, v31, 2u);
      swift_slowDealloc();
    }
  }

  v23(v29, v4);
}

void *sub_100039D18()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC7imagent28SyncedSettingsRequestHandler_syncedSettingManager);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_100039D68(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC7imagent28SyncedSettingsRequestHandler_syncedSettingManager);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_100039DBC())()
{
  return j__swift_endAccess;
}

uint64_t sub_100039E18(uint64_t a1, void (*a2)(_OWORD *))
{
  uint64_t v4 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x60))();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_10004CFB0();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  a2(v7);
  return sub_10003A244((uint64_t)v7);
}

void sub_10003A090()
{
  uint64_t v1 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x60))();
  if (v1)
  {
    id v2 = (id)v1;
    sub_10004CFA0();
  }
}

id sub_10003A1F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SyncedSettingsRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10003A23C()
{
  return 0x20000000;
}

uint64_t sub_10003A244(uint64_t a1)
{
  uint64_t v2 = sub_100032DB4(&qword_10007C798);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003A2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032DB4(&qword_10007C798);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10003A30C()
{
  qword_10007D300 = (uint64_t)&off_1000723F0;
}

uint64_t sub_10003A320()
{
  uint64_t v0 = sub_100032DB4(&qword_10007CA60);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10004D150();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_100008690();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v10, v3);
  uint64_t v12 = sub_10004D130();
  os_log_type_t v13 = sub_10004D310();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v26 = v2;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Initializing daemon", v14, 2u);
    uint64_t v2 = v26;
    swift_slowDealloc();
  }

  uint64_t v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  v15(v9, v3);
  uint64_t v16 = sub_10004D2D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v2, 1, 1, v16);
  sub_10004D2B0();
  uint64_t v17 = sub_10004D2A0();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = &protocol witness table for MainActor;
  sub_100035168((uint64_t)v2, (uint64_t)&unk_10007C838, v18);
  swift_release();
  id v20 = [self currentRunLoop];
  [v20 run];

  v11(v7, v10, v3);
  uint64_t v21 = sub_10004D130();
  os_log_type_t v22 = sub_10004D2E0();
  if (os_log_type_enabled(v21, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v23 = 67109120;
    swift_beginAccess();
    BOOL v27 = qword_10007D2F8 != 0;
    sub_10004D340();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Runloop completed with daemon setup %{BOOL}d", v23, 8u);
    swift_slowDealloc();
  }

  return ((uint64_t (*)(char *, uint64_t))v15)(v7, v3);
}

void sub_10003A6F8()
{
  [self logLaunchInfo];
  id v0 = [self sharedInstance];
  if (!v0)
  {
    __break(1u);
LABEL_8:
    exit(0);
  }
  uint64_t v1 = v0;
  unsigned __int8 v2 = [v0 systemIsShuttingDown];

  if (v2) {
    goto LABEL_8;
  }
  sub_10000BF04();
  IMSetEmbeddedTempDirectory();
  id v3 = [self sharedInstance];
  if (v3)
  {
    id v4 = v3;
    [v3 trackEvent:IMMetricsCollectorEventImagentLaunch];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10003A7E4(uint64_t *a1)
{
  sub_100032DB4(&qword_10007C840);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100055920;
  uint64_t v3 = sub_100039670(0, &qword_10007C848);
  uint64_t v4 = sub_10003B5C4((unint64_t *)&qword_10007C850, &qword_10007C848);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
  uint64_t v5 = sub_100039670(0, (unint64_t *)&qword_10007C858);
  uint64_t v6 = sub_10003B5C4((unint64_t *)&qword_10007C860, (unint64_t *)&qword_10007C858);
  *(void *)(v2 + 48) = v5;
  *(void *)(v2 + 56) = v6;
  uint64_t v7 = sub_100039670(0, &qword_10007C868);
  uint64_t v8 = sub_10003B5C4(&qword_10007C870, &qword_10007C868);
  *(void *)(v2 + 64) = v7;
  *(void *)(v2 + 72) = v8;
  uint64_t v9 = sub_100039670(0, &qword_10007C878);
  uint64_t v10 = sub_10003B5C4(&qword_10007C880, &qword_10007C878);
  *(void *)(v2 + 80) = v9;
  *(void *)(v2 + 88) = v10;
  uint64_t v11 = sub_100039670(0, &qword_10007C888);
  uint64_t v12 = sub_10003B5C4(&qword_10007C890, &qword_10007C888);
  *(void *)(v2 + 96) = v11;
  *(void *)(v2 + 104) = v12;
  uint64_t inserted = type metadata accessor for ChatInsertMessageRequestHandler();
  uint64_t v14 = sub_10003B608(&qword_10007C898, (void (*)(uint64_t))type metadata accessor for ChatInsertMessageRequestHandler);
  *(void *)(v2 + 112) = inserted;
  *(void *)(v2 + 120) = v14;
  uint64_t v15 = sub_100039670(0, &qword_10007C8A0);
  uint64_t v16 = sub_10003B5C4(&qword_10007C8A8, &qword_10007C8A0);
  *(void *)(v2 + 128) = v15;
  *(void *)(v2 + 136) = v16;
  uint64_t v17 = sub_100039670(0, &qword_10007C8B0);
  uint64_t v18 = sub_10003B5C4(&qword_10007C8B8, &qword_10007C8B0);
  *(void *)(v2 + 144) = v17;
  *(void *)(v2 + 152) = v18;
  uint64_t v19 = sub_100039670(0, &qword_10007C8C0);
  uint64_t v20 = sub_10003B5C4(&qword_10007C8C8, &qword_10007C8C0);
  *(void *)(v2 + 160) = v19;
  *(void *)(v2 + 168) = v20;
  uint64_t v21 = sub_100039670(0, &qword_10007C8D0);
  uint64_t v22 = sub_10003B5C4(&qword_10007C8D8, &qword_10007C8D0);
  *(void *)(v2 + 176) = v21;
  *(void *)(v2 + 184) = v22;
  uint64_t v23 = sub_100039670(0, &qword_10007C8E0);
  uint64_t v24 = sub_10003B5C4(&qword_10007C8E8, &qword_10007C8E0);
  *(void *)(v2 + 192) = v23;
  *(void *)(v2 + 200) = v24;
  uint64_t v25 = sub_100039670(0, &qword_10007C8F0);
  uint64_t v26 = sub_10003B5C4(&qword_10007C8F8, &qword_10007C8F0);
  *(void *)(v2 + 208) = v25;
  *(void *)(v2 + 216) = v26;
  uint64_t v27 = sub_100039670(0, &qword_10007C900);
  uint64_t v28 = sub_10003B5C4(&qword_10007C908, &qword_10007C900);
  *(void *)(v2 + 224) = v27;
  *(void *)(v2 + 232) = v28;
  uint64_t v29 = sub_100039670(0, &qword_10007C910);
  uint64_t v30 = sub_10003B5C4(&qword_10007C918, &qword_10007C910);
  *(void *)(v2 + 240) = v29;
  *(void *)(v2 + 248) = v30;
  uint64_t v31 = sub_100039670(0, &qword_10007C920);
  uint64_t v32 = sub_10003B5C4(&qword_10007C928, &qword_10007C920);
  *(void *)(v2 + 256) = v31;
  *(void *)(v2 + 264) = v32;
  uint64_t v33 = sub_100039670(0, &qword_10007C930);
  uint64_t v34 = sub_10003B5C4(&qword_10007C938, &qword_10007C930);
  *(void *)(v2 + 272) = v33;
  *(void *)(v2 + 280) = v34;
  uint64_t v35 = sub_100039670(0, &qword_10007C940);
  uint64_t v36 = sub_10003B5C4(&qword_10007C948, &qword_10007C940);
  *(void *)(v2 + 288) = v35;
  *(void *)(v2 + 296) = v36;
  uint64_t v37 = sub_100039670(0, &qword_10007C950);
  uint64_t v38 = sub_10003B5C4(&qword_10007C958, &qword_10007C950);
  *(void *)(v2 + 304) = v37;
  *(void *)(v2 + 312) = v38;
  uint64_t v39 = type metadata accessor for SyncedSettingsRequestHandler();
  uint64_t v40 = sub_10003B608(&qword_10007C960, (void (*)(uint64_t))type metadata accessor for SyncedSettingsRequestHandler);
  *(void *)(v2 + 320) = v39;
  *(void *)(v2 + 328) = v40;
  uint64_t v41 = type metadata accessor for IntentClientRequestHandler();
  uint64_t v42 = sub_10003B608(&qword_10007C968, (void (*)(uint64_t))type metadata accessor for IntentClientRequestHandler);
  *(void *)(v2 + 336) = v41;
  *(void *)(v2 + 344) = v42;
  uint64_t v43 = sub_10004D010();
  sub_10004D210();
  if (qword_10007D920 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_10004D000();
  sub_100032DB4(&qword_10007C970);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_100055850;
  *(void *)(v45 + 56) = v43;
  *(void *)(v45 + 64) = &protocol witness table for IncomingClientConnectionListener;
  *(void *)(v45 + 32) = v44;
  uint64_t v69 = 0;
  memset(v68, 0, sizeof(v68));
  uint64_t v46 = self;
  swift_retain();
  id v47 = [v46 sharedFeatureFlags];
  unsigned int v48 = [v47 isRockNRollEnabled];

  if (v48)
  {
    uint64_t v49 = sub_10004D030();
    uint64_t v50 = sub_10004D020();
    unint64_t v51 = *(void *)(v45 + 16);
    unint64_t v52 = *(void *)(v45 + 24);
    swift_retain();
    if (v51 >= v52 >> 1) {
      uint64_t v45 = (uint64_t)sub_10003B490((char *)(v52 > 1), v51 + 1, 1, (char *)v45);
    }
    uint64_t v66 = v49;
    v67 = (_UNKNOWN **)&protocol witness table for IncomingIntentClientConnectionListener;
    *(void *)&long long v65 = v50;
    *(void *)(v45 + 16) = v51 + 1;
    sub_10003B650(&v65, v45 + 40 * v51 + 32);
    uint64_t v66 = v49;
    v67 = (_UNKNOWN **)&protocol witness table for IncomingIntentClientConnectionListener;
    *(void *)&long long v65 = v50;
    sub_100035800((uint64_t)v68, &qword_10007C1A8);
    sub_10003B668((uint64_t)&v65, (uint64_t)v68);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v53 = (objc_class *)sub_10004CF70();
  id v54 = objc_allocWithZone(v53);
  uint64_t v55 = sub_10004CF60();
  type metadata accessor for MessagesDaemon();
  uint64_t v56 = type metadata accessor for DaemonLaunchAssistant();
  uint64_t v57 = sub_100037FC8();
  uint64_t v66 = v56;
  v67 = &off_100072388;
  *(void *)&long long v65 = v57;
  v64[3] = type metadata accessor for ServiceLoader();
  v64[4] = &off_100072868;
  v64[0] = sub_100032B94();
  v63[3] = type metadata accessor for AccountLoader();
  v63[4] = &off_100072168;
  v63[0] = sub_100032B94();
  v62[3] = type metadata accessor for PipelineLoader();
  v62[4] = &off_100072858;
  v62[0] = sub_100032B94();
  v61[3] = v53;
  v61[4] = &protocol witness table for ClientConnectionManager;
  v61[0] = v55;
  sub_100033764((uint64_t)v68, (uint64_t)v60);
  uint64_t v58 = sub_100033A9C(&v65, (uint64_t)v64, (uint64_t)v63, (uint64_t)v62, (uint64_t)v61, (uint64_t)v60);
  swift_release();
  sub_100035800((uint64_t)v68, &qword_10007C1A8);
  *a1 = v58;
  return swift_release();
}

uint64_t sub_10003B140()
{
  v0[5] = sub_10004D2B0();
  v0[6] = sub_10004D2A0();
  uint64_t v2 = sub_10004D280();
  v0[7] = v2;
  v0[8] = v1;
  return _swift_task_switch(sub_10003B1D8, v2, v1);
}

uint64_t sub_10003B1D8()
{
  sub_10004CF00();
  *(void *)(v0 + 72) = sub_10004CEF0();
  uint64_t v2 = sub_10004D280();
  return _swift_task_switch(sub_10003B26C, v2, v1);
}

uint64_t sub_10003B26C()
{
  uint64_t v8 = v0;
  swift_release();
  uint64_t v7 = 0;
  sub_10003A7E4(&v7);
  uint64_t v5 = v7;
  v0[10] = v7;
  if (v5)
  {
    uint64_t v3 = v0[7];
    uint64_t v4 = v0[8];
    uint64_t v2 = sub_10003B2FC;
  }
  else
  {
    __break(1u);
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_10003B2FC()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release();
  swift_beginAccess();
  qword_10007D2F8 = v1;
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10003B394()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003B3CC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100032C9C;
  return sub_10003B140();
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10003A6F8();
  sub_10003A320();
  return 0;
}

char *sub_10003B490(char *result, int64_t a2, char a3, char *a4)
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
      sub_100032DB4(&qword_10007C970);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10003B6D0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for DaemonApplication()
{
  return &type metadata for DaemonApplication;
}

uint64_t sub_10003B5C4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100039670(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10003B608(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003B650(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10003B668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032DB4(&qword_10007C1A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003B6D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_100032DB4(&qword_10007C978);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10004D470();
  __break(1u);
  return result;
}

unint64_t sub_10003B7E0(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 7:
      unint64_t result = 0xD000000000000017;
      break;
    case 8:
      unint64_t result = 0xD000000000000017;
      break;
    case 9:
    case 10:
    case 11:
      unint64_t result = 0xD000000000000020;
      break;
    case 12:
      unint64_t result = 0xD000000000000024;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10003B934(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10003B7E0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10003B7E0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10004D4B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10003B9C0()
{
  char v1 = *v0;
  sub_10004D4F0();
  sub_10003B7E0(v1);
  sub_10004D220();
  swift_bridgeObjectRelease();
  return sub_10004D500();
}

uint64_t sub_10003BA24()
{
  sub_10003B7E0(*v0);
  sub_10004D220();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10003BA78()
{
  char v1 = *v0;
  sub_10004D4F0();
  sub_10003B7E0(v1);
  sub_10004D220();
  swift_bridgeObjectRelease();
  return sub_10004D500();
}

uint64_t sub_10003BAD8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10003C26C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10003BB08@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10003B7E0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10003BB34(void *a1@<X8>)
{
  *a1 = &off_100072600;
}

void sub_10003BB44()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_10004D200();
  id v2 = [v0 persistentDomainForName:v1];

  if (!v2 || (uint64_t v3 = sub_10004D1E0(), v2, !v3))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    goto LABEL_11;
  }
  uint64_t v4 = sub_10004D210();
  if (!*(void *)(v3 + 16) || (unint64_t v6 = sub_10003C110(v4, v5), (v7 & 1) == 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_1000071B8(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v17 + 1))
  {
LABEL_11:
    sub_10003A244((uint64_t)&v16);
    int v8 = 2;
    goto LABEL_12;
  }
  if (swift_dynamicCast()) {
    int v8 = v15;
  }
  else {
    int v8 = 2;
  }
LABEL_12:
  id v9 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v10 = sub_10004D200();
  id v11 = [v9 initWithSuiteName:v10];

  if (v11)
  {
    if (v8 == 2) {
      Class isa = 0;
    }
    else {
      Class isa = sub_10004D270().super.super.isa;
    }
    [v11 setObject:isa forKey:IMCloudKitDefinesDidUpgradeOrRestoreFromBackup];
    swift_unknownObjectRelease();
  }
  for (uint64_t i = 0; i != 13; ++i)
  {
    char v14 = *((unsigned char *)&off_100072600 + i + 32);
    LOBYTE(v16) = v14;
    sub_10003BD88((unsigned __int8 *)&v16);
  }
}

void sub_10003BD88(unsigned __int8 *a1)
{
  uint64_t v2 = sub_10004D150();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = *a1;
  uint64_t v7 = sub_1000330F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  int v8 = sub_10004D130();
  os_log_type_t v9 = sub_10004D2E0();
  if (os_log_type_enabled(v8, v9))
  {
    NSString v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)NSString v10 = 136315138;
    unint64_t v11 = sub_10003B7E0(v6);
    int v16 = v6;
    uint64_t v17 = sub_100007094(v11, v12, &v18);
    sub_10004D340();
    LOBYTE(v6) = v16;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Deleting %s user defaults domain.", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v13 = [self standardUserDefaults];
  sub_10003B7E0(v6);
  NSString v14 = sub_10004D200();
  swift_bridgeObjectRelease();
  [v13 removePersistentDomainForName:v14];
}

void sub_10003BFE4(char a1)
{
}

void sub_10003C004(char a1)
{
}

void sub_10003C028(char a1)
{
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v3 = sub_10004D200();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4)
  {
    id v5 = sub_10004D200();
    [v4 setBool:a1 & 1 forKey:v5];
  }
}

unint64_t sub_10003C110(uint64_t a1, uint64_t a2)
{
  sub_10004D4F0();
  sub_10004D220();
  Swift::Int v4 = sub_10004D500();

  return sub_10003C188(a1, a2, v4);
}

unint64_t sub_10003C188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    NSString v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10004D4B0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10004D4B0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10003C26C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000724A8;
  v6._object = a2;
  unint64_t v4 = sub_10004D480(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xD) {
    return 13;
  }
  else {
    return v4;
  }
}

uint64_t sub_10003C2B8()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_10004D200();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_9:
    sub_10003A244((uint64_t)&v7);
    return 1;
  }
  NSString v3 = sub_10004D200();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    sub_10004D360();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10003C7BC((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_9;
  }
  if (swift_dynamicCast()) {
    return LOBYTE(v6[0]);
  }
  return 1;
}

uint64_t sub_10003C400()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_10004D200();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_9:
    sub_10003A244((uint64_t)&v7);
    return 0;
  }
  NSString v3 = sub_10004D200();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    sub_10004D360();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10003C7BC((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_9;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return LOBYTE(v6[0]);
  }
  return result;
}

unint64_t sub_10003C550()
{
  unint64_t result = qword_10007C980;
  if (!qword_10007C980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C980);
  }
  return result;
}

unint64_t sub_10003C5A8()
{
  unint64_t result = qword_10007C988;
  if (!qword_10007C988)
  {
    sub_100039628(&qword_10007C990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C988);
  }
  return result;
}

unsigned char *_s17UserDefaultDomainOwCP(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s17UserDefaultDomainOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s17UserDefaultDomainOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x10003C770);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

uint64_t sub_10003C798(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10003C7A4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *_s17UserDefaultDomainOMa()
{
  return &_s17UserDefaultDomainON;
}

uint64_t sub_10003C7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032DB4(&qword_10007C798);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t IMDaemonChatModifyReadStateRequestHandler.requiredCapabilities.getter()
{
  return 262148;
}

uint64_t IMDaemonVCACRequestHandler.requiredCapabilities.getter()
{
  return 524296;
}

uint64_t IMDaemonChatRequestHandler.fetchCollaborationNotices(forChatGUID:reply:)(uint64_t a1, unint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_10004D150();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  BOOL v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100032F70();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_bridgeObjectRetain_n();
  id v13 = sub_10004D130();
  os_log_type_t v14 = sub_10004D310();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v8;
    int v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = a4;
    uint64_t v28 = v17;
    uint64_t v26 = a3;
    *(_DWORD *)int v16 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_100007094(a1, a2, &v28);
    a3 = v26;
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Handling CollaborationNotices fetch request for chatGUID: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  id v18 = [self sharedController];
  NSString v19 = sub_10004D200();
  id v20 = [v18 noticesForChatGUID:v19];

  sub_10003CB08();
  uint64_t v21 = sub_10004D250();

  a3(v21);
  return swift_bridgeObjectRelease();
}

unint64_t sub_10003CB08()
{
  unint64_t result = qword_10007CA58;
  if (!qword_10007CA58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007CA58);
  }
  return result;
}

void IMDaemonChatRequestHandler.dismiss(_:)(void *a1)
{
}

void IMDaemonChatRequestHandler.update(_:)(void *a1)
{
}

void sub_10003CCF8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004D150();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100032F70();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  BOOL v11 = sub_10004D130();
  os_log_type_t v12 = sub_10004D310();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = a3;
    os_log_type_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v21 = a1;
    uint64_t v23 = v15;
    *(_DWORD *)os_log_type_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_100007094(v21, a2, &v23);
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Handling CollaborationNotices fetch request for chatGUID: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v20;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v16 = [self sharedController];
  NSString v17 = sub_10004D200();
  id v18 = [v16 noticesForChatGUID:v17];

  sub_10003CB08();
  sub_10004D250();

  Class isa = sub_10004D240().super.isa;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
  swift_bridgeObjectRelease();
}

void sub_10003CFD4(void *a1, const char *a2, SEL *a3)
{
  uint64_t v6 = sub_10004D150();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100032F70();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  BOOL v11 = a1;
  os_log_type_t v12 = sub_10004D130();
  os_log_type_t v13 = sub_10004D310();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = v6;
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    NSString v19 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v14 = 138412290;
    uint64_t v23 = v11;
    uint64_t v20 = a2;
    uint64_t v15 = v11;
    uint64_t v22 = a3;
    id v16 = v15;
    uint64_t v6 = v21;
    sub_10004D340();
    *NSString v19 = v11;

    a3 = v22;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v20, v14, 0xCu);
    sub_100032DB4(&qword_10007CB90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v12 = v11;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v17 = [self sharedController];
  objc_msgSend(v17, *a3, v11);
}

id sub_10003D22C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ApplicationWorkspaceObserver()) init];
  qword_10007D308 = (uint64_t)result;
  return result;
}

uint64_t *sub_10003D25C()
{
  if (qword_10007DC30 != -1) {
    swift_once();
  }
  return &qword_10007D308;
}

void *sub_10003D2A8()
{
  uint64_t v1 = sub_10004D150();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)aBlock - v6;
  v0[OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveUninstallSignal] = 0;
  v0[OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveInstallSignal] = 0;
  v0[OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didPerformStartupTasks] = 0;
  uint64_t v8 = (objc_class *)type metadata accessor for ApplicationWorkspaceObserver();
  v29.receiver = v0;
  v29.super_class = v8;
  uint64_t v9 = objc_msgSendSuper2(&v29, "init");
  uint64_t v10 = *(uint64_t (**)(void))((swift_isaMask & *v9) + 0xB8);
  BOOL v11 = v9;
  if ((v10() & 1) != 0 || [self completedSystemAppMigration]) {
    char v12 = 1;
  }
  else {
    char v12 = sub_10003BFE0();
  }
  os_log_type_t v13 = self;
  id v14 = [v13 sharedInstance];
  unsigned __int8 v15 = [v14 isUnderFirstDataProtectionLock];

  uint64_t v16 = sub_1000330F8();
  id v17 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  if ((v15 & 1) != 0 || (v12 & 1) == 0)
  {
    v17(v5, v16, v1);
    uint64_t v21 = sub_10004D130();
    os_log_type_t v22 = sub_10004D2E0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Deferring until after first unlock", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    id v24 = [v13 sharedInstance];
    [v24 addListener:v11];

    if ((v12 & 1) == 0)
    {
      uint64_t v25 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_100040574;
      aBlock[5] = v25;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000400BC;
      aBlock[3] = &unk_100072710;
      uint64_t v26 = _Block_copy(aBlock);
      swift_release();
      MobileInstallationWaitForSystemAppMigrationWithCompletion();
      _Block_release(v26);
    }
  }
  else
  {
    v17(v7, v16, v1);
    uint64_t v18 = sub_10004D130();
    os_log_type_t v19 = sub_10004D2E0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "We don't have to wait for any startup tasks - performing launch tasks now", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    sub_10003D6CC(v12 & 1);
  }

  return v11;
}

void sub_10003D6CC(char a1)
{
  uint64_t v3 = sub_10004D150();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v57 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v13 = __chkstk_darwin(v12);
  unsigned __int8 v15 = (char *)&v57 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v57 - v17;
  __chkstk_darwin(v16);
  os_log_type_t v22 = (char *)&v57 - v21;
  if (a1)
  {
    uint64_t v59 = v20;
    uint64_t v60 = v19;
    uint64_t v61 = v1;
    uint64_t v62 = v3;
    id v23 = [self sharedInstance];
    unsigned __int8 v24 = [v23 isUnderFirstDataProtectionLock];

    uint64_t v25 = sub_1000330F8();
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    if (v24)
    {
      v26(v10, v25, v62);
      uint64_t v27 = sub_10004D130();
      os_log_type_t v28 = sub_10004D2E0();
      if (os_log_type_enabled(v27, v28))
      {
        objc_super v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)objc_super v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Skipping launch tasks - still not past first unlock", v29, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v62);
    }
    else
    {
      uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
      v26(v22, v25, v62);
      uint64_t v35 = sub_10004D130();
      os_log_type_t v36 = sub_10004D2E0();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "Performing launch tasks", v37, 2u);
        swift_slowDealloc();
      }

      uint64_t v58 = *(void (**)(char *, uint64_t))(v4 + 8);
      v58(v22, v62);
      uint64_t v38 = v61;
      *((unsigned char *)v61 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didPerformStartupTasks) = 1;
      id v39 = [self defaultWorkspace];
      if (v39)
      {
        uint64_t v40 = v39;
        [v39 addObserver:v38];

        char v41 = (*(uint64_t (**)(void))((swift_isaMask & *v38) + 0xB8))();
        char v42 = sub_10003BFE0();
        if (v41)
        {
          if (v42)
          {
            v34((uint64_t)v60, v25, v62);
            uint64_t v43 = sub_10004D130();
            os_log_type_t v44 = sub_10004D2E0();
            if (os_log_type_enabled(v43, v44))
            {
              uint64_t v45 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v45 = 0;
              _os_log_impl((void *)&_mh_execute_header, v43, v44, "We don't need to perform any installation tasks", v45, 2u);
              swift_slowDealloc();
            }

            v58(v60, v62);
          }
          else
          {
            v34((uint64_t)v18, v25, v62);
            uint64_t v50 = sub_10004D130();
            os_log_type_t v51 = sub_10004D2E0();
            if (os_log_type_enabled(v50, v51))
            {
              unint64_t v52 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v52 = 0;
              _os_log_impl((void *)&_mh_execute_header, v50, v51, "We missed the install notification - installing now", v52, 2u);
              uint64_t v38 = v61;
              swift_slowDealloc();
            }

            uint64_t v53 = ((uint64_t (*)(char *, uint64_t))v58)(v18, v62);
            (*(void (**)(uint64_t))((swift_isaMask & *v38) + 0xC8))(v53);
          }
        }
        else if (v42)
        {
          v34((uint64_t)v15, v25, v62);
          uint64_t v46 = sub_10004D130();
          os_log_type_t v47 = sub_10004D2E0();
          if (os_log_type_enabled(v46, v47))
          {
            unsigned int v48 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unsigned int v48 = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, v47, "We missed the uninstall notification - uninstalling now", v48, 2u);
            uint64_t v38 = v61;
            swift_slowDealloc();
          }

          uint64_t v49 = ((uint64_t (*)(char *, uint64_t))v58)(v15, v62);
          (*(void (**)(uint64_t))((swift_isaMask & *v38) + 0xD0))(v49);
        }
        else
        {
          v34((uint64_t)v59, v25, v62);
          id v54 = sub_10004D130();
          os_log_type_t v55 = sub_10004D2E0();
          if (os_log_type_enabled(v54, v55))
          {
            uint64_t v56 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v56 = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, v55, "We are uninstalled, so we actually need to relaunch so imagent doesn't load the services", v56, 2u);
            swift_slowDealloc();
          }

          v58(v59, v62);
          sub_100040128();
        }
        sub_10003BFE4(v41 & 1);
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    uint64_t v30 = sub_1000330F8();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v30, v3);
    uint64_t v31 = sub_10004D130();
    os_log_type_t v32 = sub_10004D2E0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Skipping launch tasks - system app migrator hasn't ran yet", v33, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

id sub_10003DE3C()
{
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v2 = result;
    [result removeObserver:v0];

    v3.receiver = v0;
    v3.super_class = (Class)type metadata accessor for ApplicationWorkspaceObserver();
    return objc_msgSendSuper2(&v3, "dealloc");
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ApplicationWorkspaceObserver()
{
  return self;
}

id sub_10003DF70()
{
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v1 = result;
    NSString v2 = sub_10004D200();
    id v3 = [v1 applicationIsInstalled:v2];

    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10003E004()
{
  uint64_t v0 = sub_10004D150();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000330F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_10004D130();
  os_log_type_t v6 = sub_10004D2E0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "imagent exiting gracefully soon.", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  exit(0);
}

id sub_10003E144()
{
  uint64_t v0 = sub_10004D150();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v26 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  os_log_type_t v6 = (char *)&v25 - v5;
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_1000330F8();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v10(v8, v9, v0);
  uint64_t v11 = sub_10004D130();
  os_log_type_t v12 = sub_10004D2E0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v1;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Messages finished installing.", v13, 2u);
    uint64_t v1 = v25;
    swift_slowDealloc();
  }

  uint64_t v14 = *(void (**)(char *, uint64_t))(v1 + 8);
  v14(v8, v0);
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v16 = result;
    [result trackEvent:IMMetricsCollectorEventMessagesInstall];

    if (sub_10003C000())
    {
      v10(v6, v9, v0);
      uint64_t v17 = sub_10004D130();
      os_log_type_t v18 = sub_10004D2E0();
      if (os_log_type_enabled(v17, v18))
      {
        os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "MiC was enabled prior to deletion, re-enable it.", v19, 2u);
        swift_slowDealloc();
      }

      v14(v6, v0);
      id v20 = [self sharedInstance];
      [v20 setCloudKitEnabled:1];
    }
    else
    {
      uint64_t v21 = v26;
      v10(v26, v9, v0);
      os_log_type_t v22 = sub_10004D130();
      os_log_type_t v23 = sub_10004D2E0();
      if (os_log_type_enabled(v22, v23))
      {
        unsigned __int8 v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned __int8 v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "MiC was disabled prior to deletion, we are not enabling it.", v24, 2u);
        swift_slowDealloc();
      }

      v14(v21, v0);
    }
    sub_10003BFE4(1);
    IMClearDidPerformInitialChatVocabularyUpdate();
    return (id)sub_100040128();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003E500()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100032DB4(&qword_10007CA60);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10004D150();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000330F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_10004D130();
  os_log_type_t v11 = sub_10004D2E0();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Messages starting uninstalling", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = sub_10004D2D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v1;
  id v15 = v1;
  sub_100035168((uint64_t)v4, (uint64_t)&unk_10007CA70, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_10003E72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[16] = a4;
  uint64_t v5 = sub_10004D150();
  v4[17] = v5;
  v4[18] = *(void *)(v5 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  return _swift_task_switch(sub_10003E7FC, 0, 0);
}

uint64_t sub_10003E7FC()
{
  id v1 = [self sharedInstance];
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 trackEvent:IMMetricsCollectorEventMessagesUninstall];

    uint64_t v3 = self;
    id v4 = [v3 sharedInstance];
    char v5 = [v4 cloudKitSyncingEnabled];

    sub_10003C004(v5);
    id v6 = [v3 sharedInstance];
    [v6 setCloudKitEnabled:0];

    id v7 = [self synchronousDatabase];
    v0[21] = v7;
    v0[2] = v0;
    v0[3] = sub_10003E9DC;
    uint64_t v8 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10003F00C;
    v0[13] = &unk_100072738;
    v0[14] = v8;
    [v7 deleteAllDonationsForAppDeletionWithCompletion:v0 + 10];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_10003E9DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_10003EDC4;
  }
  else {
    uint64_t v2 = sub_10003EAEC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003EAEC()
{
  swift_unknownObjectRelease();
  sub_10003BB44();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10003EB88;
  return sub_10004057C();
}

uint64_t sub_10003EB88()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003EC84, 0, 0);
}

uint64_t sub_10003EC84()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  sub_10003BFE4(0);
  uint64_t v4 = sub_1000330F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  char v5 = sub_10004D130();
  os_log_type_t v6 = sub_10004D2E0();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Messages finished uninstalling, imagent exiting gracefully soon.", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v8 = v0[20];
  uint64_t v9 = v0[17];
  uint64_t v10 = v0[18];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  sub_100040128();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10003EDC4()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v4 = sub_1000330F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  char v5 = sub_10004D130();
  os_log_type_t v6 = sub_10004D2F0();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)id v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v9;
    sub_10004D340();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to delete donations upon app deletion with error: %@", v7, 0xCu);
    sub_100032DB4(&qword_10007CB90);
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
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  sub_10003BB44();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[23] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_10003EB88;
  return sub_10004057C();
}

uint64_t sub_10003F00C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_100032DB4(&qword_10007CBA8);
    uint64_t v4 = swift_allocError();
    *char v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

id sub_10003F0A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004D150();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v28 - v7;
  sub_10004CE50(&v28);
  uint64_t v10 = v9;
  id v30 = 0;
  LODWORD(v1) = [v1 removeItemAtURL:v9 error:&v30];

  if (v1) {
    return v30;
  }
  id v12 = v30;
  uint64_t v13 = (void *)sub_10004CE40();

  swift_willThrow();
  id v30 = v13;
  swift_errorRetain();
  sub_100032DB4(&qword_10007CBA8);
  sub_100039670(0, (unint64_t *)&unk_10007CBB0);
  if (!swift_dynamicCast()) {
    return (id)swift_errorRelease();
  }
  swift_errorRelease();
  id v14 = v29;
  id v15 = [v29 code];
  uint64_t v16 = sub_1000330F8();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  if (v15 != (id)4)
  {
    v17(v8, v16, v2);
    os_log_type_t v23 = v14;
    unsigned __int8 v24 = sub_10004D130();
    os_log_type_t v25 = sub_10004D2E0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (_DWORD *)swift_slowAlloc();
      v28._baseURL = (NSURL *)swift_slowAlloc();
      v28._clients = v26;
      v28._reserved = v23;
      *uint64_t v26 = 138412290;
      v28._urlString = (NSString *)(v26 + 1);
      uint64_t v27 = v23;
      sub_10004D340();
      v28._baseURL->super.Class isa = (Class)v23;

      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Error removing file: %@", (uint8_t *)v28._clients, 0xCu);
      sub_100032DB4(&qword_10007CB90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unsigned __int8 v24 = v23;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    swift_willThrow();
    return (id)swift_errorRelease();
  }
  v17(v6, v16, v2);
  os_log_type_t v18 = v14;
  os_log_type_t v19 = sub_10004D130();
  os_log_type_t v20 = sub_10004D2E0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (_DWORD *)swift_slowAlloc();
    v28._baseURL = (NSURL *)swift_slowAlloc();
    v28._clients = v21;
    v28._reserved = v18;
    *uint64_t v21 = 138412290;
    v28._urlString = (NSString *)(v21 + 1);
    os_log_type_t v22 = v18;
    sub_10004D340();
    v28._baseURL->super.Class isa = (Class)v18;

    _os_log_impl((void *)&_mh_execute_header, v19, v20, "File not found, ignoring error: %@", (uint8_t *)v28._clients, 0xCu);
    sub_100032DB4(&qword_10007CB90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v19 = v18;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (id)swift_errorRelease();
}

uint64_t sub_10003F55C(uint64_t a1)
{
  return _swift_continuation_resume(*(void *)(a1 + 32));
}

void sub_10003F564(uint64_t a1)
{
  uint64_t v3 = sub_10004D150();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v7 = sub_10003F758(a1);
    if (v7)
    {
      uint64_t v8 = sub_10003F874((unint64_t)v7);
      swift_bridgeObjectRelease();

      if (v8)
      {
        if (*((unsigned char *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveInstallSignal) == 1)
        {
          *((unsigned char *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveInstallSignal) = 1;
          uint64_t v9 = *(void (**)(void))((swift_isaMask & *v1) + 0xC8);
          v9();
        }
        else
        {
          uint64_t v10 = sub_1000330F8();
          (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v10, v3);
          os_log_type_t v11 = sub_10004D130();
          os_log_type_t v12 = sub_10004D2E0();
          if (os_log_type_enabled(v11, v12))
          {
            uint64_t v13 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v13 = 0;
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        }
      }
    }
  }
}

void *sub_10003F758(uint64_t a1)
{
  id v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_10004D3F0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_1000071B8(i, (uint64_t)v5);
    sub_100039670(0, &qword_10007CB80);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_10004D3D0();
    sub_10004D400();
    sub_10004D410();
    sub_10004D3E0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void *sub_10003F874(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_10004D430())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0 ? (id)sub_10004D3B0() : *(id *)(a1 + 8 * v3);
      id v6 = v5;
      uint64_t v7 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v8 = [v5 bundleIdentifier];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = sub_10004D210();
        uint64_t v12 = v11;

        if (v10 == 0xD000000000000013 && v12 == 0x800000010005B530)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v6;
        }
        char v4 = sub_10004D4B0();
        swift_bridgeObjectRelease();
        if (v4)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }

      ++v3;
      if (v7 == v2) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_17:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_10003FA1C(uint64_t a1)
{
  uint64_t v3 = sub_10004D150();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v7 = sub_10003F758(a1);
    if (v7)
    {
      id v8 = sub_10003F874((unint64_t)v7);
      swift_bridgeObjectRelease();

      if (v8)
      {
        if (*((unsigned char *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveUninstallSignal))
        {
          uint64_t v9 = sub_1000330F8();
          (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
          uint64_t v10 = sub_10004D130();
          os_log_type_t v11 = sub_10004D2E0();
          if (os_log_type_enabled(v10, v11))
          {
            uint64_t v12 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v12 = 0;
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        }
        else
        {
          *((unsigned char *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveUninstallSignal) = 1;
          uint64_t v13 = *(void (**)(void))((swift_isaMask & *v1) + 0xD0);
          v13();
        }
      }
    }
  }
}

uint64_t sub_10003FC28(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  if (a3) {
    uint64_t v6 = sub_10004D250();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a1;
  a4(v6);

  return swift_bridgeObjectRelease();
}

void sub_10003FD60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004D150();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v24 - v9;
  if (a1)
  {
    swift_errorRetain();
    uint64_t v11 = sub_1000330F8();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v11, v4);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v12 = sub_10004D130();
    os_log_type_t v13 = sub_10004D2F0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      v24[1] = a2 + 16;
      id v15 = (uint8_t *)v14;
      v25[0] = swift_slowAlloc();
      *(_DWORD *)id v15 = 136315138;
      v24[0] = v15 + 4;
      swift_getErrorValue();
      uint64_t v16 = sub_10004D4E0();
      void v24[2] = sub_100007094(v16, v17, v25);
      sub_10004D340();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Waiting for SystemAppMigration failed with error: %s", v15, 0xCu);
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
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    uint64_t v18 = sub_1000330F8();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v18, v4);
    os_log_type_t v19 = sub_10004D130();
    os_log_type_t v20 = sub_10004D2F0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Waiting for SystemAppMigration succeeded, resetting daemon shortly", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    os_log_type_t v23 = (void *)Strong;
    sub_10003D6CC(1);
  }
}

void sub_1000400BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100040128()
{
  uint64_t v0 = sub_10004D160();
  uint64_t v20 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10004D180();
  uint64_t v18 = *(void *)(v3 - 8);
  uint64_t v19 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004D1A0();
  uint64_t v17 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v17 - v11;
  sub_100039670(0, &qword_10007C778);
  os_log_type_t v13 = (void *)sub_10004D330();
  sub_10004D190();
  sub_10004D1B0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  aBlock[4] = sub_10003E004;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000344EC;
  aBlock[3] = &unk_100072768;
  id v15 = _Block_copy(aBlock);
  sub_10004D170();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100039574();
  sub_100032DB4(&qword_10007C780);
  sub_1000395CC();
  sub_10004D380();
  sub_10004D320();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v19);
  return ((uint64_t (*)(char *, uint64_t))v14)(v12, v17);
}

uint64_t sub_100040468()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000404A8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100032C9C;
  return sub_10003E72C((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_10004053C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100040574(uint64_t a1)
{
  sub_10003FD60(a1, v1);
}

uint64_t sub_10004057C()
{
  sub_100032DB4(&qword_10007CB98);
  v0[18] = swift_task_alloc();
  uint64_t v1 = sub_10004D150();
  v0[19] = v1;
  v0[20] = *(void *)(v1 - 8);
  v0[21] = swift_task_alloc();
  v0[22] = swift_task_alloc();
  v0[23] = swift_task_alloc();
  v0[24] = swift_task_alloc();
  v0[25] = swift_task_alloc();
  uint64_t v2 = sub_10004CE90();
  v0[26] = v2;
  v0[27] = *(void *)(v2 - 8);
  v0[28] = swift_task_alloc();
  v0[29] = swift_task_alloc();
  v0[30] = swift_task_alloc();
  return _swift_task_switch(sub_100040740, 0, 0);
}

uint64_t sub_100040740()
{
  v0[31] = [self defaultManager];
  id v1 = (id)IMCachesDirectoryURL();
  sub_10004CE60();

  sub_10003F0A4();
  uint64_t v2 = *(void (**)(void, void))(v0[27] + 8);
  v2(v0[30], v0[26]);
  v0[32] = 0;
  v0[33] = v2;
  v0[34] = self;
  sub_10004D2B0();
  v0[35] = sub_10004D2A0();
  uint64_t v4 = sub_10004D280();
  return _swift_task_switch(sub_100040A38, v4, v3);
}

uint64_t sub_100040A38()
{
  id v1 = *(void **)(v0 + 272);
  swift_release();
  *(void *)(v0 + 288) = [v1 allServiceSessions];
  return _swift_task_switch(sub_100040AE8, 0, 0);
}

uint64_t sub_100040AE8()
{
  id v1 = (void *)v0[36];
  sub_100039670(0, (unint64_t *)&qword_10007CBA0);
  unint64_t v2 = sub_10004D250();
  v0[37] = v2;

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10004D430();
    swift_bridgeObjectRelease();
    v0[38] = v3;
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[38] = v3;
    if (v3)
    {
LABEL_3:
      if (v3 < 1) {
        __break(1u);
      }
      v0[39] = 0;
      uint64_t v4 = v0[37];
      if ((v4 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_10004D3B0();
      }
      else {
        id v5 = *(id *)(v4 + 32);
      }
      uint64_t v6 = v5;
      v0[40] = v5;
      uint64_t v7 = v0[25];
      uint64_t v8 = v0[19];
      uint64_t v9 = v0[20];
      uint64_t v10 = sub_1000330F8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v10, v8);
      uint64_t v11 = v6;
      uint64_t v12 = sub_10004D130();
      os_log_type_t v13 = sub_10004D2F0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        id v15 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 138412290;
        *(void *)(v14 + 4) = v11;
        *id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Requesting %@ to delete data", (uint8_t *)v14, 0xCu);
        sub_100032DB4(&qword_10007CB90);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v12 = v11;
      }
      uint64_t v16 = v0[25];
      uint64_t v17 = v0[19];
      uint64_t v18 = v0[20];

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
      v0[2] = v0;
      v0[3] = sub_100040E8C;
      uint64_t v19 = swift_continuation_init();
      v0[10] = _NSConcreteStackBlock;
      v0[11] = 0x40000000;
      v0[12] = sub_10003F55C;
      v0[13] = &unk_100072750;
      v0[14] = v19;
      [v11 deleteAllDataWithCompletionHandler:v0 + 10];
      return _swift_continuation_await(v0 + 2);
    }
  }
  swift_bridgeObjectRelease();
  sub_10004D110();
  uint64_t v20 = (void *)swift_task_alloc();
  v0[41] = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_1000412D4;
  return static SyncCoordinator.clearSyncStoreWhenSafe()();
}

uint64_t sub_100040E8C()
{
  return _swift_task_switch(sub_100040F98, 0, 0);
}

uint64_t sub_100040F98()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 304);

  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease();
    sub_10004D110();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_1000412D4;
    return static SyncCoordinator.clearSyncStoreWhenSafe()();
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 312) + 1;
    *(void *)(v0 + 312) = v4;
    uint64_t v5 = *(void *)(v0 + 296);
    if ((v5 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_10004D3B0();
    }
    else {
      id v6 = *(id *)(v5 + 8 * v4 + 32);
    }
    uint64_t v7 = v6;
    *(void *)(v0 + 320) = v6;
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v9 = *(void *)(v0 + 152);
    uint64_t v10 = *(void *)(v0 + 160);
    uint64_t v11 = sub_1000330F8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
    uint64_t v12 = v7;
    os_log_type_t v13 = sub_10004D130();
    os_log_type_t v14 = sub_10004D2F0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 138412290;
      *(void *)(v15 + 4) = v12;
      void *v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Requesting %@ to delete data", (uint8_t *)v15, 0xCu);
      sub_100032DB4(&qword_10007CB90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      os_log_type_t v13 = v12;
    }
    uint64_t v17 = *(void *)(v0 + 200);
    uint64_t v18 = *(void *)(v0 + 152);
    uint64_t v19 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_100040E8C;
    uint64_t v20 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_10003F55C;
    *(void *)(v0 + 104) = &unk_100072750;
    *(void *)(v0 + 112) = v20;
    [v12 deleteAllDataWithCompletionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_1000412D4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000413FC, 0, 0);
}

uint64_t sub_1000413FC()
{
  uint64_t v79 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  uint64_t v2 = *(void **)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 208);
  objc_msgSend(objc_msgSend(self, "synchronousDatabase"), "deleteDatabase");
  swift_unknownObjectRelease();
  id v5 = (id)IMSMSDirectoryURL();
  sub_10004CE60();

  sub_10004CE50(v6);
  uint64_t v8 = v7;
  v1(v3, v4);
  *(void *)(v0 + 120) = 0;
  id v9 = [v2 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:0 options:0 error:v0 + 120];

  id v10 = *(id *)(v0 + 120);
  if (v9)
  {
    uint64_t v11 = sub_10004D250();

    uint64_t v12 = *(void *)(v11 + 16);
    uint64_t v13 = *(void *)(v0 + 216);
    if (v12)
    {
      uint64_t v15 = *(void (**)(uint64_t, unint64_t, uint64_t))(v13 + 16);
      uint64_t v14 = v13 + 16;
      uint64_t v16 = *(void *)(v0 + 160);
      unint64_t v17 = v11 + ((*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64));
      uint64_t v66 = *(void *)(v14 + 56);
      v67 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
      long long v65 = (void (**)(void, void, void))(v14 + 16);
      v64 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
      uint64_t v62 = (void (**)(uint64_t, uint64_t))(v16 + 8);
      uint64_t v18 = *(void *)(v0 + 256);
      v68 = (void *)(v14 + 40);
      uint64_t v69 = v15;
      do
      {
        uint64_t v19 = *(void *)(v0 + 208);
        uint64_t v20 = *(void *)(v0 + 144);
        v69(v20, v17, v19);
        v63 = (void (*)(uint64_t, void, uint64_t, uint64_t))*v68;
        ((void (*)(uint64_t, void, uint64_t, uint64_t))*v68)(v20, 0, 1, v19);
        int v21 = (*v67)(v20, 1, v19);
        uint64_t v22 = *(void **)(v0 + 248);
        if (v21 == 1)
        {
          swift_bridgeObjectRelease();

          goto LABEL_21;
        }
        (*v65)(*(void *)(v0 + 224), *(void *)(v0 + 144), *(void *)(v0 + 208));
        uint64_t v23 = sub_10004CE80();
        unint64_t v25 = v24;
        sub_10003F0A4();
        uint64_t v26 = *(void *)(v0 + 152);
        if (v18)
        {
          uint64_t v27 = *(void *)(v0 + 168);
          uint64_t v28 = sub_1000330F8();
          (*v64)(v27, v28, v26);
          swift_errorRetain();
          swift_bridgeObjectRetain();
          swift_errorRetain();
          id v29 = sub_10004D130();
          os_log_type_t v30 = sub_10004D2F0();
          BOOL v31 = os_log_type_enabled(v29, v30);
          os_log_type_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
          uint64_t v73 = *(void *)(v0 + 208);
          uint64_t v75 = *(void *)(v0 + 224);
          uint64_t v70 = *(void *)(v0 + 152);
          uint64_t v71 = *(void *)(v0 + 168);
          if (v31)
          {
            uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
            uint64_t v33 = swift_slowAlloc();
            uint64_t v61 = v12;
            uint64_t v34 = (void *)swift_slowAlloc();
            v78[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v33 = 136315394;
            swift_bridgeObjectRetain();
            *(void *)(v33 + 4) = sub_100007094(v23, v25, v78);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v33 + 12) = 2112;
            swift_errorRetain();
            uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v33 + 14) = v35;
            *uint64_t v34 = v35;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v29, v30, "Error deleting file at %s: %@", (uint8_t *)v33, 0x16u);
            sub_100032DB4(&qword_10007CB90);
            swift_arrayDestroy();
            uint64_t v12 = v61;
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            swift_errorRelease();
            (*v62)(v71, v70);
            v60(v75, v73);
          }
          else
          {

            swift_errorRelease();
            swift_errorRelease();
            swift_bridgeObjectRelease_n();
            swift_errorRelease();
            (*v62)(v71, v70);
            v32(v75, v73);
          }
        }
        else
        {
          uint64_t v74 = v23;
          uint64_t v36 = *(void *)(v0 + 192);
          uint64_t v37 = sub_1000330F8();
          (*v64)(v36, v37, v26);
          swift_bridgeObjectRetain();
          uint64_t v38 = sub_10004D130();
          os_log_type_t v39 = sub_10004D2E0();
          BOOL v40 = os_log_type_enabled(v38, v39);
          char v41 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
          uint64_t v42 = *(void *)(v0 + 224);
          uint64_t v76 = *(void *)(v0 + 208);
          uint64_t v43 = *(void *)(v0 + 192);
          uint64_t v44 = *(void *)(v0 + 152);
          if (v40)
          {
            v72 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
            uint64_t v45 = swift_slowAlloc();
            v78[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v45 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)(v45 + 4) = sub_100007094(v74, v25, v78);
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "Deleted file: %s", (uint8_t *)v45, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*v62)(v43, v44);
            v72(v42, v76);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*v62)(v43, v44);
            v41(v42, v76);
          }
        }
        uint64_t v18 = 0;
        v17 += v66;
        --v12;
      }
      while (v12);
      uint64_t v56 = v63;
    }
    else
    {
      uint64_t v56 = *(void (**)(void, uint64_t, uint64_t, void))(v13 + 56);
    }
    uint64_t v57 = *(void **)(v0 + 248);
    v56(*(void *)(v0 + 144), 1, 1, *(void *)(v0 + 208));
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v46 = v10;
    uint64_t v47 = *(void *)(v0 + 176);
    uint64_t v48 = *(void *)(v0 + 152);
    uint64_t v49 = *(void *)(v0 + 160);
    sub_10004CE40();

    swift_willThrow();
    uint64_t v50 = sub_1000330F8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v47, v50, v48);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v51 = sub_10004D130();
    os_log_type_t v52 = sub_10004D2F0();
    if (os_log_type_enabled(v51, v52))
    {
      v77 = *(void **)(v0 + 248);
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      id v54 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 138412290;
      swift_errorRetain();
      uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 128) = v55;
      sub_10004D340();
      *id v54 = v55;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed to fetch contents of directory with error: %@", v53, 0xCu);
      sub_100032DB4(&qword_10007CB90);
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
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 152));
  }
LABEL_21:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v58 = *(uint64_t (**)(void))(v0 + 8);
  return v58();
}

uint64_t IMDaemonBuddyListRequestHandler.requiredCapabilities.getter()
{
  return 1024;
}

uint64_t sub_100041D24()
{
  uint64_t v0 = sub_10004D150();
  sub_10003311C(v0, qword_10007DCC8);
  sub_1000083B0(v0, (uint64_t)qword_10007DCC8);
  sub_10004D120();
  return sub_10004D140();
}

void IMDaemonAutomationRequestHandler.simulateMessages(_:completion:)(uint64_t a1, void (*a2)(uint64_t))
{
  id v3 = [self sharedInstance];
  if (v3 && (uint64_t v4 = v3, v5 = [v3 isInternalInstall], v4, v5))
  {
    id v6 = objc_allocWithZone((Class)IMDBatchMessageSimulator);
    sub_1000429C4();
    swift_bridgeObjectRetain();
    Class isa = sub_10004D240().super.isa;
    swift_bridgeObjectRelease();
    id v8 = [v6 initWithMessages:isa];

    id v16 = 0;
    if ([v8 runWithError:&v16])
    {
      id v9 = v16;
      a2(0);
    }
    else
    {
      id v13 = v16;
      uint64_t v14 = sub_10004CE40();

      swift_willThrow();
      swift_errorRetain();
      a2(v14);

      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    if (qword_10007DCC0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_10004D150();
    sub_1000083B0(v10, (uint64_t)qword_10007DCC8);
    oslog = sub_10004D130();
    os_log_type_t v11 = sub_10004D300();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v11, "Rejecting request to simulate messages as this is not an internal install", v12, 2u);
      swift_slowDealloc();
    }
  }
}

void IMDaemonAutomationRequestHandler.relayMessageGUID(_:completion:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  id v4 = [self sharedInstance];
  if (!v4)
  {
    __break(1u);
    goto LABEL_13;
  }
  unsigned int v5 = v4;
  unsigned int v6 = [v4 isInternalInstall];

  if (!v6
    || (uint64_t v7 = self,
        id v8 = [v7 sharedInstance],
        NSString v9 = sub_10004D200(),
        id v18 = [v8 messageWithGUID:v9],
        v8,
        v9,
        !v18))
  {
    a3();
    return;
  }
  id v10 = [v7 sharedInstance];
  NSString v11 = sub_10004D200();
  id v12 = [v10 existingChatForMessageGUID:v11];

  if (!v12)
  {
    ((void (*)(void))a3)(0);
    goto LABEL_9;
  }
  id v13 = [self sharedInstance];
  if (!v13)
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v14 = v13;
  id v15 = v18;
  id v18 = v12;
  id v16 = [v15 service];
  id v17 = [v14 relayMessageToPeers:v15 forChat:v18 serviceName:v16 reflectOnly:1 requiredCapabilities:0];

  ((void (*)(id))a3)(v17);
LABEL_9:
}

Swift::Void __swiftcall IMDaemonAutomationRequestHandler.relayMessageGUIDSent(_:onService:interworked:)(Swift::String _, Swift::String onService, Swift::Bool interworked)
{
  id v4 = [self sharedInstance];
  if (v4)
  {
    unsigned int v5 = v4;
    NSString v6 = sub_10004D200();
    id v7 = sub_10004D200();
    [v5 messageSent:v6 onService:v7 compatibilityService:0 wasInterworked:interworked];
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall IMDaemonAutomationRequestHandler.simulateAppDeletion()()
{
  uint64_t v0 = (id *)sub_10003D25C();
  uint64_t v1 = *(void (**)(void))((swift_isaMask & *(void *)*v0) + 0xD0);
  id v2 = *v0;
  v1();
}

Swift::Void __swiftcall IMDaemonAutomationRequestHandler.simulateAppInstallation()()
{
  uint64_t v0 = (id *)sub_10003D25C();
  uint64_t v1 = *(void (**)(void))((swift_isaMask & *(void *)*v0) + 0xC8);
  id v2 = *v0;
  v1();
}

unint64_t sub_1000429C4()
{
  unint64_t result = qword_10007CCA0;
  if (!qword_10007CCA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007CCA0);
  }
  return result;
}

void sub_100042A04(uint64_t a1, uint64_t a2)
{
  id v3 = [self sharedInstance];
  if (v3 && (id v4 = v3, v5 = [v3 isInternalInstall], v4, v5))
  {
    id v6 = objc_allocWithZone((Class)IMDBatchMessageSimulator);
    sub_1000429C4();
    swift_bridgeObjectRetain();
    Class isa = sub_10004D240().super.isa;
    swift_bridgeObjectRelease();
    id v8 = [v6 initWithMessages:isa];

    id v17 = 0;
    if ([v8 runWithError:&v17])
    {
      NSString v9 = *(void (**)(uint64_t, void))(a2 + 16);
      id v10 = v17;
      v9(a2, 0);
    }
    else
    {
      id v14 = v17;
      sub_10004CE40();

      swift_willThrow();
      swift_errorRetain();
      id v15 = (void *)sub_10004CE30();
      (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v15);

      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    if (qword_10007DCC0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10004D150();
    sub_1000083B0(v11, (uint64_t)qword_10007DCC8);
    oslog = sub_10004D130();
    os_log_type_t v12 = sub_10004D300();
    if (os_log_type_enabled(oslog, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Rejecting request to simulate messages as this is not an internal install", v13, 2u);
      swift_slowDealloc();
    }
  }
}

void _sSo32IMDaemonAutomationRequestHandlerC7imagentE26updateOffGridSummaryOnChat8withGUID19pendingMessageCountySS_SitF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [self sharedInstance];
  if (v4)
  {
    unsigned int v5 = v4;
    unsigned int v6 = [v4 isInternalInstall];

    if (v6)
    {
      id v7 = [self sharedFeatureFlags];
      unsigned int v8 = [v7 isCarrierPigeonEnabled];

      if (v8)
      {
        id v9 = [self sharedInstance];
        NSString v10 = sub_10004D200();
        id v11 = [v9 existingChatWithGUID:v10];

        if (v11)
        {
          [v11 updatePendingIncomingSatelliteMessageCount:a3];
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void _sSo32IMDaemonAutomationRequestHandlerC7imagentE46simulateReceivedPendingSatelliteMessageForChat8withGUIDySS_tF_0()
{
  id v0 = [self sharedInstance];
  if (!v0) {
    goto LABEL_11;
  }
  uint64_t v1 = v0;
  unsigned int v2 = [v0 isInternalInstall];

  if (!v2) {
    return;
  }
  id v3 = [self sharedFeatureFlags];
  unsigned int v4 = [v3 isCarrierPigeonEnabled];

  if (!v4) {
    return;
  }
  id v5 = [self sharedInstance];
  NSString v6 = sub_10004D200();
  id v10 = [v5 existingChatWithGUID:v6];

  if (!v10) {
    return;
  }
  id v7 = [v10 pendingIncomingSatelliteMessageCount];
  uint64_t v8 = (uint64_t)v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  uint64_t v9 = v8 & ~(v8 >> 63);
  [v10 updateIsDownloadingPendingSatelliteMessages:v8 > 0];
  [v10 updatePendingIncomingSatelliteMessageCount:v9];
}

void _sSo32IMDaemonAutomationRequestHandlerC7imagentE017simulateDowngradeC06fromID0H7Service02toJ014expirationDateySS_S2S10Foundation0M0VtF_0()
{
  id v0 = [self sharedInstance];
  if (!v0)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v1 = v0;
  unsigned int v2 = [v0 isInternalInstall];

  if (!v2) {
    return;
  }
  id v3 = [self sharedFeatureFlags];
  unsigned int v4 = [v3 isCarrierPigeonEnabled];

  if (!v4) {
    return;
  }
  id v5 = [self sharedInstance];
  if (!v5)
  {
LABEL_14:
    __break(1u);
    return;
  }
  NSString v6 = v5;
  NSString v7 = sub_10004D200();
  id v15 = [v6 anySessionForServiceName:v7];

  if (v15)
  {
    id v8 = v15;
    NSString v9 = sub_10004D200();
    Class isa = sub_10004CEC0().super.isa;
    NSString v11 = sub_10004D200();
    [v8 downgradeRequestedForHandleID:v9 expirationDate:isa preferredService:v11];
  }
  id v12 = [self sharedProvider];
  if (v12)
  {
    id v13 = [v12 broadcasterForChatListeners];
    swift_unknownObjectRelease();
    NSString v14 = sub_10004D200();
    [v13 serviceSwitchRequestReceivedForChatWithIdentifier:v14];

    swift_unknownObjectRelease();
  }
}

void sub_1000431DC(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = [self sharedInstance];
  if (!v4)
  {
    _Block_release(a3);
    __break(1u);
    goto LABEL_15;
  }
  id v5 = v4;
  unsigned __int8 v6 = [v4 isInternalInstall];

  if (v6)
  {
    NSString v7 = self;
    id v8 = [v7 sharedInstance];
    NSString v9 = sub_10004D200();
    id v19 = [v8 messageWithGUID:v9];

    if (v19)
    {
      id v10 = [v7 sharedInstance];
      NSString v11 = sub_10004D200();
      id v12 = [v10 existingChatForMessageGUID:v11];

      if (!v12)
      {
        a3[2](a3, 0);
        goto LABEL_11;
      }
      id v13 = [self sharedInstance];
      if (v13)
      {
        NSString v14 = v13;
        id v15 = v19;
        id v19 = v12;
        id v16 = [v15 service];
        id v17 = [v14 relayMessageToPeers:v15 forChat:v19 serviceName:v16 reflectOnly:1 requiredCapabilities:0];

        ((void (**)(void, id))a3)[2](a3, v17);
LABEL_11:

        return;
      }
LABEL_15:
      _Block_release(a3);
      __break(1u);
      return;
    }
  }
  id v18 = a3[2];

  v18(a3, 0);
}

uint64_t IMDaemonModifyReadStateRequestHandler.requiredCapabilities.getter()
{
  return 0x40000;
}

uint64_t IMDaemonChatRequestHandler.loadChats(withPinningIdentifier:reply:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v4 = self;
  id v5 = [v4 sharedInstance];
  NSString v6 = sub_10004D200();
  Class isa = (Class)[v5 existingChatsWithPinningIdentifier:v6];

  if (!isa)
  {
    sub_100039670(0, &qword_10007CD68);
    sub_10004D250();
    Class isa = sub_10004D240().super.isa;
    swift_bridgeObjectRelease();
  }
  id v8 = [v4 sharedInstance];
  id v9 = [v8 _chatInfoForChats:isa];

  sub_100032DB4(&qword_10007CD70);
  uint64_t v10 = sub_10004D250();

  a3(v10);

  return swift_bridgeObjectRelease();
}

uint64_t IMDaemonChatRequestHandler.loadAnyChatsContainingHandleIDs(in:reply:)(void *a1, void (*a2)(uint64_t))
{
  unint64_t isUniquelyReferenced_nonNull_native = sub_100043B14((uint64_t)&_swiftEmptyArrayStorage);
  id v4 = [self sharedAccountController];
  if (!v4)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    uint64_t result = sub_10004D4D0();
    __break(1u);
    return result;
  }
  id v5 = v4;
  id v6 = [v4 accounts];

  if (!v6) {
    goto LABEL_43;
  }
  sub_100039670(0, &qword_10007CD78);
  unint64_t v7 = sub_10004D250();

  id v8 = (void *)a1[2];
  if (v8)
  {
    if (v7 >> 62) {
      goto LABEL_40;
    }
    uint64_t v46 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
LABEL_6:
    id v9 = 0;
    char v41 = a1;
    unint64_t v43 = v7;
    unint64_t v44 = v7 & 0xC000000000000001;
    BOOL v40 = v8;
    do
    {
      if (v9 == v8)
      {
LABEL_39:
        __break(1u);
LABEL_40:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_10004D430();
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
      if (v46)
      {
        uint64_t v42 = v9;
        id v45 = self;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v10 = 4;
        while (1)
        {
          id v8 = (void *)(v10 - 4);
          if (v44) {
            id v11 = (id)sub_10004D3B0();
          }
          else {
            id v11 = *(id *)(v7 + 8 * v10);
          }
          id v12 = v11;
          uint64_t v13 = v10 - 3;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            goto LABEL_39;
          }
          a1 = [v45 sharedInstance];
          NSString v14 = sub_10004D200();
          id v15 = [a1 existingChatForID:v14 account:v12];

          if (v15) {
            break;
          }

LABEL_13:
          ++v10;
          if (v13 == v46)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v8 = v40;
            a1 = v41;
            id v9 = v42;
            goto LABEL_8;
          }
        }
        id v16 = [v15 guid];
        if (!v16)
        {
          __break(1u);
          goto LABEL_42;
        }
        id v17 = v16;
        unint64_t v7 = sub_10004D210();
        a1 = v18;

        id v19 = v15;
        id v8 = (void *)isUniquelyReferenced_nonNull_native;
        unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v47 = v8;
        unint64_t v21 = sub_10003C110(v7, (uint64_t)a1);
        uint64_t v22 = v8[2];
        BOOL v23 = (v20 & 1) == 0;
        uint64_t v24 = v22 + v23;
        if (__OFADD__(v22, v23)) {
          goto LABEL_37;
        }
        char v25 = v20;
        if (v8[3] >= v24)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v47;
            if ((v20 & 1) == 0) {
              goto LABEL_29;
            }
          }
          else
          {
            id v8 = &v47;
            sub_100043FD0();
            unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v47;
            if ((v25 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }
        else
        {
          sub_100043CC0(v24, isUniquelyReferenced_nonNull_native);
          id v8 = v47;
          unint64_t v26 = sub_10003C110(v7, (uint64_t)a1);
          if ((v25 & 1) != (v27 & 1)) {
            goto LABEL_44;
          }
          unint64_t v21 = v26;
          unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v47;
          if ((v25 & 1) == 0)
          {
LABEL_29:
            *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v21 >> 6) + 64) |= 1 << v21;
            id v29 = (unint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v21);
            *id v29 = v7;
            v29[1] = (unint64_t)a1;
            *(void *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v21) = v19;
            uint64_t v30 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
            BOOL v31 = __OFADD__(v30, 1);
            uint64_t v32 = v30 + 1;
            if (v31) {
              goto LABEL_38;
            }
            *(void *)(isUniquelyReferenced_nonNull_native + 16) = v32;
            swift_bridgeObjectRetain();
            goto LABEL_31;
          }
        }
        uint64_t v28 = *(void *)(isUniquelyReferenced_nonNull_native + 56);

        *(void *)(v28 + 8 * v21) = v19;
LABEL_31:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v7 = v43;
        goto LABEL_13;
      }
LABEL_8:
      id v9 = (void *)((char *)v9 + 1);
    }
    while (v9 != v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v33 = [self sharedInstance];
  uint64_t v34 = swift_bridgeObjectRetain();
  sub_100044380(v34);
  swift_bridgeObjectRelease();
  sub_100039670(0, &qword_10007CD68);
  Class isa = sub_10004D240().super.isa;
  swift_release();
  id v36 = [v33 _chatInfoForChats:isa];

  sub_100032DB4(&qword_10007CD70);
  uint64_t v37 = sub_10004D250();

  a2(v37);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

unint64_t sub_100043B14(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100032DB4(&qword_10007CD80);
  unsigned int v2 = (void *)sub_10004D460();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    unint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10003C110(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
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

uint64_t sub_100043CC0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100032DB4(&qword_10007CD80);
  char v38 = a2;
  uint64_t v6 = sub_10004D450();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10004D4F0();
    sub_10004D220();
    uint64_t result = sub_10004D500();
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
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_100043FD0()
{
  uint64_t v1 = v0;
  sub_100032DB4(&qword_10007CD80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10004D440();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void *sub_100044184(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    unint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    id result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_100044380(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100032DB4(&qword_10007CD88);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_100044184(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100044B00();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void sub_10004446C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = self;
  id v5 = [v4 sharedInstance];
  NSString v6 = sub_10004D200();
  Class isa = (Class)[v5 existingChatsWithPinningIdentifier:v6];

  if (!isa)
  {
    sub_100039670(0, &qword_10007CD68);
    sub_10004D250();
    Class isa = sub_10004D240().super.isa;
    swift_bridgeObjectRelease();
  }
  id v8 = [v4 sharedInstance];
  id v9 = [v8 _chatInfoForChats:isa];

  sub_100032DB4(&qword_10007CD70);
  sub_10004D250();

  uint64_t v10 = sub_10004D240().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a3 + 16))(a3, v10);
  swift_bridgeObjectRelease();
}

void sub_1000445F0(unint64_t a1, void (**a2)(void, void))
{
  uint64_t v3 = (void *)sub_100043B14((uint64_t)&_swiftEmptyArrayStorage);
  id v4 = [self sharedAccountController];
  if (!v4)
  {
LABEL_42:
    _Block_release(a2);
    __break(1u);
LABEL_43:
    _Block_release(a2);
    __break(1u);
LABEL_44:
    _Block_release(a2);
    sub_10004D4D0();
    __break(1u);
    return;
  }
  id v5 = v4;
  id v6 = [v4 accounts];

  if (!v6) {
    goto LABEL_43;
  }
  sub_100039670(0, &qword_10007CD78);
  unint64_t v7 = sub_10004D250();

  id v8 = *(char **)(a1 + 16);
  if (v8)
  {
    if (v7 >> 62) {
      goto LABEL_40;
    }
    uint64_t v42 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
LABEL_6:
    id v9 = 0;
    unint64_t v37 = a1;
    unint64_t v39 = v7;
    unint64_t v40 = v7 & 0xC000000000000001;
    int64_t v36 = v8;
    do
    {
      if (v9 == v8)
      {
LABEL_39:
        __break(1u);
LABEL_40:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v42 = sub_10004D430();
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
      if (v42)
      {
        char v38 = v9;
        id v41 = self;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v10 = 4;
        while (1)
        {
          if (v40) {
            id v11 = (id)sub_10004D3B0();
          }
          else {
            id v11 = *(id *)(v7 + 8 * v10);
          }
          int64_t v12 = v11;
          uint64_t v13 = v10 - 3;
          if (__OFADD__(v10 - 4, 1))
          {
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            goto LABEL_39;
          }
          id v8 = (char *)[v41 sharedInstance];
          a1 = (unint64_t)sub_10004D200();
          id v14 = [v8 existingChatForID:a1 account:v12];

          if (v14) {
            break;
          }

LABEL_13:
          ++v10;
          if (v13 == v42)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v8 = v36;
            a1 = v37;
            id v9 = v38;
            goto LABEL_8;
          }
        }
        id v15 = [v14 guid];
        if (!v15)
        {
          _Block_release(a2);
          __break(1u);
          goto LABEL_42;
        }
        unint64_t v16 = v15;
        id v8 = (char *)sub_10004D210();
        uint64_t v18 = v17;

        id v19 = v14;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        a1 = sub_10003C110((uint64_t)v8, v18);
        uint64_t v22 = v3[2];
        BOOL v23 = (v21 & 1) == 0;
        uint64_t v24 = v22 + v23;
        if (__OFADD__(v22, v23)) {
          goto LABEL_37;
        }
        unint64_t v7 = v21;
        if (v3[3] >= v24)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            if ((v21 & 1) == 0) {
              goto LABEL_29;
            }
          }
          else
          {
            sub_100043FD0();
            if ((v7 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }
        else
        {
          sub_100043CC0(v24, isUniquelyReferenced_nonNull_native);
          unint64_t v25 = sub_10003C110((uint64_t)v8, v18);
          if ((v7 & 1) != (v26 & 1)) {
            goto LABEL_44;
          }
          a1 = v25;
          if ((v7 & 1) == 0)
          {
LABEL_29:
            v3[(a1 >> 6) + 8] |= 1 << a1;
            BOOL v27 = (void *)(v3[6] + 16 * a1);
            *BOOL v27 = v8;
            v27[1] = v18;
            *(void *)(v3[7] + 8 * a1) = v19;
            uint64_t v28 = v3[2];
            BOOL v29 = __OFADD__(v28, 1);
            uint64_t v30 = v28 + 1;
            if (v29) {
              goto LABEL_38;
            }
            v3[2] = v30;
            swift_bridgeObjectRetain();
            goto LABEL_31;
          }
        }
        id v8 = (char *)v3[7];
        a1 *= 8;

        *(void *)&v8[a1] = v19;
LABEL_31:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v7 = v39;
        goto LABEL_13;
      }
LABEL_8:
      ++v9;
    }
    while (v9 != v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v31 = [self sharedInstance];
  uint64_t v32 = swift_bridgeObjectRetain();
  sub_100044380(v32);
  swift_bridgeObjectRelease();
  sub_100039670(0, &qword_10007CD68);
  Class isa = sub_10004D240().super.isa;
  swift_release();
  id v34 = [v31 _chatInfoForChats:isa];

  sub_100032DB4(&qword_10007CD70);
  sub_10004D250();

  Class v43 = sub_10004D240().super.isa;
  ((void (**)(void, Class))a2)[2](a2, v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_100044B00()
{
  return swift_release();
}

uint64_t IMDaemonAccountsRequestHandler.requiredCapabilities.getter()
{
  return 512;
}

unint64_t sub_100044B10(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100032DB4(&qword_10007CDF8);
  uint64_t v2 = (void *)sub_10004D460();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    unint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10003C110(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
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

void IMDaemonAccountsRequestHandler.calculateReachability(with:responseHandler:)(void (**a1)(char *, uint64_t), void *a2)
{
  uint64_t v5 = sub_10004D150();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self sharedAccountController];
  if (!v9) {
    goto LABEL_31;
  }
  char v10 = v9;
  NSString v11 = [a1 accountID];
  if (!v11)
  {
    sub_10004D210();
    NSString v11 = sub_10004D200();
    swift_bridgeObjectRelease();
  }
  id v12 = [v10 accountForAccountID:v11];

  if (v12)
  {
    id v13 = [v12 session];

    if (v13)
    {
      uint64_t v14 = sub_100008690();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v14, v5);
      id v15 = a1;
      id v16 = v2;
      uint64_t v17 = v15;
      id v18 = v16;
      id v19 = sub_10004D130();
      os_log_type_t v20 = sub_10004D2E0();
      int v21 = v20;
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v22 = swift_slowAlloc();
        v72 = (void (**)(char *, uint64_t))v6;
        uint64_t v23 = v22;
        uint64_t v71 = swift_slowAlloc();
        uint64_t v76 = (void *)v71;
        *(_DWORD *)uint64_t v23 = 136315650;
        int v70 = v21;
        id v24 = [v17 requestID];
        os_log_t v69 = v19;
        id v25 = v24;
        uint64_t v26 = sub_10004D210();
        uint64_t v73 = a2;
        unint64_t v28 = v27;

        uint64_t v75 = sub_100007094(v26, v28, (uint64_t *)&v76);
        sub_10004D340();

        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 12) = 2080;
        id v29 = [v17 serviceName];
        uint64_t v30 = sub_10004D210();
        id v74 = v13;
        unint64_t v32 = v31;

        uint64_t v75 = sub_100007094(v30, v32, (uint64_t *)&v76);
        sub_10004D340();

        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 22) = 2080;
        sub_100039670(0, &qword_10007C848);
        sub_100045944();
        ClientRequestHandling<>.client.getter();
        uint64_t v33 = sub_10004CF10();
        unint64_t v35 = v34;
        swift_release();
        uint64_t v36 = v33;
        a2 = v73;
        uint64_t v75 = sub_100007094(v36, v35, (uint64_t *)&v76);
        id v13 = v74;
        sub_10004D340();

        swift_bridgeObjectRelease();
        os_log_t v37 = v69;
        _os_log_impl((void *)&_mh_execute_header, v69, (os_log_type_t)v70, "Initiating reachability query for %s on service %s for %s", (uint8_t *)v23, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v72[1](v8, v5);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
      [v13 calculateReachabilityWithRequest:v17 responseHandler:a2];

      return;
    }
  }
  id v38 = [a1 handleIDs];
  uint64_t v39 = sub_10004D250();

  id v40 = [a1 serviceName];
  id v74 = (id)sub_10004D210();

  id v41 = (void *)sub_100044B10((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v42 = *(void *)(v39 + 16);
  if (!v42)
  {
LABEL_24:
    id v65 = objc_allocWithZone((Class)IMServiceReachabilityResult);
    swift_bridgeObjectRetain();
    NSString v66 = sub_10004D200();
    swift_bridgeObjectRelease();
    sub_100039670(0, &qword_10007CD90);
    Class isa = sub_10004D1C0().super.isa;
    swift_bridgeObjectRelease();
    id v74 = [v65 initWithService:v66 error:2 handleResults:isa isFinal:0 allAreReachable:0 didCheckServer:0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    [a2 reachabilityRequest:a1 updatedWithResult:v74];
    v68 = v74;

    return;
  }
  v72 = a1;
  uint64_t v73 = a2;
  swift_bridgeObjectRetain();
  uint64_t v71 = v39;
  Class v43 = (uint64_t *)(v39 + 40);
  while (1)
  {
    uint64_t v46 = *(v43 - 1);
    uint64_t v45 = *v43;
    id v47 = objc_allocWithZone((Class)IMServiceReachabilityHandleResult);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    NSString v48 = sub_10004D200();
    NSString v49 = sub_10004D200();
    swift_bridgeObjectRelease();
    id v50 = [v47 initWithHandleID:v48 service:v49 isReachable:0];

    swift_bridgeObjectRetain();
    id v51 = v50;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v76 = v41;
    unint64_t v54 = sub_10003C110(v46, v45);
    uint64_t v55 = v41[2];
    BOOL v56 = (v53 & 1) == 0;
    uint64_t v57 = v55 + v56;
    if (__OFADD__(v55, v56)) {
      break;
    }
    char v58 = v53;
    if (v41[3] >= v57)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        id v41 = v76;
        if (v53) {
          goto LABEL_10;
        }
      }
      else
      {
        sub_100045790();
        id v41 = v76;
        if (v58) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      sub_100045480(v57, isUniquelyReferenced_nonNull_native);
      unint64_t v59 = sub_10003C110(v46, v45);
      if ((v58 & 1) != (v60 & 1)) {
        goto LABEL_32;
      }
      unint64_t v54 = v59;
      id v41 = v76;
      if (v58)
      {
LABEL_10:
        uint64_t v44 = v41[7];

        *(void *)(v44 + 8 * v54) = v51;
        goto LABEL_11;
      }
    }
    v41[(v54 >> 6) + 8] |= 1 << v54;
    uint64_t v61 = (uint64_t *)(v41[6] + 16 * v54);
    *uint64_t v61 = v46;
    v61[1] = v45;
    *(void *)(v41[7] + 8 * v54) = v51;
    uint64_t v62 = v41[2];
    BOOL v63 = __OFADD__(v62, 1);
    uint64_t v64 = v62 + 1;
    if (v63) {
      goto LABEL_30;
    }
    v41[2] = v64;
    swift_bridgeObjectRetain();
LABEL_11:
    v43 += 2;

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if (!--v42)
    {
      swift_bridgeObjectRelease();
      a1 = v72;
      a2 = v73;
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  sub_10004D4D0();
  __break(1u);
}

uint64_t sub_100045480(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100032DB4(&qword_10007CDF8);
  char v38 = a2;
  uint64_t v6 = sub_10004D450();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10004D4F0();
    sub_10004D220();
    uint64_t result = sub_10004D500();
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
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_100045790()
{
  uint64_t v1 = v0;
  sub_100032DB4(&qword_10007CDF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10004D440();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

unint64_t sub_100045944()
{
  unint64_t result = qword_10007C850;
  if (!qword_10007C850)
  {
    sub_100039670(255, &qword_10007C848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007C850);
  }
  return result;
}

uint64_t IMDaemonManageStatusRequestHandler.requiredCapabilities.getter()
{
  return 1;
}

void _sSo26IMDaemonChatRequestHandlerC7imagentE012closeSessionB2ID_10identifier21didDeleteConversation5style7accountySS_SSSbSo11IMChatStyleVSStF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, unint64_t a8)
{
  int v28 = a5;
  LODWORD(v29) = a6;
  uint64_t v10 = sub_10004D150();
  uint64_t v26 = *(void *)(v10 - 8);
  NSString v27 = (NSString)v10;
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [self sharedInstance];
  if (v13)
  {
    unint64_t v14 = v13;
    NSString v15 = sub_10004D200();
    id v16 = [v14 sessionForAccount:v15];

    if (v16)
    {
      NSString v17 = sub_10004D200();
      NSString v27 = sub_10004D200();
      [v16 closeSessionChatID:v17 identifier:v27 didDeleteConversation:v28 & 1 style:v29];

      uint64_t v18 = v27;
    }
    else
    {
      uint64_t v29 = a7;
      uint64_t v19 = sub_100032FB8();
      uint64_t v21 = v26;
      NSString v20 = v27;
      int64_t v22 = v12;
      (*(void (**)(char *, uint64_t, NSString))(v26 + 16))(v12, v19, v27);
      swift_bridgeObjectRetain_n();
      unint64_t v23 = sub_10004D130();
      os_log_type_t v24 = sub_10004D2F0();
      if (os_log_type_enabled(v23, v24))
      {
        char v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        *(_DWORD *)char v25 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v30 = sub_100007094(v29, a8, &v31);
        sub_10004D340();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "No session for account: %s -- can't close session.", v25, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, NSString))(v21 + 8))(v22, v20);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t IMDaemonChatSendMessageRequestHandler.requiredCapabilities.getter()
{
  return 4100;
}

uint64_t IMDaemonVCInvitationsAVObserverRequestHandler.requiredCapabilities.getter()
{
  return 1048640;
}

void IMDaemonAnyRequestHandler.requestSetup(withClientID:capabilities:context:reply:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void, void), uint64_t a6)
{
  unint64_t v7 = v6;
  uint64_t v47 = a3;
  uint64_t v12 = sub_10004D150();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  NSString v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100008690();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  NSString v17 = sub_10004D130();
  os_log_type_t v18 = sub_10004D2E0();
  int v46 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v41 = v12;
    uint64_t v20 = v19;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v49 = v40;
    *(_DWORD *)uint64_t v20 = 136315650;
    Class v43 = v7;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_100007094(a1, a2, &v49);
    uint64_t v45 = a5;
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2080;
    id v21 = (id)IMStringFromClientCapabilities();
    uint64_t v44 = a6;
    id v22 = v21;
    uint64_t v23 = sub_10004D210();
    v39[1] = a1;
    uint64_t v24 = v23;
    unint64_t v42 = a2;
    unint64_t v26 = v25;

    uint64_t v48 = sub_100007094(v24, v26, &v49);
    sub_10004D340();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_10004D1F0();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v30 = v27;
    unint64_t v7 = v43;
    uint64_t v48 = sub_100007094(v30, v29, &v49);
    a5 = v45;
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v46, "Preparing setup info for %s with %s and context %s", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v41);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  uint64_t v31 = (id *)sub_10003D25C();
  unint64_t v32 = *(uint64_t (**)(void))((swift_isaMask & *(void *)*v31) + 0xB8);
  id v33 = *v31;
  LOBYTE(v32) = v32();

  if (v32) {
    uint64_t v34 = v47;
  }
  else {
    uint64_t v34 = v47 & 0x1842F8;
  }
  sub_100008470();
  sub_1000084B0();
  ClientRequestHandling<>.client.getter();
  sub_10004CF20();
  swift_release();
  Class isa = sub_10004D1C0().super.isa;
  id v36 = [v7 _setupInfoForCapabilities:v34 context:isa];

  uint64_t v37 = sub_10004D1E0();
  a5(1, v37);
  swift_bridgeObjectRelease();
  id v38 = [self sharedInstance];
  [v38 broadcastCloudKitStateAfterFetchingAccountStatus];
}

void IMDaemonAnyRequestHandler.requestSetupXPCObject(withClientID:capabilities:context:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v10 = sub_10004D200();
  Class isa = sub_10004D1C0().super.isa;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a5;
  *(void *)(v12 + 24) = a6;
  v14[4] = sub_100008508;
  v14[5] = v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10000604C;
  v14[3] = &unk_1000727B8;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [v6 requestSetupWithClientID:v10 capabilities:a3 context:isa reply:v13];
  _Block_release(v13);
}

uint64_t sub_1000463D8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100046410()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100046458()
{
  uint64_t v1 = sub_10004D150();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004CF00();
  v0[5] = sub_10004CEF0();
  sub_10004D2B0();
  uint64_t v3 = sub_10004D280();
  return _swift_task_switch(sub_100046548, v3, v2);
}

uint64_t sub_100046548()
{
  swift_release();
  uint64_t v1 = (id *)sub_10003D25C();
  uint64_t v2 = *(uint64_t (**)(void))((swift_isaMask & *(void *)*v1) + 0xB8);
  id v3 = *v1;
  LOBYTE(v2) = v2();

  if (v2)
  {
    id v4 = [objc_allocWithZone((Class)IMDiMessageIDSDelegate) init];
  }
  else
  {
    uint64_t v6 = v0[3];
    uint64_t v5 = v0[4];
    uint64_t v7 = v0[2];
    uint64_t v8 = sub_100008690();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    int64_t v9 = sub_10004D130();
    os_log_type_t v10 = sub_10004D310();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Messages is not installed, skipping loading the IMDiMessageIDSDelegate", v11, 2u);
      swift_slowDealloc();
    }
    uint64_t v13 = v0[3];
    uint64_t v12 = v0[4];
    uint64_t v14 = v0[2];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    id v4 = 0;
  }
  swift_task_dealloc();
  NSString v15 = (uint64_t (*)(id))v0[1];
  return v15(v4);
}

uint64_t sub_1000466E4()
{
  id v4 = (uint64_t (*)(void))(*(void *)(**(void **)v0 + 80) + **(int **)(**(void **)v0 + 80));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000467DC;
  return v4();
}

uint64_t sub_1000467DC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t type metadata accessor for PipelineLoader()
{
  return self;
}

uint64_t sub_1000468FC()
{
  uint64_t v1 = sub_10004D150();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004CF00();
  v0[5] = sub_10004CEF0();
  sub_10004D2B0();
  uint64_t v3 = sub_10004D280();
  return _swift_task_switch(sub_1000469EC, v3, v2);
}

uint64_t sub_1000469EC()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  swift_release();
  uint64_t v4 = sub_100008690();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v5 = sub_10004D130();
  os_log_type_t v6 = sub_10004D310();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Loading services", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v10 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  NSString v11 = sub_10004D200();
  id v12 = (id)IMPathsForPlugInsWithExtension();

  if (v12)
  {
    uint64_t v13 = sub_10004D250();

    uint64_t v14 = sub_100046C50(v13);
    swift_bridgeObjectRelease();
    if (v14)
    {
      uint64_t v15 = v14[2];
      if (v15)
      {
        uint64_t v16 = v14 + 5;
        do
        {
          id v17 = objc_allocWithZone((Class)NSBundle);
          swift_bridgeObjectRetain();
          NSString v18 = sub_10004D200();
          swift_bridgeObjectRelease();
          id v19 = [v17 initWithPath:v18];

          if (v19)
          {
            id v20 = [self sharedController];
            [v20 registerSessionClassWithBundle:v19];
          }
          v16 += 2;
          --v15;
        }
        while (v15);
      }
      swift_bridgeObjectRelease();
    }
  }
  swift_task_dealloc();
  id v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

void *sub_100046C50(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  id v12 = &_swiftEmptyArrayStorage;
  sub_100046EB4(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_1000071B8(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100046EB4(0, v3[2] + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_100046EB4(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v12;
      }
      v3[2] = v6 + 1;
      uint64_t v7 = (char *)&v3[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_100046D98()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(**(void **)v0 + 80) + **(int **)(**(void **)v0 + 80));
  int64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *int64_t v2 = v1;
  v2[1] = sub_100032C9C;
  return v4();
}

uint64_t type metadata accessor for ServiceLoader()
{
  return self;
}

uint64_t sub_100046EB4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100046ED4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100046ED4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100032DB4(&qword_10007D140);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_10004D470();
  __break(1u);
  return result;
}

uint64_t IMDaemonFileProviderRequestHandler.requiredCapabilities.getter()
{
  return 0x10000000;
}

uint64_t IMDaemonChatRequestHandler.unreadCount(completion:)(uint64_t (*a1)(id))
{
  id v2 = [self sharedInstance];
  id v3 = [v2 unreadMessagesCount];

  return a1(v3);
}

uint64_t sub_100047178()
{
  uint64_t v0 = sub_10004D150();
  sub_10003311C(v0, qword_10007E1E8);
  sub_1000083B0(v0, (uint64_t)qword_10007E1E8);
  sub_10004D120();
  return sub_10004D140();
}

uint64_t IMDaemonChatMessageHistoryRequestHandler.fetchEarliestMessageDateForChats(withGUIDs:completion:)(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    id v21 = a2;
    id v22 = self;
    swift_bridgeObjectRetain();
    unint64_t v6 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *(v6 - 1);
      uint64_t v8 = *v6;
      sub_10004D210();
      id v9 = objc_allocWithZone((Class)NSSortDescriptor);
      swift_bridgeObjectRetain();
      NSString v10 = sub_10004D200();
      swift_bridgeObjectRelease();
      id v11 = [v9 initWithKey:v10 ascending:1];

      id v12 = [v22 synchronousDatabase];
      NSString v13 = sub_10004D200();
      sub_100032DB4(&qword_10007CD88);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_100056190;
      *(void *)(v14 + 32) = v11;
      aBlock[0] = v14;
      sub_10004D260();
      sub_100039670(0, &qword_10007D1A8);
      id v15 = v11;
      Class isa = sub_10004D240().super.isa;
      swift_bridgeObjectRelease();
      id v17 = (void *)swift_allocObject();
      v17[2] = v4;
      v17[3] = v7;
      v17[4] = v8;
      aBlock[4] = sub_10004AC08;
      aBlock[5] = v17;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000478F4;
      aBlock[3] = &unk_1000728C8;
      NSString v18 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v12 fetchMessageRecordsForChatRecordWithGUID:v13 filteredUsingPredicate:0 sortedUsingDescriptors:isa limit:1 completionHandler:v18];
      _Block_release(v18);

      swift_unknownObjectRelease();
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    a2 = v21;
  }
  swift_beginAccess();
  uint64_t v19 = swift_bridgeObjectRetain();
  a2(v19);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000474FC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_100032DB4(&qword_10007D220);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  NSString v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v12 = (char *)&v20 - v11;
  if (!(a1 >> 62))
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_10004CEE0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v12, 1, 1, v19);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10004D430();
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v15 = (id)sub_10004D3B0();
    goto LABEL_6;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v15 = *(id *)(a1 + 32);
LABEL_6:
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    id v17 = [v16 date];

    sub_10004CED0();
    uint64_t v18 = sub_10004CEE0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 0, 1, v18);
LABEL_9:
    sub_10004CA44((uint64_t)v12, (uint64_t)v10);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_100047728((uint64_t)v10, a3, a4);
    swift_endAccess();
    return sub_10004CAAC((uint64_t)v12);
  }
  __break(1u);
  return result;
}

uint64_t sub_100047728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100032DB4(&qword_10007D220);
  __chkstk_darwin(v8 - 8);
  NSString v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004CEE0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_10004CAAC(a1);
    sub_100049324(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_10004CAAC((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_100049AC4((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000478F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_100039670(0, &qword_10007D218);
  uint64_t v2 = sub_10004D250();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100047A24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = sub_10004D210();
  uint64_t v9 = v8;
  uint64_t v10 = sub_10004D210();
  uint64_t v12 = v11;
  id v13 = a1;
  a5(v7, v9, v10, v12);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void IMDaemonChatMessageHistoryRequestHandler.updatePluginMessage(withGUID:newPayloadData:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v134 = a6;
  uint64_t v125 = a3;
  uint64_t v126 = a4;
  uint64_t v9 = sub_10004D150();
  Class isa = v9[-1].isa;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v131 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v127 = (char *)&v120 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  os_log_t v130 = (os_log_t)((char *)&v120 - v16);
  uint64_t v17 = __chkstk_darwin(v15);
  long long v123 = (char *)&v120 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  long long v124 = (char *)&v120 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v129 = (char *)&v120 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  unint64_t v25 = ((char *)&v120 - v24);
  uint64_t v26 = __chkstk_darwin(v23);
  __int16 v132 = (char *)&v120 - v27;
  __chkstk_darwin(v26);
  unint64_t v29 = (char *)&v120 - v28;
  uint64_t v30 = sub_100033048();
  unint64_t v32 = (Class)((char *)isa + 16);
  uint64_t v31 = (void (*)(void))*((void *)isa + 2);
  v137 = (void *)v30;
  v138 = (void (*)(char *, void *, NSObject *))v31;
  v31(v29);
  id v33 = sub_10004D130();
  os_log_type_t v34 = sub_10004D2E0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  id v135 = a5;
  os_log_t v128 = v25;
  if (v35)
  {
    unint64_t v25 = a1;
    id v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    v136 = isa;
    id v133 = v9;
    v140[0] = v37;
    *(_DWORD *)id v36 = 136315138;
    uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
    unint64_t v32 = (Class)((char *)isa + 16);
    sub_10004D340();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s called", v36, 0xCu);
    swift_arrayDestroy();
    uint64_t v9 = v133;
    Class isa = v136;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v38 = (void (*)(char *, NSObject *))*((void *)isa + 1);
  v38(v29, v9);
  id v133 = self;
  uint64_t v39 = [v133 sharedInstance];
  NSString v40 = sub_10004D200();
  id v41 = [v39 messageWithGUID:v40];

  if (v41)
  {
    id v42 = [v41 balloonBundleID];
    if (!v42)
    {
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    Class v43 = v42;
    uint64_t v44 = sub_10004D210();
    unint64_t v46 = v45;

    swift_bridgeObjectRelease();
    uint64_t v47 = HIBYTE(v46) & 0xF;
    if ((v46 & 0x2000000000000000) == 0) {
      uint64_t v47 = v44 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v121 = a1;
    if (!v47)
    {
      char v58 = v127;
      v138(v127, v137, v9);
      swift_bridgeObjectRetain_n();
      unint64_t v25 = v41;
      unint64_t v59 = sub_10004D130();
      os_log_type_t v60 = sub_10004D2F0();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = swift_slowAlloc();
        v137 = (void *)swift_slowAlloc();
        v138 = (void (*)(char *, void *, NSObject *))swift_slowAlloc();
        v140[0] = (uint64_t)v138;
        *(_DWORD *)uint64_t v61 = 136315650;
        uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
        id v133 = v9;
        sub_10004D340();
        *(_WORD *)(v61 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v139 = sub_100007094(v121, a2, v140);
        sub_10004D340();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v61 + 22) = 2112;
        uint64_t v139 = (uint64_t)v25;
        uint64_t v62 = v25;
        long long v122 = v38;
        BOOL v63 = v62;
        sub_10004D340();
        void *v137 = v41;

        _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s Message item for GUID %s is not a plugin message. Bailing. %@", (uint8_t *)v61, 0x20u);
        sub_100032DB4(&qword_10007CB90);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v122(v127, v133);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v38(v58, v9);
      }
      v135(0);
      goto LABEL_41;
    }
    v136 = isa;
    uint64_t v48 = v132;
    v138(v132, v137, v9);
    swift_bridgeObjectRetain_n();
    uint64_t v49 = sub_10004D130();
    os_log_type_t v50 = sub_10004D2E0();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      os_log_type_t v52 = (char *)swift_slowAlloc();
      long long v122 = v38;
      uint64_t v131 = v52;
      v140[0] = (uint64_t)v52;
      *(_DWORD *)uint64_t v51 = 136315394;
      uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
      sub_10004D340();
      *(_WORD *)(v51 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_100007094(a1, a2, v140);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "%s Got message item with GUID %s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      id v38 = v122;
      swift_slowDealloc();
      swift_slowDealloc();

      char v53 = v132;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      char v53 = v48;
    }
    v38(v53, v9);
    os_log_t v64 = v130;
    id v65 = [v133 sharedInstance];
    NSString v66 = (char *)[v65 chatForMessage:v41];

    __int16 v132 = v66;
    if (v66)
    {
      os_log_t v67 = v128;
      v138((char *)v128, v137, v9);
      v68 = (void (*)(char *, NSObject *))v41;
      os_log_t v69 = (char *)v41;
      int v70 = sub_10004D130();
      os_log_type_t v71 = sub_10004D2E0();
      BOOL v72 = os_log_type_enabled(v70, v71);
      unint64_t v120 = a2;
      if (v72)
      {
        uint64_t v73 = swift_slowAlloc();
        os_log_t v130 = v70;
        uint64_t v74 = v73;
        v127 = (char *)swift_slowAlloc();
        uint64_t v131 = (char *)swift_slowAlloc();
        v140[0] = (uint64_t)v131;
        *(_DWORD *)uint64_t v74 = 136315394;
        long long v122 = v68;
        uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
        sub_10004D340();
        *(_WORD *)(v74 + 12) = 2112;
        uint64_t v139 = (uint64_t)v69;
        uint64_t v75 = v69;
        sub_10004D340();
        *(void *)v127 = v122;

        os_log_t v76 = v130;
        _os_log_impl((void *)&_mh_execute_header, v130, v71, "%s Got chat for message item %@", (uint8_t *)v74, 0x16u);
        sub_100032DB4(&qword_10007CB90);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        os_log_t v77 = v128;
      }
      else
      {

        os_log_t v77 = v67;
      }
      v38((char *)v77, v9);
      Class v83 = sub_10004CEA0().super.isa;
      [v69 setPayloadData:v83];

      id v84 = [v133 sharedInstance];
      id v85 = [v69 flags];
      uint64_t v131 = v69;
      id v86 = [v84 storeMessage:v69 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:v85];

      uint64_t v87 = v129;
      v138(v129, v137, v9);
      v88 = v86;
      unint64_t v25 = sub_10004D130();
      os_log_type_t v89 = sub_10004D2E0();
      if (os_log_type_enabled(v25, v89))
      {
        uint64_t v90 = swift_slowAlloc();
        os_log_t v130 = (os_log_t)swift_slowAlloc();
        id v133 = swift_slowAlloc();
        v140[0] = (uint64_t)v133;
        *(_DWORD *)uint64_t v90 = 136315394;
        uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
        sub_10004D340();
        *(_WORD *)(v90 + 12) = 2112;
        os_log_t v128 = v25;
        uint64_t v139 = (uint64_t)v88;
        unsigned int v91 = v32;
        v92 = v38;
        uint64_t v93 = v88;
        sub_10004D340();
        v130->Class isa = (Class)v88;

        id v38 = v92;
        unint64_t v32 = v91;
        os_log_t v94 = v128;
        _os_log_impl((void *)&_mh_execute_header, v128, v89, "%s Updated store with new message item %@", (uint8_t *)v90, 0x16u);
        sub_100032DB4(&qword_10007CB90);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v25 = v133;
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v95 = v129;
      }
      else
      {

        v95 = v87;
      }
      v38(v95, v9);
      unint64_t v96 = v120;
      v97 = v132;
      id v98 = [self sharedProvider];
      if (v98)
      {
        v136 = v32;
        v99 = [v98 broadcasterForChatListeners];
        swift_unknownObjectRelease();
        id v100 = [v97 style];
        id v101 = [v88 accountID];
        if (v101)
        {
          v102 = v101;
          v103 = v88;
          id v104 = [v97 chatIdentifier];
          os_log_t v130 = v99;
          id v133 = v103;
          [v99 account:v102 chat:v104 style:v100 chatProperties:0 messageUpdated:v103];

          v105 = v124;
          v138(v124, v137, v9);
          swift_bridgeObjectRetain_n();
          long long v106 = sub_10004D130();
          os_log_type_t v107 = sub_10004D2E0();
          if (os_log_type_enabled(v106, v107))
          {
            uint64_t v108 = swift_slowAlloc();
            v140[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v108 = 136315394;
            uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
            sub_10004D340();
            *(_WORD *)(v108 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v139 = sub_100007094(v121, v96, v140);
            sub_10004D340();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v106, v107, "%s Broadcasted messageUpdated for GUID %s", (uint8_t *)v108, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            long long v109 = v124;
            long long v110 = v9;
            v97 = v132;
          }
          else
          {

            swift_bridgeObjectRelease_n();
            long long v109 = v105;
            long long v110 = v9;
          }
          v38(v109, v110);
          v135(1);

          swift_unknownObjectRelease();
          return;
        }
        goto LABEL_44;
      }
      long long v111 = v123;
      v138(v123, v137, v9);
      unint64_t v25 = v88;
      long long v112 = sub_10004D130();
      os_log_type_t v113 = sub_10004D2F0();
      if (os_log_type_enabled(v112, v113))
      {
        long long v122 = v38;
        id v133 = v9;
        uint64_t v114 = swift_slowAlloc();
        v140[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v114 = 136315394;
        uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
        sub_10004D340();
        *(_WORD *)(v114 + 12) = 2080;
        id v115 = [v25 guid];
        if (!v115)
        {
LABEL_45:

          __break(1u);
          return;
        }
        long long v116 = v115;
        uint64_t v117 = sub_10004D210();
        unint64_t v119 = v118;

        uint64_t v139 = sub_100007094(v117, v119, v140);
        sub_10004D340();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v112, v113, "%s No broadcaster for message with GUID %s", (uint8_t *)v114, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v122(v123, v133);
        v97 = v132;
      }
      else
      {

        v38(v111, v9);
      }
      v135(0);

LABEL_41:
      return;
    }
    v138((char *)v64, v137, v9);
    swift_bridgeObjectRetain_n();
    v78 = sub_10004D130();
    os_log_type_t v79 = sub_10004D2F0();
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v80 = swift_slowAlloc();
      v140[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v80 = 136315394;
      uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
      id v133 = v9;
      sub_10004D340();
      *(_WORD *)(v80 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_100007094(v121, a2, v140);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v78, v79, "%s No message item for GUID %s", (uint8_t *)v80, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      os_log_t v81 = v130;
      v82 = v133;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      os_log_t v81 = v64;
      v82 = v9;
    }
    v38((char *)v81, v82);
    v135(0);
  }
  else
  {
    unint64_t v54 = v131;
    v138(v131, v137, v9);
    swift_bridgeObjectRetain_n();
    uint64_t v55 = sub_10004D130();
    os_log_type_t v56 = sub_10004D2F0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      v140[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 136315394;
      uint64_t v139 = sub_100007094(0xD000000000000038, 0x800000010005B900, v140);
      long long v122 = v38;
      sub_10004D340();
      *(_WORD *)(v57 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_100007094(a1, a2, v140);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s No message item for GUID %s", (uint8_t *)v57, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v122(v131, v9);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v38(v54, v9);
    }
    v135(0);
  }
}

Swift::Void __swiftcall IMDaemonChatMessageHistoryRequestHandler.updateChats(usingMessageGUIDsAndSummaries:)(Swift::OpaquePointer usingMessageGUIDsAndSummaries)
{
  id v1 = [self sharedInstance];
  sub_100039670(0, &qword_10007D1B0);
  Class isa = sub_10004D1C0().super.isa;
  [v1 updateChatsUsingMessageGUIDsAndSummaries:isa];
}

uint64_t sub_100049324@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10003C110(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100049CF4();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_10004CEE0();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_1000498B4(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_10004CEE0();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_1000494CC(uint64_t a1, int a2)
{
  id v3 = v2;
  uint64_t v49 = sub_10004CEE0();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_100032DB4(&qword_10007D228);
  int v47 = a2;
  uint64_t v8 = sub_10004D450();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  id v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  unint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          id v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_10004D4F0();
    sub_10004D220();
    uint64_t result = sub_10004D500();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  id v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *id v3 = v9;
  return result;
}

unint64_t sub_1000498B4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10004D390();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_10004D4F0();
        swift_bridgeObjectRetain();
        sub_10004D220();
        Swift::Int v9 = sub_10004D500();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_10004CEE0() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100049AC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10003C110(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100049CF4();
      goto LABEL_7;
    }
    sub_1000494CC(v15, a4 & 1);
    unint64_t v26 = sub_10003C110(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_10004D4D0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_10004CEE0();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_100049C44(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100049C44(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_10004CEE0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_100049CF4()
{
  uint64_t v35 = sub_10004CEE0();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  int64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100032DB4(&qword_10007D228);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_10004D440();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *uint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE8loadItem8withGUID7queryIDySS_SStF_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v83 = a3;
  uint64_t v84 = a4;
  uint64_t v6 = sub_10004D150();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v85 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v81 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  v92 = (char *)&v81 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v81 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v81 - v18;
  uint64_t v20 = sub_100033048();
  unint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v93 = v20;
  os_log_t v94 = v21;
  ((void (*)(char *))v21)(v19);
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_10004D130();
  os_log_type_t v23 = sub_10004D2E0();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v90 = v7 + 16;
  uint64_t v91 = v6;
  uint64_t v88 = v7;
  unint64_t v89 = a2;
  id v86 = v12;
  uint64_t v87 = a1;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    v97 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315394;
    id v26 = [self currentContext];
    if (!v26)
    {
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_34;
    }
    char v27 = v26;
    id v28 = [v26 listenerID];

    uint64_t v29 = sub_10004D210();
    unint64_t v31 = v30;

    uint64_t v96 = sub_100007094(v29, v31, (uint64_t *)&v97);
    sub_10004D340();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    unint64_t v32 = v89;
    swift_bridgeObjectRetain();
    uint64_t v96 = sub_100007094(v87, v32, (uint64_t *)&v97);
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Request from %s to load item with guid: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v6 = v91;
    v95 = *(void (**)(char *, uint64_t))(v88 + 8);
    v95(v19, v91);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v95 = *(void (**)(char *, uint64_t))(v7 + 8);
    v95(v19, v6);
  }
  uint64_t v33 = self;
  id v34 = [v33 sharedInstance];
  NSString v35 = sub_10004D200();
  id v36 = [v34 itemWithGUID:v35];

  id v37 = [v33 sharedInstance];
  NSString v38 = sub_10004D200();
  id v39 = [v37 chatForMessageGUID:v38];

  v94(v17, v93, v6);
  uint64_t v40 = v36;
  uint64_t v41 = sub_10004D130();
  os_log_type_t v42 = sub_10004D2E0();
  if (os_log_type_enabled(v41, v42))
  {
    id v82 = v39;
    int64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v43 = 138412290;
    if (v40)
    {
      v97 = v40;
      unint64_t v45 = v40;
      sub_10004D340();
    }
    else
    {
      v97 = 0;
      sub_10004D340();
      id v36 = 0;
    }
    *uint64_t v44 = v36;

    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Resulting item: %@", v43, 0xCu);
    sub_100032DB4(&qword_10007CB90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v6 = v91;
    id v39 = v82;
  }
  else
  {

    uint64_t v41 = v40;
  }

  uint64_t v46 = v88 + 8;
  v95(v17, v6);
  v94(v92, v93, v6);
  int v47 = v39;
  uint64_t v48 = sub_10004D130();
  os_log_type_t v49 = sub_10004D2E0();
  if (os_log_type_enabled(v48, v49))
  {
    os_log_type_t v50 = v47;
    id v51 = v39;
    uint64_t v88 = v46;
    os_log_type_t v52 = (uint8_t *)swift_slowAlloc();
    char v53 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v52 = 138412290;
    if (v50)
    {
      v97 = v50;
      unint64_t v54 = v50;
      sub_10004D340();
    }
    else
    {
      v97 = 0;
      sub_10004D340();
      id v51 = 0;
    }
    void *v53 = v51;

    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Resulting chat: %@", v52, 0xCu);
    sub_100032DB4(&qword_10007CB90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v46 = v88;
    int v47 = v50;
  }
  else
  {

    uint64_t v48 = v47;
  }

  uint64_t v55 = v91;
  v95(v92, v91);
  if (!v40)
  {
    uint64_t v75 = v85;
    v94(v85, v93, v55);
    unint64_t v76 = v89;
    swift_bridgeObjectRetain_n();
    os_log_t v77 = sub_10004D130();
    uint64_t v78 = sub_10004D2F0();
    if (os_log_type_enabled(v77, (os_log_type_t)v78))
    {
      uint64_t v79 = swift_slowAlloc();
      v97 = swift_slowAlloc();
      *(_DWORD *)uint64_t v79 = 136315394;
      uint64_t v88 = v46;
      uint64_t v96 = sub_100007094(0xD00000000000001BLL, 0x800000010005B980, (uint64_t *)&v97);
      sub_10004D340();
      *(_WORD *)(v79 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v96 = sub_100007094(v87, v76, (uint64_t *)&v97);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v77, (os_log_type_t)v78, "%s Failed to find item with GUID %s", (uint8_t *)v79, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v74 = v75;
      goto LABEL_27;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v80 = v75;
LABEL_30:
    v95(v80, v55);
    return;
  }
  os_log_type_t v56 = v40;
  unint64_t v57 = v89;
  if (!v47 || (id v58 = [v47 guid]) == 0)
  {
    int v70 = v86;
    v94(v86, v93, v55);
    swift_bridgeObjectRetain_n();
    os_log_type_t v71 = sub_10004D130();
    os_log_type_t v72 = sub_10004D2F0();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = swift_slowAlloc();
      v97 = swift_slowAlloc();
      *(_DWORD *)uint64_t v73 = 136315394;
      uint64_t v88 = v46;
      uint64_t v96 = sub_100007094(0xD00000000000001BLL, 0x800000010005B980, (uint64_t *)&v97);
      sub_10004D340();
      *(_WORD *)(v73 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v96 = sub_100007094(v87, v57, (uint64_t *)&v97);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "%s Failed to find chat for GUID %s", (uint8_t *)v73, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v74 = v86;
LABEL_27:
      v95(v74, v55);
      return;
    }

    swift_bridgeObjectRelease_n();
    uint64_t v80 = v70;
    goto LABEL_30;
  }
  unint64_t v59 = v58;
  uint64_t v60 = sub_10004D210();
  uint64_t v62 = v61;

  id v63 = [self currentContext];
  if (!v63)
  {
LABEL_34:
    __break(1u);
    return;
  }
  os_log_t v64 = v63;
  id v65 = [v63 replyProxy];

  if (v65)
  {
    NSString v66 = sub_10004D200();
    sub_100032DB4(&qword_10007C788);
    uint64_t v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = xmmword_100055850;
    *(void *)(v67 + 56) = &type metadata for String;
    *(void *)(v67 + 32) = v60;
    *(void *)(v67 + 40) = v62;
    v68 = v56;
    Class isa = sub_10004D240().super.isa;
    swift_bridgeObjectRelease();
    [v65 itemQuery:v66 finishedWithResult:v68 chatGUIDs:isa];

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10004ABCC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004AC08(unint64_t a1)
{
  return sub_1000474FC(a1, v1[2], v1[3], v1[4]);
}

void sub_10004AC14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v20 = a2;
    id v21 = self;
    swift_bridgeObjectRetain();
    uint64_t v6 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *(v6 - 1);
      uint64_t v8 = *v6;
      sub_10004D210();
      id v9 = objc_allocWithZone((Class)NSSortDescriptor);
      swift_bridgeObjectRetain();
      NSString v10 = sub_10004D200();
      swift_bridgeObjectRelease();
      id v11 = [v9 initWithKey:v10 ascending:1];

      id v12 = [v21 synchronousDatabase];
      NSString v13 = sub_10004D200();
      sub_100032DB4(&qword_10007CD88);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_100056190;
      *(void *)(v14 + 32) = v11;
      aBlock[0] = v14;
      sub_10004D260();
      sub_100039670(0, &qword_10007D1A8);
      id v15 = v11;
      Class isa = sub_10004D240().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v17 = (void *)swift_allocObject();
      v17[2] = v4;
      v17[3] = v7;
      v17[4] = v8;
      aBlock[4] = sub_10004CB0C;
      aBlock[5] = v17;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000478F4;
      aBlock[3] = &unk_100072918;
      uint64_t v18 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v12 fetchMessageRecordsForChatRecordWithGUID:v13 filteredUsingPredicate:0 sortedUsingDescriptors:isa limit:1 completionHandler:v18];
      _Block_release(v18);

      swift_unknownObjectRelease();
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    a2 = v20;
  }
  swift_beginAccess();
  sub_10004CEE0();
  swift_bridgeObjectRetain();
  Class v19 = sub_10004D1C0().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, v19);
  swift_release();
  swift_bridgeObjectRelease();
}

void _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE34upgradeCompleteMyMomentLinkToStack04withC4GUID04chatP0ySS_SStF_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  id v8 = [self sharedInstance];
  NSString v9 = sub_10004D200();
  id v10 = [v8 existingChatWithGUID:v9];

  if (v10)
  {
    id v11 = [self sharedInstance];
    NSString v12 = sub_10004D200();
    id v13 = [v11 messageWithGUID:v12];

    if (v13)
    {
      id v18 = [self sharedInstance];
      [v18 registerAndAcceptMomentShareForMessage:v13 inChat:v10 resetAssetTransfers:1];

      return;
    }
  }
  if (qword_10007E1E0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10004D150();
  sub_1000083B0(v14, (uint64_t)qword_10007E1E8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v15 = sub_10004D130();
  os_log_type_t v16 = sub_10004D2F0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    sub_100007094(a3, a4, &v19);
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_100007094(a1, a2, &v19);
    sub_10004D340();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to find chat for chat GUID (%s) or message for message GUID (%s)", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

void sub_10004B28C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, const void *a5)
{
  uint64_t v128 = a3;
  uint64_t v129 = a4;
  uint64_t v8 = sub_10004D150();
  os_log_t v9 = *(os_log_t *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v126 = ((char *)&v123 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __chkstk_darwin(v10);
  os_log_t v130 = ((char *)&v123 - v13);
  uint64_t v14 = __chkstk_darwin(v12);
  id v133 = ((char *)&v123 - v15);
  uint64_t v16 = __chkstk_darwin(v14);
  id v135 = ((char *)&v123 - v17);
  uint64_t v18 = __chkstk_darwin(v16);
  __int16 v132 = ((char *)&v123 - v19);
  uint64_t v20 = __chkstk_darwin(v18);
  v136 = (char *)&v123 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  os_log_t v131 = (os_log_t)((char *)&v123 - v23);
  uint64_t v24 = __chkstk_darwin(v22);
  id v26 = ((char *)&v123 - v25);
  __chkstk_darwin(v24);
  id v28 = (char *)&v123 - v27;
  uint64_t v29 = sub_100033048();
  Class isa = (void (*)(os_log_t, uint64_t, uint64_t))v9[2].isa;
  uint64_t v139 = v29;
  v140 = isa;
  uint64_t v141 = (uint64_t)&v9[2];
  ((void (*)(char *))isa)(v28);
  unint64_t v31 = sub_10004D130();
  os_log_type_t v32 = sub_10004D2E0();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v137 = a1;
  v138 = a5;
  if (v33)
  {
    id v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v134 = (uint64_t)v26;
    v143[0] = v35;
    *(_DWORD *)id v34 = 136315138;
    v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
    a1 = v137;
    sub_10004D340();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s called", v34, 0xCu);
    swift_arrayDestroy();
    id v26 = v134;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v36 = (void (*)(char *, uint64_t))v9[1].isa;
  v36(v28, v8);
  id v37 = self;
  id v38 = [v37 sharedInstance];
  NSString v39 = sub_10004D200();
  id v40 = [v38 messageWithGUID:v39];

  if (v40)
  {
    id v41 = [v40 balloonBundleID];
    if (!v41)
    {
      _Block_release(v138);
      __break(1u);
LABEL_44:
      _Block_release(v138);
      __break(1u);
      goto LABEL_45;
    }
    os_log_type_t v42 = v41;
    uint64_t v43 = sub_10004D210();
    unint64_t v45 = v44;

    swift_bridgeObjectRelease();
    uint64_t v46 = HIBYTE(v45) & 0xF;
    if ((v45 & 0x2000000000000000) == 0) {
      uint64_t v46 = v43 & 0xFFFFFFFFFFFFLL;
    }
    if (!v46)
    {
      os_log_t v60 = v131;
      v140(v131, v139, v8);
      swift_bridgeObjectRetain_n();
      unint64_t v61 = (unint64_t)a2;
      a2 = (char *)v40;
      uint64_t v62 = sub_10004D130();
      os_log_type_t v63 = sub_10004D2F0();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = swift_slowAlloc();
        uint64_t v125 = (void (*)(os_log_t, uint64_t))v36;
        os_log_t v127 = v9;
        uint64_t v65 = v64;
        NSString v66 = (void *)swift_slowAlloc();
        uint64_t v141 = swift_slowAlloc();
        v143[0] = v141;
        *(_DWORD *)uint64_t v65 = 136315650;
        v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
        sub_10004D340();
        *(_WORD *)(v65 + 12) = 2080;
        swift_bridgeObjectRetain();
        v142 = (char *)sub_100007094(v137, v61, v143);
        sub_10004D340();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v65 + 22) = 2112;
        v142 = a2;
        uint64_t v67 = a2;
        uint64_t v134 = v8;
        v68 = v67;
        sub_10004D340();
        void *v66 = v40;

        _os_log_impl((void *)&_mh_execute_header, v62, v63, "%s Message item for GUID %s is not a plugin message. Bailing. %@", (uint8_t *)v65, 0x20u);
        sub_100032DB4(&qword_10007CB90);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v125(v131, v134);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v36((char *)v60, v8);
      }
      (*((void (**)(const void *, void))v138 + 2))(v138, 0);
      goto LABEL_41;
    }
    int v47 = v136;
    v140((os_log_t)v136, v139, v8);
    swift_bridgeObjectRetain_n();
    uint64_t v48 = sub_10004D130();
    os_log_type_t v49 = sub_10004D2E0();
    BOOL v50 = os_log_type_enabled(v48, v49);
    unint64_t v124 = (unint64_t)a2;
    uint64_t v125 = (void (*)(os_log_t, uint64_t))v36;
    if (v50)
    {
      uint64_t v51 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      os_log_t v127 = v9;
      v143[0] = v52;
      *(_DWORD *)uint64_t v51 = 136315394;
      v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
      sub_10004D340();
      *(_WORD *)(v51 + 12) = 2080;
      swift_bridgeObjectRetain();
      v142 = (char *)sub_100007094(v137, (unint64_t)a2, v143);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "%s Got message item with GUID %s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      os_log_t v9 = v127;
      swift_slowDealloc();
      id v36 = (void (*)(char *, uint64_t))v125;
      swift_slowDealloc();

      char v53 = v136;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      char v53 = v47;
    }
    v36(v53, v8);
    os_log_t v69 = v135;
    id v70 = [v37 sharedInstance];
    os_log_type_t v71 = [v70 chatForMessage:v40];

    if (v71)
    {
      id v135 = v71;
      os_log_type_t v72 = v132;
      v140(v132, v139, v8);
      uint64_t v73 = (char *)v40;
      uint64_t v74 = sub_10004D130();
      os_log_type_t v75 = sub_10004D2E0();
      BOOL v76 = os_log_type_enabled(v74, v75);
      v136 = v73;
      if (v76)
      {
        uint64_t v77 = swift_slowAlloc();
        os_log_t v127 = v74;
        uint64_t v78 = v77;
        uint64_t v79 = swift_slowAlloc();
        uint64_t v134 = v8;
        long long v123 = (void *)v79;
        os_log_t v131 = (os_log_t)swift_slowAlloc();
        v143[0] = (uint64_t)v131;
        *(_DWORD *)uint64_t v78 = 136315394;
        v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
        sub_10004D340();
        *(_WORD *)(v78 + 12) = 2112;
        v142 = v136;
        uint64_t v80 = v36;
        uint64_t v81 = v136;
        uint64_t v73 = v136;
        sub_10004D340();
        *long long v123 = v40;

        id v36 = v80;
        os_log_t v82 = v127;
        _os_log_impl((void *)&_mh_execute_header, v127, v75, "%s Got chat for message item %@", (uint8_t *)v78, 0x16u);
        sub_100032DB4(&qword_10007CB90);
        swift_arrayDestroy();
        uint64_t v8 = v134;
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v83 = (char *)v132;
      }
      else
      {

        uint64_t v83 = (char *)v72;
      }
      v36(v83, v8);
      uint64_t v91 = v133;
      Class v92 = sub_10004CEA0().super.isa;
      [v73 setPayloadData:v92];

      id v93 = [v37 sharedInstance];
      id v94 = objc_msgSend(v93, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v73, 1, 0, 0, objc_msgSend(v73, "flags"));

      v140(v91, v139, v8);
      v95 = (char *)v94;
      uint64_t v96 = sub_10004D130();
      os_log_type_t v97 = sub_10004D2E0();
      if (os_log_type_enabled(v96, v97))
      {
        uint64_t v98 = swift_slowAlloc();
        __int16 v132 = swift_slowAlloc();
        uint64_t v134 = swift_slowAlloc();
        v143[0] = v134;
        *(_DWORD *)uint64_t v98 = 136315394;
        v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
        os_log_t v131 = v96;
        sub_10004D340();
        *(_WORD *)(v98 + 12) = 2112;
        v142 = v95;
        v99 = v95;
        sub_10004D340();
        v132->Class isa = (Class)v95;

        os_log_t v100 = v131;
        _os_log_impl((void *)&_mh_execute_header, v131, v97, "%s Updated store with new message item %@", (uint8_t *)v98, 0x16u);
        sub_100032DB4(&qword_10007CB90);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v36((char *)v133, v8);
      }
      else
      {

        v36((char *)v91, v8);
      }
      id v101 = v130;
      v102 = v135;
      id v103 = [self sharedProvider];
      if (v103)
      {
        a2 = (char *)[v103 broadcasterForChatListeners];
        swift_unknownObjectRelease();
        id v104 = [v102 style];
        id v105 = [v95 accountID];
        if (v105)
        {
          long long v106 = v105;
          id v107 = [v102 chatIdentifier];
          [a2 account:v106 chat:v107 style:v104 chatProperties:0 messageUpdated:v95];

          uint64_t v108 = v126;
          v140(v126, v139, v8);
          unint64_t v109 = v124;
          swift_bridgeObjectRetain_n();
          long long v110 = sub_10004D130();
          os_log_type_t v111 = sub_10004D2E0();
          if (os_log_type_enabled(v110, v111))
          {
            uint64_t v112 = swift_slowAlloc();
            uint64_t v141 = swift_slowAlloc();
            v143[0] = v141;
            *(_DWORD *)uint64_t v112 = 136315394;
            v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
            sub_10004D340();
            *(_WORD *)(v112 + 12) = 2080;
            swift_bridgeObjectRetain();
            v142 = (char *)sub_100007094(v137, v109, v143);
            sub_10004D340();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v110, v111, "%s Broadcasted messageUpdated for GUID %s", (uint8_t *)v112, 0x16u);
            swift_arrayDestroy();
            v102 = v135;
            swift_slowDealloc();
            swift_slowDealloc();

            os_log_type_t v113 = v126;
          }
          else
          {

            swift_bridgeObjectRelease_n();
            os_log_type_t v113 = v108;
          }
          v125(v113, v8);
          id v122 = v136;
          (*((void (**)(const void *, uint64_t))v138 + 2))(v138, 1);

          swift_unknownObjectRelease();
          return;
        }
        goto LABEL_44;
      }
      v140(v101, v139, v8);
      a2 = v95;
      uint64_t v114 = sub_10004D130();
      os_log_type_t v115 = sub_10004D2F0();
      if (os_log_type_enabled(v114, v115))
      {
        os_log_t v127 = v9;
        uint64_t v134 = v8;
        uint64_t v116 = swift_slowAlloc();
        v143[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v116 = 136315394;
        v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
        sub_10004D340();
        *(_WORD *)(v116 + 12) = 2080;
        id v117 = [a2 guid];
        if (!v117)
        {
LABEL_45:
          _Block_release(v138);

          __break(1u);
          return;
        }
        unint64_t v118 = v117;
        uint64_t v119 = sub_10004D210();
        unint64_t v121 = v120;

        v142 = (char *)sub_100007094(v119, v121, v143);
        sub_10004D340();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v114, v115, "%s No broadcaster for message with GUID %s", (uint8_t *)v116, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v125(v130, v134);
        v102 = v135;
      }
      else
      {

        v36((char *)v101, v8);
      }
      (*((void (**)(const void *, void))v138 + 2))(v138, 0);

LABEL_41:
      return;
    }
    uint64_t v84 = v36;
    v140(v69, v139, v8);
    unint64_t v85 = v124;
    swift_bridgeObjectRetain_n();
    id v86 = sub_10004D130();
    os_log_type_t v87 = sub_10004D2F0();
    if (os_log_type_enabled(v86, v87))
    {
      uint64_t v88 = swift_slowAlloc();
      uint64_t v89 = swift_slowAlloc();
      os_log_t v127 = v9;
      v143[0] = v89;
      *(_DWORD *)uint64_t v88 = 136315394;
      v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
      sub_10004D340();
      *(_WORD *)(v88 + 12) = 2080;
      swift_bridgeObjectRetain();
      v142 = (char *)sub_100007094(v137, v85, v143);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "%s No message item for GUID %s", (uint8_t *)v88, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v90 = (char *)v135;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v90 = (char *)v69;
    }
    v84(v90, v8);
    (*((void (**)(const void *, void))v138 + 2))(v138, 0);
  }
  else
  {
    unint64_t v54 = v36;
    v140(v26, v139, v8);
    swift_bridgeObjectRetain_n();
    uint64_t v55 = sub_10004D130();
    os_log_type_t v56 = sub_10004D2F0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      os_log_t v127 = v9;
      v143[0] = v58;
      *(_DWORD *)uint64_t v57 = 136315394;
      v142 = (char *)sub_100007094(0xD000000000000038, 0x800000010005B900, v143);
      uint64_t v134 = (uint64_t)v26;
      sub_10004D340();
      *(_WORD *)(v57 + 12) = 2080;
      swift_bridgeObjectRetain();
      v142 = (char *)sub_100007094(a1, (unint64_t)a2, v143);
      sub_10004D340();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s No message item for GUID %s", (uint8_t *)v57, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v59 = (char *)v134;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v59 = (char *)v26;
    }
    v54(v59, v8);
    (*((void (**)(const void *, void))v138 + 2))(v138, 0);
  }
}

id _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE49fetchIncomingPendingMessagesOverSatelliteForChats7withIDs8servicesySaySSG_AGtF_0(id result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v4 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t result = [v4 sharedAccountController];
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v6 = result;
      NSString v7 = sub_10004D200();
      swift_bridgeObjectRelease();
      Class v8 = (Class)[v6 anySessionForServiceName:v7];

      if (v8)
      {
        id v9 = [(objc_class *)v8 service];
        unsigned int v10 = [v9 supportsCapability:IMServiceCapabilityPendingIncomingMessageFetchOverSatellite];

        if (v10)
        {
          Class isa = sub_10004D240().super.isa;
          [(objc_class *)v8 fetchIncomingPendingMessagesFromHandlesIDs:isa];

          Class v8 = isa;
        }
      }
      v5 += 16;
      --v2;
    }
    while (v2);
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10004C9A8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10004CA04()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10004CA44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100032DB4(&qword_10007D220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004CAAC(uint64_t a1)
{
  uint64_t v2 = sub_100032DB4(&qword_10007D220);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10004CB18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No message guid found for message: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10004CB90()
{
  sub_10001B0C0();
  uint64_t v1 = "setupInfo";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v0, 0x16u);
}

void sub_10004CC24()
{
  sub_10001B0C0();
  uint64_t v1 = "setupInfo";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v0, 0x16u);
}

void sub_10004CCB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fetched stats from IMDPersistence but received nil dictionary", v1, 2u);
}

void sub_10004CCFC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "fetching server counts was nil", v1, 2u);
}

void sub_10004CD40(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Could not create NSInvocation matching XPC request object. Selector \"%@\" not found in XPC interface.", (uint8_t *)&v2, 0xCu);
}

void sub_10004CDB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Latest item time is nil, can't update chat's lastTUConversationCreatedDate! item: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_10004CE30()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10004CE40()
{
  return _convertNSErrorToError(_:)();
}

void sub_10004CE50(NSURL *retstr@<X8>)
{
}

uint64_t sub_10004CE60()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004CE70(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10004CE80()
{
  return URL.path.getter();
}

uint64_t sub_10004CE90()
{
  return type metadata accessor for URL();
}

NSData sub_10004CEA0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10004CEB0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate sub_10004CEC0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10004CED0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004CEE0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10004CEF0()
{
  return static DaemonWorkActor.shared.getter();
}

uint64_t sub_10004CF00()
{
  return type metadata accessor for DaemonWorkActor();
}

uint64_t sub_10004CF10()
{
  return ClientConnection.id.getter();
}

uint64_t sub_10004CF20()
{
  return ClientConnection.set(id:capabilities:)();
}

uint64_t sub_10004CF30()
{
  return type metadata accessor for ClientConnection();
}

uint64_t sub_10004CF40()
{
  return ClientRequestHandling.requirementsMet(by:for:)();
}

uint64_t sub_10004CF50()
{
  return ClientRequestHandling.requiredEntitlements.getter();
}

uint64_t sub_10004CF60()
{
  return ClientConnectionManager.init(connectionListeners:)();
}

uint64_t sub_10004CF70()
{
  return type metadata accessor for ClientConnectionManager();
}

uint64_t sub_10004CF90()
{
  return dispatch thunk of ClientConnectionManaging.notifyClientsNewSetupInfoAvailable(requiredCapabilities:)();
}

uint64_t sub_10004CFA0()
{
  return dispatch thunk of SyncedSettingsServiceManager.setSetting(value:key:)();
}

uint64_t sub_10004CFB0()
{
  return dispatch thunk of SyncedSettingsServiceManager.settingValue(for:)();
}

uint64_t sub_10004CFC0()
{
  return type metadata accessor for SyncedSettingsServiceManager();
}

uint64_t sub_10004CFD0()
{
  return static IMDWatchSatelliteSyncController.shared.getter();
}

uint64_t sub_10004CFE0()
{
  return dispatch thunk of IMDWatchSatelliteSyncController.configure(withChorosController:)();
}

uint64_t sub_10004CFF0()
{
  return type metadata accessor for IMDWatchSatelliteSyncController();
}

uint64_t sub_10004D000()
{
  return IncomingClientConnectionListener.__allocating_init(machServiceName:allowedEntitlements:requestHandlers:)();
}

uint64_t sub_10004D010()
{
  return type metadata accessor for IncomingClientConnectionListener();
}

uint64_t sub_10004D020()
{
  return IncomingIntentClientConnectionListener.__allocating_init(requestHandlers:)();
}

uint64_t sub_10004D030()
{
  return type metadata accessor for IncomingIntentClientConnectionListener();
}

uint64_t sub_10004D040()
{
  return PluginSettingsProvider.initiallyDisabledHashtagImages.getter();
}

uint64_t sub_10004D050()
{
  return PluginSettingsProvider.initiallyDisabledHashtagImages.setter();
}

uint64_t sub_10004D060()
{
  return PluginSettingsProvider.init()();
}

uint64_t sub_10004D070()
{
  return type metadata accessor for PluginSettingsProvider();
}

uint64_t sub_10004D080()
{
  return TranscodingSettingsProvider.transcodePreviews.setter();
}

uint64_t sub_10004D090()
{
  return TranscodingSettingsProvider.disableLowQualityModeOnWiFi.setter();
}

uint64_t sub_10004D0A0()
{
  return TranscodingSettingsProvider.transcodePreviewsInitialized.getter();
}

uint64_t sub_10004D0B0()
{
  return TranscodingSettingsProvider.transcodePreviewsInitialized.setter();
}

uint64_t sub_10004D0C0()
{
  return TranscodingSettingsProvider.disableLowQualityModeOnWiFiInitialized.getter();
}

uint64_t sub_10004D0D0()
{
  return TranscodingSettingsProvider.disableLowQualityModeOnWiFiInitialized.setter();
}

uint64_t sub_10004D0E0()
{
  return TranscodingSettingsProvider.init()();
}

uint64_t sub_10004D0F0()
{
  return type metadata accessor for TranscodingSettingsProvider();
}

uint64_t sub_10004D110()
{
  return type metadata accessor for SyncCoordinator();
}

uint64_t sub_10004D120()
{
  return static Logger.messagesSubsystem.getter();
}

uint64_t sub_10004D130()
{
  return Logger.logObject.getter();
}

uint64_t sub_10004D140()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10004D150()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10004D160()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10004D170()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10004D180()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10004D190()
{
  return static DispatchTime.now()();
}

uint64_t sub_10004D1A0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10004D1B0()
{
  return + infix(_:_:)();
}

NSDictionary sub_10004D1C0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10004D1D0()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10004D1E0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004D1F0()
{
  return Dictionary.description.getter();
}

NSString sub_10004D200()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10004D210()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004D220()
{
  return String.hash(into:)();
}

Swift::Int sub_10004D230()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10004D240()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10004D250()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004D260()
{
  return specialized Array._endMutation()();
}

NSNumber sub_10004D270()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_10004D280()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10004D290()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10004D2A0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10004D2B0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10004D2C0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10004D2D0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10004D2E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10004D2F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10004D300()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10004D310()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10004D320()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10004D330()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10004D340()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10004D350()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10004D360()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10004D380()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10004D390()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10004D3A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10004D3B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10004D3C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10004D3D0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10004D3E0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10004D3F0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10004D400()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10004D410()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10004D420()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10004D430()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10004D440()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10004D450()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10004D460()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10004D470()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10004D480(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10004D4A0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10004D4B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10004D4C0()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_10004D4D0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10004D4E0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10004D4F0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10004D500()
{
  return Hasher._finalize()();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IMAssociatedMessageDecodeGUID()
{
  return _IMAssociatedMessageDecodeGUID();
}

uint64_t IMBiomeQueue()
{
  return _IMBiomeQueue();
}

uint64_t IMCachesDirectoryURL()
{
  return _IMCachesDirectoryURL();
}

uint64_t IMClearDidPerformInitialChatVocabularyUpdate()
{
  return _IMClearDidPerformInitialChatVocabularyUpdate();
}

uint64_t IMComponentsFromChatGUID()
{
  return _IMComponentsFromChatGUID();
}

uint64_t IMCopyGUIDForChat()
{
  return _IMCopyGUIDForChat();
}

uint64_t IMCreateInvocationFromXPCObjectWithProtocol()
{
  return _IMCreateInvocationFromXPCObjectWithProtocol();
}

uint64_t IMCreateItemsFromSerializedArray()
{
  return _IMCreateItemsFromSerializedArray();
}

uint64_t IMCreateSerializedItemsFromArray()
{
  return _IMCreateSerializedItemsFromArray();
}

uint64_t IMDChatRecordPurgeAttachments()
{
  return _IMDChatRecordPurgeAttachments();
}

uint64_t IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef()
{
  return _IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef();
}

uint64_t IMDMessageRecordCalculateLocalCloudKitStatistics()
{
  return _IMDMessageRecordCalculateLocalCloudKitStatistics();
}

uint64_t IMDMessageRecordCopyLastReadMessageForChatIdentifier()
{
  return _IMDMessageRecordCopyLastReadMessageForChatIdentifier();
}

uint64_t IMDMessageRecordDeleteOrphanedMessages()
{
  return _IMDMessageRecordDeleteOrphanedMessages();
}

uint64_t IMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe()
{
  return _IMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe();
}

uint64_t IMDSetInconsistencyHandler()
{
  return _IMDSetInconsistencyHandler();
}

uint64_t IMGetCachedDomainIntForKeyWithDefaultValue()
{
  return _IMGetCachedDomainIntForKeyWithDefaultValue();
}

uint64_t IMGetDomainBoolForKey()
{
  return _IMGetDomainBoolForKey();
}

uint64_t IMGetDomainIntForKey()
{
  return _IMGetDomainIntForKey();
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return _IMGetXPCDictionaryFromDictionary();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return _IMGetXPCStringFromDictionary();
}

uint64_t IMGreenTeaMessageDeleteLog()
{
  return _IMGreenTeaMessageDeleteLog();
}

uint64_t IMIsRunningInAutomation()
{
  return _IMIsRunningInAutomation();
}

uint64_t IMLogHandleForCategory()
{
  return _IMLogHandleForCategory();
}

uint64_t IMLogSimulateCrashForException()
{
  return _IMLogSimulateCrashForException();
}

uint64_t IMMessageItemShouldAutomaticallySave()
{
  return _IMMessageItemShouldAutomaticallySave();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMPathsForPlugInsWithExtension()
{
  return _IMPathsForPlugInsWithExtension();
}

uint64_t IMRegisterForKeychainNotifications()
{
  return _IMRegisterForKeychainNotifications();
}

uint64_t IMRegisterSADAwareXPCActivity()
{
  return _IMRegisterSADAwareXPCActivity();
}

uint64_t IMSMSDirectoryURL()
{
  return _IMSMSDirectoryURL();
}

uint64_t IMServiceNameForCanonicalIDSAddresses()
{
  return _IMServiceNameForCanonicalIDSAddresses();
}

uint64_t IMSetDomainValueForKey()
{
  return _IMSetDomainValueForKey();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return _IMSetEmbeddedTempDirectory();
}

uint64_t IMSharedHelperGet_IMXPCCreateServerConnectionWithQueue()
{
  return _IMSharedHelperGet_IMXPCCreateServerConnectionWithQueue();
}

uint64_t IMSharedHelperMD5HashOfFileAtPath()
{
  return _IMSharedHelperMD5HashOfFileAtPath();
}

uint64_t IMSharedHelperNickNameEnabled()
{
  return _IMSharedHelperNickNameEnabled();
}

uint64_t IMSharedHelperPersonCentricMergingEnabled()
{
  return _IMSharedHelperPersonCentricMergingEnabled();
}

uint64_t IMSingleObjectArray()
{
  return _IMSingleObjectArray();
}

uint64_t IMStringFromClientCapabilities()
{
  return _IMStringFromClientCapabilities();
}

uint64_t IMWeakLinkClass()
{
  return _IMWeakLinkClass();
}

uint64_t IMWeakLinkSymbol()
{
  return _IMWeakLinkSymbol();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MobileInstallationWaitForSystemAppMigrationWithCompletion()
{
  return _MobileInstallationWaitForSystemAppMigrationWithCompletion();
}

uint64_t NSStringFromIMDCKBackupControllerResult()
{
  return _NSStringFromIMDCKBackupControllerResult();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t OSLogHandleForIMEventCategory()
{
  return _OSLogHandleForIMEventCategory();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return __CFXPCCreateCFObjectFromXPCMessage();
}

uint64_t _IMAlwaysLog()
{
  return __IMAlwaysLog();
}

uint64_t _IMDMessageRecordSetCloudKitSyncCounts()
{
  return __IMDMessageRecordSetCloudKitSyncCounts();
}

uint64_t _IMLog()
{
  return __IMLog();
}

uint64_t _IMSyncLoggingSettings()
{
  return __IMSyncLoggingSettings();
}

uint64_t _IMWillLog()
{
  return __IMWillLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t im_dispatch_after()
{
  return _im_dispatch_after();
}

uint64_t im_local_object_from_connection()
{
  return _im_local_object_from_connection();
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
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

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t pthread_dependency_init_np()
{
  return _pthread_dependency_init_np();
}

uint64_t pthread_dependency_wait_np()
{
  return _pthread_dependency_wait_np();
}

uint64_t pthread_main_thread_np()
{
  return _pthread_main_thread_np();
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return _[a1 ID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__URIsFromIDs(void *a1, const char *a2, ...)
{
  return _[a1 _URIsFromIDs];
}

id objc_msgSend___imArrayByApplyingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imArrayByApplyingBlock:");
}

id objc_msgSend___imArrayByFilteringWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imArrayByFilteringWithBlock:");
}

id objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_attributedStringByAssigningMessagePartNumbers");
}

id objc_msgSend___im_attributedStringWithFileTransfers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_attributedStringWithFileTransfers:");
}

id objc_msgSend___im_canonicalIDSIDsFromAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_canonicalIDSIDsFromAddresses");
}

id objc_msgSend___im_dateWithCurrentServerTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_dateWithCurrentServerTime");
}

id objc_msgSend___im_nanosecondTimeInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_nanosecondTimeInterval");
}

id objc_msgSend___im_visitMessageParts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_visitMessageParts:");
}

id objc_msgSend___mainThreadPostNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__mainThreadPostNotificationName:object:");
}

id objc_msgSend__addAccountsToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAccountsToSetupInfo:capabilities:context:");
}

id objc_msgSend__addApprovedCapabilitiesToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addApprovedCapabilitiesToSetupInfo:capabilities:context:");
}

id objc_msgSend__addChatCountsToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addChatCountsToSetupInfo:capabilities:context:");
}

id objc_msgSend__addChatsToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addChatsToSetupInfo:capabilities:context:");
}

id objc_msgSend__addGroupPhotoTransfersToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addGroupPhotoTransfersToSetupInfo:capabilities:context:");
}

id objc_msgSend__addKeyTransparencyToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addKeyTransparencyToSetupInfo:capabilities:context:");
}

id objc_msgSend__addTransfer_forGUID_shouldNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTransfer:forGUID:shouldNotify:");
}

id objc_msgSend__addTransfersToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTransfersToSetupInfo:capabilities:context:");
}

id objc_msgSend__allChatInfo(void *a1, const char *a2, ...)
{
  return _[a1 _allChatInfo];
}

id objc_msgSend__allFileTransfers(void *a1, const char *a2, ...)
{
  return _[a1 _allFileTransfers];
}

id objc_msgSend__attachmentFileSizeUpdateIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _attachmentFileSizeUpdateIntervalBagValue];
}

id objc_msgSend__automation_markAsReadQuery_finishedWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_automation_markAsReadQuery:finishedWithResult:");
}

id objc_msgSend__automation_sendDictionary_options_toHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_automation_sendDictionary:options:toHandles:");
}

id objc_msgSend__blackholedChatInfoForNumberOfChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blackholedChatInfoForNumberOfChats:");
}

id objc_msgSend__broadcastedUncachedAttachmentCountForChatWithGUID_chatIdentifiers_services_broadcaster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_broadcastedUncachedAttachmentCountForChatWithGUID:chatIdentifiers:services:broadcaster:");
}

id objc_msgSend__cacheChatsWithPinningIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheChatsWithPinningIdentifiers:");
}

id objc_msgSend__chatDictionariesWithLastMessageRecordDateFromDictionaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatDictionariesWithLastMessageRecordDateFromDictionaries:");
}

id objc_msgSend__chatInfoForChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatInfoForChats:");
}

id objc_msgSend__chatInfoForNumberOfChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatInfoForNumberOfChats:");
}

id objc_msgSend__chatSyncingIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _chatSyncingIntervalBagValue];
}

id objc_msgSend__chatsWithIsBlackholed_inChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatsWithIsBlackholed:inChats:");
}

id objc_msgSend__clientCapabilitiesSupportAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientCapabilitiesSupportAccounts:");
}

id objc_msgSend__downloadPurgedAttachmentsForIDs_style_onServices_chatID_retryCount_broadcaster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadPurgedAttachmentsForIDs:style:onServices:chatID:retryCount:broadcaster:");
}

id objc_msgSend__enqueueInvocationWithSync_xpcMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueInvocationWithSync:xpcMessage:");
}

id objc_msgSend__forceReloadChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forceReloadChats:");
}

id objc_msgSend__forwardMappingPacket_toID_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forwardMappingPacket:toID:account:");
}

id objc_msgSend__handleFileTransfer_acceptedWithPath_autoRename_overwrite_options_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfer:acceptedWithPath:autoRename:overwrite:options:postNotification:");
}

id objc_msgSend__handleFileTransfer_createdWithProperties_withAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfer:createdWithProperties:withAuditToken:");
}

id objc_msgSend__handleFileTransfer_updatedWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfer:updatedWithProperties:");
}

id objc_msgSend__handleFileTransferRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransferRemoved:");
}

id objc_msgSend__handleFileTransferStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransferStopped:");
}

id objc_msgSend__handleFileTransfers_autoRename_overwrite_options_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfers:autoRename:overwrite:options:postNotification:");
}

id objc_msgSend__hasFinishedTelemetrySync(void *a1, const char *a2, ...)
{
  return _[a1 _hasFinishedTelemetrySync];
}

id objc_msgSend__loadChat_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadChat:completionHandler:");
}

id objc_msgSend__loadChats_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadChats:completionHandler:");
}

id objc_msgSend__makeDeletePartsDictFor_withIndexes_withIndexToRangeMap_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeDeletePartsDictFor:withIndexes:withIndexToRangeMap:deleteDate:");
}

id objc_msgSend__messageSyncingDelayBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _messageSyncingDelayBagValue];
}

id objc_msgSend__messageSyncingIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _messageSyncingIntervalBagValue];
}

id objc_msgSend__metricsLoggingUpdateIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _metricsLoggingUpdateIntervalBagValue];
}

id objc_msgSend__numberOfChatsToLoadDuringInitialSetupFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfChatsToLoadDuringInitialSetupFromContext:");
}

id objc_msgSend__pinnedChatIdentifiersFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pinnedChatIdentifiersFromContext:");
}

id objc_msgSend__populateParentMessagesIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_populateParentMessagesIfNeeded:");
}

id objc_msgSend__portDidBecomeInvalid(void *a1, const char *a2, ...)
{
  return _[a1 _portDidBecomeInvalid];
}

id objc_msgSend__precacheChatCountWithCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_precacheChatCountWithCapabilities:");
}

id objc_msgSend__registerForAttachmentFileSizeUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAttachmentFileSizeUpdate];
}

id objc_msgSend__registerForAutoLogDump(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAutoLogDump];
}

id objc_msgSend__registerForBackupSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForBackupSyncing];
}

id objc_msgSend__registerForChatSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForChatSyncing];
}

id objc_msgSend__registerForInternalCoreTelephonyNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForInternalCoreTelephonyNotifications];
}

id objc_msgSend__registerForMessageSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForMessageSyncing];
}

id objc_msgSend__registerForMetricsLogging(void *a1, const char *a2, ...)
{
  return _[a1 _registerForMetricsLogging];
}

id objc_msgSend__registerForTelemetrySyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForTelemetrySyncing];
}

id objc_msgSend__requestGroupPhotoResendForChatGUID_fromIdentifier_toIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestGroupPhotoResendForChatGUID:fromIdentifier:toIdentifier:");
}

id objc_msgSend__retrieveLocalFileURLForFileTransferWithGUID_options_outTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:");
}

id objc_msgSend__retrieveLocalFileURLForFileTransferWithGUID_options_outTransfer_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:");
}

id objc_msgSend__serializedFileTransfersForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serializedFileTransfersForItems:");
}

id objc_msgSend__serviceWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceWithName:");
}

id objc_msgSend__setupFileTransferExplicitDownloadNotificationListenersIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _setupFileTransferExplicitDownloadNotificationListenersIfNecessary];
}

id objc_msgSend__shouldContinueDownloadingPurgedAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldContinueDownloadingPurgedAttachments:");
}

id objc_msgSend__stringForChatIDs_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForChatIDs:onServices:");
}

id objc_msgSend__updateLastMessageTimeStampForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLastMessageTimeStampForChat:");
}

id objc_msgSend__updateMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMessage:");
}

id objc_msgSend__updateParentalSettings(void *a1, const char *a2, ...)
{
  return _[a1 _updateParentalSettings];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptPendingNicknameForHandleID_updateType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPendingNicknameForHandleID:updateType:");
}

id objc_msgSend_acceptSubscriptionRequest_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptSubscriptionRequest:from:");
}

id objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:avAction:withArguments:toAVChat:isVideo:");
}

id objc_msgSend_account_buddyProperties_buddyPictures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:buddyProperties:buddyPictures:");
}

id objc_msgSend_account_chat_style_chatProperties_messageUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:chat:style:chatProperties:messageUpdated:");
}

id objc_msgSend_account_chat_style_chatProperties_messagesUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:chat:style:chatProperties:messagesUpdated:");
}

id objc_msgSend_accountForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForAccountID:");
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountInfoToPost(void *a1, const char *a2, ...)
{
  return _[a1 accountInfoToPost];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_accountsForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsForService:");
}

id objc_msgSend_activateAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAccount:");
}

id objc_msgSend_activateAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAccounts:");
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return _[a1 active];
}

id objc_msgSend_activeAccountsForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccountsForService:");
}

id objc_msgSend_activeRecords(void *a1, const char *a2, ...)
{
  return _[a1 activeRecords];
}

id objc_msgSend_activeSessions(void *a1, const char *a2, ...)
{
  return _[a1 activeSessions];
}

id objc_msgSend_addAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccount:");
}

id objc_msgSend_addAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAliases:account:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addHubbleRequestedTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHubbleRequestedTransfer:");
}

id objc_msgSend_addItem_toChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItem:toChat:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_aliasToCNIDMap(void *a1, const char *a2, ...)
{
  return _[a1 aliasToCNIDMap];
}

id objc_msgSend_allExistingChatsWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allExistingChatsWithIdentifier:");
}

id objc_msgSend_allExistingChatsWithIdentifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allExistingChatsWithIdentifier:style:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allServices(void *a1, const char *a2, ...)
{
  return _[a1 allServices];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowHandlesForSharing_onChatGUIDs_fromHandle_forceSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowHandlesForSharing:onChatGUIDs:fromHandle:forceSend:");
}

id objc_msgSend_allowListedHandlesForSharing(void *a1, const char *a2, ...)
{
  return _[a1 allowListedHandlesForSharing];
}

id objc_msgSend_allowlist(void *a1, const char *a2, ...)
{
  return _[a1 allowlist];
}

id objc_msgSend_allowlistedClasses(void *a1, const char *a2, ...)
{
  return _[a1 allowlistedClasses];
}

id objc_msgSend_anySessionForServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anySessionForServiceName:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_archivedNicknames(void *a1, const char *a2, ...)
{
  return _[a1 archivedNicknames];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByApplyingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByApplyingSelector:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedMessageGUID(void *a1, const char *a2, ...)
{
  return _[a1 associatedMessageGUID];
}

id objc_msgSend_attachmentsFilteredUsingPredicate_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentsFilteredUsingPredicate:limit:");
}

id objc_msgSend_attachmentsWithHandles_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentsWithHandles:onServices:");
}

id objc_msgSend_attachmentsWithRoomNames_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentsWithRoomNames:onServices:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authenticateAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateAccount:");
}

id objc_msgSend_autoDeletionPreference(void *a1, const char *a2, ...)
{
  return _[a1 autoDeletionPreference];
}

id objc_msgSend_autoLogin(void *a1, const char *a2, ...)
{
  return _[a1 autoLogin];
}

id objc_msgSend_autoReconnect(void *a1, const char *a2, ...)
{
  return _[a1 autoReconnect];
}

id objc_msgSend_beginChatSyncPeriodic_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginChatSyncPeriodic:activity:");
}

id objc_msgSend_beginInitialSyncWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginInitialSyncWithActivity:");
}

id objc_msgSend_beginPeriodicSyncWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginPeriodicSyncWithActivity:");
}

id objc_msgSend_beginPeriodicSyncWithChecks_priority_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginPeriodicSyncWithChecks:priority:reason:");
}

id objc_msgSend_beginUserInitiatedSync(void *a1, const char *a2, ...)
{
  return _[a1 beginUserInitiatedSync];
}

id objc_msgSend_blackholedChats(void *a1, const char *a2, ...)
{
  return _[a1 blackholedChats];
}

id objc_msgSend_blackholedChatsExist(void *a1, const char *a2, ...)
{
  return _[a1 blackholedChatsExist];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_broadcastCloudKitState(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCloudKitState];
}

id objc_msgSend_broadcastCloudKitStateAfterClearingErrors(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCloudKitStateAfterClearingErrors];
}

id objc_msgSend_broadcastCloudKitStateAfterFetchingAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCloudKitStateAfterFetchingAccountStatus];
}

id objc_msgSend_broadcastCodeStatusToClients(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCodeStatusToClients];
}

id objc_msgSend_broadcasterForACConferenceListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForACConferenceListeners];
}

id objc_msgSend_broadcasterForAVConferenceListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForAVConferenceListeners];
}

id objc_msgSend_broadcasterForAccountListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForAccountListeners];
}

id objc_msgSend_broadcasterForAllListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForAllListeners];
}

id objc_msgSend_broadcasterForChatListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForChatListeners];
}

id objc_msgSend_broadcasterForChatListenersUsingBlackholeRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcasterForChatListenersUsingBlackholeRegistry:");
}

id objc_msgSend_broadcasterForCloudSyncListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForCloudSyncListeners];
}

id objc_msgSend_broadcasterForFileProviderListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForFileProviderListeners];
}

id objc_msgSend_broadcasterForListenersSupportingService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcasterForListenersSupportingService:");
}

id objc_msgSend_buddyPictures(void *a1, const char *a2, ...)
{
  return _[a1 buddyPictures];
}

id objc_msgSend_buddyProperties(void *a1, const char *a2, ...)
{
  return _[a1 buddyProperties];
}

id objc_msgSend_cacheDeleteEnabled(void *a1, const char *a2, ...)
{
  return _[a1 cacheDeleteEnabled];
}

id objc_msgSend_cachedOverrideDatesByHandleID(void *a1, const char *a2, ...)
{
  return _[a1 cachedOverrideDatesByHandleID];
}

id objc_msgSend_cachedRampState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedRampState:");
}

id objc_msgSend_cachedSalt(void *a1, const char *a2, ...)
{
  return _[a1 cachedSalt];
}

id objc_msgSend_cancelScheduledMessageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelScheduledMessageWithGUID:");
}

id objc_msgSend_cancelScheduledMessageWithGUID_destinations_cancelType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelScheduledMessageWithGUID:destinations:cancelType:");
}

id objc_msgSend_cancelVCRequestWithPerson_properties_conference_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelVCRequestWithPerson:properties:conference:reason:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_changeGroup_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeGroup:changes:");
}

id objc_msgSend_changeGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeGroups:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_chat_lastAddressedHandleUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:lastAddressedHandleUpdated:");
}

id objc_msgSend_chat_lastAddressedSIMIDUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:lastAddressedSIMIDUpdated:");
}

id objc_msgSend_chat_lastMessageTimeStampOnLoadUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:lastMessageTimeStampOnLoadUpdated:");
}

id objc_msgSend_chat_propertiesUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:propertiesUpdated:");
}

id objc_msgSend_chat_uncachedAttachmentCountUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:uncachedAttachmentCountUpdated:");
}

id objc_msgSend_chatForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForMessage:");
}

id objc_msgSend_chatForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForMessageGUID:");
}

id objc_msgSend_chatForMessageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForMessageIdentifier:");
}

id objc_msgSend_chatIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 chatIdentifier];
}

id objc_msgSend_chatLoadedWithChatIdentifier_chats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatLoadedWithChatIdentifier:chats:");
}

id objc_msgSend_chatRecord(void *a1, const char *a2, ...)
{
  return _[a1 chatRecord];
}

id objc_msgSend_chatWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatWithGUID:");
}

id objc_msgSend_chats(void *a1, const char *a2, ...)
{
  return _[a1 chats];
}

id objc_msgSend_chatsForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatsForMessageGUID:");
}

id objc_msgSend_chatsWithHandle_onService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatsWithHandle:onService:");
}

id objc_msgSend_chatsWithRoomname_onService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatsWithRoomname:onService:");
}

id objc_msgSend_cleanUpNicknameForIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpNicknameForIDs:");
}

id objc_msgSend_cleanseAttachments(void *a1, const char *a2, ...)
{
  return _[a1 cleanseAttachments];
}

id objc_msgSend_clearAnalyticDefaultsAndLocalSyncState(void *a1, const char *a2, ...)
{
  return _[a1 clearAnalyticDefaultsAndLocalSyncState];
}

id objc_msgSend_clearCKRelatedDefaults(void *a1, const char *a2, ...)
{
  return _[a1 clearCKRelatedDefaults];
}

id objc_msgSend_clearLocalCloudKitSyncState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLocalCloudKitSyncState:");
}

id objc_msgSend_clearPendingNicknameForHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingNicknameForHandleID:");
}

id objc_msgSend_clearPendingNicknamePhotoForHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingNicknamePhotoForHandleID:");
}

id objc_msgSend_cloudKitSyncState(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitSyncState];
}

id objc_msgSend_cloudKitSyncingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitSyncingEnabled];
}

id objc_msgSend_collectLogsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 collectLogsIfNeeded];
}

id objc_msgSend_consumeCodeWithGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeCodeWithGuid:");
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsIndex:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contextStamp(void *a1, const char *a2, ...)
{
  return _[a1 contextStamp];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyAsReplied(void *a1, const char *a2, ...)
{
  return _[a1 copyAsReplied];
}

id objc_msgSend_copyFileTransferDictionaryRepresentationsFromCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyFileTransferDictionaryRepresentationsFromCenter:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyMessagesThatNeedToBeDeletedInCloudKitWithLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMessagesThatNeedToBeDeletedInCloudKitWithLimit:");
}

id objc_msgSend_coreSpotlightDeleteAttachmentGUIDs_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coreSpotlightDeleteAttachmentGUIDs:reason:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAndPersistLivePhotoBundleIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 createAndPersistLivePhotoBundleIfNecessary];
}

id objc_msgSend_createAttachmentZoneIfNeededWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAttachmentZoneIfNeededWithCompletionBlock:");
}

id objc_msgSend_createChatZoneIfNeededWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createChatZoneIfNeededWithCompletionBlock:");
}

id objc_msgSend_createNewOutgoingTransferWithLocalFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewOutgoingTransferWithLocalFileURL:");
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return _[a1 currentContext];
}

id objc_msgSend_currentStorageOnDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentStorageOnDevice];
}

id objc_msgSend_currentTelemetryVersion(void *a1, const char *a2, ...)
{
  return _[a1 currentTelemetryVersion];
}

id objc_msgSend_currentlyDownloadingSet(void *a1, const char *a2, ...)
{
  return _[a1 currentlyDownloadingSet];
}

id objc_msgSend_daemonInterface_shouldGrantAccessForPID_auditToken_portName_listenerConnection_setupInfo_setupResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonInterface:shouldGrantAccessForPID:auditToken:portName:listenerConnection:setupInfo:setupResponse:");
}

id objc_msgSend_daemonInterface_shouldGrantPlugInAccessForPID_auditToken_portName_listenerConnection_setupInfo_setupResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonInterface:shouldGrantPlugInAccessForPID:auditToken:portName:listenerConnection:setupInfo:setupResponse:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _[a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivateAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateAccount:");
}

id objc_msgSend_deactivateAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateAccounts:");
}

id objc_msgSend_declineInvitationToChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineInvitationToChatID:identifier:style:");
}

id objc_msgSend_defaultAccountSettings(void *a1, const char *a2, ...)
{
  return _[a1 defaultAccountSettings];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllZones(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllZones];
}

id objc_msgSend_deleteAttachmentZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteAttachmentZone];
}

id objc_msgSend_deleteAttachmentsWithGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAttachmentsWithGUIDs:");
}

id objc_msgSend_deleteChatSyncToken(void *a1, const char *a2, ...)
{
  return _[a1 deleteChatSyncToken];
}

id objc_msgSend_deleteChatZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteChatZone];
}

id objc_msgSend_deleteDeDupeRecordZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteDeDupeRecordZone];
}

id objc_msgSend_deleteExitRecordWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteExitRecordWithCompletion:");
}

id objc_msgSend_deleteInteractionsWithChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionsWithChatGUIDs:");
}

id objc_msgSend_deleteInteractionsWithMessageGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionsWithMessageGUIDs:");
}

id objc_msgSend_deleteMessageGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMessageGUIDs:");
}

id objc_msgSend_deleteMessagesWithChatIdentifiers_style_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMessagesWithChatIdentifiers:style:onServices:");
}

id objc_msgSend_deleteMessagesZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteMessagesZone];
}

id objc_msgSend_deleteRecoverableMessageZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteRecoverableMessageZone];
}

id objc_msgSend_deleteUpdateZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteUpdateZone];
}

id objc_msgSend_denyHandlesForSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "denyHandlesForSharing:");
}

id objc_msgSend_denyListedHandlesForSharing(void *a1, const char *a2, ...)
{
  return _[a1 denyListedHandlesForSharing];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceInformationString(void *a1, const char *a2, ...)
{
  return _[a1 deviceInformationString];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentationIncludingLastMessage(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentationIncludingLastMessage];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didAttemptToDisableAllDevicesResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAttemptToDisableAllDevicesResult:");
}

id objc_msgSend_didAttemptToDisableiCloudBackups_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAttemptToDisableiCloudBackups:error:");
}

id objc_msgSend_didFetchCloudKitSyncDebuggingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchCloudKitSyncDebuggingInfo:");
}

id objc_msgSend_didFetchRampState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchRampState:");
}

id objc_msgSend_didFetchSyncStateStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchSyncStateStats:");
}

id objc_msgSend_didPerformAdditionalStorageRequiredCheckWithSuccess_additionalStorageRequired_forAccountId_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPerformAdditionalStorageRequiredCheckWithSuccess:additionalStorageRequired:forAccountId:error:");
}

id objc_msgSend_disableAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAccount:");
}

id objc_msgSend_disableAllDevicesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAllDevicesWithCompletion:");
}

id objc_msgSend_disableService(void *a1, const char *a2, ...)
{
  return _[a1 disableService];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_downloadAttachmentAssetsForChatIDs_services_style_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAttachmentAssetsForChatIDs:services:style:completion:");
}

id objc_msgSend_downloadAttachmentAssetsWithActivity_restoringAttachments_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAttachmentAssetsWithActivity:restoringAttachments:completion:");
}

id objc_msgSend_downloadedPurgedAssetBatchForChatIDs_completedTransferGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedPurgedAssetBatchForChatIDs:completedTransferGUIDs:");
}

id objc_msgSend_dummyMethod(void *a1, const char *a2, ...)
{
  return _[a1 dummyMethod];
}

id objc_msgSend_dumpMOCLoggingMetaData(void *a1, const char *a2, ...)
{
  return _[a1 dumpMOCLoggingMetaData];
}

id objc_msgSend_eagerUploadCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eagerUploadCancel:");
}

id objc_msgSend_eagerUploadTransfer_recipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eagerUploadTransfer:recipients:");
}

id objc_msgSend_endRecordingReplayDatabase(void *a1, const char *a2, ...)
{
  return _[a1 endRecordingReplayDatabase];
}

id objc_msgSend_enrollDeviceInSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollDeviceInSMSRelay:");
}

id objc_msgSend_enrollSelfDeviceInSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 enrollSelfDeviceInSMSRelay];
}

id objc_msgSend_enumerateBatchedChatsFilteredUsingPredicate_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateBatchedChatsFilteredUsingPredicate:block:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_estimateQuotaAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimateQuotaAvailability:");
}

id objc_msgSend_evalToggleiCloudSettingsSwitch(void *a1, const char *a2, ...)
{
  return _[a1 evalToggleiCloudSettingsSwitch];
}

id objc_msgSend_evaluateAccountStateForFeatureEligibility(void *a1, const char *a2, ...)
{
  return _[a1 evaluateAccountStateForFeatureEligibility];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_existingChatWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatWithGUID:");
}

id objc_msgSend_existingChatsFilteredUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsFilteredUsingPredicate:");
}

id objc_msgSend_existingChatsFilteredUsingPredicate_sortedUsingLastMessageDateAscending_olderThan_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:");
}

id objc_msgSend_existingChatsForIDs_displayName_groupID_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsForIDs:displayName:groupID:style:");
}

id objc_msgSend_existingChatsWithGroupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsWithGroupID:");
}

id objc_msgSend_existingChatsWithPinningIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsWithPinningIdentifier:");
}

id objc_msgSend_existsAtLocalPath(void *a1, const char *a2, ...)
{
  return _[a1 existsAtLocalPath];
}

id objc_msgSend_exitRecordDateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitRecordDateWithCompletion:");
}

id objc_msgSend_fetchAccountStatusAndUpdateMiCSwitchEligibility(void *a1, const char *a2, ...)
{
  return _[a1 fetchAccountStatusAndUpdateMiCSwitchEligibility];
}

id objc_msgSend_fetchGroupPhotoPathsForChatsWithGroupIDs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchGroupPhotoPathsForChatsWithGroupIDs:completionHandler:");
}

id objc_msgSend_fetchLatestRampStateFromCK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLatestRampStateFromCK:");
}

id objc_msgSend_fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:");
}

id objc_msgSend_fetchLatestSaltWithMessageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLatestSaltWithMessageContext:");
}

id objc_msgSend_fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_limit_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:");
}

id objc_msgSend_fetchUnreadMessageRecordsForChatsFilteredUsingPredicate_limit_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:limit:completionHandler:");
}

id objc_msgSend_fileTransfer_explicitDownloadSucceededWithPath_livePhotoBundlePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransfer:explicitDownloadSucceededWithPath:livePhotoBundlePath:");
}

id objc_msgSend_fileTransferDownloadedSucceededWithLocalURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferDownloadedSucceededWithLocalURL:");
}

id objc_msgSend_fileTransferExplicitDownloadFailed_suggestedRetryGUID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferExplicitDownloadFailed:suggestedRetryGUID:error:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterediMessageChatsExist(void *a1, const char *a2, ...)
{
  return _[a1 filterediMessageChatsExist];
}

id objc_msgSend_findCommonCapabilitiesAcrossRecipients_serviceName_capsToCheck_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findCommonCapabilitiesAcrossRecipients:serviceName:capsToCheck:completion:");
}

id objc_msgSend_finishedDownloadingPurgedAssetsForChatIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedDownloadingPurgedAssetsForChatIDs:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_forceAllowlist(void *a1, const char *a2, ...)
{
  return _[a1 forceAllowlist];
}

id objc_msgSend_forcedReloadingChatRegistryWithQueryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forcedReloadingChatRegistryWithQueryID:");
}

id objc_msgSend_frequentRepliesForForChatIdentifiers_onServices_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frequentRepliesForForChatIdentifiers:onServices:limit:");
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return _[a1 groupID];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _[a1 guid];
}

id objc_msgSend_handledNicknames(void *a1, const char *a2, ...)
{
  return _[a1 handledNicknames];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_historicalMessageGUIDsDeleted_chatGUIDs_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:");
}

id objc_msgSend_historyQuery_chatID_services_finishedWithResult_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "historyQuery:chatID:services:finishedWithResult:limit:");
}

id objc_msgSend_holdBuddyUpdates(void *a1, const char *a2, ...)
{
  return _[a1 holdBuddyUpdates];
}

id objc_msgSend_ignorePendingNicknameForHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignorePendingNicknameForHandleID:");
}

id objc_msgSend_ignoredRecords(void *a1, const char *a2, ...)
{
  return _[a1 ignoredRecords];
}

id objc_msgSend_informOfCancelledScheduledMessageSendWithMessageGUID_sentSuccessfully_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informOfCancelledScheduledMessageSendWithMessageGUID:sentSuccessfully:error:");
}

id objc_msgSend_informOfDeletedConversationWithReceiverHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informOfDeletedConversationWithReceiverHandles:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithIDSHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSHandle:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithSender_time_body_attributes_fileTransferGUIDs_flags_error_guid_associatedMessageGUID_associatedMessageType_associatedMessageRange_messageSummaryInfo_threadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:");
}

id objc_msgSend_initWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnsignedInteger:");
}

id objc_msgSend_initiateSync_forceRunNow_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiateSync:forceRunNow:reply:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_internalName(void *a1, const char *a2, ...)
{
  return _[a1 internalName];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_invitePersonInfo_withMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitePersonInfo:withMessage:toChatID:identifier:style:");
}

id objc_msgSend_isAVLessSharePlayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAVLessSharePlayEnabled];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAssociatedMessageItem(void *a1, const char *a2, ...)
{
  return _[a1 isAssociatedMessageItem];
}

id objc_msgSend_isBlackholed(void *a1, const char *a2, ...)
{
  return _[a1 isBlackholed];
}

id objc_msgSend_isBusinessChat(void *a1, const char *a2, ...)
{
  return _[a1 isBusinessChat];
}

id objc_msgSend_isCorrupt(void *a1, const char *a2, ...)
{
  return _[a1 isCorrupt];
}

id objc_msgSend_isDeletingIncomingMessages(void *a1, const char *a2, ...)
{
  return _[a1 isDeletingIncomingMessages];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return _[a1 isFromMe];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isInternalInstall];
}

id objc_msgSend_isLoading(void *a1, const char *a2, ...)
{
  return _[a1 isLoading];
}

id objc_msgSend_isMessageAcknowledgment(void *a1, const char *a2, ...)
{
  return _[a1 isMessageAcknowledgment];
}

id objc_msgSend_isMessagesIniCloudVersion2(void *a1, const char *a2, ...)
{
  return _[a1 isMessagesIniCloudVersion2];
}

id objc_msgSend_isMessagesInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isMessagesInstalled];
}

id objc_msgSend_isOlderThanItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOlderThanItem:");
}

id objc_msgSend_isSticker(void *a1, const char *a2, ...)
{
  return _[a1 isSticker];
}

id objc_msgSend_itemWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithGUID:");
}

id objc_msgSend_itemsWithHandles_onServices_messageGUID_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsWithHandles:onServices:messageGUID:limit:");
}

id objc_msgSend_itemsWithHandles_onServices_messageGUID_numberOfMessagesBefore_numberOfMessagesAfter_threadIdentifier_hasMessagesBefore_hasMessagesAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsWithHandles:onServices:messageGUID:numberOfMessagesBefore:numberOfMessagesAfter:threadIdentifier:hasMessagesBefore:hasMessagesAfter:");
}

id objc_msgSend_itemsWithHandles_onServices_messageGUID_threadIdentifier_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsWithHandles:onServices:messageGUID:threadIdentifier:limit:");
}

id objc_msgSend_itemsWithRoomNames_onServices_messageGUID_threadIdentifier_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsWithRoomNames:onServices:messageGUID:threadIdentifier:limit:");
}

id objc_msgSend_joinChatID_handleInfo_identifier_style_groupID_lastAddressedHandle_lastAddressedSIMID_joinProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinChatID:handleInfo:identifier:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:");
}

id objc_msgSend_lastAddressedLocalHandle(void *a1, const char *a2, ...)
{
  return _[a1 lastAddressedLocalHandle];
}

id objc_msgSend_lastFailedMessageDate(void *a1, const char *a2, ...)
{
  return _[a1 lastFailedMessageDate];
}

id objc_msgSend_lastMessage(void *a1, const char *a2, ...)
{
  return _[a1 lastMessage];
}

id objc_msgSend_lastMessageForChatWithRowID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastMessageForChatWithRowID:");
}

id objc_msgSend_lastMessageTimeStampOnLoad(void *a1, const char *a2, ...)
{
  return _[a1 lastMessageTimeStampOnLoad];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastScheduledMessageCreatedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastScheduledMessageCreatedDate];
}

id objc_msgSend_lastTUConversationCreatedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastTUConversationCreatedDate];
}

id objc_msgSend_lastTUConversationItemForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastTUConversationItemForChat:");
}

id objc_msgSend_leaveChat_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveChat:style:");
}

id objc_msgSend_leftChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftChat:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listenerID(void *a1, const char *a2, ...)
{
  return _[a1 listenerID];
}

id objc_msgSend_loadAttachmentsForChatWithGUID_chatIdentifiers_style_services_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:");
}

id objc_msgSend_loadChatWithGUID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatWithGUID:reply:");
}

id objc_msgSend_loadChatsFilteredUsingPredicate_lastMessageOlderThan_limit_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsFilteredUsingPredicate:lastMessageOlderThan:limit:reply:");
}

id objc_msgSend_loadChatsFilteredUsingPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsFilteredUsingPredicate:reply:");
}

id objc_msgSend_loadChatsWithGroupID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsWithGroupID:reply:");
}

id objc_msgSend_loadChatsWithHandleIDs_groupID_displayName_style_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsWithHandleIDs:groupID:displayName:style:reply:");
}

id objc_msgSend_loadChatsWithIdentifier_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsWithIdentifier:reply:");
}

id objc_msgSend_loadConsumedSessionPayloadsForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadConsumedSessionPayloadsForItems:");
}

id objc_msgSend_loadFrequentRepliesForChatWithGUID_chatIdentifiers_style_services_limit_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFrequentRepliesForChatWithGUID:chatIdentifiers:style:services:limit:reply:");
}

id objc_msgSend_loadHistoryForChatWithGUID_chatIdentifiers_style_services_limit_beforeGUID_afterGUID_threadIdentifier_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:beforeGUID:afterGUID:threadIdentifier:reply:");
}

id objc_msgSend_loadIsDownloadingPurgedAttachmentsForChatWithGUID_chatIdentifiers_style_services_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadIsDownloadingPurgedAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:");
}

id objc_msgSend_loadPagedHistoryAroundMessageWithGUID_chatGUID_chatIdentifiers_style_services_numberOfMessagesBefore_numberOfMessagesAfter_threadIdentifier_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPagedHistoryAroundMessageWithGUID:chatGUID:chatIdentifiers:style:services:numberOfMessagesBefore:numberOfMessagesAfter:threadIdentifier:reply:");
}

id objc_msgSend_loadUncachedAttachmentCountForChatWithGUID_chatIdentifiers_style_services_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadUncachedAttachmentCountForChatWithGUID:chatIdentifiers:style:services:reply:");
}

id objc_msgSend_loadUnreadHistoryForChatWithGUID_chatIdentifiers_style_services_limit_fallbackMessageGUID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadUnreadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:fallbackMessageGUID:reply:");
}

id objc_msgSend_loadedChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadedChats:");
}

id objc_msgSend_loadedRecoverableMessagesMetadata_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadedRecoverableMessagesMetadata:queryID:");
}

id objc_msgSend_localPath(void *a1, const char *a2, ...)
{
  return _[a1 localPath];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_locationUpdateDelivered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationUpdateDelivered:");
}

id objc_msgSend_locationUpdateSent(void *a1, const char *a2, ...)
{
  return _[a1 locationUpdateSent];
}

id objc_msgSend_logCloudKitAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 logCloudKitAnalytics];
}

id objc_msgSend_logDumpAndSendMessageTo_forHours_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDumpAndSendMessageTo:forHours:reason:");
}

id objc_msgSend_login(void *a1, const char *a2, ...)
{
  return _[a1 login];
}

id objc_msgSend_logout(void *a1, const char *a2, ...)
{
  return _[a1 logout];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_markAllNicknamesAsPending(void *a1, const char *a2, ...)
{
  return _[a1 markAllNicknamesAsPending];
}

id objc_msgSend_markAsSpamForIDs_style_onServices_chatID_queryID_autoReport_isJunkReportedToCarrier_reportReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAsSpamForIDs:style:onServices:chatID:queryID:autoReport:isJunkReportedToCarrier:reportReason:");
}

id objc_msgSend_markAsSpamQuery_chatID_services_finishedWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAsSpamQuery:chatID:services:finishedWithResult:");
}

id objc_msgSend_markAttachment_sender_recipients_isIncoming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAttachment:sender:recipients:isIncoming:");
}

id objc_msgSend_markChatAsSpamWithGUID_chatIdentifiers_style_services_isAutoReport_isJunkReportedToCarrier_reportReason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markChatAsSpamWithGUID:chatIdentifiers:style:services:isAutoReport:isJunkReportedToCarrier:reportReason:reply:");
}

id objc_msgSend_markMessageAsReadWithGUID_callerOrigin_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessageAsReadWithGUID:callerOrigin:reply:");
}

id objc_msgSend_markMessageGUIDUnread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessageGUIDUnread:");
}

id objc_msgSend_markMessageRecordsAsReadWithGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessageRecordsAsReadWithGUIDs:");
}

id objc_msgSend_markMessagesAsReadWithChatGUIDs_upToGUID_readDate_fromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessagesAsReadWithChatGUIDs:upToGUID:readDate:fromMe:");
}

id objc_msgSend_markMessagesAsReadWithIdentifiers_onServices_chatStyle_upToGUID_readDate_fromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessagesAsReadWithIdentifiers:onServices:chatStyle:upToGUID:readDate:fromMe:");
}

id objc_msgSend_markNicknamesAsTransitionedForHandleIDs_isAutoUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markNicknamesAsTransitionedForHandleIDs:isAutoUpdate:");
}

id objc_msgSend_markPlayedForIDs_style_onServices_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markPlayedForIDs:style:onServices:message:");
}

id objc_msgSend_markProfileRecords_asActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markProfileRecords:asActive:");
}

id objc_msgSend_markProfileRecordsAsIgnored_broadcastUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markProfileRecordsAsIgnored:broadcastUpdates:");
}

id objc_msgSend_markReadForMessageGUID_callerOrigin_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markReadForMessageGUID:callerOrigin:queryID:");
}

id objc_msgSend_markSavedForIDs_style_onServices_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markSavedForIDs:style:onServices:message:");
}

id objc_msgSend_markedAsReadForMessageGUID_success_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markedAsReadForMessageGUID:success:queryID:");
}

id objc_msgSend_messageHistorySummaryForDateInterval_chatIdentifiers_chatStyle_services_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageHistorySummaryForDateInterval:chatIdentifiers:chatStyle:services:");
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return _[a1 messageID];
}

id objc_msgSend_messageItemQuery_finishedWithResult_chatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageItemQuery:finishedWithResult:chatGUIDs:");
}

id objc_msgSend_messagePartBody(void *a1, const char *a2, ...)
{
  return _[a1 messagePartBody];
}

id objc_msgSend_messagePartIndex(void *a1, const char *a2, ...)
{
  return _[a1 messagePartIndex];
}

id objc_msgSend_messageQuery_finishedWithResult_chatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageQuery:finishedWithResult:chatGUIDs:");
}

id objc_msgSend_messageSummarizationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 messageSummarizationEnabled];
}

id objc_msgSend_messageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithGUID:");
}

id objc_msgSend_messageWithGUID_registerAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithGUID:registerAttachments:");
}

id objc_msgSend_messagesThatNeedSyncWithCloudKitWithFilter_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagesThatNeedSyncWithCloudKitWithFilter:limit:");
}

id objc_msgSend_messagesWithGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagesWithGUIDs:");
}

id objc_msgSend_metricAttachmentsToPurge_withActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricAttachmentsToPurge:withActivity:");
}

id objc_msgSend_modificationStamp(void *a1, const char *a2, ...)
{
  return _[a1 modificationStamp];
}

id objc_msgSend_moveMessagesInChatsWithGUIDsToRecentlyDeleted_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveMessagesInChatsWithGUIDsToRecentlyDeleted:deleteDate:");
}

id objc_msgSend_moveMessagesWithGUIDsToRecentlyDeleted_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveMessagesWithGUIDsToRecentlyDeleted:deleteDate:");
}

id objc_msgSend_movedMessagesToRecentlyDeletedForChatsWithGUIDs_queryID_deletionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "movedMessagesToRecentlyDeletedForChatsWithGUIDs:queryID:deletionDate:");
}

id objc_msgSend_movedMessagesToRecentlyDeletedWithQueryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "movedMessagesToRecentlyDeletedWithQueryID:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkDataAvailabilityChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkDataAvailabilityChanged:");
}

id objc_msgSend_networkDataAvailable(void *a1, const char *a2, ...)
{
  return _[a1 networkDataAvailable];
}

id objc_msgSend_newAccountWithAccountDefaults_accountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAccountWithAccountDefaults:accountID:");
}

id objc_msgSend_noticeDispatcher(void *a1, const char *a2, ...)
{
  return _[a1 noticeDispatcher];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldestMessageDateForChatIdentifiers_chatStyle_services_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldestMessageDateForChatIdentifiers:chatStyle:services:");
}

id objc_msgSend_onboardDeleteVerificationCodesIfNeededWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardDeleteVerificationCodesIfNeededWithCompletionHandler:");
}

id objc_msgSend_onboardDeleteVerificationCodesIfNeededWithMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardDeleteVerificationCodesIfNeededWithMessage:completionHandler:");
}

id objc_msgSend_openStewieChatWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openStewieChatWithContext:");
}

id objc_msgSend_overrideStorageControllerWithDatabaseFromPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideStorageControllerWithDatabaseFromPath:");
}

id objc_msgSend_pagedHistoryQuery_chatID_services_numberOfMessagesBefore_numberOfMessagesAfter_finishedWithResult_hasMessagesBefore_hasMessagesAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pagedHistoryQuery:chatID:services:numberOfMessagesBefore:numberOfMessagesAfter:finishedWithResult:hasMessagesBefore:hasMessagesAfter:");
}

id objc_msgSend_participantHandles(void *a1, const char *a2, ...)
{
  return _[a1 participantHandles];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_passwordUpdatedWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordUpdatedWithAccount:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingNicknameUpdates(void *a1, const char *a2, ...)
{
  return _[a1 pendingNicknameUpdates];
}

id objc_msgSend_performInitialSyncOnFirstConnectionOfImagentIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 performInitialSyncOnFirstConnectionOfImagentIfNeeded];
}

id objc_msgSend_permanentlyDeleteRecoverableMessagesInChatsWithGUIDs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:completionHandler:");
}

id objc_msgSend_permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:");
}

id objc_msgSend_permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:queryID:");
}

id objc_msgSend_persistentProperties(void *a1, const char *a2, ...)
{
  return _[a1 persistentProperties];
}

id objc_msgSend_personCentricGroupedChatsArrayWithMaximumNumberOfChats_skipsLastMessageLoading_usingChats_useCachedChatGroups_includingPinnedChatIdentifiers_repairInconsistentMergedChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personCentricGroupedChatsArrayWithMaximumNumberOfChats:skipsLastMessageLoading:usingChats:useCachedChatGroups:includingPinnedChatIdentifiers:repairInconsistentMergedChats:");
}

id objc_msgSend_personalNickname(void *a1, const char *a2, ...)
{
  return _[a1 personalNickname];
}

id objc_msgSend_playMessageSentSoundIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playMessageSentSoundIfNeeded:");
}

id objc_msgSend_postCoreAutomationNotificationFinishedPurgingAttachments_withErrorString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postCoreAutomationNotificationFinishedPurgingAttachments:withErrorString:");
}

id objc_msgSend_postCoreAutomationNotificationWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postCoreAutomationNotificationWithAction:");
}

id objc_msgSend_preWarm(void *a1, const char *a2, ...)
{
  return _[a1 preWarm];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_previouslyBlackholedChatLoadedWithHandleIDs_chat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previouslyBlackholedChatLoadedWithHandleIDs:chat:");
}

id objc_msgSend_processReceivedEmergencyMessageFromIMTool_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processReceivedEmergencyMessageFromIMTool:message:");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_protocolChecker(void *a1, const char *a2, ...)
{
  return _[a1 protocolChecker];
}

id objc_msgSend_purgeAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeAttachments:");
}

id objc_msgSend_purgedAttachmentsCountForChatsWithChatIdentifiers_services_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgedAttachmentsCountForChatsWithChatIdentifiers:services:");
}

id objc_msgSend_qosClassWhileServicingRequestsResponse_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "qosClassWhileServicingRequestsResponse:identifier:");
}

id objc_msgSend_rampStateDictionaryFromPromoted_featureHadServerError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rampStateDictionaryFromPromoted:featureHadServerError:");
}

id objc_msgSend_readMessageStream(void *a1, const char *a2, ...)
{
  return _[a1 readMessageStream];
}

id objc_msgSend_readServerCountsFromDefaults(void *a1, const char *a2, ...)
{
  return _[a1 readServerCountsFromDefaults];
}

id objc_msgSend_rebuildLastFailedMessageDate(void *a1, const char *a2, ...)
{
  return _[a1 rebuildLastFailedMessageDate];
}

id objc_msgSend_rebuildUnreadMessageCount(void *a1, const char *a2, ...)
{
  return _[a1 rebuildUnreadMessageCount];
}

id objc_msgSend_recordMetricIsCloudKitEnabled(void *a1, const char *a2, ...)
{
  return _[a1 recordMetricIsCloudKitEnabled];
}

id objc_msgSend_recoverMessagesWithChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverMessagesWithChatGUIDs:");
}

id objc_msgSend_recoverableMessagesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 recoverableMessagesMetadata];
}

id objc_msgSend_recoveredMessagesWithChatGUIDs_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoveredMessagesWithChatGUIDs:queryID:");
}

id objc_msgSend_reflectMarkUnreadToPeerDevicesForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reflectMarkUnreadToPeerDevicesForMessageGUID:");
}

id objc_msgSend_regenerateTransfersForMessage_inChat_addingAssetWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regenerateTransfersForMessage:inChat:addingAssetWithUUID:");
}

id objc_msgSend_registerAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAccount:");
}

id objc_msgSend_registerCloudSyncDependencies(void *a1, const char *a2, ...)
{
  return _[a1 registerCloudSyncDependencies];
}

id objc_msgSend_registerForDistributedNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForDistributedNotifications];
}

id objc_msgSend_registration(void *a1, const char *a2, ...)
{
  return _[a1 registration];
}

id objc_msgSend_relay_sendCancel_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relay:sendCancel:toPerson:");
}

id objc_msgSend_relay_sendInitateRequest_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relay:sendInitateRequest:toPerson:");
}

id objc_msgSend_relay_sendUpdate_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relay:sendUpdate:toPerson:");
}

id objc_msgSend_removeAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:");
}

id objc_msgSend_removeAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAliases:account:");
}

id objc_msgSend_removeChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChat:");
}

id objc_msgSend_removeChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChatID:identifier:style:");
}

id objc_msgSend_removeIMDHandleFromRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIMDHandleFromRegistry:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removePathFromiCloudBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePathFromiCloudBackup:");
}

id objc_msgSend_removePersonInfo_chatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePersonInfo:chatID:identifier:style:");
}

id objc_msgSend_renameGroup_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renameGroup:to:");
}

id objc_msgSend_replayMessagesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replayMessagesWithCompletion:");
}

id objc_msgSend_replyProxy(void *a1, const char *a2, ...)
{
  return _[a1 replyProxy];
}

id objc_msgSend_reportMOCDebuggingErrorWithString_internalOnly_initialSync_sendToHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:");
}

id objc_msgSend_requestGroups(void *a1, const char *a2, ...)
{
  return _[a1 requestGroups];
}

id objc_msgSend_requestProperty_ofPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestProperty:ofPerson:");
}

id objc_msgSend_requestSubscriptionTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSubscriptionTo:");
}

id objc_msgSend_requestVCWithPerson_properties_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestVCWithPerson:properties:conference:");
}

id objc_msgSend_resetCKSyncState(void *a1, const char *a2, ...)
{
  return _[a1 resetCKSyncState];
}

id objc_msgSend_respondToVCInvitationWithPerson_properties_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToVCInvitationWithPerson:properties:conference:");
}

id objc_msgSend_restoreDefaultStoreControllerInstance(void *a1, const char *a2, ...)
{
  return _[a1 restoreDefaultStoreControllerInstance];
}

id objc_msgSend_resumeBuddyUpdates(void *a1, const char *a2, ...)
{
  return _[a1 resumeBuddyUpdates];
}

id objc_msgSend_retractPostedNotificationsForMessageGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retractPostedNotificationsForMessageGUIDs:");
}

id objc_msgSend_retractPostedNotificationsForMessagesMatchingChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retractPostedNotificationsForMessagesMatchingChatGUIDs:");
}

id objc_msgSend_retryGroupPhotoUpload_toChatID_identifier_style_account_isPhotoRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryGroupPhotoUpload:toChatID:identifier:style:account:isPhotoRefresh:");
}

id objc_msgSend_rowID(void *a1, const char *a2, ...)
{
  return _[a1 rowID];
}

id objc_msgSend_scheduleBackupSyncWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleBackupSyncWithDelegate:");
}

id objc_msgSend_schedulePeriodicSyncWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedulePeriodicSyncWithDelegate:");
}

id objc_msgSend_scheduleTelemetrySyncWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTelemetrySyncWithDelegate:");
}

id objc_msgSend_scheduleType(void *a1, const char *a2, ...)
{
  return _[a1 scheduleType];
}

id objc_msgSend_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:");
}

id objc_msgSend_sendAVMessageToPerson_sessionID_type_userInfo_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAVMessageToPerson:sessionID:type:userInfo:conference:");
}

id objc_msgSend_sendBalloonPayload_attachments_withMessageGUID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBalloonPayload:attachments:withMessageGUID:bundleID:");
}

id objc_msgSend_sendClearNotice_toHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendClearNotice:toHandles:");
}

id objc_msgSend_sendCommand_withProperties_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:withProperties:toPerson:");
}

id objc_msgSend_sendCommand_withProperties_toPerson_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:withProperties:toPerson:toChatID:identifier:style:");
}

id objc_msgSend_sendCounterProposalToPerson_properties_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCounterProposalToPerson:properties:conference:");
}

id objc_msgSend_sendDeleteCommand_forChatGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeleteCommand:forChatGUID:");
}

id objc_msgSend_sendEditedMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_backwardCompatabilityText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:");
}

id objc_msgSend_sendEditedScheduledMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEditedScheduledMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:");
}

id objc_msgSend_sendEditedScheduledMessage_previousMessage_retractingPartIndexes_toChatIdentifier_style_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEditedScheduledMessage:previousMessage:retractingPartIndexes:toChatIdentifier:style:account:");
}

id objc_msgSend_sendEmergencyQuestionnaire_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEmergencyQuestionnaire:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendGroupPhotoUpdate_toChatID_identifier_style_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendGroupPhotoUpdate:toChatID:identifier:style:account:");
}

id objc_msgSend_sendJunkReportMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendJunkReportMessage:");
}

id objc_msgSend_sendLazuliSpamReport_isBot_spamType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLazuliSpamReport:isBot:spamType:");
}

id objc_msgSend_sendMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendNameOnlyToHandleIDs_fromHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNameOnlyToHandleIDs:fromHandleID:");
}

id objc_msgSend_sendNicknamePreferencesDidChange(void *a1, const char *a2, ...)
{
  return _[a1 sendNicknamePreferencesDidChange];
}

id objc_msgSend_sendNotice_toHandles_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotice:toHandles:fromHandle:");
}

id objc_msgSend_sendNotificationMessageToUniqueID_withCommmand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotificationMessageToUniqueID:withCommmand:");
}

id objc_msgSend_sendNotifyRecipientCommandForMessage_toChatGuid_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotifyRecipientCommandForMessage:toChatGuid:identifier:style:");
}

id objc_msgSend_sendPlayedReceiptForMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPlayedReceiptForMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendQuestionnaire_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendQuestionnaire:");
}

id objc_msgSend_sendReadReceiptForMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendReadReceiptForMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendRecoverCommand_forChatGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRecoverCommand:forChatGUID:");
}

id objc_msgSend_sendRepositionStickerMessage_chatIdentifier_accountID_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRepositionStickerMessage:chatIdentifier:accountID:style:");
}

id objc_msgSend_sendRestoreFailuresLogDumps(void *a1, const char *a2, ...)
{
  return _[a1 sendRestoreFailuresLogDumps];
}

id objc_msgSend_sendRestoreFailuresLogDumpsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 sendRestoreFailuresLogDumpsIfNeeded];
}

id objc_msgSend_sendSavedReceiptForMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSavedReceiptForMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendSyndicationAction_toChatsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSyndicationAction:toChatsWithIdentifiers:");
}

id objc_msgSend_sendUpdatedCollaborationMetadata_toChatsWithIdentifiers_forMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdatedCollaborationMetadata:toChatsWithIdentifiers:forMessageGUID:");
}

id objc_msgSend_sendVCUpdate_toPerson_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendVCUpdate:toPerson:conference:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceDefaultsForSetup(void *a1, const char *a2, ...)
{
  return _[a1 serviceDefaultsForSetup];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceProperties(void *a1, const char *a2, ...)
{
  return _[a1 serviceProperties];
}

id objc_msgSend_serviceSession(void *a1, const char *a2, ...)
{
  return _[a1 serviceSession];
}

id objc_msgSend_serviceWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithName:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForAccount:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAllowList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowList:");
}

id objc_msgSend_setAllowlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowlist:");
}

id objc_msgSend_setAutoDeletionPreference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDeletionPreference:");
}

id objc_msgSend_setBlockIdleStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockIdleStatus:");
}

id objc_msgSend_setBlockList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockList:");
}

id objc_msgSend_setBlockingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockingMode:");
}

id objc_msgSend_setCloudKitEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudKitEnabled:");
}

id objc_msgSend_setExpireState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpireState:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setICloudBackupsDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setICloudBackupsDisabled:");
}

id objc_msgSend_setIsSticker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSticker:");
}

id objc_msgSend_setLastMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMessage:");
}

id objc_msgSend_setLastMessageTimeStampOnLoad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMessageTimeStampOnLoad:");
}

id objc_msgSend_setLastTUConversationCreatedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTUConversationCreatedDate:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPersonalNickname_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalNickname:completionBlock:");
}

id objc_msgSend_setProperties_ofParticipant_inChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperties:ofParticipant:inChatID:identifier:style:");
}

id objc_msgSend_setShouldPostNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostNotifications:");
}

id objc_msgSend_setStickerUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStickerUserInfo:");
}

id objc_msgSend_setSyncCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncCancelled:");
}

id objc_msgSend_setTimeExpressiveSendPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeExpressiveSendPlayed:");
}

id objc_msgSend_setTimePlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimePlayed:");
}

id objc_msgSend_setValue_forDomain_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forDomain:forKey:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_ofPersistentProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:ofPersistentProperty:");
}

id objc_msgSend_setValue_ofProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:ofProperty:");
}

id objc_msgSend_setValue_ofProperty_ofPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:ofProperty:ofPerson:");
}

id objc_msgSend_setWasDisabledAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasDisabledAutomatically:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupInfo(void *a1, const char *a2, ...)
{
  return _[a1 setupInfo];
}

id objc_msgSend_sharedAccountController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountController];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 sharedCoordinator];
}

id objc_msgSend_sharedFeatureFlags(void *a1, const char *a2, ...)
{
  return _[a1 sharedFeatureFlags];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInstanceForBagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstanceForBagType:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedProvider];
}

id objc_msgSend_sharedUtilities(void *a1, const char *a2, ...)
{
  return _[a1 sharedUtilities];
}

id objc_msgSend_simulateMessageReceive_serviceName_groupID_handles_sender_date_associatedMessageType_associatedMessageGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateMessageReceive:serviceName:groupID:handles:sender:date:associatedMessageType:associatedMessageGuid:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_startRecordingReplayDatabase(void *a1, const char *a2, ...)
{
  return _[a1 startRecordingReplayDatabase];
}

id objc_msgSend_startTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimingForKey:");
}

id objc_msgSend_startTrackingCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTrackingCode:");
}

id objc_msgSend_startWatchingBuddy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWatchingBuddy:");
}

id objc_msgSend_stewieEnabled(void *a1, const char *a2, ...)
{
  return _[a1 stewieEnabled];
}

id objc_msgSend_stopTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTimingForKey:");
}

id objc_msgSend_stopTranscriptSharingWithChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTranscriptSharingWithChat:");
}

id objc_msgSend_stopWatchingBuddy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWatchingBuddy:");
}

id objc_msgSend_storeItem_forceReplace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeItem:forceReplace:");
}

id objc_msgSend_storeMessage_forceReplace_modifyError_modifyFlags_flagMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:");
}

id objc_msgSend_storeMessage_forceReplace_modifyError_modifyFlags_flagMask_updateMessageCache_calculateUnreadCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:");
}

id objc_msgSend_storeRecoverableMessagePartWithBody_forMessageWithGUID_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeRecoverableMessagePartWithBody:forMessageWithGUID:deleteDate:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return _[a1 stringGUID];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_submitCloudKitAnalyticWithOperationGroupName_analyticDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supportsDatabase(void *a1, const char *a2, ...)
{
  return _[a1 supportsDatabase];
}

id objc_msgSend_syncAttachmentsWithSyncType_deviceConditionsToCheck_activity_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncAttachmentsWithSyncType:deviceConditionsToCheck:activity:completionBlock:");
}

id objc_msgSend_syncDeletesToCloudKitWithActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncDeletesToCloudKitWithActivity:completion:");
}

id objc_msgSend_syncMessagesWithSyncType_deviceConditionsToCheck_activity_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncMessagesWithSyncType:deviceConditionsToCheck:activity:completionBlock:");
}

id objc_msgSend_syncState(void *a1, const char *a2, ...)
{
  return _[a1 syncState];
}

id objc_msgSend_syncStateDebuggingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncStateDebuggingInfo:");
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _[a1 syncType];
}

id objc_msgSend_synchronousDatabase(void *a1, const char *a2, ...)
{
  return _[a1 synchronousDatabase];
}

id objc_msgSend_systemDidLeaveFirstDataProtectionLock(void *a1, const char *a2, ...)
{
  return _[a1 systemDidLeaveFirstDataProtectionLock];
}

id objc_msgSend_tearDownToneNotificationSessionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 tearDownToneNotificationSessionIfNeeded];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 threadIdentifier];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _[a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRead(void *a1, const char *a2, ...)
{
  return _[a1 timeRead];
}

id objc_msgSend_toggleiCloudBackupsIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleiCloudBackupsIfNeeded:");
}

id objc_msgSend_trackEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackEvent:");
}

id objc_msgSend_trackSpamEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackSpamEvent:");
}

id objc_msgSend_transferForGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferForGUID:");
}

id objc_msgSend_transitionedHandles(void *a1, const char *a2, ...)
{
  return _[a1 transitionedHandles];
}

id objc_msgSend_unEnrollDeviceInSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unEnrollDeviceInSMSRelay:");
}

id objc_msgSend_uncachedAttachmentCountQuery_chatID_services_finishedWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uncachedAttachmentCountQuery:chatID:services:finishedWithResult:");
}

id objc_msgSend_unknownSenderRecordInfo(void *a1, const char *a2, ...)
{
  return _[a1 unknownSenderRecordInfo];
}

id objc_msgSend_unreadCount(void *a1, const char *a2, ...)
{
  return _[a1 unreadCount];
}

id objc_msgSend_unreadMessagesCount(void *a1, const char *a2, ...)
{
  return _[a1 unreadMessagesCount];
}

id objc_msgSend_unreadMessagesWithHandles_onServices_limit_fallbackGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadMessagesWithHandles:onServices:limit:fallbackGUID:");
}

id objc_msgSend_unreadMessagesWithRoomNames_onServices_limit_fallbackGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadMessagesWithRoomNames:onServices:limit:fallbackGUID:");
}

id objc_msgSend_unregisterAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterAccount:");
}

id objc_msgSend_unvalidateAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unvalidateAliases:account:");
}

id objc_msgSend_updateAccountActivation(void *a1, const char *a2, ...)
{
  return _[a1 updateAccountActivation];
}

id objc_msgSend_updateAttachmentFileSizesWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAttachmentFileSizesWithActivity:");
}

id objc_msgSend_updateAuthorizationCredentials_token_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAuthorizationCredentials:token:account:");
}

id objc_msgSend_updateBalloonPayload_attachments_forMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBalloonPayload:attachments:forMessageGUID:");
}

id objc_msgSend_updateCloudKitStateWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCloudKitStateWithDictionary:");
}

id objc_msgSend_updateDisplayName_fromDisplayName_fromID_forChatID_identifier_style_messageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:");
}

id objc_msgSend_updateHasHadSuccessfulQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHasHadSuccessfulQuery:");
}

id objc_msgSend_updateIsBlackholed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsBlackholed:");
}

id objc_msgSend_updateIsDeletingIncomingMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsDeletingIncomingMessages:");
}

id objc_msgSend_updateIsFiltered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsFiltered:");
}

id objc_msgSend_updateIsRecovered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsRecovered:");
}

id objc_msgSend_updateLastAddressedHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastAddressedHandle:");
}

id objc_msgSend_updateLastAddressedSIMID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastAddressedSIMID:");
}

id objc_msgSend_updateLastKnownHybridStateAndRemergeIfAppropriate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastKnownHybridStateAndRemergeIfAppropriate:");
}

id objc_msgSend_updateLastReadMessageTimeStampIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastReadMessageTimeStampIfNeeded:");
}

id objc_msgSend_updateLastSeenMessageGuidIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastSeenMessageGuidIfNeeded:");
}

id objc_msgSend_updateMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMessage:");
}

id objc_msgSend_updateProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProperties:");
}

id objc_msgSend_updateStamp(void *a1, const char *a2, ...)
{
  return _[a1 updateStamp];
}

id objc_msgSend_updateStateForChat_forcePost_shouldRebuildFailedMessageDate_setUnreadCountToZero_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:setUnreadCountToZero:");
}

id objc_msgSend_updateStateForChat_forcePost_shouldRebuildFailedMessageDate_shouldCalculateUnreadCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:");
}

id objc_msgSend_updateStateForChat_hintMessage_shouldRebuildFailedMessageDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:");
}

id objc_msgSend_updateStateForChat_hintMessage_shouldRebuildFailedMessageDate_shouldCalculateUnreadCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:");
}

id objc_msgSend_updateUnformattedID_forBuddyID_onService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUnformattedID:forBuddyID:onService:");
}

id objc_msgSend_updateVocabularyForDeletedChat_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVocabularyForDeletedChat:completionHandler:");
}

id objc_msgSend_uploadDailyAnalyticstoCloudKit(void *a1, const char *a2, ...)
{
  return _[a1 uploadDailyAnalyticstoCloudKit];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validateAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateAliases:account:");
}

id objc_msgSend_validateProfileWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateProfileWithAccount:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueOfPersistentProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueOfPersistentProperty:");
}

id objc_msgSend_valueOfProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueOfProperty:");
}

id objc_msgSend_wasDisabledAutomatically(void *a1, const char *a2, ...)
{
  return _[a1 wasDisabledAutomatically];
}

id objc_msgSend_wasReportedAsJunk(void *a1, const char *a2, ...)
{
  return _[a1 wasReportedAsJunk];
}

id objc_msgSend_willMoveChatToRecentlyDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveChatToRecentlyDeleted:");
}

id objc_msgSend_willRemoveChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willRemoveChat:");
}

id objc_msgSend_writeAccountDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeAccountDefaults:");
}

id objc_msgSend_writeExitRecordWithDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeExitRecordWithDate:completion:");
}