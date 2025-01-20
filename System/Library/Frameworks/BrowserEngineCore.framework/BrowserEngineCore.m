uint64_t be_memory_inline_jit_restrict_rwx_to_rw_with_witness_impl(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  __dmb(0xAu);
  if (MEMORY[0xFFFFFC10C] == 1) {
    _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC110]);
  }
  else {
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC110]);
  }
  __dmb(0xAu);
  __isb(0xFu);
  if (a2 == 4868436 && v2 == result) {
    return 0;
  }
  __break(0xC471u);
  return result;
}

uint64_t be_memory_inline_jit_restrict_rwx_to_rx_with_witness_impl()
{
  __dmb(0xAu);
  uint64_t v0 = MEMORY[0xFFFFFC118];
  if (MEMORY[0xFFFFFC10C] == 1)
  {
    _WriteStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7), MEMORY[0xFFFFFC118]);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 2, 7));
  }
  else
  {
    _WriteStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5), MEMORY[0xFFFFFC118]);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 6, 15, 1, 5));
  }
  if (v0 != StatusReg)
  {
    __break(0xC471u);
    JUMPOUT(0x2432364C8);
  }
  __isb(0xFu);
  return 0;
}

uint64_t AuditToken.pid.getter()
{
  long long v1 = v0[1];
  *(_OWORD *)v3.val = *v0;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3);
}

void __swiftcall AuditToken.init(_:)(BrowserEngineCore::AuditToken *__return_ptr retstr, audit_token_t *a2)
{
  *(void *)retstr->inner.val = a2;
  *(void *)&retstr->inner.val[2] = v2;
  *(void *)&retstr->inner.val[4] = v3;
  *(void *)&retstr->inner.val[6] = v4;
}

ValueMetadata *type metadata accessor for AuditToken()
{
  return &type metadata for AuditToken;
}

BOOL be_memory_inline_jit_restrict_with_witness_supported()
{
  return MEMORY[0xFFFFFC10C] && MEMORY[0xFFFFFC10C] - 1 < 3;
}

BOOL _BECheckEntitlmentForAuditToken(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  return +[_BESwiftCBridge checkEntitlement:a1 forAuditToken:v4];
}

BOOL _BECheckEntitlmentForCurrentProcess(uint64_t a1)
{
  return +[_BESwiftCBridge checkEntitlementForCurrentProcess:a1];
}

BrowserEngineCore::BrowserEngineEntitlement_optional __swiftcall BrowserEngineEntitlement.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  if (rawValue._countAndFlagsBits == 0xD00000000000002BLL && rawValue._object == (void *)0x8000000243237A80
    || (sub_2432376D8() & 1) != 0)
  {
    result.value = swift_bridgeObjectRelease();
    char v6 = 0;
  }
  else if (countAndFlagsBits == 0xD000000000000031 && object == (void *)0x8000000243237AB0 {
         || (sub_2432376D8() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v6 = 1;
  }
  else if (countAndFlagsBits == 0xD000000000000031 && object == (void *)0x8000000243237AF0 {
         || (sub_2432376D8() & 1) != 0)
  }
  {
    result.value = swift_bridgeObjectRelease();
    char v6 = 2;
  }
  else if (countAndFlagsBits == 0xD000000000000030 && object == (void *)0x8000000243237B30)
  {
    result.value = swift_bridgeObjectRelease();
    char v6 = 3;
  }
  else
  {
    char v7 = sub_2432376D8();
    result.value = swift_bridgeObjectRelease();
    if (v7) {
      char v6 = 3;
    }
    else {
      char v6 = 4;
    }
  }
  *uint64_t v4 = v6;
  return result;
}

unint64_t BrowserEngineEntitlement.rawValue.getter()
{
  unint64_t result = 0xD00000000000002BLL;
  switch(*v0)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000031;
      break;
    case 3:
      unint64_t result = 0xD000000000000030;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t BrowserEngineEntitlement.description.getter()
{
  unint64_t result = 0xD00000000000002BLL;
  switch(*v0)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000031;
      break;
    case 3:
      unint64_t result = 0xD000000000000030;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2432368F0(unsigned __int8 *a1, char *a2)
{
  return sub_243236954(*a1, *a2);
}

unint64_t sub_243236900()
{
  unint64_t result = qword_268D8EC38;
  if (!qword_268D8EC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8EC38);
  }
  return result;
}

uint64_t sub_243236954(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD00000000000002BLL;
  unint64_t v3 = 0x8000000243237A80;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD00000000000002BLL;
  switch(v4)
  {
    case 1:
      char v6 = "com.apple.developer.web-browser-engine.webcontent";
      goto LABEL_4;
    case 2:
      char v6 = "com.apple.developer.web-browser-engine.networking";
LABEL_4:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000031;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000030;
      unint64_t v3 = 0x8000000243237B30;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x8000000243237A80;
  switch(a2)
  {
    case 1:
      v8 = "com.apple.developer.web-browser-engine.webcontent";
      goto LABEL_9;
    case 2:
      v8 = "com.apple.developer.web-browser-engine.networking";
LABEL_9:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      unint64_t v2 = 0xD000000000000031;
      goto LABEL_10;
    case 3:
      unint64_t v7 = 0x8000000243237B30;
      if (v5 == 0xD000000000000030) {
        goto LABEL_13;
      }
      goto LABEL_15;
    default:
LABEL_10:
      if (v5 != v2) {
        goto LABEL_15;
      }
LABEL_13:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_15:
      }
        char v9 = sub_2432376D8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_243236ACC()
{
  return sub_243236AD4();
}

uint64_t sub_243236AD4()
{
  return sub_2432376F8();
}

uint64_t sub_243236BB8()
{
  return sub_243236BC0();
}

uint64_t sub_243236BC0()
{
  sub_2432376B8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_243236C88()
{
  return sub_243236C90();
}

uint64_t sub_243236C90()
{
  return sub_2432376F8();
}

BrowserEngineCore::BrowserEngineEntitlement_optional sub_243236D70(Swift::String *a1)
{
  return BrowserEngineEntitlement.init(rawValue:)(*a1);
}

unint64_t sub_243236D7C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = BrowserEngineEntitlement.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrowserEngineEntitlement(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BrowserEngineEntitlement(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x243236F10);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_243236F38(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_243236F44(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BrowserEngineEntitlement()
{
  return &type metadata for BrowserEngineEntitlement;
}

uint64_t initializeBufferWithCopyOfBuffer for AuditToken(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AuditToken(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AuditToken(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t()
{
  if (!qword_268D8EC40)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268D8EC40);
    }
  }
}

long long *sub_243237040()
{
  __n128 result = (long long *)objc_msgSend(self, sel_auditTokenForCurrentProcess);
  if (result)
  {
    long long v1 = result[1];
    xmmword_268D8EC48 = *result;
    *(_OWORD *)&qword_268D8EC58 = v1;
  }
  else
  {
    __n128 result = (long long *)sub_2432376C8();
    __break(1u);
  }
  return result;
}

double static AuditToken.current.getter@<D0>(_OWORD *a1@<X8>)
{
  if (qword_268D8EC30 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_268D8EC48;
  long long v3 = *(_OWORD *)&qword_268D8EC58;
  *a1 = xmmword_268D8EC48;
  a1[1] = v3;
  return result;
}

uint64_t AuditToken.inner.getter()
{
  return *(void *)v0;
}

uint64_t sub_243237140()
{
  sub_2432376A8();
  uint64_t v0 = xpc_copy_entitlement_for_token();
  swift_release();
  if (!v0) {
    return 2;
  }
  uint64_t result = _CFXPCCreateCFObjectFromXPCObject();
  if (result)
  {
    swift_unknownObjectRelease();
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 2;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall AuditToken.has(browserEngineEntitlement:)(BrowserEngineCore::BrowserEngineEntitlement browserEngineEntitlement)
{
  char v1 = sub_243237140();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

id sub_2432373D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwiftCBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SwiftCBridge()
{
  return self;
}

uint64_t sub_243237430(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  v4._uint64_t countAndFlagsBits = a1;
  v4._object = a2;
  BrowserEngineEntitlement.init(rawValue:)(v4);
  uint64_t v5 = 0;
  switch(v8)
  {
    case 4:
      return v5;
    default:
      char v6 = sub_243237140();
      swift_bridgeObjectRelease();
      uint64_t v5 = v6 & 1;
      break;
  }
  return v5;
}

uint64_t sub_24323755C(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  v4._uint64_t countAndFlagsBits = a1;
  v4._object = a2;
  BrowserEngineEntitlement.init(rawValue:)(v4);
  if (v7 == 4) {
    return 0;
  }
  if (qword_268D8EC30 != -1) {
    swift_once();
  }
  char v6 = sub_243237140();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_243237698()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2432376A8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2432376B8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2432376C8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2432376D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2432376E8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2432376F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}