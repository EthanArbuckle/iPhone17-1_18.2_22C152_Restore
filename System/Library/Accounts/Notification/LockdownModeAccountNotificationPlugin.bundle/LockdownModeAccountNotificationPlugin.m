id sub_242773144()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Plugin()
{
  return self;
}

uint64_t sub_24277319C()
{
  uint64_t v0 = sub_242773690();
  sub_24277360C(v0, qword_268D56618);
  sub_2427735D4(v0, (uint64_t)qword_268D56618);
  return sub_242773680();
}

void sub_24277321C(void *a1, int a2, void *a3)
{
  if (!a1) {
    goto LABEL_19;
  }
  id v6 = objc_msgSend(a1, sel_accountType);
  if (!v6)
  {
    __break(1u);
    return;
  }
  v7 = v6;
  id v8 = objc_msgSend(v6, sel_identifier);

  if (!v8)
  {
LABEL_19:
    sub_2427736A0();
    goto LABEL_20;
  }
  uint64_t v9 = sub_2427736A0();
  uint64_t v11 = v10;

  uint64_t v12 = sub_2427736A0();
  if (!v11)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    return;
  }
  if (v9 == v12 && v11 == v13)
  {
    swift_bridgeObjectRelease_n();
    if (a2 != 2)
    {
LABEL_11:
      if (a2 == 1)
      {
        if (qword_268D56610 != -1) {
          swift_once();
        }
        uint64_t v16 = sub_242773690();
        sub_2427735D4(v16, (uint64_t)qword_268D56618);
        v17 = sub_242773670();
        os_log_type_t v18 = sub_2427736B0();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_242771000, v17, v18, "LockdownModeAccountNotificationPlugin: account added", v19, 2u);
          MEMORY[0x24566C830](v19, -1, -1);
        }

        notify_post("com.apple.LockdownMode.accountChanged");
      }
      return;
    }
  }
  else
  {
    char v15 = sub_2427736C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      return;
    }
    if (a2 != 2) {
      goto LABEL_11;
    }
  }
  if (a3)
  {
    v20 = self;
    id v21 = a1;
    id v30 = a3;
    id v22 = objc_msgSend(v20, sel_sharedInstance);
    id v23 = objc_msgSend(v22, sel_securityLevelForAccount_, v30);

    if (v23 != (id)4)
    {
      id v24 = objc_msgSend(v20, sel_sharedInstance);
      id v25 = objc_msgSend(v24, sel_securityLevelForAccount_, v21);

      if (v25 == (id)4)
      {
        if (qword_268D56610 != -1) {
          swift_once();
        }
        uint64_t v26 = sub_242773690();
        sub_2427735D4(v26, (uint64_t)qword_268D56618);
        v27 = sub_242773670();
        os_log_type_t v28 = sub_2427736B0();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_242771000, v27, v28, "LockdownModeAccountNotificationPlugin: account is now eligible", v29, 2u);
          MEMORY[0x24566C830](v29, -1, -1);
        }

        notify_post("com.apple.LockdownMode.accountChanged");
      }
    }
  }
}

uint64_t sub_2427735D4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_24277360C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_242773670()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_242773680()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_242773690()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2427736A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2427736B0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2427736C0()
{
  return MEMORY[0x270F9F7D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}