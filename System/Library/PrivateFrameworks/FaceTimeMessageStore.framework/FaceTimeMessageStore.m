void sub_100003380()
{
  char *v0;
  char v1[1024];

  if ((_set_user_dir_suffix() & 1) == 0
    || (bzero(v1, 0x400uLL), !confstr(65537, v1, 0x400uLL))
    || (v0 = realpath_DARWIN_EXTSN(v1, 0)) == 0)
  {
    exit(1);
  }
  free(v0);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003380();
  sub_100003654(v3, qword_100008028);
  sub_1000036B8(v3, (uint64_t)qword_100008028);
  getUserDataStoreDirectoryURL()();
  URL.appendingPathComponent(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v7 = [self defaultManager];
  URL._bridgeToObjectiveC()(v8);
  v10 = v9;
  id v21 = 0;
  unsigned int v11 = [v7 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v21];

  id v12 = v21;
  if (v11)
  {
    id v13 = objc_allocWithZone((Class)type metadata accessor for MessageStoreProviderServiceDelegate());
    id v14 = v12;
    qword_100008040 = MessageStoreProviderServiceDelegate.init(listener:messageStoreServer:)();
    id v15 = [objc_allocWithZone((Class)type metadata accessor for VideoMessagingServiceDelegate()) init];
    qword_100008048 = (uint64_t)v15;
    dispatch thunk of MessageStoreProviderServiceDelegate.setupListener()();
    dispatch thunk of VideoMessagingServiceDelegate.setupListener()();
    v16 = self;
    id v17 = v15;
    id v18 = [v16 currentRunLoop];
    [v18 run];

    exit(0);
  }
  id v19 = v21;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  exit(1);
}

uint64_t *sub_100003654(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000036B8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t getUserDataStoreDirectoryURL()()
{
  return getUserDataStoreDirectoryURL()();
}

uint64_t dispatch thunk of MessageStoreProviderServiceDelegate.setupListener()()
{
  return dispatch thunk of MessageStoreProviderServiceDelegate.setupListener()();
}

uint64_t MessageStoreProviderServiceDelegate.init(listener:messageStoreServer:)()
{
  return MessageStoreProviderServiceDelegate.init(listener:messageStoreServer:)();
}

uint64_t type metadata accessor for MessageStoreProviderServiceDelegate()
{
  return type metadata accessor for MessageStoreProviderServiceDelegate();
}

uint64_t dispatch thunk of VideoMessagingServiceDelegate.setupListener()()
{
  return dispatch thunk of VideoMessagingServiceDelegate.setupListener()();
}

uint64_t type metadata accessor for VideoMessagingServiceDelegate()
{
  return type metadata accessor for VideoMessagingServiceDelegate();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}