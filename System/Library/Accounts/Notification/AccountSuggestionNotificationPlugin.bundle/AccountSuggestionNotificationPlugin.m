id sub_3170()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountSuggestionNotificationPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountSuggestionNotificationPlugin()
{
  return self;
}

uint64_t sub_31D8(void *a1, int a2, void *a3)
{
  id v34 = a3;
  id v35 = a1;
  uint64_t v5 = sub_36D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  v12 = (char *)&v33 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  v15 = (char *)&v33 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v33 - v16;
  sub_36B0();
  if (sub_3650())
  {
    uint64_t v33 = v3;
    sub_3670();
    v18 = sub_36C0();
    os_log_type_t v19 = sub_36E0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v20 = 67109120;
      int v36 = a2;
      sub_36F0();
      _os_log_impl(&dword_0, v18, v19, "AccountSuggestionNotificationPlugin called with changeType %u", v20, 8u);
      swift_slowDealloc();
    }

    v21 = *(void (**)(char *, uint64_t))(v6 + 8);
    v21(v15, v5);
    switch(a2)
    {
      case 3:
        if (v34)
        {
          id v22 = v34;
          swift_retain();
          sub_3690();
          goto LABEL_16;
        }
        break;
      case 2:
        if (v35)
        {
          id v22 = v35;
          swift_retain();
          sub_36A0();
          goto LABEL_16;
        }
        break;
      case 1:
        if (v35)
        {
          id v22 = v35;
          swift_retain();
          sub_3660();
LABEL_16:

          swift_release();
        }
        break;
      default:
        sub_3670();
        v27 = sub_36C0();
        os_log_type_t v28 = sub_36E0();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_0, v27, v28, "unknown change type??", v29, 2u);
          swift_slowDealloc();
        }

        v21(v12, v5);
        break;
    }
    sub_3670();
    v30 = sub_36C0();
    os_log_type_t v31 = sub_36E0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_0, v30, v31, "AccountSuggestionNotificationPlugin finished", v32, 2u);
      swift_slowDealloc();
    }

    return ((uint64_t (*)(char *, uint64_t))v21)(v9, v5);
  }
  sub_3670();
  v23 = sub_36C0();
  os_log_type_t v24 = sub_36E0();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_0, v23, v24, "Feature disabled", v25, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v17, v5);
}

uint64_t sub_3650()
{
  return dispatch thunk of static AccountSuggestionManager.featureEnabled()();
}

uint64_t sub_3660()
{
  return dispatch thunk of AccountSuggestionManager.added(_:)();
}

uint64_t sub_3670()
{
  return static AccountSuggestionManager.logger.getter();
}

uint64_t sub_3680()
{
  return AccountSuggestionManager.init(uiMode:)();
}

uint64_t sub_3690()
{
  return dispatch thunk of AccountSuggestionManager.removed(_:)();
}

uint64_t sub_36A0()
{
  return dispatch thunk of AccountSuggestionManager.updated(_:)();
}

uint64_t sub_36B0()
{
  return type metadata accessor for AccountSuggestionManager();
}

uint64_t sub_36C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_36D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_36E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_36F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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