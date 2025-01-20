uint64_t sub_1C1C()
{
  return 1;
}

Swift::Int sub_1C24()
{
  return sub_3078();
}

void sub_1C68()
{
}

Swift::Int sub_1C90()
{
  return sub_3078();
}

const char *sub_1CD0()
{
  return "Wallet";
}

const char *sub_1CE4()
{
  return "DeletePassesOnSignout";
}

id sub_1ED8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PassbookDataclassOwner()
{
  return self;
}

uint64_t sub_1F34(uint64_t a1, uint64_t a2)
{
  return sub_21AC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1F4C(uint64_t a1, id *a2)
{
  uint64_t result = sub_2FC8();
  *a2 = 0;
  return result;
}

uint64_t sub_1FC4(uint64_t a1, id *a2)
{
  char v3 = sub_2FD8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2044@<X0>(void *a1@<X8>)
{
  sub_2FE8();
  NSString v2 = sub_2FB8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2088@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_2FB8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2FE8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20FC(uint64_t a1)
{
  uint64_t v2 = sub_2F34(&qword_8680);
  uint64_t v3 = sub_2F34(&qword_8688);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_2194(uint64_t a1, uint64_t a2)
{
  return sub_21AC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_21AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2FE8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21F0()
{
  sub_2FE8();
  sub_2FF8();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_2244()
{
  sub_2FE8();
  sub_3058();
  sub_2FF8();
  Swift::Int v0 = sub_3078();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22B8()
{
  uint64_t v0 = sub_2FE8();
  uint64_t v2 = v1;
  if (v0 == sub_2FE8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_3048();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

id sub_2344()
{
  uint64_t v0 = sub_2FA8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v31[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  v7 = (char *)&v31[-1] - v6;
  __chkstk_darwin(v5);
  v9 = (char *)&v31[-1] - v8;
  v31[3] = &type metadata for WalletFeatureFlag;
  v31[4] = sub_2B88();
  char v10 = sub_2F78();
  sub_2BDC(v31);
  char v11 = PKIsPhone();
  if ((v10 & 1) == 0)
  {
    sub_2F88();
    v20 = sub_2F98();
    os_log_type_t v21 = sub_3028();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "actionsForDeletingAccount - Feature disabled", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
    sub_2C2C(&qword_8648);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_32A0;
    id result = [self actionWithType:0];
    if (result)
    {
      id v23 = result;
      *(void *)(v15 + 56) = sub_2C70();
      *(void *)(v15 + 32) = v23;
      return (id)v15;
    }
    __break(1u);
    goto LABEL_20;
  }
  if (v11)
  {
    sub_2F88();
    v12 = sub_2F98();
    os_log_type_t v13 = sub_3028();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "actionsForDeletingAccount - Pass deletion enabled", v14, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    sub_2C2C(&qword_8648);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_32C0;
    v16 = self;
    id result = [v16 destructiveActionWithType:3];
    if (result)
    {
      id v18 = result;
      unint64_t v19 = sub_2C70();
      *(void *)(v15 + 56) = v19;
      *(void *)(v15 + 32) = v18;
      id result = [v16 actionWithType:2];
      if (result)
      {
        *(void *)(v15 + 88) = v19;
        *(void *)(v15 + 64) = result;
        id result = [v16 actionWithType:0];
        if (result)
        {
          *(void *)(v15 + 120) = v19;
          *(void *)(v15 + 96) = result;
          return (id)v15;
        }
        goto LABEL_22;
      }
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_2F88();
  v24 = sub_2F98();
  os_log_type_t v25 = sub_3028();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_0, v24, v25, "actionsForDeletingAccount - Platform unsupported", v26, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v7, v0);
  sub_2C2C(&qword_8648);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_32B0;
  v27 = self;
  id result = [v27 destructiveActionWithType:3];
  if (!result) {
    goto LABEL_23;
  }
  id v28 = result;
  unint64_t v29 = sub_2C70();
  *(void *)(v15 + 56) = v29;
  *(void *)(v15 + 32) = v28;
  id result = [v27 actionWithType:0];
  if (result)
  {
    *(void *)(v15 + 88) = v29;
    *(void *)(v15 + 64) = result;
    return (id)v15;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_27E4(void *a1)
{
  uint64_t v2 = sub_2FA8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  v9 = (char *)&v29 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  v12 = (char *)&v29 - v11;
  uint64_t result = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v29 - v14;
  if (a1)
  {
    unint64_t v16 = (unint64_t)[a1 type];
    if (v16 > 8)
    {
      sub_2F88();
      v26 = sub_2F98();
      os_log_type_t v27 = sub_3028();
      if (os_log_type_enabled(v26, v27))
      {
        id v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v28 = 0;
        _os_log_impl(&dword_0, v26, v27, "performActionForAccount - Unknown Default", v28, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    else if (((1 << v16) & 0x1F2) != 0)
    {
      sub_2F88();
      v17 = sub_2F98();
      os_log_type_t v18 = sub_3028();
      if (os_log_type_enabled(v17, v18))
      {
        unint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v19 = 0;
        _os_log_impl(&dword_0, v17, v18, "performActionForAccount - Unexpected DataclassAction", v19, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
    else
    {
      if (((1 << v16) & 5) != 0)
      {
        sub_2F88();
        v20 = sub_2F98();
        os_log_type_t v21 = sub_3028();
        if (os_log_type_enabled(v20, v21))
        {
          v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_0, v20, v21, "performActionForAccount - Disabling pass deletion flag", v22, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
      }
      else
      {
        sub_2F88();
        id v23 = sub_2F98();
        os_log_type_t v24 = sub_3028();
        if (os_log_type_enabled(v23, v24))
        {
          os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v25 = 0;
          _os_log_impl(&dword_0, v23, v24, "performActionForAccount - Enabling pass deletion flag", v25, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v15, v2);
      }
      PKSetiCloudSignoutShouldDeleteLocalData();
    }
    return 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2B88()
{
  unint64_t result = qword_86F0;
  if (!qword_86F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_86F0);
  }
  return result;
}

uint64_t sub_2BDC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2C2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_2C70()
{
  unint64_t result = qword_8650;
  if (!qword_8650)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_8650);
  }
  return result;
}

void type metadata accessor for Dataclass()
{
  if (!qword_8660)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_8660);
    }
  }
}

uint64_t getEnumTagSinglePayload for WalletFeatureFlag(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for WalletFeatureFlag(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2DFCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2E24()
{
  return 0;
}

ValueMetadata *type metadata accessor for WalletFeatureFlag()
{
  return &type metadata for WalletFeatureFlag;
}

unint64_t sub_2E44()
{
  unint64_t result = qword_86F8[0];
  if (!qword_86F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_86F8);
  }
  return result;
}

uint64_t sub_2E98()
{
  return sub_2F34(&qword_8668);
}

uint64_t sub_2ECC()
{
  return sub_2F34(&qword_8670);
}

uint64_t sub_2F00()
{
  return sub_2F34(&qword_8678);
}

uint64_t sub_2F34(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Dataclass();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2F78()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_2F88()
{
  return static Logger.account.getter();
}

uint64_t sub_2F98()
{
  return Logger.logObject.getter();
}

uint64_t sub_2FA8()
{
  return type metadata accessor for Logger();
}

NSString sub_2FB8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_2FC8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2FD8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2FE8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2FF8()
{
  return String.hash(into:)();
}

NSArray sub_3008()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_3018()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3028()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_3048()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_3058()
{
  return Hasher.init(_seed:)();
}

void sub_3068(Swift::UInt a1)
{
}

Swift::Int sub_3078()
{
  return Hasher._finalize()();
}

uint64_t PKIsPhone()
{
  return _PKIsPhone();
}

uint64_t PKSetiCloudSignoutShouldDeleteLocalData()
{
  return _PKSetiCloudSignoutShouldDeleteLocalData();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}