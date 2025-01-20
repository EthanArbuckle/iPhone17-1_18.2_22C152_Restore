void sub_100005378()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  Class isa;
  id v45[2];
  _OWORD v46[2];
  void v47[4];

  v1 = v0;
  v2 = sub_1000068C8(&qword_100019310);
  __chkstk_darwin(v2 - 8);
  v4 = (char *)v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger();
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v1[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_logger], v5);
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "TransactionPickerViewController - someone requested transaction picker", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100005924((uint64_t)v4);
  v12 = objc_allocWithZone((Class)sub_1000068C8(&qword_100019318));
  v13 = (void *)UIHostingController.init(rootView:)();
  v14 = OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController;
  v15 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController];
  *(void *)&v1[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController] = v13;
  v16 = v13;

  v17 = *(void **)&v1[v14];
  if (v17)
  {
    v18 = [v17 view];
    if (v18)
    {
      v19 = v18;
      [v1 addChildViewController:v16];
      v20 = [v1 view];
      if (v20)
      {
        v21 = v20;
        [v20 addSubview:v19];

        [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
        sub_1000068C8(&qword_100019320);
        v22 = swift_allocObject();
        *(_OWORD *)(v22 + 16) = xmmword_100010F10;
        v23 = [v19 topAnchor];
        v24 = [v1 view];
        if (v24)
        {
          v25 = v24;
          v26 = [v24 topAnchor];

          v27 = [v23 constraintEqualToAnchor:v26];
          *(void *)(v22 + 32) = v27;
          v28 = [v19 leadingAnchor];
          v29 = [v1 view];
          if (v29)
          {
            v30 = v29;
            v31 = [v29 leadingAnchor];

            v32 = [v28 constraintEqualToAnchor:v31];
            *(void *)(v22 + 40) = v32;
            v33 = [v19 trailingAnchor];
            v34 = [v1 view];
            if (v34)
            {
              v35 = v34;
              v36 = [v34 trailingAnchor];

              v37 = [v33 constraintEqualToAnchor:v36];
              *(void *)(v22 + 48) = v37;
              v38 = [v19 bottomAnchor];
              v39 = [v1 view];
              if (v39)
              {
                v40 = v39;
                v41 = self;
                v42 = [v40 bottomAnchor];

                v43 = [v38 constraintEqualToAnchor:v42];
                *(void *)(v22 + 56) = v43;
                v47[0] = v22;
                specialized Array._endMutation()();
                sub_100006F50();
                isa = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease();
                [v41 activateConstraints:isa];

                return;
              }
              goto LABEL_24;
            }
LABEL_23:
            __break(1u);
LABEL_24:
            __break(1u);
            return;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_22;
    }
  }
  if ([v1 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v46, 0, sizeof(v46));
  }
  sub_100006A8C((uint64_t)v46, (uint64_t)v47);
  if (v47[3])
  {
    sub_1000068C8(&qword_100019300);
    if (swift_dynamicCast())
    {
      [v45[1] cancelled];
      swift_unknownObjectRelease();
    }
  }
  else
  {

    sub_100006AF4((uint64_t)v47);
  }
}

uint64_t sub_100005924@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_1000068C8(&qword_1000192C8);
  __chkstk_darwin(v1 - 8);
  v23 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000068C8(&qword_1000192D0);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1000068C8(&qword_1000192D8);
  __chkstk_darwin(v26);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DataRestrictedTransactionPickerView();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for FinanceStore.DataType();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FinanceStore();
  static FinanceStore.shared.getter();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for FinanceStore.DataType.financialData(_:), v11);
  char v15 = FinanceStore.isDataRestricted(for:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v15)
  {
    swift_allocObject();
    swift_unknownObjectWeakInit();
    DataRestrictedTransactionPickerView.init(cancelAction:)();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
    swift_storeEnumTagMultiPayload();
    sub_10000694C(&qword_1000192E8, (void (*)(uint64_t))&type metadata accessor for DataRestrictedTransactionPickerView);
    sub_100006994();
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    uint64_t v17 = type metadata accessor for AppProtectionShieldState();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v23, 1, 1, v17);
    uint64_t v18 = swift_allocObject();
    v19 = v25;
    *(void *)(v18 + 16) = v25;
    type metadata accessor for TransactionPickerView();
    sub_10000694C(&qword_1000192E0, (void (*)(uint64_t))&type metadata accessor for TransactionPickerView);
    id v20 = v19;
    AppProtectionShieldView.init(forceShieldState:shieldType:dismissAction:showAuthOnAppear:content:)();
    uint64_t v21 = v24;
    uint64_t v22 = v27;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v6, v4, v27);
    swift_storeEnumTagMultiPayload();
    sub_10000694C(&qword_1000192E8, (void (*)(uint64_t))&type metadata accessor for DataRestrictedTransactionPickerView);
    sub_100006994();
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v4, v22);
  }
}

uint64_t sub_100005E50()
{
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();

  return TransactionPickerView.init(confirmAction:cancelAction:)(sub_100006B54, v0, sub_100006A70, v1);
}

void sub_100005F08(uint64_t a1)
{
  uint64_t v37 = type metadata accessor for InternalTransaction();
  uint64_t v42 = *(void *)(v37 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v41 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v40 = (char *)&v30 - v5;
  __chkstk_darwin(v4);
  v39 = (char *)&v30 - v6;
  uint64_t v38 = type metadata accessor for Transaction();
  uint64_t v43 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  v45 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    long long v47 = 0u;
    long long v48 = 0u;
LABEL_20:
    sub_100006AF4((uint64_t)&v47);
    return;
  }
  uint64_t v9 = Strong;
  id v10 = [Strong _remoteViewControllerProxy];

  if (v10)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v46, 0, sizeof(v46));
  }
  sub_100006A8C((uint64_t)v46, (uint64_t)&v47);
  if (!*((void *)&v48 + 1)) {
    goto LABEL_20;
  }
  sub_1000068C8(&qword_100019300);
  if (swift_dynamicCast())
  {
    uint64_t v11 = *(void **)&v46[0];
    int64_t v12 = *(void *)(a1 + 16);
    if (v12)
    {
      v31 = *(void **)&v46[0];
      *(void *)&long long v47 = &_swiftEmptyArrayStorage;
      sub_100006B5C(0, v12, 0);
      int64_t v13 = sub_100006DBC(a1);
      int v15 = v14;
      int v17 = v16 & 1;
      uint64_t v36 = a1 + 56;
      uint64_t v35 = v42 + 16;
      uint64_t v34 = v42 + 32;
      uint64_t v33 = v42 + 8;
      uint64_t v32 = v43 + 32;
      uint64_t v18 = v42;
      uint64_t v19 = v37;
      while ((v13 & 0x8000000000000000) == 0 && v13 < 1 << *(unsigned char *)(a1 + 32))
      {
        if (((*(void *)(v36 + (((unint64_t)v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          goto LABEL_24;
        }
        if (*(_DWORD *)(a1 + 36) != v15) {
          goto LABEL_25;
        }
        int v44 = v17;
        id v20 = *(void (**)(char *, int64_t, uint64_t))(v18 + 16);
        uint64_t v21 = v39;
        v20(v39, *(void *)(a1 + 48) + *(void *)(v18 + 72) * v13, v19);
        uint64_t v22 = v40;
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v40, v21, v19);
        v20(v41, (int64_t)v22, v19);
        Transaction.init(internalTransaction:)();
        (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v19);
        uint64_t v23 = v47;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100006B5C(0, *(void *)(v23 + 16) + 1, 1);
          uint64_t v23 = v47;
        }
        unint64_t v25 = *(void *)(v23 + 16);
        unint64_t v24 = *(void *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          sub_100006B5C(v24 > 1, v25 + 1, 1);
          uint64_t v23 = v47;
        }
        *(void *)(v23 + 16) = v25 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v23+ ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))+ *(void *)(v43 + 72) * v25, v45, v38);
        *(void *)&long long v47 = v23;
        int64_t v26 = sub_100006E5C(v13, v15, v44 & 1, a1);
        int64_t v13 = v26;
        int v15 = v27;
        int v17 = v28 & 1;
        if (!--v12)
        {
          sub_100006F40(v26, v27, v17);
          uint64_t v11 = v31;
          goto LABEL_21;
        }
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    else
    {
LABEL_21:
      v29 = (void *)Array<A>.xpcValue.getter();
      swift_bridgeObjectRelease();
      [v11 foundWithTransactions:v29];
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_100006404()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    return sub_100006AF4((uint64_t)&v6);
  }
  uint64_t v1 = Strong;
  id v2 = [Strong _remoteViewControllerProxy];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)uint64_t v4 = 0u;
    long long v5 = 0u;
  }
  sub_100006A8C((uint64_t)v4, (uint64_t)&v6);
  if (!*((void *)&v7 + 1)) {
    return sub_100006AF4((uint64_t)&v6);
  }
  sub_1000068C8(&qword_100019300);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    [v4[0] cancelled];
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_100006508(uint64_t a1, uint64_t a2, void *a3)
{
  long long v6 = v3;
  Logger.init(subsystem:category:)();
  *(void *)&v6[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController] = 0;

  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController();
  id v8 = [super initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_100006724()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController();
  return [super dealloc];
}

uint64_t sub_1000067DC()
{
  return type metadata accessor for TransactionPickerServiceViewController();
}

uint64_t type metadata accessor for TransactionPickerServiceViewController()
{
  uint64_t result = qword_100019258;
  if (!qword_100019258) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006830()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000068C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000690C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006944()
{
  return sub_100005E50();
}

uint64_t sub_10000694C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100006994()
{
  unint64_t result = qword_1000192F0;
  if (!qword_1000192F0)
  {
    sub_1000069F0(&qword_1000192D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000192F0);
  }
  return result;
}

uint64_t sub_1000069F0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006A38()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006A70()
{
  return sub_100006404();
}

uint64_t sub_100006A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068C8(&qword_1000192F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006AF4(uint64_t a1)
{
  uint64_t v2 = sub_1000068C8(&qword_1000192F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100006B54(uint64_t a1)
{
}

uint64_t sub_100006B5C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100006B7C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100006B7C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000068C8(&qword_100019308);
  uint64_t v10 = *(void *)(type metadata accessor for Transaction() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for Transaction() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100006DBC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_100006E5C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100006F40(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100006F50()
{
  unint64_t result = qword_100019328;
  if (!qword_100019328)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100019328);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for InstallWalletView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InstallWalletView()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for InstallWalletView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for InstallWalletView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for InstallWalletView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for InstallWalletView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallWalletView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InstallWalletView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InstallWalletView()
{
  return &type metadata for InstallWalletView;
}

uint64_t sub_1000071A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000071C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v23 = a5;
  uint64_t v9 = sub_1000068C8(&qword_100019330);
  uint64_t v21 = *(void *)(v9 - 8);
  uint64_t v22 = v9;
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = static Color.clear.getter();
  char v24 = a3;
  uint64_t v25 = a4;
  sub_1000068C8(&qword_100019338);
  State.projectedValue.getter();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  *(unsigned char *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  swift_retain();
  swift_retain();
  View.installWalletAlert(isPresented:completion:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  *(unsigned char *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a4;
  uint64_t v14 = v21;
  uint64_t v15 = v22;
  uint64_t v16 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 16))(v23, v11, v22);
  unint64_t v17 = (void *)(v16 + *(int *)(sub_1000068C8(&qword_100019340) + 36));
  *unint64_t v17 = 0;
  v17[1] = 0;
  v17[2] = sub_1000074A4;
  v17[3] = v13;
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(v14 + 8);
  swift_retain();
  swift_retain();
  return v18(v11, v15);
}

uint64_t sub_1000073FC()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100007418@<X0>(uint64_t a1@<X8>)
{
  return sub_1000071C0(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_10000742C(uint64_t result)
{
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(void))(v1 + 16))();
  }
  return result;
}

uint64_t sub_100007464()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000074A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_1000074D0()
{
  unint64_t result = qword_100019348;
  if (!qword_100019348)
  {
    sub_1000069F0(&qword_100019340);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019348);
  }
  return result;
}

void sub_10000757C(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController();
  [super viewWillAppear:a1 & 1];
  long long v3 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController];
  if (v3)
  {
    id v4 = v3;
    if ([v1 isViewLoaded])
    {
      [v4 setModalPresentationStyle:5];
      [v1 presentViewController:v4 animated:0 completion:0];

      return;
    }
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100007758(int a1, id a2, void *a3)
{
  uint64_t v4 = v3;
  [a2 setSwipeDismissalStyle:0];
  if (a3)
  {
    sub_1000068C8(&qword_1000193A0);
    type metadata accessor for XPCEntitlementChecker();
    swift_allocObject();
    id v7 = a3;
    XPCEntitlementChecker.init()();
    sub_100008138();
    FinanceXPCConnection.init(endpoint:entitlementChecker:)();
    FinanceXPCConnection.resume()();
    *(void *)(v4 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection) = v10;
    swift_retain();
    swift_release();
    id v8 = sub_1000078E0((uint64_t)a2, v10);
    uint64_t v9 = *(void **)(v4 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController);
    *(void *)(v4 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController) = v8;

    swift_release();
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

id sub_1000078E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  State.init(wrappedValue:)();
  uint64_t v6 = objc_allocWithZone((Class)sub_1000068C8(&qword_1000193B0));
  *(void *)((char *)v6 + *(void *)(qword_100019BB0 + (swift_isaMask & *v6) + 16)) = a1;
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  id v7 = (void *)UIHostingController.init(rootView:)();
  id result = [v7 view];
  if (result)
  {
    uint64_t v9 = result;
    [result setBackgroundColor:0];

    swift_release();
    swift_release();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100007A78()
{
  ClientToServiceXPCConnection<>.cancelled()();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController);
    id v3 = v2;

    if (v2)
    {
      [v3 dismissViewControllerAnimated:0 completion:0];
    }
  }
}

uint64_t sub_100007BC4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_log;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_release();
}

id sub_100007C50()
{
  if (*(void *)&v0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection])
  {
    uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection];
    sub_1000068C8(&qword_1000193A0);
    sub_100008138();
    FinanceXPCConnection.invalidate()();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController();
  return [super dealloc];
}

uint64_t sub_100007DF4()
{
  return type metadata accessor for InstallWalletRemoteViewController();
}

uint64_t type metadata accessor for InstallWalletRemoteViewController()
{
  uint64_t result = qword_100019390;
  if (!qword_100019390) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100007E48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = v3;
  Logger.init(subsystem:category:)();
  *(void *)&v6[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController] = 0;
  *(void *)&v6[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection] = 0;

  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController();
  [super initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_100007FAC(void *a1)
{
  uint64_t v3 = v1;
  Logger.init(subsystem:category:)();
  *(void *)&v3[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController();
  [super initWithCoder:a1];

  return v4;
}

uint64_t sub_10000809C()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_100008138()
{
  unint64_t result = qword_1000193A8;
  if (!qword_1000193A8)
  {
    sub_1000069F0(&qword_1000193A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000193A8);
  }
  return result;
}

uint64_t sub_100008194()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000081CC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000820C()
{
}

uint64_t sub_100008214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = type metadata accessor for Logger();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000082D8, 0, 0);
}

uint64_t sub_1000082D8()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  Logger.init(subsystem:category:)();
  v0[2] = v3;
  uint64_t v4 = swift_allocObject();
  v0[10] = v4;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  uint64_t v6 = sub_1000068C8(&qword_1000193E8);
  unint64_t v7 = sub_100009530();
  *uint64_t v5 = v0;
  v5[1] = sub_10000842C;
  return FinanceXPCConnection.execute<A>(_:)(v7, sub_1000094E8, v4, v6, (char *)&type metadata for () + 8, v7);
}

uint64_t sub_10000842C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000085C4;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100008548;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008548()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000085C4()
{
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "electAccountsUI XPC error: %@", v3, 0xCu);
    sub_1000068C8(&qword_1000193F8);
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
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t ClientToServiceXPCConnection<>.updated(accountSelectionResult:)(uint64_t a1)
{
  uint64_t v3 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AccountSelectionResult();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v1;
  v12[5] = sub_100008AA0;
  v12[6] = v10;
  swift_retain();
  swift_retain();
  sub_10000DD60((uint64_t)v5, (uint64_t)&unk_1000193C8, (uint64_t)v12);
  swift_release();
  return swift_release();
}

void sub_1000089B4(void *a1)
{
  id v2 = (id)AccountSelectionResult.xpcValue.getter();
  [a1 updated:v2];
}

uint64_t sub_100008A10()
{
  uint64_t v1 = type metadata accessor for AccountSelectionResult();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100008AA0(void *a1)
{
  type metadata accessor for AccountSelectionResult();
  id v2 = (id)AccountSelectionResult.xpcValue.getter();
  [a1 updated:v2];
}

uint64_t sub_100008B38(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *unint64_t v9 = v2;
  v9[1] = sub_100009594;
  return sub_100008214(a1, v4, v5, v6, v7, v8);
}

uint64_t ClientToServiceXPCConnection<>.cancelled()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = sub_100008E50;
  v7[6] = 0;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_100008E60((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_1000193D0;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void v14[4];

  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = sub_100008E50;
  v7[6] = 0;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_100008E60((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_100019460;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

id sub_100008E50(void *a1)
{
  return [a1 cancelled];
}

uint64_t sub_100008E60(uint64_t a1)
{
  uint64_t v2 = sub_1000068C8(&qword_1000193B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ClientToServiceXPCConnection<>.failed(with:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = v4;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = sub_100009390;
  v13[6] = v11;
  swift_retain_n();
  id v14 = a1;
  sub_1000094B0(a2);
  swift_retain();
  sub_10000DD60((uint64_t)v10, (uint64_t)&unk_1000193E0, (uint64_t)v13);
  swift_release();
  return swift_release();
}

id sub_10000903C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = [a1 failedWith:a2];
  if (a3)
  {
    swift_retain();
    uint64_t v7 = (void *)ClientToServiceXPCConnection.connection.getter();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a3;
    *(void *)(v8 + 24) = a4;
    v10[4] = sub_1000074A4;
    v10[5] = v8;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_10000DF04;
    v10[3] = &unk_100014D30;
    uint64_t v9 = _Block_copy(v10);
    swift_retain();
    swift_release();
    [v7 scheduleSendBarrierBlock:v9];
    _Block_release(v9);

    return (id)sub_1000094D8(a3);
  }
  return result;
}

uint64_t sub_10000915C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009194(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000924C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000195A0 + dword_1000195A0);
  return v6(a1, v4);
}

uint64_t sub_10000924C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100009340()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

id sub_100009390(void *a1)
{
  return sub_10000903C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1000093A0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000093E8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000924C;
  return sub_100008214(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000094B0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000094C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000094D0()
{
  return swift_release();
}

uint64_t sub_1000094D8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000094E8(void *a1)
{
  (*(void (**)(void))(v1 + 16))(*a1);
  sub_1000068C8(&qword_100019400);
  return CheckedContinuation.resume(returning:)();
}

unint64_t sub_100009530()
{
  unint64_t result = qword_1000193F0;
  if (!qword_1000193F0)
  {
    sub_1000069F0(&qword_1000193E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000193F0);
  }
  return result;
}

void sub_100009690()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DeviceType();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (![v1 isViewLoaded]) {
    goto LABEL_9;
  }
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState];
  if (v6 == (void *)1) {
    return;
  }
  if (!v6)
  {
LABEL_9:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  id v7 = v6;
  static DeviceInfo.deviceType.getter();
  char v8 = DeviceType.isiPad.getter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  [v7 setModalPresentationStyle:v9];
  [v1 presentViewController:v7 animated:1 completion:0];
  sub_10000B240(v6);
}

void sub_10000987C(uint64_t a1, void *a2, void *a3)
{
  id v49 = a3;
  uint64_t v5 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v5 - 8);
  v41[1] = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  __chkstk_darwin(v7);
  uint64_t v43 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SaveOrderUIInfoKeys();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v41 - v14;
  [a2 setSwipeDismissalStyle:0];
  uint64_t v48 = (uint64_t)a2;
  [a2 setLaunchingInterfaceOrientation:1];
  if (a1)
  {
    uint64_t v16 = *(void (**)(char *, void, uint64_t))(v10 + 104);
    v16(v15, enum case for SaveOrderUIInfoKeys.data(_:), v9);
    uint64_t v17 = SaveOrderUIInfoKeys.rawValue.getter();
    uint64_t v19 = v18;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v15, v9);
    uint64_t v50 = v17;
    uint64_t v51 = v19;
    AnyHashable.init<A>(_:)();
    if (*(void *)(a1 + 16) && (unint64_t v21 = sub_10000D1C8((uint64_t)v52), (v22 & 1) != 0))
    {
      sub_10000B420(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v53);
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
    }
    sub_10000B250((uint64_t)v52);
    if (*((void *)&v54 + 1))
    {
      if (swift_dynamicCast())
      {
        unint64_t v46 = v51;
        uint64_t v47 = v50;
        v16(v13, enum case for SaveOrderUIInfoKeys.sourceApplication(_:), v9);
        uint64_t v23 = SaveOrderUIInfoKeys.rawValue.getter();
        uint64_t v25 = v24;
        v20(v13, v9);
        *(void *)&long long v53 = v23;
        *((void *)&v53 + 1) = v25;
        AnyHashable.init<A>(_:)();
        if (*(void *)(a1 + 16))
        {
          unint64_t v26 = sub_10000D1C8((uint64_t)v52);
          uint64_t v27 = v42;
          if (v28)
          {
            sub_10000B420(*(void *)(a1 + 56) + 32 * v26, (uint64_t)&v53);
          }
          else
          {
            long long v53 = 0u;
            long long v54 = 0u;
          }
        }
        else
        {
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v27 = v42;
        }
        unint64_t v29 = v46;
        sub_10000B250((uint64_t)v52);
        if (*((void *)&v54 + 1))
        {
          int v30 = swift_dynamicCast();
          if (v30) {
            uint64_t v31 = v50;
          }
          else {
            uint64_t v31 = 0;
          }
          if (v30) {
            uint64_t v32 = v51;
          }
          else {
            uint64_t v32 = 0;
          }
          if (v49) {
            goto LABEL_21;
          }
        }
        else
        {
          sub_100006AF4((uint64_t)&v53);
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          if (v49)
          {
LABEL_21:
            sub_1000068C8(&qword_1000193A0);
            uint64_t v33 = type metadata accessor for XPCEntitlementChecker();
            swift_allocObject();
            id v34 = v49;
            uint64_t v35 = XPCEntitlementChecker.init()();
            v52[3] = v33;
            v52[4] = &protocol witness table for XPCEntitlementChecker;
            v52[0] = v35;
            sub_100008138();
            FinanceXPCConnection.init(endpoint:entitlementChecker:)();
            uint64_t v36 = v53;
            v52[0] = v53;
            FinanceXPCConnection.resume()();
            *(void *)(v27 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection) = v36;
            swift_retain();
            swift_release();
            uint64_t v37 = v47;
            uint64_t v38 = (void *)sub_10000A120(v47, v29, v31, v32, v48, v36);
            swift_bridgeObjectRelease();
            v39 = *(void **)(v27 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState);
            *(void *)(v27 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState) = v38;
            id v40 = v38;
            sub_10000B240(v39);
            swift_release();

            sub_10000B3C8(v37, v29);
            return;
          }
        }
      }
    }
    else
    {
      sub_100006AF4((uint64_t)&v53);
    }
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10000A120(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a5;
  uint64_t v29 = a3;
  uint64_t v9 = type metadata accessor for OrderImportPreview();
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  unint64_t v26 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = a6;
  type metadata accessor for DeviceInfo();
  sub_10000B61C(a1, a2);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v19 = v30;
  OrderImportPreview.init(orderData:deviceInfo:sourceApplication:completion:)();
  if (!v19)
  {
    uint64_t v20 = v28;
    int v30 = *(void (**)(void, void, void))(v28 + 16);
    uint64_t v21 = v9;
    v30(v14, v16, v9);
    char v22 = (char *)objc_allocWithZone((Class)sub_1000068C8(qword_100019470));
    uint64_t v23 = v26;
    *(void *)&v22[*(void *)(qword_100019BB0 + (swift_isaMask & *(void *)v22) + 16)] = v27;
    v30(v23, v14, v21);
    swift_unknownObjectRetain();
    a1 = UIHostingController.init(rootView:)();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v20 + 8);
    v24(v14, v21);
    v24(v16, v21);
  }
  return a1;
}

void sub_10000A3E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    sub_10000A4BC(a1, a3);
  }
  swift_beginAccess();
  uint64_t v7 = swift_unknownObjectWeakLoadStrong();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(void **)(v7 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState);
    sub_10000B674(v9);

    if ((unint64_t)v9 >= 2) {
      [v9 dismissViewControllerAnimated:1 completion:0];
    }
    sub_10000B240(v9);
  }
}

uint64_t sub_10000A4BC(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = a2;
  uint64_t v3 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v3 - 8);
  id v49 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v49 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v49 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v49 - v16;
  uint64_t v18 = type metadata accessor for OrderImportPreview.ImportResult();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v21, v18);
  if (v22 == enum case for OrderImportPreview.ImportResult.error(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v50 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log, v5);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    uint64_t v25 = v6;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v50 = v5;
      uint64_t v26 = v6;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 138412290;
      swift_errorRetain();
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v52 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v28 = v29;
      uint64_t v25 = v26;
      uint64_t v5 = v50;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "ImportRemoteViewController - Error: %@", v27, 0xCu);
      sub_1000068C8(&qword_1000193F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v5);
    id v34 = (void *)_convertErrorToNSError(_:)();
    uint64_t v35 = (void *)swift_allocObject();
    v35[2] = v34;
    v35[3] = 0;
    uint64_t v36 = v51;
    v35[4] = 0;
    v35[5] = v36;
    uint64_t v37 = type metadata accessor for TaskPriority();
    uint64_t v38 = (uint64_t)v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v49, 1, 1, v37);
    v39 = (void *)swift_allocObject();
    v39[2] = 0;
    v39[3] = 0;
    v39[4] = v36;
    v39[5] = sub_10000B684;
    v39[6] = v35;
    swift_retain_n();
    id v40 = v34;
    swift_retain();
    sub_10000DD60(v38, (uint64_t)&unk_100019468, (uint64_t)v39);

    swift_release();
    swift_release();
    return swift_errorRelease();
  }
  else if (v22 == enum case for OrderImportPreview.ImportResult.cancelled(_:))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v15, v50 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log, v5);
    int v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "ImportRemoteViewController - User cancelled add", v32, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
    return ClientToServiceXPCConnection<>.cancelled()();
  }
  else
  {
    uint64_t v41 = v50 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log;
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    if (v22 == enum case for OrderImportPreview.ImportResult.orderAdded(_:))
    {
      v42(v17, v41, v5);
      uint64_t v43 = Logger.logObject.getter();
      os_log_type_t v44 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "ImportRemoteViewController - Successfully added order", v45, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
      return ClientToServiceXPCConnection<>.added()();
    }
    else
    {
      v42(v9, v41, v5);
      unint64_t v46 = Logger.logObject.getter();
      os_log_type_t v47 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v48 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "ImportRemoteViewController - Unknown result type", v48, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      ClientToServiceXPCConnection<>.cancelled()();
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    }
  }
}

uint64_t sub_10000ACB8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000B240(*(id *)(v0 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState));

  return swift_release();
}

id sub_10000AD44()
{
  if (*(void *)&v0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection])
  {
    uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection];
    sub_1000068C8(&qword_1000193A0);
    sub_100008138();
    FinanceXPCConnection.invalidate()();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImportRemoteViewController();
  return [super dealloc];
}

uint64_t sub_10000AEE8()
{
  return type metadata accessor for ImportRemoteViewController();
}

uint64_t type metadata accessor for ImportRemoteViewController()
{
  uint64_t result = qword_100019450;
  if (!qword_100019450) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_10000AF3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = v3;
  Logger.init(subsystem:category:)();
  *(void *)&v6[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState] = 0;
  *(void *)&v6[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection] = 0;

  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for ImportRemoteViewController();
  [super initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_10000B0A0(void *a1)
{
  uint64_t v3 = v1;
  Logger.init(subsystem:category:)();
  *(void *)&v3[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ImportRemoteViewController();
  id v4 = [super initWithCoder:a1];

  return v4;
}

uint64_t sub_10000B190()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10000B240(id a1)
{
  if ((unint64_t)a1 >= 2) {
}
  }

uint64_t sub_10000B250(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B2A4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000B2DC()
{
  return [*(id *)(v0 + 16) deactivate];
}

void sub_10000B2F0(void *a1)
{
  sub_10000E838(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000B300(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_100009594;
  return sub_10000E318(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10000B3C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000B420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B480()
{
  swift_errorRelease();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B4D4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000924C;
  return sub_10000E318(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10000B59C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B5D4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000B614(uint64_t a1)
{
  sub_10000A3E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000B61C(uint64_t a1, unint64_t a2)
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

id sub_10000B674(id result)
{
  if ((unint64_t)result >= 2) {
    return result;
  }
  return result;
}

uint64_t sub_10000B68C()
{
  return swift_initClassMetadata2();
}

void sub_10000B6DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;

  sub_10000BA14(v3);
}

id sub_10000B758(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for RemoteHostingController();
  [super viewDidDisappear:a1 & 1];
  return [*(id *)((char *)v1 + *(void *)(qword_100019BB0 + (swift_isaMask & *v1) + 16)) deactivate];
}

void sub_10000B834(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_10000B758(a3);
}

void sub_10000B888()
{
}

void sub_10000B8B8()
{
}

uint64_t sub_10000B8E8()
{
  return swift_unknownObjectRelease();
}

id sub_10000B934()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteHostingController();
  return [super dealloc];
}

uint64_t sub_10000B9B0()
{
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for RemoteHostingController()
{
  return sub_10000BA74();
}

void sub_10000BA14(void *a1)
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10000BA74()
{
  return swift_getGenericMetadata();
}

BOOL AccountSelectionUIError.Code.init(rawValue:)(uint64_t a1)
{
  return a1 != 0;
}

uint64_t AccountSelectionUIError.errorCode.getter()
{
  return 0;
}

uint64_t static AccountSelectionUIError.__derived_enum_equals(_:_:)()
{
  return 1;
}

Swift::Int AccountSelectionUIError.hashValue.getter()
{
  return Hasher._finalize()();
}

void AccountSelectionUIError.hash(into:)()
{
}

Swift::Int sub_10000BB2C()
{
  return Hasher._finalize()();
}

void *sub_10000BB6C@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_10000BB80(void *a1@<X8>)
{
  *a1 = 0;
}

unint64_t static AccountSelectionUIError.errorDomain.getter()
{
  return 0xD000000000000014;
}

unint64_t AccountSelectionUIError.failureReason.getter()
{
  return 0xD000000000000032;
}

uint64_t sub_10000BBC4(uint64_t a1)
{
  unint64_t v2 = sub_10000D87C();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000BC00(uint64_t a1)
{
  unint64_t v2 = sub_10000D87C();

  return Error<>._code.getter(a1, v2);
}

void sub_10000BC50(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SelectAccountsViewController();
  [super viewWillAppear:a1 & 1];
  if (![v1 isViewLoaded]) {
    goto LABEL_6;
  }
  id v3 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState];
  if (v3 == (void *)1) {
    return;
  }
  if (!v3)
  {
LABEL_6:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  id v4 = v3;
  [v4 setModalPresentationStyle:0];
  [v1 presentViewController:v4 animated:1 completion:0];
  sub_10000B240(v3);
}

void sub_10000BE7C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for SelectAccountsUIInfoKeys();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a2 setSwipeDismissalStyle:0];
  [a2 setStatusBarHidden:1 withDuration:0.3];
  [a2 setDismissalAnimationStyle:2];
  if (a3 && a1)
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for SelectAccountsUIInfoKeys.sourceApplication(_:), v8);
    id v12 = a3;
    uint64_t v13 = SelectAccountsUIInfoKeys.rawValue.getter();
    uint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v31 = v13;
    uint64_t v32 = v15;
    AnyHashable.init<A>(_:)();
    if (*(void *)(a1 + 16) && (unint64_t v16 = sub_10000D1C8((uint64_t)v33), (v17 & 1) != 0))
    {
      sub_10000B420(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v34);
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
    }
    sub_10000B250((uint64_t)v33);
    if (*((void *)&v35 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v19 = v31;
        uint64_t v18 = v32;
        id v20 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain();
        id v21 = sub_10000D0EC(v19, v18, 0);
        swift_bridgeObjectRelease();
        sub_1000068C8(&qword_1000193E8);
        uint64_t v22 = type metadata accessor for XPCEntitlementChecker();
        swift_allocObject();
        id v23 = v12;
        id v24 = v21;
        uint64_t v25 = XPCEntitlementChecker.init()();
        v33[3] = v22;
        v33[4] = &protocol witness table for XPCEntitlementChecker;
        v33[0] = v25;
        sub_100009530();
        FinanceXPCConnection.init(endpoint:entitlementChecker:)();
        uint64_t v26 = v34;
        v33[0] = v34;
        FinanceXPCConnection.resume()();
        *(void *)(v4 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection) = v26;
        swift_retain();
        swift_release();
        if (v24)
        {
          uint64_t v27 = (void *)sub_10000C334(v24, (uint64_t)a2, v26);

          uint64_t v28 = *(void **)(v4 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState);
          *(void *)(v4 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState) = v27;
          id v29 = v27;
          sub_10000B240(v28);
          swift_release();

          return;
        }
        __break(1u);
      }
    }
    else
    {
      sub_100006AF4((uint64_t)&v34);
    }
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10000C334(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SelectAccountsView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v24 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = v16;
  id v18 = a1;
  swift_retain();
  SelectAccountsView.init(applicationRecord:completion:)();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v19(v13, v15, v6);
  id v20 = objc_allocWithZone((Class)sub_1000068C8(&qword_100019568));
  *(void *)((char *)v20 + *(void *)(qword_100019BB0 + (swift_isaMask & *v20) + 16)) = a2;
  v19(v10, v13, v6);
  swift_unknownObjectRetain();
  uint64_t v21 = UIHostingController.init(rootView:)();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  v22(v13, v6);
  v22(v15, v6);
  return v21;
}

void sub_10000C590(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v3 - 8);
  os_log_type_t v44 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for AccountSelectionResult();
  uint64_t v5 = *(void *)(v43 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v43);
  uint64_t v8 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v39 - v9;
  uint64_t v11 = type metadata accessor for AccountSelectionValues();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SelectAccountsResult();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == enum case for SelectAccountsResult.updated(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    uint64_t v19 = v41;
    id v20 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
    id v40 = v13;
    uint64_t v21 = v17;
    uint64_t v22 = v42;
    v20(v13, v21, v42);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v10, v13, v22);
    uint64_t v23 = v43;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v10, enum case for AccountSelectionResult.values(_:), v43);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v23);
    unint64_t v24 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v25 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v25 + v24, v8, v23);
    uint64_t v26 = type metadata accessor for TaskPriority();
    uint64_t v27 = (uint64_t)v44;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v44, 1, 1, v26);
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = 0;
    v28[3] = 0;
    v28[4] = v45;
    v28[5] = sub_10000D808;
    v28[6] = v25;
    swift_retain();
    swift_retain();
    sub_10000DD60(v27, (uint64_t)&unk_100019570, (uint64_t)v28);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v23);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v40, v22);
  }
  else
  {
    uint64_t v30 = (uint64_t)v44;
    uint64_t v29 = v45;
    if (v18 == enum case for SelectAccountsResult.cancelled(_:))
    {
      ClientToServiceXPCConnection<>.cancelled()();
    }
    else
    {
      sub_10000D3AC();
      swift_allocError();
      uint64_t v31 = (void *)_convertErrorToNSError(_:)();
      uint64_t v32 = (void *)swift_allocObject();
      v32[2] = v31;
      v32[3] = 0;
      v32[4] = 0;
      v32[5] = v29;
      uint64_t v33 = type metadata accessor for TaskPriority();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v30, 1, 1, v33);
      long long v34 = (void *)swift_allocObject();
      v34[2] = 0;
      v34[3] = 0;
      v34[4] = v29;
      v34[5] = sub_100009390;
      v34[6] = v32;
      swift_retain_n();
      id v35 = v31;
      swift_retain();
      sub_10000DD60(v30, (uint64_t)&unk_1000193C8, (uint64_t)v34);

      swift_release();
      swift_release();
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    }
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v37 = (void *)Strong;
    uint64_t v38 = *(void **)(Strong + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState);
    sub_10000B674(v38);

    if ((unint64_t)v38 >= 2) {
      [v38 dismissViewControllerAnimated:1 completion:0];
    }
    sub_10000B240(v38);
  }
}

uint64_t sub_10000CC68()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_log;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000B240(*(id *)(v0 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState));

  return swift_release();
}

id sub_10000CCF4()
{
  if (*(void *)&v0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection])
  {
    uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection];
    sub_1000068C8(&qword_1000193E8);
    sub_100009530();
    FinanceXPCConnection.invalidate()();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SelectAccountsViewController();
  return [super dealloc];
}

id sub_10000CE98(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = v3;
  Logger.init(subsystem:category:)();
  *(void *)&v6[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState] = 0;
  *(void *)&v6[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection] = 0;

  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for SelectAccountsViewController();
  [super initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_10000CFFC(void *a1)
{
  uint64_t v3 = v1;
  Logger.init(subsystem:category:)();
  *(void *)&v3[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SelectAccountsViewController();
  id v4 = [super initWithCoder:a1];

  return v4;
}

id sub_10000D0EC(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
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
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_10000D1C8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000D20C(a1, v4);
}

unint64_t sub_10000D20C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000D648(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000B250((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t _s16FinanceUIService23AccountSelectionUIErrorO16errorDescriptionSSSgvg_0()
{
  return 0x20636972656E6547;
}

unint64_t sub_10000D2FC()
{
  unint64_t result = qword_1000194F8;
  if (!qword_1000194F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000194F8);
  }
  return result;
}

unint64_t sub_10000D354()
{
  unint64_t result = qword_100019500;
  if (!qword_100019500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019500);
  }
  return result;
}

unint64_t sub_10000D3AC()
{
  unint64_t result = qword_100019508;
  if (!qword_100019508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019508);
  }
  return result;
}

uint64_t sub_10000D410()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccountSelectionUIError()
{
  return &type metadata for AccountSelectionUIError;
}

uint64_t _s16FinanceUIService23AccountSelectionUIErrorOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s16FinanceUIService23AccountSelectionUIErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000D518);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountSelectionUIError.Code()
{
  return &type metadata for AccountSelectionUIError.Code;
}

uint64_t sub_10000D550()
{
  return type metadata accessor for SelectAccountsViewController();
}

uint64_t type metadata accessor for SelectAccountsViewController()
{
  uint64_t result = qword_100019550;
  if (!qword_100019550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000D5A4()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000D648(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000D6A4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D6DC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000D71C(uint64_t a1)
{
  sub_10000C590(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000D724()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D778()
{
  uint64_t v1 = type metadata accessor for AccountSelectionResult();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10000D808(void *a1)
{
  type metadata accessor for AccountSelectionResult();

  sub_1000089B4(a1);
}

unint64_t sub_10000D87C()
{
  unint64_t result = qword_100019578;
  if (!qword_100019578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019578);
  }
  return result;
}

uint64_t sub_10000D8D0()
{
  uint64_t v0 = sub_1000068C8(&qword_100019588);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WindowGroup.init(id:title:lazyContent:)();
  sub_10000DAB0();
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000DA30()
{
  unint64_t result = qword_100019580;
  if (!qword_100019580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019580);
  }
  return result;
}

ValueMetadata *type metadata accessor for FinanceUIServiceApp()
{
  return &type metadata for FinanceUIServiceApp;
}

uint64_t sub_10000DA94()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000DAB0()
{
  unint64_t result = qword_100019590;
  if (!qword_100019590)
  {
    sub_1000069F0(&qword_100019588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100019590);
  }
  return result;
}

uint64_t sub_10000DD60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008E60(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000DF04(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t ClientToServiceXPCConnection<>.failed(with:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = v4;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = sub_10000B2F0;
  v13[6] = v11;
  swift_retain_n();
  swift_errorRetain();
  sub_1000094B0(a2);
  swift_retain();
  sub_10000DD60((uint64_t)v10, (uint64_t)&unk_1000195A8, (uint64_t)v13);
  swift_release();
  return swift_release();
}

uint64_t ClientToServiceXPCConnection<>.added()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068C8(&qword_1000193B8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = sub_10000E828;
  v7[6] = 0;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_100008E60((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_1000195B0;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_10000E318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  uint64_t v7 = type metadata accessor for Logger();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return _swift_task_switch(sub_10000E3DC, 0, 0);
}

uint64_t sub_10000E3DC()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  Logger.init(subsystem:category:)();
  v0[2] = v3;
  uint64_t v4 = swift_allocObject();
  v0[10] = v4;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  uint64_t v6 = sub_1000068C8(&qword_1000193A0);
  unint64_t v7 = sub_100008138();
  *uint64_t v5 = v0;
  v5[1] = sub_10000E530;
  return FinanceXPCConnection.execute<A>(_:)(v7, sub_1000094E8, v4, v6, (char *)&type metadata for () + 8, v7);
}

uint64_t sub_10000E530()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10000E64C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100008548;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000E64C()
{
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "SaveOrderUI XPC error: %@", v3, 0xCu);
    sub_1000068C8(&qword_1000193F8);
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
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

id sub_10000E828(void *a1)
{
  return [a1 added];
}

void sub_10000E838(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for FinanceError();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a2;
  swift_errorRetain();
  sub_1000068C8(&qword_100019560);
  if (swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v12 = (void *)_convertErrorToNSError(_:)();
  }
  else
  {
    sub_10000ECFC();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v13, enum case for FinanceError.unknown(_:), v8);
    uint64_t v12 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  [a1 failedWith:v12];

  if (a3)
  {
    swift_retain();
    uint64_t v14 = (void *)ClientToServiceXPCConnection.connection.getter();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a3;
    *(void *)(v15 + 24) = a4;
    aBlock[4] = sub_1000074A4;
    aBlock[5] = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000DF04;
    aBlock[3] = &unk_100015298;
    uint64_t v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v14 scheduleSendBarrierBlock:v16];
    _Block_release(v16);

    sub_1000094D8(a3);
  }
}

uint64_t sub_10000EA98(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000EB74;
  return v6(a1);
}

uint64_t sub_10000EB74()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000EC6C()
{
  swift_errorRelease();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000ECC4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10000ECFC()
{
  unint64_t result = qword_1000195C0;
  if (!qword_1000195C0)
  {
    type metadata accessor for FinanceError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000195C0);
  }
  return result;
}

uint64_t sub_10000ED54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000ED64()
{
  return swift_release();
}

uint64_t sub_10000ED6C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100009594;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000195A0 + dword_1000195A0);
  return v6(a1, v4);
}

void *initializeBufferWithCopyOfBuffer for HostingControllerState(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for HostingControllerState(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for HostingControllerState(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *initializeWithTake for HostingControllerState(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for HostingControllerState(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for HostingControllerState(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HostingControllerState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_10000F02C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10000F044(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for HostingControllerState()
{
  return &type metadata for HostingControllerState;
}

void sub_10000F078(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  unsigned int v4 = v3;
  v38[1] = a3;
  uint64_t v39 = a2;
  id v40 = a1;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v38 - v10;
  uint64_t v12 = &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log];
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v41((char *)v38 - v10, &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log], v5);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Configuring view in FinanceUIService", v15, 2u);
    swift_slowDealloc();
  }

  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v11, v5);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v4;
  aBlock[4] = sub_100010204;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000F560;
  aBlock[3] = &unk_100015468;
  int v18 = _Block_copy(aBlock);
  uint64_t v19 = v4;
  swift_release();
  id v20 = [v19 _remoteViewControllerProxyWithErrorHandler:v18];
  _Block_release(v18);
  if (v20)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  sub_100006A8C((uint64_t)&v43, (uint64_t)aBlock);
  sub_100010164((uint64_t)aBlock, (uint64_t)&v43);
  if (*((void *)&v44 + 1))
  {
    sub_1000068C8(&qword_100019610);
    if (swift_dynamicCast())
    {
      id v21 = v40;
      if (v40)
      {
        uint64_t v22 = v42;
        id v23 = [v40 xpcEndpoint];
        if (v23)
        {
          id v24 = v23;
          id v25 = [objc_allocWithZone((Class)NSXPCListenerEndpoint) init];
          uint64_t v26 = v25;
          if (v25)
          {
            id v27 = v25;
            [v27 _setEndpoint:v24];
          }
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v26 = 0;
        }
        id v31 = [v21 userInfo];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
        }
        else
        {
          uint64_t v33 = 0;
        }
        long long v34 = *(void (**)(uint64_t, uint64_t, void *))((swift_isaMask & *(void *)v19) + 0x70);
        id v35 = v26;
        v34(v33, v22, v26);

        swift_bridgeObjectRelease();
        uint64_t v36 = v39;
        if (v39)
        {
          uint64_t v37 = swift_retain();
          v36(v37);
          swift_unknownObjectRelease();
          sub_1000094D8((uint64_t)v36);
          sub_100006AF4((uint64_t)aBlock);
        }
        else
        {
          sub_100006AF4((uint64_t)aBlock);

          swift_unknownObjectRelease();
        }
      }
      else
      {
        __break(1u);
      }
      return;
    }
  }
  else
  {
    sub_100006AF4((uint64_t)&v43);
  }
  v41(v9, v12, v5);
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Could not create remote ViewController configuration proxy", v30, 2u);
    swift_slowDealloc();
  }

  v16(v9, v5);
  sub_100006AF4((uint64_t)aBlock);
}

void sub_10000F560(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_10000F69C(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  id v4 = v3;
  v27[1] = a3;
  uint64_t v28 = a2;
  id v29 = a1;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v27 - v10;
  uint64_t v12 = &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log];
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v30((char *)v27 - v10, &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log], v5);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Activating view in FinanceUIService", v15, 2u);
    swift_slowDealloc();
  }

  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v11, v5);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v4;
  aBlock[4] = sub_100010128;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000F560;
  aBlock[3] = &unk_1000153F0;
  int v18 = _Block_copy(aBlock);
  uint64_t v19 = v4;
  swift_release();
  id v20 = [v19 _remoteViewControllerProxyWithErrorHandler:v18];
  _Block_release(v18);
  if (v20)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_100006A8C((uint64_t)&v31, (uint64_t)aBlock);
  sub_100010164((uint64_t)aBlock, (uint64_t)&v31);
  if (!*((void *)&v32 + 1))
  {
    sub_100006AF4((uint64_t)&v31);
    goto LABEL_12;
  }
  sub_1000068C8(&qword_100019610);
  if (!swift_dynamicCast())
  {
LABEL_12:
    v30(v9, v12, v5);
    id v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Could not create remote ViewController activation proxy", v26, 2u);
      swift_slowDealloc();
    }

    v16(v9, v5);
    return (id)sub_100006AF4((uint64_t)aBlock);
  }
  id result = v29;
  if (!v29)
  {
    __break(1u);
    return result;
  }

  uint64_t v22 = v28;
  if (!v28)
  {
    sub_100006AF4((uint64_t)aBlock);
    return (id)swift_unknownObjectRelease();
  }
  uint64_t v23 = swift_retain();
  v22(v23);
  swift_unknownObjectRelease();
  sub_1000094D8((uint64_t)v22);
  return (id)sub_100006AF4((uint64_t)aBlock);
}

uint64_t sub_10000FA84(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2 + OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log, v6);
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v17 = a3;
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412290;
      swift_errorRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v18 = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v16 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v17, v13, 0xCu);
      sub_1000068C8(&qword_1000193F8);
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
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

id sub_10000FF58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FinanceRemoteViewController();
  return [super dealloc];
}

uint64_t sub_10000FFFC()
{
  return type metadata accessor for FinanceRemoteViewController();
}

uint64_t type metadata accessor for FinanceRemoteViewController()
{
  uint64_t result = qword_100019600;
  if (!qword_100019600) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100010050()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000100E0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010118()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100010128(uint64_t a1)
{
  return sub_10000FA84(a1, *(void *)(v1 + 16), "Remote ViewController activation proxy error: %@");
}

uint64_t sub_10001014C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001015C()
{
  return swift_release();
}

uint64_t sub_100010164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068C8(&qword_1000192F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000101CC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010204(uint64_t a1)
{
  return sub_10000FA84(a1, *(void *)(v1 + 16), "Remote ViewController configuration proxy error: %@");
}

uint64_t sub_10001023C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

Swift::Void __swiftcall FinanceXPCConnection.invalidate()()
{
}

Swift::Void __swiftcall FinanceXPCConnection.resume()()
{
}

uint64_t FinanceXPCConnection.init(endpoint:entitlementChecker:)()
{
  return FinanceXPCConnection.init(endpoint:entitlementChecker:)();
}

uint64_t type metadata accessor for FinanceError()
{
  return type metadata accessor for FinanceError();
}

uint64_t FinanceStore.isDataRestricted(for:)()
{
  return FinanceStore.isDataRestricted(for:)();
}

uint64_t static FinanceStore.shared.getter()
{
  return static FinanceStore.shared.getter();
}

uint64_t type metadata accessor for FinanceStore.DataType()
{
  return type metadata accessor for FinanceStore.DataType();
}

uint64_t type metadata accessor for FinanceStore()
{
  return type metadata accessor for FinanceStore();
}

uint64_t static DeviceInfo.deviceType.getter()
{
  return static DeviceInfo.deviceType.getter();
}

uint64_t type metadata accessor for DeviceInfo()
{
  return type metadata accessor for DeviceInfo();
}

uint64_t DeviceType.isiPad.getter()
{
  return DeviceType.isiPad.getter();
}

uint64_t type metadata accessor for DeviceType()
{
  return type metadata accessor for DeviceType();
}

uint64_t Transaction.init(internalTransaction:)()
{
  return Transaction.init(internalTransaction:)();
}

uint64_t type metadata accessor for Transaction()
{
  return type metadata accessor for Transaction();
}

uint64_t type metadata accessor for InternalTransaction()
{
  return type metadata accessor for InternalTransaction();
}

uint64_t SaveOrderUIInfoKeys.rawValue.getter()
{
  return SaveOrderUIInfoKeys.rawValue.getter();
}

uint64_t type metadata accessor for SaveOrderUIInfoKeys()
{
  return type metadata accessor for SaveOrderUIInfoKeys();
}

uint64_t XPCEntitlementChecker.init()()
{
  return XPCEntitlementChecker.init()();
}

uint64_t type metadata accessor for XPCEntitlementChecker()
{
  return type metadata accessor for XPCEntitlementChecker();
}

uint64_t AccountSelectionResult.xpcValue.getter()
{
  return AccountSelectionResult.xpcValue.getter();
}

uint64_t type metadata accessor for AccountSelectionResult()
{
  return type metadata accessor for AccountSelectionResult();
}

uint64_t type metadata accessor for AccountSelectionValues()
{
  return type metadata accessor for AccountSelectionValues();
}

uint64_t SelectAccountsUIInfoKeys.rawValue.getter()
{
  return SelectAccountsUIInfoKeys.rawValue.getter();
}

uint64_t type metadata accessor for SelectAccountsUIInfoKeys()
{
  return type metadata accessor for SelectAccountsUIInfoKeys();
}

uint64_t ClientToServiceXPCConnection.connection.getter()
{
  return ClientToServiceXPCConnection.connection.getter();
}

uint64_t CustomNSError.errorUserInfo.getter()
{
  return CustomNSError.errorUserInfo.getter();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for OrderImportPreview.ImportResult()
{
  return type metadata accessor for OrderImportPreview.ImportResult();
}

uint64_t OrderImportPreview.init(orderData:deviceInfo:sourceApplication:completion:)()
{
  return OrderImportPreview.init(orderData:deviceInfo:sourceApplication:completion:)();
}

uint64_t type metadata accessor for OrderImportPreview()
{
  return type metadata accessor for OrderImportPreview();
}

uint64_t SelectAccountsView.init(applicationRecord:completion:)()
{
  return SelectAccountsView.init(applicationRecord:completion:)();
}

uint64_t type metadata accessor for SelectAccountsView()
{
  return type metadata accessor for SelectAccountsView();
}

uint64_t type metadata accessor for SelectAccountsResult()
{
  return type metadata accessor for SelectAccountsResult();
}

uint64_t type metadata accessor for TransactionPickerView()
{
  return type metadata accessor for TransactionPickerView();
}

uint64_t DataRestrictedTransactionPickerView.init(cancelAction:)()
{
  return DataRestrictedTransactionPickerView.init(cancelAction:)();
}

uint64_t type metadata accessor for DataRestrictedTransactionPickerView()
{
  return type metadata accessor for DataRestrictedTransactionPickerView();
}

uint64_t static TransactionPickerExportedInterfaces.remoteProtocol()()
{
  return static TransactionPickerExportedInterfaces.remoteProtocol()();
}

uint64_t static TransactionPickerExportedInterfaces.serviceProtocol()()
{
  return static TransactionPickerExportedInterfaces.serviceProtocol()();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t View.installWalletAlert(isPresented:completion:)()
{
  return View.installWalletAlert(isPresented:completion:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t AppProtectionShieldView.init(forceShieldState:shieldType:dismissAction:showAuthOnAppear:content:)()
{
  return AppProtectionShieldView.init(forceShieldState:shieldType:dismissAction:showAuthOnAppear:content:)();
}

uint64_t type metadata accessor for AppProtectionShieldState()
{
  return type metadata accessor for AppProtectionShieldState();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t Array<A>.xpcValue.getter()
{
  return Array<A>.xpcValue.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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
  return [super a2];
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}